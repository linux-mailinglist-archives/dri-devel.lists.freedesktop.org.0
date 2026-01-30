Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PytFWoefWlQQQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:11:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B4ABEBAD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 22:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B9210E938;
	Fri, 30 Jan 2026 21:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="knaNcI42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51710E938
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 21:11:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhCspUJ+KxLdB4vr9B4HZT1WVGzqIwQ71dPw+450XQXw8NUt4vz06JZldHotfZJMfSQpFEMnt9Jg7h5mCsS03qrk0hWXAW2ZR9bLzW9rocgQgBqDurSCZQZ1NQtVH/66M0RytVxnaM3J1ozNWDjxLXJE0f8/5i0SuK375nnx05LSx0xoZZWHRasD2FAsiSlgSH3/r7+wa3d8GOLCCFtPmhPs+MFpiWKx3z3PmobHWQE7A+ryr456tvOrhPiKlBUX0m6Is9sx2V/EvZJHu/ukSMM5bptiJSp9pAEPboKXZLwcx0bXZe3AnyigH1qtqSsggUfLEz861UKOpbm2KWFN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/ItcWY+gUrc3J5kBt87TjqgOHn+2ODPA9JLGz65TmU=;
 b=sJ/C3rfsknxNF3oI+FBAS3mHkjHqfrFcZMLDMvR7Y7yFU83Z3kIVrbTPSnfveDW92ach/AWUIDUsVi3RmMlpJiDZ+aRY3VZ3SuaT1CS5Ta625KBKgQz2eLLRosYakPQw9/MmPAWTsDJenQDc6J9lolWFKqe4Lz57y8zXwDA82E5AM7GGo9b7HGEFjuNPQ2AoDa+BLRofAzCX89XCYk5mjDRzMivylXOvP2NPR0RE3QilMGnH6IqvvbG+ntpDAkafKtPyLBXEZabg9ssXo43aw6X7O3S7UOBZo0eLNoA5CEMbgkVRaQClbbu/U+fhZRE/z8lvSg4v6ZHoLEjIXDqEiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/ItcWY+gUrc3J5kBt87TjqgOHn+2ODPA9JLGz65TmU=;
 b=knaNcI42Q2T9TS+Ea/HUBU1pcoLC9M5zTny30UhfGCdzFFv6ZJ6fIXF/2HxQo41V41J+kruWy0pU27VK17y6anW/v9jp4MDAZeMVPYESl9apd1mKDgZFmSawiiEvh0wPA2lx13mpapLViQzB/YngazDPy/2Cd+ah6I/dPvKSdOw=
Received: from SN7PR04CA0174.namprd04.prod.outlook.com (2603:10b6:806:125::29)
 by MN0PR12MB5956.namprd12.prod.outlook.com (2603:10b6:208:37f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 21:10:58 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:125::4) by SN7PR04CA0174.outlook.office365.com
 (2603:10b6:806:125::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 21:10:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 21:10:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 30 Jan
 2026 15:10:57 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 30 Jan 2026 15:10:56 -0600
Message-ID: <802e4adb-df13-ef29-1314-9d58fe192dd1@amd.com>
Date: Fri, 30 Jan 2026 13:10:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Stop job scheduling across
 aie2_release_resource()
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260130003255.2083255-1-lizhi.hou@amd.com>
 <9eef4eb7-3fcc-411b-ba80-838926006e9d@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <9eef4eb7-3fcc-411b-ba80-838926006e9d@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|MN0PR12MB5956:EE_
X-MS-Office365-Filtering-Correlation-Id: fadeffcc-d8c8-4f83-ba32-08de60441007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk9tQ2RHT2xabk1sbEVFQUtuZkZzTkpsTStNamdWc3gyMFliUm83RzVZK1Bp?=
 =?utf-8?B?WC9XdHlXeGwxd0t5Rnh0TktHYVlQY3g3NGNDYVNiMXNtbW8rcUFUQzBwbVY4?=
 =?utf-8?B?Q1UrbXVINll2elliRkNrZWUyTmwvUkgzbnN5a21vN1lLZ2dtVHZTWVo0clor?=
 =?utf-8?B?UGFVQUcxa2N2ZGxBeXdUa2JNam9yY0NRK3E2dnhmMFpTZ29oSDIyR0N2MGtm?=
 =?utf-8?B?QU85RFA2VkkySk1SOXJHZUI5QkVKaEVLM28zWWhTNTlaK1JTVXN5Q1cwd0hl?=
 =?utf-8?B?K3F1dmVIZ3hJeUNLd2tEbFBKR1BzZlN6aVhsR1FHUkkvTk14NEw2Wmd3MTJV?=
 =?utf-8?B?cmtBM1JxWXdlY3M0QlVzSjJpUmk5ZEsxaWIvMzAvMlRweXpZQ3VMWnhzOGNI?=
 =?utf-8?B?Y2dMcnU1Y2JGVml5VVI2WDUxWk1lb2ZKdGZDaGtWdUZCUlB2QTNoUlNuV3M0?=
 =?utf-8?B?TlVlVHNiby9qS2RBcElhanhpZE80S0szOFg2NWdJUXNPQmhQamdSVTRYWmk5?=
 =?utf-8?B?b0NPdHA0M2NWTnYrMmg4eG1HbXpnQzR0TENMOXlpWTk3a2Q2S29paGp0RVZ4?=
 =?utf-8?B?N1d2UWpHSXNldWVjeW43cEJhTTROUmNYTlBwRWFqSy9Gcm5uR1hlSVR3b3J2?=
 =?utf-8?B?V01ldk9YOTRDWTljRjdLT3Z4MlNGcjZPN1ppbDA1MlhMMURkK0o1cUUvc0Ft?=
 =?utf-8?B?K3FTRU5oUkxSWCtRNGxpelVYbVV2aDR1V0lQbFAvaXNCWG1PRU4vUWI2T0x1?=
 =?utf-8?B?MnJzb2d0WG9XeDkwY05MbXpXNGc1U0ZmODNIZFhRQmRMMkxmQmRvRWJ0SkVC?=
 =?utf-8?B?MDdEek1tbzNQL3FYQWJhY3ZreDJhcTg2UXYzdW1DdThwbFpLVSsxRVNrQzBM?=
 =?utf-8?B?ZDViQ0tVb3RjM0ZTTVRvaVZuTTYzMm01Y3oyK1FNYi9HWEdLNWxQQ040UWNs?=
 =?utf-8?B?UXVYejBUdnJkWW5takYzV01FYUdWZ3VjalkvOE9nWDQ3UzEwVThUQ2toc2pI?=
 =?utf-8?B?VFhheEM5Q0oyT1JEUi9TMFZlTjlBeUJkbzQ5TS8wUmxYWGNwcDJUQVNtclRi?=
 =?utf-8?B?NEgveStsTU1McnplMTd3d0lwYWdTbU5Ic2xtTG1lc1BqVWltZk9uSURkNXJX?=
 =?utf-8?B?akNiNmYrTVNyR1J2Vi9lMExoWkh1UnoyTXlYeHk3S2FPajJadVBROStodVlU?=
 =?utf-8?B?N21BQTNOKzhTcldsME1QM3A0UGtZYWk5cFRQSWd0Zk5GZkwyUCtIdm5nMVo3?=
 =?utf-8?B?RjhiK2hlN3U5dUx6amlzQ3M2bDE5RHprc3gzeDM2NVZSckJOUFhZd2I4d3Fk?=
 =?utf-8?B?ZEgvMnBIUnV2RUsyTHI2dW9mUEptOXBpQlBZVU1ZU1FwcTd1U2ltWVZtYnVi?=
 =?utf-8?B?UktZNHdDREt6K21ORDVFT3h4YWQvMzBJdjBqNFFnK1lramtadzl5dWY5a2RP?=
 =?utf-8?B?ZHhNS3oyc0FGMnRpRUVMLzRyWmlLMytQOUlQbE9hOUduVmhCZE9XSndRVXY5?=
 =?utf-8?B?VmNyNytsVm55Ymp0QkFGcmlabEdjUFN6cXYyY3ZjNzFLV1dzakVuUDBVNWFO?=
 =?utf-8?B?dDVMSWIwSG1JVHBiRVFwT1FWVlFhcFdGZ1FpY0Zmd0MwK1RZQWYyUjVzQzdY?=
 =?utf-8?B?ZDljNGpTV3hiZ1BkTXRlWU1UR0hHQkU5QUI4ZEZNd1NxWkEvWDZsenZYYTNr?=
 =?utf-8?B?anhxUDRPSnpZMVNQeVJYNFE5WmlId2VJZmd3bWdxU0trYVlFdDhqanJUTmRr?=
 =?utf-8?B?UG5hU0UraVFEMGl6dGtDU0pHU281UFRhcXM0aEFzQUpJSnJab2dDU2VuYTlX?=
 =?utf-8?B?d2xaTVh1Q2RtL2tNT2FTT3VRelV1WWJFV28wdFJvdjJVck9QV0JBNUxEVmto?=
 =?utf-8?B?S2lNSGF0ZU9zblNUbHBDMDVvUVErVmRHWnp4SllHZHg1d1ZCSVN5QjVjc0Nv?=
 =?utf-8?B?MmZmQXRHTGJIRXNIcmdBcUNSNXh5My9sSkNhK1BUR1pRZHZnT0RIT29MSFQx?=
 =?utf-8?B?T1NHemNEUWdTeGtZL1VtVEtKcDhoYit1QWp1UTFUbjRBb0ZrK1FxNEV1ZUVK?=
 =?utf-8?B?bHl1Y0RTWU9vYjRUQVdKdFliN3VHQ09ialBJUUdBU0RCUTdTM0tPKzBQREFG?=
 =?utf-8?B?ekVINEZtMHJ4S0RJd3F4RmJiaE9Mai80a21rTmpOV1hHWGhDRkRoMmNScXJT?=
 =?utf-8?B?cStPWVdTRi8zVmJyd2kxdFZ4OUVDRXlUMmVkNFlPRktOT2xvUEpCZlV3WHM4?=
 =?utf-8?B?SE5hc1h2cVI4dEplRDBEZFA2VUhRPT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6l8aI8O1UwHq4meujHTNAqxBiXcDicL+z5xzdUvlryC60UcxrLQGr8StMSDJeN6ZVPUdULJJJdMKNfIKVQiX1pkXQr/gqs7+WYqk22loH79ysWl+MJu3/uvpZ8kfLLIvcbQNg2b7FIqVyw9HS3nd/Q7XBWVqaCMilngWYSF7mKto8ryzghJ2YE4uy6QKkBj195zdBmlOsxo6HxZo34DSiQ336CQdPffVvP/A5RxgDWy+9vsDjmpQVAjV9iBZVMH03e1ESaqhYKihRJbESD6+ZgYN49E/0umNi1ogspwe4lBIilrgYftEKMh6AEN7fkTuquZKb55tAfXWkW+oeFtTDpGj/8hgKYUvQnzp4CuPail++acz0sYomw0aun2F/zGXoH2YW3Cpz3X7ACPpj9uCEGB0hewvAEyP7yqYQCnciJxeMoRTPM5JqER0TDFk8cxf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 21:10:57.5535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fadeffcc-d8c8-4f83-ba32-08de60441007
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5956
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
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
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
X-Rspamd-Queue-Id: C1B4ABEBAD
X-Rspamd-Action: no action

Applied to drm-misc-next-fixes

On 1/30/26 11:24, Mario Limonciello wrote:
> On 1/29/26 6:32 PM, Lizhi Hou wrote:
>> Running jobs on a hardware context while it is in the process of
>> releasing resources can lead to use-after-free and crashes.
>>
>> Fix this by stopping job scheduling before calling
>> aie2_release_resource() and restarting it after the release completes.
>> Additionally, aie2_sched_job_run() now checks whether the hardware
>> context is still active.
>>
>> Fixes: 4fd6ca90fc7f ("accel/amdxdna: Refactor hardware context 
>> destroy routine")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index 5511ab2ef242..c4a58c00e442 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -315,6 +315,9 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>>       struct dma_fence *fence;
>>       int ret;
>>   +    if (hwctx->status != HWCTX_STAT_READY)
>> +        return NULL;
>> +
>>       if (!mmget_not_zero(job->mm))
>>           return ERR_PTR(-ESRCH);
>>   @@ -705,7 +708,10 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>>       aie2_hwctx_wait_for_idle(hwctx);
>>         /* Request fw to destroy hwctx and cancel the rest pending 
>> requests */
>> +    drm_sched_stop(&hwctx->priv->sched, NULL);
>>       aie2_release_resource(hwctx);
>> +    hwctx->status = HWCTX_STAT_STOP;
>> +    drm_sched_start(&hwctx->priv->sched, 0);
>>         mutex_unlock(&xdna->dev_lock);
>>       drm_sched_entity_destroy(&hwctx->priv->entity);
>
