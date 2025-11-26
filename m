Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF5C8A47C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0CD10E647;
	Wed, 26 Nov 2025 14:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/+mFL/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AA010E647;
 Wed, 26 Nov 2025 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764166823; x=1795702823;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mns8O3xGITsQhw/lEIW0n0Bq/GecSRsphvLYWfUi72I=;
 b=E/+mFL/gA1zv6/T0L8Nsq0HSjkeR2xgB7CbDtHXmdPPX18g6vIZS2VmD
 Ijrj7B54oZMkIl2g9lH2e/jwg8HEmbQgfouxi1Wxq8MC0D3sBmEebVWd0
 1kkUQ+xXbJKgfiiQZcZte/BaEPXpcO0NKFd5g4TLfGUOJ4oeHj5nDWzoD
 HWcwFNn+aS6Zfhn61pcBOJFggUFpni9ZFlVnpbrhgEesC6Q1bDj3b149b
 LnrXWqbT2A+3WUlZQ6LfanpmmDyuyj7hErfnJfn1/hSG05I+wDKg8qFzJ
 5oe6ianLJfsJpQfjI1tvM3/Mp0tyH4EoOPuy3erGn7gezufChe31MpMYK Q==;
X-CSE-ConnectionGUID: udI/g9kMS6K6Th2GpsnYRg==
X-CSE-MsgGUID: 4/4meSgPT+CyVJLgG5+B0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66367226"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66367226"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:20:23 -0800
X-CSE-ConnectionGUID: moZAwUExTIyXcVvVxcwLNQ==
X-CSE-MsgGUID: koXGbNzLRI+ZwD7wT/lxIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192838956"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.1])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:20:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yaroslav Bolyukin <iam@lach.pw>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yaroslav
 Bolyukin <iam@lach.pw>
Subject: Re: [PATCH v6 5/7] drm/edid: for consistency, use mask everywhere
 for block rev parsing
In-Reply-To: <20251126065126.54016-6-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251126065126.54016-1-iam@lach.pw>
 <20251126065126.54016-6-iam@lach.pw>
Date: Wed, 26 Nov 2025 16:20:14 +0200
Message-ID: <0c963fb035a157c4094ba7410d4787697cd95699@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Nov 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:

Commit message goes here.

> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
> ---
>  drivers/gpu/drm/drm_displayid_internal.h | 1 +
>  drivers/gpu/drm/drm_edid.c               | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
> index 724174b429f2..55f972d32847 100644
> --- a/drivers/gpu/drm/drm_displayid_internal.h
> +++ b/drivers/gpu/drm/drm_displayid_internal.h
> @@ -139,6 +139,7 @@ struct displayid_formula_timings_9 {
>  	u8 vrefresh;
>  } __packed;
>  
> +#define DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES	GENMASK(6, 4)
>  struct displayid_formula_timing_block {
>  	struct displayid_block base;
>  	struct displayid_formula_timings_9 timings[];
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 72a94b1713e2..7bdc99d5084a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6906,7 +6906,8 @@ static int add_displayid_formula_modes(struct drm_connector *connector,
>  	struct drm_display_mode *newmode;
>  	int num_modes = 0;
>  	bool type_10 = block->tag == DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
> -	int timing_size = 6 + ((formula_block->base.rev & 0x70) >> 4);
> +	int timing_size = 6 +
> +		FIELD_GET(DISPLAYID_BLOCK_DESCRIPTOR_PAYLOAD_BYTES, formula_block->base.rev);
>  
>  	/* extended blocks are not supported yet */
>  	if (timing_size != 6)

-- 
Jani Nikula, Intel
