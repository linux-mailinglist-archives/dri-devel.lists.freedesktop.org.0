Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C40A2BE9C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 10:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B36610EA71;
	Fri,  7 Feb 2025 08:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OmZshL39";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5151B10EA6E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 08:54:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAAAC4430D;
 Fri,  7 Feb 2025 08:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738918447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXvhynDFLGl2VG/eD2ULksaHNrcYF1H4SjCXfYiNuEI=;
 b=OmZshL39S+98eneP+hu/yjwtRqSkN58pfmU6nEjLJ1fB2ngGo7EG8Jk3/PFROC3BjDVuiI
 NueKOrYh7sitc4edomP/fP7o1sBn3DSrsTiYu6W+k4QrlGhPlwF8xj3bD3uTlx0lT67tu2
 /bn0hjZxKiAYwZVyV26IUo8VRvnS1dVh0ByDMj7XmzyOwRcRALa4EFkHHuAB4IqKLzLNoD
 G1EX8/1nTBTNzt03u/7FvmzRbV0s8/8wi7WBRWb+GOokfKTFpq3qbkzcYwImsj/XwKMR6i
 twMR4vtXSpPq7Y8WWF88REIwETi5bN7PfW/ChNLAJBzg+GAeHxkhA+YOXBBvoA==
Date: Fri, 7 Feb 2025 09:54:01 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Paul Kocialkowski
 <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
Message-ID: <20250207095401.42d7871d@booty>
In-Reply-To: <hc6llejnkhj5uaj5o4fof64hmderfcbfkrburv7nmqwzq2jnin@nac32akftsbm>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
 <hc6llejnkhj5uaj5o4fof64hmderfcbfkrburv7nmqwzq2jnin@nac32akftsbm>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrt
 ghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
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

On Fri, 7 Feb 2025 04:55:54 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:26PM +0100, Luca Ceresoli wrote:
> > In order to support panels described either via graph links or via a
> > subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
> > to find the next bridge. The resulting logic is complex and duplicates code
> > already present in the DRM bridge core. Switch to the new APIs in DRM
> > bridge core that allow to do the same in a much cleaner way.
> > 
> > Note there are two slight changes in the new logic intended to improve the
> > final result:
> > 
> >  * the old code looks for a subnode with any name except "port" or "ports",
> >    while the new code uses the node passed as a parameter
> > 
> >  * the old code looks for a subnode first and falls back to a graph link,
> >    while the new code uses the reverse order because graph links are the
> >    recommended device tree representation now
> > 
> > The first change makes the code more robust by avoiding the risk of using
> > an unrelated node which is not describing a panel and not names "port" or
> > "ports".
> > 
> > The second change is not expected to expose regressions because, in the
> > cases where both a subnode and a graph link are used to describe a panel,
> > the graph link should point to the subnode itself, such as in
> > arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > 
> > As a further cleanup, use a temporary variable to assign dsi->out_bridge
> > only on success. This avoids the risk of leaving a non-NULL value in
> > dsi->out_bridge when samsung_dsim_host_attach() fails.
> > 
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch was added in v6.
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------------
> >  1 file changed, 9 insertions(+), 46 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6e8ca741bffa5e46 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> >  	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
> >  	struct device *dev = dsi->dev;
> >  	struct device_node *np = dev->of_node;
> > -	struct device_node *remote;
> > -	struct drm_panel *panel;
> > +	struct drm_bridge *out_bridge;
> >  	int ret;
> >  
> > -	/*
> > -	 * Devices can also be child nodes when we also control that device
> > -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> > -	 *
> > -	 * Lookup for a child node of the given parent that isn't either port
> > -	 * or ports.
> > -	 */  
> 
> Please leave the comment in place (maybe rewrite it slightly).

OK

> > -	for_each_available_child_of_node(np, remote) {
> > -		if (of_node_name_eq(remote, "port") ||
> > -		    of_node_name_eq(remote, "ports"))
> > -			continue;
> > +	out_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
> > +	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) != -EPROBE_DEFER)  
> 
> Can it actually return EPROBE_DEFER?

It can't indeed. Dropping the second condition.

> 
> > +		out_bridge = devm_drm_of_get_bridge_by_node(dev, device->dev.of_node);
> >  
> > -		goto of_find_panel_or_bridge;
> > -	}
> > -
> > -	/*
> > -	 * of_graph_get_remote_node() produces a noisy error message if port
> > -	 * node isn't found and the absence of the port is a legit case here,
> > -	 * so at first we silently check whether graph presents in the
> > -	 * device-tree node.
> > -	 */
> > -	if (!of_graph_is_present(np))
> > -		return -ENODEV;
> > -
> > -	remote = of_graph_get_remote_node(np, 1, 0);
> > -
> > -of_find_panel_or_bridge:
> > -	if (!remote)
> > -		return -ENODEV;
> > -
> > -	panel = of_drm_find_panel(remote);
> > -	if (!IS_ERR(panel)) {
> > -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > -	} else {
> > -		dsi->out_bridge = of_drm_find_bridge(remote);
> > -		if (!dsi->out_bridge)
> > -			dsi->out_bridge = ERR_PTR(-EINVAL);
> > -	}
> > -
> > -	of_node_put(remote);
> > -
> > -	if (IS_ERR(dsi->out_bridge)) {
> > -		ret = PTR_ERR(dsi->out_bridge);
> > -		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
> > -		return ret;
> > +	if (IS_ERR(out_bridge)) {
> > +		DRM_DEV_ERROR(dev, "failed to find the bridge: %ld\n", PTR_ERR(out_bridge));
> > +		return PTR_ERR(out_bridge);
> >  	}
> >  
> >  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
> > @@ -1784,6 +1745,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> >  	dsi->format = device->format;
> >  	dsi->mode_flags = device->mode_flags;
> >  
> > +	dsi->out_bridge = out_bridge;
> > +  
> 
> Please move the assignment closer to the original place.

OK. With this change it doesn't make sense to have a temporary
out_bridge variable, so I'll drop it as well.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
