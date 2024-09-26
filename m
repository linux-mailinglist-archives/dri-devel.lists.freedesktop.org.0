Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA998706B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298A510EB88;
	Thu, 26 Sep 2024 09:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="c5d60WBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9ED10EB75
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727343592;
 bh=TDiXybMeYtcjqjBx92AhyDoKNyIG5PotfOZAabaX1Gw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c5d60WBkFGQ5Akzoc/3uBQvHv1XDYHqt+L6fd+vwLMzBBq7UyumanL8oemFcKR+hC
 qA4ViIZHHhqPYszePwYdkE/dKfYbFRAeCC0RqRy9BwqnkkOp4p6Is+BcgshOjRZiqN
 YXNU3dsDAidYj28SV846xUFQ7kXBNqjADZCJnbTzGCN0Cs2EVbr+7K8zokSI8jRksP
 aciFZdCUEh5kzI/uFJ7QNvFkdTe9dNYXoSKY3tSIiIujXrfUOo95HZr74habGRxVZU
 T59unfzI7Lv7SWJDWhigLdnkAh6ys+O5c0AMrOeYt+SZSdy5GqLxatfIBzHgjll7hw
 E0t8U8Vo7zwvQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A3F217E10AF;
 Thu, 26 Sep 2024 11:39:51 +0200 (CEST)
Message-ID: <9f637af5-9836-487a-88b6-1d1ac46e6976@collabora.com>
Date: Thu, 26 Sep 2024 11:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm: constify read-only regmap structs
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 25/09/24 17:42, Javier Carrasco ha scritto:
> This series adds the const modifier to the remaining regmap_bus and
> regmap_config structs under drm/ that are effectively used as const
> (i.e., only read after their declaration), but kept ad writtable data.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Javier Carrasco (6):
>        drm/bridge: dpc3433: Constify struct regmap_config
>        drm/fsl-dcu: Constify struct regmap_config
>        drm/mediatek: dp: Constify struct regmap_config
>        drm/meson: Constify struct regmap_config
>        drm/panel: ili9322: Constify struct regmap_bus
>        drm/sprd: Constify struct regmap_bus
> 
>   drivers/gpu/drm/bridge/ti-dlpc3433.c         | 2 +-
>   drivers/gpu/drm/fsl-dcu/fsl_tcon.c           | 2 +-
>   drivers/gpu/drm/mediatek/mtk_dp.c            | 2 +-
>   drivers/gpu/drm/meson/meson_drv.c            | 2 +-
>   drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
>   drivers/gpu/drm/sprd/sprd_dsi.c              | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
> ---
> base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
> change-id: 20240925-drm-const-regmap-307f2c358d10
> 
> Best regards,


