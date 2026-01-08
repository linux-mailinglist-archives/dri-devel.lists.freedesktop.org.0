Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B85D020D7
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35A110E00D;
	Thu,  8 Jan 2026 10:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZZyzgQ6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92B210E00D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 10:13:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8C9C3C1ECB2;
 Thu,  8 Jan 2026 10:13:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67284606B6;
 Thu,  8 Jan 2026 10:13:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 67281103C880E; Thu,  8 Jan 2026 11:13:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767867225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oktYwHpBxwEHcRdG+441TRw1haM/iQZSRwVoxeIKxoE=;
 b=ZZyzgQ6MhWJyRaP/AtUlqfOLAs4SdmGpIbrTgke2e9hMzTVnklegqCUfH8QRCn5O6RABoj
 16WnFZasjj07Z4qzlbvRLkvzc2VVEUrg/PHo/0hVGUvCveJoVMaKNXpF33qlmGO3FehhOf
 k7pfb4T0ys97YT7G8i9diw0OFkt8LkWxEl7ROtseRInXV4+MdbzVUcQO+WCebz50Eut4hk
 N211JQ6oSlZbRFWPNyySKeXJAaetMVLV8ifWRu/QK0qxRKoWEHucX05hpurrxyD91ZMn27
 K3uokXirBg+StnQE60kwcRSzgmtPXJN8KxmDnZ6moWwxpHk0yjZsOiEyjdf8kA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 11:13:33 +0100
Message-Id: <DFJ4MHZJ1DTL.10AMTN5NW6VGS@bootlin.com>
Subject: Re: [PATCH 5/6] drm/exynos: hdmi: convert to
 of_drm_find_and_get_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-5-ef48a517828e@bootlin.com>
 <20260108-acoustic-groovy-shark-1c6850@houat>
In-Reply-To: <20260108-acoustic-groovy-shark-1c6850@houat>
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

On Thu Jan 8, 2026 at 9:14 AM CET, Maxime Ripard wrote:
> On Wed, Jan 07, 2026 at 05:22:03PM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure i=
t
>> is put when done.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Why can't we use next_bridge for this one?

Because this device is not a bridge, so we have no struct drm_bridge.

>> ---
>>  drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyn=
os/exynos_hdmi.c
>> index 01813e11e6c6..bfcf2fa62fe1 100644
>> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
>> @@ -1779,7 +1779,7 @@ static int hdmi_bridge_init(struct hdmi_context *h=
data)
>>  		return -EINVAL;
>>  	}
>>
>> -	hdata->bridge =3D of_drm_find_bridge(np);
>> +	hdata->bridge =3D of_drm_find_and_get_bridge(np);
>>  	of_node_put(np);
>>
>>  	if (!hdata->bridge)
>> @@ -2096,6 +2096,8 @@ static void hdmi_remove(struct platform_device *pd=
ev)
>>
>>  	put_device(&hdata->ddc_adpt->dev);
>>
>> +	drm_bridge_put(hdata->bridge);
>> +
>>  	mutex_destroy(&hdata->mutex);
>>  }
>
> Same story than in your part 2 series, it should be dropped in destroy.

hdata->bridge is only used for drm_bridge_attach(), it won't be referenced
after that. So this is safe, unless I'm missing something.

Also as we don't have a struct drm_bridge (as mentioned above) we have no
bridge destroy. We have the encoder destroy, but that will never be called
on bridge hotplug.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
