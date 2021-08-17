Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937943EF1C1
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 20:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690AB6E219;
	Tue, 17 Aug 2021 18:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8478D6E219;
 Tue, 17 Aug 2021 18:22:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="238254605"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="238254605"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 11:22:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="531182788"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 11:22:35 -0700
Date: Tue, 17 Aug 2021 11:17:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 02/22] drm/i915/guc: Fix outstanding G2H accounting
Message-ID: <20210817181722.GA26026@jons-linux-dev-box>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-3-matthew.brost@intel.com>
 <YRuD0bTDQTivDZux@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRuD0bTDQTivDZux@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 17, 2021 at 11:39:29AM +0200, Daniel Vetter wrote:
> On Mon, Aug 16, 2021 at 06:51:19AM -0700, Matthew Brost wrote:
> > A small race that could result in incorrect accounting of the number
> > of outstanding G2H. Basically prior to this patch we did not increment
> > the number of outstanding G2H if we encoutered a GT reset while sending
> > a H2G. This was incorrect as the context state had already been updated
> > to anticipate a G2H response thus the counter should be incremented.
> > 
> > Fixes: f4eb1f3fe946 ("drm/i915/guc: Ensure G2H response has space in buffer")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 69faa39da178..b5d3972ae164 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -360,11 +360,13 @@ static int guc_submission_send_busy_loop(struct intel_guc *guc,
> >  {
> >  	int err;
> >  
> > -	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> > -
> > -	if (!err && g2h_len_dw)
> > +	if (g2h_len_dw)
> >  		atomic_inc(&guc->outstanding_submission_g2h);
> >  
> > +	err = intel_guc_send_busy_loop(guc, action, len, g2h_len_dw, loop);
> 
> I'm majorly confused by the _busy_loop naming scheme, especially here.
> Like "why do we want to send a busy loop comand to guc, this doesn't make
> sense".
> 
> It seems like you're using _busy_loop as a suffix for "this is ok to be
> called in atomic context". The linux kernel bikeshed for this is generally
> _atomic() (or _in_atomic() or something like that).  Would be good to
> rename to make this slightly less confusing.

I'd like to save the bikeshedding for follow ups if we can as we should
get the functional fixes in to stablize the stack + clean up the locking
to a somewhat sane state ASAP. Everyone has their favorite color of
paint...

> -Daniel
> 
> > +	if (err == -EBUSY && g2h_len_dw)
> > +		atomic_dec(&guc->outstanding_submission_g2h);
> > +

Also here is an example of why this really should be owned by the
submission code, it wants to increment this here even if the send failed
due to -ENODEV (GT reset in flight) as this is an internal counter of
how many G2H will need to be scrubbed.

Matt

> >  	return err;
> >  }
> >  
> > -- 
> > 2.32.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
