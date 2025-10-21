Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E77BF55EC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C07410E59E;
	Tue, 21 Oct 2025 08:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J7jmNfQ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2773210E59E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761036908; x=1792572908;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VswKoNYWqbxDAkBE7g2SLuE51cwjYRCIW4OtJaiJOJo=;
 b=J7jmNfQ2dGSqNzHQed4zxdMqk49qi/t+jgrGEa43KGPt9pjZAZ2e8wSW
 dsEXsGyNWVzXBdfURk1Uu00/JW6WCG3lHwheVHjeHMl41gjfWa3W7WSww
 xA+dlmZcsr+TnA7/kDB0FNwnYTw1sKaKnEjY5exOJr9ZuI29pGF20YHxu
 iYYtPEV/oaAuzToFPa6D5WUkHVewR4leiU/pNUgRNLJKXJAbHGG3xi/Ie
 yF3D+jTAfFuLp2br9Itp6d0bwaC5hT5CQOlXZnbWxa6lIYK4hemxNSbnQ
 QduLWN6frc38sR5Qckwh8l+rBuawTNExJU4odNmk5RFJ3+y2Pk0GI3CoT g==;
X-CSE-ConnectionGUID: hnZBitu5T+O6SCKZBUoNaQ==
X-CSE-MsgGUID: rAP+drkIQN6EcKniKQ1cug==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66994640"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66994640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 01:55:08 -0700
X-CSE-ConnectionGUID: al+HkUXbSR+qPKDIYLKN2A==
X-CSE-MsgGUID: 7BIqSOfRSkmufTPq7jzz0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="183101095"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 01:55:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chu Guangqing <chuguangqing@inspur.com>, alain.volmat@foss.st.com,
 rgallaispou@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Chu
 Guangqing <chuguangqing@inspur.com>
Subject: Re: [PATCH v2 1/1] drm/sti: hdmi: call drm_edid_connector_update
 when edid is NULL
In-Reply-To: <20251020013039.1800-2-chuguangqing@inspur.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251020013039.1800-1-chuguangqing@inspur.com>
 <20251020013039.1800-2-chuguangqing@inspur.com>
Date: Tue, 21 Oct 2025 11:55:01 +0300
Message-ID: <4cf3050675a7090a87c80d525601b226e5e70f06@intel.com>
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

On Mon, 20 Oct 2025, Chu Guangqing <chuguangqing@inspur.com> wrote:
> call drm_edid_connector_update to reset the information when edid is NULL.
> We can see the following comments in drm_edid.c
> If EDID is NULL, reset the information.
>
> Signed-off-by: Chu Guangqing <chuguangqing@inspur.com>
> ---
>  drivers/gpu/drm/sti/sti_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 4e7c3d78b2b9..e0be1be8bcdd 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1008,7 +1008,7 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
>  	return count;
>  
>  fail:
> -	DRM_ERROR("Can't read HDMI EDID\n");
> +	drm_edid_connector_update(connector, NULL);

The context above has:

	drm_edid = drm_edid_read(connector);

	drm_edid_connector_update(connector, drm_edid);

	cec_notifier_set_phys_addr(hdmi->notifier,
				   connector->display_info.source_physical_address);

	if (!drm_edid)
		goto fail;

i.e. drm_edid_connector_update() already gets called regardless of
whether drm_edid is NULL or not. Precisely as intended in commit
f7945d9fa8b7 ("drm/sti/sti_hdmi: convert to struct drm_edid").


BR,
Jani.


>  	return 0;
>  }

-- 
Jani Nikula, Intel
