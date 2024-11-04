Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4F29BB3B5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 12:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04CA10E030;
	Mon,  4 Nov 2024 11:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lechuck.jsg.id.au (jsg.id.au [193.114.144.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B0910E030;
 Mon,  4 Nov 2024 11:45:01 +0000 (UTC)
Received: from largo.jsg.id.au (largo.jsg.id.au [192.168.1.44])
 by lechuck.jsg.id.au (OpenSMTPD) with ESMTPS id 5347ec6d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 4 Nov 2024 22:44:58 +1100 (AEDT)
Received: from localhost (largo.jsg.id.au [local])
 by largo.jsg.id.au (OpenSMTPD) with ESMTPA id f89660fd;
 Mon, 4 Nov 2024 22:44:58 +1100 (AEDT)
Date: Mon, 4 Nov 2024 22:44:58 +1100
From: Jonathan Gray <jsg@jsg.id.au>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: alan.previn.teres.alexis@intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/pxp: fix non-optimised !CONFIG_DRM_I915_PXP build
Message-ID: <ZyizusZMV_HhFJtH@largo.jsg.id.au>
References: <20241103110230.11035-1-jsg@jsg.id.au> <87r07ri9rn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r07ri9rn.fsf@intel.com>
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

On Mon, Nov 04, 2024 at 12:16:44PM +0200, Jani Nikula wrote:
> On Sun, 03 Nov 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
> > intel_pxp_gsccs_is_ready_for_sessions() is gated by CONFIG_DRM_I915_PXP
> > but called from intel_pxp.c which isn't.  Provide a fallback inline
> > function to fix the non-optimised build.
> 
> What does this have to do with optimization? Isn't the build just plain
> broken for PXP=n?

With clang/lld 16 on OpenBSD with PXP=n, intel_pxp.o with -O0 has an
undefined reference to intel_pxp_gsccs_is_ready_for_sessions,
with -O1 and -O2 it doesn't and the kernel links.

> 
> BR,
> Jani.
> 
> 
> >
> > Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
> > Signed-off-by: Jonathan Gray <jsg@jsg.id.au>
> > ---
> >  drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> > index 9aae779c4da3..b93488e99685 100644
> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
> > @@ -16,26 +16,30 @@ struct intel_pxp;
> >  #define GSC_PENDING_RETRY_PAUSE_MS 50
> >  #define GSCFW_MAX_ROUND_TRIP_LATENCY_MS (GSC_HECI_REPLY_LATENCY_MS + \
> >  					 (GSC_PENDING_RETRY_MAXCOUNT * GSC_PENDING_RETRY_PAUSE_MS))
> >  
> >  #ifdef CONFIG_DRM_I915_PXP
> >  void intel_pxp_gsccs_fini(struct intel_pxp *pxp);
> >  int intel_pxp_gsccs_init(struct intel_pxp *pxp);
> > +bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> >  
> >  int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
> >  void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
> >  
> >  #else
> >  static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
> >  {
> >  }
> >  
> >  static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
> >  {
> >  	return 0;
> >  }
> >  
> > -#endif
> > +static inline bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
> > +{
> > +	return false;
> > +}
> >  
> > -bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
> > +#endif
> >  
> >  #endif /*__INTEL_PXP_GSCCS_H__ */
> 
> -- 
> Jani Nikula, Intel
> 
