Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9426E48AD85
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E57510E54E;
	Tue, 11 Jan 2022 12:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43A110E54E;
 Tue, 11 Jan 2022 12:22:29 +0000 (UTC)
X-UUID: ae5f11dfdfb24d4cb1b29dc2ab997c75-20220111
X-UUID: ae5f11dfdfb24d4cb1b29dc2ab997c75-20220111
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 534519960; Tue, 11 Jan 2022 20:22:25 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 11 Jan 2022 20:22:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Jan 2022 20:22:23 +0800
Message-ID: <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
From: Yong Wu <yong.wu@mediatek.com>
To: Stephen Boyd <swboyd@chromium.org>
Date: Tue, 11 Jan 2022 20:22:23 +0800
In-Reply-To: <20220106214556.2461363-26-swboyd@chromium.org>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>, Will
 Deacon <will@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

Thanks for helping update here.

On Thu, 2022-01-06 at 13:45 -0800, Stephen Boyd wrote:
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

When I test this on mt8195 which have two IOMMU HWs(calling
component_aggregate_regsiter twice), it will abort like this. Then what
should we do if we have two instances?
Thanks.

[    2.652424] Error: Driver 'mtk_iommu_agg' is already registered,
aborting...
[    2.654033] mtk-iommu: probe of 1c01f000.iommu failed with error -16
[    2.662034] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000020
...
[    2.672413] pc : aggregate_device_match+0xa8/0x1c8
[    2.673027] lr : aggregate_device_match+0x68/0x1c8
...
[    2.683091] Call trace:
[    2.683403]  aggregate_device_match+0xa8/0x1c8
[    2.683970]  __device_attach_driver+0x38/0xd0
[    2.684526]  bus_for_each_drv+0x68/0xd0
[    2.685015]  __device_attach+0xec/0x148
[    2.685503]  device_attach+0x14/0x20
[    2.685960]  bus_rescan_devices_helper+0x50/0x90
[    2.686545]  bus_for_each_dev+0x7c/0xd8
[    2.687033]  bus_rescan_devices+0x20/0x30
[    2.687542]  __component_add+0x7c/0xa0
[    2.688022]  component_add+0x14/0x20
[    2.688479]  mtk_smi_larb_probe+0xe0/0x120


> ---
>  drivers/iommu/mtk_iommu.c    | 14 +++++++++-----
>  drivers/iommu/mtk_iommu.h    |  6 ++++--
>  drivers/iommu/mtk_iommu_v1.c | 14 +++++++++-----
>  3 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 25b834104790..8e722898cbe2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -752,9 +752,13 @@ static int mtk_iommu_hw_init(const struct
> mtk_iommu_data *data)
>  	return 0;
>  }
>  
> -static const struct component_master_ops mtk_iommu_com_ops = {
> -	.bind		= mtk_iommu_bind,
> -	.unbind		= mtk_iommu_unbind,
> +static struct aggregate_driver mtk_iommu_aggregate_driver = {
> +	.probe		= mtk_iommu_bind,
> +	.remove		= mtk_iommu_unbind,
> +	.driver		= {
> +		.name	= "mtk_iommu_agg",
> +		.owner	= THIS_MODULE,
> +	},
>  };
>  
>  static int mtk_iommu_probe(struct platform_device *pdev)
> @@ -895,7 +899,7 @@ static int mtk_iommu_probe(struct platform_device
> *pdev)
>  			goto out_list_del;
>  	}
>  
> -	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops,
> match);
> +	ret = component_aggregate_register(dev,
> &mtk_iommu_aggregate_driver, match);
>  	if (ret)
>  		goto out_bus_set_null;
>  	return ret;
> @@ -928,7 +932,7 @@ static int mtk_iommu_remove(struct
> platform_device *pdev)
>  	device_link_remove(data->smicomm_dev, &pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  	devm_free_irq(&pdev->dev, data->irq, data);
> -	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
> +	component_aggregate_unregister(&pdev->dev,
> &mtk_iommu_aggregate_driver);
>  	return 0;
>  }
>  
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index f81fa8862ed0..064fd4f4eade 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -94,15 +94,17 @@ static inline void release_of(struct device *dev,
> void *data)
>  	of_node_put(data);
>  }
>  
> -static inline int mtk_iommu_bind(struct device *dev)
> +static inline int mtk_iommu_bind(struct aggregate_device *adev)
>  {
> +	struct device *dev = adev->parent;
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>  
>  	return component_bind_all(dev, &data->larb_imu);
>  }
>  
> -static inline void mtk_iommu_unbind(struct device *dev)
> +static inline void mtk_iommu_unbind(struct aggregate_device *adev)
>  {
> +	struct device *dev = adev->parent;
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>  
>  	component_unbind_all(dev, &data->larb_imu);
> diff --git a/drivers/iommu/mtk_iommu_v1.c
> b/drivers/iommu/mtk_iommu_v1.c
> index be22fcf988ce..5fb29058a165 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -534,9 +534,13 @@ static const struct of_device_id
> mtk_iommu_of_ids[] = {
>  	{}
>  };
>  
> -static const struct component_master_ops mtk_iommu_com_ops = {
> -	.bind		= mtk_iommu_bind,
> -	.unbind		= mtk_iommu_unbind,
> +static struct aggregate_driver mtk_iommu_aggregate_driver = {
> +	.probe		= mtk_iommu_bind,
> +	.remove		= mtk_iommu_unbind,
> +	.driver		= {
> +		.name	= "mtk_iommu_agg",
> +		.owner	= THIS_MODULE,
> +	},
>  };
>  
>  static int mtk_iommu_probe(struct platform_device *pdev)
> @@ -624,7 +628,7 @@ static int mtk_iommu_probe(struct platform_device
> *pdev)
>  			goto out_dev_unreg;
>  	}
>  
> -	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops,
> match);
> +	ret = component_aggregate_register(dev,
> &mtk_iommu_aggregate_driver, match);
>  	if (ret)
>  		goto out_bus_set_null;
>  	return ret;
> @@ -650,7 +654,7 @@ static int mtk_iommu_remove(struct
> platform_device *pdev)
>  
>  	clk_disable_unprepare(data->bclk);
>  	devm_free_irq(&pdev->dev, data->irq, data);
> -	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
> +	component_aggregate_unregister(&pdev->dev,
> &mtk_iommu_aggregate_driver);
>  	return 0;
>  }
>  

