Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85ECBF5C8D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 12:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B3210E2F3;
	Tue, 21 Oct 2025 10:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UAKVwMh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F213410E2F3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 10:31:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A8AA84E41235;
 Tue, 21 Oct 2025 10:31:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6FBD860680;
 Tue, 21 Oct 2025 10:31:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 050A6102F238A; 
 Tue, 21 Oct 2025 12:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761042712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YuVVLdxM0un/2EVnLCzvPprS2wmsm9jt4ri10VpX44E=;
 b=UAKVwMh67iPoBl4NTClw0ksLV00XODy/DIHEJ+Abr2eO5IqpQcehz/93nuSEIk1KNn1Bmg
 alRZgs0hHh6R//b9Djv11rXnVg0M3E+zSIsxC47sYWAJyGtBqcFsIVJo+s20tNSMGbhOor
 eyrx4hjsFi7ZY638H2w5XkfJ2MlT/Z227QFyUd5rEkIdAeesvlToC3vmxcoH4ehhF9PII8
 zbM6HzvGFQmw1YC877GgY3McN5LwDhQmATKGTMlq8UENwmFokLOU0KtyQWXnW3mlO7fJAu
 j9PCgp7hTfzSMz4K/v7Wh0IGkXn6qFI19aHgSoubt+UeSXbN8tO7oymiMdGsUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 12:31:11 +0200
Message-Id: <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
X-Mailer: aerc 0.20.1
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021023130.1523707-2-damon.ding@rock-chips.com>
In-Reply-To: <20251021023130.1523707-2-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hello Damon,

On Tue Oct 21, 2025 at 4:31 AM CEST, Damon Ding wrote:
> When multiple bridges are present, EDID detection capability
> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> determined by the last bridge in the chain, we handle three cases:
>
> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>    &drm_bridge_connector.bridge_edid to NULL and set
>    &drm_bridge_connector.bridge_modes to the later bridge.
>  - Ensure modes detection capability of the later bridge will not
>    be ignored.
>
> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>    &drm_bridge_connector.bridge_modes to NULL and set
>    &drm_bridge_connector.bridge_edid to the later bridge.
>  - Although EDID detection capability has higher priority, this
>    operation is for balance and makes sense.
>
> Case 3: the later bridge declares both of them
>  - Assign later bridge as &drm_bridge_connector.bridge_edid and
>    and &drm_bridge_connector.bridge_modes to this bridge.
>  - Just leave transfer of these two capabilities as before.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> ---
>
> Changes in v7:
> - As Luca suggested, simplify the code and related comment.
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index baacd21e7341..7c2936d59517 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -673,14 +673,22 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
>  		if (!bridge->ycbcr_420_allowed)
>  			connector->ycbcr_420_allowed =3D false;
>
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -			bridge_connector->bridge_edid =3D bridge;
> +		/*
> +		 * Ensure the last bridge declares OP_EDID or OP_MODES or both.
> +		 */
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MO=
DES) {
> +			bridge_connector->bridge_edid =3D NULL;
> +			bridge_connector->bridge_modes =3D NULL;
> +			if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +				bridge_connector->bridge_edid =3D bridge;
> +			if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +				bridge_connector->bridge_modes =3D bridge;
> +		}
>  		if (bridge->ops & DRM_BRIDGE_OP_HPD)
>  			bridge_connector->bridge_hpd =3D bridge;
>  		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>  			bridge_connector->bridge_detect =3D bridge;
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -			bridge_connector->bridge_modes =3D bridge;
> +

This does not apply on current drm-misc-next, due to the patch I mentioned
in a previous iteration, now applied as commit 2be300f9a0b6 ("drm/display:
bridge_connector: get/put the stored bridges").

However I'm sorry I have to mention that patch turned out being buggy, so
I've sent a series to apply a corrected version [0]. I suggest watching the
disucssion about the fix series, and if that gets approved rebase on top of
that and adapt your changes.

Sorry about the mess. :(

[0] https://lore.kernel.org/r/20251017-drm-bridge-alloc-getput-bridge-conne=
ctor-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
