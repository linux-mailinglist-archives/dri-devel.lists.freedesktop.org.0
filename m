Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA283AB662F
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 10:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2EE10E283;
	Wed, 14 May 2025 08:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpDaKXyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C294B10E283
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747212000; x=1778748000;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7IBu6SqoOaixh4a2E5UhMsl0v0l4ryM3zDotZ/2zmxc=;
 b=PpDaKXyGABPIYfxxbnGi0q4qZjj6ciRio/6MW0n1rlid2IBp9pQet24r
 50yFnWJlcwmEGLv7QyKn4GgAGEqbBqqM2ShSa4we1oeLQm1qBGHrCLJeb
 lb4mrqf+jgU2i2N+AbygqXGYU4MOW3YyMgmrVyQPRfAK9HCzjVAPqK7Aw
 jl9whFQ+YC5gg5Q/xwQRBp9zHTlQCSF9DktydUNQIztiWDK6bijamxP+0
 2VXHg0ZHKD+SRr0quVSOUWbB8smEjEgM5SjhEvcIFK4gnSiqHegAY+Cqh
 fzeHXFcpA7aYSmfYGVMflmeHQ2BwfAQiydHDkXVylS9PC43MoB+71o60c g==;
X-CSE-ConnectionGUID: dprhqpKyQxGT+zrY8c4xVQ==
X-CSE-MsgGUID: xHO0PxhYRCiUqjbBgseBIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48964635"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="48964635"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:39:58 -0700
X-CSE-ConnectionGUID: fkoVliQkTt+1gp7aIeKD2g==
X-CSE-MsgGUID: 8yaHo7RnTMuc0hUxCalqWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="142913537"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.180])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 01:39:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "feijuan.li" <feijuan.li@samsung.com>, jingoohan1@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: feijuan.li@samsung.com, hongfei.tang@samsung.com,
 minggui.yan@samsung.com, qilin.wang@samsung.com
Subject: Re: [PATCH v3] drm/edid: fixed the bug that hdr metadata was not reset
In-Reply-To: <20250514063511.4151780-1-feijuan.li@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20250514063420epcas5p2bdd64000965a5ceffa196f123db8fb2e@epcas5p2.samsung.com>
 <20250514063511.4151780-1-feijuan.li@samsung.com>
Date: Wed, 14 May 2025 11:39:49 +0300
Message-ID: <878qmzio16.fsf@intel.com>
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

On Wed, 14 May 2025, "feijuan.li" <feijuan.li@samsung.com> wrote:
> When DP connected to a device with HDR capability,
> the hdr structure was filled.Then connected to another
> sink device without hdr capability, but the hdr info
> still exist.
>
> Signed-off-by: feijuan.li <feijuan.li@samsung.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/drm_edid.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13bc4c290b17..9edb3247c767 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6596,6 +6596,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	info->has_hdmi_infoframe = false;
>  	info->rgb_quant_range_selectable = false;
>  	memset(&info->hdmi, 0, sizeof(info->hdmi));
> +	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_metadata));
>  
>  	info->edid_hdmi_rgb444_dc_modes = 0;
>  	info->edid_hdmi_ycbcr444_dc_modes = 0;

-- 
Jani Nikula, Intel
