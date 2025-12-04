Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07CCA3900
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 13:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7956810E93A;
	Thu,  4 Dec 2025 12:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsYGuLs/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977CA10E93A;
 Thu,  4 Dec 2025 12:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764850290; x=1796386290;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/pjm13JudzIrqsyIIRD8WyxtvNxNziw0aPBZfpnGvko=;
 b=SsYGuLs/6hih4zc+nIgfTIGdQuWJcTsAie6ocYjIcoP9oEqrKTfqGOid
 DnyFDRYnf/arITqgs8PjyurBEnmVYOAbzIV7YNjwhTHYkH0HNMMWB70RV
 jWyIn6EOmJzUsMdRf0/PXamfOr/RF6Mk6LtCfkBFD94T3muaVPukH+qXZ
 /tGSvre/aPfFa+b7mDKO+mhn7UkkL7KVeMkO4U8CG/Ny06Ib5FZJvOLCe
 ApQcf/INkQP1qGdalcDbPxNAsySfmqKk7aWgb7OUENGStKCs8GpKGpGra
 08iXukk90vSY604qN7gdFT0zDpIJ+j53iRHDAMx2UlzqNbqszyXUHYBII Q==;
X-CSE-ConnectionGUID: LuyMzTcXT7OAaD7AlBQ5og==
X-CSE-MsgGUID: WdQ8GRRTRL+7iXL1aEcd3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66904573"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="66904573"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:11:29 -0800
X-CSE-ConnectionGUID: RiQOp9yrQUOAIi9w0Fy0lA==
X-CSE-MsgGUID: E3ame0wpQHeZvwt3CoAvRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="194789577"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.11])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 04:11:24 -0800
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
Subject: Re: [PATCH v7 5/7] drm/edid: for consistency, use mask everywhere
 for block rev parsing
In-Reply-To: <20251202110218.9212-6-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251202110218.9212-1-iam@lach.pw>
 <20251202110218.9212-6-iam@lach.pw>
Date: Thu, 04 Dec 2025 14:11:20 +0200
Message-ID: <b637bd5137f9ece93f4aec679949e567879e81be@intel.com>
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

On Tue, 02 Dec 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
> Other usages of block.rev bitfields were refactored to use FIELD_GET
> instead of bitwise ops.
>
> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

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
> index b28ff4bafb1d..be8715632b91 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6908,7 +6908,8 @@ static int add_displayid_formula_modes(struct drm_connector *connector,
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
