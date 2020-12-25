Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B9E2E2987
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 04:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8D689A5E;
	Fri, 25 Dec 2020 03:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Fri, 25 Dec 2020 03:00:52 UTC
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6165389A62
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Dec 2020 03:00:52 +0000 (UTC)
X-UUID: f39dde36f6554575bfe9647bab75f588-20201225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=e6d/ZDiJzN/PkyONx34VeYu401D2YFYejNJdKEUj+M8=; 
 b=rGV4kVVbuRihJ66sD7/ZRky2URSc0stGY+sBnXmscc150r6Eib1miZHR853pk+gWHP1rAC/ApB8fDqvBwr733xsLhuvBKwvyBcs7HDefVkd2Kwxg7UHpTtBHUgAnildg9IUQUo1gWbaSQxjCD/DC9LHEV3ZpQG6/xNNgWNUN6SU=;
X-UUID: f39dde36f6554575bfe9647bab75f588-20201225
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1913141489; Fri, 25 Dec 2020 10:55:45 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 10:55:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Dec 2020 10:55:44 +0800
Message-ID: <1608864944.19292.3.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: dsi: Use IRQF_TRIGGER_NONE for dsi irq
 trigger type
From: CK Hu <ck.hu@mediatek.com>
To: Huijuan Xie <huijuan.xie@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 25 Dec 2020 10:55:44 +0800
In-Reply-To: <1608803643-7351-1-git-send-email-huijuan.xie@mediatek.com>
References: <1608803643-7351-1-git-send-email-huijuan.xie@mediatek.com>
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

+ Chun-Kuang, Philipp:


This mail has been sent to dri devel and linux mediatek, but why it does
not exist in mail lists?

Regards,
CK


On Thu, 2020-12-24 at 17:54 +0800, Huijuan Xie wrote:
> The interrupt trigger is already set by OF. When do devm_request_irq()
> in driver, please use IRQF_TRIGGER_NONE and don't specify trigger type
> again.
> 
> Signed-off-by: Huijuan Xie <huijuan.xie@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 4a188a9..1d62489 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1128,9 +1128,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>  		goto err_unregister_host;
>  	}
>  
> -	irq_set_status_flags(irq_num, IRQ_TYPE_LEVEL_LOW);
>  	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
> -			       IRQF_TRIGGER_LOW, dev_name(&pdev->dev), dsi);
> +			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request mediatek dsi irq\n");
>  		goto err_unregister_host;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
