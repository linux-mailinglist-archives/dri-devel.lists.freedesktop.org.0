Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ArdFmuRqGkLvwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:09:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC36B207710
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0012010EA9A;
	Wed,  4 Mar 2026 20:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v5TSBJ36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012065.outbound.protection.outlook.com [52.101.53.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6844A10EA9A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 20:09:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yI0r8ZxZL1cyj/BIwdqU/gN1UrPR+0qqBDZotgeck7srGN0MeVKtAxNeEHeukoEP6gJoxd1H7a0cD7vUYFxM1AdV9iQKOLBBucPHz9m6fuJb+gFMS0A+wCKGsLQqzKtub6gWI5xmZch3Pqzty+0DhsEOHpnmfd4+7VXgJBnAecdazZNqVI1VbGlYu1mHnbX4nynt16YmrxTyknIvj8HU0DlEU23Xj9+s4jTJMB19N+7RAgXz2CNaCsegAuNNc85k4VcBI5jUZiR/UDiV/Rtrvx0PtbaME3LlmPh773r35jc4OFeDXOzCWBxKQsbQTgJv6hz0aFccsRnBdQxcDFzNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqDdghsxVlH5vCVJUbPPfnsZxKzUfyiR4BwIjbztgSQ=;
 b=obfJmCt70s5R0jOD0UG77X9s/fJIS25V+Xj8TxNRdrI+iSrHLlViSOeBqbaN0fxapMyD09H0y/WFAo1yGGRtEsx3c31NSSWKPSs3Cb8hl1y0Kx5d0eZXRezlCYMd5OPWZNFgjOyJDAF13YjHHHGID6PWlwLZh9ILA8Xd5JdfHicBj+MifOcpZUcKLz/kU3k90wb7jc46JzE74MvGJ1UMoG6IY3aBYgwpveIsAdrDtd2EZ8q03S+F4K1FoTR/fM+XwtwJgsQh9djEDpn2vRTs/1u1Vs8CmStQzNgegJ7RgvjD+XSloFHgbwQ86vjIy7ArHCKf0SgLWgopI2+z6VNQow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqDdghsxVlH5vCVJUbPPfnsZxKzUfyiR4BwIjbztgSQ=;
 b=v5TSBJ36vYsfZhCKxPOnwl0A6/0Y5+NVohR8KCjKaXAOBQF6M/S45bMOAm+330txodryNmHw71t4Vul76NULn/gi38aUxqLo1vHMyoMRovYuMl3Dk1RpFU86H8lziyQVgWBUz728ta6FonTBpocde5FGYx6NWnKZWrLv8cYAyAc=
Received: from MW4PR03CA0142.namprd03.prod.outlook.com (2603:10b6:303:8c::27)
 by PH7PR12MB7161.namprd12.prod.outlook.com (2603:10b6:510:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 4 Mar
 2026 20:09:06 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:8c:cafe::36) by MW4PR03CA0142.outlook.office365.com
 (2603:10b6:303:8c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Wed,
 4 Mar 2026 20:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 20:09:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Mar
 2026 14:09:03 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Mar
 2026 14:09:03 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 14:09:02 -0600
Message-ID: <9a8b3fef-3440-e316-8dfa-9d7b37fc38f2@amd.com>
Date: Wed, 4 Mar 2026 12:09:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix major version check on NPU1 platform
Content-Language: en-US
To: Mario Limonciello <superm1@kernel.org>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260304195012.3616908-1-lizhi.hou@amd.com>
 <7595019c-2652-43e8-8597-4fc19d0019c7@kernel.org>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <7595019c-2652-43e8-8597-4fc19d0019c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|PH7PR12MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7f7039-9514-48fb-0913-08de7a29e2d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: x7fGZ/cllcuTf3pISicTP9x/OFKLs6lvxwgYV+dyL4CyF5ZVDoQXlhFYOboPlMNFe2RcT2Ql0KDZRVjb/PhrJcSdTk3mC9VWT5a13Frl579tX3q+cluTpoy6VuoU+GYPd3R34FuIbWH2jdM7vvVcrPmml/Gi7iLr+/7V2X/6eaKNRelnFoJLPHg1/4VzWQsRSt96CglrCWM4R+mHkCpseK9hnmw/j788tqBHpLpy7lPndR7ll73NH55XUSKtfNZpOQP23sxoX6wZzXuXxOz76Nos2KdqH8N8Sa4t+BA7Kq0lUb5tbF+3n/y7itiwESet9oZ8yMjLd4YI06kWzuHDQ2hiD4n13UfJkXMuW9U5rHL3TxpqQgoenGbLhaHUykvVBix4hgpe4yahWCQKOnB6Eva9LJOdkhYU3pez7Bz7RY0iGs9Fe0bprTo/Tc/NA+M82NeMZqiLbA66PWzxHzn7zawg+R4HIG258KjTEXFlsTAk47os9fcJKyLd1rpqLHT/HUOmaS95yMCGNQKmXf927uxU+FoUPo+vjNf06zk9CCnVyA/OK6MOgiTqL/NqR3e/AjX/dD4Jx/gpFCEWSorMkkBiGp067J7zS+xKMGqQY/INFSRgn6ADO15HBgrj9a1PHfdwgiCUBszImoAHrde8UOy52yb0LysHw59EioXcU/eWOdKeeElkTZtqndqfkkPHgbRCovgnFZ7K26gyd90tRpgWYCRAn3g78CLWyZCMxuBRC/aHO8EJ6faDUvAGEy1rrI3stVuMH+i38EApKIInpw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8r1zETNKtgmBumPaE1EdB7pSJyg9i73uVLi12JqYU2aA715TCg5ZVwL+Z1ei+GtXPuVSugb2oXFcM3Tu8cqVe6W6WvRGD5is1INyyO0Q5HgmCNBsfDOknuE/KlXxjjIh1wX5xA5nfhsRjJlEeaTgvW9IbMMGwzMraNe2rqwjKZy6LO8OzYaXPcV3vje2pPyb4LcMecOX0QDAdlpGZtmsUNh4pywbsd/Ae6Cb9DMb056FNiDD5cNEIzrCu3vljfcNP/oIzRJcZGkchhxuOwsOnacst1rTRtxVou3dQsda2Cw+kIQg1XVaIrWBPlSHXbUUQ05RdDZ1JkO/+o2pw/0LEW+dpaVPW34QG0RynBgzdvHnnuzX7ISF1MvPnXXMaEU/ezE/rzG9Wbyf3TEK5mz/drAZkNGM3onNyujUyWsOgGMdwok4fsoOX7I1mopU5JRl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:09:05.0411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7f7039-9514-48fb-0913-08de7a29e2d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7161
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
X-Rspamd-Queue-Id: AC36B207710
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
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

On 3/4/26 11:54, Mario Limonciello wrote:
> On 3/4/26 1:50 PM, Lizhi Hou wrote:
>> Add the missing major number in npu1_fw_feature_table.
>>
>> Without the major version specified, the firmware feature check fails,
>> preventing new firmware commands from being enabled on the NPU1
>> platform.
>>
>> With the correct major version populated, the driver properly detects
>> firmware support and enables the new command.
>>
>> Fixes: f1eac46fe5f7 ("accel/amdxdna: Update firmware version check 
>> for latest firmware")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/accel/amdxdna/npu1_regs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/amdxdna/npu1_regs.c 
>> b/drivers/accel/amdxdna/npu1_regs.c
>> index 6e3d3ca69c04..1320e924e548 100644
>> --- a/drivers/accel/amdxdna/npu1_regs.c
>> +++ b/drivers/accel/amdxdna/npu1_regs.c
>> @@ -67,7 +67,7 @@ const struct dpm_clk_freq npu1_dpm_clk_table[] = {
>>     static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
>>       { .major = 5, .min_minor = 7 },
>> -    { .features = BIT_U64(AIE2_NPU_COMMAND), .min_minor = 8 },
>> +    { .features = BIT_U64(AIE2_NPU_COMMAND), .major = 5, .min_minor 
>> = 8 },
>>       { 0 }
>>   };
>
