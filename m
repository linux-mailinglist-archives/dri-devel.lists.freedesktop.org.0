Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27F528196
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBE610E039;
	Mon, 16 May 2022 10:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F2010E045
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fWkwQsmctjZuzNgYxnAKr5+YEBZD6Vnzh24HSXGD4s4=; b=PyvF5wt/y7YPONshkgm9QvVDBg
 ofst1pJP0Wz+jy0MpOKmeONA+ui5V0E/rUyTSJz5lluFvjphLQUOW4m1TGTcb8rZizQ+fbHYWLWew
 /xQ9G4Psi7BDZQKEb4Zb39YdHsYSq0ksZ7L5J8D4EnKoSu4jl0vWKeCQyJdNgVu95mq5GeMNGHw0h
 nR+FiSXWtwr57cFQ5zPIPUbnAIEyV2xkoYwqpCgENWf13AKUlbX9cCwb3iku5748UtSaRtn/7+A5m
 E296JSCsnKVU5cbYlofpOk9K7Pdq6V9+++V2vUUERzQpS/IhCSKIn0a0MczNTBD+9xjWeWDoBglda
 6ZW8LDuA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqXjD-0000OD-HN; Mon, 16 May 2022 13:13:27 +0300
Message-ID: <4a170997-c893-1788-dcaa-8ed2193146ae@kapsi.fi>
Date: Mon, 16 May 2022 13:13:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v5 5/9] iommu/arm-smmu: Attach to host1x context device bus
Content-Language: en-US
To: Will Deacon <will@kernel.org>
References: <20220516085258.1227691-1-cyndis@kapsi.fi>
 <20220516085258.1227691-6-cyndis@kapsi.fi>
 <20220516100721.GA1927@willie-the-truck>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20220516100721.GA1927@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/16/22 13:07, Will Deacon wrote:
> On Mon, May 16, 2022 at 11:52:54AM +0300, cyndis@kapsi.fi wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> Set itself as the IOMMU for the host1x context device bus, containing
>> "dummy" devices used for Host1x context isolation.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 568cce590ccc..9ff54eaecf81 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -39,6 +39,7 @@
>>   
>>   #include <linux/amba/bus.h>
>>   #include <linux/fsl/mc.h>
>> +#include <linux/host1x_context_bus.h>
>>   
>>   #include "arm-smmu.h"
>>   
>> @@ -2053,8 +2054,20 @@ static int arm_smmu_bus_init(struct iommu_ops *ops)
>>   			goto err_reset_pci_ops;
>>   	}
>>   #endif
>> +#ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
>> +	if (!iommu_present(&host1x_context_device_bus_type)) {
>> +		err = bus_set_iommu(&host1x_context_device_bus_type, ops);
>> +		if (err)
>> +			goto err_reset_fsl_mc_ops;
>> +	}
>> +#endif
>> +
>>   	return 0;
>>   
>> +err_reset_fsl_mc_ops: __maybe_unused;
>> +#ifdef CONFIG_FSL_MC_BUS
>> +	bus_set_iommu(&fsl_mc_bus_type, NULL);
>> +#endif
> 
> bus_set_iommu() is going away:
> 
> https://lore.kernel.org/r/cover.1650890638.git.robin.murphy@arm.com
> 
> Will

Thanks for the heads-up. Robin had pointed out that this work was 
ongoing but I hadn't seen the patches yet. I'll look into it.

Mikko

>>

