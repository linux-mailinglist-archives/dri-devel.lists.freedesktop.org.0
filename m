Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAB4NrbqpWlLHwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:53:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC341DEFB4
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 20:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B41910E5B3;
	Mon,  2 Mar 2026 19:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FFi+SbWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011023.outbound.protection.outlook.com [40.107.208.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74AC10E5B3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 19:53:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXbgKeY2Hp1unwDxkQgKAuSR5uvpEtAYMfssfdE1H7wH+I6cEjZt45N95wUgR/WimbxFbqD0+9VZqs4gAk6Y08IoG4VqDGaeOTZXOvlFxLL/JRWGS0ufxboM3RIUiDynndvPkRnqoJFUnofnWAbX2cMHAqaTEpvAMNYnZSWVj1CjqtdIktwycrvKHVBR8+6PxuloJ7NJ5cVM8szWegsNolSZZuSSq7YwDFtUBGhwB9TOD0qC3u4b0q+FoQD4m8ynoeqVvbnP9NhyTFnwO6Dbdhplbion089864ND7qepbh7dJ3qbEzD1SOGGbjcDpBm4UNOtdfku/jKgh95KXIMA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQGy06RP89awaQ30OvZwn8siSTTGClN1tA6k83UZ6ww=;
 b=rY1A7RLmKvSyddNBju50EJ4Z+c9vrIk0dLiHHXfLOL2YgTyl3YkiES/+35ZahtQeiBUerkuLl67Y3twbHY0UQ0mov0xSYTE8JYfcVuYzHdk84pOz0PQbG1gNc47mkAr8a3skLaosISHqKLbdiN0WaYAX0vlXfLswGzUNm8vhsmfACtMgFH7TH42UQMQpBbU1+0t98h8Y/Fk1ri5rfuzkTLdRBPbAxSK8iN76f3Ur0pSE/LN3yulCyJi9GmgPCanakBx1YKPrhFE23obLFRI2JkuMGPsD6WKUsITjEXiTypucDj/GsVswVEv6wJEMuEn4zinWv//wPUT07QdRPtZdVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQGy06RP89awaQ30OvZwn8siSTTGClN1tA6k83UZ6ww=;
 b=FFi+SbWS4/7a+m5jG+W6+IeXdX8k0x9eDMn87umX2L8/uLFGl3tmuip9sQ2JBLYx6W+xKRBquL3X1ed6XD2HNRM4AF1SH++WWU3WDn3b2tYqwx7sQWMFlRa0lul/DJ2e+N/YMn6uwEctw0v7BjLl5mJalJ3gt8AeaDuQdxI4fXY=
Received: from SJ0PR05CA0159.namprd05.prod.outlook.com (2603:10b6:a03:339::14)
 by SA1PR12MB6702.namprd12.prod.outlook.com (2603:10b6:806:252::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 19:53:19 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::a9) by SJ0PR05CA0159.outlook.office365.com
 (2603:10b6:a03:339::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 19:53:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 19:53:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Mar
 2026 13:53:18 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 2 Mar
 2026 13:53:18 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 2 Mar 2026 13:53:17 -0600
Message-ID: <ce429a79-745e-3df0-335a-34bfddbdd06a@amd.com>
Date: Mon, 2 Mar 2026 11:53:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix NULL pointer dereference of
 mgmt_chann
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260226213857.3068474-1-lizhi.hou@amd.com>
 <e666947b-30b7-444c-9400-966009373e8c@amd.com>
 <7806bdea-7ec4-23c2-aef9-6da395cc181d@amd.com>
 <6a429976-dd1d-4c87-a49f-163f876895fd@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <6a429976-dd1d-4c87-a49f-163f876895fd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|SA1PR12MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a769fab-73d6-4d8f-63da-08de789559ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: ORedPmtz8hxdrmWI0taYGuj9uyx4cWB523ojQIeAvwDK/xaJgErak+iRmTDVZQvvCc4Egct9F31X5JlxnrLpktWxYK3qSgthRWBjGj4ViSTzx1TOaHxqXsWz6IVAb5vTyUZt1VdX5OwPw0ZehrQRxhxhNBIiTFX4OU2MJgV0wGtJlf2d+BPtSel34EneZxvht3gmQxb1DAr5hVZe09nxbpo8KxAYJYB7kdv83Ttq+sIXN/QeKtbz1ZIEF66UferatgXBzasIgbPn3UEhWTQtcy+qK1PI3SkqrrcszRdsE35Jl3OypggWT6NRqsgGEAYgLSIHOenkxkeWt+oFTsZ5GzdLFg+QbUJffv7LdmDu+kAYwGdw58emufh1ihvSheiKZw4qA5gkY9oJ8nFF5oS30mc74kJKMAkQAEBgG5fLLcBUypz/UGkpMmmgfKQTIjH4VKBNmsXIsDTU+p9R32iDhRrGHV2CSc3X9T5QoHzOBWaQuAG0MruSL5yw7BuRToeJz38b27aqeWqAIW/6E5Em8GhrMOsrYprn4uNVSCkkEJf0aBswJFw/BJ6Hr70yq5S0Ykdmjy6Ma6S5oUtmqd7aCx77FBOQLsXgohSf2A4SvDvvoG35Q7T82WxHlT1m6tbheFkfrEjML/bMP+75fLYXfzlB3WirIfy0Z+2VGsYZoIVkBqw4yaHCzZDk3PI3N32CSU8zJ2v4PSZe7+q0CBlrEiZ5gdW1yi5llbCxTfJi59he8tzlZl2xWGmc7qjAe+eyqx7Ml0bHkLTTS7kOntuF+fQ3LTpUZcGAKDqk1GPOjANN9Ns15QxBUFYse4RTQ+g7
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vWUYdDX72pOfPML45V29Vh5M2oMRiR2GWYq1og1I4Ybl7N67QUQoYch8+jU/tyXdRC9ISw8lNUu4T0Tqnxxxuk32dAQxPb5RQGpq+D0G8dcbsHnEGETtC8WlndQsB8WnMGPcrBv5IR78dX9oZtE9PYFpylWVOCLYcrvcc6nmP/OlRByPjllv/YeM1B8JhDDDE3hvSYbiYaunhdQ0rG+6YsgZgt3H/yMUEp5j5TNyE52QC/zNd8nnHpr+ktCWHmSM6Idy6YkwN2XPtAEWPCzRXUX/9KNpKhv28/LPDxrn4CcW5AQcFE2mhpXQWrPNmm1m3z1WR3ViICsYzfgagOh7lzzV0ViOuEsZsy9GnaYxuLsUeLakV3XsgmAh3SyPoBteyO0XMS+agyKEwP2HxYL6B07OnqLMD68uIKrkP4ZAoOyuqCHjiPa6oqsRxogDzouY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:53:18.6675 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a769fab-73d6-4d8f-63da-08de789559ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702
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
X-Rspamd-Queue-Id: 5FC341DEFB4
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
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
X-Rspamd-Action: no action

Applied to drm-misc-fixes

On 3/2/26 08:57, Mario Limonciello wrote:
> On 2/27/26 9:16 PM, Lizhi Hou wrote:
>>
>> On 2/27/26 12:11, Mario Limonciello wrote:
>>> On 2/26/26 3:38 PM, Lizhi Hou wrote:
>>>> mgmt_chann may be set to NULL if the firmware returns an unexpected
>>>> error in aie2_send_mgmt_msg_wait(). This can later lead to a NULL
>>>> pointer dereference in aie2_hw_stop().
>>>>
>>>> Fix this by introducing a dedicated helper to destroy mgmt_chann
>>>> and by adding proper NULL checks before accessing it.
>>>>
>>>
>>> Is this actually going to fix it?  It sounds like a concurrency 
>>> problem, no?
>>
>> It is not concurrency issue. The code is protected by dev_lock. That 
>> is why I added
>>
>>        drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>
>> in my fix.
>>
>> This is actually error code path issue. Normally, 
>> xdna_send_msg_wait() will not time out. This only happens with broken 
>> firmware. That is why it was not found before.
>>
>> Lizhi
>
> Got it thanks.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>
>>>
>>> Do you want a mutex in the helper perhaps?
>>>
>>>> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>> ---
>>>>   drivers/accel/amdxdna/aie2_message.c | 21 ++++++++++++++++-----
>>>>   drivers/accel/amdxdna/aie2_pci.c     |  7 ++-----
>>>>   drivers/accel/amdxdna/aie2_pci.h     |  1 +
>>>>   3 files changed, 19 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/ 
>>>> amdxdna/aie2_message.c
>>>> index 277a27bce850..22e1a85a7ae0 100644
>>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>>> @@ -40,11 +40,8 @@ static int aie2_send_mgmt_msg_wait(struct 
>>>> amdxdna_dev_hdl *ndev,
>>>>           return -ENODEV;
>>>>         ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
>>>> -    if (ret == -ETIME) {
>>>> -        xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>>> -        xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>>>> -        ndev->mgmt_chann = NULL;
>>>> -    }
>>>> +    if (ret == -ETIME)
>>>> +        aie2_destroy_mgmt_chann(ndev);
>>>>         if (!ret && *hdl->status != AIE2_STATUS_SUCCESS) {
>>>>           XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
>>>> @@ -914,6 +911,20 @@ void aie2_msg_init(struct amdxdna_dev_hdl *ndev)
>>>>           ndev->exec_msg_ops = &legacy_exec_message_ops;
>>>>   }
>>>>   +void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev)
>>>> +{
>>>> +    struct amdxdna_dev *xdna = ndev->xdna;
>>>> +
>>>> +    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>>> +
>>>> +    if (!ndev->mgmt_chann)
>>>> +        return;
>>>> +
>>>> +    xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>>> +    xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>>>> +    ndev->mgmt_chann = NULL;
>>>> +}
>>>> +
>>>>   static inline struct amdxdna_gem_obj *
>>>>   aie2_cmdlist_get_cmd_buf(struct amdxdna_sched_job *job)
>>>>   {
>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>>> amdxdna/aie2_pci.c
>>>> index 85079b6fc5d9..977ce21eaf9f 100644
>>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>> @@ -330,9 +330,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>>>>         aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
>>>>       aie2_mgmt_fw_fini(ndev);
>>>> -    xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>>> -    xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>>>> -    ndev->mgmt_chann = NULL;
>>>> +    aie2_destroy_mgmt_chann(ndev);
>>>>       drmm_kfree(&xdna->ddev, ndev->mbox);
>>>>       ndev->mbox = NULL;
>>>>       aie2_psp_stop(ndev->psp_hdl);
>>>> @@ -441,8 +439,7 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>>>>       return 0;
>>>>     destroy_mgmt_chann:
>>>> -    xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>>> -    xdna_mailbox_destroy_channel(ndev->mgmt_chann);
>>>> +    aie2_destroy_mgmt_chann(ndev);
>>>>   stop_psp:
>>>>       aie2_psp_stop(ndev->psp_hdl);
>>>>   fini_smu:
>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>>> amdxdna/aie2_pci.h
>>>> index b20a3661078c..e72311c77996 100644
>>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>>> @@ -303,6 +303,7 @@ int aie2_get_array_async_error(struct 
>>>> amdxdna_dev_hdl *ndev,
>>>>     /* aie2_message.c */
>>>>   void aie2_msg_init(struct amdxdna_dev_hdl *ndev);
>>>> +void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev);
>>>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
>>>>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
>>>>   int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, 
>>>> u64 value);
>>>
>
