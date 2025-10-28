Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB04C16652
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 19:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110E210E644;
	Tue, 28 Oct 2025 18:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NZfOp8IP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2691E10E644
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 18:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5X546JCh3Oq7V1Y75iKNr9PDn8qx33EAmYDPwkF27SXxAaE3cXg7gpgmWHKjKDqDQsJonyVvaLfoUCi6VJw+OomWO0Z22CWkthvgf+aL+RiMuHGMDBYrdHvxM5pznl2iJ5OPhV708pHAa4rh11l99taP76Nrr7g1m/kGqs2YT2i8igimD1EKOA4Q7PsmftYPChkc4j0tEqA1bxfx2/O+NmCJhlaVf/YMVoAZ7YFqJMMUDfEIoaTrDuoDcYBWHZJSL0PB75trGKPifIkcPMnrH02HkOqWYnkUuSHwXn+KjsZBDGZMa5U47sjKZm3q6z3zPPiwA2dIQhevR/1yPZZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fkz4t+WzKY4vWbp3zK8n2vsSjRRI8kYWTMBY/jF0+vQ=;
 b=gkb/A5FSz6JQiAkqg5S+fL7rBjVi/ZVz+TeXOX5rrzrG9LOG/sI4/dSwxRPHfzapx9XIVM0j1ziVADmgCR99OpPyYXcn46LRs31tfesSMSOOQYk8o84BjxoQG2qBT0g41HqJq9psOlBZnh1vMAFODU9RYyCPjEgnn3HXfRRs9ruxb+S3Lg1dYZb1hy0V1npFWGfibktKM2R5GKofZ6KGJtfXFjo+w1I78s1TNURuQ9M0Q0FQnVzXVM/Qi1m5xHOFcLtwGercdw2VBBvMVzYdnzccEnjPSmKrE+PArG0gT2yP/tsli+1TkL29VTOeRgPqlHGIcvjwTcxowk/F8ynhNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fkz4t+WzKY4vWbp3zK8n2vsSjRRI8kYWTMBY/jF0+vQ=;
 b=NZfOp8IPVnyp87tUVm1G35dakynx4GBaJAiQdK5fM9noLFCp1hO93dKEv+KGxoO84GRD/+wbbBYr+4dCuQzLZqxQenGsxTubi3OOLIi1lZzBgwNDxrN/4OvsjiBUrM/662RvQhssnEGHcV/9OYaLVqjI9GRAQ69NNipOChQomyc=
Received: from BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::16)
 by DS7PR12MB5791.namprd12.prod.outlook.com (2603:10b6:8:76::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 18:10:05 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:59d:cafe::e7) by BY1P220CA0008.outlook.office365.com
 (2603:10b6:a03:59d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Tue,
 28 Oct 2025 18:10:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 18:10:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 28 Oct
 2025 11:10:03 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Oct
 2025 13:10:03 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Oct 2025 11:10:02 -0700
Message-ID: <c63412f6-de01-9324-7d7a-940e10393ba9@amd.com>
Date: Tue, 28 Oct 2025 11:09:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/7] accel/amdxdna: Fix incorrect command state for timed
 out job
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20251027205928.2247897-1-lizhi.hou@amd.com>
 <00645fec-6712-4791-2221-551b636b2c9a@amd.com>
 <dd9f53d6-f10f-4b8a-b0a9-1a9e2c311c7e@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <dd9f53d6-f10f-4b8a-b0a9-1a9e2c311c7e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|DS7PR12MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: a92874f6-39d1-4ae0-f129-08de164d388c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WERrWER0WlhmUzlIVlhvbmJmWWxWNTdSNFV4TDAyOWdEQnllNW1OaGJYdm9z?=
 =?utf-8?B?Vm5pN3o2Z0NpRTR0QkQ3Tm1QTy9jMjdBS0g3TEd0L3lHcFh1MUhWTm5XQS9J?=
 =?utf-8?B?Y3YvK3BjZ3Z5S0FLdG4vUSs0eEpkTElSSzh4RE5lSVpjVThlb0dnZW5WMnVo?=
 =?utf-8?B?Tlk4cjY1dG9nNVkxamNwVE52UERqWmxURGRYYmFjR3ZQZWVoNmo3VGwxTGNa?=
 =?utf-8?B?aDBZcTFHenhGL0JKcDFhbnpPbEpZeTNJOXN6bXhyQW83ck1xMzVUelUxVzJS?=
 =?utf-8?B?Qm5uMktJS053WDlQazJoVW1jc1A2V1JQQzFKZVZQSWZQZWxEMVFYYjlYazlE?=
 =?utf-8?B?bDN3N3FKdDhLcVIyZVA3ajZiR2ZYQjZpZ2wvTGQzckNVVENwYzFBRWlCbzNX?=
 =?utf-8?B?dVYvb1doWjdkRG1kbTZLZytiOVRIMXhZdUxwTml3S0lxS1NUTEl4MVZZOGtP?=
 =?utf-8?B?SVNJWDUxWlVqQlZacDBYeUR6Q293U1QvVkVhTnE1Yk13Y2tpMTU1VEFFQ3Bq?=
 =?utf-8?B?eXJHS2lqMis0WWU3bUM4VGNsZGFvN24xd3A3L3VjOUlpWisvTURKRE5KUnRI?=
 =?utf-8?B?VFVmaGU4aEVzRkdET0pzUGtFY3pwSHhWSi9vSHpOUjEzQnQrUHNISWc3UXdl?=
 =?utf-8?B?TFRHYlZ5Q3o0WWhFTG11eXdUaVF2UXFKcUMyY2t6OU0vd242TUtvSkVXeGNF?=
 =?utf-8?B?aUlQN0pXSk5VOTd5SUl1Qit1OVA2WE5zaE1FekJBZ2RHeENKcFVkSlJDeGY5?=
 =?utf-8?B?V0tNdFdsNlpVdWJHRVVYNFI5cFVrcWJSRnlJOWxGL211cDgzcE92SXU5ZWtI?=
 =?utf-8?B?MTh1M3pJVUYycWtNNzkzRWVpamNlNmh0WitVY0Z6YWlsenhjQ0tqR2NPbmhn?=
 =?utf-8?B?dzFxMUpwZDdvRjZFYWxzM1U4Z0tIeCtFZHNMRm55bk13bVFFM1J4MHR2d2tr?=
 =?utf-8?B?ZHB3S2lZRFptbis4SjF5bS93YUhMR0c5enZ2L2QyblovVldoZS9tQTZqNVUv?=
 =?utf-8?B?TVFIZStxNmYwbUVEZjVrVTZwMDNuMEtaUUFSZUkzUnFYT0l5c2Y5eWcwcXR0?=
 =?utf-8?B?Zk9kSDNkcHhTQllNcTVaQzRCM2x2ZUd0eFdOenViRXlNKzhndFhKOEN0QWt0?=
 =?utf-8?B?WFlEMTlVQlZZWFFLYjk2WG9JcEZjbnBsbE8wb3BETCtzRzkxTDR2bHh2NzBL?=
 =?utf-8?B?MTNSdXU5WnZNeE95bVg1RXdBaG1wVzEwcWdSS2Q5TCtTSlZac0x0UTVXNXly?=
 =?utf-8?B?bzd6K2N2M1BvVXhnOVdiQ3dlcXUvbEVVMHpxOXNvSWZYclJ6RFIwRlpRcklL?=
 =?utf-8?B?cURwTWV0RXE3UFBrQU1ickJ6cG5xNjg1aUNIbmJmNGFOcG1CUjQ4QkhhNjg5?=
 =?utf-8?B?Q3BJWHE3Ty9ieWQ4NVA3eldqVGU5RUROVm1mR0dVbC9HSFRteFNuT3UySmtv?=
 =?utf-8?B?MWhSa2ZTQnhHZjFjSW90bi96cXhTK1o0VzJlWWFPMVpEbTRvenVIV2E5UXBM?=
 =?utf-8?B?K1AyeE9NUjlleTY3dWRKTEJ5TDZvOGRxNHN0VVJucWp3a1prVGlEaW94RFNz?=
 =?utf-8?B?dnB1NEN0bituMy9PaXgwWGczbHNHdjcvTVphR0JZMm40aGNLOGxNMUt2S0hV?=
 =?utf-8?B?TS94OVZiSC9TUFVkcGFwVXFIVlowcTlkTzRjZElNem8xa0kxOUZWekZlNFlj?=
 =?utf-8?B?TmN3TE14NHoxYWtqSEdBUEs0cWFKam54aWdxT2xMQVhrVlhoZTJ1QUJSamYr?=
 =?utf-8?B?MVduSFRVRW5jNkM5OGNWU1ZkcHg4dEhJM1JHKzNSeFlFRlFPR1l0Q0hFTWV6?=
 =?utf-8?B?T0czcDJPQTE5SlJUb2RCUlpqY1huOUQrTmtscVYwcFJjTGR1aVh5bkQ0RFlX?=
 =?utf-8?B?SCt2bnBLQW0yV3lCbVFaNzlpZTc4dWw0VkJtMVpQeXQ4ZHpva0pWMEQzcjlT?=
 =?utf-8?B?dnAyYzU5WjZLbGFaSk42RG8zdlBZaDRMQ01BejNaT1FUWGpVUmFvMlg1QnFU?=
 =?utf-8?B?VGExMnVWYkJMTjJqVmxtTjFvb3BGNVRXcGI0U0tKL2VibXF5UlVWOFpxS3Fs?=
 =?utf-8?B?V1ZocHJGQ3A3REhvcXFjNFZtZ1V4VVppUnp6Ui9YRTlyeW9NSEcyTndSN29k?=
 =?utf-8?Q?8LSY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 18:10:04.8872 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a92874f6-39d1-4ae0-f129-08de164d388c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5791
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


On 10/28/25 10:56, Mario Limonciello wrote:
> On 10/28/25 12:53 PM, Lizhi Hou wrote:
>> The title [PATCH 1/7] is confusing. I will resend with a clean one.
>>
>>
> Is this an accidental send?

I just noticed I had mistakenly put "1/7" in title.


Lizhi

>
> I noticed one with same-ish title in my inbox.
>
> [PATCH] accel/amdxdna: Fix incorrect command state for timed out job> 
> Lizhi
>>
>> On 10/27/25 13:59, Lizhi Hou wrote:
>>> When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
>>> commands that are canceled due to this timeout should be marked as
>>> ERT_CMD_STATE_ABORT.
>>>
>>> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>> ---
>>>   drivers/accel/amdxdna/aie2_ctx.c    | 12 ++++++++++--
>>>   drivers/accel/amdxdna/amdxdna_ctx.h |  1 +
>>>   2 files changed, 11 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>>> b/drivers/accel/amdxdna/ aie2_ctx.c
>>> index c6c473c78352..958a64bb5251 100644
>>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>>> @@ -204,10 +204,12 @@ aie2_sched_resp_handler(void *handle, void 
>>> __iomem *data, size_t size)
>>>       cmd_abo = job->cmd_bo;
>>> -    if (unlikely(!data))
>>> +    if (unlikely(job->job_timeout)) {
>>> +        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
>>>           goto out;
>>> +    }
>>> -    if (unlikely(size != sizeof(u32))) {
>>> +    if (unlikely(!data) || unlikely(size != sizeof(u32))) {
>>>           amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>>>           ret = -EINVAL;
>>>           goto out;
>>> @@ -258,6 +260,11 @@ aie2_sched_cmdlist_resp_handler(void *handle, 
>>> void __iomem *data, size_t size)
>>>       int ret = 0;
>>>       cmd_abo = job->cmd_bo;
>>> +    if (unlikely(job->job_timeout)) {
>>> +        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
>>> +        goto out;
>>> +    }
>>> +
>>>       if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
>>>           amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>>>           ret = -EINVAL;
>>> @@ -370,6 +377,7 @@ aie2_sched_job_timedout(struct drm_sched_job 
>>> *sched_job)
>>>       xdna = hwctx->client->xdna;
>>>       trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
>>> +    job->job_timeout = true;
>>>       mutex_lock(&xdna->dev_lock);
>>>       aie2_hwctx_stop(xdna, hwctx, sched_job);
>>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/ 
>>> amdxdna/amdxdna_ctx.h
>>> index cbe60efbe60b..919c654dfea6 100644
>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>>> @@ -116,6 +116,7 @@ struct amdxdna_sched_job {
>>>       /* user can wait on this fence */
>>>       struct dma_fence    *out_fence;
>>>       bool            job_done;
>>> +    bool            job_timeout;
>>>       u64            seq;
>>>       struct amdxdna_drv_cmd    *drv_cmd;
>>>       struct amdxdna_gem_obj    *cmd_bo;
>
