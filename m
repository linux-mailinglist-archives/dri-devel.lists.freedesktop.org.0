Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EA119A5C8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F7A6E8E2;
	Wed,  1 Apr 2020 07:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Wed, 01 Apr 2020 02:21:07 UTC
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E06F6E8C9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 02:21:07 +0000 (UTC)
X-UUID: 6749501c1f56470d871025ad78d58ae8-20200401
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AVMXu0r+6z6IDu7t/jy3++IgcoN/EedNyjzmILOaaOM=; 
 b=jySO1VftyI+JCu8nT4nnSfsW2nEJaszEKy8KiKELtSvTD3NbnH5XWKNBmJKAG0zdwAYECn/kMruS+BtYbBWPZx+usJpVeC2Z8JJ4UktjDMvRzaR3C7ZFSdRjHVkqJsXMlIA6P7bO+3jucbnhuRMibqphX7GQJDdcFl5golmY8YA=;
X-UUID: 6749501c1f56470d871025ad78d58ae8-20200401
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1896337754; Wed, 01 Apr 2020 10:16:01 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 1 Apr 2020 10:15:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 1 Apr 2020 10:15:54 +0800
Message-ID: <1585707361.28859.19.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/4] drm/mediatek: Move tz_disabled from mtk_hdmi_phy
 to mtk_hdmi driver
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 1 Apr 2020 10:16:01 +0800
In-Reply-To: <20200331155728.18032-2-chunkuang.hu@kernel.org>
References: <20200331155728.18032-1-chunkuang.hu@kernel.org>
 <20200331155728.18032-2-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Wed, 01 Apr 2020 07:03:42 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-03-31 at 23:57 +0800, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> tz_disabled is used to control mtk_hdmi output signal, but this variable
> is stored in mtk_hdmi_phy and mtk_hdmi_phy does not use it. So move
> tz_disabled to mtk_hdmi where it's used.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           | 22 ++++++++++++++++---
>  drivers/gpu/drm/mediatek/mtk_hdmi_phy.h       |  1 -
>  .../gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c    |  1 -
>  3 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 5e4a4dbda443..878433c09c9b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -144,11 +144,16 @@ struct hdmi_audio_param {
>  	struct hdmi_codec_params codec_params;
>  };
>  
> +struct mtk_hdmi_conf {
> +	bool tz_disabled;
> +};
> +
>  struct mtk_hdmi {
>  	struct drm_bridge bridge;
>  	struct drm_bridge *next_bridge;
>  	struct drm_connector conn;
>  	struct device *dev;
> +	const struct mtk_hdmi_conf *conf;
>  	struct phy *phy;
>  	struct device *cec_dev;
>  	struct i2c_adapter *ddc_adpt;
> @@ -230,7 +235,6 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
>  static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
>  {
>  	struct arm_smccc_res res;
> -	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(hdmi->phy);
>  
>  	/*
>  	 * MT8173 HDMI hardware has an output control bit to enable/disable HDMI
> @@ -238,7 +242,7 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
>  	 * The ARM trusted firmware provides an API for the HDMI driver to set
>  	 * this control bit to enable HDMI output in supervisor mode.
>  	 */
> -	if (hdmi_phy->conf && hdmi_phy->conf->tz_disabled)
> +	if (hdmi->conf->tz_disabled)
>  		regmap_update_bits(hdmi->sys_regmap,
>  				   hdmi->sys_offset + HDMI_SYS_CFG20,
>  				   0x80008005, enable ? 0x80000005 : 0x8000);
> @@ -1688,6 +1692,7 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	hdmi->dev = dev;
> +	hdmi->conf = of_device_get_match_data(dev);
>  
>  	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
>  	if (ret)
> @@ -1765,8 +1770,19 @@ static int mtk_hdmi_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
>  			 mtk_hdmi_suspend, mtk_hdmi_resume);
>  
> +static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
> +	.tz_disabled = true,
> +};
> +
> +static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173;
> +
>  static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
> -	{ .compatible = "mediatek,mt8173-hdmi", },
> +	{ .compatible = "mediatek,mt2701-hdmi",
> +	  .data = &mtk_hdmi_conf_mt2701,
> +	},
> +	{ .compatible = "mediatek,mt8173-hdmi",
> +	  .data = &mtk_hdmi_conf_mt8173,
> +	},
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> index 2d8b3182470d..fc1c2efd1128 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> @@ -20,7 +20,6 @@
>  struct mtk_hdmi_phy;
>  
>  struct mtk_hdmi_phy_conf {
> -	bool tz_disabled;
>  	unsigned long flags;
>  	const struct clk_ops *hdmi_phy_clk_ops;
>  	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> index d3cc4022e988..99fe05cd3598 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> @@ -237,7 +237,6 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
>  }
>  
>  struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf = {
> -	.tz_disabled = true,
>  	.flags = CLK_SET_RATE_GATE,
>  	.hdmi_phy_clk_ops = &mtk_hdmi_phy_pll_ops,
>  	.hdmi_phy_enable_tmds = mtk_hdmi_phy_enable_tmds,

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
