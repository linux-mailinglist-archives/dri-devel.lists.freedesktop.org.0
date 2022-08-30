Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E642E5A630C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 14:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874C910E083;
	Tue, 30 Aug 2022 12:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4941110E066;
 Tue, 30 Aug 2022 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661861800; x=1693397800;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=52PCyKTdgzHM1v5lqVHkUeO6LuVqdjgSjXh5Y8kU9K8=;
 b=kjnT96m6IjPeHI68sT8FgG5nbWs4mZdBxIGOv3bv1Gb8+vK1uUfybbYr
 FecMEztSFzlzfxlgPG5d4PqkxlviTD43Cl+Ai1ELemn9wihNrg5Ay7h+D
 PdA9pebr1bCioW1w8qozmB0XT68KMZlGOOeSFBUjezqU2GbhYkhOPPBsh
 1gVcDQNtyLHgLLeQ/3OZyZ6+bvSu8PlbYqkiI/fOh3H0usJF7QGS3sRi+
 p5VqLmkaX6fdSPrygz++TBKXkgpkrVE/n74qu4UiXDUbD+E6nUcMkLgeP
 yrq2Zs6jxrlRfOjItrraOtyV2ytAzAhEKEgvjXV97Osigd5engYUR1zhr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="296436273"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="296436273"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 05:16:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="672843519"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 05:16:37 -0700
Date: Tue, 30 Aug 2022 15:17:16 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH 4/4] drm/i915: Extract drm_dp_atomic_find_vcpi_slots
 cycle to separate function
Message-ID: <Yw3kNPkBaOVcgmPk@intel.com>
References: <20220829095832.21770-1-stanislav.lisovskiy@intel.com>
 <20220829095832.21770-5-stanislav.lisovskiy@intel.com>
 <1a73089ee68f49de8c30934f00ccddf7890651e3.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a73089ee68f49de8c30934f00ccddf7890651e3.camel@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Navare,
 Manasi D" <manasi.d.navare@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Saarinen,
 Jani" <jani.saarinen@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 29, 2022 at 05:43:19PM +0300, Govindapillai, Vinod wrote:
> Hi Stan,
> 
> I wonder if it is better if you reorder the 3 and 4 patches in this - move this 4/4 before the 3rd
> one and modify the 3rd one accordingly.

Was thiking about that, but decided to first introduce a new function, using same code, so that
we don't mix introduction of the new functionality with code optimization, also it then becomes
obvious why we need to remove that duplicate code.
But.. may be you are right - I could first extract that function and introduce new DSC functionality 
using it.

> 
> Also, instead of getting rid of limits, keep limits and populate the limits according to dsc or
> normal dp_mst. What do you think?

Yeah, was wondering if someone asks this, problem is that in non DSC case limits structure contains
exactly min, max bpps which we need, so can be passed on nicely, however in DSC case those are not the same:

max_bpp = min_t(u8, dsc_max_bpc * 3, limits->max_bpp);
min_bpp = limits->min_bpp;

So we would need to create some other limits struct, which we will populate with those(I guess 
we shouldn't replace the ones, which were calculated for non-DSC case in current limits), so I didn't
see much benefit in using it as an argument, if we can't pass it rightaway in both cases.

Stan

> 
> BR
> vinod
> 
> 
> On Mon, 2022-08-29 at 12:58 +0300, Stanislav Lisovskiy wrote:
> > We are using almost same code to loop through bpps while calling
> > drm_dp_atomic_find_vcpi_slots - lets remove this duplication by
> > introducing a new function intel_dp_mst_find_vcpi_slots_for_bpp
> > 
> > Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 88 +++++++++++----------
> >  1 file changed, 46 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 94d7e7f84c51..2a524816dbfd 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -44,10 +44,14 @@
> >  #include "intel_hotplug.h"
> >  #include "skl_scaler.h"
> >  
> > -static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
> > -                                           struct intel_crtc_state *crtc_state,
> > -                                           struct drm_connector_state *conn_state,
> > -                                           struct link_config_limits *limits)
> > +static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
> > +                                               struct intel_crtc_state *crtc_state,
> > +                                               int max_bpp,
> > +                                               int min_bpp,
> > +                                               struct link_config_limits *limits,
> > +                                               struct drm_connector_state *conn_state,
> > +                                               int step,
> > +                                               bool dsc)
> >  {
> >         struct drm_atomic_state *state = crtc_state->uapi.state;
> >         struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
> > @@ -58,7 +62,6 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
> >         struct drm_i915_private *i915 = to_i915(connector->base.dev);
> >         const struct drm_display_mode *adjusted_mode =
> >                 &crtc_state->hw.adjusted_mode;
> > -       bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
> >         int bpp, slots = -EINVAL;
> >         int ret = 0;
> >  
> > @@ -71,19 +74,21 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
> >  
> >         // TODO: Handle pbn_div changes by adding a new MST helper
> >         if (!mst_state->pbn_div) {
> > -               mst_state->pbn_div = drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
> > -                                                             limits->max_rate,
> > -                                                             limits->max_lane_count);
> > +               mst_state->pbn_div = !dsc ? drm_dp_get_vc_payload_bw(&intel_dp->mst_mgr,
> > +                                                                    crtc_state->port_clock,
> > +                                                                    crtc_state->lane_count) : 0;
> >         }
> >  
> > -       for (bpp = limits->max_bpp; bpp >= limits->min_bpp; bpp -= 2 * 3) {
> > +       for (bpp = max_bpp; bpp >= min_bpp; bpp -= step) {
> >                 crtc_state->pipe_bpp = bpp;
> >  
> >                 crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
> > -                                                      crtc_state->pipe_bpp,
> > -                                                      false);
> > +                                                      dsc ? bpp << 4 : crtc_state->pipe_bpp,
> > +                                                      dsc);
> > +
> >                 slots = drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
> > -                                                     connector->port, crtc_state->pbn);
> > +                                                     connector->port,
> > +                                                     crtc_state->pbn);
> >                 if (slots == -EDEADLK)
> >                         return slots;
> >                 if (slots >= 0) {
> > @@ -101,11 +106,32 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
> >         if (ret && slots >= 0)
> >                 slots = ret;
> >  
> > -       if (slots < 0) {
> > +       if (slots < 0)
> >                 drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
> >                             slots);
> > +
> > +       return slots;
> > +}
> > +
> > +
> > +static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
> > +                                           struct intel_crtc_state *crtc_state,
> > +                                           struct drm_connector_state *conn_state,
> > +                                           struct link_config_limits *limits)
> > +{
> > +       const struct drm_display_mode *adjusted_mode =
> > +               &crtc_state->hw.adjusted_mode;
> > +       struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
> > +       struct intel_dp *intel_dp = &intel_mst->primary->dp;
> > +       bool constant_n = drm_dp_has_quirk(&intel_dp->desc, DP_DPCD_QUIRK_CONSTANT_N);
> > +       int slots = -EINVAL;
> > +
> > +       slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, limits->max_bpp,
> > +                                                    limits->min_bpp, limits,
> > +                                                    conn_state, 2 * 3, false);
> > +
> > +       if (slots < 0)
> >                 return slots;
> > -       }
> >  
> >         intel_link_compute_m_n(crtc_state->pipe_bpp,
> >                                crtc_state->lane_count,
> > @@ -123,25 +149,21 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder
> > *encoder,
> >                                                 struct drm_connector_state *conn_state,
> >                                                 struct link_config_limits *limits)
> >  {
> > -       struct drm_atomic_state *state = crtc_state->uapi.state;
> > -       struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
> > -       struct intel_dp *intel_dp = &intel_mst->primary->dp;
> >         struct intel_connector *connector =
> >                 to_intel_connector(conn_state->connector);
> > +       struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
> > +       struct intel_dp *intel_dp = &intel_mst->primary->dp;
> >         struct drm_i915_private *i915 = to_i915(connector->base.dev);
> >         const struct drm_display_mode *adjusted_mode =
> >                 &crtc_state->hw.adjusted_mode;
> >         bool constant_n = drm_dp_has_quirk(&intel_dp->desc,
> >                                            DP_DPCD_QUIRK_CONSTANT_N);
> > -       int bpp, slots = -EINVAL;
> > +       int slots = -EINVAL;
> >         int i, num_bpc;
> >         u8 dsc_bpc[3] = {0};
> >         int min_bpp, max_bpp;
> >         u8 dsc_max_bpc;
> >  
> > -       crtc_state->lane_count = limits->max_lane_count;
> > -       crtc_state->port_clock = limits->max_rate;
> > -
> >         /* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> >         if (DISPLAY_VER(i915) >= 12)
> >                 dsc_max_bpc = min_t(u8, 12, conn_state->max_requested_bpc);
> > @@ -162,29 +184,11 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder
> > *encoder,
> >         drm_dbg_kms(&i915->drm, "DSC Sink supported min bpp %d max bpp %d\n",
> >                     min_bpp, max_bpp);
> >  
> > -       for (bpp = max_bpp; bpp >= min_bpp; bpp -= 2 * 3) {
> > -               crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
> > -                                                      bpp << 4,
> > -                                                      true);
> > +       slots = intel_dp_mst_find_vcpi_slots_for_bpp(encoder, crtc_state, max_bpp, min_bpp,
> > +                                                    limits, conn_state, 2 * 3, true);
> >  
> > -               slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
> > -                                                     connector->port,
> > -                                                     crtc_state->pbn, 0);
> > -
> > -               drm_dbg_kms(&i915->drm, "Trying bpp %d got %d pbn %d slots\n",
> > -                           bpp, crtc_state->pbn, slots);
> > -
> > -               if (slots == -EDEADLK)
> > -                       return slots;
> > -               if (slots >= 0)
> > -                       break;
> > -       }
> > -
> > -       if (slots < 0) {
> > -               drm_dbg_kms(&i915->drm, "failed finding vcpi slots:%d\n",
> > -                           slots);
> > +       if (slots < 0)
> >                 return slots;
> > -       }
> >  
> >         intel_link_compute_m_n(crtc_state->pipe_bpp,
> >                                crtc_state->lane_count,
> 
