Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9D924C3DD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 18:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC8C6E993;
	Thu, 20 Aug 2020 16:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 832186E98F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 16:58:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF2C030E;
 Thu, 20 Aug 2020 09:58:19 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 410683F66B;
 Thu, 20 Aug 2020 09:58:15 -0700 (PDT)
Subject: Re: [PATCH 10/18] iommu/msm: Add IOMMU_DOMAIN_DMA support
To: Rob Clark <robdclark@gmail.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <93d7de3533cfd952aecd6198b9221d7a58c0e521.1597931876.git.robin.murphy@arm.com>
 <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b5aa001f-6a1c-af0b-1526-c5b7a2e29ef7@arm.com>
Date: Thu, 20 Aug 2020 17:58:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuKa4P=gfus08CdfT2H5pG6a2PBumGb=Pw3qvD=NWueig@mail.gmail.com>
Content-Language: en-GB
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, digetx@gmail.com,
 Suman Anna <s-anna@ti.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 iommu@lists.linux-foundation.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Krishna Reddy <vdumpa@nvidia.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, t-kristo@ti.com,
 Kyungmin Park <kyungmin.park@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-20 16:55, Rob Clark wrote:
> Side note, I suspect we'll end up needing something like
> 0e764a01015dfebff8a8ffd297d74663772e248a .. if someone can dig a 32b
> device out of the closet and dust it off, the fix is easy enough.
> Just wanted to mention that here so anyone with a 32b device could
> find what is needed.

FWIW there shouldn't be any material change here - the generic default 
domain is installed under the same circumstances as the Arm 
dma_iommu_mapping was, so if any platform does have an issue, then it 
should already have started 4 years with f78ebca8ff3d ("iommu/msm: Add 
support for generic master bindings").

Robin.

> 
> BR,
> -R
> 
> On Thu, Aug 20, 2020 at 8:09 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> Now that arch/arm is wired up for default domains and iommu-dma,
>> implement the corresponding driver-side support for DMA domains.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/msm_iommu.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
>> index 3615cd6241c4..f34efcbb0b2b 100644
>> --- a/drivers/iommu/msm_iommu.c
>> +++ b/drivers/iommu/msm_iommu.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/init.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/dma-iommu.h>
>>   #include <linux/errno.h>
>>   #include <linux/io.h>
>>   #include <linux/io-pgtable.h>
>> @@ -314,13 +315,16 @@ static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
>>   {
>>          struct msm_priv *priv;
>>
>> -       if (type != IOMMU_DOMAIN_UNMANAGED)
>> +       if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>>                  return NULL;
>>
>>          priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>>          if (!priv)
>>                  goto fail_nomem;
>>
>> +       if (type == IOMMU_DOMAIN_DMA && iommu_get_dma_cookie(&priv->domain))
>> +               goto fail_nomem;
>> +
>>          INIT_LIST_HEAD(&priv->list_attached);
>>
>>          priv->domain.geometry.aperture_start = 0;
>> @@ -339,6 +343,7 @@ static void msm_iommu_domain_free(struct iommu_domain *domain)
>>          struct msm_priv *priv;
>>          unsigned long flags;
>>
>> +       iommu_put_dma_cookie(domain);
>>          spin_lock_irqsave(&msm_iommu_lock, flags);
>>          priv = to_msm_priv(domain);
>>          kfree(priv);
>> --
>> 2.28.0.dirty
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
