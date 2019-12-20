Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B17127384
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 03:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DE46EBC0;
	Fri, 20 Dec 2019 02:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id C58296EBC1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 02:31:34 +0000 (UTC)
X-UUID: f5834c6bd09d40488397a6f23fb5c96a-20191220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tEcYWZijm0bFlilOapxtQzBH1rfZ6D9Bauhv1QIh7Vg=; 
 b=clAgRfNyFTyTFk79VIddsNZ7aJKg/p7C5f3zJYXo4rIXg6Igl33jXmhZO+Xyw2MYWUBSwQtmXc8NKulEn4EXPKWwY9hweN3mblAK0JCVvvITO9T68j4cQe1jaPTTNwCtOwt5KIthf2o2DGKqDi3W6wG5rPh2LRwSm3alOwK30KU=;
X-UUID: f5834c6bd09d40488397a6f23fb5c96a-20191220
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1690303834; Fri, 20 Dec 2019 10:31:31 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 10:31:11 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Dec 2019 10:30:36 +0800
Message-ID: <1576809089.26847.10.camel@mtksdaap41>
Subject: Re: [PATCH 4/4] drm/mediatek: config mipitx impedance with
 calibration data
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Fri, 20 Dec 2019 10:31:29 +0800
In-Reply-To: <20191216082937.119164-5-jitao.shi@mediatek.com>
References: <20191216082937.119164-1-jitao.shi@mediatek.com>
 <20191216082937.119164-5-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 sj.huang@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jitao:

On Mon, 2019-12-16 at 16:29 +0800, Jitao Shi wrote:
> Read calibration data from nvmem, and config mipitx impedance with
> calibration data to make sure their impedance are 100ohm.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  1 +
>  drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 63 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
> index eea44327fe9f..a1b6292145de 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
> +++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.h
> @@ -28,6 +28,7 @@ struct mtk_mipi_tx {
>  	void __iomem *regs;
>  	u32 data_rate;
>  	u32 mipitx_drive;
> +	u32 rt_code[5];
>  	const struct mtk_mipitx_data *driver_data;
>  	struct clk_hw pll_hw;
>  	struct clk *pll;
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> index 124fdf95f1e5..f624516944bb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c
> @@ -5,6 +5,8 @@
>   */
>  
>  #include "mtk_mipi_tx.h"
> +#include <linux/nvmem-consumer.h>
> +#include <linux/slab.h>
>  
>  #define MIPITX_LANE_CON		0x000c
>  #define RG_DSI_CPHY_T1DRV_EN		BIT(0)
> @@ -28,6 +30,7 @@
>  #define MIPITX_PLL_CON4		0x003c
>  #define RG_DSI_PLL_IBIAS		(3 << 10)
>  
> +#define MIPITX_D2P_RTCODE	0x0100
>  #define MIPITX_D2_SW_CTL_EN	0x0144
>  #define MIPITX_D0_SW_CTL_EN	0x0244
>  #define MIPITX_CK_CKMODE_EN	0x0328
> @@ -108,6 +111,64 @@ static const struct clk_ops mtk_mipi_tx_pll_ops = {
>  	.recalc_rate = mtk_mipi_tx_pll_recalc_rate,
>  };
>  
> +static int mtk_mipi_tx_config_calibration_data(struct mtk_mipi_tx *mipi_tx)
> +{
> +	u32 *buf = NULL;

Need not to assign NULL to buf, it would be assigned some value later.

> +	int i, j;
> +	struct nvmem_cell *cell;
> +	struct device *dev = mipi_tx->dev;
> +	size_t len;
> +
> +	cell = nvmem_cell_get(dev, "calibration-data");
> +	if (IS_ERR(cell)) {
> +		dev_warn(dev, "nvmem_cell_get fail\n");

In [1], nvmem is optional property, so I think you should use dev_dbg()
or dev_info().

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2019-December/025640.html

> +		return -EINVAL;

The caller does not process return value, so I think you don't need to
return value.

> +	}
> +
> +	buf = (u32 *)nvmem_cell_read(cell, &len);
> +
> +	nvmem_cell_put(cell);
> +
> +	if (IS_ERR(buf)) {
> +		dev_warn(dev, "can't get data\n");
> +		return -EINVAL;
> +	}
> +
> +	if (len < 3 * sizeof(u32)) {
> +		dev_warn(dev, "invalid calibration data\n");
> +		kfree(buf);
> +		return -EINVAL;
> +	}
> +
> +	mipi_tx->rt_code[0] = ((buf[0] >> 6 & 0x1F) << 5) |

You don't access rt_code[] out of this function, so I think this could
be local variable.

> +			      (buf[0] >> 11 & 0x1F);

Lower case 0x1f.

> +	mipi_tx->rt_code[1] = ((buf[1] >> 27 & 0x1F) << 5) |
> +			      (buf[0] >> 1 & 0x1F);
> +	mipi_tx->rt_code[2] = ((buf[1] >> 17 & 0x1F) << 5) |
> +			      (buf[1] >> 22 & 0x1F);
> +	mipi_tx->rt_code[3] = ((buf[1] >> 7 & 0x1F) << 5) |
> +			      (buf[1] >> 12 & 0x1F);
> +	mipi_tx->rt_code[4] = ((buf[2] >> 27 & 0x1F) << 5) |
> +			      (buf[1] >> 2 & 0x1F);

Why not just save rt_code in nvmem and you don't need to translate here?
If you need to do so, please add description for this.

> +
> +	for (i = 0; i < 5; i++) {
> +		if ((mipi_tx->rt_code[i] & 0x1F) == 0)
> +			mipi_tx->rt_code[i] |= 0x10;
> +
> +		if ((mipi_tx->rt_code[i] >> 5 & 0x1F) == 0)
> +			mipi_tx->rt_code[i] |= 0x10 << 5;
> +
> +		for (j = 0; j < 10; j++) {
> +			mtk_mipi_tx_update_bits(mipi_tx,
> +				MIPITX_D2P_RTCODE * (i + 1) + j * 4,
> +				1, mipi_tx->rt_code[i] >> j & 1);
> +		}

There is only one statement in for-loop, so you could get rid of {}.

Regards,
CK

> +	}
> +
> +	kfree(buf);
> +	return 0;
> +}
> +
>  static void mtk_mipi_tx_power_on_signal(struct phy *phy)
>  {
>  	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
> @@ -130,6 +191,8 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
>  				RG_DSI_HSTX_LDO_REF_SEL,
>  				mipi_tx->mipitx_drive << 6);
>  
> +	mtk_mipi_tx_config_calibration_data(mipi_tx);
> +
>  	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
>  }
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
