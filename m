Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6F4B0BB4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:03:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED9C10E7EE;
	Thu, 10 Feb 2022 11:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C412810E7EE;
 Thu, 10 Feb 2022 11:03:41 +0000 (UTC)
X-UUID: f16f89fe7ede40bcb9dc9a77101ecd2b-20220210
X-UUID: f16f89fe7ede40bcb9dc9a77101ecd2b-20220210
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1689102185; Thu, 10 Feb 2022 19:03:37 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 19:03:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 19:03:35 +0800
Message-ID: <7c517b787d1dd768372d0141f5078e3089e883cb.camel@mediatek.com>
Subject: Re: [PATCH v6 25/35] iommu/mediatek: Migrate to aggregate driver
From: Yong Wu <yong.wu@mediatek.com>
To: Stephen Boyd <swboyd@chromium.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Thu, 10 Feb 2022 19:03:35 +0800
In-Reply-To: <20220127200141.1295328-26-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
 <20220127200141.1295328-26-swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org, Joerg
 Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, Will Deacon <will@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-01-27 at 12:01 -0800, Stephen Boyd wrote:
> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to
> all
> the component devices that make up the aggregate device.
> 
> Cc: Yong Wu <yong.wu@mediatek.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

+ Krzysztof

The memory/mtk-smi.c is expected to get Ack from Krzysztof.

Tested-by: Yong Wu <yong.wu@mediatek.com>

> ---
>  drivers/iommu/mtk_iommu.c    | 14 +++++++++-----
>  drivers/iommu/mtk_iommu.h    |  6 ++++--
>  drivers/iommu/mtk_iommu_v1.c | 14 +++++++++-----
>  drivers/memory/mtk-smi.c     | 10 ++++------
>  4 files changed, 26 insertions(+), 18 deletions(-)

[...]

> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index e201e5976f34..0910fe109f53 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -175,6 +175,8 @@ mtk_smi_larb_bind(struct device *dev, struct
> device *master, void *data)
>  			larb->larbid = i;
>  			larb->mmu = &larb_mmu[i].mmu;
>  			larb->bank = larb_mmu[i].bank;
> +
> +			pm_runtime_enable(dev);
>  			return 0;
>  		}
>  	}
> @@ -450,15 +452,11 @@ static int mtk_smi_larb_probe(struct
> platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> -	pm_runtime_enable(dev);
>  	platform_set_drvdata(pdev, larb);
>  	ret = component_add(dev, &mtk_smi_larb_component_ops);
> -	if (ret)
> -		goto err_pm_disable;
> -	return 0;
> +	if (!ret)
> +		return 0;
>  
> -err_pm_disable:
> -	pm_runtime_disable(dev);
>  	device_link_remove(dev, larb->smi_common_dev);

Here is right. But at a glance code here, I was confused why it always
call device_link_remove here. If we have v7, Could you help keep the
original format? something like below. This may be helpful when we add
new error flow in future.

        if (ret)
              goto dev_link_remove;
        return ret;

dev_link_remove:
        device_link_remove(dev, larb->smi_common_dev);

Thanks.     

>  	return ret;
>  }

