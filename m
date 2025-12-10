Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E008CCB39BE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 18:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B42810E787;
	Wed, 10 Dec 2025 17:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rZPsVhJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010064.outbound.protection.outlook.com [52.101.46.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EDB10E787
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 17:24:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iveLaGHjwV51b/w8losZezuBHSO4VAcd8ShhmSTsMb7dxIHcgQKsGrh/LWI+55ZcDo039CFZXATATL/EeZ0AszzgVNNPkAKZ05q16QimdEbc1167dsAFWsTi8SLl2bpm7Wl2Kcjv5DQZA8jc9Eyd/st0ttUS6RkQMlEtdeJQrFyJzTdaPc3p7DvpbLocafHgsRLng8nzdhJ6MGus4C8QFEC0kxwAl3OJ4EBcqFuRrmN4qRgsovGEDB0aZD1+MLIpESVBVlqMf499507RAsIzCo5123VvQ3Q5Osnw9+dZFUcKKN0FzBv1ZgEjYzBzroOrl2ImGSAk9SFwFvZjT30GFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5A6dppnmqrE2z3YWeCbGahKLBsAaLq0EeqWb+26Sb8=;
 b=JRCrhOWvYl671XsCMGme7lcMh5NrEe0jTb5ONeMrdGewRCqf0Hf4bRMxA3ZmG8MlGfnFs83kuJBycfdSWDaVka9LjBeEltd2UT1oBK/FJw+49k4E79Ncd5vfaF893HrNnknRGSRD9RIiwCy3nlPuvARYLtRz1F/mK3JvpIY03Y9FcAcdeOM5lvdo38HGvVsxE9QOMpNaioqGZjEdyxMAo4RPVFH1Hqjn3+8NyV15pSI/Wuo3I9ssGU4zXD2Z6BbIiduLMZ28Kl9jCj568iDMHKSNvhNBkuHCZlLkxBPvaEc3TW9lDERhqL6CsMf5chOSuR+8p7nQNqwZQ9kng70Crg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5A6dppnmqrE2z3YWeCbGahKLBsAaLq0EeqWb+26Sb8=;
 b=rZPsVhJWqwy0z7P6runWfhucVVHl6R4zyqTFFFbnjoeJi8R3zRoERHICJFmk27wm9faGP+eZwqu/cGV8fXkumeE7yT6a/R+29kDn8YFuMmtcZsLaEEuUgKlYdvAZNEIPWjN0F0anYJTfXCi3vB44asy3WydCaWYztkFfhcVF4Ig=
Received: from SJ0PR13CA0038.namprd13.prod.outlook.com (2603:10b6:a03:2c2::13)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 17:24:32 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::93) by SJ0PR13CA0038.outlook.office365.com
 (2603:10b6:a03:2c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Wed,
 10 Dec 2025 17:24:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 10 Dec 2025 17:24:32 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 11:24:31 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 09:24:31 -0800
Message-ID: <98299eea-9da5-f887-521e-402a735758be@amd.com>
Date: Wed, 10 Dec 2025 09:24:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix cu_idx being cleared by memset()
 during command setup
Content-Language: en-US
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251209211639.1636888-1-lizhi.hou@amd.com>
 <e62a3c30-162d-4ba4-bfed-4bb98d9ebfba@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <e62a3c30-162d-4ba4-bfed-4bb98d9ebfba@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: caa78215-d5b9-4afd-749d-08de3810fbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFdXU3BFSnB3aU5aNlJLOFVVV0o5YVQvRnB2ZmFkQ1JPK004ejdtZ2hqNlI4?=
 =?utf-8?B?ZnAxQWJBbkxhUmhSSnJlaW9zUHZHcnNwa1d4RTA2QzFnMS9ZbHpNY1h6eTJU?=
 =?utf-8?B?L3poNVBmd3lUZXlPdll3a1RhOFVnc1hGOU9icDNPTTZCMytBU1MrMGw2VUty?=
 =?utf-8?B?Zk5PMmUzeVFLTS9XbDJyZk5UdSsrUkNwcUVkOFNuaEFLR0I4QWQ4R3p2TzZx?=
 =?utf-8?B?WDUrZ3hmQ1JwR3kveVUxeUQ3VVlGUmdHajBkTVRHd2swSkZjSGt4SzZ6TTBV?=
 =?utf-8?B?MkVVSUtSS3JoT0ZUVFlSbDdzWVNIWGF2a1h0UVNUeUhuQjZpbGhna1F0dm4v?=
 =?utf-8?B?YXlZMW9PVlJxR1B2ZXRpZ1dEQmJrY1FER1R3RS9pRjJuaXp4TFRFTVM5clhZ?=
 =?utf-8?B?aFhYclhyNlJhTjJoWm5FV1NhaGNDaTNBVkt1OHRBOGlMRHQ2bzJTRWtHWEJk?=
 =?utf-8?B?UFREZ3hCTjZUckhnaHZzUmE4U3d5blpVc29LNndUYUE3S0hhOTd3bDR3UW80?=
 =?utf-8?B?ZVh6QVBQNVlyYi9sV2JkVHdic3orUWl3WUhEbFZ6bjdSZVc1alZEb25UTWQ1?=
 =?utf-8?B?ZHBQUGtpaytEUTJXeHhWWU9iSkZieWt3UXdiaDhZTllydXJwZGRvRmp1aElC?=
 =?utf-8?B?M1M1RW50MXh0eHNCc0lKSDMyMlE1SlFPdmkrdHV6VllBdlloRFlLajFXN3cr?=
 =?utf-8?B?ZDlPYmlybGhGd3A3M2xuYS94NEprMUJPcG1wY09ibzZVMU15cmZxNmNONGhX?=
 =?utf-8?B?NWN6STJuSUovQkIrYXhQNDAwVXNMV3RyNUlHQldXYmtBOVZob3diVUE5dVNy?=
 =?utf-8?B?UFQyWllqckFON3prVkNYYzg0cVJZODg4WkR6NVpXQkJQSVNYWVcraDNBV050?=
 =?utf-8?B?QjJNOS93VWtBYlhxYWZjMG9ETFd6Y1B3cHRqZlNQUHd2bUFzZkRjVVhWQmk0?=
 =?utf-8?B?WGc1b056L3FJQkJuMmpzZmplQVVEa3MyVmJVK0JzZzlUV1cyd0thdzNsaWZk?=
 =?utf-8?B?cFhtdzJHT3lXa0t1Wm8xS0l3VUR1N2Ivdk5jV2ljeHllTDE2M1pOYWl3cm5D?=
 =?utf-8?B?cEJyeTIrQjl4ay82NVVsM0FNcjlzdkxZWm96Q1hBekFrc0VJK29oaEFqWFdG?=
 =?utf-8?B?TXVEQUs0Qk5GOGhDM3dxRGtZSWFpOTdwY0VsZWx5VUdVcFIrUjhzamY5K25n?=
 =?utf-8?B?dTM4TFJYRm5KVHNlTmhHTWthWHhRRmpKTjFiNWh2OW5hV0E3dFZrNXhyYTNs?=
 =?utf-8?B?aVMraFNLZi9OczZpTG1IYXJMMkhUZ05NQWx2SDRaSy9QL21aMEVUVm1sRmZa?=
 =?utf-8?B?NVNia1UrbDdYMVFESHRreHZhMVR6dmt1aXVvZHV2TThuM0dqcWNqc1ZoN0NH?=
 =?utf-8?B?SE4yR3hrM25FV0VKS2c5dHQ3T21odzFIblRKQ2FvVjNQWkFtSTJGZXkzbWVB?=
 =?utf-8?B?RmsreENORGVNK3hEbzlXNWRIZk54Nm9ZZzlINnplTFNhWGZWWGozZDRuS2ln?=
 =?utf-8?B?OHU1SEZkRlhoWFRHcENWdGVxNElHU2lBeGhyQmh6dHVpSFo4L1RIUmcwbk1o?=
 =?utf-8?B?UHNtWUJSU2V1QXRnTE9CMjNydldqL1BtU3BTSEc3Y3BVZGlsdmh3MGwwdDRx?=
 =?utf-8?B?alRNajNzOGhuVWlYQlRFWmNBY0l5THMyeVU4c3Z5cEhCVHEzMW82bHBKVElm?=
 =?utf-8?B?ZEdvZ2ZXcndvZnZjcmJZaEpjTWlqeTY2OUVoV3crQzRmZFZnMm10b2s0ZDBa?=
 =?utf-8?B?dFp4RkFjWDdNdUMxZThxR1FNNXFMMktmcXEya0thUDhyejJLenpPeno3WUor?=
 =?utf-8?B?T0s4MGdwZ1JFaG0rSTBBRi9GNDkycjF6aWVCS1JWUXM5d1ZOQWpaaHlUazA1?=
 =?utf-8?B?Q0wwNEIrMlNVUHBIR3lFek0vRllUblp1VWNzeFpQeFpoMlFBREI2aUk4MDRj?=
 =?utf-8?B?U1ltT1dQWXh2dlVuN1h4YlQzYkVFV0YrNlkyU1FWWE9FQ2pwNFR4SFhuRTQ4?=
 =?utf-8?B?dWZHbGJsS0ZDNURyRjBvZjVDUEp1OGR2Sjl1YWRwQzVON28wdlY2ZGllRkZO?=
 =?utf-8?B?WFdlWDBLayt3TmFkUm1HQnZaVjRqalBhanpUUkhLeXo0dnRNK2xQYjNQK1dU?=
 =?utf-8?Q?kPTA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 17:24:32.5843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caa78215-d5b9-4afd-749d-08de3810fbbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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

On 12/9/25 21:37, Mario Limonciello (AMD) (kernel.org) wrote:
>
>
> On 12/9/2025 3:16 PM, Lizhi Hou wrote:
>> For one command type, cu_idx is assigned before calling memset() on the
>> command structure. This results in cu_idx being overwritten, causing the
>> firmware to receive an incomplete or invalid command and leading to
>> unexpected command failures.
>>
>> Fix this by moving the memset() call before initializing cu_idx so that
>> all fields are populated in the correct order.
>>
>> Fixes: 71829d7f2f70 ("accel/amdxdna: Use MSG_OP_CHAIN_EXEC_NPU when 
>> supported")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/accel/amdxdna/aie2_message.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_message.c 
>> b/drivers/accel/amdxdna/aie2_message.c
>> index a75156800467..03b75757a6e6 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -652,6 +652,7 @@ aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj 
>> *cmd_bo, void *slot, size_t *siz
>>       u32 cmd_len;
>>       void *cmd;
>>   +    memset(npu_slot, 0, sizeof(*npu_slot));
>>       cmd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>       if (*size < sizeof(*npu_slot) + cmd_len)
>>           return -EINVAL;
>> @@ -660,7 +661,6 @@ aie2_cmdlist_fill_npu_cf(struct amdxdna_gem_obj 
>> *cmd_bo, void *slot, size_t *siz
>>       if (npu_slot->cu_idx == INVALID_CU_IDX)
>>           return -EINVAL;
>>   -    memset(npu_slot, 0, sizeof(*npu_slot));
>>       npu_slot->type = EXEC_NPU_TYPE_NON_ELF;
>>       npu_slot->arg_cnt = cmd_len / sizeof(u32);
>>       memcpy(npu_slot->args, cmd, cmd_len);
>> @@ -677,6 +677,7 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj 
>> *cmd_bo, void *slot, size_t *si
>>       u32 cmd_len;
>>       u32 arg_sz;
>>   +    memset(npu_slot, 0, sizeof(*npu_slot));
>>       sn = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>       arg_sz = cmd_len - sizeof(*sn);
>>       if (cmd_len < sizeof(*sn) || arg_sz > MAX_NPU_ARGS_SIZE)
>> @@ -689,7 +690,6 @@ aie2_cmdlist_fill_npu_dpu(struct amdxdna_gem_obj 
>> *cmd_bo, void *slot, size_t *si
>>       if (npu_slot->cu_idx == INVALID_CU_IDX)
>>           return -EINVAL;
>>   -    memset(npu_slot, 0, sizeof(*npu_slot));
>>       npu_slot->type = EXEC_NPU_TYPE_PARTIAL_ELF;
>>       npu_slot->inst_buf_addr = sn->buffer;
>>       npu_slot->inst_size = sn->buffer_size;
>> @@ -709,6 +709,7 @@ aie2_cmdlist_fill_npu_preempt(struct 
>> amdxdna_gem_obj *cmd_bo, void *slot, size_t
>>       u32 cmd_len;
>>       u32 arg_sz;
>>   +    memset(npu_slot, 0, sizeof(*npu_slot));
>>       pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>       arg_sz = cmd_len - sizeof(*pd);
>>       if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
>> @@ -721,7 +722,6 @@ aie2_cmdlist_fill_npu_preempt(struct 
>> amdxdna_gem_obj *cmd_bo, void *slot, size_t
>>       if (npu_slot->cu_idx == INVALID_CU_IDX)
>>           return -EINVAL;
>>   -    memset(npu_slot, 0, sizeof(*npu_slot));
>>       npu_slot->type = EXEC_NPU_TYPE_PREEMPT;
>>       npu_slot->inst_buf_addr = pd->inst_buf;
>>       npu_slot->save_buf_addr = pd->save_buf;
>> @@ -745,6 +745,7 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj 
>> *cmd_bo, void *slot, size_t *si
>>       u32 cmd_len;
>>       u32 arg_sz;
>>   +    memset(npu_slot, 0, sizeof(*npu_slot));
>>       pd = amdxdna_cmd_get_payload(cmd_bo, &cmd_len);
>>       arg_sz = cmd_len - sizeof(*pd);
>>       if (cmd_len < sizeof(*pd) || arg_sz > MAX_NPU_ARGS_SIZE)
>> @@ -753,7 +754,6 @@ aie2_cmdlist_fill_npu_elf(struct amdxdna_gem_obj 
>> *cmd_bo, void *slot, size_t *si
>>       if (*size < sizeof(*npu_slot) + arg_sz)
>>           return -EINVAL;
>>   -    memset(npu_slot, 0, sizeof(*npu_slot));
>>       npu_slot->type = EXEC_NPU_TYPE_ELF;
>>       npu_slot->inst_buf_addr = pd->inst_buf;
>>       npu_slot->save_buf_addr = pd->save_buf;
>
