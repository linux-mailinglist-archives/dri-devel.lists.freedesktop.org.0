Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05CDBF23D8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2CD10E47C;
	Mon, 20 Oct 2025 15:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1DJSc1Bj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CB789336
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:57:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOcwR6PhEvI7voV03ZEysvk/cMHySU/o1X10UZKTvBr63mMSWYAUjh/QAaD3ivh0ONWGIVuhKftKPX1+Kn/rFj+bpqjjf2rh9anmD3DsVxdzH1dTyY2q0kdw3Q6kUPW6Egji0uurFMM+ij7AR9IbLueqFtYnpVfPp0h4ZQFJ9KBQ7pzM4pqn94Jmrl2mgHQiZbtE9E9oMjvEzFCi3RRlhgsqByIeWQecA71oa3MYHuIqRMPHHTLCTjzT4VIMwAJqzOPoyuR+PNEGRDsdDztdP3o6HctUfjChzCdiHbfIe5qzGPuQvJlYF+5qb5Va5MAm/Hyiv/Jztlu1yj79r7T6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFNCMWAF6oXlXLWkWDm4KVSJzwZP7Gq810NYNWgge5c=;
 b=Bdd51SuJGorxJ4eG+/5OdCsJXFFsJAeFashMzpj3jhB7MhFBYFJ/L+2+0ypNpA2BGiTJWETy9Fqd1LWGQJDu0cWLjm71b9ygjA9Vljb/FnVLv2bqTVhIpT+MkP22VE6qL9J0qznhEUr3tT/7e3QZ5pRcJL5on5HIKGc3XZIaXzbRnAyrZpcJCnkoGtvf8yizL6pwsVnugaCaJMMsB4Q43wMrMg2XRHOyyjeSktSbcFl66ak7IWnLlPmSVnZ1Y36NYyoxvLxDNimhDdAy1Voy1uJ7uvGXMW8DTHmBwd3/XfuWfV3FQpH/uwctwLQ4dMIc2OlIxjlzzp3eQg/PEOWHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFNCMWAF6oXlXLWkWDm4KVSJzwZP7Gq810NYNWgge5c=;
 b=1DJSc1BjetO/+gpQHfVXBtJDoaGL1PNVyWlJRjUeHcVCKFHPmC4rbUjtRm9Ewo2fpA/7hVD6k16gweoiWUEWIqWicWAHNhNf/KC50mhINcx+jLKxXqadrDvb+uWKGw7kEvLah9OnWq7TKDQXSpwNx177vSYW6anx1l9x9GZMLuE=
Received: from SJ0PR13CA0141.namprd13.prod.outlook.com (2603:10b6:a03:2c6::26)
 by DS5PPF7671D5CC0.namprd12.prod.outlook.com (2603:10b6:f:fc00::653)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:56:56 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::f7) by SJ0PR13CA0141.outlook.office365.com
 (2603:10b6:a03:2c6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.11 via Frontend Transport; Mon,
 20 Oct 2025 15:56:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.0 via Frontend Transport; Mon, 20 Oct 2025 15:56:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 20 Oct
 2025 08:56:54 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Oct
 2025 10:56:54 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Oct 2025 08:56:53 -0700
Message-ID: <4ae209d1-8739-1bf2-f091-9c0da69d1404@amd.com>
Date: Mon, 20 Oct 2025 08:56:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/amdxdna: Support firmware debug buffer
Content-Language: en-US
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251016203016.819441-1-lizhi.hou@amd.com>
 <19415004-ed31-4388-ba40-deb63767c31b@amd.com>
 <72f7dad1-d589-3807-43bf-7c8274008a82@amd.com>
 <42f0ccf4-c4cf-46c2-a412-55a1e74279cb@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <42f0ccf4-c4cf-46c2-a412-55a1e74279cb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|DS5PPF7671D5CC0:EE_
X-MS-Office365-Filtering-Correlation-Id: 970d787d-d2d3-4f53-cd6a-08de0ff14b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXY1ZUs2NDBiQ2d0eTZBdUdNcllhR1NBcEwyY2ZwNmdhQ2M5RDlxWm1UdFhF?=
 =?utf-8?B?dmlBOVQweHYyTmFtYjJMRmMyS2hKMjBJdE5IWTN3WFZxTWw3YUY4NEl0aDBS?=
 =?utf-8?B?ZVdCbXBXLzdyZWhEeExWTDBWV0VBT1IrZ3IwQ2ZLdGFTNzVNbUFhUnNTanVi?=
 =?utf-8?B?NnZWU2J0anRjMWQ2ZTRNVzdGeGptWDJibWpXbkwzUmdoVzJYd2NPU2NWdEYz?=
 =?utf-8?B?YTJjNFJaWXNNMCszcXVrWGVhUmpSL1orbTl2WmhFb3FtRzdHQUlXeGVJVTFv?=
 =?utf-8?B?eFVTMzExQ0FsUkR1NENTL0pyU2wvTjlnTGtvdlBjQ0I0RjBWVmoxMGx2WnY4?=
 =?utf-8?B?d0E4VEo2bnhOa2hCd0kzTmRTSExjb0VGc05YQTBMU3M4R3U4OXZaaDk5bXBN?=
 =?utf-8?B?SEJCbjNCTStKNFI5SGljdU94SjVrZFFvWTZ0Tzhld1U4MUdUSUI4OXMzY3FI?=
 =?utf-8?B?dTdpaUN5R2xEa2RERzJ2ZnJXdDZkcDZQSVRya0xiL3FkOUx0eUtMZjJzVkx3?=
 =?utf-8?B?anBlcmdNRG9WMG1oZllwNDRUTXV1bXJvQmt0SXV2bGRyQUlkZXdJMk9CNGk0?=
 =?utf-8?B?MEhCRStIZmxQWGtFMDR1VytTZVI0ek9tVnlTOXQ3TGloZUdoRldaOG9na3lN?=
 =?utf-8?B?OVFCNHVybzFGS1NzQXRySEt6WGIvY1B5UEkxdzlpZHVBNVlsK1pqN2NEM1RB?=
 =?utf-8?B?aVRJMlZ3c25aSkdudnl2b2JXZXZKSVFqYUx1bDJBYktvYWhhcmU3aWM0UUd3?=
 =?utf-8?B?a2pRRkdnMDNJVk5uRkwxV2VxNG82VWUwdEExQUM5NExSLzJDcTJDZ0R3RkVo?=
 =?utf-8?B?aGVGOEZObnNaT2xuOExaekZIc2w0QlZtQUFRSUw4dkhFMG1qNjB0NStXY1Rt?=
 =?utf-8?B?YTlpaTRaY3UrS0pTbEpKN0NuR1J2d091THZqR0g1SmJMMFh6cTNoZHU4MXQ5?=
 =?utf-8?B?bTg5aFVzVStnaFZnUXlWNm5mQVF2dDV1M2ozb2tPeUQ3N0ppTGtNMCtVUmdx?=
 =?utf-8?B?Q01GcUlsR0NxSTlYMnAzbWRiRzh4d0pJMHQxZ0ZtdmlGdnlnSGE3MnFzaTJ4?=
 =?utf-8?B?VGFIa1phSnFwSzk4dUIxM2RqUkJNQXAvWlprNHRxNk45cVczQURONGhwRVl2?=
 =?utf-8?B?N2JxSTl2OTlCSjFsRzVqNmFKcTkxQWpGN3RycDdlM0l6SUFqVVlTNDRRdG91?=
 =?utf-8?B?Y09EOVZTWHU5QllyY1dIWXZFTmVHQ1hFaStlRUp4MUlLVTFmazd6WnJFS3Rx?=
 =?utf-8?B?QVhraEJxMXNlTkozb1EzNHVuV1Z6bTRJTkxGekc5K3BId2NkUmI1NlQ2Q0Ru?=
 =?utf-8?B?dmlrQWoyL2xyc044cFJIcVczZjZOcnNmRDlDQktKenZxRnpYaTg1eXovVHA4?=
 =?utf-8?B?UldvSGR1ZkVwTXA1aEFiUWQrREs5eTdleWMvNEF0RSsvMGVWelQwOVZNbXVv?=
 =?utf-8?B?YjFiMTl5emZHVjRrNHQwUDh0MnpNWWkrMGlZWVI4U0pCVFVhTXhxOFBlVkhI?=
 =?utf-8?B?a1VHck9GcXhtN09tUUxsMlhJNzkvUnFwTy9nRFNTaWFuelo3VTZ2N0VkOFV4?=
 =?utf-8?B?N2s2d05uaVpQeWR1NGxONjdxZGtacHg0aDFPU3dOdE95RXM0ZWEvWE9Va2Nx?=
 =?utf-8?B?azRmcU1QQWpRSm1UZDVFWHpEQ0M4eW9RcjFHcUM5WWQ4eVMrdldNR0syTUE3?=
 =?utf-8?B?VGNJNDl0UXNDTm42NEF0MTRlOW40c21Sa3R1aXI3TXVuU2xSSFdFdmdVVVZD?=
 =?utf-8?B?TjRUMW40RU4wQS94RWppTmhtR095aGsyUzJBUWZ5NlprOGI5azhrVVlUQ0pO?=
 =?utf-8?B?NzBoVXY0ejluVCszMTZRRm44RW9DelhFd3NHcjB1akVuSzJIc3hiYVIyR2Yr?=
 =?utf-8?B?MjJhaWtFcGlGY2x1cEg4ZGlMQkhJdnd4amVwNEkxVFpaSkxpQ1h6VmFPVVhZ?=
 =?utf-8?B?Y1NqWmpvbmpMVDFDQmZ1MUh4UkhnSHlqdWtkVGl1N25va0Z0ekJlaCtmTVB3?=
 =?utf-8?B?VHYzZkY4MUJrQkdrQkpndVFYcEtYWTJSR3VENEhxSkFmc3hWWE1pLzNrU1Jo?=
 =?utf-8?B?aDdVU1pUOCsvQTU2amMxSUdQVFBpWlljejZCbFp5OWEzajFlV0hUQXh5Z2VS?=
 =?utf-8?Q?f9n8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:56:55.6185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 970d787d-d2d3-4f53-cd6a-08de0ff14b44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7671D5CC0
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


On 10/17/25 11:50, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 10/16/2025 4:31 PM, Lizhi Hou wrote:
>>
>> On 10/16/25 13:54, Mario Limonciello wrote:
>>> On 10/16/25 3:30 PM, Lizhi Hou wrote:
>>>> To collect firmware debug information, the userspace application 
>>>> allocates
>>>> a AMDXDNA_BO_DEV buffer object through DRM_IOCTL_AMDXDNA_CREATE_BO.
>>>> Then it associates the buffer with the hardware context through
>>>> DRM_IOCTL_AMDXDNA_CONFIG_HWCTX which requests firmware to bind the 
>>>> buffer
>>>> through a mailbox command. The firmware then writes the debug data 
>>>> into
>>>> this buffer. The buffer can be mapped into userspace so that
>>>> applications can retrieve and analyze the firmware debug information.
>>>
>>> Let me ask a high level question.  Do we really want all userspace 
>>> to always have access to this debug information? Could this leak 
>>> information between processes potentially?
>>
>> The buffer is allocated by the application and bound to the hardware 
>> context. Thus,  the debug data is per hardware context (per 
>> application). Only the process who owns the hardware context will 
>> have access to the debug information.  So there is not leak to other 
>> process.
>>
>>>
>>> Two ideas:
>>>
>>> 1) I wonder if this is better placed in debugfs files.
>> The debug bo is per process. The application allocates and owns the 
>> buffer and only the debug data for this application will be output to 
>> this buffer.  So debugfs might not fit here.
>>> 2) If this architecture does make sense - what are your thoughts on 
>>> tying the ability to use it to kernel lockdown?
>>
>> I do not fully understand the question. This feature is useful for 
>> application debugging. And it is also required for a sanity test of 
>> xrt tools. Hopefully this helps. :)
>>
>>
> Thanks, that helps.  I have one small comment below.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Thanks,
>>
>> Lizhi
>>
>>>
>>>>
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>> ---
>>>>   drivers/accel/amdxdna/TODO              |   1 -
>>>>   drivers/accel/amdxdna/aie2_ctx.c        | 116 
>>>> ++++++++++++++++++++++--
>>>>   drivers/accel/amdxdna/aie2_message.c    |  31 ++++++-
>>>>   drivers/accel/amdxdna/aie2_msg_priv.h   |  13 +++
>>>>   drivers/accel/amdxdna/aie2_pci.c        |   1 +
>>>>   drivers/accel/amdxdna/aie2_pci.h        |   3 +
>>>>   drivers/accel/amdxdna/amdxdna_ctx.c     |  39 +++++++-
>>>>   drivers/accel/amdxdna/amdxdna_ctx.h     |  16 +++-
>>>>   drivers/accel/amdxdna/amdxdna_gem.c     |   3 +
>>>>   drivers/accel/amdxdna/amdxdna_gem.h     |   6 ++
>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.c |   3 +-
>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>>>>   drivers/accel/amdxdna/npu1_regs.c       |   1 +
>>>>   drivers/accel/amdxdna/npu4_regs.c       |   1 +
>>>>   14 files changed, 221 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
>>>> index ad8ac6e315b6..0e4bbebeaedf 100644
>>>> --- a/drivers/accel/amdxdna/TODO
>>>> +++ b/drivers/accel/amdxdna/TODO
>>>> @@ -1,2 +1 @@
>>>>   - Add debugfs support
>>>> -- Add debug BO support
>>>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/ 
>>>> amdxdna/aie2_ctx.c
>>>> index ab4d66f1325d..63450b7773ac 100644
>>>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>>>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>>>> @@ -226,11 +226,10 @@ aie2_sched_resp_handler(void *handle, void 
>>>> __iomem *data, size_t size)
>>>>   }
>>>>     static int
>>>> -aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, 
>>>> size_t size)
>>>> +aie2_sched_drvcmd_resp_handler(void *handle, void __iomem *data, 
>>>> size_t size)
>>>>   {
>>>>       struct amdxdna_sched_job *job = handle;
>>>>       int ret = 0;
>>>> -    u32 status;
>>>>         if (unlikely(!data))
>>>>           goto out;
>>>> @@ -240,8 +239,7 @@ aie2_sched_nocmd_resp_handler(void *handle, 
>>>> void __iomem *data, size_t size)
>>>>           goto out;
>>>>       }
>>>>   -    status = readl(data);
>>>> -    XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
>>>> +    job->drv_cmd->result = readl(data);
>>>>     out:
>>>>       aie2_sched_notify(job);
>>>> @@ -314,8 +312,18 @@ aie2_sched_job_run(struct drm_sched_job 
>>>> *sched_job)
>>>>       kref_get(&job->refcnt);
>>>>       fence = dma_fence_get(job->fence);
>>>>   -    if (unlikely(!cmd_abo)) {
>>>> -        ret = aie2_sync_bo(hwctx, job, 
>>>> aie2_sched_nocmd_resp_handler);
>>>> +    if (job->drv_cmd) {
>>>> +        switch (job->drv_cmd->opcode) {
>>>> +        case SYNC_DEBUG_BO:
>>>> +            ret = aie2_sync_bo(hwctx, job, 
>>>> aie2_sched_drvcmd_resp_handler);
>>>> +            break;
>>>> +        case ATTACH_DEBUG_BO:
>>>> +            ret = aie2_config_debug_bo(hwctx, job, 
>>>> aie2_sched_drvcmd_resp_handler);
>>>> +            break;
>>>> +        default:
>>>> +            ret = -EINVAL;
>>>> +            break;
>>>> +        }
>>>>           goto out;
>>>>       }
>>>>   @@ -766,6 +774,74 @@ static int aie2_hwctx_cu_config(struct 
>>>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>>>       return ret;
>>>>   }
>>>>   +static void aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq)
>>>> +{
>>>> +    struct dma_fence *out_fence = aie2_cmd_get_out_fence(hwctx, seq);
>>>> +
>>>> +    if (!out_fence) {
>>>> +        XDNA_ERR(hwctx->client->xdna, "Failed to get fence");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    dma_fence_wait_timeout(out_fence, false, MAX_SCHEDULE_TIMEOUT);
>>>> +    dma_fence_put(out_fence);
>>>> +}
>>>> +
>>>> +static int aie2_hwctx_cfg_debug_bo(struct amdxdna_hwctx *hwctx, 
>>>> u32 bo_hdl,
>>>> +                   bool attach)
>>>> +{
>>>> +    struct amdxdna_client *client = hwctx->client;
>>>> +    struct amdxdna_dev *xdna = client->xdna;
>>>> +    struct amdxdna_drv_cmd cmd = { 0 };
>>>> +    struct amdxdna_gem_obj *abo;
>>>> +    u64 seq;
>>>> +    int ret;
>>>> +
>>>> +    abo = amdxdna_gem_get_obj(client, bo_hdl, AMDXDNA_BO_DEV);
>>>> +    if (!abo) {
>>>> +        XDNA_ERR(xdna, "Get bo %d failed", bo_hdl);
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    if (attach) {
>>>> +        if (abo->assigned_hwctx != AMDXDNA_INVALID_CTX_HANDLE) {
>>>> +            ret = -EBUSY;
>>>> +            goto put_obj;
>>>> +        }
>>>> +        cmd.opcode = ATTACH_DEBUG_BO;
>>>> +    } else {
>>>> +        if (abo->assigned_hwctx != hwctx->id) {
>>>> +            ret = -EINVAL;
>>>> +            goto put_obj;
>>>> +        }
>>>> +        cmd.opcode = DETACH_DEBUG_BO;
>>>> +    }
>>>> +
>>>> +    ret = amdxdna_cmd_submit(client, &cmd, AMDXDNA_INVALID_BO_HANDLE,
>>>> +                 &bo_hdl, 1, hwctx->id, &seq);
>>>> +    if (ret) {
>>>> +        XDNA_ERR(xdna, "Submit command failed");
>>>> +        goto put_obj;
>>>> +    }
>>>> +
>>>> +    aie2_cmd_wait(hwctx, seq);
>>>> +    if (cmd.result) {
>>>> +        XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
>>>> +        goto put_obj;
>>>> +    }
>>>> +
>>>> +    if (attach)
>>>> +        abo->assigned_hwctx = hwctx->id;
>>>> +    else
>>>> +        abo->assigned_hwctx = AMDXDNA_INVALID_CTX_HANDLE;
>>>> +
>>>> +    XDNA_DBG(xdna, "Config debug BO %d to %s", bo_hdl, hwctx->name);
>>>> +
>>>> +put_obj:
>>>> +    amdxdna_gem_put_obj(abo);
>>>> +    return ret;
>>>> +}
>>>> +
>>>>   int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 
>>>> value, void *buf, u32 size)
>>>>   {
>>>>       struct amdxdna_dev *xdna = hwctx->client->xdna;
>>>> @@ -775,14 +851,40 @@ int aie2_hwctx_config(struct amdxdna_hwctx 
>>>> *hwctx, u32 type, u64 value, void *bu
>>>>       case DRM_AMDXDNA_HWCTX_CONFIG_CU:
>>>>           return aie2_hwctx_cu_config(hwctx, buf, size);
>>>>       case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
>>>> +        return aie2_hwctx_cfg_debug_bo(hwctx, (u32)value, true);
>>>>       case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
>>>> -        return -EOPNOTSUPP;
>>>> +        return aie2_hwctx_cfg_debug_bo(hwctx, (u32)value, false);
>>>>       default:
>>>>           XDNA_DBG(xdna, "Not supported type %d", type);
>>>>           return -EOPNOTSUPP;
>>>>       }
>>>>   }
>>>>   +int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 
>>>> debug_bo_hdl)
>>>> +{
>>>> +    struct amdxdna_client *client = hwctx->client;
>>>> +    struct amdxdna_dev *xdna = client->xdna;
>>>> +    struct amdxdna_drv_cmd cmd = { 0 };
>>>> +    u64 seq;
>>>> +    int ret;
>>>> +
>>>> +    cmd.opcode = SYNC_DEBUG_BO;
>>>> +    ret = amdxdna_cmd_submit(client, &cmd, AMDXDNA_INVALID_BO_HANDLE,
>>>> +                 &debug_bo_hdl, 1, hwctx->id, &seq);
>>>> +    if (ret) {
>>>> +        XDNA_ERR(xdna, "Submit command failed");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    aie2_cmd_wait(hwctx, seq);
>>>> +    if (cmd.result) {
>>>> +        XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static int aie2_populate_range(struct amdxdna_gem_obj *abo)
>>>>   {
>>>>       struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
>>>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/ 
>>>> amdxdna/aie2_message.c
>>>> index 4660e8297ed8..0ec1dc6fe668 100644
>>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>>> @@ -749,7 +749,7 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
>>>> struct amdxdna_sched_job *job,
>>>>       int ret = 0;
>>>>         req.src_addr = 0;
>>>> -    req.dst_addr = abo->mem.dev_addr - hwctx->client->dev_heap- 
>>>> >mem.dev_addr;
>>>> +    req.dst_addr = amdxdna_dev_bo_offset(abo);
>>>>       req.size = abo->mem.size;
>>>>         /* Device to Host */
>>>> @@ -773,3 +773,32 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
>>>> struct amdxdna_sched_job *job,
>>>>         return 0;
>>>>   }
>>>> +
>>>> +int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct 
>>>> amdxdna_sched_job *job,
>>>> +             int (*notify_cb)(void *, void __iomem *, size_t))
>>>> +{
>>>> +    struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>>>> +    struct amdxdna_gem_obj *abo = to_xdna_obj(job->bos[0]);
>>>> +    struct amdxdna_dev *xdna = hwctx->client->xdna;
>>>> +    struct config_debug_bo_req req;
>>>> +    struct xdna_mailbox_msg msg;
>>>> +
>>>> +    if (job->drv_cmd->opcode == ATTACH_DEBUG_BO)
>>>> +        req.config = DEBUG_BO_REGISTER;
>>>> +    else
>>>> +        req.config = DEBUG_BO_UNREGISTER;
>>>> +
>>>> +    req.offset = amdxdna_dev_bo_offset(abo);
>>>> +    req.size = abo->mem.size;
>>>> +
>>>> +    XDNA_DBG(xdna, "offset 0x%llx size 0x%llx config %d",
>>>> +         req.offset, req.size, req.config);
>>>> +
>>>> +    msg.handle = job;
>>>> +    msg.notify_cb = notify_cb;
>>>> +    msg.send_data = (u8 *)&req;
>>>> +    msg.send_size = sizeof(req);
>>>> +    msg.opcode = MSG_OP_CONFIG_DEBUG_BO;
>>>> +
>>>> +    return xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>>>> +}
>>>> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/ 
>>>> amdxdna/aie2_msg_priv.h
>>>> index 6df9065b13f6..6a5c70bff5e9 100644
>>>> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
>>>> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
>>>> @@ -18,6 +18,7 @@ enum aie2_msg_opcode {
>>>>       MSG_OP_CONFIG_CU                   = 0x11,
>>>>       MSG_OP_CHAIN_EXEC_BUFFER_CF        = 0x12,
>>>>       MSG_OP_CHAIN_EXEC_DPU              = 0x13,
>>>> +    MSG_OP_CONFIG_DEBUG_BO             = 0x14,
>>>>       MSG_OP_MAX_XRT_OPCODE,
>>>>       MSG_OP_SUSPEND                     = 0x101,
>>>>       MSG_OP_RESUME                      = 0x102,
>>>> @@ -365,4 +366,16 @@ struct sync_bo_req {
>>>>   struct sync_bo_resp {
>>>>       enum aie2_msg_status    status;
>>>>   } __packed;
>>>> +
>>>> +struct config_debug_bo_req {
>>>> +    __u64    offset;
>>>> +    __u64    size;
>>>> +#define DEBUG_BO_UNREGISTER 0
>>>> +#define DEBUG_BO_REGISTER   1
>
> Why are these defines placed in the middle of the struct?  Is it 
> because they're indicating the options for 'config'?
>
> This seems like a weird place.  I think they should be placed before 
> the struct and instead have a comment indicating they're possible 
> options.

Yes, it indicates the options for 'config'. And I will move it out and 
add comment when I merge the change.


Thanks,

Lizhi

>
>>>> +    __u32    config;
>>>> +} __packed;
>>>> +
>>>> +struct config_debug_bo_resp {
>>>> +    enum aie2_msg_status    status;
>>>> +} __packed;
>>>>   #endif /* _AIE2_MSG_PRIV_H_ */
>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>>> amdxdna/aie2_pci.c
>>>> index cfca4e456b61..f48045318dc0 100644
>>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>> @@ -1004,6 +1004,7 @@ const struct amdxdna_dev_ops aie2_ops = {
>>>>       .hwctx_init = aie2_hwctx_init,
>>>>       .hwctx_fini = aie2_hwctx_fini,
>>>>       .hwctx_config = aie2_hwctx_config,
>>>> +    .hwctx_sync_debug_bo = aie2_hwctx_sync_debug_bo,
>>>>       .cmd_submit = aie2_cmd_submit,
>>>>       .hmm_invalidate = aie2_hmm_invalidate,
>>>>       .get_array = aie2_get_array,
>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>>> amdxdna/aie2_pci.h
>>>> index 34bc35479f42..243ac21d50c1 100644
>>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>>> @@ -287,11 +287,14 @@ int aie2_cmdlist_multi_execbuf(struct 
>>>> amdxdna_hwctx *hwctx,
>>>>                      int (*notify_cb)(void *, void __iomem *, 
>>>> size_t));
>>>>   int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct 
>>>> amdxdna_sched_job *job,
>>>>            int (*notify_cb)(void *, void __iomem *, size_t));
>>>> +int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct 
>>>> amdxdna_sched_job *job,
>>>> +             int (*notify_cb)(void *, void __iomem *, size_t));
>>>>     /* aie2_hwctx.c */
>>>>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>>>>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
>>>>   int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 
>>>> value, void *buf, u32 size);
>>>> +int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 
>>>> debug_bo_hdl);
>>>>   void aie2_hwctx_suspend(struct amdxdna_client *client);
>>>>   int aie2_hwctx_resume(struct amdxdna_client *client);
>>>>   int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct 
>>>> amdxdna_sched_job *job, u64 *seq);
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/ 
>>>> amdxdna/amdxdna_ctx.c
>>>> index 868ca369e0a0..d18182c59668 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>>>> @@ -328,6 +328,38 @@ int amdxdna_drm_config_hwctx_ioctl(struct 
>>>> drm_device *dev, void *data, struct dr
>>>>       return ret;
>>>>   }
>>>>   +int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, 
>>>> u32 debug_bo_hdl)
>>>> +{
>>>> +    struct amdxdna_dev *xdna = client->xdna;
>>>> +    struct amdxdna_hwctx *hwctx;
>>>> +    struct amdxdna_gem_obj *abo;
>>>> +    struct drm_gem_object *gobj;
>>>> +    int ret, idx;
>>>> +
>>>> +    if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
>>>> +        return -EOPNOTSUPP;
>>>> +
>>>> +    gobj = drm_gem_object_lookup(client->filp, debug_bo_hdl);
>>>> +    if (!gobj)
>>>> +        return -EINVAL;
>>>> +
>>>> +    abo = to_xdna_obj(gobj);
>>>> +    guard(mutex)(&xdna->dev_lock);
>>>> +    idx = srcu_read_lock(&client->hwctx_srcu);
>>>> +    hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
>>>> +    if (!hwctx) {
>>>> +        ret = -EINVAL;
>>>> +        goto unlock_srcu;
>>>> +    }
>>>> +
>>>> +    ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, 
>>>> debug_bo_hdl);
>>>> +
>>>> +unlock_srcu:
>>>> +    srcu_read_unlock(&client->hwctx_srcu, idx);
>>>> +    drm_gem_object_put(gobj);
>>>> +    return ret;
>>>> +}
>>>> +
>>>>   static void
>>>>   amdxdna_arg_bos_put(struct amdxdna_sched_job *job)
>>>>   {
>>>> @@ -393,6 +425,7 @@ void amdxdna_sched_job_cleanup(struct 
>>>> amdxdna_sched_job *job)
>>>>   }
>>>>     int amdxdna_cmd_submit(struct amdxdna_client *client,
>>>> +               struct amdxdna_drv_cmd *drv_cmd,
>>>>                  u32 cmd_bo_hdl, u32 *arg_bo_hdls, u32 arg_bo_cnt,
>>>>                  u32 hwctx_hdl, u64 *seq)
>>>>   {
>>>> @@ -406,6 +439,8 @@ int amdxdna_cmd_submit(struct amdxdna_client 
>>>> *client,
>>>>       if (!job)
>>>>           return -ENOMEM;
>>>>   +    job->drv_cmd = drv_cmd;
>>>> +
>>>>       if (cmd_bo_hdl != AMDXDNA_INVALID_BO_HANDLE) {
>>>>           job->cmd_bo = amdxdna_gem_get_obj(client, cmd_bo_hdl, 
>>>> AMDXDNA_BO_CMD);
>>>>           if (!job->cmd_bo) {
>>>> @@ -413,8 +448,6 @@ int amdxdna_cmd_submit(struct amdxdna_client 
>>>> *client,
>>>>               ret = -EINVAL;
>>>>               goto free_job;
>>>>           }
>>>> -    } else {
>>>> -        job->cmd_bo = NULL;
>>>>       }
>>>>         ret = amdxdna_arg_bos_lookup(client, job, arg_bo_hdls, 
>>>> arg_bo_cnt);
>>>> @@ -508,7 +541,7 @@ static int amdxdna_drm_submit_execbuf(struct 
>>>> amdxdna_client *client,
>>>>           }
>>>>       }
>>>>   -    ret = amdxdna_cmd_submit(client, cmd_bo_hdl, arg_bo_hdls,
>>>> +    ret = amdxdna_cmd_submit(client, NULL, cmd_bo_hdl, arg_bo_hdls,
>>>>                    args->arg_count, args->hwctx, &args->seq);
>>>>       if (ret)
>>>>           XDNA_DBG(xdna, "Submit cmds failed, ret %d", ret);
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/ 
>>>> amdxdna/amdxdna_ctx.h
>>>> index 7cd7a55936f0..cbe60efbe60b 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>>>> @@ -95,6 +95,17 @@ struct amdxdna_hwctx {
>>>>   #define drm_job_to_xdna_job(j) \
>>>>       container_of(j, struct amdxdna_sched_job, base)
>>>>   +enum amdxdna_job_opcode {
>>>> +    SYNC_DEBUG_BO,
>>>> +    ATTACH_DEBUG_BO,
>>>> +    DETACH_DEBUG_BO,
>>>> +};
>>>> +
>>>> +struct amdxdna_drv_cmd {
>>>> +    enum amdxdna_job_opcode    opcode;
>>>> +    u32            result;
>>>> +};
>>>> +
>>>>   struct amdxdna_sched_job {
>>>>       struct drm_sched_job    base;
>>>>       struct kref        refcnt;
>>>> @@ -106,6 +117,7 @@ struct amdxdna_sched_job {
>>>>       struct dma_fence    *out_fence;
>>>>       bool            job_done;
>>>>       u64            seq;
>>>> +    struct amdxdna_drv_cmd    *drv_cmd;
>>>>       struct amdxdna_gem_obj    *cmd_bo;
>>>>       size_t            bo_cnt;
>>>>       struct drm_gem_object    *bos[] __counted_by(bo_cnt);
>>>> @@ -143,9 +155,11 @@ void amdxdna_sched_job_cleanup(struct 
>>>> amdxdna_sched_job *job);
>>>>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
>>>>   int amdxdna_hwctx_walk(struct amdxdna_client *client, void *arg,
>>>>                  int (*walk)(struct amdxdna_hwctx *hwctx, void *arg));
>>>> +int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 
>>>> debug_bo_hdl);
>>>>     int amdxdna_cmd_submit(struct amdxdna_client *client,
>>>> -               u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
>>>> +               struct amdxdna_drv_cmd *drv_cmd, u32 cmd_bo_hdls,
>>>> +               u32 *arg_bo_hdls, u32 arg_bo_cnt,
>>>>                  u32 hwctx_hdl, u64 *seq);
>>>>     int amdxdna_cmd_wait(struct amdxdna_client *client, u32 hwctx_hdl,
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/ 
>>>> amdxdna/amdxdna_gem.c
>>>> index 7f91863c3f24..61e0136c21a8 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_gem.c
>>>> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
>>>> @@ -962,6 +962,9 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device 
>>>> *dev,
>>>>       XDNA_DBG(xdna, "Sync bo %d offset 0x%llx, size 0x%llx\n",
>>>>            args->handle, args->offset, args->size);
>>>>   +    if (args->direction == SYNC_DIRECT_FROM_DEVICE)
>>>> +        ret = amdxdna_hwctx_sync_debug_bo(abo->client, args->handle);
>>>> +
>>>>   put_obj:
>>>>       drm_gem_object_put(gobj);
>>>>       return ret;
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/ 
>>>> amdxdna/amdxdna_gem.h
>>>> index ae29db94a9d3..f79fc7f3c93b 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_gem.h
>>>> +++ b/drivers/accel/amdxdna/amdxdna_gem.h
>>>> @@ -7,6 +7,7 @@
>>>>   #define _AMDXDNA_GEM_H_
>>>>     #include <linux/hmm.h>
>>>> +#include "amdxdna_pci_drv.h"
>>>>     struct amdxdna_umap {
>>>>       struct vm_area_struct        *vma;
>>>> @@ -62,6 +63,11 @@ static inline void amdxdna_gem_put_obj(struct 
>>>> amdxdna_gem_obj *abo)
>>>>       drm_gem_object_put(to_gobj(abo));
>>>>   }
>>>>   +static inline u64 amdxdna_dev_bo_offset(struct amdxdna_gem_obj 
>>>> *abo)
>>>> +{
>>>> +    return abo->mem.dev_addr - abo->client->dev_heap->mem.dev_addr;
>>>> +}
>>>> +
>>>>   void amdxdna_umap_put(struct amdxdna_umap *mapp);
>>>>     struct drm_gem_object *
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c 
>>>> b/drivers/accel/ amdxdna/amdxdna_pci_drv.c
>>>> index 696fdac8ad3c..3599e713bfcb 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>> @@ -28,9 +28,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>>>>    * 0.0: Initial version
>>>>    * 0.1: Support getting all hardware contexts by 
>>>> DRM_IOCTL_AMDXDNA_GET_ARRAY
>>>>    * 0.2: Support getting last error hardware error
>>>> + * 0.3: Support firmware debug buffer
>>>>    */
>>>>   #define AMDXDNA_DRIVER_MAJOR        0
>>>> -#define AMDXDNA_DRIVER_MINOR        2
>>>> +#define AMDXDNA_DRIVER_MINOR        3
>>>>     /*
>>>>    * Bind the driver base on (vendor_id, device_id) pair and later 
>>>> use the
>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h 
>>>> b/drivers/accel/ amdxdna/amdxdna_pci_drv.h
>>>> index 626beebf730e..c99477f5e454 100644
>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>> @@ -55,6 +55,7 @@ struct amdxdna_dev_ops {
>>>>       int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
>>>>       void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
>>>>       int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, 
>>>> u64 value, void *buf, u32 size);
>>>> +    int (*hwctx_sync_debug_bo)(struct amdxdna_hwctx *hwctx, u32 
>>>> debug_bo_hdl);
>>>>       void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned 
>>>> long cur_seq);
>>>>       int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct 
>>>> amdxdna_sched_job *job, u64 *seq);
>>>>       int (*get_aie_info)(struct amdxdna_client *client, struct 
>>>> amdxdna_drm_get_info *args);
>>>> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/ 
>>>> amdxdna/npu1_regs.c
>>>> index e4f6dac7d00f..10124cccb102 100644
>>>> --- a/drivers/accel/amdxdna/npu1_regs.c
>>>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>>>> @@ -46,6 +46,7 @@
>>>>     const struct rt_config npu1_default_rt_cfg[] = {
>>>>       { 2, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
>>>> +    { 4, 1, AIE2_RT_CFG_INIT }, /* Debug BO */
>>>>       { 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>>>       { 0 },
>>>>   };
>>>> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/ 
>>>> amdxdna/npu4_regs.c
>>>> index 9f2e33182ec6..e1da882420ec 100644
>>>> --- a/drivers/accel/amdxdna/npu4_regs.c
>>>> +++ b/drivers/accel/amdxdna/npu4_regs.c
>>>> @@ -63,6 +63,7 @@
>>>>     const struct rt_config npu4_default_rt_cfg[] = {
>>>>       { 5, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
>>>> +    { 10, 1, AIE2_RT_CFG_INIT }, /* DEBUG BUF */
>>>>       { 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>>>       { 2, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>>>       { 3, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>>>
>
