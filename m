Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF41BFA511
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160B710E05B;
	Wed, 22 Oct 2025 06:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n8qmuNXj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B90E10E05B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 06:49:38 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A74EE6B5;
 Wed, 22 Oct 2025 08:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761115672;
 bh=yeATUe9Huz/d4ZlyKOILoLW57Pa6+OK+b6zRB9aGcoI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n8qmuNXj+Tuw/nNQp8h3lIOFlEptDowO2TYootLP9l4B1OaWRvKgjZsgUyNVHBchU
 uzegRzH0SrQspZgQ9C1kRtAV5y1S8B2iwqVh6y13D7p/LR2Ut4aXMNvLHFu9whlRSc
 TDWQMh2qBy8KUzD33x6kaK+Kn4WRsx2dt9UIlz84=
Message-ID: <3f026b8c-d917-4197-b7f8-51ef3355aca7@ideasonboard.com>
Date: Wed, 22 Oct 2025 09:49:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Devarsh Thakkar <devarsht@ti.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, simona@ffwll.ch,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: praneeth@ti.com, vigneshr@ti.com, aradhya.bhatia@linux.dev,
 s-jain1@ti.com, s-wang12@ti.com, r-donadkar@ti.com, h-shenoy@ti.com
References: <20251007112309.1103811-1-devarsht@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251007112309.1103811-1-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 07/10/2025 14:23, Devarsh Thakkar wrote:
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
> V3: Use drm_edid_connector_update without edid NULL check
> V2: Use drm_edid_connector_update to detect HDMI
> 
> Link to V2:
> https://lore.kernel.org/all/20251006150714.3144368-1-devarsht@ti.com/
> Link to V1:
> https://lore.kernel.org/all/20251003143642.4072918-1-devarsht@ti.com/
> 
>  drivers/gpu/drm/bridge/sii902x.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index d537b1d036fb..bb613d4c281f 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -296,6 +296,8 @@ static const struct drm_edid *sii902x_edid_read(struct sii902x *sii902x,
>  	mutex_lock(&sii902x->mutex);
>  
>  	drm_edid = drm_edid_read_ddc(connector, sii902x->i2cmux->adapter[0]);
> +	drm_edid_connector_update(connector, drm_edid);
> +	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
>  
>  	mutex_unlock(&sii902x->mutex);

I'm not sure if this is right. If I'm not mistaken, the
drm_bridge_connector.c calls sii902x_edid_read, and then does a
drm_edid_connector_update(). So drm_edid_connector_update() will be
called twice, and also, I don't think the bridge should be updating
connector's data when using DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Maybe either drop sink_is_hdmi, and just look at
connector->display_info.is_hdmi, or if that doesn't work for some
reason, just get the "is-hdmi" flag from the edid data directly.

 Tomi

> @@ -309,14 +311,11 @@ static int sii902x_get_modes(struct drm_connector *connector)
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
>  

