Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3331CFE5D4
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51EE10E0E8;
	Wed,  7 Jan 2026 14:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mwG58V21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECBD10E0E8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 14:45:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6C6AF4E41FD8;
 Wed,  7 Jan 2026 14:45:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3334A606F8;
 Wed,  7 Jan 2026 14:45:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 54B3D103C87C1; Wed,  7 Jan 2026 15:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767797135; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nTlOT3AM4kdk7PxlNs3Skb2xq4/lCpkf95bKd6Z7IFA=;
 b=mwG58V21Feidw7j15RkZ1DlmeBnygryUTg12PFyeun6SbL9UTMeQuBa/8vHS1eHFd8029L
 gUBiXaA5jWnwZ2IoTRm9A0ijTAesUa4m5wNMBnTmFh/kEfP25+oWQuPHZcFzPm52arShlN
 Z6LgEDcsgolgB1iwvYzSEO7kLDdcRqlxXrCocxejFHvB+d3UGfDMa3mipAFKt/h/EQuM9/
 vMFxUGBzyLB/mtlmKx5GPM6T8Ub5eDu524wcrnK1htz4OoOxRzvVkBhGLLVU2p/DojiX3V
 E3WLiGA8J/pTx5Gb0zznUhkhDBxNE2CLn0CfTKOwLLdUB8Mgwhp5crAsU6ogSg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 15:45:24 +0100
Message-Id: <DFIFS3S64SGO.3UGHYN3F6HHRQ@bootlin.com>
Subject: Re: [PATCH 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Philippe Cornu"
 <philippe.cornu@st.com>, <benjamin.gaignard@linaro.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Adrien Grassein"
 <adrien.grassein@gmail.com>, "Liu Ying" <victor.liu@nxp.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-9-283d7bba061a@bootlin.com>
 <20260107-weightless-adaptable-wildebeest-a3ed6f@houat>
In-Reply-To: <20260107-weightless-adaptable-wildebeest-a3ed6f@houat>
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

Hi Maxime,

Thanks for the blazingly fast review of the entire series!

On Wed Jan 7, 2026 at 3:08 PM CET, Maxime Ripard wrote:
> Hi,
>
> On Wed, Jan 07, 2026 at 02:13:00PM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/=
bridge/imx/imx8qxp-ldb.c
>> index 122502968927..6b80d798b27a 100644
>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
>> @@ -552,7 +552,7 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx=
8qxp_ldb *imx8qxp_ldb)
>>  		goto out;
>>  	}
>>
>> -	imx8qxp_ldb->companion =3D of_drm_find_bridge(companion_port);
>> +	imx8qxp_ldb->companion =3D of_drm_find_and_get_bridge(companion_port);
>>  	if (!imx8qxp_ldb->companion) {
>>  		ret =3D -EPROBE_DEFER;
>>  		DRM_DEV_DEBUG_DRIVER(dev,
>> @@ -679,6 +679,7 @@ static void imx8qxp_ldb_remove(struct platform_devic=
e *pdev)
>>  	struct ldb *ldb =3D &imx8qxp_ldb->base;
>>
>>  	ldb_remove_bridge_helper(ldb);
>> +	drm_bridge_put(imx8qxp_ldb->companion);
>
> the companion bridge is used in pretty much every KMS hook, we need to
> put the reference in destroy.

Ouch, indeed! Will fix in v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
