Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPeqDP3uoWm5xQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:22:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D41BCAEE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E60110EC15;
	Fri, 27 Feb 2026 19:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PHG8u85W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011060.outbound.protection.outlook.com
 [40.93.194.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA34E10EC13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 19:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddLkzfLXfXQ6J9l/wSwswcCuQiHpgg0ZodZmO0PS+eL48w77gPYdHvhAj+Hd5JgmopFWv2SiKxLV0sjMsbUV5aOa00aLcTOeRehT3zmiSo1/EpHr8io4iXBbPuGy2S7IBYXPaZEf/9uPwSC3mXA0zqDsIzvQsX1z6NBbj96ulejMt0oncm034cyLGxdXx77WP/xex94dlMOTQc0QGhlorWscSeuep0acNOVcelbqVW+G4sRlayy6VWwq9sFyvbrUdkRXRdLQToM1Id2aJL0GmJbL9R+WQaaAYP2GcTC5J1CBqC1yP277c4LogCQoCezTRmSO5LYe0HabIrQHi7uemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfcaLRJxONM9j7Rp+aKLqPzPlKdSX6GrDaOec0yRvwU=;
 b=XkjqUO5fXKz8E54GAcFjuMl/iCA/a20yHOlGDEG6UcWFZxPWeLxfSTfekyOQ+hu9Pd1QqfoWJVwXz1BqxsmmsXzj8WXmDgaasOFNXrhtfNhwAM0jXgbUeQUZd6OLkTH2rEeDrTxSrSDfSLUf0mzx0zewwRtEhFmy7eI7NphKvazNpRY2DbznKKmcXFd7fpWWJy2MnSO8EVMPh7PKdj20leB4xsbNOGVd6xB2S8cJTKw+UIuiN4zaOTxLBPQ2XWosROQSFaEgSnhdMqJJLGAxtWRvFNENvXLuVXWbVk+wsIvBGLwBLJYxEf6y3IDHTMpveUk1o3yR7hMOJHLc2YaRsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfcaLRJxONM9j7Rp+aKLqPzPlKdSX6GrDaOec0yRvwU=;
 b=PHG8u85WHux/gL4XTWxPqXzE83ZQKsy81cwQmm+zOoEz/XckRIwQkkVryhW0nYokCaH2GQRpN3NZrWlUd/2PEPSOAdX1UN3C7xEf/ZXE1zn5U7HwDpFEP/a/2b3NX9YNaeEYFsAnsZh2jHt4kXuor1oDfBBCe53ikxlMFVpexoE=
Received: from SA1P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::35)
 by DS5PPFDF2DDE6CD.namprd12.prod.outlook.com (2603:10b6:f:fc00::665)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 27 Feb
 2026 19:22:22 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::85) by SA1P222CA0008.outlook.office365.com
 (2603:10b6:806:22c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 19:22:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 19:22:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Feb
 2026 13:22:21 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Feb 2026 13:22:21 -0600
Message-ID: <509ddd07-7277-2861-d602-d318d1ec1f71@amd.com>
Date: Fri, 27 Feb 2026 11:22:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 9/9] accel/amdxdna: Fill invalid payload for failed
 command
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260227004841.3080241-1-lizhi.hou@amd.com>
 <1af07b22-65c8-46cd-b055-fa6f61b33b16@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <1af07b22-65c8-46cd-b055-fa6f61b33b16@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DS5PPFDF2DDE6CD:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f29188-efd3-4f8f-d1c3-08de76358812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: k5WWuetJ2RWsiTgba3y9ke1+TgtXcWLswwUbZmuZQsxQjYJioYVo7BEJjumYIK1pLlUP5/47bQfejntUffd/rWLKS1Q6dD8VhBzwR7/z+CaVmLWdgHyUUdtVAWfsC74OqZEIbZw+DvPfKvm6YadwQT3ehD6kp1uSAOS+h2GDIQpipd2cXENX+vams44BvWEtoYONajpB4RRQaTw8kpTcAJq4ri8ANlmBhkvBHaPe+gvnC+pCnig6OdGwh5lLcpHh6P7UDIyeXpiocIvAI+DVYvap5kCar5M2awMOg4SefrcvkGM/TULwEdoT2aJnyHylQMgLNvGOPE/xrLb+XctH1Jl82e/ulv4AwAvnxtj4PZmZRGBlo6/3Is2J9t7h2aYwVlChk58MDymGm98Nwm8NbxyWvREfc2L/0+8U6qbZubAQKy5xX19SjRMjZ0mjOsQ6ixsGasZoVXbadgrZ/68cGn5gocFtWhRUfhErsJ+oiIIBjNF32IaVm5xJWfOMD9xDPVXe4g3VyP85g4m0JgqETDL6vUZugUeqoru8ML3/Qm9HGYTKLYKhBzPNRiafuHCXqhkUPzJckgBZwiv/PRZmFp+3nbd1jiIyZLJhkqtyeWF5OIxV/9rMZFeheWcGk5KQ2HB8+K6j9JwEK5vnwAzsrvxL9XQCQnWUFgq9EkLI3K/SR9zBn540kwFsVtVKrYXgmbCsrz8YXVluUHMV+Qyc/ZGisjKYruScvgU8UtKry6uiDOee+TJFvSazmWWcmWSkRaFB9NHYmw7O2TgKD9t0fAVwY3v53ZsJluBySilSw/zicipNiYcZCy18JUsuYzEQ5OjrAtyk9Q0Hg02I21QHtA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0ShueEhUc2y9vl7+CrgTXu1nNkNFxylth7roRM/ZiDt5Q51UfYn6t1c2QdEwWZc+PFIQXhiVrFtc3ifqN5ZdJHH3W20T0FL0jrmRzjawZFKp5a2Pg1ns4dMABjZViILwUULHtBu1zO7svFY+YRDu8t91ccA7JKIWjxrPyPhiSeU7Qwn6zY6PzsSCgvbxqxbnXke2Hp7oNUx1jWR7qJ4fOY2yeehqxZVSxZ+mxDqVPNw9b0RxxD47w/s2czEkjlBj5BUSfYD2OCeqVLbrBv16q0CwSnEBHZijo4zbnsgq3JhUJsAKD4chlhddFAYjelm3EwJEkH5ZcGOSDpRuFx/RyW50aFFDih8LryNP8ctC6PxlljqrGyWkPyvcVU7YNhk2i4d2aWJJ4UMrwolWtIFeLFhad6lO0nbEveUMC9wnorNwNuzrlxWUyQPbqQJEljyT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 19:22:22.0799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f29188-efd3-4f8f-d1c3-08de76358812
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFDF2DDE6CD
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS(0.00)[m:superm1@kernel.org,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 587D41BCAEE
X-Rspamd-Action: no action


On 2/27/26 10:47, Mario Limonciello wrote:
> The title is 9/9, but I didn't get copied on 0 through 8.  Was that 
> just a mistake when you made the patch you sent out one patch instead 
> of 9?
Sorry for the confusion. Yes, this is just a mistake. There is not 0-8.
>
> On 2/26/26 6:48 PM, Lizhi Hou wrote:
>> Newer userspace applications may read the payload of a failed command
>> to obtain detailed error information. However, the driver and old 
>> firmware
>> versions may not support returning advanced error information.
>> In this case, initialize the command payload with an invalid value so
>> userspace can detect that no detailed error information is available.
>>
>> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Would it also make sense to also detect the firmware version and 
> indicate in the logs, IOCTL or a sysfs the feature is available for 
> user space to detect?

Thanks for the suggestion. I will discuss with the team and see if there 
is good way to describe the features firmware provides.

Lizhi

>
> Nonetheless, this approach is scalable.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c    | 23 ++++++++---------------
>>   drivers/accel/amdxdna/amdxdna_ctx.c | 27 +++++++++++++++++++++++++++
>>   drivers/accel/amdxdna/amdxdna_ctx.h |  3 +++
>>   3 files changed, 38 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 622ddbf7fb6f..eb4c9d919885 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -186,13 +186,13 @@ aie2_sched_resp_handler(void *handle, void 
>> __iomem *data, size_t size)
>>       cmd_abo = job->cmd_bo;
>>         if (unlikely(job->job_timeout)) {
>> -        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
>> +        amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_TIMEOUT);
>>           ret = -EINVAL;
>>           goto out;
>>       }
>>         if (unlikely(!data) || unlikely(size != sizeof(u32))) {
>> -        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>> +        amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_ABORT);
>>           ret = -EINVAL;
>>           goto out;
>>       }
>> @@ -202,7 +202,7 @@ aie2_sched_resp_handler(void *handle, void 
>> __iomem *data, size_t size)
>>       if (status == AIE2_STATUS_SUCCESS)
>>           amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
>>       else
>> -        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
>> +        amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_ERROR);
>>     out:
>>       aie2_sched_notify(job);
>> @@ -244,13 +244,13 @@ aie2_sched_cmdlist_resp_handler(void *handle, 
>> void __iomem *data, size_t size)
>>       cmd_abo = job->cmd_bo;
>>         if (unlikely(job->job_timeout)) {
>> -        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
>> +        amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_TIMEOUT);
>>           ret = -EINVAL;
>>           goto out;
>>       }
>>         if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
>> -        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>> +        amdxdna_cmd_set_error(cmd_abo, job, 0, ERT_CMD_STATE_ABORT);
>>           ret = -EINVAL;
>>           goto out;
>>       }
>> @@ -270,19 +270,12 @@ aie2_sched_cmdlist_resp_handler(void *handle, 
>> void __iomem *data, size_t size)
>>            fail_cmd_idx, fail_cmd_status);
>>         if (fail_cmd_status == AIE2_STATUS_SUCCESS) {
>> -        amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>> +        amdxdna_cmd_set_error(cmd_abo, job, fail_cmd_idx, 
>> ERT_CMD_STATE_ABORT);
>>           ret = -EINVAL;
>> -        goto out;
>> +    } else {
>> +        amdxdna_cmd_set_error(cmd_abo, job, fail_cmd_idx, 
>> ERT_CMD_STATE_ERROR);
>>       }
>> -    amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
>>   -    if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN) {
>> -        struct amdxdna_cmd_chain *cc = 
>> amdxdna_cmd_get_payload(cmd_abo, NULL);
>> -
>> -        cc->error_index = fail_cmd_idx;
>> -        if (cc->error_index >= cc->command_count)
>> -            cc->error_index = 0;
>> -    }
>>   out:
>>       aie2_sched_notify(job);
>>       return ret;
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c 
>> b/drivers/accel/amdxdna/amdxdna_ctx.c
>> index db3aa26fb55f..405d2c62789d 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>> @@ -132,6 +132,33 @@ u32 amdxdna_cmd_get_cu_idx(struct 
>> amdxdna_gem_obj *abo)
>>       return INVALID_CU_IDX;
>>   }
>>   +int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
>> +              struct amdxdna_sched_job *job, u32 cmd_idx,
>> +              enum ert_cmd_state error_state)
>> +{
>> +    struct amdxdna_client *client = job->hwctx->client;
>> +    struct amdxdna_cmd *cmd = abo->mem.kva;
>> +    struct amdxdna_cmd_chain *cc = NULL;
>> +
>> +    cmd->header &= ~AMDXDNA_CMD_STATE;
>> +    cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, error_state);
>> +
>> +    if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN) {
>> +        cc = amdxdna_cmd_get_payload(abo, NULL);
>> +        cc->error_index = (cmd_idx < cc->command_count) ? cmd_idx : 0;
>> +        abo = amdxdna_gem_get_obj(client, cc->data[0], AMDXDNA_BO_CMD);
>> +        if (!abo)
>> +            return -EINVAL;
>> +        cmd = abo->mem.kva;
>> +    }
>> +
>> +    memset(cmd->data, 0xff, abo->mem.size - sizeof(*cmd));
>> +    if (cc)
>> +        amdxdna_gem_put_obj(abo);
>> +
>> +    return 0;
>> +}
>> +
>>   /*
>>    * This should be called in close() and remove(). DO NOT call in 
>> other syscalls.
>>    * This guarantee that when hwctx and resources will be released, 
>> if user
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h 
>> b/drivers/accel/amdxdna/amdxdna_ctx.h
>> index 16c85f08f03c..fbdf9d000871 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>> @@ -167,6 +167,9 @@ amdxdna_cmd_get_state(struct amdxdna_gem_obj *abo)
>>     void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 
>> *size);
>>   u32 amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
>> +int amdxdna_cmd_set_error(struct amdxdna_gem_obj *abo,
>> +              struct amdxdna_sched_job *job, u32 cmd_idx,
>> +              enum ert_cmd_state error_state);
>>     void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
>>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
>
