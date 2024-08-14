Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E94AE952507
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 23:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E013210E264;
	Wed, 14 Aug 2024 21:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x2BwCeAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5557510E264
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 21:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlcq+KnSAfvtkMfPmxSRqoN/aOlUzh7vPXya3nOzeLWX/8yKtvSL4p1crHZU+nrRfRv9M5mvM6SprvyaYlMRHH63BLJO0zo8NiW6OMfhr9FofhLNRhOkU3eprQQa9VH5zwsJeCAeKIC/suZl7EJi8rKmJHSjd7tD+/2DN33ebKzL3Nsz8g95nvunQyMs8iPDSgqVg965HIbzMMDF3gq4Q4mLUAPnvpvfpa4VceGA3w77yKlHWUVh/UMi10vo9iUbXSmk4Ib/HI32Gbc5FVel4IFcza07MRCBf/7bJ6ngQrLGL1ims3NmGHol/uPBEKfuxdNHTkjiY79HjLl7rIqn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYnAH6oA1HfgxOV4/GVqn/q5kPtcIODbNQZpkkuCn0o=;
 b=tsjMTFf7FqU/1tA1DX/YjhLcoa7Gx9QtpJWEWtOiyCzlRmhujdcY365SmO7kWD1q9GpCzTT18XXppk/+xyF/z1iwV6VTAKZd2G7ZuMQbo/cimOz+AvJm8MB/SPQf0DxHH2bAoBQDxhPoq1F/LS2zB9q3T19BNDZc/J3my1b9FLfb6lzb4acnNnkxZNy7+W3xUnDgX/ZXLZixipg0qpa2JsZIkfyMg2dC+0GA4ZCCq+yVQkxqvx2H2qo9CcQK4j6thpfS3QVinJKGao6etdhkpQsOlvWXtZH3piWIhwL1hqwHCqKdzRJWMdvV2dHLjqyxTyIXxblOhG2ll5kiRj0z0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYnAH6oA1HfgxOV4/GVqn/q5kPtcIODbNQZpkkuCn0o=;
 b=x2BwCeAFRUjrYsSY/47q+GKxb/MkBYPRvqfcR5KOSygGvh6h3WjEy1/03ANwqEud98aLvTzOGbt6StPJQRQCPSjuaBm7G8tvVA0B35KgCqzzfZNwUQCn85InsXcZse5QNX9MOdsDE8Hrp4N6Fwg8Gyyb1JMHYyuHxnmPsE6RYKs=
Received: from SA0PR11CA0116.namprd11.prod.outlook.com (2603:10b6:806:d1::31)
 by SN7PR12MB6981.namprd12.prod.outlook.com (2603:10b6:806:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 21:59:40 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:d1:cafe::8e) by SA0PR11CA0116.outlook.office365.com
 (2603:10b6:806:d1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Wed, 14 Aug 2024 21:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 21:59:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 16:59:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 16:59:38 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 16:59:38 -0500
Message-ID: <5ab44ff4-2b69-2c7b-9974-d86919d79346@amd.com>
Date: Wed, 14 Aug 2024 14:59:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, George Yang <George.Yang@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-2-lizhi.hou@amd.com>
 <f5e9f517-77b8-998d-9bf7-d9bf4ee2fbb8@quicinc.com>
 <172cde68-930f-381e-df9f-da2a48955828@amd.com>
 <edaa7f7d-a3e8-1b1a-37b8-3fd5a8a7790d@quicinc.com>
 <6f50a3d7-0aca-e1a8-423f-75bc5cb6e744@amd.com>
 <754b747e-abf6-e70c-4091-2bea95576b81@quicinc.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <754b747e-abf6-e70c-4091-2bea95576b81@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|SN7PR12MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de11477-0ba1-4f7d-c5b1-08dcbcac654b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: o0tieiBwSXNm7MYuNKjPTDu8Z9umzV8LwVrok+onEJ0JkTk1GyF8r+njXK9pLGtwoKUPfhO++625p5CNZ+KBa154Lc0DQL4gtdEnFkGK8ddlBE2UCXS02pOul2a216rpNUdOAxkLBvxRYwYM09kfZsFoFdwjpYO+bSvJ/s32TnmBQk0dpHvP+0SyXKdRbviyUbIetqWMglly7CNE9oMcJcJUl3cBn7ACAVlVuf9xoBBvPVJWHGHQXXLMVk9qlni76Do0ZodVZM3Wy0dMhLUx5YRPNpbdktRNNaVWuzpkir6NFLvoWHMvLRqizw6ZwJVpBnElx2uGYP1rU5ms1+ac/WGfN3uAchY6UrDYYvmsFdigYALOVzKx3OSRuQ24sTrXlwFrd9HFw/8xy6+/HFZXcPeS9zstKec5GjK6wfUD2fJhNtHFhLPPvl3WNJ+jCQJDodY3+FoBYiZ3U2XYqMtYzO9VVaD27szV0m0KdRsEaXQc8ewOdvfqd8cggj7HjHCL52IanJ9Dz/gsSZwlHWjxN5LGgMKZyllFxQrhUvNw1M1Q3vGlkwrp+6M9b5cWBdRi+tmCtnKzBNAlvO7odVA3MFa7afO+SqZjwIyL6LbP6XIwS3CKxznXTg5JLgzc22Xq2jJUj6OMRJ2k3m9H3jfaj/kYVcEKsEdRknxNVNaMqczVMpvG3U7E+Q5a+Cy0FRjVJfnDkholAx/3ROi0NdiN70wPiKIF8z+sFAo5zuO8G2YJTLb0uefH+zBd/MHFWYjY
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 21:59:39.8691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de11477-0ba1-4f7d-c5b1-08dcbcac654b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6981
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/14/24 14:53, Jeffrey Hugo wrote:
> On 8/14/2024 2:24 PM, Lizhi Hou wrote:
>>
>> On 8/14/24 11:46, Jeffrey Hugo wrote:
>>> On 8/14/2024 12:16 PM, Lizhi Hou wrote:
>>>>
>>>> On 8/9/24 09:11, Jeffrey Hugo wrote:
>>>>> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>>>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>>>>>> b/drivers/accel/amdxdna/aie2_pci.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..3660967c00e6
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>>>> @@ -0,0 +1,182 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +/*
>>>>>> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>>>>>> + */
>>>>>> +
>>>>>> +#include <linux/amd-iommu.h>
>>>>>> +#include <linux/errno.h>
>>>>>> +#include <linux/firmware.h>
>>>>>> +#include <linux/iommu.h>
>>>>>
>>>>> You are clearly missing linux/pci.h and I suspect many more.
>>>> Other headers are indirectly included by "aie2_pci.h" underneath.
>>>
>>> aie2_pci.h also does not directly include linux/pci.h
>>
>> it is aie2_pci.h --> amdxdna_pci_drv.h --> linux/pci.h.
>>
>> It compiles without any issue.
>
> I did not doubt that it compiled.  To be clear, I'm pointing out what 
> I believe is poor style - relying on implicit includes.
>
> There is no reason that amdxdna_pci_drv.h needs to include linux/pci.h 
> (at-least in this patch).  That header file doesn't use any of the 
> content from pci.h.  If this were merged, I suspect it would be valid 
> for someone to post a cleanup patch that removes pci.h from 
> amdxdna_pci_drv.h.
>
> The problem comes when someone does a tree wide refactor of some 
> header - perhaps moving a function out of pci.h into something else.  
> If they grep the source tree, they'll find amdxdna_pci_drv.h includes 
> pci.h but really doesn't use it.  They likely won't see aie2_pci.c 
> which may break because of the refactor.  Even more problematic is if 
> pci.h is including something that you need, and you are not including 
> it anywhere. The code will still compile, but maybe in the next kernel 
> cycle pci.h no longer includes that thing.  Your code will break.
>
> The 4 includes you have here seems entirely too little, and I'm not 
> clearly seeing the logic of what gets explicitly included vs what is 
> implicitly included.  firmware.h is explicitly included, but pci.h is 
> not, yet it seems like you use a lot more from pci.h.
>
> There is the include what you use project that attempts to automate 
> this, although I don't know how well it works with kernel code - 
> https://github.com/include-what-you-use/include-what-you-use

Ok. got your point and I will cleanup include.


Lizhi

>
>>
>>>
>>>>>> +
>>>>>> +    ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>>>>>> +    if (ret) {
>>>>>> +        XDNA_ERR(xdna, "Failed to set DMA mask: %d", ret);
>>>>>> +        goto release_fw;
>>>>>> +    }
>>>>>> +
>>>>>> +    nvec = pci_msix_vec_count(pdev);
>>>>>
>>>>> This feels weird.  Can your device advertise variable number of 
>>>>> MSI-X vectors?  It only works if all of the vectors are used?
>>>> That is possible. the driver supports different hardware. And the 
>>>> fw assigns vector for hardware context dynamically. So the driver 
>>>> needs to allocate all vectors ahead.
>>>
>>> So, if the device requests N MSIs, but the host is only able to 
>>> satisfy 1 (or some number less than N), the fw is completely unable 
>>> to function?
>> The fw may return interrupt 2 is assigned to hardware context. Then 
>> the driver may not deal with it in this case. I think it is ok to 
>> fail if the system has very limited resource.
>
> Ok.  I suspect you'll want to change that behavior in the future with 
> a fw update, but if this is how things work today, then this is how 
> the driver must be.
