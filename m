Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B785AA9A3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 10:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1D710E7AD;
	Fri,  2 Sep 2022 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41E810E7AD
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 08:13:03 +0000 (UTC)
X-UUID: 37504edb850e4dd3b22b64b5035469d2-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pmqfNQ1rpSeqmCSW/up+Y4xTBOUZWeAGJ2HY4TQtBp0=; 
 b=e13T1U9lGIdmAkrOiO4XQDMmBRxykHPpm9sdzfEz+Jf+pxwYKCZkEnciIbPSd8ka34sPW5Pm9gOcYq4LS0zIjvXfZGrmvAxCPCtjZ1JGJpovhtidP3IlS670Zf1r4o5GfGXVfvVLWnw9Lew4sZI9j11CQDu3udnPV/+MTzaZocI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:8f06a197-a854-47fc-9b6c-94c5aaa9d327, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:88556fd0-20bd-4e5e-ace8-00692b7ab380,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 37504edb850e4dd3b22b64b5035469d2-20220902
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1358333265; Fri, 02 Sep 2022 16:13:00 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 16:12:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 2 Sep 2022 16:12:59 +0800
Message-ID: <fa57b7e392ce8dac005dd572963a8844a7070007.camel@mediatek.com>
Subject: Re: [PATCH v17 09/10] drm/mediatek: dp: Add hpd debounce
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Fri, 2 Sep 2022 16:12:58 +0800
In-Reply-To: <20220901044149.16782-10-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <20220901044149.16782-10-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Thu, 2022-09-01 at 12:41 +0800, Bo-Chen Chen wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> From the DP spec 1.4a chapter 3.3, upstream devices should implement
> HPD signal de-bouncing on an external connection.
> A period of 100ms should be used to detect an HPD connect event.
> To cover these cases, HPD de-bounce should be implemented only after
> HPD low has been detected for at least 100ms.
> 
> Therefore,
> 1. If HPD is low (which means plugging out) for longer than 100ms:
>    we need to do de-bouncing (which means we need to wait for 100ms).
> 2. If HPD low is for less than 100ms:
>    we don't need to care about the de-bouncing.
> 
> In this patch, we start a 100ms timer and use a need_debounce boolean
> to implement the feature.
> 
> Two cases when HPD is high:
> 1. If the timer is expired (>100ms):
>    - need_debounce is true.
>    - When HPD high (plugging event comes), need_debounce will be true
>      and then we need to do de-bouncing (wait for 100ms).
> 2. If the timer is not expired (<100ms):
>    - need_debounce is false.
>    - When HPD high (plugging event comes), need_debounce will be
> false
>      and no need to do de-bouncing.
> 
> HPD_______             __________________
>           |            |<-  100ms   ->
>           |____________|
>           <-  100ms   ->
> 
> Without HPD de-bouncing, USB-C to HDMI Adapaters will not be
> detected.
> 
> The change has been successfully tested with the following devices:
> - Dell Adapter - USB-C to HDMI
> - Acer 1in1 HDMI dongle
> - Ugreen 1in1 HDMI dongle
> - innowatt HDMI + USB3 hub
> - Acer 2in1 HDMI dongle
> - Apple 3in1 HDMI dongle (A2119)
> - J5Create 3in1 HDMI dongle (JAC379)

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Tested-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 11a94927c0d0..dd34dae417e5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -87,6 +87,7 @@ struct mtk_dp_efuse_fmt {
>  
>  struct mtk_dp {
>  	bool enabled;
> +	bool need_debounce;
>  	u8 max_lanes;
>  	u8 max_linkrate;
>  	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
> @@ -109,6 +110,7 @@ struct mtk_dp {
>  	struct platform_device *phy_dev;
>  	struct phy *phy;
>  	struct regmap *regs;
> +	struct timer_list debounce_timer;
>  };
>  
>  struct mtk_dp_data {
> @@ -1475,14 +1477,24 @@ static irqreturn_t
> mtk_dp_hpd_event_thread(int hpd, void *dev)
>  	unsigned long flags;
>  	u32 status;
>  
> +	if (mtk_dp->need_debounce && mtk_dp-
> >train_info.cable_plugged_in)
> +		msleep(100);
> +
>  	spin_lock_irqsave(&mtk_dp->irq_thread_lock, flags);
>  	status = mtk_dp->irq_thread_handle;
>  	mtk_dp->irq_thread_handle = 0;
>  	spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);
>  
> -	if (status & MTK_DP_THREAD_CABLE_STATE_CHG)
> +	if (status & MTK_DP_THREAD_CABLE_STATE_CHG) {
>  		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
>  
> +		if (!mtk_dp->train_info.cable_plugged_in) {
> +			mtk_dp->need_debounce = false;
> +			mod_timer(&mtk_dp->debounce_timer,
> +				  jiffies + msecs_to_jiffies(100) - 1);
> +		}
> +	}
> +
>  	if (status & MTK_DP_THREAD_HPD_EVENT)
>  		dev_dbg(mtk_dp->dev, "Receive IRQ from sink
> devices\n");
>  
> @@ -1996,6 +2008,13 @@ static const struct drm_bridge_funcs
> mtk_dp_bridge_funcs = {
>  	.detect = mtk_dp_bdg_detect,
>  };
>  
> +static void mtk_dp_debounce_timer(struct timer_list *t)
> +{
> +	struct mtk_dp *mtk_dp = from_timer(mtk_dp, t, debounce_timer);
> +
> +	mtk_dp->need_debounce = true;
> +}
> +
>  static int mtk_dp_probe(struct platform_device *pdev)
>  {
>  	struct mtk_dp *mtk_dp;
> @@ -2069,6 +2088,9 @@ static int mtk_dp_probe(struct platform_device
> *pdev)
>  
>  	drm_bridge_add(&mtk_dp->bridge);
>  
> +	mtk_dp->need_debounce = true;
> +	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
> +
>  	pm_runtime_enable(dev);
>  	pm_runtime_get_sync(dev);
>  
> @@ -2081,6 +2103,7 @@ static int mtk_dp_remove(struct platform_device
> *pdev)
>  
>  	pm_runtime_put(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	del_timer_sync(&mtk_dp->debounce_timer);
>  	drm_bridge_remove(&mtk_dp->bridge);
>  	platform_device_unregister(mtk_dp->phy_dev);
>  

