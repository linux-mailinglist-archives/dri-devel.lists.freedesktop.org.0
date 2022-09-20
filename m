Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4655BE318
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 12:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817F10E4BA;
	Tue, 20 Sep 2022 10:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA0A10E4BA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 10:25:50 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F07716600368;
 Tue, 20 Sep 2022 11:25:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663669549;
 bh=pJFt8yhuO+61RNQoKu/PstmWS0PBWMsonGq/dnFhPCY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R2oc5TOvtqehwVdIVv4+ZI4lKyrDIUceJdbxMi/4V4X4XDvk3e3SdGay/LYNOYzrC
 DXxdJO5MyIrCLEkMrhjlY1u96S1/affuMfe8RaXDP7nFTXFnZ4MWC3M1xOzBDeK5m8
 lEuvNw5Aggj73VIO/CLscBO+EUrcp+7eCblSGS1sIssmA6ELNjdJebtJWOjsFVDR/j
 uyJbu45SEV9y71RXViboId+7Z/hCjzmzlJV1enTIUR5hQfvCVBwLXemvji4sqsnqRl
 11BEWGHHH9GsllzQ/+5YTNdKLeZ4jQHIN3tTk5EKUrTsggQa9wzRKM5YpE1h9seXu4
 qpub0SjqOUUWg==
Message-ID: <153dcb4f-4583-427e-83c7-bdd33e3b11aa@collabora.com>
Date: Tue, 20 Sep 2022 12:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 07/17] drm/mediatek: extract common functions from the
 mtk hdmi driver
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-7-4844816c9808@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-7-4844816c9808@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
> Create a common "framework" that can be used to add support for
> different hdmi IPs within the mediatek range of products.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index d4d193f60271..008ec69da67b 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -22,7 +22,8 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>   
>   mediatek-drm-hdmi-objs := mtk_cec.o \
>   			  mtk_hdmi.o \

abcd ... mtk_hdmi_common.o goes here :-)

> -			  mtk_hdmi_ddc.o
> +			  mtk_hdmi_ddc.o \
> +			  mtk_hdmi_common.o \
>   
>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 5cd05d4fe1a9..837d36ec4d64 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -32,187 +32,18 @@
>   #include <drm/drm_probe_helper.h>
>   
>   #include "mtk_cec.h"
> -#include "mtk_hdmi.h"
>   #include "mtk_hdmi_regs.h"
> +#include "mtk_hdmi_common.h"
>   
>   #define NCTS_BYTES	7
>   
> -enum mtk_hdmi_clk_id {
> -	MTK_HDMI_CLK_HDMI_PIXEL,
> -	MTK_HDMI_CLK_HDMI_PLL,
> -	MTK_HDMI_CLK_AUD_BCLK,
> -	MTK_HDMI_CLK_AUD_SPDIF,
> -	MTK_HDMI_CLK_COUNT
> +const char * const mtk_hdmi_clk_names_mt8183[MTK_MT8183_HDMI_CLK_COUNT] = {

Why MT8183? This can be either MT8167 or MT2701... or, IMO more appropriately, you
should name the IP version.
Example: MTK_HDMIV123_CLK_COUNT (I don't know what IP version would that be!).

> +	[MTK_MT8183_HDMI_CLK_HDMI_PIXEL] = "pixel",
> +	[MTK_MT8183_HDMI_CLK_HDMI_PLL] = "pll",
> +	[MTK_MT8183_HDMI_CLK_AUD_BCLK] = "bclk",
> +	[MTK_MT8183_HDMI_CLK_AUD_SPDIF] = "spdif",
>   };
>   

Regards,
Angelo


