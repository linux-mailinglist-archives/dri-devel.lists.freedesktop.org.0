Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF6352826F
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D99910EB40;
	Mon, 16 May 2022 10:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B215E10EB3F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:44:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6CC1063;
 Mon, 16 May 2022 03:44:48 -0700 (PDT)
Received: from [10.57.82.175] (unknown [10.57.82.175])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 849D83F66F;
 Mon, 16 May 2022 03:44:46 -0700 (PDT)
Message-ID: <099cf0f9-5c27-0247-7c5e-6704a9527b11@arm.com>
Date: Mon, 16 May 2022 11:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 5/9] iommu/arm-smmu: Attach to host1x context device bus
Content-Language: en-GB
To: Mikko Perttunen <cyndis@kapsi.fi>, Will Deacon <will@kernel.org>
References: <20220516085258.1227691-1-cyndis@kapsi.fi>
 <20220516085258.1227691-6-cyndis@kapsi.fi>
 <20220516100721.GA1927@willie-the-truck>
 <4a170997-c893-1788-dcaa-8ed2193146ae@kapsi.fi>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <4a170997-c893-1788-dcaa-8ed2193146ae@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 joro@8bytes.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-16 11:13, Mikko Perttunen wrote:
> On 5/16/22 13:07, Will Deacon wrote:
>> On Mon, May 16, 2022 at 11:52:54AM +0300, cyndis@kapsi.fi wrote:
>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>
>>> Set itself as the IOMMU for the host1x context device bus, containing
>>> "dummy" devices used for Host1x context isolation.
>>>
>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>>> ---
>>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index 568cce590ccc..9ff54eaecf81 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -39,6 +39,7 @@
>>>   #include <linux/amba/bus.h>
>>>   #include <linux/fsl/mc.h>
>>> +#include <linux/host1x_context_bus.h>
>>>   #include "arm-smmu.h"
>>> @@ -2053,8 +2054,20 @@ static int arm_smmu_bus_init(struct iommu_ops 
>>> *ops)
>>>               goto err_reset_pci_ops;
>>>       }
>>>   #endif
>>> +#ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
>>> +    if (!iommu_present(&host1x_context_device_bus_type)) {
>>> +        err = bus_set_iommu(&host1x_context_device_bus_type, ops);
>>> +        if (err)
>>> +            goto err_reset_fsl_mc_ops;
>>> +    }
>>> +#endif
>>> +
>>>       return 0;
>>> +err_reset_fsl_mc_ops: __maybe_unused;
>>> +#ifdef CONFIG_FSL_MC_BUS
>>> +    bus_set_iommu(&fsl_mc_bus_type, NULL);
>>> +#endif
>>
>> bus_set_iommu() is going away:
>>
>> https://lore.kernel.org/r/cover.1650890638.git.robin.murphy@arm.com
>>
>> Will
> 
> Thanks for the heads-up. Robin had pointed out that this work was 
> ongoing but I hadn't seen the patches yet. I'll look into it.

Although that *is* currently blocked on the mystery intel-iommu problem 
that I can't reproduce... If this series is ready to land right now for 
5.19 then in principle that might be the easiest option overall. 
Hopefully at least patch #2 could sneak in so that the compile-time 
dependencies are ready for me to roll up host1x into the next rebase of 
"iommu: Always register bus notifiers".

Cheers,
Robin.
