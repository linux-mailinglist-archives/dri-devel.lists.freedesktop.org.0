Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A48C81A35
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 17:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5328010E30B;
	Mon, 24 Nov 2025 16:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KrEWDBIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E0B10E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 16:44:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 024024E418A3;
 Mon, 24 Nov 2025 16:44:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7547606FC;
 Mon, 24 Nov 2025 16:44:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1410710371A8F; Mon, 24 Nov 2025 17:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764002662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8VxkXwHyVWJtMQb4rGcL9+DawEiYCDxx29eMOS81RRA=;
 b=KrEWDBIww4g7nDza6Zc7hbr+ZoXaAgKnm9t/c7uQL8DjmTM4Lqn6U4mOBDG5vMoUDsvrd2
 z/Sp/kXw6JnOSTYIFsmfxY3UrknEd6H/JIDub3AwK87pZ+UJrv5fYOmUNSbSYDq4WsP5v0
 oneufTmETBFZmFUh0DxP15w3p8E74Qylz6WR0Fur6qK4EEAxebJte+/MSikZrha0b/9Gls
 WRJzAXFmzZG7qJu0L63Dv+MuAQdNPhwTUxava0scvHSMJ7nqGhN0bidohpBwZuGxE/Vr0T
 7wEt+C6kFsdbn3+p0AzKRiI549ZbqiSwVxZK8aOtKlYFNJxrJuYIWVmjCUBcsA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Nov 2025 17:44:09 +0100
Message-Id: <DEH2R1Q0XJJG.1NMESYMX9GMFL@bootlin.com>
Subject: Re: [PATCH 04/26] drm/bridge: make of_drm_find_bridge() a wrapper
 of drm_of_find_bridge()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Alexey Brodkin"
 <abrodkin@synopsys.com>, "Phong LE" <ple@baylibre.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus"
 <anitha.chrisanthus@intel.com>, "Edmund Dea" <edmund.j.dea@intel.com>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 "Anusha Srivatsa" <asrivats@redhat.com>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-4-0db98a7fe474@bootlin.com>
 <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7>
In-Reply-To: <wxxjp7fmsnh2k4huvg2thmfi6kcszdphrag3zosrnykn7abeua@cdlywqj32jd7>
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

Hi,

+Cc Anusha

On Mon Nov 24, 2025 at 11:22 AM CET, Maxime Ripard wrote:
> Hi,
>
> On Wed, Nov 19, 2025 at 02:05:35PM +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is identical to drm_of_find_bridge() except it does
>> not increment the refcount. Rewrite it as a wrapper and put the bridge
>> being returned so the behaviour is still the same.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Kind of the same comment than on the TODO. Is it worth doing that patch
> when we could just remove it at the end of the series?

This series is not converting all users I'm afraid.

There are still some drivers to convert, but not a big deal.

The main user to be converted is drm_of_find_panel_or_bridge(), which is
very tricky, and in turn it is used by devm_drm_of_get_bridge(). We
discussed this in the past and the conclusion was a rework of the drm_panel
lifetime was needed to be able to properly replace
drm_of_find_panel_or_bridge().

A drm_panel rework had started very well with devm_drm_panel_alloc() that
got upstreamed by Anusha, but I'm not sure if it has made further progress
after that. So AFAICT the plan is still "People will gradually switch to
the new API over time", and the deprecated of_drm_find_bridge() will be
removed after that.

Does it still make sense to you?

Maxime, Anusha, are you aware of any steps forward about dynamic panel
lifetime, after devm_drm_panel_alloc()?

>> @@ -1460,19 +1460,11 @@ EXPORT_SYMBOL(drm_of_find_bridge);
>>   */
>>  struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>>  {
>> -	struct drm_bridge *bridge;
>> -
>> -	mutex_lock(&bridge_lock);
>> +	struct drm_bridge *bridge =3D drm_of_find_bridge(np);
>>
>> -	list_for_each_entry(bridge, &bridge_list, list) {
>> -		if (bridge->of_node =3D=3D np) {
>> -			mutex_unlock(&bridge_lock);
>> -			return bridge;
>> -		}
>> -	}
>> +	drm_bridge_put(bridge);
>
> And if it does make sense to keep that patch, we should add a comment
> here to document why we are doing this.

OK, what about:

/**
 * We need to emulate the original semantice of of_drm_find_bridge(), which
 * was not getting any bridge reference. Being now based on
 * drm_of_find_bridge() which gets a reference, put it before returning.
 */

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
