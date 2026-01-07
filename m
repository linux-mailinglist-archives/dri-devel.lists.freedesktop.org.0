Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C2D00451
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 23:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D8B10E608;
	Wed,  7 Jan 2026 22:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sKaXwa7v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013066.outbound.protection.outlook.com
 [40.93.201.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2AA10E608
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 22:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DA2MXwFAG3ZpyzfUNPFirIYcVLOP9rA16FPkrIeyVw4c3EkOe0lDtnSzJLa5o44DCy8pXN8GyrUewzlajko+K/FnuI58xoWTBdDUXT0oK61HCE1ss6cz9/W9mFs9TJDc9AfdVk8sYvPQdXOaDvv68AN1TxD3MUdeiwl+AfX9tYSVl5h+H9g8DDedUvntMnb7aphip91HjOMfsZrtdZ75HEs0gA7YMlXiMhf713+OEXMEOhNQWcprE755QZfcL36RTDnw+Q9kjxmHZLRzNKGAxaglI5FvF9XKRucgOX7A0ixIfSq5YafQT+cXF3OnSghUcSqJ9b5WHEs+2D7fxSrDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Cs+e8RTpsDOTXcDlpL0XOsPYYiR7NV/MEq0TCQMFiw=;
 b=xFU85DhnS2pbMgBcENmnIhVXzsNT60TdTCQGxacO/5JnRdz1IcYi9xsNd1ODThZ/c8XqgNEBpNH1+KCeJ7I0krelRHE/1TRXinn3KT+F6GOSPuU0PjxUVw1Arn1I4g4JQ1N0fXkWIHHg5wvbCC2u93CjQs2z1kfUoL7e100gtz7tGWHFL8pHYgVKGAGgL5+NcA6eyRz0J11hEvQQI7ckdIV5k1gd2nAfFiKoX4HoPedWvdJuqvjaJYrwj4dZUNCZLBbM+ZKXeR7tA76zGZL+kUQ92bCixli/FfdZbErEGpzsUMhztTLdDYJ2hJEhZA/OLTpT2jVzUF0kUe81JqU9lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Cs+e8RTpsDOTXcDlpL0XOsPYYiR7NV/MEq0TCQMFiw=;
 b=sKaXwa7vubXvkRQCzFno4103xG+BYy7w3j/NEc3aoJH6J5v3PxO6PvlXKXQ6Qao8DU+f66nW+sJKJXoWkIQfqn0tl3UrPJ9zrlyztpvapfsNHxZAx7gjVYCrw4PgPu56fxsrCW8WjQEGBF4BzI92OqYUU74XshJj/wRoikiFsMY=
Received: from BL1PR13CA0443.namprd13.prod.outlook.com (2603:10b6:208:2c3::28)
 by PH7PR12MB8793.namprd12.prod.outlook.com (2603:10b6:510:27a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 22:05:16 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::28) by BL1PR13CA0443.outlook.office365.com
 (2603:10b6:208:2c3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Wed, 7
 Jan 2026 22:05:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 22:05:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 16:05:15 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 16:05:15 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 14:05:14 -0800
Message-ID: <1b8b49a7-762c-f530-3744-231beef9942f@amd.com>
Date: Wed, 7 Jan 2026 14:05:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1 1/2] accel/amdxdna: Update message DMA buffer allocation
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
 <812bcf91-d903-410f-91c8-8a71be3f3f02@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <812bcf91-d903-410f-91c8-8a71be3f3f02@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|PH7PR12MB8793:EE_
X-MS-Office365-Filtering-Correlation-Id: e14eeedf-d267-4bae-e187-08de4e38d6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlNUc1JOcGloaW9nU3BBNEk4UTVmQXhSTFlkL1hwOUM1SVBnMVVsN3UyUkpM?=
 =?utf-8?B?YWdQKy9JRzFRd3RreGVpUWxHL0hwU1hxQlpNQTllOE4xWFVBOEpCcnROdVlZ?=
 =?utf-8?B?eUhiMUozWXV4YXZMc1NmcmY0N2l1K1FxZ1d1WDBvU0tha0tjK2Zod0l4L0pJ?=
 =?utf-8?B?bis3N0dBNlNPYnhQbS83SDFUUzNZbUJxT0VqQUVBYktzOUVHZmU5NTMwRktC?=
 =?utf-8?B?NWdyNUZOOUpnbHVHNnIyc0tQREhXUy9XY0hpWkR4Tm1HZTM5bFg4NDBLN3gw?=
 =?utf-8?B?L2UxR0QvRnp2NFoxNmFSZks1Mi9haUtBTkk0Nml4b1p2OU42YkpXaWswdWdr?=
 =?utf-8?B?enVSYWI5Q2xBRG1hRGxlSFB1UzlDOHdBUmpLT0dmRGVqby9xY3BVbVNLcDhx?=
 =?utf-8?B?UGFzckhCRysydUhUdk45MmxwY21Ha1NxUXdHUlo5Y3k5SzBLR0JxbmNKSWVL?=
 =?utf-8?B?MVhmWU5obHVEMGh3d3ZYUytYVnNtcTdjcmRnZ3c1eTNGUzNEVGYxUTI2RWdy?=
 =?utf-8?B?Rm5Bd1RFbXR5N2hOYXVYV2Y2aHZNS1E0ejdoMXhqTHI0SmlKTjdQenJUMUwv?=
 =?utf-8?B?OERPa1hGK0pIU1YwZkVzREhVWFBldmg5c1IwdHJUaHAweGRBaWxuT3MxUTVY?=
 =?utf-8?B?N2ExS1QwWGVLTWpTMDhTaldua1U3ZHBGMk82QVdLRlBXa05hZ2tuUTdNTlA0?=
 =?utf-8?B?ZnZpWEpOU3JEbnR0Ky9PTlpERGlKaFJIUFJzRXhDUCt5eTBuQ0NvKzY0OHFx?=
 =?utf-8?B?SzcyRi9Ec3hWSmcyamEwYUZ0cnUrZldlaGtmSWMxZjlTUGJoU0R1R2FHWFEr?=
 =?utf-8?B?cTZFZ2kyV0FWcW5Cc250anduQlJNR0dTUVMvK0wweUQrTmNIK1BNL1J3Wmd6?=
 =?utf-8?B?VFpuR3lzOUsvTWJJcWVoNkJpYmRKNmNNdU4wbkViemtVbkZZODkvRUcrUFZM?=
 =?utf-8?B?TXJ6Mk5ZcVI4SDRBY0JDUnZ0cEZGWTJTNERWbGNKcG9OeEFoSExNdEJRRjFk?=
 =?utf-8?B?Yy9vWDRhUjlHbUkzWEJhVjcwbCtJditoZzZYblRsc0dVNTQvNDdHQlpkemo2?=
 =?utf-8?B?S2NwSGVLQTZNNlJuVDYyOVp1bzhhSG9JdmFxckJlWHVsUjYzWm80ZWxFaDhy?=
 =?utf-8?B?a0wxTGw4bkpmNzFwWUVhTFlhenhVVzdwdDBBQkZNTUFrRHh5TFlsYm5HSldC?=
 =?utf-8?B?dXNlTzU1WWFSQ3htQ3lTMWJFSmw5c3gvZWd5eGliY2pDSE10Wk1MNzh0SzJu?=
 =?utf-8?B?akp2RW1oRTRzMTA0SFNxN3M5dW15M3hzcmFpZGp1cFl5enBFVml2TzB0YWlS?=
 =?utf-8?B?UllQSUEyZzFXWjJscGFCVFhKVXorNW82d0phTXlvZ1ZVTjFHU29hc242TEJv?=
 =?utf-8?B?dU1ueXkrL2NxSExEbzgybldqWFpMeCttMlR6YnN5STNUVldFbkdPYjJyVWdG?=
 =?utf-8?B?dkszaTV6ZThJdm1lbXZqSktsZWJrR0N2RVZIODFDVGYwb3NHSjhFM1VvMko2?=
 =?utf-8?B?MlZsa3ZlYWRWNVV0NHdicUtIcURBSys4aElqSkFmcDQxaytjTzlEeXFicG5m?=
 =?utf-8?B?dDVxYkJZVkhkU1N4c1BmYVIyY3Z4c3drcnBDcFBlY3NxK1F0aW9XS0JHeU1t?=
 =?utf-8?B?U0lPT0xHVUZiNURHWXlqTWU3TUhCMFVDZFpUSENlVnlNc2plQTE1RUMvMndO?=
 =?utf-8?B?UlkyamJCemtVcVRIWFl2M1JMT0lsSjJYOVRFUVRoYjBtenFST3lVL3R4SFZ4?=
 =?utf-8?B?ZlRReXgyUXRQYnZISmd4ODZkS05Jd2xLeW01RmxlTTVPam9tSkhaeE1QbWpx?=
 =?utf-8?B?WlYweHFLZzJ6eXhkcFo2N2ZKcm5MUnpnSGNiNi9DVmNrNVVSQjJzS0s5UkNW?=
 =?utf-8?B?clV4WXFWTkMrTndmMlBjMlhxS01tRVpPT0FuaUtBdmhDdmthbEVxUW1Nbyt0?=
 =?utf-8?B?c1N0SFl4M0VVRlpXVnpFdUZYdGZaRitkS0xKd1hEZ1pqRGc4S0RDQ3FBL1lM?=
 =?utf-8?B?ZnRITVlkakFaUTBzK0lFbzN6eWZwVjZHaWcwRU1xa0NWNDd4bHpZbW9rK1ZP?=
 =?utf-8?B?ZDVzOWZhSkNNWVg2WCtTNlEvY0VXVjVwSlVKMys1d3ErWXdoSVprMnlZZHFn?=
 =?utf-8?Q?0r1c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 22:05:15.9947 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e14eeedf-d267-4bae-e187-08de4e38d6b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8793
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


On 1/7/26 13:19, Mario Limonciello wrote:
> On 12/18/25 7:43 PM, Lizhi Hou wrote:
>> The latest firmware requires the message DMA buffer to
>>    - have a minimum size of 8K
>>    - use a power-of-two size
>>    - be aligned to the buffer size
>>    - not cross 64M boundary
>>
>> Update the buffer allocation logic to meet these requirements and 
>> support
>> the latest firmware.
>
> We can't guarantee that kernel and firmware are moving at the same time.
> What happens if you run old firmware with these changes?

The old firmware runs fine this these changes. The new firmware adds 
more alignment and size requirements which the old one does not need.


Lizhi

>
> If the old firmware can't run with these changes then it would be 
> better to instead add a fallback system.
>
> IE:
> 1) kernel tries to load new firmware name and use new behavior
> 2) if firmware is missing, kernel tries to load old firmware name and 
> use old behavior.
> 3) if firmware is missing in old name then fail probe
>
>
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_error.c   | 10 ++++-----
>>   drivers/accel/amdxdna/aie2_message.c | 33 ++++++++++++++++++++--------
>>   drivers/accel/amdxdna/aie2_pci.h     |  5 +++++
>>   3 files changed, 33 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_error.c 
>> b/drivers/accel/amdxdna/aie2_error.c
>> index d452008ec4f4..5e82df2b7cf6 100644
>> --- a/drivers/accel/amdxdna/aie2_error.c
>> +++ b/drivers/accel/amdxdna/aie2_error.c
>> @@ -338,8 +338,7 @@ void aie2_error_async_events_free(struct 
>> amdxdna_dev_hdl *ndev)
>>       destroy_workqueue(events->wq);
>>       mutex_lock(&xdna->dev_lock);
>>   -    dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>> -                 events->addr, DMA_FROM_DEVICE);
>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, 
>> events->addr);
>>       kfree(events);
>>   }
>>   @@ -355,8 +354,8 @@ int aie2_error_async_events_alloc(struct 
>> amdxdna_dev_hdl *ndev)
>>       if (!events)
>>           return -ENOMEM;
>>   -    events->buf = dma_alloc_noncoherent(xdna->ddev.dev, 
>> total_size, &events->addr,
>> -                        DMA_FROM_DEVICE, GFP_KERNEL);
>> +    events->buf = aie2_alloc_msg_buffer(ndev, &total_size, 
>> &events->addr);
>> +
>>       if (!events->buf) {
>>           ret = -ENOMEM;
>>           goto free_events;
>> @@ -396,8 +395,7 @@ int aie2_error_async_events_alloc(struct 
>> amdxdna_dev_hdl *ndev)
>>   free_wq:
>>       destroy_workqueue(events->wq);
>>   free_buf:
>> -    dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>> -                 events->addr, DMA_FROM_DEVICE);
>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, 
>> events->addr);
>>   free_events:
>>       kfree(events);
>>       return ret;
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index 051f4ceaabae..99215328505e 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -55,6 +55,22 @@ static int aie2_send_mgmt_msg_wait(struct 
>> amdxdna_dev_hdl *ndev,
>>       return ret;
>>   }
>>   +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
>> +                dma_addr_t *dma_addr)
>> +{
>> +    struct amdxdna_dev *xdna = ndev->xdna;
>> +    int order;
>> +
>> +    *size = max(*size, SZ_8K);
>> +    order = get_order(*size);
>> +    if (order > MAX_PAGE_ORDER)
>> +        return NULL;
>> +    *size = PAGE_SIZE << order;
>> +
>> +    return dma_alloc_noncoherent(xdna->ddev.dev, *size, dma_addr,
>> +                     DMA_FROM_DEVICE, GFP_KERNEL);
>> +}
>> +
>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>>   {
>>       DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
>> @@ -346,14 +362,13 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>> *ndev, char __user *buf,
>>   {
>>       DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
>>       struct amdxdna_dev *xdna = ndev->xdna;
>> +    u32 buf_sz = size, aie_bitmap = 0;
>>       struct amdxdna_client *client;
>>       dma_addr_t dma_addr;
>> -    u32 aie_bitmap = 0;
>>       u8 *buff_addr;
>>       int ret;
>>   -    buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, 
>> &dma_addr,
>> -                      DMA_FROM_DEVICE, GFP_KERNEL);
>> +    buff_addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>       if (!buff_addr)
>>           return -ENOMEM;
>>   @@ -363,7 +378,7 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>> *ndev, char __user *buf,
>>         *cols_filled = 0;
>>       req.dump_buff_addr = dma_addr;
>> -    req.dump_buff_size = size;
>> +    req.dump_buff_size = buf_sz;
>>       req.num_cols = hweight32(aie_bitmap);
>>       req.aie_bitmap = aie_bitmap;
>>   @@ -391,7 +406,7 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>> *ndev, char __user *buf,
>>       *cols_filled = aie_bitmap;
>>     fail:
>> -    dma_free_noncoherent(xdna->ddev.dev, size, buff_addr, dma_addr, 
>> DMA_FROM_DEVICE);
>> +    aie2_free_msg_buffer(ndev, buf_sz, buff_addr, dma_addr);
>>       return ret;
>>   }
>>   @@ -402,19 +417,19 @@ int aie2_query_telemetry(struct 
>> amdxdna_dev_hdl *ndev,
>>       DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
>>       struct amdxdna_dev *xdna = ndev->xdna;
>>       dma_addr_t dma_addr;
>> +    u32 buf_sz = size;
>>       u8 *addr;
>>       int ret;
>>         if (header->type >= MAX_TELEMETRY_TYPE)
>>           return -EINVAL;
>>   -    addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
>> -                     DMA_FROM_DEVICE, GFP_KERNEL);
>> +    addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>       if (!addr)
>>           return -ENOMEM;
>>         req.buf_addr = dma_addr;
>> -    req.buf_size = size;
>> +    req.buf_size = buf_sz;
>>       req.type = header->type;
>>         drm_clflush_virt_range(addr, size); /* device can access */
>> @@ -440,7 +455,7 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl 
>> *ndev,
>>       header->minor = resp.minor;
>>     free_buf:
>> -    dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, 
>> DMA_FROM_DEVICE);
>> +    aie2_free_msg_buffer(ndev, buf_sz, addr, dma_addr);
>>       return ret;
>>   }
>>   diff --git a/drivers/accel/amdxdna/aie2_pci.h 
>> b/drivers/accel/amdxdna/aie2_pci.h
>> index a929fa98a121..e1745f07b268 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.h
>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>> @@ -336,6 +336,11 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
>> struct amdxdna_sched_job *job,
>>            int (*notify_cb)(void *, void __iomem *, size_t));
>>   int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct 
>> amdxdna_sched_job *job,
>>                int (*notify_cb)(void *, void __iomem *, size_t));
>> +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
>> +                dma_addr_t *dma_addr);
>> +#define aie2_free_msg_buffer(ndev, size, buff_addr, dma_addr)        \
>> +    dma_free_noncoherent((ndev)->xdna->ddev.dev, size, buff_addr,    \
>> +                 dma_addr, DMA_FROM_DEVICE)
>>     /* aie2_hwctx.c */
>>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>
