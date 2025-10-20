Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E2EBF2544
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 18:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35A810E2B4;
	Mon, 20 Oct 2025 16:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qF06DbUE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35C910E2B4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 16:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVD/jqVHc3kXAPLEE1Ux3DCC/qobvtezSYmR3jJtEjb7aUjaFtCAGOnIjvWNJdFzdIylaY85HjTKz7/H91B+aWt7J+iymaJN21Vx984GHVxBEKhTduWefEXWzXKP+04sUtFWb6yrnVjOqqhEi+BBRR2o+HH5xq5C9CddVZC6GPxPYNL0tw3WS9rlD40gXb82wIsejoaWcWbCvA7pzz9MuixQMMA+tb5lBVJe9JxFqwp5rEg/G7jzJzHF29/zSYWVpc+bJLmfD8WgX+w6DhTlpCqI5Btz53zZWUmrKu0JAYAJp5dsK4m+Nfvh8fWu7Euvo6nl+F+I/yvZbWsbvPZCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEPzeOLp3suP0d5BqXolpXSAwo1MUYkMnXYHCtYZEHM=;
 b=YMDufq3WSdccJ6DOIUsxJzaMw+5/RY6CKU7NtUlcr2bNQLhhLAcnwrO2UlI72z2VSoO190w72y07h9oQe2ErXXZItZiZKOwtn5whpisOVidyjH4oVK68AXcc96miO9tD2uQi5IkdnubNoJJ0+uxJ8+rFNPiPsA145B4SWUdss+KfVLj6SfWqkAVbXfNzUBhRYYS+hqvjNk7AR/hSH7sGEPvAMBkCBjrABmvjq+5vWGX7bK8c+R1Ma/PfOZe+FemLAymrNUL1S31CCxCesNGULMP8ogj5Q9wJz1EmtARWy27bo5oeTKEgEOTcNrVkr03eEFwxg+iucTAlV5l5TtmAjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEPzeOLp3suP0d5BqXolpXSAwo1MUYkMnXYHCtYZEHM=;
 b=qF06DbUEI1+J9J3+Uo8LNS4L3yJ81PyJiUTWp2wWezGvg9rufTUuE4S2gwPrG8/o1SGepbMXS1McIFBrzLMpSO8raSUfo/u/1JhtwwCdWT2KDzfOVW3AFms5ccSIYGF2y+C0CzJcI6KfwhKLCQR7AhJtYzplDt2P0+Pbmy1zf1I=
Received: from SJ0PR03CA0137.namprd03.prod.outlook.com (2603:10b6:a03:33c::22)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 16:12:45 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::fa) by SJ0PR03CA0137.outlook.office365.com
 (2603:10b6:a03:33c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 16:12:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Mon, 20 Oct 2025 16:12:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Oct
 2025 09:12:41 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Oct
 2025 09:12:41 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Oct 2025 09:12:40 -0700
Message-ID: <b98ff1fc-b748-d73b-b0fb-6fc89f4997c1@amd.com>
Date: Mon, 20 Oct 2025 09:12:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Support firmware debug buffer
Content-Language: en-US
From: Lizhi Hou <lizhi.hou@amd.com>
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251016203016.819441-1-lizhi.hou@amd.com>
 <19415004-ed31-4388-ba40-deb63767c31b@amd.com>
 <72f7dad1-d589-3807-43bf-7c8274008a82@amd.com>
 <42f0ccf4-c4cf-46c2-a412-55a1e74279cb@kernel.org>
 <4ae209d1-8739-1bf2-f091-9c0da69d1404@amd.com>
In-Reply-To: <4ae209d1-8739-1bf2-f091-9c0da69d1404@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|DM6PR12MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: e26ada48-a443-4d3f-d673-08de0ff380c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTBsZm1uNG1JNXJ2MjdYRU5iOXBLWGZzbnpyNHhVYVdBUVNlUmZORUlYRmdj?=
 =?utf-8?B?d1BsOHVBaDNIczZ0eFN5ZW1qRTRLTmlkWnd5MWtTaTRHVjhkUWtZM1RvdTVh?=
 =?utf-8?B?eDFkOFlJVVNuOFNBYTRnMlpZdVJjZjJZOEVqdm1NMVNSVnFQUGZ3V0dpdCtR?=
 =?utf-8?B?RGJIV1BLQ2xiUVFEaUVja2RDdXBCZlduSGw4c3MvcFRTMzdQejdQZHJIbmRw?=
 =?utf-8?B?QVNNSFZHY0oxUnNYRWhPV3g3N3BpQlVHWitWOUFUZlZWSzdzNUttSERjNWVr?=
 =?utf-8?B?NWNCajFzcmZFMG5Dam9jaXNoeFNsbmJYRDl1czZoWWhZWmQ1ODF6cHlnazFV?=
 =?utf-8?B?bkl3SXY2Yk1JZVdRbXNvUHJUZFlOV09MbmhmMWhyU01Mamh6S1JudVdwb0F0?=
 =?utf-8?B?Nkl0ZkVad3oxK0tkUjM2Zm9VQkZmeTVZeUxSamZHYk1HZmVTcjhnWFl3S2t1?=
 =?utf-8?B?dnRxeEU0a012M1JCV1FYWmhKVnlQNkE2aGJFSmUxMXIyR0tXY2dMa3Ztakdl?=
 =?utf-8?B?d0g3c0dwYm5rKzVFQWtMUnB1UUF5THBhTzJHVk84cEVKbEFtVXFXeVQrak16?=
 =?utf-8?B?TkliZTlBNG51NlgvQWF6VlN0U3NkT2NnaG9yMEd4K0pGbjZFL0Q3MHc5U21J?=
 =?utf-8?B?Zk44elJ0TlI2OVQ2SG9lVkI5bzJkQWlxYlptam8rTGJFQ1JIdmp6RkFpS1Q5?=
 =?utf-8?B?KzRsT0dJd2JBak1FVjM5VkEwNHlDUE4yMGsxQmVha1BMb0FvbmpnQ01FZXo5?=
 =?utf-8?B?c2pCbmQxODdBdEFscXBXQWdsS1pVMzRyUVV0UWZHMFVwbE9ZODdSdXVseEdY?=
 =?utf-8?B?YldPT2Q4Wlc0TG1oVlpoRUxQSkQ4dXhRUW56bTMwekpxVzI3d3hZbWIra0JV?=
 =?utf-8?B?SnMweERJZmM0NHNTd3RGaGErK2FiQlZNaERQcTlMbVJxaEJHUHhuL1B0ajgz?=
 =?utf-8?B?c3MzYVpYdTFLR3IvVWUxbjBEcHg4Nm5KcmxQd3p3V1FFbUZIWEYyZFRXRFhK?=
 =?utf-8?B?RVh5M1NBcGQydGtYaFVvSkF2QXlrUzkzYmJxQU14TWR0U1ZwVnphbTRYVDNn?=
 =?utf-8?B?TlJmUWEzZ2Z0bm50Mk1IN1l1L085UnprVDdoOWdlVkdYdFhsQWJ2RDA4SXUv?=
 =?utf-8?B?RDE5dHBjWTNmV2lOdXFia3QyZWFYNEMyM05zQTE3UldFMjNzeVJQeXRKWW5H?=
 =?utf-8?B?Z2tDYUlLR3orbnJJaGxqemF2N1VJZ1FGbGhZZ1ZFWnVJQm5sVk9vbllwMEx1?=
 =?utf-8?B?RmtEbE9nVityanJLS3N5NUg1UWljclJINmNhbUkrc0JFWWU5TXh6Z1R4M1RP?=
 =?utf-8?B?TzJBd0RFR0JSMUJqN002YjFibzk1VFg2NnBHL2VvWGxZTHo2K0FxUlhRNG1I?=
 =?utf-8?B?d2diem9OY2lscDRFemRMYjU0QllYQ0VJNDhJU1lJc2ljR2hvRitwQVhrNXlS?=
 =?utf-8?B?Z3N2YTIvTklrODZhcUpXTTBPRHpxL0RXUTJJQSt2ZXhxdWRQeER6dE9Tc2tB?=
 =?utf-8?B?aEhIQVpha1BoSHBHN3MySXdYeGlTNVZJc3lvOXcyZXVNTDdoNzc3YmRndTVt?=
 =?utf-8?B?L2R4S0pzVzdxY3pIVnpST0ZWUDZpYWlyL0F6WmdXb09LcHNWd2pnS1dQM3N0?=
 =?utf-8?B?RldsajNIZjA4MEw3YUcrYkdNNEJ2S21oMU9ZdytISXR3bFl5QzFjMXVlaFZI?=
 =?utf-8?B?d0M1NXhZWktHakdkSnd6MUJTS2FDVzFvTDhhajhUb3REalpTMlk2bEswemVS?=
 =?utf-8?B?TFBlYnF6cU1WQlVFRm1xcWJXbEZ4bUJPcGVPNHlGbmRqRm4vbzBDSTNpc2ky?=
 =?utf-8?B?NEcycCtxVUhMMnJYZFNySEdzaWNXQmlITFZzVkNsWHowdHdtZm91bmJ2cys5?=
 =?utf-8?B?Q2pTNTVJUi9CVVd6dUlzUkhvaTdhT1g5YWxhb0pyaWdPaExvcCtZNU1OWlM5?=
 =?utf-8?B?WkFEWG5YMHFiZE5VU3JiL2t4N0FoMjJYT1hNaXR6SzhhMkFoYk81dTFQUFRE?=
 =?utf-8?B?OUJ2TFNxOVR2SkNjWnlQU3h3L0pkd2k3VkYydUQ5Wmpwcm0yYVByV2YyZVlU?=
 =?utf-8?B?cGtCanM1VC9CZ3FvQ29ya1JkQTV2U25seC9IZ1ArM01kSmNaM09LYXcwVlRZ?=
 =?utf-8?Q?iVGw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 16:12:44.3434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e26ada48-a443-4d3f-d673-08de0ff380c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041
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

On 10/20/25 08:56, Lizhi Hou wrote:
>
> On 10/17/25 11:50, Mario Limonciello (AMD) (kernel.org) wrote:
>>
>>
>> On 10/16/2025 4:31 PM, Lizhi Hou wrote:
>>>
>>> On 10/16/25 13:54, Mario Limonciello wrote:
>>>> On 10/16/25 3:30 PM, Lizhi Hou wrote:
>>>>> To collect firmware debug information, the userspace application 
>>>>> allocates
>>>>> a AMDXDNA_BO_DEV buffer object through DRM_IOCTL_AMDXDNA_CREATE_BO.
>>>>> Then it associates the buffer with the hardware context through
>>>>> DRM_IOCTL_AMDXDNA_CONFIG_HWCTX which requests firmware to bind the 
>>>>> buffer
>>>>> through a mailbox command. The firmware then writes the debug data 
>>>>> into
>>>>> this buffer. The buffer can be mapped into userspace so that
>>>>> applications can retrieve and analyze the firmware debug information.
>>>>
>>>> Let me ask a high level question.  Do we really want all userspace 
>>>> to always have access to this debug information? Could this leak 
>>>> information between processes potentially?
>>>
>>> The buffer is allocated by the application and bound to the hardware 
>>> context. Thus,  the debug data is per hardware context (per 
>>> application). Only the process who owns the hardware context will 
>>> have access to the debug information. So there is not leak to other 
>>> process.
>>>
>>>>
>>>> Two ideas:
>>>>
>>>> 1) I wonder if this is better placed in debugfs files.
>>> The debug bo is per process. The application allocates and owns the 
>>> buffer and only the debug data for this application will be output 
>>> to this buffer.  So debugfs might not fit here.
>>>> 2) If this architecture does make sense - what are your thoughts on 
>>>> tying the ability to use it to kernel lockdown?
>>>
>>> I do not fully understand the question. This feature is useful for 
>>> application debugging. And it is also required for a sanity test of 
>>> xrt tools. Hopefully this helps. :)
>>>
>>>
>> Thanks, that helps.  I have one small comment below.
>>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> Thanks,
>>>
>>> Lizhi
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>> ---
>>>>>   drivers/accel/amdxdna/TODO              |   1 -
>>>>>   drivers/accel/amdxdna/aie2_ctx.c        | 116 
>>>>> ++++++++++++++++++++++--
>>>>>   drivers/accel/amdxdna/aie2_message.c    |  31 ++++++-
>>>>>   drivers/accel/amdxdna/aie2_msg_priv.h   |  13 +++
>>>>>   drivers/accel/amdxdna/aie2_pci.c        |   1 +
>>>>>   drivers/accel/amdxdna/aie2_pci.h        |   3 +
>>>>>   drivers/accel/amdxdna/amdxdna_ctx.c     |  39 +++++++-
>>>>>   drivers/accel/amdxdna/amdxdna_ctx.h     |  16 +++-
>>>>>   drivers/accel/amdxdna/amdxdna_gem.c     |   3 +
>>>>>   drivers/accel/amdxdna/amdxdna_gem.h     |   6 ++
>>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |   3 +-
>>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>>>>>   drivers/accel/amdxdna/npu1_regs.c       |   1 +
>>>>>   drivers/accel/amdxdna/npu4_regs.c       |   1 +
>>>>>   14 files changed, 221 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
>>>>> index ad8ac6e315b6..0e4bbebeaedf 100644
>>>>> --- a/drivers/accel/amdxdna/TODO
>>>>> +++ b/drivers/accel/amdxdna/TODO
>>>>> @@ -1,2 +1 @@
>>>>>   - Add debugfs support
>>>>> -- Add debug BO support
>>>>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/ 
>>>>> amdxdna/aie2_ctx.c
>>>>> index ab4d66f1325d..63450b7773ac 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>>>>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>>>>> @@ -226,11 +226,10 @@ aie2_sched_resp_handler(void *handle, void 
>>>>> __iomem *data, size_t size)
>>>>>   }
>>>>>     static int
>>>>> -aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, 
>>>>> size_t size)
>>>>> +aie2_sched_drvcmd_resp_handler(void *handle, void __iomem *data, 
>>>>> size_t size)
>>>>>   {
>>>>>       struct amdxdna_sched_job *job = handle;
>>>>>       int ret = 0;
>>>>> -    u32 status;
>>>>>         if (unlikely(!data))
>>>>>           goto out;
>>>>> @@ -240,8 +239,7 @@ aie2_sched_nocmd_resp_handler(void *handle, 
>>>>> void __iomem *data, size_t size)
>>>>>           goto out;
>>>>>       }
>>>>>   -    status = readl(data);
>>>>> -    XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
>>>>> +    job->drv_cmd->result = readl(data);
>>>>>     out:
>>>>>       aie2_sched_notify(job);
>>>>> @@ -314,8 +312,18 @@ aie2_sched_job_run(struct drm_sched_job 
>>>>> *sched_job)
>>>>>       kref_get(&job->refcnt);
>>>>>       fence = dma_fence_get(job->fence);
>>>>>   -    if (unlikely(!cmd_abo)) {
>>>>> -        ret = aie2_sync_bo(hwctx, job, 
>>>>> aie2_sched_nocmd_resp_handler);
>>>>> +    if (job->drv_cmd) {
>>>>> +        switch (job->drv_cmd->opcode) {
>>>>> +        case SYNC_DEBUG_BO:
>>>>> +            ret = aie2_sync_bo(hwctx, job, 
>>>>> aie2_sched_drvcmd_resp_handler);
>>>>> +            break;
>>>>> +        case ATTACH_DEBUG_BO:
>>>>> +            ret = aie2_config_debug_bo(hwctx, job, 
>>>>> aie2_sched_drvcmd_resp_handler);
>>>>> +            break;
>>>>> +        default:
>>>>> +            ret = -EINVAL;
>>>>> +            break;
>>>>> +        }
>>>>>           goto out;
>>>>>       }
>>>>>   @@ -766,6 +774,74 @@ static int aie2_hwctx_cu_config(struct 
>>>>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>>>>       return ret;
>>>>>   }
>>>>>   +static void aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq)
>>>>> +{
>>>>> +    struct dma_fence *out_fence = aie2_cmd_get_out_fence(hwctx, 
>>>>> seq);
>>>>> +
>>>>> +    if (!out_fence) {
>>>>> +        XDNA_ERR(hwctx->client->xdna, "Failed to get fence");
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    dma_fence_wait_timeout(out_fence, false, MAX_SCHEDULE_TIMEOUT);
>>>>> +    dma_fence_put(out_fence);
>>>>> +}
>>>>> +
>>>>> +static int aie2_hwctx_cfg_debug_bo(struct amdxdna_hwctx *hwctx, 
>>>>> u32 bo_hdl,
>>>>> +                   bool attach)
>>>>> +{
>>>>> +    struct amdxdna_client *client = hwctx->client;
>>>>> +    struct amdxdna_dev *xdna = client->xdna;
>>>>> +    struct amdxdna_drv_cmd cmd = { 0 };
>>>>> +    struct amdxdna_gem_obj *abo;
>>>>> +    u64 seq;
>>>>> +    int ret;
>>>>> +
>>>>> +    abo = amdxdna_gem_get_obj(client, bo_hdl, AMDXDNA_BO_DEV);
>>>>> +    if (!abo) {
>>>>> +        XDNA_ERR(xdna, "Get bo %d failed", bo_hdl);
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    if (attach) {
>>>>> +        if (abo->assigned_hwctx != AMDXDNA_INVALID_CTX_HANDLE) {
>>>>> +            ret = -EBUSY;
>>>>> +            goto put_obj;
>>>>> +        }
>>>>> +        cmd.opcode = ATTACH_DEBUG_BO;
>>>>> +    } else {
>>>>> +        if (abo->assigned_hwctx != hwctx->id) {
>>>>> +            ret = -EINVAL;
>>>>> +            goto put_obj;
>>>>> +        }
>>>>> +        cmd.opcode = DETACH_DEBUG_BO;
>>>>> +    }
>>>>> +
>>>>> +    ret = amdxdna_cmd_submit(client, &cmd, 
>>>>> AMDXDNA_INVALID_BO_HANDLE,
>>>>> +                 &bo_hdl, 1, hwctx->id, &seq);
>>>>> +    if (ret) {
>>>>> +        XDNA_ERR(xdna, "Submit command failed");
>>>>> +        goto put_obj;
>>>>> +    }
>>>>> +
>>>>> +    aie2_cmd_wait(hwctx, seq);
>>>>> +    if (cmd.result) {
>>>>> +        XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
>>>>> +        goto put_obj;
>>>>> +    }
>>>>> +
>>>>> +    if (attach)
>>>>> +        abo->assigned_hwctx = hwctx->id;
>>>>> +    else
>>>>> +        abo->assigned_hwctx = AMDXDNA_INVALID_CTX_HANDLE;
>>>>> +
>>>>> +    XDNA_DBG(xdna, "Config debug BO %d to %s", bo_hdl, hwctx->name);
>>>>> +
>>>>> +put_obj:
>>>>> +    amdxdna_gem_put_obj(abo);
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>>   int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 
>>>>> value, void *buf, u32 size)
>>>>>   {
>>>>>       struct amdxdna_dev *xdna = hwctx->client->xdna;
>>>>> @@ -775,14 +851,40 @@ int aie2_hwctx_config(struct amdxdna_hwctx 
>>>>> *hwctx, u32 type, u64 value, void *bu
>>>>>       case DRM_AMDXDNA_HWCTX_CONFIG_CU:
>>>>>           return aie2_hwctx_cu_config(hwctx, buf, size);
>>>>>       case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
>>>>> +        return aie2_hwctx_cfg_debug_bo(hwctx, (u32)value, true);
>>>>>       case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
>>>>> -        return -EOPNOTSUPP;
>>>>> +        return aie2_hwctx_cfg_debug_bo(hwctx, (u32)value, false);
>>>>>       default:
>>>>>           XDNA_DBG(xdna, "Not supported type %d", type);
>>>>>           return -EOPNOTSUPP;
>>>>>       }
>>>>>   }
>>>>>   +int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 
>>>>> debug_bo_hdl)
>>>>> +{
>>>>> +    struct amdxdna_client *client = hwctx->client;
>>>>> +    struct amdxdna_dev *xdna = client->xdna;
>>>>> +    struct amdxdna_drv_cmd cmd = { 0 };
>>>>> +    u64 seq;
>>>>> +    int ret;
>>>>> +
>>>>> +    cmd.opcode = SYNC_DEBUG_BO;
>>>>> +    ret = amdxdna_cmd_submit(client, &cmd, 
>>>>> AMDXDNA_INVALID_BO_HANDLE,
>>>>> +                 &debug_bo_hdl, 1, hwctx->id, &seq);
>>>>> +    if (ret) {
>>>>> +        XDNA_ERR(xdna, "Submit command failed");
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    aie2_cmd_wait(hwctx, seq);
>>>>> +    if (cmd.result) {
>>>>> +        XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>   static int aie2_populate_range(struct amdxdna_gem_obj *abo)
>>>>>   {
>>>>>       struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
>>>>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/ 
>>>>> amdxdna/aie2_message.c
>>>>> index 4660e8297ed8..0ec1dc6fe668 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>>>> @@ -749,7 +749,7 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
>>>>> struct amdxdna_sched_job *job,
>>>>>       int ret = 0;
>>>>>         req.src_addr = 0;
>>>>> -    req.dst_addr = abo->mem.dev_addr - hwctx->client->dev_heap- 
>>>>> >mem.dev_addr;
>>>>> +    req.dst_addr = amdxdna_dev_bo_offset(abo);
>>>>>       req.size = abo->mem.size;
>>>>>         /* Device to Host */
>>>>> @@ -773,3 +773,32 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
>>>>> struct amdxdna_sched_job *job,
>>>>>         return 0;
>>>>>   }
>>>>> +
>>>>> +int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct 
>>>>> amdxdna_sched_job *job,
>>>>> +             int (*notify_cb)(void *, void __iomem *, size_t))
>>>>> +{
>>>>> +    struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>>>>> +    struct amdxdna_gem_obj *abo = to_xdna_obj(job->bos[0]);
>>>>> +    struct amdxdna_dev *xdna = hwctx->client->xdna;
>>>>> +    struct config_debug_bo_req req;
>>>>> +    struct xdna_mailbox_msg msg;
>>>>> +
>>>>> +    if (job->drv_cmd->opcode == ATTACH_DEBUG_BO)
>>>>> +        req.config = DEBUG_BO_REGISTER;
>>>>> +    else
>>>>> +        req.config = DEBUG_BO_UNREGISTER;
>>>>> +
>>>>> +    req.offset = amdxdna_dev_bo_offset(abo);
>>>>> +    req.size = abo->mem.size;
>>>>> +
>>>>> +    XDNA_DBG(xdna, "offset 0x%llx size 0x%llx config %d",
>>>>> +         req.offset, req.size, req.config);
>>>>> +
>>>>> +    msg.handle = job;
>>>>> +    msg.notify_cb = notify_cb;
>>>>> +    msg.send_data = (u8 *)&req;
>>>>> +    msg.send_size = sizeof(req);
>>>>> +    msg.opcode = MSG_OP_CONFIG_DEBUG_BO;
>>>>> +
>>>>> +    return xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>>>>> +}
>>>>> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h 
>>>>> b/drivers/accel/ amdxdna/aie2_msg_priv.h
>>>>> index 6df9065b13f6..6a5c70bff5e9 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
>>>>> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
>>>>> @@ -18,6 +18,7 @@ enum aie2_msg_opcode {
>>>>>       MSG_OP_CONFIG_CU                   = 0x11,
>>>>>       MSG_OP_CHAIN_EXEC_BUFFER_CF        = 0x12,
>>>>>       MSG_OP_CHAIN_EXEC_DPU              = 0x13,
>>>>> +    MSG_OP_CONFIG_DEBUG_BO             = 0x14,
>>>>>       MSG_OP_MAX_XRT_OPCODE,
>>>>>       MSG_OP_SUSPEND                     = 0x101,
>>>>>       MSG_OP_RESUME                      = 0x102,
>>>>> @@ -365,4 +366,16 @@ struct sync_bo_req {
>>>>>   struct sync_bo_resp {
>>>>>       enum aie2_msg_status    status;
>>>>>   } __packed;
>>>>> +
>>>>> +struct config_debug_bo_req {
>>>>> +    __u64    offset;
>>>>> +    __u64    size;
>>>>> +#define DEBUG_BO_UNREGISTER 0
>>>>> +#define DEBUG_BO_REGISTER   1
>>
>> Why are these defines placed in the middle of the struct?  Is it 
>> because they're indicating the options for 'config'?
>>
>> This seems like a weird place.  I think they should be placed before 
>> the struct and instead have a comment indicating they're possible 
>> options.
>
> Yes, it indicates the options for 'config'. And I will move it out and 
> add comment when I merge the change.
>
>
> Thanks,
>
> Lizhi
>
>>
>>>>> +    __u32    config;
>>>>> +} __packed;
>>>>> +
>>>>> +struct config_debug_bo_resp {
>>>>> +    enum aie2_msg_status    status;
>>>>> +} __packed;
>>>>>   #endif /* _AIE2_MSG_PRIV_H_ */
>>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>>>> amdxdna/aie2_pci.c
>>>>> index cfca4e456b61..f48045318dc0 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>>> @@ -1004,6 +1004,7 @@ const struct amdxdna_dev_ops aie2_ops = {
>>>>>       .hwctx_init = aie2_hwctx_init,
>>>>>       .hwctx_fini = aie2_hwctx_fini,
>>>>>       .hwctx_config = aie2_hwctx_config,
>>>>> +    .hwctx_sync_debug_bo = aie2_hwctx_sync_debug_bo,
>>>>>       .cmd_submit = aie2_cmd_submit,
>>>>>       .hmm_invalidate = aie2_hmm_invalidate,
>>>>>       .get_array = aie2_get_array,
>>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>>>> amdxdna/aie2_pci.h
>>>>> index 34bc35479f42..243ac21d50c1 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>>>> @@ -287,11 +287,14 @@ int aie2_cmdlist_multi_execbuf(struct 
>>>>> amdxdna_hwctx *hwctx,
>>>>>                      int (*notify_cb)(void *, void __iomem *, 
>>>>> size_t));
>>>>>   int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct 
>>>>> amdxdna_sched_job *job,
>>>>>            int (*notify_cb)(void *, void __iomem *, size_t));
>>>>> +int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct 
>>>>> amdxdna_sched_job *job,
>>>>> +             int (*notify_cb)(void *, void __iomem *, size_t));
>>>>>     /* aie2_hwctx.c */
>>>>>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>>>>>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
>>>>>   int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 
>>>>> value, void *buf, u32 size);
>>>>> +int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 
>>>>> debug_bo_hdl);
>>>>>   void aie2_hwctx_suspend(struct amdxdna_client *client);
>>>>>   int aie2_hwctx_resume(struct amdxdna_client *client);
>>>>>   int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct 
>>>>> amdxdna_sched_job *job, u64 *seq);
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/ 
>>>>> amdxdna/amdxdna_ctx.c
>>>>> index 868ca369e0a0..d18182c59668 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>>>>> @@ -328,6 +328,38 @@ int amdxdna_drm_config_hwctx_ioctl(struct 
>>>>> drm_device *dev, void *data, struct dr
>>>>>       return ret;
>>>>>   }
>>>>>   +int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, 
>>>>> u32 debug_bo_hdl)
>>>>> +{
>>>>> +    struct amdxdna_dev *xdna = client->xdna;
>>>>> +    struct amdxdna_hwctx *hwctx;
>>>>> +    struct amdxdna_gem_obj *abo;
>>>>> +    struct drm_gem_object *gobj;
>>>>> +    int ret, idx;
>>>>> +
>>>>> +    if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
>>>>> +        return -EOPNOTSUPP;
>>>>> +
>>>>> +    gobj = drm_gem_object_lookup(client->filp, debug_bo_hdl);
>>>>> +    if (!gobj)
>>>>> +        return -EINVAL;
>>>>> +
>>>>> +    abo = to_xdna_obj(gobj);
>>>>> +    guard(mutex)(&xdna->dev_lock);
>>>>> +    idx = srcu_read_lock(&client->hwctx_srcu);
>>>>> +    hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
>>>>> +    if (!hwctx) {
>>>>> +        ret = -EINVAL;
>>>>> +        goto unlock_srcu;
>>>>> +    }
>>>>> +
>>>>> +    ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, 
>>>>> debug_bo_hdl);
>>>>> +
>>>>> +unlock_srcu:
>>>>> +    srcu_read_unlock(&client->hwctx_srcu, idx);
>>>>> +    drm_gem_object_put(gobj);
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>>   static void
>>>>>   amdxdna_arg_bos_put(struct amdxdna_sched_job *job)
>>>>>   {
>>>>> @@ -393,6 +425,7 @@ void amdxdna_sched_job_cleanup(struct 
>>>>> amdxdna_sched_job *job)
>>>>>   }
>>>>>     int amdxdna_cmd_submit(struct amdxdna_client *client,
>>>>> +               struct amdxdna_drv_cmd *drv_cmd,
>>>>>                  u32 cmd_bo_hdl, u32 *arg_bo_hdls, u32 arg_bo_cnt,
>>>>>                  u32 hwctx_hdl, u64 *seq)
>>>>>   {
>>>>> @@ -406,6 +439,8 @@ int amdxdna_cmd_submit(struct amdxdna_client 
>>>>> *client,
>>>>>       if (!job)
>>>>>           return -ENOMEM;
>>>>>   +    job->drv_cmd = drv_cmd;
>>>>> +
>>>>>       if (cmd_bo_hdl != AMDXDNA_INVALID_BO_HANDLE) {
>>>>>           job->cmd_bo = amdxdna_gem_get_obj(client, cmd_bo_hdl, 
>>>>> AMDXDNA_BO_CMD);
>>>>>           if (!job->cmd_bo) {
>>>>> @@ -413,8 +448,6 @@ int amdxdna_cmd_submit(struct amdxdna_client 
>>>>> *client,
>>>>>               ret = -EINVAL;
>>>>>               goto free_job;
>>>>>           }
>>>>> -    } else {
>>>>> -        job->cmd_bo = NULL;
>>>>>       }
>>>>>         ret = amdxdna_arg_bos_lookup(client, job, arg_bo_hdls, 
>>>>> arg_bo_cnt);
>>>>> @@ -508,7 +541,7 @@ static int amdxdna_drm_submit_execbuf(struct 
>>>>> amdxdna_client *client,
>>>>>           }
>>>>>       }
>>>>>   -    ret = amdxdna_cmd_submit(client, cmd_bo_hdl, arg_bo_hdls,
>>>>> +    ret = amdxdna_cmd_submit(client, NULL, cmd_bo_hdl, arg_bo_hdls,
>>>>>                    args->arg_count, args->hwctx, &args->seq);
>>>>>       if (ret)
>>>>>           XDNA_DBG(xdna, "Submit cmds failed, ret %d", ret);
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/ 
>>>>> amdxdna/amdxdna_ctx.h
>>>>> index 7cd7a55936f0..cbe60efbe60b 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>>>>> @@ -95,6 +95,17 @@ struct amdxdna_hwctx {
>>>>>   #define drm_job_to_xdna_job(j) \
>>>>>       container_of(j, struct amdxdna_sched_job, base)
>>>>>   +enum amdxdna_job_opcode {
>>>>> +    SYNC_DEBUG_BO,
>>>>> +    ATTACH_DEBUG_BO,
>>>>> +    DETACH_DEBUG_BO,
>>>>> +};
>>>>> +
>>>>> +struct amdxdna_drv_cmd {
>>>>> +    enum amdxdna_job_opcode    opcode;
>>>>> +    u32            result;
>>>>> +};
>>>>> +
>>>>>   struct amdxdna_sched_job {
>>>>>       struct drm_sched_job    base;
>>>>>       struct kref        refcnt;
>>>>> @@ -106,6 +117,7 @@ struct amdxdna_sched_job {
>>>>>       struct dma_fence    *out_fence;
>>>>>       bool            job_done;
>>>>>       u64            seq;
>>>>> +    struct amdxdna_drv_cmd    *drv_cmd;
>>>>>       struct amdxdna_gem_obj    *cmd_bo;
>>>>>       size_t            bo_cnt;
>>>>>       struct drm_gem_object    *bos[] __counted_by(bo_cnt);
>>>>> @@ -143,9 +155,11 @@ void amdxdna_sched_job_cleanup(struct 
>>>>> amdxdna_sched_job *job);
>>>>>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
>>>>>   int amdxdna_hwctx_walk(struct amdxdna_client *client, void *arg,
>>>>>                  int (*walk)(struct amdxdna_hwctx *hwctx, void 
>>>>> *arg));
>>>>> +int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, 
>>>>> u32 debug_bo_hdl);
>>>>>     int amdxdna_cmd_submit(struct amdxdna_client *client,
>>>>> -               u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
>>>>> +               struct amdxdna_drv_cmd *drv_cmd, u32 cmd_bo_hdls,
>>>>> +               u32 *arg_bo_hdls, u32 arg_bo_cnt,
>>>>>                  u32 hwctx_hdl, u64 *seq);
>>>>>     int amdxdna_cmd_wait(struct amdxdna_client *client, u32 
>>>>> hwctx_hdl,
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/ 
>>>>> amdxdna/amdxdna_gem.c
>>>>> index 7f91863c3f24..61e0136c21a8 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_gem.c
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
>>>>> @@ -962,6 +962,9 @@ int amdxdna_drm_sync_bo_ioctl(struct 
>>>>> drm_device *dev,
>>>>>       XDNA_DBG(xdna, "Sync bo %d offset 0x%llx, size 0x%llx\n",
>>>>>            args->handle, args->offset, args->size);
>>>>>   +    if (args->direction == SYNC_DIRECT_FROM_DEVICE)
>>>>> +        ret = amdxdna_hwctx_sync_debug_bo(abo->client, 
>>>>> args->handle);
>>>>> +
>>>>>   put_obj:
>>>>>       drm_gem_object_put(gobj);
>>>>>       return ret;
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/ 
>>>>> amdxdna/amdxdna_gem.h
>>>>> index ae29db94a9d3..f79fc7f3c93b 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_gem.h
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_gem.h
>>>>> @@ -7,6 +7,7 @@
>>>>>   #define _AMDXDNA_GEM_H_
>>>>>     #include <linux/hmm.h>
>>>>> +#include "amdxdna_pci_drv.h"
>>>>>     struct amdxdna_umap {
>>>>>       struct vm_area_struct        *vma;
>>>>> @@ -62,6 +63,11 @@ static inline void amdxdna_gem_put_obj(struct 
>>>>> amdxdna_gem_obj *abo)
>>>>>       drm_gem_object_put(to_gobj(abo));
>>>>>   }
>>>>>   +static inline u64 amdxdna_dev_bo_offset(struct amdxdna_gem_obj 
>>>>> *abo)
>>>>> +{
>>>>> +    return abo->mem.dev_addr - abo->client->dev_heap->mem.dev_addr;
>>>>> +}
>>>>> +
>>>>>   void amdxdna_umap_put(struct amdxdna_umap *mapp);
>>>>>     struct drm_gem_object *
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>>>>> b/drivers/accel/ amdxdna/amdxdna_pci_drv.c
>>>>> index 696fdac8ad3c..3599e713bfcb 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>>> @@ -28,9 +28,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>>>>>    * 0.0: Initial version
>>>>>    * 0.1: Support getting all hardware contexts by 
>>>>> DRM_IOCTL_AMDXDNA_GET_ARRAY
>>>>>    * 0.2: Support getting last error hardware error
>>>>> + * 0.3: Support firmware debug buffer
>>>>>    */
>>>>>   #define AMDXDNA_DRIVER_MAJOR        0
>>>>> -#define AMDXDNA_DRIVER_MINOR        2
>>>>> +#define AMDXDNA_DRIVER_MINOR        3
>>>>>     /*
>>>>>    * Bind the driver base on (vendor_id, device_id) pair and later 
>>>>> use the
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h 
>>>>> b/drivers/accel/ amdxdna/amdxdna_pci_drv.h
>>>>> index 626beebf730e..c99477f5e454 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>>> @@ -55,6 +55,7 @@ struct amdxdna_dev_ops {
>>>>>       int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
>>>>>       void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
>>>>>       int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, 
>>>>> u64 value, void *buf, u32 size);
>>>>> +    int (*hwctx_sync_debug_bo)(struct amdxdna_hwctx *hwctx, u32 
>>>>> debug_bo_hdl);
>>>>>       void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned 
>>>>> long cur_seq);
>>>>>       int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct 
>>>>> amdxdna_sched_job *job, u64 *seq);
>>>>>       int (*get_aie_info)(struct amdxdna_client *client, struct 
>>>>> amdxdna_drm_get_info *args);
>>>>> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/ 
>>>>> amdxdna/npu1_regs.c
>>>>> index e4f6dac7d00f..10124cccb102 100644
>>>>> --- a/drivers/accel/amdxdna/npu1_regs.c
>>>>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>>>>> @@ -46,6 +46,7 @@
>>>>>     const struct rt_config npu1_default_rt_cfg[] = {
>>>>>       { 2, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
>>>>> +    { 4, 1, AIE2_RT_CFG_INIT }, /* Debug BO */
>>>>>       { 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>>>>       { 0 },
>>>>>   };
>>>>> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/ 
>>>>> amdxdna/npu4_regs.c
>>>>> index 9f2e33182ec6..e1da882420ec 100644
>>>>> --- a/drivers/accel/amdxdna/npu4_regs.c
>>>>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>>>>> @@ -63,6 +63,7 @@
>>>>>     const struct rt_config npu4_default_rt_cfg[] = {
>>>>>       { 5, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
>>>>> +    { 10, 1, AIE2_RT_CFG_INIT }, /* DEBUG BUF */
>>>>>       { 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>>>>       { 2, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>>>>       { 3, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>>>
>>
