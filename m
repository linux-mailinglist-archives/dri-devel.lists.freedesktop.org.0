Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8A38F338
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 20:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6116E90A;
	Mon, 24 May 2021 18:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE82B6E908;
 Mon, 24 May 2021 18:47:55 +0000 (UTC)
IronPort-SDR: KRn5IaRyrguHPnsR4xe2ek01LCVTdrds4nRP35LsODX8eicWWFaW/bq6dI7+rIxrv9ABUS73xp
 xx/OMGB/VYkw==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="223164889"
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="223164889"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:47:54 -0700
IronPort-SDR: zhjFNWQKh3hD3Mk8vjBGZ8IMWi7lnOCq3mGmWkXQMkHpZ/EKBi1J6IZT2HYD01svt+NY+ORw3p
 a+dTB1xORx+Q==
X-IronPort-AV: E=Sophos;i="5.82,325,1613462400"; d="scan'208";a="396500396"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 11:47:54 -0700
Date: Mon, 24 May 2021 11:40:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 39/97] drm/i915/guc: Increase size of CTB
 buffers
Message-ID: <20210524184045.GA13139@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-40-matthew.brost@intel.com>
 <596cb7fb-588a-f5f1-6119-1393b8faf8a6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <596cb7fb-588a-f5f1-6119-1393b8faf8a6@intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 03:43:11PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 06.05.2021 21:13, Matthew Brost wrote:
> > With the introduction of non-blocking CTBs more than one CTB can be in
> > flight at a time. Increasing the size of the CTBs should reduce how
> > often software hits the case where no space is available in the CTB
> > buffer.
> > 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index 77dfbc94dcc3..d6895d29ed2d 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -63,11 +63,16 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
> >   *      +--------+-----------------------------------------------+------+
> >   *
> >   * Size of each `CT Buffer`_ must be multiple of 4K.
> > - * As we don't expect too many messages, for now use minimum sizes.
> > + * We don't expect too many messages in flight at any time, unless we are
> > + * using the GuC submission. In that case each request requires a minimum
> > + * 16 bytes which gives us a maximum 256 queue'd requests. Hopefully this
> 
> nit: all our CTB calculations are in dwords now, not bytes
> 

I can change the wording to DW sizes.

> > + * enough space to avoid backpressure on the driver. We increase the size
> > + * of the receive buffer (relative to the send) to ensure a G2H response
> > + * CTB has a landing spot.
> 
> hmm, but we are not checking G2H CTB yet
> will start doing it around patch 54/97
> so maybe this other patch should be introduced earlier ?
>

Yes, that patch is going to be pulled down to an earlier spot in the
series.
 
> >   */
> >  #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> >  #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > -#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
> > +#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
> 
> in theory, we (host) should be faster than GuC, so G2H CTB shall be
> almost always empty, if this is not a case, maybe we should start
> monitoring what is happening and report some warnings if G2H is half full ?
>

Certainly some IGTs put some more pressure on the G2H channel than the
H2G channel at least I think. This is something we can tune over time
after this lands upstream. IMO a message at this point is overkill.

Matt
 
> >  
> >  #define MAX_US_STALL_CTB	1000000
> >  
> > @@ -753,7 +758,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
> >  	/* beware of buffer wrap case */
> >  	if (unlikely(available < 0))
> >  		available += size;
> > -	CT_DEBUG(ct, "available %d (%u:%u)\n", available, head, tail);
> > +	CT_DEBUG(ct, "available %d (%u:%u:%u)\n", available, head, tail, size);
> >  	GEM_BUG_ON(available < 0);
> >  
> >  	header = cmds[head];
> > 
