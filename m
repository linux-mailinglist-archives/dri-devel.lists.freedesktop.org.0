Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMFkBC9PgmmBSAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 20:40:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624CFDE31B
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 20:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4923010E769;
	Tue,  3 Feb 2026 19:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PuAP23C6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E883D10E761
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 19:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4ezSpjSLGapH2OFb0/VdF3/yHtSHMlehTMnS5oKRTnUw7CB3sr2O5Pc/rmP2eDNLVNnqvtyVtnDEhAAxM8NCWRK9k30qlSsEivDFIhgVK+mkZMouIiW68lrIpTkLuAU2095XDb2709tv0tPyNz5k4MLZilXNOGFRjqsO+jCB5/0q8QOz1nqU09s7e63EPPDJQ04bxnmyX9eKyblgwsIZFwogQjYhYF44G/9rVHKowCSSzNVUTwZtYw4OgzD++dj9h+guGOWhvLHMBdDrBSXV9g03jbrqN6JjgNidPaZLg2fH/HdLJkc14ZxmfrFiVHDEAs3m0mBRPNXsiwYyZcpCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksrK6xj2J+0CEz1vW+XZgs/l+8KEWckjs9y53+pelBs=;
 b=pcZgYHwlHA64CcHLCr0w1Fc1p3JQIAJMZ6EhlTrTg993DqQOT15ukbvanx2Cm1UVWq4+CFnq0oAq4vzRWIcE0hNGQNtYpX9lxpQc+ImbJ/mNA99p043+Pm5OdSyB7po7UcB8cTertl0IF/X1UvYDbYZBcah/F/ZPGOjBQVvZZPceHeDRCQDT73TXlYu0xf4/0emniYnT3S9CN0y14Lj0l97k6akfYVdUeeadqGfRCMiv7f6i1dCClCeSn9WLYmtSJNatXnlazEQic6hO7v/yK//vbpQ+qws5T75evdFelkfOkCm1pgs0hzXUcU/PfjyNbjAJaHQFJfArhDF/M59ZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksrK6xj2J+0CEz1vW+XZgs/l+8KEWckjs9y53+pelBs=;
 b=PuAP23C6P4VEMyYgefqshjPNC0aFtPCRTeBlT3nXVwNbSOKLjNvOXyo5uVrgcDpQBPm21sMa8QtNEJrwUFJkeql5I/Rq+qCRzumJDf0S74zHKacdCBh9LkjH11rTsWtSaR6Q4VjxrGN9KMAdSwaMjkBQCDCuBnxSjjzhyUzchiM=
Received: from PH7PR17CA0045.namprd17.prod.outlook.com (2603:10b6:510:323::10)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 19:40:19 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::3f) by PH7PR17CA0045.outlook.office365.com
 (2603:10b6:510:323::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 19:40:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 19:40:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 13:40:15 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 11:40:15 -0800
Message-ID: <1b5b3c24-239d-c177-6fae-bad46d382430@amd.com>
Date: Tue, 3 Feb 2026 11:40:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect error code returned for
 failed chain command
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20260203184037.2751889-1-lizhi.hou@amd.com>
 <7891a7c6-bcf2-4099-b91e-5f8c99ea31a5@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <7891a7c6-bcf2-4099-b91e-5f8c99ea31a5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|DM6PR12MB4404:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b2aad6-d68a-4b67-75fd-08de635c0ed1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUtxY25FdGwvMHZoTkVid3A2TjRTNFdOeEJGejNwNlk1d01XZDlKRzhEK3Rs?=
 =?utf-8?B?TjRVYWtDRnFSMTlST0g0UmhydmlaYWx1N3JSNlh4SmgvVjZFSHllc0NKSTJ5?=
 =?utf-8?B?WDhWV1JjaE1KeW9nbSs4YTA0NzF3ZVp4L1NMeVM5dkdjSWY0MVZNUFl6TkF0?=
 =?utf-8?B?NTc4anpkVlJ5U3NyN3BFR1BZOFdlM3FnTW1VMnM2dEpKK3hWam1mdkZiYkFZ?=
 =?utf-8?B?Vy9veE9iRWFsYmsvVmx6alhZaVZqVTY5WHV0ZVlHemxLNXdMQmd3MXJLSmRH?=
 =?utf-8?B?SUJibCtGTEtEL0crc2EvNS9SYmw3bkJlT05GTklrd0NIMndwMG5zQTZQQ2NP?=
 =?utf-8?B?QWt4UXhKcGFGSk5EbEtidG5FRUtrWFB1NVNVTGtSV3ZLK0lGQmhwVmZnbm1G?=
 =?utf-8?B?TXlXbHFvZUhPKzlrYlF4RFNQUVZienVsTGxOOWxvZFpPVDlyMS9PZFdtdFZG?=
 =?utf-8?B?OWNOREhFSzdLTXZLY2NhY1hDVlVQWDBtQTRzWEJwTGRjbHkxczJvK2lEaWVx?=
 =?utf-8?B?Wk53WVlKVGdZZnIySEVCckwvZnpKYzVSejAvbmZtZk1mV1l5TEZrcnNUck1G?=
 =?utf-8?B?K2Q1ajdiZWVHL1pQTHdXc0RuY1dWcUhXOXFFeXZvTUIzQzNuZW1IOENZOVp1?=
 =?utf-8?B?aTUyQjU5SnlkNVlmZFN1TTBKRjJPWXRJMjFXN2pXS1RVQ0l2bWVma01qVVJO?=
 =?utf-8?B?THJtTUpaUC91dWcxVzJkdG03cXlIdzVmOEJzNjFISlp6eWdwdFQ0UnJqTjVS?=
 =?utf-8?B?aGd6TCt3M3orQ3BzZVBqdllXdWFra1pXbmUvMzcyOVBTRlBjcWRUYlpKN0ta?=
 =?utf-8?B?VzFiUHcwcmp1QWVLR0EwQzlWYjhSTUhuc2txQjJVcXhIcFk4ZWtnazVpTXo2?=
 =?utf-8?B?NGNZMGdsWWZpTTBTbWQ0bjFWOEM2bU15bTBwUEVPb3NVb3ArNXpVM0hBTFBQ?=
 =?utf-8?B?dUZ4S0lDTTdxSE9HNDVORTRIVUJLbE1nczRTVkgvRlo2ZUxLTm1NbVM3QWxY?=
 =?utf-8?B?RHZPejlMQnVURExheVVCQktNaGNZNlZJWFBJK3QrY0dRWDUxSjk5TzVjVVBR?=
 =?utf-8?B?WDVadXN6elA1UTBVOTIwNTJoTmJ2dW9DSXhwclp0aXQvTTk0MkoxeUt2c0hj?=
 =?utf-8?B?Sk1scHJuWmJmdkpxTWY5QTNaak55UnhYS0o5dENNdUhmS3NOTEdGcWlUSTQr?=
 =?utf-8?B?dlJuRGZka1JHZVdrK3ZNTDQvMFJub2N3aWU2Z0JGclRJZjJMOXNpV1lNUWQ1?=
 =?utf-8?B?VXdhRU04ajdtWmwyc1lCY0EzZzlsY0VsdHhGZWtzMmxGN3NVZitBdUtkWFpq?=
 =?utf-8?B?SHpJY3VBQndTMGo1Y2YwVmNnYjFzeU9jckdpaElyZ2NDbnk2T1VJKy9Wa3dt?=
 =?utf-8?B?MitFck9UK1hVTG1Pa1ZMZ3l2bUo4SVpyZTRlUHZSQ09EL1ZLQkpVSTdia0Zw?=
 =?utf-8?B?UHFuNmZQYUYzcmI1Z29JZ3ZFb3ROa0p6QUt1QU8vK25tekVVLzN4ZTBNZXFV?=
 =?utf-8?B?Y3hONzN4SEF3QzRSemJsb3FxdUZoWm9meG1yT2twRk4rZC9oTmdPOVljcDcx?=
 =?utf-8?B?Zmo3OUVycWhueDk5VTVVZXcwOE45dUpzZHVUYityQWNOOEtJZnBMSzlOUEov?=
 =?utf-8?B?WmdxbzE4cWNXN2JqaGhnOTdNZ1lIK1FqMUdGWmpETU9sRFJQS1JlUzdhZzdY?=
 =?utf-8?B?KzVqSU9KNXFkc3ZGSjdYMDd1Yk9oaG53WEQ5bzRNc0NiRXJTcHhZZTk1RVBP?=
 =?utf-8?B?YkZUUkJuakFFVnRzb2NGdUFEcDJwWHU5cUR5bEhlTnZja3psUkRmZUlOS2J2?=
 =?utf-8?B?b0I3a3BJZzhCalBmZmkvQjhOWjlXMzd2cDlycDJmMXBpSkJQaXV3U3dGV21N?=
 =?utf-8?B?dGtJUFZCdm5aZDJHUWx2ZFBab0w5ZUREN2p6Rm1UQXdiNTlXTWNrUU1yMjMr?=
 =?utf-8?B?Vm5TWGxYVy9YMXN6aFpETUV2eGg1Rkw0dUlSLzVsVEtPcGtQWk9RWVU3RWNa?=
 =?utf-8?B?RndEbnpkWS9iNHg1cG9qMmxVMDJrNldIa3AvMnIzVlBxbXpjSW9hc01Jb1pT?=
 =?utf-8?B?OGNFS0lzY21mYjlhVUorcWs4M2F3UU1Dc0UvZmJpcjZjY09xMEVTdTlRNUxU?=
 =?utf-8?B?UlRlZkUzWlBJK2tFMTBDVHQwblVHbDN1WGZQcnJFQ2E0cmc5MDBQQ01zQjN5?=
 =?utf-8?B?Z282YVFweEJWVlNHejRFTnE5Nmd2QkVSbzdOYksrT05SZ0F3dEg5dHV5MUJl?=
 =?utf-8?B?eXRTb0YzbjZ2T1VnTDBkbXBzdUJnPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZRIx0gnCBRBXu822+InZ/szEC1bA2w7KnSkHM+1VOwCm8FFJe1gEu+r1VVPy0vjM7abIsQg9TXciqQvZ7htor35WOWDQ+267CT157hBcBLCnAZoECzZl64GpTPlz3iGo7Ybe9Z7dZ04YaUmr17FIGku40KQprcY7vy0tY+t26ETYZCuqDKzbgGVzLizzjBHb9EuHLPRS7tkXvBQaCEqqe4tQNE3hSu6rNR27KkIaAK8JqeHdKJXZwgAhsO5OO5IW6j7DeZ/AhtwTmnbLwTTco24WQzJlSMB0cC2CP3TYmm0NVVKC3HgoyqntZxSRDTqjGjaNvcZpjvlzE09J/O81LJLitTBKgy2+5qkTzanld+FOvTgbgiWW2dp0kk1KRtBaCu5eW+Ew/dmGiUfKxH2eM4jBxYwoCIyQm5HUzB2gPCITvpqA2dhGxRDc+OXGVELE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:40:16.9076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b2aad6-d68a-4b67-75fd-08de635c0ed1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
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
	FORGED_RECIPIENTS(0.00)[m:maciej.falkowski@linux.intel.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
X-Rspamd-Queue-Id: 624CFDE31B
X-Rspamd-Action: no action

Applied to drm-misc-next-fixes.

On 2/3/26 10:52, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 2/3/2026 7:40 PM, Lizhi Hou wrote:
>> The driver currently returns an incorrect error code when a chain 
>> command
>> fails. In this case, ERT_CMD_STATE_ERROR is expected to be reported for
>> failed chain commands.
>>
>> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index ad5b5cd0bc81..fe8f9783a73c 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -274,7 +274,7 @@ aie2_sched_cmdlist_resp_handler(void *handle, 
>> void __iomem *data, size_t size)
>>           ret = -EINVAL;
>>           goto out;
>>       }
>> -    amdxdna_cmd_set_state(cmd_abo, fail_cmd_status);
>> +    amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
>>         if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN) {
>>           struct amdxdna_cmd_chain *cc = 
>> amdxdna_cmd_get_payload(cmd_abo, NULL);
