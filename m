Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C116D46FE99
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 11:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B4110E3A4;
	Fri, 10 Dec 2021 10:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD2610E3A4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 10:17:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8F6441F4709E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639131468; bh=Gjv8pg77wAZyx6FV9xWPNtCyByurMxg6U07KqvM1fqo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ODmsPABiBeHD9ryRiRsKqYvoOLjFkrf37+cM12Q+/qOrTPyAHT5tDzYjzPztfv7h7
 6ZuxRLiPfUCS/jdP6+D8QZqEp2Tm7Z/mEM7oxGgbN1+mc2ON3/u1dnmbonnifIOpWd
 GdEkYJq3aE5UosKSAQP2lngcpf2RjejnVSYaYo+RNNGk8FdbxYydCG5MC+PTFf3q7O
 oNoh1FTPvQWXNcDaPWmtBMzKHpS1GgAa8Z1n75qah1vZzLMIWcyyBrtTaf0SbnreEb
 SYlI6p/Ful7B/1LgJoDoXcoxeuI3aK5ScEnUvQbitFYzeYzDbEEzN1hE8O9vVcI0yv
 MxSCAIw7FE6BA==
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: Guillaume Ranquet <granquet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b307d567-774b-ca9e-d7d7-09846782c988@collabora.com>
Date: Fri, 10 Dec 2021 11:17:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110130623.20553-8-granquet@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/11/21 14:06, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC and a
> according phy driver mediatek-dp-phy.
> 
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so that
> both can work with the same register range. The phy driver sets device
> data that is read by the parent to get the phy device that can be used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reported-by: kernel test robot <lkp@intel.com>

Hello Markus, Guillaume,

there is a critical issue with this patch. Please check below.

> ---
>   drivers/gpu/drm/drm_edid.c              |    2 +-
>   drivers/gpu/drm/mediatek/Kconfig        |    7 +
>   drivers/gpu/drm/mediatek/Makefile       |    2 +
>   drivers/gpu/drm/mediatek/mtk_dp.c       | 3094 +++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h   |  568 +++++
>   drivers/gpu/drm/mediatek/mtk_dpi.c      |  111 +-
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   26 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |    1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |    1 +
>   9 files changed, 3799 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 

<snip>

> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 384074f69111b..e6e88e3cd811d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c

<snip>

> @@ -979,6 +1051,16 @@ static int mtk_dpi_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	dpi->dpi_ck_cg = devm_clk_get(dev, "ck_cg");

mtk_dpi is used on MT2701, MT7183, MT8183, MT8192, but these platforms haven't
got any "ck_cg" clock defined in their device-trees (regardless of whether these
can support adding this clock or not, any code change shall be retro-compatible
hence not breaking compatibility/functionality with older device-trees).

Reminding that:
- mediatek-drm uses the component framework
- mtk_drm_drv is the component master
- mtk_drm_drv bind() won't be called unless all of the components added with
   match aren't calling component_add()

... this change not only breaks DisplayPort support for *all* of the
aforementioned SoCs, but also makes the entire mediatek-drm to not finish
probing, producing a global breakage that also includes DSI and the entire
stack of components of that master (so, no display on all of them).

To avoid breaking any SoC that's not MT8195, please use devm_clk_get_optional()
here in the next version.

Thanks,
- Angelo

