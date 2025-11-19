Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9300C6F493
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC42810E649;
	Wed, 19 Nov 2025 14:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="tFLvY7ZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5DE10E643
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:28:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 79BB74E4179F;
 Wed, 19 Nov 2025 14:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44D3E60699;
 Wed, 19 Nov 2025 14:28:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 189D110371A62; Wed, 19 Nov 2025 15:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763562529; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=7cMCClSR0Yc33+8BuX00+rv0T/LwX4Ii536K2zY3W/o=;
 b=tFLvY7ZQdBOvsEtfuS/kSFmOMupReVpG03GDdGnZV7Xrig9ypjEUdcbzMdi9x/Ij8uD5XM
 z6wI2ohEObtnicjhCYmME9gf6whB5LWK8QB8tvteGhYZZtBUrfIxhwDpwiYwHcbGuS+55E
 2yWfafUAAdluU9DGmy71vILWizsiAgLo4k+r1lMCHonBOuhcBhJ4eZBB3a4xO0ivETw6o+
 xHrCAXEn1uqjdU0vDmAKNn369fL+KDg4tXjFEatWotoBPVY4MOP4ClRu2NDUf2owzt3nP8
 dOebpvxOSgU2JCLYS3eU1qgCh3hLRU9xxmxFpMMEjC4wY4pcQB25W/Xh0o75nQ==
Message-ID: <66cdbe39-d065-4aa4-86e4-84a38b49c09c@bootlin.com>
Date: Wed, 19 Nov 2025 14:28:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] drm/bridge: deprecate of_drm_find_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-2-0db98a7fe474@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-2-0db98a7fe474@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 11/19/25 13:05, Luca Ceresoli wrote:
> of_drm_find_bridge() does not increment the returned bridge
> refcount. drm_of_find_bridge() is to be used as a replacement.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/drm_bridge.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index d98a7b4a83c0..6debbf20aaa8 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -299,7 +299,7 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
>    * @bridge: bridge control structure
>    *
>    * Add the given bridge to the global list of bridges, where they can be
> - * found by users via of_drm_find_bridge().
> + * found by users via drm_of_find_bridge().
>    *
>    * The bridge to be added must have been allocated by
>    * devm_drm_bridge_alloc().
> @@ -360,7 +360,7 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>    * @bridge: bridge control structure
>    *
>    * Remove the given bridge from the global list of registered bridges, so
> - * it won't be found by users via of_drm_find_bridge(), and add it to the
> + * it won't be found by users via drm_of_find_bridge(), and add it to the
>    * lingering bridge list, to keep track of it until its allocated memory is
>    * eventually freed.
>    */
> @@ -1452,6 +1452,9 @@ EXPORT_SYMBOL(drm_of_find_bridge);
>    *
>    * @np: device node
>    *
> + * This function is deprecated. Use drm_of_find_bridge() instead for proper
> + * refcounting.
> + *

I think it should be more explicit that the refcounting is not done by 
this function, like:

	This function is deprecated. The returned bridge is not refcounted, you 
should not use drm_bridge_put(). Use drm_of_find_bridge() instead for 
proper refcounting.

>    * RETURNS:
>    * drm_bridge control struct on success, NULL on failure
>    */
> 

