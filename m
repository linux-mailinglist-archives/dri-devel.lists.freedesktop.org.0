Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85F952351
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 22:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A8010E025;
	Wed, 14 Aug 2024 20:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p06cLFuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3293110E025
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 20:24:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjL0ThuzhXQ1XKxJuOgegl9TmY32nwfx4MuIorm/wCUIrJeXWnbNx6orLLR4FdreHz7pOEETJK9HT4HwIjHs1yziUq+SLdWfVvYrPQ54Nd5zmx6zNyoUw5YgwjpP6KCRx9U0IaiyikJkMKYFScggN965YKspndeazTmgMtfsltxocm2qDb2EcdXDoDRHCMsy4Lky+qmaptf224yCIqVATdU0efoYtTTaz26rsrY+qTiC+EN33NKI1uhPUKVitDzBmgW6pDBhQlWsSxDe0dbcAqc7dHOa42DNZ2ZUWrshmBV2ZtvTmCY7Gz2EUx+1gxTj+iqMtzSbHOsUTzh036Z/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3golakSXdwCpa/lpBBCg4tXsqQJtd684Pl89CFs1cQ=;
 b=UQ83iRGGW7cjQahxZJ1WpwcQjaB+PPSjDnYa0C9FRHK4NwSDHMymztEzNnTX8NLdElG7W1d+oEAgxMpGbyqhVhFTIAoAUOtLumjmMKu2DlV2XfEHVwCsy0FcHaQWAfDOSANME+TRwLvyOXr2/3dmKW6C7tdBhi8Zro/fYQP3cu+/sT3SYbaFh7YHa1E6VzA1kBcix/cMKUkLxwCEKIfhycJGRseLW+pgqWz7gmHpB8EeSh2JEY8Ref6W7rCblDpZKgHo/BKUyuBde6awufOJi8vMhdSM+GebQ9ZkP6PyEhfyWDUdAGeW40J1/TG+qXA4EOLahEHbqqzg5GY7JlFZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3golakSXdwCpa/lpBBCg4tXsqQJtd684Pl89CFs1cQ=;
 b=p06cLFuVAN6p+FWfeHZIl8xOfWxe/E9BZoG/zM4LydlAzfW39uDfKCTFBPVMUukROMLwTX3nz4934dvP6WhQ8NCeEmY444Cqt0RrRmVAgCLt69fBTuqhRSaN92t5xCBZF7CNbkxBLhg/zwSMNidGgKQYmUqXFpHHr4+5lAftnc4=
Received: from CH0PR08CA0024.namprd08.prod.outlook.com (2603:10b6:610:33::29)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 20:24:11 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::75) by CH0PR08CA0024.outlook.office365.com
 (2603:10b6:610:33::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Wed, 14 Aug 2024 20:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 20:24:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 15:24:10 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 15:24:09 -0500
Message-ID: <6f50a3d7-0aca-e1a8-423f-75bc5cb6e744@amd.com>
Date: Wed, 14 Aug 2024 13:24:09 -0700
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
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <edaa7f7d-a3e8-1b1a-37b8-3fd5a8a7790d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: add776ca-d3c4-4f20-06db-08dcbc9f0ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MERFcjM1c2VzU1BsR0JtZTVpWjVGR21VWEtrNHVSb1U1K09ROTAva3d2QTc5?=
 =?utf-8?B?c01GZ3Z2THc3WUgzQzZBOWc0L3N3ZFd6dFJOUE5JUDN4cUFCUU53bGt1aGNk?=
 =?utf-8?B?ZFUrSEM3QlVmUlpGc1Nab3YwTzFqYjAwajR4R0hmOVl0dm5wMEE5NGhCL0tv?=
 =?utf-8?B?Vzdrd3pPdjd6Nm5xR3FhcUhNVmMrS1JzNzExL0RPZ01ZbGJGNjhpRE5IN2xE?=
 =?utf-8?B?akNwS3d3dTM4a0dVc20zTFVaQTdkbHdjTkRKWVFmaTZCQnZ3WTYzK3p6QTh0?=
 =?utf-8?B?QU1WZndOT3VvbzljRTJjemhnTi9qRURhc3cxcjJBMGYxTjFObDJjWFlndk9Q?=
 =?utf-8?B?WWhYR2tmdkpxT0tOUVlsOWdxeXB3aHMvRG1lQ3pyeUdpME56SGhjQWtoZkVR?=
 =?utf-8?B?WVpDckdQWWYwei9ZN1F4blUza21QRjVMTjN3aTNWMEpCOGk4SzJSRG1mR2Nl?=
 =?utf-8?B?MTh1WjFoQUdRdUNESkhWQjBkWVFoU1BlQjFRbVpqcmk4U1FjWkdXYUphbzB3?=
 =?utf-8?B?QWUvMnVGeUFZVUo0N0JYa0Y4Y1pIQkpVRzhRN24rYlluKzM2eFNTUVZxekRm?=
 =?utf-8?B?RVMyM01BUUhKa3lwaXhhRkI3NHl6YnRyRzFwRXZhbi9kbmxNdytjMTJLa0dT?=
 =?utf-8?B?bVkzOXNweTlwcGYwMTdSRml1NEtTbWd2OXJvcnh3NmdQMzlZZHFPbjVKa2Nn?=
 =?utf-8?B?dXBOY0RocmpDcTJQQnBjajM3S0kxMWZvU2pCOFdqdTd5MThYZ1dNZjdsYnJC?=
 =?utf-8?B?S0F1RHZMNzA5aWRYc1FudlNiUXEzRWFkRnMwRmltVE5PbWJ1NmlwT21mOEZY?=
 =?utf-8?B?L3ZQQ1NRejZtYUxuVFkwTkh6M3JNSE1PUEJpVXAvRGgyTyt0bk83andlLy91?=
 =?utf-8?B?K3UrcFMvWlNVYm1SZ2RLcWdKbWNnNmNDMVZMcnphakwzZmxBV1FFUk1JRmQ3?=
 =?utf-8?B?RFFSSU53ZnhSU2xWSE1aaTRSTFNIVEhRMHczSWUwM25semg5NnM0OWNyaHlR?=
 =?utf-8?B?cWRyT2NCSlVxcHBVS0lCQ1hDQkp1SW5Jbml4dUp3RzNCYlp4bnJUSk01SkpN?=
 =?utf-8?B?SFpPMTRUdTZWYnNXRHJiN05UK1QyYStuS0t5UjkxSi9hYkVUT3pWaU50NWM1?=
 =?utf-8?B?Z080RXJmOTJWOVJYMGR3ZTZUR25CM2M1VnYzMENPT1I3WEhVRmltenNzYy9z?=
 =?utf-8?B?WHY3ZGN3T21WbitKWlBSaHNHakJUc1pEYnhTamx0YUJLQUl2cnJjU1dtaXFs?=
 =?utf-8?B?dy9wWlFGUVZnaTBmUm5ldXBBVS9tcTRnR3R4TDZYeUVjcHlneHE0UC8xSUM5?=
 =?utf-8?B?WDRFQzJWUHQxci9LcXArZUFPRkFwYWdBV3p4QzI1Nk1JcExpY2xOQ1BhQ3Vs?=
 =?utf-8?B?c21rSGdGQ0VidEtkRDBDRjRtM2pxTkNYdXJiZzZnWXZZaTY1US9ISHROdlhQ?=
 =?utf-8?B?czJ4RVZValVSeDZ6NGhEdzMycUJ5dkVUV05yT2lBSkh3ZGQ4eW9CSExkd1Bq?=
 =?utf-8?B?c3dkZE56eVRZQjZlQU1ycWY2cmxYeTNCTmNrUWNFTXdQNFJlQlZzdmwwQ1Nq?=
 =?utf-8?B?YUhzQnVhMzArWFpYeUdjY0Jtc0U1d2plOWdGQlBNMFZ0ckRNK0Q4UFhqYzFj?=
 =?utf-8?B?VnF4T3JRK0wzVHNzWk9FMko3MURCRXBncG9KcWV5bGtDTkltUW5iRTF6ellX?=
 =?utf-8?B?YVV6Q3I0WnJqZks2YXo4Sjl5S3Nrc0QyT3Zsb1FkcVE3T0E2cEhqNFNxeEtZ?=
 =?utf-8?B?WDRuQ1AwL0VTTUV2c0xocTNCN25jNGZtMzE3Wmt2SEVzWUNQU3FvY0dLQ1V4?=
 =?utf-8?B?WGZtWURzTlJjTXA5Mm9rbU94S2NlbTI5Q0NhNUE2QmptSWQ3Vy9xcXZaUStm?=
 =?utf-8?B?V1BRb0xaUWpyZGRCRFpUWGlFSHVCSDVjZW9pd3VKWDBCbDZmTFk2NlJkbW9Y?=
 =?utf-8?Q?owrHV2hLSsvAwDIQriiJMrFI4qqcUHAm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 20:24:11.3625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: add776ca-d3c4-4f20-06db-08dcbc9f0ed7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
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


On 8/14/24 11:46, Jeffrey Hugo wrote:
> On 8/14/2024 12:16 PM, Lizhi Hou wrote:
>>
>> On 8/9/24 09:11, Jeffrey Hugo wrote:
>>> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>>>> b/drivers/accel/amdxdna/aie2_pci.c
>>>> new file mode 100644
>>>> index 000000000000..3660967c00e6
>>>> --- /dev/null
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>> @@ -0,0 +1,182 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/amd-iommu.h>
>>>> +#include <linux/errno.h>
>>>> +#include <linux/firmware.h>
>>>> +#include <linux/iommu.h>
>>>
>>> You are clearly missing linux/pci.h and I suspect many more.
>> Other headers are indirectly included by "aie2_pci.h" underneath.
>
> aie2_pci.h also does not directly include linux/pci.h

it is aie2_pci.h --> amdxdna_pci_drv.h --> linux/pci.h.

It compiles without any issue.

>
>>>> +
>>>> +    ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>>>> +    if (ret) {
>>>> +        XDNA_ERR(xdna, "Failed to set DMA mask: %d", ret);
>>>> +        goto release_fw;
>>>> +    }
>>>> +
>>>> +    nvec = pci_msix_vec_count(pdev);
>>>
>>> This feels weird.  Can your device advertise variable number of 
>>> MSI-X vectors?  It only works if all of the vectors are used?
>> That is possible. the driver supports different hardware. And the fw 
>> assigns vector for hardware context dynamically. So the driver needs 
>> to allocate all vectors ahead.
>
> So, if the device requests N MSIs, but the host is only able to 
> satisfy 1 (or some number less than N), the fw is completely unable to 
> function?
The fw may return interrupt 2 is assigned to hardware context. Then the 
driver may not deal with it in this case. I think it is ok to fail if 
the system has very limited resource.
>
>
>>>> +struct psp_device *aie2m_psp_create(struct device *dev, struct 
>>>> psp_config *conf)
>>>> +{
>>>> +    struct psp_device *psp;
>>>> +    u64 offset;
>>>> +
>>>> +    psp = devm_kzalloc(dev, sizeof(*psp), GFP_KERNEL);
>>>> +    if (!psp)
>>>> +        return NULL;
>>>> +
>>>> +    psp->dev = dev;
>>>> +    memcpy(psp->psp_regs, conf->psp_regs, sizeof(psp->psp_regs));
>>>> +
>>>> +    psp->fw_buf_sz = ALIGN(conf->fw_size, PSP_FW_ALIGN) + 
>>>> PSP_FW_ALIGN;
>>>> +    psp->fw_buffer = devm_kmalloc(psp->dev, psp->fw_buf_sz, 
>>>> GFP_KERNEL);
>>>
>>> Feels like this (and a bunch of other instances I haven't commented 
>>> on) should be drmm_* allocs.
>>
>> The PSP code is kind of low level and directly interact with 
>> hardware. All the PSP interfaces use struct device * instead of 
>> drm_device. I think it is kind make sense because PSP is not related 
>> to drm.
>>
>> I will scan all other allocs and change them to drmm_* allocs for the 
>> code related to drm_device. Does this sound ok to you?
>
> I don't think so.  Look up
> drm/todo: Add TODO entry for "lints"
> on the dri-devel list, and its history.
Ok, I will replace them with drm_*alloc.
>
>>
>>>
>>>> +    if (!psp->fw_buffer) {
>>>> +        dev_err(psp->dev, "no memory for fw buffer");
>>>> +        return NULL;
>>>> +    }
>>>> +
>>>> +    psp->fw_paddr = virt_to_phys(psp->fw_buffer);
>>>
>>> I'm pretty sure virt_to_phys() is always wrong
>>
>> The hardware exposes several registers to communicate with platform 
>> PSP (AMD Platform Security Processor) to load NPU firmware. And PSP 
>> only accept host physical address with current hardware.
>>
>> I understand usually virt_to_phys() should not be needed for device 
>> driver. And maybe it is ok to use if there is hardware requirement? I 
>> can see some drivers use it as well.
>
> Eh.  I guess the PSP would never have an IOMMU in front of it or 
> anything like that.
>
> This feels similar to what Qualcomm MSM platforms do, which uses the 
> remoteproc framework.  Not sure if that helps you here.
>
> This still feels not good, but you might have a valid exception here. 
> I'd suggest putting a justification comment in the code through. 
> Someone looking at this in X months might raise the same question.
Sure. I will add a justification.
>
>>
>>>
>>>> +    offset = ALIGN(psp->fw_paddr, PSP_FW_ALIGN) - psp->fw_paddr;
>>>> +    psp->fw_paddr += offset;
>>>> +    memcpy(psp->fw_buffer + offset, conf->fw_buf, conf->fw_size);
>>>> +
>>>> +    return psp;
>>>> +}
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_drm.c 
>>>> b/drivers/accel/amdxdna/amdxdna_drm.c
>>>> new file mode 100644
>>>> index 000000000000..91e4f9c9dac9
>>>> --- /dev/null
>>>> +++ b/drivers/accel/amdxdna/amdxdna_drm.c
>>>
>>> What is the point of this file?  Seems like all of this could just 
>>> be in amdxdna_pci_drv.c
>> The future product may have NPU with non-pci device. So it might be a 
>> amdxdna_plat_drv.c and share the same amdxdna_drm.c in the future.
>
> This seems like a weak justification.  "may" is not definitive. If 
> such hardware appears, you could refactor the driver at that time.
Ok, I will merge them.
>
>
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>>>> b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>> new file mode 100644
>>>> index 000000000000..7d0cfd918b0e
>>>> --- /dev/null
>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>> @@ -0,0 +1,118 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/module.h>
>>>> +
>>>> +#include "amdxdna_pci_drv.h"
>>>> +
>>>> +/*
>>>> + *  There are platforms which share the same PCI device ID
>>>> + *  but have different PCI revision IDs. So, let the PCI class
>>>> + *  determine the probe and later use the (device_id, rev_id)
>>>> + *  pair as a key to select the devices.
>>>> + */
>>>
>>> Huh?  So, VID == AMD, DID == 0x17f0, rev == 0x1 is a completely 
>>> different device?  That feels like a PCIe spec violation...
>> Maybe the comment is misleading. The hardware with same device id 
>> 0x17f0 uses the same commands, registers etc. And they are same 
>> device with different revisions.
>
> Then I don't understand why you need to do the class matching. Match 
> on PCI_VENDOR_ID_AMD with the Device IDs you need to support like a 
> "normal" PCI(e) driver?

ok. I will used device id to bind.


Thanks,

Lizhi

>
>>>
>>>> +static const struct pci_device_id pci_ids[] = {
>>>> +    { PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_ANY_ID),
>>>> +        .class = PCI_CLASS_SP_OTHER << 8,
>>>
>>> Weird.  I would have expected the Accelerator class to be used
>> We contacted our hardware team to figure out why accelerator class is 
>> not used here. Some of hardware is already released. Hopefully 
>> hardware team may consider to use accelerator class with new products.
