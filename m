Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812AED004BB
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 23:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC55D10E659;
	Wed,  7 Jan 2026 22:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J3Dw++qU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012041.outbound.protection.outlook.com
 [40.93.195.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BF210E659
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 22:20:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovHARX0nvXeqemM+Xy/YRxw/3hvUVM5iCPiW5X4FgK8j3ggGB1C5ZHh+hlXYRmbISUJZuTaubIoDhfeyepL7YzIzpVQRZxos8yH/SBSgdAPlk1Jf9Vj+Dp/327zDBeBzSzztDG0DiUcE/fYlri0F3tqgLTfzv0D9RdDfOdML9SujJxdjgXN8eDeNs7JmC7DfueQOz8llYu+EFKoJeNqKNQ2QmYikc7wRYJ1Z06+BENfj4h6ut61fkjppH71QLqfYjrUnb389rVnIDUo7yj0yaUsnzPXcprz7/bixiQlvIgO2DPOKsyszhLlECzLmIhTop/xQjhKba5GAbHxuCLG5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DunGavEJOt/9gULTGTcryF89eWXBTTTEz5nQ+wzkJtU=;
 b=loBD84+APs0h7ZcwY/jvuED7Mq7IBnHBna9bztKR7OhlB3czI1jn3RTbwSB3htBJdX2kJUyfZ/MFfobti+7pmY2Pg+O3T4ygozjZRghr8OBslWQ3hvVYzq4eZYl+S/IrWaUaB/aMxO3vwEpTt84DYVhsXTBhWmnJietv5ylWGdonOXVDhjfCwMl9u/ubrmkLx7gZkmGZdPWfTsqNoOyVyYCwc5CIm+YFprc1JW3rVk5Pd9qAI8IAm8+uPnGhdgN7MWGTarOaxS7s2Up6WkwUO1RqVwBOFYlq75MPijWOUsyr1wK1tan5sao1yejOtR7xKHrTft+pVwRC1hdO9Wo+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DunGavEJOt/9gULTGTcryF89eWXBTTTEz5nQ+wzkJtU=;
 b=J3Dw++qUktdv2fJhTMxzP1kRdYlDA3i9sufKlTUeKjYKe+IrHAL7kMtw72q3zh8kLbILYajD7LhI3YjDatK+X3Nxdx9H49+bhPnUNZlaK1lDlFR2HkrGCDWUkoTA2/yyezlODtj7g87U4WL7m/ndzvEJqwgEngYwYejL8J3Ss40=
Received: from BN9PR03CA0090.namprd03.prod.outlook.com (2603:10b6:408:fc::35)
 by IA1PR12MB7589.namprd12.prod.outlook.com (2603:10b6:208:42b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 22:20:12 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::e6) by BN9PR03CA0090.outlook.office365.com
 (2603:10b6:408:fc::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 22:20:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 22:20:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 16:20:11 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 7 Jan
 2026 14:20:11 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 7 Jan 2026 16:20:10 -0600
Message-ID: <e96f3ed6-fed5-649a-d953-eed3dac7d82a@amd.com>
Date: Wed, 7 Jan 2026 14:20:10 -0800
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
 <1b8b49a7-762c-f530-3744-231beef9942f@amd.com>
 <33765a47-b37f-4435-b12c-c1d712ebc194@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <33765a47-b37f-4435-b12c-c1d712ebc194@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|IA1PR12MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c8dc77-6cb7-4707-d160-08de4e3aec8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NktPaGJDL3RsblFMVWFnKy9zN3g0WGxhRkpJNHl1ZGhLSXk3VVhlbDNwemJR?=
 =?utf-8?B?MDZvSnF3SGJTaEY5bVZBMFVEWXZFNjg0S1hodW5tajNkNWVYN253UnZRSWls?=
 =?utf-8?B?bHphbFMvTldGWVJRMTU2dnN3TTJuOUtidUhxQkxreGpIczlmU2krUUE4N2xT?=
 =?utf-8?B?ckpuV2JUYnJhNzVpTTJZaEtvVGw3SnhpYUMxQTdtaWpzYzNvdVphQW5idEgy?=
 =?utf-8?B?aG83cVVRazhUYkpTMTRIb05DSGtwaWR5VnA5M1ZoSHhiVWJtRDBuazMrdng0?=
 =?utf-8?B?cWd0UXRuNng4VU5EM0hGQUMwYlJMM0s4cnFjYTNPTm0xUncwMEpTRC9kTUZp?=
 =?utf-8?B?UG9uMkdLbVRDQ0FGT0FlZk9ieFliZmphK2hlK1F6K1BUQ0h3RE9lN2pCbnc4?=
 =?utf-8?B?bEJpMWZWTGhPQWJXQllrSCs2dHJzRG5hMEY2aHZrYWxJNnkraTczZUwrdlV1?=
 =?utf-8?B?cjZ6TDlTcWp0dW40SERkWHJCQXlZbndjcmptc2VrMzhtTWU3K1RzVURzL0NX?=
 =?utf-8?B?ekxKbHZ5WDI4c0xwbG5GUmxCR3dpQy9WbXhsY2wyeUVxbFh1enRxNzhzdEVW?=
 =?utf-8?B?YlhmWnpmc1FWVVRacVhwbWpNUWZIdTdtZHBwZ291djFkSFQ3NytKNWVkQXFR?=
 =?utf-8?B?N3Jxc2ozL2d5NE93RmdNZ3JxMUdyQ1hYTzFqUWlPWW50SGVSamZKa1B4dnBh?=
 =?utf-8?B?Q0YzOUVPNlQ0UlltUFF1RnFybStxalQyYVFwdW9WY3J0eWcxc3RrNFg4SWJB?=
 =?utf-8?B?S1g3S0E0a0daNTVWQzIrNVZhN3pOSXN3L1JTbWgwaTBwUm92K3NMdzJwdzFQ?=
 =?utf-8?B?dHMvcTdHdG9xTm93dDR6RkFUaHZodnJsYi9YMXFFYzdKYzdGclFzaWNBVFhk?=
 =?utf-8?B?Wk4wRDVBZWpKNmgzQWFVUnpROGxJTTg5Z3ZQc1U2TzBEMUlMb1dFUVJZWHNm?=
 =?utf-8?B?SlJYbGhSWnFOSzZ3bEtsRFhUK0FTai9yS2tlTHhqMnBQenpkdGdQUjJWZzAw?=
 =?utf-8?B?cEpvdXZkWi9IS3hKWWRlWU1NUXNxS0E4RzhJSk02MjNtTUFFZTZkYWU5K3Zr?=
 =?utf-8?B?bFc2clRDOXRsSGlwczVhMG81Zjk5WS91S0RiQmhPcVZ1TGx1aTVqTzBmZ0dY?=
 =?utf-8?B?NFN4VVgvRGNXK0NRdnh5WU1zU0dhbElVemhjRlFqdzl4Q0ZsdCtSUkp0T3d5?=
 =?utf-8?B?V3Y1NjhYYm1SOGt3bmRhUTJ2bXpFUE5EVHJOa0JDOVZUbXY3N3libGlkYnhj?=
 =?utf-8?B?K1pTcVJ3Y0hreUZJbzJyQmkyVVpNa1hjSHpYL2NFUVZZVEwxR0t3Z0dIV1E1?=
 =?utf-8?B?R1o2MERSSEpjV2h6Rnd3WGhMNzRUNFkzeDlhZDAyMFN1bG5ucDQvYkJ6b1Bq?=
 =?utf-8?B?aXlIbWYvLzRXWktoVUxXWkNhd2pYQ2taRlZHNDF0c04vWGM0ZTRXcHZXWXA2?=
 =?utf-8?B?dXhRaUhHcjIxREVRWFJkSUZFM055bGJYMDZ3RGE2SjRZRGVaSUhXWWpyY3dj?=
 =?utf-8?B?UHFFaGhyVit3VWZ1K1d3RlZvZG1jaHY1Q1ducGZBWE4wUmRhVHlsNmFidHdD?=
 =?utf-8?B?c0YvNlZNZjZZUTBBZjZvZytpMzNKcTdzU0ZiNTlHTHo5Y2ZYc1RETG91eWRP?=
 =?utf-8?B?cTNNQno4SDJkMGJFZFlkUUpzZ1FFN25EdzZYSFJ5S2ZLYWZZcDBsdDM4RWp3?=
 =?utf-8?B?RlZMNXFleVluWk1wU2FQZ0p0a0xFL1NmZ3RseHhMRUNXNXNTNXZBdTQreElm?=
 =?utf-8?B?ZXpNV1pPVmREeTlHTkQ1WDlZQm1wL1ROYXdNNmFIbGFqQkxYemZBeE1DdDF5?=
 =?utf-8?B?U0hiaFBtOHFoUXlJTTVJakpBd1Y4Tk9RUjZqSHdmZTI3cVE0ZFdCYUNianc3?=
 =?utf-8?B?U1hqWGVEYytWNFhmMVRtSTBTTkxxbisxNGRqNlJ1UXBWSEQxTS9BWk14QVN6?=
 =?utf-8?B?YXNiOFdFcTVKN0dPWG9tZ21VY3cwQUk0UElVNnNWeTQxME82bFJPcjlvQ1F0?=
 =?utf-8?B?T0Rka1lvc1pwWldDYlJOOFpmNU1VNTNwVGlhWVcvWVUreXUxME1IUzZsVHh2?=
 =?utf-8?B?Tmhoa2lxR3l6bDcvdXo0aldLMUlkQzc1YkFKY2syekowQmJRejhxcXhJa2U4?=
 =?utf-8?Q?lyHQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 22:20:11.6693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c8dc77-6cb7-4707-d160-08de4e3aec8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7589
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


On 1/7/26 14:07, Mario Limonciello wrote:
> On 1/7/26 4:05 PM, Lizhi Hou wrote:
>>
>> On 1/7/26 13:19, Mario Limonciello wrote:
>>> On 12/18/25 7:43 PM, Lizhi Hou wrote:
>>>> The latest firmware requires the message DMA buffer to
>>>>    - have a minimum size of 8K
>>>>    - use a power-of-two size
>>>>    - be aligned to the buffer size
>>>>    - not cross 64M boundary
>>>>
>>>> Update the buffer allocation logic to meet these requirements and 
>>>> support
>>>> the latest firmware.
>>>
>>> We can't guarantee that kernel and firmware are moving at the same 
>>> time.
>>> What happens if you run old firmware with these changes?
>>
>> The old firmware runs fine this these changes. The new firmware adds 
>> more alignment and size requirements which the old one does not need.
>
> Ah OK - so patch 2 won't reject current firmware right?

Correct. It will not reject current firmware.


Lizhi

>
>>
>>
>> Lizhi
>>
>>>
>>> If the old firmware can't run with these changes then it would be 
>>> better to instead add a fallback system.
>>>
>>> IE:
>>> 1) kernel tries to load new firmware name and use new behavior
>>> 2) if firmware is missing, kernel tries to load old firmware name 
>>> and use old behavior.
>>> 3) if firmware is missing in old name then fail probe
>>>
>>>
>>>>
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>> ---
>>>>   drivers/accel/amdxdna/aie2_error.c   | 10 ++++-----
>>>>   drivers/accel/amdxdna/aie2_message.c | 33 
>>>> ++++++++++++++++++++--------
>>>>   drivers/accel/amdxdna/aie2_pci.h     |  5 +++++
>>>>   3 files changed, 33 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/ 
>>>> amdxdna/aie2_error.c
>>>> index d452008ec4f4..5e82df2b7cf6 100644
>>>> --- a/drivers/accel/amdxdna/aie2_error.c
>>>> +++ b/drivers/accel/amdxdna/aie2_error.c
>>>> @@ -338,8 +338,7 @@ void aie2_error_async_events_free(struct 
>>>> amdxdna_dev_hdl *ndev)
>>>>       destroy_workqueue(events->wq);
>>>>       mutex_lock(&xdna->dev_lock);
>>>>   -    dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>>>> -                 events->addr, DMA_FROM_DEVICE);
>>>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, events- 
>>>> >addr);
>>>>       kfree(events);
>>>>   }
>>>>   @@ -355,8 +354,8 @@ int aie2_error_async_events_alloc(struct 
>>>> amdxdna_dev_hdl *ndev)
>>>>       if (!events)
>>>>           return -ENOMEM;
>>>>   -    events->buf = dma_alloc_noncoherent(xdna->ddev.dev, 
>>>> total_size, &events->addr,
>>>> -                        DMA_FROM_DEVICE, GFP_KERNEL);
>>>> +    events->buf = aie2_alloc_msg_buffer(ndev, &total_size, 
>>>> &events- >addr);
>>>> +
>>>>       if (!events->buf) {
>>>>           ret = -ENOMEM;
>>>>           goto free_events;
>>>> @@ -396,8 +395,7 @@ int aie2_error_async_events_alloc(struct 
>>>> amdxdna_dev_hdl *ndev)
>>>>   free_wq:
>>>>       destroy_workqueue(events->wq);
>>>>   free_buf:
>>>> -    dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>>>> -                 events->addr, DMA_FROM_DEVICE);
>>>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, events- 
>>>> >addr);
>>>>   free_events:
>>>>       kfree(events);
>>>>       return ret;
>>>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/ 
>>>> amdxdna/aie2_message.c
>>>> index 051f4ceaabae..99215328505e 100644
>>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>>> @@ -55,6 +55,22 @@ static int aie2_send_mgmt_msg_wait(struct 
>>>> amdxdna_dev_hdl *ndev,
>>>>       return ret;
>>>>   }
>>>>   +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 
>>>> *size,
>>>> +                dma_addr_t *dma_addr)
>>>> +{
>>>> +    struct amdxdna_dev *xdna = ndev->xdna;
>>>> +    int order;
>>>> +
>>>> +    *size = max(*size, SZ_8K);
>>>> +    order = get_order(*size);
>>>> +    if (order > MAX_PAGE_ORDER)
>>>> +        return NULL;
>>>> +    *size = PAGE_SIZE << order;
>>>> +
>>>> +    return dma_alloc_noncoherent(xdna->ddev.dev, *size, dma_addr,
>>>> +                     DMA_FROM_DEVICE, GFP_KERNEL);
>>>> +}
>>>> +
>>>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>>>>   {
>>>>       DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
>>>> @@ -346,14 +362,13 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>>>> *ndev, char __user *buf,
>>>>   {
>>>>       DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
>>>>       struct amdxdna_dev *xdna = ndev->xdna;
>>>> +    u32 buf_sz = size, aie_bitmap = 0;
>>>>       struct amdxdna_client *client;
>>>>       dma_addr_t dma_addr;
>>>> -    u32 aie_bitmap = 0;
>>>>       u8 *buff_addr;
>>>>       int ret;
>>>>   -    buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, 
>>>> &dma_addr,
>>>> -                      DMA_FROM_DEVICE, GFP_KERNEL);
>>>> +    buff_addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>>>       if (!buff_addr)
>>>>           return -ENOMEM;
>>>>   @@ -363,7 +378,7 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>>>> *ndev, char __user *buf,
>>>>         *cols_filled = 0;
>>>>       req.dump_buff_addr = dma_addr;
>>>> -    req.dump_buff_size = size;
>>>> +    req.dump_buff_size = buf_sz;
>>>>       req.num_cols = hweight32(aie_bitmap);
>>>>       req.aie_bitmap = aie_bitmap;
>>>>   @@ -391,7 +406,7 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>>>> *ndev, char __user *buf,
>>>>       *cols_filled = aie_bitmap;
>>>>     fail:
>>>> -    dma_free_noncoherent(xdna->ddev.dev, size, buff_addr, 
>>>> dma_addr, DMA_FROM_DEVICE);
>>>> +    aie2_free_msg_buffer(ndev, buf_sz, buff_addr, dma_addr);
>>>>       return ret;
>>>>   }
>>>>   @@ -402,19 +417,19 @@ int aie2_query_telemetry(struct 
>>>> amdxdna_dev_hdl *ndev,
>>>>       DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
>>>>       struct amdxdna_dev *xdna = ndev->xdna;
>>>>       dma_addr_t dma_addr;
>>>> +    u32 buf_sz = size;
>>>>       u8 *addr;
>>>>       int ret;
>>>>         if (header->type >= MAX_TELEMETRY_TYPE)
>>>>           return -EINVAL;
>>>>   -    addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
>>>> -                     DMA_FROM_DEVICE, GFP_KERNEL);
>>>> +    addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>>>       if (!addr)
>>>>           return -ENOMEM;
>>>>         req.buf_addr = dma_addr;
>>>> -    req.buf_size = size;
>>>> +    req.buf_size = buf_sz;
>>>>       req.type = header->type;
>>>>         drm_clflush_virt_range(addr, size); /* device can access */
>>>> @@ -440,7 +455,7 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl 
>>>> *ndev,
>>>>       header->minor = resp.minor;
>>>>     free_buf:
>>>> -    dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, 
>>>> DMA_FROM_DEVICE);
>>>> +    aie2_free_msg_buffer(ndev, buf_sz, addr, dma_addr);
>>>>       return ret;
>>>>   }
>>>>   diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>>> amdxdna/aie2_pci.h
>>>> index a929fa98a121..e1745f07b268 100644
>>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>>> @@ -336,6 +336,11 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
>>>> struct amdxdna_sched_job *job,
>>>>            int (*notify_cb)(void *, void __iomem *, size_t));
>>>>   int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct 
>>>> amdxdna_sched_job *job,
>>>>                int (*notify_cb)(void *, void __iomem *, size_t));
>>>> +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
>>>> +                dma_addr_t *dma_addr);
>>>> +#define aie2_free_msg_buffer(ndev, size, buff_addr, 
>>>> dma_addr)        \
>>>> +    dma_free_noncoherent((ndev)->xdna->ddev.dev, size, 
>>>> buff_addr,    \
>>>> +                 dma_addr, DMA_FROM_DEVICE)
>>>>     /* aie2_hwctx.c */
>>>>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>>>
>
