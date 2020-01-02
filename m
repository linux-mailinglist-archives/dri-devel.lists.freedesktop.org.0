Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF32612E2D7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 06:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDD9899B5;
	Thu,  2 Jan 2020 05:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2B4EB899B5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 05:46:19 +0000 (UTC)
X-UUID: 7b6cdbb6c8be41ba97b2355f4cad766b-20200102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IG2tyrpeNx9yyPt33Qko2hevHTaK1+2NS/W2pIy+XKo=; 
 b=QVTVqZWDGUfsAxtQwNt69C2c+U7+hNW8LizIo6jAt/ttHGydX37MAZCct0DevQ7iSdihP9L6PCdfSjm9tPE/TgUv2iytevShmxvY/e3b2l1HjXZ+RI0cFgeUmP2M7WBTsuouCbBQlRZvpfqERQG4YeknA6SY5c9kxQ25RInKmeU=;
X-UUID: 7b6cdbb6c8be41ba97b2355f4cad766b-20200102
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 7477676; Thu, 02 Jan 2020 13:46:09 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 13:44:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 13:45:26 +0800
Message-ID: <1577943967.24650.12.camel@mtksdaap41>
Subject: Re: [PATCH v6, 14/14] drm/mediatek: add support for mediatek SOC
 MT8183
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Thu, 2 Jan 2020 13:46:07 +0800
In-Reply-To: <1577937624-14313-15-git-send-email-yongqiang.niu@mediatek.com>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
 <1577937624-14313-15-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 28683DAAFC551684F3E1FC34F20358448C73EAFC4041B0F9EFC155F340F1E3992000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Yongqiang:

On Thu, 2020-01-02 at 12:00 +0800, Yongqiang Niu wrote:
> This patch add support for mediatek SOC MT8183
> 1.ovl_2l share driver with ovl
> 2.rdma1 share drive with rdma0, but fifo size is different
> 3.add mt8183 mutex private data, and mmsys private data
> 4.add mt8183 main and external path module for crtc create
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 18 +++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  6 +++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c   | 69 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h   |  1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 48 ++++++++++++++++++++++
>  5 files changed, 142 insertions(+)
> 

[snip]

> +
> +
>  static int mtk_drm_kms_init(struct drm_device *drm)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> @@ -449,12 +477,22 @@ static void mtk_drm_unbind(struct device *dev)
>  	  .data = (void *)MTK_DISP_OVL },
>  	{ .compatible = "mediatek,mt8173-disp-ovl",
>  	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8183-disp-ovl",
> +	  .data = (void *)MTK_DISP_OVL },
> +	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
> +	  .data = (void *)MTK_DISP_OVL_2L },
>  	{ .compatible = "mediatek,mt2701-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-rdma",
>  	  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8183-disp-rdma",
> +	  .data = (void *)MTK_DISP_RDMA },
> +	{ .compatible = "mediatek,mt8183-disp-rdma1",

"mediatek,mt8183-disp-rdma1" does not exist in binding document.

Regards,
CK

> +	  .data = (void *)MTK_DISP_RDMA },
>  	{ .compatible = "mediatek,mt8173-disp-wdma",
>  	  .data = (void *)MTK_DISP_WDMA },
> +	{ .compatible = "mediatek,mt8183-disp-ccorr",
> +	  .data = (void *)MTK_DISP_CCORR },
>  	{ .compatible = "mediatek,mt2701-disp-color",
>  	  .data = (void *)MTK_DISP_COLOR },
>  	{ .compatible = "mediatek,mt8173-disp-color",
> @@ -463,22 +501,30 @@ static void mtk_drm_unbind(struct device *dev)
>  	  .data = (void *)MTK_DISP_AAL},
>  	{ .compatible = "mediatek,mt8173-disp-gamma",
>  	  .data = (void *)MTK_DISP_GAMMA, },
> +	{ .compatible = "mediatek,mt8183-disp-dither",
> +	  .data = (void *)MTK_DISP_DITHER },
>  	{ .compatible = "mediatek,mt8173-disp-ufoe",
>  	  .data = (void *)MTK_DISP_UFOE },
>  	{ .compatible = "mediatek,mt2701-dsi",
>  	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt8173-dsi",
>  	  .data = (void *)MTK_DSI },
> +	{ .compatible = "mediatek,mt8183-dsi",
> +	  .data = (void *)MTK_DSI },
>  	{ .compatible = "mediatek,mt2701-dpi",
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8173-dpi",
>  	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8183-dpi",
> +	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt2701-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt2712-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt8173-disp-mutex",
>  	  .data = (void *)MTK_DISP_MUTEX },
> +	{ .compatible = "mediatek,mt8183-disp-mutex",
> +	  .data = (void *)MTK_DISP_MUTEX },
>  	{ .compatible = "mediatek,mt2701-disp-pwm",
>  	  .data = (void *)MTK_DISP_BLS },
>  	{ .compatible = "mediatek,mt8173-disp-pwm",
> @@ -672,6 +718,8 @@ static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
>  	  .data = &mt2712_mmsys_driver_data},
>  	{ .compatible = "mediatek,mt8173-mmsys",
>  	  .data = &mt8173_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8183-mmsys",
> +	  .data = &mt8183_mmsys_driver_data},
>  	{ }
>  };
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
