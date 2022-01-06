Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3930648620E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 10:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB7910EEF1;
	Thu,  6 Jan 2022 09:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC9010EEF1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 09:24:13 +0000 (UTC)
X-UUID: 945a0748c908428b9978267c7bd64838-20220106
X-UUID: 945a0748c908428b9978267c7bd64838-20220106
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 467672720; Thu, 06 Jan 2022 17:24:09 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 17:24:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 17:24:07 +0800
Message-ID: <3a1bffc6f677ef9790749a366424fe5effda90f7.camel@mediatek.com>
Subject: Re: [PATCH 2/4] phy: mediatek: phy-mtk-hdmi: Reorder to remove
 forward declarations
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
Date: Thu, 6 Jan 2022 17:24:07 +0800
In-Reply-To: <20220103153055.50473-2-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
 <20220103153055.50473-2-angelogioacchino.delregno@collabora.com>
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
> Forward declarations for mtk_hdmi_power_{on,off} aren't necessary:
> move mtk_hdmi_phy_dev_ops down to remove forward declarations.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c
> b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index 707e90691e6e..b4193cb4e4e3 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -6,15 +6,6 @@
>  
>  #include "phy-mtk-hdmi.h"
>  
> -static int mtk_hdmi_phy_power_on(struct phy *phy);
> -static int mtk_hdmi_phy_power_off(struct phy *phy);
> -
> -static const struct phy_ops mtk_hdmi_phy_dev_ops = {
> -	.power_on = mtk_hdmi_phy_power_on,
> -	.power_off = mtk_hdmi_phy_power_off,
> -	.owner = THIS_MODULE,
> -};
> -
>  inline struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw)
>  {
>  	return container_of(hw, struct mtk_hdmi_phy, pll_hw);
> @@ -43,6 +34,12 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
>  	return 0;
>  }
>  
> +static const struct phy_ops mtk_hdmi_phy_dev_ops = {
> +	.power_on = mtk_hdmi_phy_power_on,
> +	.power_off = mtk_hdmi_phy_power_off,
> +	.owner = THIS_MODULE,
> +};
> +
>  static const struct phy_ops *
>  mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
>  {
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot


