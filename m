Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA8AAA4895
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 12:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D65010E72B;
	Wed, 30 Apr 2025 10:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="j5IGpt96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C1210E724;
 Wed, 30 Apr 2025 10:37:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59B1343155;
 Wed, 30 Apr 2025 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1746009420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HCqPYAYDeSC4T6gsM+8/d4/R4hTjtWts9K3/InF+2yg=;
 b=j5IGpt96m3GS1GgdAQYb0DMF9BS9VJKNh0+D/2DDE2MQcbaP8QshRiOSUeBtDIq10LHfcK
 da6Rz6IPzqh72skLr3qzo8sCS1PQhKF2edPzJp4eG6QBBwrh5nrxL51ckveG3zavYd3qUP
 J2jx1+yN1XlBcUb/xgzlUVBCN3TYadasJXfR27IzS3EZ5METDQ7Zoy8F1/pK4SrZPTMcLs
 EeISxDq5NZi4vcUbvqFr2+DghQmkq4QWjiUcMCuSrjLoJhKePJalZDcGyOqVuDEsI237bq
 COMqwTuYqRY83cpYZO0vAcYqKCUzKgW8Qg5QF6JVH87BqsDr4JvKUr2eOLVdmQ==
Date: Wed, 30 Apr 2025 12:36:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: <Manikandan.M@microchip.com>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <jagan@amarulasolutions.com>,
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
 <festevam@gmail.com>, <dianders@chromium.org>, <chunkuang.hu@kernel.org>,
 <krzk@kernel.org>, <asrivats@redhat.com>, <paulk@sys-base.io>,
 <lumag@kernel.org>, <Hui.Pu@gehealthcare.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <asahi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <aford173@gmail.com>,
 <adrien.grassein@gmail.com>, <amishin@t-argos.ru>,
 <andy.yan@rock-chips.com>, <angelogioacchino.delregno@collabora.com>,
 <bleung@chromium.org>, <biju.das.jz@bp.renesas.com>,
 <chf.fritz@googlemail.com>, <cristian.ciocaltea@collabora.com>,
 <detlev.casanova@collabora.com>, <Dharma.B@microchip.com>,
 <groeck@chromium.org>, <heiko@sntech.de>, <jani.nikula@intel.com>,
 <j@jannau.net>, <jbrunet@baylibre.com>, <jesseevg@gmail.com>,
 <khilman@baylibre.com>, <kieran.bingham+renesas@ideasonboard.com>,
 <victor.liu@nxp.com>, <martin.blumenstingl@googlemail.com>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>, <ple@baylibre.com>,
 <fnkl.kernel@gmail.com>, <sugar.zhang@rock-chips.com>,
 <sui.jingfeng@linux.dev>, <tomi.valkeinen+renesas@ideasonboard.com>,
 <mordan@ispras.ru>
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
Message-ID: <20250430123651.37be3e38@booty>
In-Reply-To: <e90b9ef2-ace0-4b98-9d49-5a62e529cf8a@microchip.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
 <e90b9ef2-ace0-4b98-9d49-5a62e529cf8a@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeigeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeikedprhgtphhtthhopeforghnihhkrghnuggrnhdrofesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Manikandan,

On Wed, 30 Apr 2025 09:42:16 +0000
<Manikandan.M@microchip.com> wrote:

[...]

> > diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
> > index 1d4ae0097df847d9f93c79eecff0c4587ae331ba..9f4ff82bc6b49010f8727da3b367f5a744a28edc 100644
> > --- a/drivers/gpu/drm/bridge/microchip-lvds.c
> > +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
> > @@ -157,9 +157,10 @@ static int mchp_lvds_probe(struct platform_device *pdev)
> >          if (!dev->of_node)
> >                  return -ENODEV;
> > 
> > -       lvds = devm_kzalloc(&pdev->dev, sizeof(*lvds), GFP_KERNEL);
> > -       if (!lvds)
> > -               return -ENOMEM;
> > +       lvds = devm_drm_bridge_alloc(&pdev->dev, struct mchp_lvds, bridge,
> > +                                    &mchp_lvds_bridge_funcs);
> > +       if (IS_ERR(lvds))
> > +               return PTR_ERR(lvds);
> > 
> >          lvds->dev = dev;
> > 
> > @@ -192,7 +193,6 @@ static int mchp_lvds_probe(struct platform_device *pdev)
> > 
> >          lvds->bridge.of_node = dev->of_node;
> >          lvds->bridge.type = DRM_MODE_CONNECTOR_LVDS;
> > -       lvds->bridge.funcs = &mchp_lvds_bridge_funcs;
> > 
> >          dev_set_drvdata(dev, lvds);
> >          ret = devm_pm_runtime_enable(dev);  
> 
> Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Thanks for reviewing!

In v3 this patch will be slightly different from v2. See the reply I
just sent to Doug for the details.

If your Reviewed-by tag refers only to the microchip-lvds driver, for
which there will be no change in v3, I think it's correct to take your
tag and add a comment like:

 Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com> # microchip-lvds.c

Anything against this?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
