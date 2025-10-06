Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89BEBBE74E
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 17:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A4410E0AC;
	Mon,  6 Oct 2025 15:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Op4soA22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2B510E0AC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 15:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759763620; x=1791299620;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mYl/jWIZpcM7NOIheKXXnCr8a3Fz+M9vKWd5YhidvIE=;
 b=Op4soA22QTEC1XTP3SnmZtL13RNYljR4Xb7tuILmBYsaAizn6wkt6TiZ
 xvtLySJuAXtAKj+tKHGXBeaanbLxW2hYLeAt6t1sjVsKL89VzdsyM4EaP
 /r7c9HO5g7UZuL9xUgylAsNAhZgqmnJRKM3820XiwO2mtXOvIXkW/pNMh
 6fn2OewnhSsLX5jdV4tawQwxdCMPMZaGN046MSj1/OQjEk9dDTlb7+rVy
 1nGMyLaa1eLbD0UiL1yVSNSEnhPPAGk2bdIfxMB0HlwM1pb2hYgrbOP8B
 VL5w2GWXBH1ncP9HHNQfKH+gavKaoaDi6ZMuvRONR5xYn5hnPef8eDqwG w==;
X-CSE-ConnectionGUID: 4nAUNAnXTK6Mul1T0MzhNQ==
X-CSE-MsgGUID: XA9DIw23SWeHqJ7+I5Y+Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65584142"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="65584142"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:13:39 -0700
X-CSE-ConnectionGUID: HcAZOHZyTJ+yzL4oq3jJBw==
X-CSE-MsgGUID: HlBBfMv6SkuUcV2XCG/WUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179178387"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.162])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 08:13:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Devarsh Thakkar <devarsht@ti.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, simona@ffwll.ch,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: tomi.valkeinen@ideasonboard.com, praneeth@ti.com, vigneshr@ti.com,
 aradhya.bhatia@linux.dev, s-jain1@ti.com, s-wang12@ti.com,
 r-donadkar@ti.com, h-shenoy@ti.com, devarsht@ti.com
Subject: Re: [PATCH v2] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
In-Reply-To: <20251006150714.3144368-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251006150714.3144368-1-devarsht@ti.com>
Date: Mon, 06 Oct 2025 18:13:30 +0300
Message-ID: <d14f940ed04e04df4a112588cdb6fa4df770b9fb@intel.com>
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

On Mon, 06 Oct 2025, Devarsh Thakkar <devarsht@ti.com> wrote:
> The SII902x HDMI bridge driver wasn't working properly with drivers that
> use the newer bridge connector architecture with the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, like TIDSS.  This caused HDMI audio to
> fail since the driver wasn't properly setting the sink_is_hdmi flag when
> the bridge was attached without a connector since .get_modes() is never
> called in this case. Fix it by setting sink_is_hdmi flag when reading
> the EDID block itself.
>
> Fixes: 3de47e1309c2 ("drm/bridge: sii902x: use display info is_hdmi")
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V2: Use drm_edid_connector_update to detect HDMI as suggested
>
> Link to V1:
> https://lore.kernel.org/all/20251003143642.4072918-1-devarsht@ti.com/
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index d537b1d036fb..d36466d73385 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -296,6 +296,10 @@ static const struct drm_edid *sii902x_edid_read(struct sii902x *sii902x,
>  	mutex_lock(&sii902x->mutex);
>  
>  	drm_edid = drm_edid_read_ddc(connector, sii902x->i2cmux->adapter[0]);
> +	if (drm_edid) {
> +		drm_edid_connector_update(connector, drm_edid);

Mmmh, as a rule, you should do drm_edid_connector_update() even if it's
NULL to reset all the previous stuff.

BR,
Jani.

> +		sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
> +	}
>  
>  	mutex_unlock(&sii902x->mutex);
>  
> @@ -309,14 +313,11 @@ static int sii902x_get_modes(struct drm_connector *connector)
>  	int num = 0;
>  
>  	drm_edid = sii902x_edid_read(sii902x, connector);
> -	drm_edid_connector_update(connector, drm_edid);
>  	if (drm_edid) {
>  		num = drm_edid_connector_add_modes(connector);
>  		drm_edid_free(drm_edid);
>  	}
>  
> -	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
> -
>  	return num;
>  }

-- 
Jani Nikula, Intel
