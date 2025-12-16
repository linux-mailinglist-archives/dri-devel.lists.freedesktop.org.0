Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86737CC454C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 17:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E8C10E846;
	Tue, 16 Dec 2025 16:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Hxcp1qe0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409E010E81C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 16:36:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 009034E41C33;
 Tue, 16 Dec 2025 16:36:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A76266071C;
 Tue, 16 Dec 2025 16:36:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F316C119A904B; Tue, 16 Dec 2025 17:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765902982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PzhR0G4mBnm/z0O1Hfgh44ISCPhT1HMJphLOZLV+TY0=;
 b=Hxcp1qe0jp9L+ZP5B2CcjRugnzvNJMFJ/9uLnc/dPwH5UC2kAbZKmRyiMLwCIMY3l1rGeB
 r1i0PJRzjjFJ9grjtuxiAKvLXLVgaYVMvrqPir01kIYE5+3GlMEUdCh/SeWGh8FfSmc4dD
 BQCAl/r7vtgA55arSrrcGj571k5Y7jabJyHmtN3hyRh7HvY9LH9G+IEVTIcBK5YF8EbLdi
 mePmspCgWnZbPbX9OJXUW7hcaIiZlm5vXCzrPfRFRz3YSxNhCgjgDAJf2WLsdzNMJz7Sdl
 go01yz6G44JOyfuUCxKxAYqzeeuqGpt1lByELY1A2jHL5QL1gBe/telVFa0/Cw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 17:36:07 +0100
Message-Id: <DEZSCVYVCZ71.1BRL4LGVYAZAX@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
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
X-Mailer: aerc 0.20.1
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
 <hs44z4b2dgisemuewgtvl4epjcqqilg6cy36po25pubaog4hmq@33qgl4o3hwoa>
 <DEH2CVQV21Z2.25PJBAQAKFJSG@bootlin.com>
 <20251201-thick-jasmine-oarfish-1eceb0@houat>
 <DEVKQWH8GU0D.2NWQ1U7IOIEHI@bootlin.com>
 <DEW6XHD12EY4.1THDR9UMJOTAN@bootlin.com>
 <20251215-mottled-dexterous-marmot-c69ad3@penduick>
 <DEYUNHVYCKYJ.2HU878WBYCJMV@bootlin.com>
 <20251216-cute-bandicoot-of-authority-3c492a@penduick>
In-Reply-To: <20251216-cute-bandicoot-of-authority-3c492a@penduick>
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

On Tue Dec 16, 2025 at 2:49 PM CET, Maxime Ripard wrote:
[...]
>> Not sure why, but it's taking a while before I grasp your ideas about th=
is
>> series and meld them with mine. I hopefully got a clear POV now, so base=
d
>> on it my plan is to rework this series to:
>>
>>  * keep drm_of_find_bridge() but renamed to of_drm_get_bridge(), and kee=
p
>>    patches 1-5 (with the changes suggested by you and Louis, nothing big
>>    and all already sent in v2)
>
> I don't think we should use that name, but on principle, yes.

OK about the rename. I just had sent this email before you requested the
rename. v3 is in the works with the of_drm_find_and_get_bridge() name.

>>  * not add devm_drm_of_find_bridge()
>
> Yep.
>
>>  * add next_bridge pointer to struct drm_bridge and call
>>    drm_bridge_put(bridge->next_bridge) in __drm_bridge_free, document it
>
> We don't have to at this point, you can add next_bridge to the
> drm_bridge pointer if you want, but I don't consider it a prerequisite.
> If we don't we would have to create drm_bridge_funcs->destroy
> implemnentations to give up the driver pointer reference though. Your
> call.

There's a destroy finc already, so I'm adding the next_bridge pointer in v3
along with some driver conversions, including one where the destroy hook is
needed.

>>  * convert patches 7-26 to use bridge->next_bridge where applicable,
>>    or to do something different when needed
>
> Depending on your decision above, we'd need to either convert them to
> use drm_bridge->next_bridge or create a destroy hook for them. Either
> way is fine for me.
>
>>  * maybe remove part of patches 7-26 just to reduce spam and rework effo=
rt
>>    in case of further iterations, to send them separately once the appro=
ach
>>    is accepted
>>
>> Does it look OK?

Cool, thanks for acking. v3 is just a testing round away from being sent.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
