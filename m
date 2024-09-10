Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA2F972B4D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 09:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1975D10E6DE;
	Tue, 10 Sep 2024 07:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAOwIAcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77E810E6DE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 07:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725955165; x=1757491165;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WH9+LUWQGwbF7qXyOYXuIsxibYiSaDowp6tGXvP3BRc=;
 b=AAOwIAcSfvJ/FzJSWMMWw8dIHFjgDdGvJ/tL1Ilj0XqMB6qIBBEKgGhv
 7TIokh7qo8CeqBTTcH7iYSVouqo/CNa1XI/5wyXe4OqNgopA5WA76I4Dx
 BkIr6aYK7dRlaR+n6JBzs8jCgOOb8oy/71RU6S2ScGV2EQ3nRgOJQodVp
 bE8E5kPIiupPBX7movOoTuNylMGh3F5T4xT/DT4PaK9hRmIW2U1ik/tSw
 CpzVplIB3JRKqHlreUpO76N0aCac80khH+zpWmWHg1pFWNPgI9BppRCw/
 aLMgtufMNZhuqYNgD/EZMVn2dVgXt8rptUIOTpWfLIsor18bkaT7S1XEa A==;
X-CSE-ConnectionGUID: IoW2cZQWT72wNznQdP5Reg==
X-CSE-MsgGUID: 1eeKJrUXTK6sS2t9nmdLpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36033535"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="36033535"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:59:24 -0700
X-CSE-ConnectionGUID: Go0LbjtVQdCEhjq5I/VLpg==
X-CSE-MsgGUID: Oalwbrp6QC+YS4nj9UR9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="90237917"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 00:59:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tejas Vipin <tejasvipin76@gmail.com>, Laurent.pinchart@ideasonboard.com,
 patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Tejas
 Vipin <tejasvipin76@gmail.com>
Subject: Re: [PATCH] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
In-Reply-To: <20240910051856.700210-1-tejasvipin76@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240910051856.700210-1-tejasvipin76@gmail.com>
Date: Tue, 10 Sep 2024 10:59:17 +0300
Message-ID: <87ed5skkh6.fsf@intel.com>
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

On Tue, 10 Sep 2024, Tejas Vipin <tejasvipin76@gmail.com> wrote:
> Replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi since
> monitor HDMI information is available after EDID is parsed. Additionally
> rewrite the code the code to have fewer indentation levels.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> index 2d95e0471291..cfbf3137e144 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
> @@ -135,16 +135,16 @@ static enum drm_connector_status cdv_hdmi_detect(
>  
>  	hdmi_priv->has_hdmi_sink = false;
>  	hdmi_priv->has_hdmi_audio = false;
> -	if (edid) {
> -		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
> -			status = connector_status_connected;
> -			hdmi_priv->has_hdmi_sink =
> -						drm_detect_hdmi_monitor(edid);
> -			hdmi_priv->has_hdmi_audio =
> -						drm_detect_monitor_audio(edid);
> -		}
> -		kfree(edid);
> +	if (!edid)
> +		return status;
> +
> +	if (edid->input & DRM_EDID_INPUT_DIGITAL) {
> +		status = connector_status_connected;
> +		hdmi_priv->has_hdmi_sink = connector->display_info.is_hdmi;
> +		hdmi_priv->has_hdmi_audio = drm_detect_monitor_audio(edid);

display_info.has_audio

>  	}
> +	kfree(edid);
> +

Please switch the code to use struct drm_edid and the related functions
drm_edid_read(), drm_edid_connector_update() and
drm_edid_connector_add_modes() while you're at it. See git log
--grep=drm_edid for a number of examples.

BR,
Jani.


>  	return status;
>  }

-- 
Jani Nikula, Intel
