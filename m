Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ7rNQKUommt4AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:06:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1651C0D0D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 08:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E4610E13C;
	Sat, 28 Feb 2026 07:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jDcssO5X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB1810E13C
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 07:06:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyE6dZTUkuk0CjSrVPI5Y2srlle9w/QOVnsXfWVeVDXCn4Hac254i+qZUXpLAjSuIw06LfXx2O4gwpxrpFzNnDrq6zzCMSrvpGcc5NTeCclBm8aXsG7eAT9kbALeRfW9wq2TBqG4Q+iiwsrkQHxt9u3gIt6JQL0b5cz9lSxDGbPc+l2P53wMhm122a+PvwLmQREEh3IxL7CkNyHGE2sTuhLd7UO9nuEqhjh2fTRNg0wVwqVpe7LA+7vxjbQSJm4Oj/T4UC8xo3PtbngEraT8lTPg1RYONrizyJJzoKiR4Y8Lrh40LWLuGzyccAzPPs1/erwqu6LWy4L9uCANAyBgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnkezrXyxQq/SuEU6B540J+5opdBa9pKAeRNDP3aOkQ=;
 b=LjBjdQC8b5R7fCkQrQquFTtV8+tpLEc0P/XrTnXU609GHvQGnywyh6/a4CZPQCy61Me+PEhtxXYR45kk4wzxYFBtVXdSC/kb2Wp+8usUtgf+NErzYPPitsZLaoEd7qyj25z6ZEr2FZBE8c15Ur98jgLGf/aHaC9pgEwLDOxPs2mYIHNL8IfuimKLc/MahUPMVe21eYfp1khW2dbR7kODHt5thig+6voyACYER4ZcIHq+2qYKYrnMMvlkEm8USxLzxeXoc6skTj7znjEjf0CMTECZDGpRCc2m6j/0iJ6ULzjL564PgsTXSpcT/iebiCdHC9xpRluWWmm/aJ5krCp62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnkezrXyxQq/SuEU6B540J+5opdBa9pKAeRNDP3aOkQ=;
 b=jDcssO5Xj1OjTyVvDIX51UAIoNOaRIrq4EpkpQUq/wqupJs2awACwqQy78PMvSXZMDZMAee8YNjv1cT2X8Jj61uHc7SNisdjSsJ9Z5Wn2KvIOZ8G4An+d3xvEo8duRdwLqLdBkDwxYiZWysqTyWUW3ATgr6jXsVFR47DxH+HPzA=
Received: from IA4P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::13)
 by MN2PR12MB4486.namprd12.prod.outlook.com (2603:10b6:208:263::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Sat, 28 Feb
 2026 07:06:34 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:559:cafe::95) by IA4P221CA0010.outlook.office365.com
 (2603:10b6:208:559::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via Frontend Transport; Sat,
 28 Feb 2026 07:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sat, 28 Feb 2026 07:06:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 28 Feb
 2026 01:06:34 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Feb
 2026 23:06:33 -0800
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 28 Feb 2026 01:06:33 -0600
Message-ID: <2d7017cb-ed15-3e4b-d474-63d0a1b12dc3@amd.com>
Date: Fri, 27 Feb 2026 23:06:33 -0800
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|MN2PR12MB4486:EE_
X-MS-Office365-Filtering-Correlation-Id: 947eb9de-1094-4bb2-f831-08de7697e847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: aBZR0wI2Cm2W5lHfLJmAAAldSwybUYdLWcnJgft4tBtvzUKm0PAIZBKQ856kSbIPAtEeq+gtMAN1iNLnpmPRa5AluX/dXmFejDoenyK0GigEslXc1P4IYF0O1fHFeV8kR6Qtt5NNxUlrKwePXGL2+4rQBCxM+UblZ1Cnnf/V/tC6RtByacFZ0XHBx8O53rWKw9ly8Rj5WVk5jn5aXmGw8/srul1pMnlJiFZQknfJhAxA7oweAwkqGdMNglKs7E9PSvugXmwkt6TfKElyAETubaJ9YCec3vt3CO39AKW0xkUB2YcNzCbZ4YF/eWSr33njWSL4eqKb9C87AvhRw3VcMXr/SSt7NJWOIDA76KG9tXtB+nPLSlixYj8paGuIfpUwmJmA/lrwGI+flvM/D2UWTUcHnh8PBsRH6SouOKVqZwO8X0maYo+l18pFDTYhDGw51kyVVjESq/AvQlTkN73WJKpFL2kcNfwTDQHmqhnUnsHkHqR2ZPLJG8BpfWytiMUR5C9FBj4oKPZPm7bJCOvEYSHxuh1yzMwExLHHYha0jVU1x3M4/X3ZbAxm7ZWNW49Okm6nXLjQ5gGW9H/rYZisBzjGJGWfY7K0GsCa+/ovklgtbq8RuvmUuhgD0/hCQTX47LnXOgyDfJvxWm1Kc1fwy/gQOFYsSUyLGG1xDQU/ODATIUlSqdBuJNfJXzeE9WHNNiptPTzE6OJK6/vz7w/EwcyLWFf28QRPTe5ZBhpFGiu9Kwt6Rxz2OC6AhUTs2VZ6mytSeYfwsTmaTE/ZSYxfmCgHhH34SVq9+vmjycwQONoyoeiAt8MkJ5g/7KQE4KLjBjGuA8+iStUYjNXKgIOkhg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: unyBE/ocGHQYk5gEq8aunVq0M/BvCfNmbbbc6Fw2oLXmv7ocWgKCx9BrEzYX5VxgtDCMMWtb7r65N2eEJtQYFd5WgIExpuhSvflp7f/S8flGNer64WkOlqOgS9KIcELnblIbM5CWny/G7j+dVmL2JgJQxqnRRRavh9K7/BlXvtRbH29KB1cKRKtLVmzOse9cta4H70xhpwI5t4Rd5p1NDgU1sYnosNfsSWB9qcGMeItzcQg/X6M7j8l/RXG+SwLQWFOjIN20LcB2I4Ktos2FQrs3uWx2WTqsTNuPOz5H5nt38nbLTnMvraWSX/UBlE4yVns9JdJ+PQbZK8dHEKc6Arnk7wSMW9nHgUzL63UzVuamT373GAF4kROBlW28zwcPsOZX85YjfA2cs52qFSQroedeg+CeKm/RYZaI7DJcECmzW4Z8uvgdIWB8Tk6cV2vn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 07:06:34.1996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 947eb9de-1094-4bb2-f831-08de7697e847
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4486
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3C1651C0D0D
X-Rspamd-Action: no action

Applied to drm-misc-fixes

On 2/27/26 10:47, Mario Limonciello wrote:
> The title is 9/9, but I didn't get copied on 0 through 8.  Was that 
> just a mistake when you made the patch you sent out one patch instead 
> of 9?
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
