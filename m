Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CFCBE351
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 15:11:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC1D10E4FD;
	Mon, 15 Dec 2025 14:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OECsWx7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FC110E4FD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 14:11:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5646E1A21DB;
 Mon, 15 Dec 2025 14:11:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 239FE60664;
 Mon, 15 Dec 2025 14:11:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 29A8E119422E6; Mon, 15 Dec 2025 15:11:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765807895; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GaZqoyrRFDKWBlOXglMrXMF3qjcnoMmJDluDUgIWSsM=;
 b=OECsWx7FHMnHsTiEWe95R0X/rhnlkHzsoat62TNpnal1UtUfmgJoK+UlcEImBZgrSUQtgX
 Bi9L17rvGG0VuUJzYZe3q3F4eFbnSJmWkhqJI367VXOnYnd0WY8N3Ax4UR1sXRBMm9Qkps
 dmoQYyFlkhiuBEQ/S81gcoBkIcia9w+KtvGl3ip4onRDdQzp5jTshjZfm+I+AmpNCYWSTa
 JPygNzOrYXSqmHWUHMdEJdUk+ny/dxFJWUJkRFOEt8n48AdXIeerW9K8zEwP8oFZn/s1nU
 aM+k80qaA7tqbrbCCFJmzHEp2J1aHWwdvkr7gPEk7XG54Ovqe2ESMRR92HxtdA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 15:11:21 +0100
Message-Id: <DEYUNHVYCKYJ.2HU878WBYCJMV@bootlin.com>
Subject: Re: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
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
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
 <hs44z4b2dgisemuewgtvl4epjcqqilg6cy36po25pubaog4hmq@33qgl4o3hwoa>
 <DEH2CVQV21Z2.25PJBAQAKFJSG@bootlin.com>
 <20251201-thick-jasmine-oarfish-1eceb0@houat>
 <DEVKQWH8GU0D.2NWQ1U7IOIEHI@bootlin.com>
 <DEW6XHD12EY4.1THDR9UMJOTAN@bootlin.com>
 <20251215-mottled-dexterous-marmot-c69ad3@penduick>
In-Reply-To: <20251215-mottled-dexterous-marmot-c69ad3@penduick>
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

On Mon Dec 15, 2025 at 11:35 AM CET, Maxime Ripard wrote:
[...]
>> > Additionally, as a matter of fact there are currently drivers storing
>> > bridge pointers. The next_bridge is the most common case. Code using
>> > drm_bridge_connector_init() for example can store up to eight of them,=
 but
>> > individual drivers are the hardest to hunt for.
>> >
>> > I can see these (potential) tools to handle this (not mutually exclusi=
ve):
>> >
>> >  1. remove drm_bridge pointers pointing to other bridges
>> >  2. check whether a bridge (say B) still exists before any dereference
>> >     to B->another_bridge: that's drm_bridge_enter/exit()
>> >  3. let owners of bridge pointers be notified when a bridge is unplugg=
ed,
>> >     so they can actively put their reference and clear their pointer
>> >
>> > For item 1, I think the drm_of_bridge_attach() idea quoted above would
>> > work, at least for the simple cases where bridge drivers use the
>> > next_bridge only for attach. A next_bridge pointer in struct drm_bridg=
e is
>> > not even needed in that case, the pointer would be computed from OF wh=
en
>> > needed and not stored. I can do an experiment and send a first series,=
 do
>> > you think it would be useful?
>>
>> I had a look and, while the implementation should be simple, only a few
>> drivers could benefit right now. The majority fall into one of these
>> categories:
>>
>>  * drivers using drm_of_find_panel_or_bridge() or *_of_get_bridge()
>>    (maybe 60-80% of all drivers, those will have to wait for the panel
>>    improvements)
>>  * drivers using the next_bridge pointer for more than just attach
>>  * drivers doing more complicated stuff
>>
>> I think your "put next_bridge in __drm_bridge_free" idea would fit well =
the
>> 2nd category and perhaps also the 1st one. For the 3rd category we'd nee=
d
>> something different, e.g. a per-driver .destroy callback.
>
> Yep, that's fine. We should optimize for the common case, with an escape
> hatch. That's exactly what we are talking about here.

Not sure why, but it's taking a while before I grasp your ideas about this
series and meld them with mine. I hopefully got a clear POV now, so based
on it my plan is to rework this series to:

 * keep drm_of_find_bridge() but renamed to of_drm_get_bridge(), and keep
   patches 1-5 (with the changes suggested by you and Louis, nothing big
   and all already sent in v2)
 * not add devm_drm_of_find_bridge()
 * add next_bridge pointer to struct drm_bridge and call
   drm_bridge_put(bridge->next_bridge) in __drm_bridge_free, document it
 * convert patches 7-26 to use bridge->next_bridge where applicable,
   or to do something different when needed
 * maybe remove part of patches 7-26 just to reduce spam and rework effort
   in case of further iterations, to send them separately once the approach
   is accepted

Does it look OK?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
