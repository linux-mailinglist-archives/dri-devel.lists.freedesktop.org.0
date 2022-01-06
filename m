Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE23486206
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 10:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED9110EE00;
	Thu,  6 Jan 2022 09:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F401110EE00
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 09:22:13 +0000 (UTC)
X-UUID: b3e22089bfdc4e59bd7f55b3e4185847-20220106
X-UUID: b3e22089bfdc4e59bd7f55b3e4185847-20220106
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 234049823; Thu, 06 Jan 2022 17:22:10 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 6 Jan 2022 17:22:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 6 Jan 2022 17:22:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 17:22:05 +0800
Message-ID: <c3773ed47126bf3810bc7d78e3ec293f144ccd7f.camel@mediatek.com>
Subject: Re: [PATCH 3/4] phy: mediatek: phy-mtk-hdmi: Reorder and stop
 implicit header inclusion
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
Date: Thu, 6 Jan 2022 17:22:05 +0800
In-Reply-To: <20220103153055.50473-3-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
 <20220103153055.50473-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, linux-phy@lists.infradead.org, vkoul@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-01-03 at 16:30 +0100, AngeloGioacchino Del Regno wrote:
> All the headers for phy-mtk-{hdmi,hdmi-mt2701,hdmi-mt8183}.c were
> included from phy-mtk-mipi-dsi.h, but this isn't optimal: in order to
> increase readability and sensibly reduce build times, the inclusions
> should be done per-file, also avoiding to include unused headers and
> should not be implicit.
> 
> For this reason, move the inclusions to each file and remove unused
> ones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c |  5 +++++
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c |  5 +++++
>  drivers/phy/mediatek/phy-mtk-hdmi.c        |  8 ++++++++
>  drivers/phy/mediatek/phy-mtk-hdmi.h        | 10 +---------
>  4 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> index 09e0dd7499d8..270c5f538483 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> @@ -4,6 +4,11 @@
>   * Author: Chunhui Dai <chunhui.dai@mediatek.com>
>   */
>  
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
>  #include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0	0x00
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> index e317bf4a9db9..87ba9a3687b7 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> @@ -4,6 +4,11 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
>  #include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0		0x00
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c
> b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index b4193cb4e4e3..e037fa89696c 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -4,6 +4,14 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/phy/phy.h>
>  #include "phy-mtk-hdmi.h"
>  
>  inline struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw)
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h
> b/drivers/phy/mediatek/phy-mtk-hdmi.h
> index a0571271d730..ef81e44a235d 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.h
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
> @@ -6,17 +6,9 @@
>  
>  #ifndef _MTK_HDMI_PHY_H
>  #define _MTK_HDMI_PHY_H
> -#include <linux/clk.h>
> +
>  #include <linux/clk-provider.h>
> -#include <linux/delay.h>
> -#include <linux/io.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/module.h>
> -#include <linux/of_device.h>
> -#include <linux/phy/phy.h>
> -#include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -#include <linux/types.h>
Please do not move common headers also into .c files

>  
>  struct mtk_hdmi_phy;
>  

