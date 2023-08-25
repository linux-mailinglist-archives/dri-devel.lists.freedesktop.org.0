Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B5788685
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B2710E661;
	Fri, 25 Aug 2023 12:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622F210E661
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:01:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C97166323D;
 Fri, 25 Aug 2023 12:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043B1C433C8;
 Fri, 25 Aug 2023 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692964886;
 bh=DkaQY49NCfEp3URelzQqFMcnMc9cI/W/Kd4KxUDsdP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kpxFzYXNwWgfxY8NNYJlMX4BJy36WR3HvNPFBufzFvuc+1G+3dkUXzrHL7ecq6mrA
 S+KFw5hGxzStAZDEnRnBk4WifvWMZuoZBBrcmgn/Dn9+zQa078bUaJyvGrejf9V6X5
 RWyFIhHXbppXCO/spDu7kvAEYcLk29nfQ88Rm6z74iJbixllna1t3ik3LHDEt+IONO
 iesMsfH9UMEvHZ6Z21UZ1aTtRRKDc85QPw8bHHYeUViA3BA3OwHDK67vDf5tgiYaUx
 0I7ShYr0Jd6zDxGifpdP/+pP3ynXQg+ReQY+kywslBe73Q49XNTLzNZqZDjulJNQ1w
 NBTKCDVjyc/KQ==
From: Michael Walle <mwalle@kernel.org>
To: angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v7 09/11] drm/mediatek: dp: Add support for embedded
 DisplayPort aux-bus
Date: Fri, 25 Aug 2023 14:01:09 +0200
Message-Id: <20230825120109.3132209-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-10-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: chunkuang.hu@kernel.org, Michael Walle <mwalle@kernel.org>,
 nfraprado@collabora.com, amergnat@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, ehristev@collabora.com, wenst@chromium.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi AngeloGioacchino,

> For the eDP case we can support using aux-bus on MediaTek DP: this
> gives us the possibility to declare our panel as generic "panel-edp"
> which will automatically configure the timings and available modes
> via the EDID that we read from it.
> 
> To do this, move the panel parsing at the end of the probe function
> so that the hardware is initialized beforehand and also initialize
> the DPTX AUX block and power both on as, when we populate the
> aux-bus, the panel driver will trigger an EDID read to perform
> panel detection.
> 
> Last but not least, since now the AUX transfers can happen in the
> separated aux-bus, it was necessary to add an exclusion for the
> cable_plugged_in check in `mtk_dp_aux_transfer()` and the easiest
> way to do this is to simply ignore checking that when the bridge
> type is eDP.

This patch breaks my board based on the MT8195 which only has one
DisplayPort output port. I suspect it might also break the mt8195-cherry
board.

While the mediatek-dpi driver finds the DP port:
[    3.131645] mediatek-dpi 1c113000.dp-intf: Found bridge node: /soc/dp-tx@1c600000

The probing of the eDP is deferred:
[   13.289009] platform 1c015000.dp-intf: deferred probe pending

So I don't know why, but to make dp_intf1 work, it seems that dp_intf0
must be probed successfully. After this patch, the edp (which is
connected to the dp_intf1) probe will return with an -ENODEV and
the previous call to devm_drm_bridge_add() will be rolled back.

Before this patch, bridge_add() was called in any case (in the
error case with next_bridge = NULL) and the mediatek-dpi probed
like that:

[    3.121011] mediatek-dpi 1c015000.dp-intf: Found bridge node: /soc/edp-tx@1c500000
[    3.122111] mediatek-dpi 1c113000.dp-intf: Found bridge node: /soc/dp-tx@1c600000

Eventually resulting in a framebuffer device:
[    4.451081] mediatek-drm mediatek-drm.8.auto: [drm] fb0: mediatekdrmfb frame buffer device


NB, somehow this series broke the initial display output. I always have
to replug the DisplayPort to get some output. I'll dig deeper into that
later.

..

> @@ -2519,21 +2553,14 @@ static int mtk_dp_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, mtk_dp->irq,
>  				     "failed to request dp irq resource\n");
>  
> -	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> -	if (IS_ERR(mtk_dp->next_bridge) &&
> -	    PTR_ERR(mtk_dp->next_bridge) == -ENODEV)
> -		mtk_dp->next_bridge = NULL;

In my case, this branch was taken.

-michael

> -	else if (IS_ERR(mtk_dp->next_bridge))
> -		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
> -				     "Failed to get bridge\n");
> -
>  	ret = mtk_dp_dt_parse(mtk_dp, pdev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to parse dt\n");
>  
> -	drm_dp_aux_init(&mtk_dp->aux);
>  	mtk_dp->aux.name = "aux_mtk_dp";
> +	mtk_dp->aux.dev = dev;
>  	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
> +	drm_dp_aux_init(&mtk_dp->aux);
>  
>  	spin_lock_init(&mtk_dp->irq_thread_lock);
>  
