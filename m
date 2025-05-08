Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F748AAF8E6
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 13:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA7210E8CF;
	Thu,  8 May 2025 11:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoRdmsw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABCC10E38C;
 Thu,  8 May 2025 11:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746704499; x=1778240499;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HpZl3De/WJ7qCnhM+MYOLLICWp81+XLGEfKwZdx81uI=;
 b=LoRdmsw+7SBAiMlVnc53rxdmXLWXRfNqD2sxXbo+3gN3Jbu5hkZPl4bS
 WzZHJAMkrymoG5y4S1x98IHQyx+7qmrLOQTbTAxWBBE5z1P/lPAb3OoC7
 l4gvTRRS9MfcYD8tY8lQ+xtoq8dc59Tl4Ipo6PArctGTBIfi+4C6RjTWZ
 gOo5BXrGqttJSSILf1jfXKp4/kZhvscA16qsG8YGyxZ7DRmhsFIpNPV3V
 fovCNPWuipr/mrhhKLHo78JuNfYu/E2E1zRdy/yKRp3Kuen8J1MNhxtW1
 336jFKXOWF6sDwk22dSDYjFDta48KpFXTaRre/3IG5PEdTYp6q2LK6lRt g==;
X-CSE-ConnectionGUID: azYQoU81REq+y8Od+M+Rzw==
X-CSE-MsgGUID: H8ZvQ20ES8uVscqc0goNrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51141805"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="51141805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:41:35 -0700
X-CSE-ConnectionGUID: eFE6Vxf5RuqxWvMiVB/wHA==
X-CSE-MsgGUID: /48hXi71S9u0HDV3l0z4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="167205856"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:41:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Michel Daenzer <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2 11/14] drm/amd/display: create a function to fill
 dc_sink with edid data
In-Reply-To: <20250507001712.120215-12-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250507001712.120215-1-mwen@igalia.com>
 <20250507001712.120215-12-mwen@igalia.com>
Date: Thu, 08 May 2025 14:41:27 +0300
Message-ID: <87plgjtjmg.fsf@intel.com>
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

On Tue, 06 May 2025, Melissa Wen <mwen@igalia.com> wrote:
> From: Rodrigo Siqueira <siqueira@igalia.com>
>
> As part of the effort of stopping using raw edid, this commit move the
> copy of the edid in DC to a dedicated function that will allow the usage
> of drm_edid in the next steps.
>
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> Co-developer--by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c      | 8 ++++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h      | 2 ++
>  drivers/gpu/drm/amd/display/dc/link/link_detection.c | 3 +--
>  3 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> index fab873b091f5..39fcaa16a14a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -17,3 +17,11 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>         return (memcmp(old_edid->raw_edid,
>                        new_edid->raw_edid, new_edid->length) == 0);
>  }
> +
> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
> +			     const void *edid,
> +			     int len)
> +{
> +	memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);

Superfluous cast.

> +	dc_sink->dc_edid.length = len;
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> index 7e3b1177bc8a..f42cd5bbc730 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -7,5 +7,7 @@
>  
>  bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>  			  struct dc_sink *current_sink);
> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
> +			     const void *edid, int len);
>  
>  #endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index e748721f31e4..978d2b4a4d29 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -1410,8 +1410,7 @@ struct dc_sink *link_add_remote_sink(
>  	if (!dc_sink)
>  		return NULL;
>  
> -	memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);
> -	dc_sink->dc_edid.length = len;
> +	dc_edid_copy_edid_to_dc(dc_sink, edid, len);
>  
>  	if (!link_add_remote_sink_helper(
>  			link,

-- 
Jani Nikula, Intel
