Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BC1AC4C2C
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 12:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3475010E3FF;
	Tue, 27 May 2025 10:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="n2jg6VMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C11510E3FF;
 Tue, 27 May 2025 10:21:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098A44397B;
 Tue, 27 May 2025 10:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1748341293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qHxaZtwrlMsrfQyNNpJZT0YvaiMdkMix0Za1kMxuSc=;
 b=n2jg6VMFAaZOLH1adDk8AISvMQoA1XxSYX/4BTsyXVWGiEdZ0Onwde8/STdc3dkaj5nX/G
 LhU27t8OlPilol5tILhUUDlfhVs5JQaS9lakiZbjrbpMAtSJWARzt2LllxRCGOrxsW8Q2O
 qD/LiFH11SzCCj0trEoye4sZGP/wVuqf3pcg6QjQtEc3qAPZGTlMbLDxSf3lnk6TMPjAtp
 tvXs5xnUv9FnZbNU1i+P5KdioUp2EKUDMejDyuGKqW2G3o0TkWa0oVUwBwWO8h82FWyXNW
 GmAzGHyxZPHpy7lk2hcVGNJABETorhbkBjr3gmqycG1aXN4tLJHKvhHS6d5Eeg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Christoph Fritz <chf.fritz@googlemail.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, 
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Liu Ying <victor.liu@nxp.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Vitalii Mordan <mordan@ispras.ru>, "Rob Herring (Arm)" <robh@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 Martyn Welch <martyn.welch@collabora.co.uk>, 
 Peter Senna Tschudin <peter.senna@gmail.com>, Helge Deller <deller@gmx.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
Subject: Re: (subset) [PATCH v3 00/22] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-Id: <174834128290.138143.12049855352148769197.b4-ty@bootlin.com>
Date: Tue, 27 May 2025 12:21:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtddufeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieefvdehvedvgeeftedugeetudevuedvffekhedvfeetkeduleelgeevudffieeinecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeljedprhgtphhtthhopehmrghrthhinhdrsghluhhmvghnshhtihhnghhlsehgohhoghhlvghmrghilhdrtghomhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhumhgrg
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghfohhrugdujeefsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegrughrihgvnhdrghhrrghsshgvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomh
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


On Fri, 09 May 2025 15:53:26 +0200, Luca Ceresoli wrote:
> devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> bridge, and the only one supported from now on. It is the first milestone
> towards removal of bridges from a still existing DRM pipeline without
> use-after-free.
> 
> The steps in the grand plan [1] are:
> 
> [...]

Applied, thanks!

[18/22] drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API
        commit: 99764593528f9e0ee9509f9e4a4eb21db99d0681

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

