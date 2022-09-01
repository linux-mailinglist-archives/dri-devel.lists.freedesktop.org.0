Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15095A90FE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 09:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B2910E5A9;
	Thu,  1 Sep 2022 07:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A93910E5A9;
 Thu,  1 Sep 2022 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662018365; x=1693554365;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=C+lltEoUrf153n15/T+o1brL1wAynvZgE+yCWuzvFCA=;
 b=CKipNuxGAgRxLBUy2aQBmA+BGWTI6/erlzQdytlhoxmctABo0iCU99PM
 oveX1Kdu18ey3jkIbmDRDFgqzHFNtV0fxI8IgWyFHPy8XmJUmnTz96N+0
 yf8V05iY2xIAVdxm/6b4Q7gqVxg0Hjet4m9LvaOjx6IdsRPQBpTxGqY9i
 SsQLVjLCxSruqLsS1IshTG9zAyqamcqBtCRmcWPJ0HqaJnY0oKKrEH4HP
 m55L/jTDJmCV80lK7hBBh5k/iChIYyv0qopi3gbDttfvWXcEKFfjNf81E
 7M76xnqSoj8HXCjoP1yuXFG02MaIwo5VJEEveKvqbFYAC8nMaWwAciFvm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275393640"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="275393640"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 00:46:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="673732197"
Received: from fmerten-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.44.118])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 00:46:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 01/11] drm/i915: Move display and media IP version to
 runtime info
In-Reply-To: <20220831214958.109753-2-radhakrishna.sripada@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
 <20220831214958.109753-2-radhakrishna.sripada@intel.com>
Date: Thu, 01 Sep 2022 10:45:54 +0300
Message-ID: <878rn3czbh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Aug 2022, Radhakrishna Sripada <radhakrishna.sripada@intel.com> wrote:
> Future platforms can read the IP version from a register and the
> IP version numbers need not be hard coded in device info. Move the
> ip version for media and display to runtime info.
>
> On platforms where hard coding of IP version is required, update
> the IP version in __runtime under device_info.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h          |  8 ++++----
>  drivers/gpu/drm/i915/i915_pci.c          | 20 ++++++++++----------
>  drivers/gpu/drm/i915/intel_device_info.c | 12 ++++++------
>  drivers/gpu/drm/i915/intel_device_info.h | 15 ++++++++++-----
>  4 files changed, 30 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index c9cca165bf5d..bf60593a4ce5 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -475,13 +475,13 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
>  #define IS_GRAPHICS_VER(i915, from, until) \
>  	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
>  
> -#define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
> -#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
> -					       INTEL_INFO(i915)->media.rel)
> +#define MEDIA_VER(i915)			(RUNTIME_INFO(i915)->media.ver)
> +#define MEDIA_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->media.ver, \
> +					       RUNTIME_INFO(i915)->media.rel)
>  #define IS_MEDIA_VER(i915, from, until) \
>  	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
>  
> -#define DISPLAY_VER(i915)	(INTEL_INFO(i915)->display.ver)
> +#define DISPLAY_VER(i915)	(RUNTIME_INFO(i915)->display.ver)
>  #define IS_DISPLAY_VER(i915, from, until) \
>  	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
>  
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 26b25d9434d6..72577e327c71 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -35,8 +35,8 @@
>  #define PLATFORM(x) .platform = (x)
>  #define GEN(x) \
>  	.__runtime.graphics.ver = (x), \
> -	.media.ver = (x), \
> -	.display.ver = (x)
> +	.__runtime.media.ver = (x), \
> +	.__runtime.display.ver = (x)
>  
>  #define I845_PIPE_OFFSETS \
>  	.display.pipe_offsets = { \
> @@ -740,7 +740,7 @@ static const struct intel_device_info bxt_info = {
>  static const struct intel_device_info glk_info = {
>  	GEN9_LP_FEATURES,
>  	PLATFORM(INTEL_GEMINILAKE),
> -	.display.ver = 10,
> +	.__runtime.display.ver = 10,
>  	.display.dbuf.size = 1024 - 4, /* 4 blocks for bypass path allocation */
>  	GLK_COLORS,
>  };
> @@ -962,7 +962,7 @@ static const struct intel_device_info adl_s_info = {
>  	.display.has_hotplug = 1,						\
>  	.display.has_ipc = 1,							\
>  	.display.has_psr = 1,							\
> -	.display.ver = 13,							\
> +	.__runtime.display.ver = 13,							\
>  	.__runtime.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT(PIPE_D),	\
>  	.display.pipe_offsets = {						\
>  		[TRANSCODER_A] = PIPE_A_OFFSET,					\
> @@ -1027,8 +1027,8 @@ static const struct intel_device_info adl_p_info = {
>  	.__runtime.ppgtt_type = INTEL_PPGTT_FULL
>  
>  #define XE_HPM_FEATURES \
> -	.media.ver = 12, \
> -	.media.rel = 50
> +	.__runtime.media.ver = 12, \
> +	.__runtime.media.rel = 50
>  
>  __maybe_unused
>  static const struct intel_device_info xehpsdv_info = {
> @@ -1054,7 +1054,7 @@ static const struct intel_device_info xehpsdv_info = {
>  	XE_HPM_FEATURES, \
>  	DGFX_FEATURES, \
>  	.__runtime.graphics.rel = 55, \
> -	.media.rel = 55, \
> +	.__runtime.media.rel = 55, \
>  	PLATFORM(INTEL_DG2), \
>  	.has_4tile = 1, \
>  	.has_64k_pages = 1, \
> @@ -1098,7 +1098,7 @@ static const struct intel_device_info pvc_info = {
>  	XE_HPM_FEATURES,
>  	DGFX_FEATURES,
>  	.__runtime.graphics.rel = 60,
> -	.media.rel = 60,
> +	.__runtime.media.rel = 60,
>  	PLATFORM(INTEL_PONTEVECCHIO),
>  	.display = { 0 },
>  	.has_flat_ccs = 0,
> @@ -1111,7 +1111,7 @@ static const struct intel_device_info pvc_info = {
>  
>  #define XE_LPDP_FEATURES	\
>  	XE_LPD_FEATURES,	\
> -	.display.ver = 14,	\
> +	.__runtime.display.ver = 14,	\
>  	.display.has_cdclk_crawl = 1, \
>  	.__runtime.fbc_mask = BIT(INTEL_FBC_A) | BIT(INTEL_FBC_B)
>  
> @@ -1125,7 +1125,7 @@ static const struct intel_device_info mtl_info = {
>  	 */
>  	.__runtime.graphics.ver = 12,
>  	.__runtime.graphics.rel = 70,
> -	.media.ver = 13,
> +	.__runtime.media.ver = 13,
>  	PLATFORM(INTEL_METEORLAKE),
>  	.display.has_modular_fia = 1,
>  	.has_flat_ccs = 0,
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index 0a1f97b35f2b..8ff66b4e11c1 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -98,15 +98,15 @@ void intel_device_info_print(const struct intel_device_info *info,
>  	else
>  		drm_printf(p, "graphics version: %u\n", runtime->graphics.ver);
>  
> -	if (info->media.rel)
> -		drm_printf(p, "media version: %u.%02u\n", info->media.ver, info->media.rel);
> +	if (runtime->media.rel)
> +		drm_printf(p, "media version: %u.%02u\n", runtime->media.ver, runtime->media.rel);
>  	else
> -		drm_printf(p, "media version: %u\n", info->media.ver);
> +		drm_printf(p, "media version: %u\n", runtime->media.ver);
>  
> -	if (info->display.rel)
> -		drm_printf(p, "display version: %u.%02u\n", info->display.ver, info->display.rel);
> +	if (runtime->display.rel)
> +		drm_printf(p, "display version: %u.%02u\n", runtime->display.ver, runtime->display.rel);
>  	else
> -		drm_printf(p, "display version: %u\n", info->display.ver);
> +		drm_printf(p, "display version: %u\n", runtime->display.ver);
>  
>  	drm_printf(p, "gt: %d\n", info->gt);
>  	drm_printf(p, "memory-regions: %x\n", runtime->memory_regions);
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 6904ad03ca19..6511b25277dc 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -200,7 +200,17 @@ struct ip_version {
>  };
>  
>  struct intel_runtime_info {
> +	/*
> +	 * On modern platforms, the architecture major.minor version numbers
> +	 * and stepping are read directly from the hardware rather than derived
> +	 * from the PCI device and revision ID's.
> +	 *
> +	 * Note that the hardware gives us a single "graphics" number that
> +	 * should represent render, compute, and copy behavior.
> +	 */

The comment really belongs in the next patch.

>  	struct ip_version graphics;
> +	struct ip_version media;
> +	struct ip_version display;

The runtime display info is now in an unnamed struct under struct
intel_runtime_info below, and this belongs there.

There's also some pressure to name it, and "display" would be the name,
so this would collide.

Seems like all of the above are overly generic names, including the
pre-existing "graphics". Something to consider.

Otherwise, LGTM.

BR,
Jani.



>  
>  	/*
>  	 * Platform mask is used for optimizing or-ed IS_PLATFORM calls into
> @@ -246,8 +256,6 @@ struct intel_runtime_info {
>  };
>  
>  struct intel_device_info {
> -	struct ip_version media;
> -
>  	enum intel_platform platform;
>  
>  	unsigned int dma_mask_size; /* available DMA address bits */
> @@ -259,9 +267,6 @@ struct intel_device_info {
>  #undef DEFINE_FLAG
>  
>  	struct {
> -		u8 ver;
> -		u8 rel;
> -
>  		u8 abox_mask;
>  
>  		struct {

-- 
Jani Nikula, Intel Open Source Graphics Center
