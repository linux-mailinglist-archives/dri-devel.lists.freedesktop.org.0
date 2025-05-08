Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E78CAAF920
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 13:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF79D10E8E5;
	Thu,  8 May 2025 11:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9mjFIYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C3F10E8E3;
 Thu,  8 May 2025 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746705037; x=1778241037;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=h3NV0hUJ5jjv81PvAs8x/weopAjnKIQbpeseOIH0/EI=;
 b=W9mjFIYkrzZVLo1QAvyBtbUvo+IBoEDEdY84tRpe4FdoNvE1V+KejRfJ
 RGW8kOVteVYP6MvJiAfYA3ie7hV7LEvMRR9fNZeheHIjdbA/HP3pp/Wh2
 2YqCeap6dE7Oc2Bov/MYPuJP2QHwzer46h9IWbyLz7triJ+vjZobPczEl
 QfWAmLa+U5CHkQXdoGr6xCzvKZejUgWOMCofytYDxPRd5i2EgoPEQZ9VM
 kyf3kFilfC2iDfhV4hAz2PJ2NCefNFxO6DGWUgnsZ0ers0DCIm4zDhbPI
 ll++Me/ENhdSzbTUTYFYm5Pcf8hLj/nGSpnO0rOcEHQ8z1HYAfViFiKeo w==;
X-CSE-ConnectionGUID: CwXr/UJ1SNeJHvsU2yvyiw==
X-CSE-MsgGUID: mS+qnvzRTfa5m2nA1rCTGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48631461"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="48631461"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:50:37 -0700
X-CSE-ConnectionGUID: Z5FH7bNHQTyBRa/zhduJtQ==
X-CSE-MsgGUID: ABpm628fRiCmLKosWNBUaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="136212605"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 04:50:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>, Mario
 Limonciello <mario.limonciello@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Michel Daenzer <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2 13/14] drm/amd/display: add drm_edid to dc_sink
In-Reply-To: <20250507001712.120215-14-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250507001712.120215-1-mwen@igalia.com>
 <20250507001712.120215-14-mwen@igalia.com>
Date: Thu, 08 May 2025 14:50:29 +0300
Message-ID: <87jz6rtj7e.fsf@intel.com>
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
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index c93e074ea736..54f6ed33e373 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -46,6 +46,8 @@
>  
>  #include "dmub/inc/dmub_cmd.h"
>  
> +#include <drm/drm_edid.h>
> +

Completely up to AMD maintainers, but in code I maintain I'd request
using a forward declaration instead of an include if you only need a
struct pointer. The header interdependencies just add up.

BR,
Jani.

>  struct abm_save_restore;
>  
>  /* forward declaration */
> @@ -2433,6 +2435,7 @@ struct scdc_caps {
>  struct dc_sink {
>  	enum signal_type sink_signal;
>  	struct dc_edid dc_edid; /* raw edid */
> +	const struct drm_edid *drm_edid; /* Linux DRM edid*/
>  	struct dc_edid_caps edid_caps; /* parse display caps */
>  	struct dc_container_id *dc_container_id;
>  	uint32_t dongle_max_pix_clk;

-- 
Jani Nikula, Intel
