Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D542AF21
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 23:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3408996F;
	Tue, 12 Oct 2021 21:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F19F6E9E3;
 Tue, 12 Oct 2021 21:43:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="250684844"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="250684844"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 14:43:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="486614081"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 14:43:21 -0700
Date: Tue, 12 Oct 2021 14:43:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH] drm/i915: Stop using I915_TILING_* in client blit selftest
Message-ID: <20211012214320.GZ602200@mdroper-desk1.amr.corp.intel.com>
References: <20211001005816.73330-1-matthew.d.roper@intel.com>
 <YWAURQ0kpRWsdeyM@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWAURQ0kpRWsdeyM@intel.com>
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

On Fri, Oct 08, 2021 at 12:49:57PM +0300, Ville Syrjälä wrote:
> On Thu, Sep 30, 2021 at 05:58:16PM -0700, Matt Roper wrote:
> > The I915_TILING_* definitions in the uapi header are intended solely for
> > tiling modes that are visible to the old de-tiling fence ioctls.  Since
> > modern hardware does not support de-tiling fences, we should not add new
> > definitions for new tiling types going forward.  However we do want the
> > client blit selftest to eventually cover other new tiling modes (such as
> > Tile4), so switch it to using its own enum of tiling modes.
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  .../i915/gem/selftests/i915_gem_client_blt.c  | 29 ++++++++++++-------
> >  include/uapi/drm/i915_drm.h                   |  6 ++++
> >  2 files changed, 24 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> > index ecbcbb86ae1e..8402ed925a69 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
> > @@ -17,13 +17,20 @@
> >  #include "huge_gem_object.h"
> >  #include "mock_context.h"
> >  
> > +enum client_tiling {
> > +	CLIENT_TILING_LINEAR,
> > +	CLIENT_TILING_X,
> > +	CLIENT_TILING_Y,
> > +	CLIENT_NUM_TILING_TYPES
> > +};
> > +
> >  #define WIDTH 512
> >  #define HEIGHT 32
> >  
> >  struct blit_buffer {
> >  	struct i915_vma *vma;
> >  	u32 start_val;
> > -	u32 tiling;
> > +	enum client_tiling tiling;
> >  };
> >  
> >  struct tiled_blits {
> > @@ -53,9 +60,9 @@ static int prepare_blit(const struct tiled_blits *t,
> >  	*cs++ = MI_LOAD_REGISTER_IMM(1);
> >  	*cs++ = i915_mmio_reg_offset(BCS_SWCTRL);
> >  	cmd = (BCS_SRC_Y | BCS_DST_Y) << 16;
> > -	if (src->tiling == I915_TILING_Y)
> > +	if (src->tiling == CLIENT_TILING_Y)
> >  		cmd |= BCS_SRC_Y;
> > -	if (dst->tiling == I915_TILING_Y)
> > +	if (dst->tiling == CLIENT_TILING_Y)
> >  		cmd |= BCS_DST_Y;
> >  	*cs++ = cmd;
> >  
> > @@ -172,7 +179,7 @@ static int tiled_blits_create_buffers(struct tiled_blits *t,
> >  
> >  		t->buffers[i].vma = vma;
> >  		t->buffers[i].tiling =
> > -			i915_prandom_u32_max_state(I915_TILING_Y + 1, prng);
> > +			i915_prandom_u32_max_state(CLIENT_TILING_Y + 1, prng);
> >  	}
> >  
> >  	return 0;
> > @@ -197,17 +204,17 @@ static u64 swizzle_bit(unsigned int bit, u64 offset)
> >  static u64 tiled_offset(const struct intel_gt *gt,
> >  			u64 v,
> >  			unsigned int stride,
> > -			unsigned int tiling)
> > +			enum client_tiling tiling)
> >  {
> >  	unsigned int swizzle;
> >  	u64 x, y;
> >  
> > -	if (tiling == I915_TILING_NONE)
> > +	if (tiling == CLIENT_TILING_LINEAR)
> >  		return v;
> >  
> >  	y = div64_u64_rem(v, stride, &x);
> >  
> > -	if (tiling == I915_TILING_X) {
> > +	if (tiling == CLIENT_TILING_X) {
> >  		v = div64_u64_rem(y, 8, &y) * stride * 8;
> >  		v += y * 512;
> >  		v += div64_u64_rem(x, 512, &x) << 12;
> > @@ -244,12 +251,12 @@ static u64 tiled_offset(const struct intel_gt *gt,
> >  	return v;
> >  }
> >  
> > -static const char *repr_tiling(int tiling)
> > +static const char *repr_tiling(enum client_tiling tiling)
> >  {
> >  	switch (tiling) {
> > -	case I915_TILING_NONE: return "linear";
> > -	case I915_TILING_X: return "X";
> > -	case I915_TILING_Y: return "Y";
> > +	case CLIENT_TILING_LINEAR: return "linear";
> > +	case CLIENT_TILING_X: return "X";
> > +	case CLIENT_TILING_Y: return "Y";
> >  	default: return "unknown";
> >  	}
> >  }
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index bde5860b3686..00311a63068e 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -1522,6 +1522,12 @@ struct drm_i915_gem_caching {
> >  #define I915_TILING_NONE	0
> >  #define I915_TILING_X		1
> >  #define I915_TILING_Y		2
> > +/*
> > + * Do not add new tiling types here.  The I915_TILING_* values are for
> > + * de-tiling fence registers that no longer exist on modern platforms.  Although
> > + * the hardware may support new types of tiling in general (e.g., Tile4), we
> > + * do not need to add them to the uapi that is specific to now-defunct ioctls.
> > + */
> >  #define I915_TILING_LAST	I915_TILING_Y
> 
> I think we should split this one into a separate patch to give it
> some visibility. The people who care about gem uapi seem to be in
> some kind of early winter hibernation and no one read this.
> 
> Apart from that
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Thanks.  I dropped the comment here and pushed the rest of the patch.
I'll re-send the uapi header comment separately to increase visibility.


Matt

> 
> >  
> >  #define I915_BIT_6_SWIZZLE_NONE		0
> > -- 
> > 2.33.0
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
