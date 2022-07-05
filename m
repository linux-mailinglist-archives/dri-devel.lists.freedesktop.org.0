Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC82566943
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69FE10F14E;
	Tue,  5 Jul 2022 11:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9628410FA9A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 06:58:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D54761532;
 Tue,  5 Jul 2022 06:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74F2C341CD;
 Tue,  5 Jul 2022 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657004325;
 bh=wtCX0mhuv6OWF5JECPvFl2ihKCo2T2AiGHFIg2o0AzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nUr54vnD8SejPfoxdafHuCuojZ0XoEd3MsOh1GnmfpjoFlNDTtd/vJ+ZvYwpm4IyG
 cttENLMUPiUAlGVx0K1mluiO4qeMh0a/RG/d4nVgp37ERs1e85jrzcSgkD6YNyAkSu
 PToZ7HQamkL0m9KnfTo5NEh+qf54PkQ9dNorWomy9XTmSGLBkBQY4mkpvjgYD0uzLs
 YN+FfvMJbJP2t5RoB0E/5IQZ/w5KFY6U2ItkqyAdvjjgWmFBipF7qevYDtTUsvwKj1
 0x6ZdiBbS7Fnnm4NuBflSb7aM+9RE0+wN2u64N96nykywWvTQl8Uko4baItw5Psy37
 PzNnkw6tyc40w==
Date: Tue, 5 Jul 2022 12:28:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v12 1/1] phy: phy-mtk-dp: Add driver for DP phy
Message-ID: <YsPhH1sXiT/+unbj@matsya>
References: <20220624062725.4095-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624062725.4095-1-rex-bc.chen@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 airlied@linux.ie, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 chunfeng.yun@mediatek.com, msp@baylibre.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24-06-22, 14:27, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This is a new driver that supports the integrated DisplayPort phy for
> mediatek SoCs, especially the mt8195. The phy is integrated into the
> DisplayPort controller and will be created by the mtk-dp driver. This
> driver expects a struct regmap to be able to work on the same registers
> as the DisplayPort controller. It sets the device data to be the struct
> phy so that the DisplayPort controller can easily work with it.
> 
> The driver does not have any devicetree bindings because the datasheet
> does not list the controller and the phy as distinct units.
> 
> The interaction with the controller can be covered by the configure
> callback of the phy framework and its displayport parameters.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

-- 
~Vinod
