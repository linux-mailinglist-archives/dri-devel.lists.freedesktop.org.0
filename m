Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51AF48C0C0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 10:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EEB1132A6;
	Wed, 12 Jan 2022 09:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA7E1132A4;
 Wed, 12 Jan 2022 09:09:26 +0000 (UTC)
X-UUID: c3dd01af70294ed4829a1750c41c591b-20220112
X-UUID: c3dd01af70294ed4829a1750c41c591b-20220112
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1440893993; Wed, 12 Jan 2022 17:09:22 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 12 Jan 2022 17:09:20 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Jan 2022 17:09:19 +0800
Message-ID: <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
Subject: Re: [PATCH v5 25/32] iommu/mtk: Migrate to aggregate driver
From: Yong Wu <yong.wu@mediatek.com>
To: Stephen Boyd <swboyd@chromium.org>
Date: Wed, 12 Jan 2022 17:09:19 +0800
In-Reply-To: <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
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
Cc: youlin.pei@mediatek.com, Saravana Kannan <saravanak@google.com>, Will
 Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J.
 Wysocki" <rafael@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-01-11 at 16:27 -0800, Stephen Boyd wrote:
> Quoting Yong Wu (2022-01-11 04:22:23)
> > Hi Stephen,
> > 
> > Thanks for helping update here.
> > 
> > On Thu, 2022-01-06 at 13:45 -0800, Stephen Boyd wrote:
> > > Use an aggregate driver instead of component ops so that we can
> > > get
> > > proper driver probe ordering of the aggregate device with respect
> > > to
> > > all
> > > the component devices that make up the aggregate device.
> > > 
> > > Cc: Yong Wu <yong.wu@mediatek.com>
> > > Cc: Joerg Roedel <joro@8bytes.org>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> > > Cc: Saravana Kannan <saravanak@google.com>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > 
> > When I test this on mt8195 which have two IOMMU HWs(calling
> > component_aggregate_regsiter twice), it will abort like this. Then
> > what
> > should we do if we have two instances?
> > 
> 
> Thanks for testing it out. We can't register the struct driver more
> than
> once but this driver is calling the component_aggregate_register()
> function from the driver probe and there are two devices bound to the
> mtk-iommu driver so we try to register it more than once. Sigh!
> 
> I see a couple options. One is to do a deep copy of the driver
> structure
> and change the driver name. Then it's a one to one relationship
> between
> device and driver. That's not very great because it leaves around
> junk
> so it should probably be avoided.
> 
> Another option is to reference count the driver registration calls
> when
> component_aggregate_register() is called multiple times. Then we
> would
> only register the driver once and keep it pinned until the last
> unregister call is made, but still remove devices that are created
> for
> the match table.
> 
> Can you try the attached patch? It is based on the next version of
> this
> patch series so the include part of the patch may not apply cleanly.
> 
> ---8<---
> diff --git a/drivers/base/component.c b/drivers/base/component.c
> index 64ad7478c67a..97f253a41bdf 100644
> --- a/drivers/base/component.c
> +++ b/drivers/base/component.c
> @@ -492,15 +492,30 @@ static struct aggregate_device
> *__aggregate_find(struct device *parent)
>  	return dev ? to_aggregate_device(dev) : NULL;
>  }
> 
> +static DEFINE_MUTEX(aggregate_mutex);
> +
>  static int aggregate_driver_register(struct aggregate_driver *adrv)
>  {
> -	adrv->driver.bus = &aggregate_bus_type;
> -	return driver_register(&adrv->driver);
> +	int ret = 0;
> +
> +	mutex_lock(&aggregate_mutex);
> +	if (!refcount_inc_not_zero(&adrv->count)) {
> +		adrv->driver.bus = &aggregate_bus_type;
> +		ret = driver_register(&adrv->driver);
> +		if (!ret)
> +			refcount_inc(&adrv->count);

This should be refcount_set(&adrv->count, 1)?

Otherwise, it will warning like this:

[    2.654526] ------------[ cut here ]------------
[    2.655558] refcount_t: addition on 0; use-after-free.
[    2.656219] WARNING: CPU: 7 PID: 74 at ../v5.16-
rc1/kernel/mediatek/lib/refcount.c:25
refcount_warn_saturate+0x128/0x148
...
[    2.672227] Call trace:
[    2.672539]  refcount_warn_saturate+0x128/0x148
[    2.673118]  component_aggregate_register+0x388/0x390
[    2.673763]  mtk_iommu_probe+0x638/0x690

[    2.686467] ------------[ cut here ]------------
[    2.687049] refcount_t: saturated; leaking memory.
[    2.687666] WARNING: CPU: 5 PID: 74 at ../v5.16-
rc1/kernel/mediatek/lib/refcount.c:19 refcount_warn_saturate+0xfc/0x148

[    2.703805] Call trace:
[    2.704117]  refcount_warn_saturate+0xfc/0x148
[    2.704685]  component_aggregate_register+0x1fc/0x390
[    2.705330]  mtk_iommu_probe+0x638/0x690

> +	}
> +	mutex_unlock(&aggregate_mutex);
> +
> +	return ret;
>  }
> 
>  static void aggregate_driver_unregister(struct aggregate_driver
> *adrv)
>  {
> -	driver_unregister(&adrv->driver);
> +	if (refcount_dec_and_mutex_lock(&adrv->count,
> &aggregate_mutex)) {
> +		driver_unregister(&adrv->driver);
> +		mutex_unlock(&aggregate_mutex);
> +	}
>  }
> 
>  static struct aggregate_device *aggregate_device_add(struct device
> *parent,
> diff --git a/include/linux/component.h b/include/linux/component.h
> index 53d81203c095..b061341938aa 100644
> --- a/include/linux/component.h
> +++ b/include/linux/component.h
> @@ -4,6 +4,7 @@
> 
>  #include <linux/stddef.h>
>  #include <linux/device.h>
> +#include <linux/refcount.h>
> 
>  struct aggregate_device;
> 
> @@ -66,6 +67,7 @@ struct device *aggregate_device_parent(const struct
> aggregate_device *adev);
> 
>  /**
>   * struct aggregate_driver - Aggregate driver (made up of other
> drivers)
> + * @count: driver registration refcount
>   * @driver: device driver
>   */
>  struct aggregate_driver {
> @@ -101,6 +103,7 @@ struct aggregate_driver {
>  	 */
>  	void (*shutdown)(struct aggregate_device *adev);
> 
> +	refcount_t		count;
>  	struct device_driver	driver;
>  };

After this patch, the aggregate_driver flow looks ok. But our driver
still aborts like this:

[    2.721316] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
...
[    2.731658] pc : mtk_smi_larb_config_port_gen2_general+0xa4/0x138
[    2.732434] lr : mtk_smi_larb_resume+0x54/0x98
...
[    2.742457] Call trace:
[    2.742768]  mtk_smi_larb_config_port_gen2_general+0xa4/0x138
[    2.743496]  pm_generic_runtime_resume+0x2c/0x48
[    2.744090]  __genpd_runtime_resume+0x30/0xa8
[    2.744648]  genpd_runtime_resume+0x94/0x2c8
[    2.745191]  __rpm_callback+0x44/0x150
[    2.745669]  rpm_callback+0x6c/0x78
[    2.746114]  rpm_resume+0x314/0x558
[    2.746559]  __pm_runtime_resume+0x3c/0x88
[    2.747080]  pm_runtime_get_suppliers+0x7c/0x110
[    2.747668]  __driver_probe_device+0x4c/0xe8
[    2.748212]  driver_probe_device+0x44/0x130
[    2.748745]  __device_attach_driver+0x98/0xd0
[    2.749300]  bus_for_each_drv+0x68/0xd0
[    2.749787]  __device_attach+0xec/0x148
[    2.750277]  device_attach+0x14/0x20
[    2.750733]  bus_rescan_devices_helper+0x50/0x90
[    2.751319]  bus_for_each_dev+0x7c/0xd8
[    2.751806]  bus_rescan_devices+0x20/0x30
[    2.752315]  __component_add+0x7c/0xa0
[    2.752795]  component_add+0x14/0x20
[    2.753253]  mtk_smi_larb_probe+0xe0/0x120

This is because the device runtime_resume is called before the bind
operation(In our case this detailed function is mtk_smi_larb_bind).
The issue doesn't happen without this patchset. I'm not sure the right
sequence. If we should fix in mediatek driver, the patch could be:


diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index b883dcc0bbfa..288841555067 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -483,8 +483,9 @@ static int __maybe_unused
mtk_smi_larb_resume(struct device *dev)
        if (ret < 0)
                return ret;

-       /* Configure the basic setting for this larb */
-       larb_gen->config_port(dev);
+       /* Configure the basic setting for this larb after it binds
with iommu */
+       if (larb->mmu)
+               larb_gen->config_port(dev);

        return 0;
 }


Another nitpick, the title should be: iommu/mediatek: xxxx


