Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7037ADFF
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 20:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C476989A98;
	Tue, 11 May 2021 18:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343E989A98;
 Tue, 11 May 2021 18:08:54 +0000 (UTC)
IronPort-SDR: Moh3k1XRU70/PCoachYbrJ4QXsTim14RecQo7YERdPrK3MnlRClusuXPSAnquyPiX8yQ+LMWFC
 pFoV7y810mWw==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199562989"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="199562989"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 11:08:52 -0700
IronPort-SDR: ObZReXIjJCEVtF1jQJ6IM9I50lDsj1fPwCU7vkjyGa9bI9AOW89PomT5sgw6r3ULWUIE7Y3ZfT
 PA/kW2Id+ijg==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="537129213"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 11:08:52 -0700
Date: Tue, 11 May 2021 11:01:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [RFC PATCH 5/5] drm/i915: Update execbuf IOCTL to
 accept N BBs
Message-ID: <20210511180132.GA7354@sdutt-i7>
References: <20210506173049.72503-1-matthew.brost@intel.com>
 <20210506173049.72503-6-matthew.brost@intel.com>
 <YJqfMl8vgftwnoR1@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJqfMl8vgftwnoR1@phenom.ffwll.local>
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 carl.zhang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 05:13:54PM +0200, Daniel Vetter wrote:
> On Thu, May 06, 2021 at 10:30:49AM -0700, Matthew Brost wrote:
> > Add I915_EXEC_NUMBER_BB_* to drm_i915_gem_execbuffer2.flags which allows
> > submitting N BBs per IOCTL.
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Cc: Tony Ye <tony.ye@intel.com>
> > CC: Carl Zhang <carl.zhang@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I dropped my big question on the previous patch already, I'll check this
> out again when it's all squashed into the parallel extension patch so we
> have everything in one commit.

I think we just drop this and only allow N BBs per IOCTL as discussed in patch
#2 of this series.

Matt

> -Daniel
> 
> > ---
> >  include/uapi/drm/i915_drm.h | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 0175b12b33b8..d3072cad4a7e 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -1291,7 +1291,26 @@ struct drm_i915_gem_execbuffer2 {
> >   */
> >  #define I915_EXEC_USE_EXTENSIONS	(1 << 21)
> >  
> > -#define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS << 1))
> > +/*
> > + * Number of BB in execbuf2 IOCTL - 1, used to submit more than BB in a single
> > + * execbuf2 IOCTL.
> > + *
> > + * Return -EINVAL if more than 1 BB (value 0) is specified if
> > + * I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT hasn't been called on the gem
> > + * context first. Also returns -EINVAL if gem context has been setup with
> > + * I915_PARALLEL_NO_PREEMPT_MID_BATCH and the number BBs not equal to the total
> > + * number hardware contexts in the gem context.
> > + */
> > +#define I915_EXEC_NUMBER_BB_LSB		(22)
> > +#define I915_EXEC_NUMBER_BB_MASK	(0x3f << I915_EXEC_NUMBER_BB_LSB)
> > +#define I915_EXEC_NUMBER_BB_MSB		(27)
> > +#define i915_execbuffer2_set_number_bb(eb2, num_bb) \
> > +	(eb2).flags = ((eb2).flags & ~I915_EXEC_NUMBER_BB_MASK) | \
> > +	(((num_bb - 1) << I915_EXEC_NUMBER_BB_LSB) & I915_EXEC_NUMBER_BB_MASK)
> > +#define i915_execbuffer2_get_number_bb(eb2) \
> > +	((((eb2).flags & I915_EXEC_NUMBER_BB_MASK) >> I915_EXEC_NUMBER_BB_LSB) + 1)
> > +
> > +#define __I915_EXEC_UNKNOWN_FLAGS (-(1 << (I915_EXEC_NUMBER_BB_MSB + 1)))
> >  
> >  #define I915_EXEC_CONTEXT_ID_MASK	(0xffffffff)
> >  #define i915_execbuffer2_set_context_id(eb2, context) \
> > -- 
> > 2.28.0
> > 
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
