Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA2CFEFB9
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 18:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6A710E00A;
	Wed,  7 Jan 2026 17:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qjl+IH9e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA4010E00A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 17:03:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BC30FC1EC96;
 Wed,  7 Jan 2026 17:02:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A6BA7606F8;
 Wed,  7 Jan 2026 17:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9A49103C821A; Wed,  7 Jan 2026 18:03:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767805397; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vT259SsZbBCgS5jej5uTjBYNLE5xMiwzYalV9DvjFlw=;
 b=qjl+IH9e6WT/WJbluQMom7WhOSZz91qsguJk+YcCF1ezNfyjR88kSE3TKuk68Dg37xmHw6
 XCEK9Mppq0OQq3vc09h0WDsUQxgQoZKm+M/+U+3MgdY0Eb/MK9G6UG+ZlB8NXiAEBbZ6Pi
 xP9Oxci+bX3nmJSR9oU2MukZpebnHYoGLphjaIxE7AW3mpS/83hzxfcjIax6cip9cRD7lZ
 Uex/OGHArOy4i/tiS6i8OdbUklSoD4vZR2GIC0hRgcGA3SbizduiTm0dV2HMFCrUGQiGZt
 cUleZVAvrJ72aqzu/SfKPKbcZV9e9srbSuH73i8GFot6Kr2H131NFf/nJYQ26g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 18:03:05 +0100
Message-Id: <DFIIPIQDRAXW.3FOJY73IY5UZ9@bootlin.com>
Subject: Re: [PATCH 3/6] drm/imx/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-3-ef48a517828e@bootlin.com>
 <3e87a26d067de694273daaf011a50f1a2e7718f1.camel@pengutronix.de>
In-Reply-To: <3e87a26d067de694273daaf011a50f1a2e7718f1.camel@pengutronix.de>
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

Hello Philipp,

On Wed Jan 7, 2026 at 5:34 PM CET, Philipp Zabel wrote:
> On Mi, 2026-01-07 at 17:22 +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/i=
mx/ipuv3/dw_hdmi-imx.c
>> index 07e5f96202d4..95f629d97bce 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
>> @@ -241,7 +241,7 @@ static int dw_hdmi_imx_probe(struct platform_device =
*pdev)
>>  	if (IS_ERR(hdmi->hdmi))
>>  		return PTR_ERR(hdmi->hdmi);
>>
>> -	hdmi->bridge =3D of_drm_find_bridge(np);
>> +	hdmi->bridge =3D of_drm_find_and_get_bridge(np);
>>  	if (!hdmi->bridge) {
>>  		dev_err(hdmi->dev, "Unable to find bridge\n");
>>  		dw_hdmi_remove(hdmi->hdmi);
>
> The component_add() error path below this is missing a
> drm_bridge_put().

Right! Thanks for reviewing, fix queued for v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
