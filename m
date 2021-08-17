Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A213EF06D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 18:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7128A6E1F3;
	Tue, 17 Aug 2021 16:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2D16E1F3;
 Tue, 17 Aug 2021 16:49:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="213023384"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="213023384"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 09:49:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="510541221"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 09:49:32 -0700
Date: Tue, 17 Aug 2021 09:44:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 08/22] drm/i915/guc: Don't enable scheduling on a banned
 context, guc_id invalid, not registered
Message-ID: <20210817164417.GA30732@jons-linux-dev-box>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-9-matthew.brost@intel.com>
 <YRuFySMEGtbQegKa@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRuFySMEGtbQegKa@phenom.ffwll.local>
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

On Tue, Aug 17, 2021 at 11:47:53AM +0200, Daniel Vetter wrote:
> On Mon, Aug 16, 2021 at 06:51:25AM -0700, Matthew Brost wrote:
> > When unblocking a context, do not enable scheduling if the context is
> > banned, guc_id invalid, or not registered.
> > 
> > Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index c3b7bf7319dd..353899634fa8 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -1579,6 +1579,9 @@ static void guc_context_unblock(struct intel_context *ce)
> >  	spin_lock_irqsave(&ce->guc_state.lock, flags);
> >  
> >  	if (unlikely(submission_disabled(guc) ||
> > +		     intel_context_is_banned(ce) ||
> > +		     context_guc_id_invalid(ce) ||
> > +		     !lrc_desc_registered(guc, ce->guc_id) ||
> >  		     !intel_context_is_pinned(ce) ||
> >  		     context_pending_disable(ce) ||
> >  		     context_blocked(ce) > 1)) {
> 
> I think this entire if condition here is screaming that our intel_context
> state machinery for guc is way too complex, and on the wrong side of
> incomprehensible.
> 
> Also some of these check state outside of the context, and we don't seem
> to hold spinlocks for those, or anything else.
> 
> I general I have no idea which of these are defensive programming and
> cannot ever happen, and which actually can happen. There's for sure way
> too many races going on given that this is all context-local stuff.

A lot of this is guarding against a full GT reset while trying to
cancel a request. Full GT resets make everything really hard and in
pratice should never really happen because the GuC does per engine /
context resets. Unfortunately IGTs do weird things like turn off per
engine / contexts resets and full GT reset the only way to recover so
the IGTs can will expose all the races around GT reset, especially when
we run IGTs a pre-prod HW that tends to hang for whatever reason.

Matt 

> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
