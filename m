Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5ACD05329
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 18:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04AC10E7AB;
	Thu,  8 Jan 2026 17:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="juSxP7SK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC4010E7AB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 17:52:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HueCaGg0y55s4MdPb7g9uZhDDgIu/dKjGX7f+oSSlppmd033CZq54z1z/g21wKNQJPUTbESjX3P9czxWQsyDwIWlehcRyzMvco2JyO+BKC/q0ouXXkj4vldYs/ySfFX/38gRUuPLxAl59pvE2EWfxkaU/EZ0eAkebejm59dCHAmuChGheAajiqSznZGbFOEmICV1Qw7MHg06gOY/SusBsZaw+S+R4tCd0dM7xi9z7ploJjRW4f3a0c38eFrbUoPzyPX7A4uHGE/PDdYtWSrQw/xq0AdUCzUx3y01wsLmfhAjH3tBxxRWvaqY0cLuqY97mkA/yGqzo81MzdvTTmjOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsI2teT9GKS8/eBkwS4LsgzRB8jfwMYoxc03+ymP+Gg=;
 b=o7JrVWr6eOeJWGAtwa22xlnQRziQzt3L47wPaMWPqSP3auGltm+/ebeAnXl3UP2P10pkL0cEvz+Gb65QJ5m2ILp5CGnkfUvYTPJirQzlBrA1wIGHqSdDzJuelM1dc+ZEbGCgeJo3OKVi+akqMYgKoOd2ZjHzzNqRMqhdAZEYvSbh+23nTdDu2pd/hu4heI8+ZvScWF6iD8ZY2CR8NDWeHTMyFzqNXtsKwxHzBKMECbYzm1lra7oqLpYkcxPi5f74iJE2fndG2y7PJsEhdS2375+V5HCzpcIuDV9zzJb4buJ1EDE44ME+n+Xl5tuTV6CN4bxnLMrbIDOUcPTYcp/3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsI2teT9GKS8/eBkwS4LsgzRB8jfwMYoxc03+ymP+Gg=;
 b=juSxP7SKHu7TMeetWM3C+9IzBzyaTN9sWfP0jos4rKGl6f9PVq2P6UdxF0zmHSmEFJFQuHSzek8i4eLdymXAMBYyLq6WO/Fx3Ptqnw46gegr7qlo9YN3vat22gJMXjNc3ikt5MNAm2o4VDr2kuWdBCWiO1h6fS9n2UHN1d8k2WQ=
Received: from BYAPR08CA0034.namprd08.prod.outlook.com (2603:10b6:a03:100::47)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:52:00 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:100:cafe::93) by BYAPR08CA0034.outlook.office365.com
 (2603:10b6:a03:100::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:51:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:51:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 8 Jan
 2026 11:51:58 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Jan
 2026 11:51:58 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 8 Jan 2026 11:51:57 -0600
Message-ID: <e7b9b328-8fa9-dac9-20a9-f9530f3195ac@amd.com>
Date: Thu, 8 Jan 2026 09:51:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1 1/2] accel/amdxdna: Update message DMA buffer allocation
Content-Language: en-US
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
 <812bcf91-d903-410f-91c8-8a71be3f3f02@amd.com>
 <1b8b49a7-762c-f530-3744-231beef9942f@amd.com>
 <33765a47-b37f-4435-b12c-c1d712ebc194@amd.com>
 <e96f3ed6-fed5-649a-d953-eed3dac7d82a@amd.com>
 <77edbbff-661e-4a4e-b455-8cda6bd84b9e@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <77edbbff-661e-4a4e-b455-8cda6bd84b9e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc1e6a8-e373-4b7c-9bfd-08de4ede9f3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTRIYm1LaVBHbXFOdWxyN2tnOGkyRG85Tmtod1hBRm55Q0tkSmloRFJXc1JJ?=
 =?utf-8?B?TEw3RXc3TllWMWlFZy9MZlNwZTZyYmhwV1dxY2VlcS9OWWNYUHBFd3hLREM1?=
 =?utf-8?B?ZjJlcUNoNUtGdEpYQm00cnVjeDZGWjljSWpibGxvWXRUYTJ0bmg5MC9vT1dp?=
 =?utf-8?B?NE5sb2JSVnllYVBYaVFlZ2lTOVJHd05QR2prN2N1OTFNUng0Zng4eldJbWZa?=
 =?utf-8?B?VjEwbU84VDJGUDNOQ2QzQlB0cmJkR3BiNTVnTnRMaWVweUtEZ0JEb3p3cFNn?=
 =?utf-8?B?VW52cEY4N2E5bXFPQUZ2eEc4SVNOdUZTT3NsNTYrM29tbjcwMnJ1L2JIbTZu?=
 =?utf-8?B?VGxkWVVZdS9hbTJkNFVJSDdjYklTcWhWWldwTXRkd0JXRC91Z21FUDZ2Skw2?=
 =?utf-8?B?alhacS9OWGRBWUs0OWRGektpRks1ZzV3bWhQQlhrNzNKYmhncmdBR0VtNTVx?=
 =?utf-8?B?SXd3eHdoSnVMT2xjSWtLUW00Z1g3TFo2dGt6M3ArTHQvbm8wekJZZyszRU9S?=
 =?utf-8?B?OTA3anFEdkpqcVdHc0VnVDgrOGRON204Z2xWOVhzVWdrQzdKUStZUVJ5TkxC?=
 =?utf-8?B?MDhkL1A5c1pHVUxoM3RQSEZkT2ZrTkVHQzVkQko5cTVwOG1NU2MzWlpZWTJM?=
 =?utf-8?B?cFJnWFowT21LSVFSYWlvK1ZqM0ZlaGJucmVUY0VjOFFHV2EzT2RqQ1lOMCtF?=
 =?utf-8?B?SWlVUXRhZ1VlQk1uN3l2NHpSSVE2cDNaN00vc1M2V2psZFY1NHFtRDlPdGFJ?=
 =?utf-8?B?Z3dJMG85T01qN290ZmR3K3hQM3NCcG5jMWcxckpSaVZoa3NrK0N5U2oyWkM2?=
 =?utf-8?B?WThHdEM0cFhDQjhTMnUyM3lEazlHVmlzdjBnY3o4aTdGcUNEQ2dpRzZydEdp?=
 =?utf-8?B?TmVnalRsM2xXSEVsUWlYR2JIc3JVNHNKSTV0YmZUREtkSGszU2I2WXRyWEhZ?=
 =?utf-8?B?N0ZiYW1JTFVjZU9ITlJZdmtSTWJLZmxjNnRmNFlHWkROdTQ2ck5zUGRpTmxo?=
 =?utf-8?B?amVXRmFLcmpyY1Q0VVFjWWttMDBEM0F4NWEzbHM4Smc5eG9NY1IwRXNZUDlD?=
 =?utf-8?B?RVdGN1k4R2xFYUd6RUNYVDA5OGZyZjAwdWR1aXZ5K1pKZUZ6Z1hrUU95QnR5?=
 =?utf-8?B?cXlvUWtpVEF4Z25XYnd2S3YrQ29vdjFWcWlmNktqaTJWcEw4NzVjYUUwYWdW?=
 =?utf-8?B?cGNQV1hYM2xlRjhzODBaR1ZxYTh3R01PWVhaQkRpdnF4L0gxc29kVWRUbHBm?=
 =?utf-8?B?UU5pWU82OHhFRm1Fc25ZZzhiTk15M1paNlBseEU1bS91VG5Va3EyYXI2cERP?=
 =?utf-8?B?Q096RVdiMlJNNnZ0ckpmcXZVa01Zelh6Yjg0U3BKbStITjJkUU85aE5FRkxI?=
 =?utf-8?B?WXZYQU1zbk1RNDMrMGplTjBKRU8rTW5pdkp5cEtrWklSL1piY2tLV01vZEdw?=
 =?utf-8?B?YXNGaytweGprSFBRMEI1bExENUx1UTBpa0FiYjBuZ3BmQVJHYThTRWxLK3Vl?=
 =?utf-8?B?elMyK0lVN0NTOXJ2QWgweFE0VThPOVhyeDk2Smx6WVVJV1lpNlVxR0Q3d0lz?=
 =?utf-8?B?WGttd1JSc2F0VzJmZzN3OXVKa3ZMbEY0QUNhZ0kvV0c4NkdXUzNUQm5rNWtj?=
 =?utf-8?B?SnFiK3llU2hqVXYxbnh3eWJjUmw0SWFVd2t6WDV3NTUyTGc4V3hwUWRQanor?=
 =?utf-8?B?N0dRSk5qemZDT3RmY21KQmZpVm1RNFQvdFkzZXAwcFBPemVIbmlUS2tDSVg5?=
 =?utf-8?B?TlNORFNvQ2JXZy8vdFNGd0o0MHlEZUM3cVBhellzUk96cFMzOXFNWXgvRm5X?=
 =?utf-8?B?dk0zYkd6VlRYaUNPaHg5SzRYODdWMzNMZTE1ZkxLNjQrRDkrRHJBMHJXK1la?=
 =?utf-8?B?Ync5clUrWlFkRHBLSG5wSjd1ODlsdFNid1dqSWo1VmNjcDEvakVEWGN3RUhl?=
 =?utf-8?B?RWlzbnozd1J0elVZMnpuYndoeTJybG9jR2hDTnZ6RkJOdlhQdkVYV1JWNDB2?=
 =?utf-8?B?VGtXc2dDdHZ0M3NVNkFyUFQ5Vng3cHJIamRNejIrdlVGbzhqRHhVRkdnRjZu?=
 =?utf-8?B?NENIUWJHTjZGaDlDZk5FMU12VXpJUFFDM3RBWjVHWloxa1hwL2lTeURKMExq?=
 =?utf-8?Q?aYo8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:51:59.3074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc1e6a8-e373-4b7c-9bfd-08de4ede9f3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
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

Applied to drm-misc-next.

On 1/7/26 19:26, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 1/7/2026 4:20 PM, Lizhi Hou wrote:
>>
>> On 1/7/26 14:07, Mario Limonciello wrote:
>>> On 1/7/26 4:05 PM, Lizhi Hou wrote:
>>>>
>>>> On 1/7/26 13:19, Mario Limonciello wrote:
>>>>> On 12/18/25 7:43 PM, Lizhi Hou wrote:
>>>>>> The latest firmware requires the message DMA buffer to
>>>>>>    - have a minimum size of 8K
>>>>>>    - use a power-of-two size
>>>>>>    - be aligned to the buffer size
>>>>>>    - not cross 64M boundary
>>>>>>
>>>>>> Update the buffer allocation logic to meet these requirements and 
>>>>>> support
>>>>>> the latest firmware.
>>>>>
>>>>> We can't guarantee that kernel and firmware are moving at the same 
>>>>> time.
>>>>> What happens if you run old firmware with these changes?
>>>>
>>>> The old firmware runs fine this these changes. The new firmware 
>>>> adds more alignment and size requirements which the old one does 
>>>> not need.
>>>
>>> Ah OK - so patch 2 won't reject current firmware right?
>>
>> Correct. It will not reject current firmware.
>>
> Thank for confirming, no other concerns with this patch.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
>>
>> Lizhi
>>
>>>
>>>>
>>>>
>>>> Lizhi
>>>>
>>>>>
>>>>> If the old firmware can't run with these changes then it would be 
>>>>> better to instead add a fallback system.
>>>>>
>>>>> IE:
>>>>> 1) kernel tries to load new firmware name and use new behavior
>>>>> 2) if firmware is missing, kernel tries to load old firmware name 
>>>>> and use old behavior.
>>>>> 3) if firmware is missing in old name then fail probe
>>>>>
>>>>>
>>>>>>
>>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>>> ---
>>>>>>   drivers/accel/amdxdna/aie2_error.c   | 10 ++++-----
>>>>>>   drivers/accel/amdxdna/aie2_message.c | 33 +++++++++++++++++++ 
>>>>>> +--------
>>>>>>   drivers/accel/amdxdna/aie2_pci.h     |  5 +++++
>>>>>>   3 files changed, 33 insertions(+), 15 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/ 
>>>>>> amdxdna/aie2_error.c
>>>>>> index d452008ec4f4..5e82df2b7cf6 100644
>>>>>> --- a/drivers/accel/amdxdna/aie2_error.c
>>>>>> +++ b/drivers/accel/amdxdna/aie2_error.c
>>>>>> @@ -338,8 +338,7 @@ void aie2_error_async_events_free(struct 
>>>>>> amdxdna_dev_hdl *ndev)
>>>>>>       destroy_workqueue(events->wq);
>>>>>>       mutex_lock(&xdna->dev_lock);
>>>>>>   -    dma_free_noncoherent(xdna->ddev.dev, events->size, 
>>>>>> events->buf,
>>>>>> -                 events->addr, DMA_FROM_DEVICE);
>>>>>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, 
>>>>>> events- >addr);
>>>>>>       kfree(events);
>>>>>>   }
>>>>>>   @@ -355,8 +354,8 @@ int aie2_error_async_events_alloc(struct 
>>>>>> amdxdna_dev_hdl *ndev)
>>>>>>       if (!events)
>>>>>>           return -ENOMEM;
>>>>>>   -    events->buf = dma_alloc_noncoherent(xdna->ddev.dev, 
>>>>>> total_size, &events->addr,
>>>>>> -                        DMA_FROM_DEVICE, GFP_KERNEL);
>>>>>> +    events->buf = aie2_alloc_msg_buffer(ndev, &total_size, 
>>>>>> &events- >addr);
>>>>>> +
>>>>>>       if (!events->buf) {
>>>>>>           ret = -ENOMEM;
>>>>>>           goto free_events;
>>>>>> @@ -396,8 +395,7 @@ int aie2_error_async_events_alloc(struct 
>>>>>> amdxdna_dev_hdl *ndev)
>>>>>>   free_wq:
>>>>>>       destroy_workqueue(events->wq);
>>>>>>   free_buf:
>>>>>> -    dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>>>>>> -                 events->addr, DMA_FROM_DEVICE);
>>>>>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, 
>>>>>> events- >addr);
>>>>>>   free_events:
>>>>>>       kfree(events);
>>>>>>       return ret;
>>>>>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>>>>>> b/drivers/accel/ amdxdna/aie2_message.c
>>>>>> index 051f4ceaabae..99215328505e 100644
>>>>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>>>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>>>>> @@ -55,6 +55,22 @@ static int aie2_send_mgmt_msg_wait(struct 
>>>>>> amdxdna_dev_hdl *ndev,
>>>>>>       return ret;
>>>>>>   }
>>>>>>   +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 
>>>>>> *size,
>>>>>> +                dma_addr_t *dma_addr)
>>>>>> +{
>>>>>> +    struct amdxdna_dev *xdna = ndev->xdna;
>>>>>> +    int order;
>>>>>> +
>>>>>> +    *size = max(*size, SZ_8K);
>>>>>> +    order = get_order(*size);
>>>>>> +    if (order > MAX_PAGE_ORDER)
>>>>>> +        return NULL;
>>>>>> +    *size = PAGE_SIZE << order;
>>>>>> +
>>>>>> +    return dma_alloc_noncoherent(xdna->ddev.dev, *size, dma_addr,
>>>>>> +                     DMA_FROM_DEVICE, GFP_KERNEL);
>>>>>> +}
>>>>>> +
>>>>>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>>>>>>   {
>>>>>>       DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
>>>>>> @@ -346,14 +362,13 @@ int aie2_query_status(struct 
>>>>>> amdxdna_dev_hdl *ndev, char __user *buf,
>>>>>>   {
>>>>>>       DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
>>>>>>       struct amdxdna_dev *xdna = ndev->xdna;
>>>>>> +    u32 buf_sz = size, aie_bitmap = 0;
>>>>>>       struct amdxdna_client *client;
>>>>>>       dma_addr_t dma_addr;
>>>>>> -    u32 aie_bitmap = 0;
>>>>>>       u8 *buff_addr;
>>>>>>       int ret;
>>>>>>   -    buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, 
>>>>>> &dma_addr,
>>>>>> -                      DMA_FROM_DEVICE, GFP_KERNEL);
>>>>>> +    buff_addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>>>>>       if (!buff_addr)
>>>>>>           return -ENOMEM;
>>>>>>   @@ -363,7 +378,7 @@ int aie2_query_status(struct 
>>>>>> amdxdna_dev_hdl *ndev, char __user *buf,
>>>>>>         *cols_filled = 0;
>>>>>>       req.dump_buff_addr = dma_addr;
>>>>>> -    req.dump_buff_size = size;
>>>>>> +    req.dump_buff_size = buf_sz;
>>>>>>       req.num_cols = hweight32(aie_bitmap);
>>>>>>       req.aie_bitmap = aie_bitmap;
>>>>>>   @@ -391,7 +406,7 @@ int aie2_query_status(struct 
>>>>>> amdxdna_dev_hdl *ndev, char __user *buf,
>>>>>>       *cols_filled = aie_bitmap;
>>>>>>     fail:
>>>>>> -    dma_free_noncoherent(xdna->ddev.dev, size, buff_addr, 
>>>>>> dma_addr, DMA_FROM_DEVICE);
>>>>>> +    aie2_free_msg_buffer(ndev, buf_sz, buff_addr, dma_addr);
>>>>>>       return ret;
>>>>>>   }
>>>>>>   @@ -402,19 +417,19 @@ int aie2_query_telemetry(struct 
>>>>>> amdxdna_dev_hdl *ndev,
>>>>>>       DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
>>>>>>       struct amdxdna_dev *xdna = ndev->xdna;
>>>>>>       dma_addr_t dma_addr;
>>>>>> +    u32 buf_sz = size;
>>>>>>       u8 *addr;
>>>>>>       int ret;
>>>>>>         if (header->type >= MAX_TELEMETRY_TYPE)
>>>>>>           return -EINVAL;
>>>>>>   -    addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
>>>>>> -                     DMA_FROM_DEVICE, GFP_KERNEL);
>>>>>> +    addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>>>>>       if (!addr)
>>>>>>           return -ENOMEM;
>>>>>>         req.buf_addr = dma_addr;
>>>>>> -    req.buf_size = size;
>>>>>> +    req.buf_size = buf_sz;
>>>>>>       req.type = header->type;
>>>>>>         drm_clflush_virt_range(addr, size); /* device can access */
>>>>>> @@ -440,7 +455,7 @@ int aie2_query_telemetry(struct 
>>>>>> amdxdna_dev_hdl *ndev,
>>>>>>       header->minor = resp.minor;
>>>>>>     free_buf:
>>>>>> -    dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, 
>>>>>> DMA_FROM_DEVICE);
>>>>>> +    aie2_free_msg_buffer(ndev, buf_sz, addr, dma_addr);
>>>>>>       return ret;
>>>>>>   }
>>>>>>   diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>>>>> amdxdna/aie2_pci.h
>>>>>> index a929fa98a121..e1745f07b268 100644
>>>>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>>>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>>>>> @@ -336,6 +336,11 @@ int aie2_sync_bo(struct amdxdna_hwctx 
>>>>>> *hwctx, struct amdxdna_sched_job *job,
>>>>>>            int (*notify_cb)(void *, void __iomem *, size_t));
>>>>>>   int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct 
>>>>>> amdxdna_sched_job *job,
>>>>>>                int (*notify_cb)(void *, void __iomem *, size_t));
>>>>>> +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 
>>>>>> *size,
>>>>>> +                dma_addr_t *dma_addr);
>>>>>> +#define aie2_free_msg_buffer(ndev, size, buff_addr, 
>>>>>> dma_addr)        \
>>>>>> +    dma_free_noncoherent((ndev)->xdna->ddev.dev, size, 
>>>>>> buff_addr,    \
>>>>>> +                 dma_addr, DMA_FROM_DEVICE)
>>>>>>     /* aie2_hwctx.c */
>>>>>>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>>>>>
>>>
>
