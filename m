Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAqzJ+62g2kdtQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:15:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1584EECAED
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 22:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B73110E77A;
	Wed,  4 Feb 2026 21:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BS2h06CD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC6710E77A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 21:15:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpYq4UzzGdDF706X1jwrycTBoJxBmJw9C34qPPJ1SKY9yar112f2Vn79YfIef0xcz4YUt140dES6bY/uU9/6bOJyqqQsCa15lCRK8dW1IC4lrMcPnzQTBN6QGuj/PX4UOuAQiJbaRfgI6AshcgmpDZAwRyQXS1qlrxQfozsezA1zzBK9kGWB3HKpHgKMkDANYd5ezD3IFqSt59zOln0yOj1VYsuNnq6cZCPl4qPghAS27QtahB8aTUGO1wiPUkCuMs4VxNgkk4YinL2YR/Wcfyer1MLFIIwXLMiS6CaFAdadzn3qR+/Pz5B3tnPZpAy8aUGwNgrsAIJoIuVD0X25Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDsFkTrtqEGF30yabXP4SlzSGOMA1FdT5FiCp1FPaPU=;
 b=WLgkrEnSQBJR8nWCWzt1TFkngAaVu+bOJhpzVpx7zL848on/f1gkh23xtr8lBhGMKQFxdh8eH1Fi7kw91xhuJ3U67ScCtqlY5QJOdIduhAq9+EiTA75dHLOo7TW6EBuVNyH/Bmzo+hMGpSuGfeDMlljpu3VWqK0axuzJHFjIhQVcJAffhD1HMFv6jF0pSgrMT+0/bm2QiYf6JbLEEy1CVH1Cp3o8gECIrMFr1n6jUybAIXHlDLtVV9bQLvDj3VT5jpPyh0hWF5hGr/OUmz+YLTnyNuk6s7H3hs+c7S4k7wUWoLfq67yzZnTgYNTTQK0fCUIE2Ows7lJbTLf89jNO1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDsFkTrtqEGF30yabXP4SlzSGOMA1FdT5FiCp1FPaPU=;
 b=BS2h06CDHDRtUIoNrRTYfBQSoxL9pBXwRTG4kQWxKR4RuXSC0wqtitEbr6SoniEZTAvwuNd5TuK6b0/2P+nGInCrUe+7/uJi4JLFU1EwVyxm0/Pk3LVBnbxeqhI15GNwUMsBjoXbtA3Utqiyn7umuA9+4ORIjAbJf4uzWUJyPKo=
Received: from PH7P220CA0067.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::9)
 by DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 21:15:14 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::d1) by PH7P220CA0067.outlook.office365.com
 (2603:10b6:510:32c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 21:15:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 21:15:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 15:15:11 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 15:15:11 -0600
Message-ID: <815ff6c8-c0a2-fe72-e159-2ff5f6124730@amd.com>
Date: Wed, 4 Feb 2026 13:15:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Move RPM resume into job run function
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, <ogabbay@kernel.org>,
 <quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <maciej.falkowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>
References: <20260204171118.3165607-1-lizhi.hou@amd.com>
 <49984935-fcf5-4b69-bef4-d514ef67366b@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <49984935-fcf5-4b69-bef4-d514ef67366b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 8114b20d-c4b0-41aa-27a5-08de64327c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVI0ZERoeXFTK04xZm9MM0hYT2dXOVRxMjFpaHhhWTB2d2p2VGMyVWFtSjdG?=
 =?utf-8?B?bmwweWJubnQzZUt5d1IrdCtGRGpRZ25wbG5RUDhjcWQxRFkwTlJvOE9xYkJ2?=
 =?utf-8?B?b2pjQ2I5OVpJK1JQTjltVWpvbThNK1hrNXVJeVp1MHQ3WlJhTndXODMxK2cx?=
 =?utf-8?B?d0ovYnoreExLV3NlSGV6aVNGYmZGdUVRV0hUR0VzWDRaMDBqOVZSZFpDdnli?=
 =?utf-8?B?WVpaSGJhN1FBRGUzeUJzdmIvZXZ5SzRHZGtjZjNHOVZLNEdDTzBybndXeTdQ?=
 =?utf-8?B?Z2ZOTkp2TnRmTHp4eFRubVgyNVp1dnNkTU1wZGZJYjRIcWl4U2Jaa3FZQzNZ?=
 =?utf-8?B?azBwU09BVVdXdFNZazZSUmZhYytkcG15N3lDczlDdGY0cnMzVnU3S1VQWE5L?=
 =?utf-8?B?VnF5L3k4NkQrTWs4QTBTb2dJK3pPVTFxN1p2MHNtdzR0Kzd0d2ptUVg3VStx?=
 =?utf-8?B?YXBieHNJL3RqZWpCSVF0ZmZxVU1QUFRkMEkrUHc1QWlFenlSbDdON203cXZ3?=
 =?utf-8?B?MmdnVnNrTVlEV0pLNko0cTRyejByK3ZGUm1lSVFnOW5ZS3RzNnhLdkJGWWxm?=
 =?utf-8?B?WUZzUi93QUpVMVFoZHAwMk9zdTBKKzB5eWNWeUs1dzRJQW0yZ2ZHRWVqOTNX?=
 =?utf-8?B?ODBLUmhqK3VGWHRpZlEydC93NzJTaTRyK245OHNuYmpjZ09uOWFtbG0rVThv?=
 =?utf-8?B?R0ZMaWFucS9NeFdzUVNja0xLRTdGdkhpMzR3K04vYytLQ280cWNaRkFtSjVJ?=
 =?utf-8?B?b0RxZUlqNUNraUhNZzlkNTYzWVRjdzFrUHJ3YzBLYW1mWWk4RkM4TXRud3ZW?=
 =?utf-8?B?Q0gyd0pCZXVieDVGRGUxcmlIbWVIeElscUhYSktvaGZOZDcxcStnUWdQTVpL?=
 =?utf-8?B?VldORnU1ZEJFUjR2N2Y5Y2kza2pUa2lkdUlOZlkwdmFiSmVxeVJMd3Iyc0Vi?=
 =?utf-8?B?aW9WQjhHK2hoVnRqNjByZjMvWmxzbzdqQVhWK1U0TVRXcTFkdmEwd29RZGVs?=
 =?utf-8?B?dmZTQlpVenVoODlQNm5TR3pTUng3VWs0UTVLTGJoUERnaXlrYjJyQmlMMmN6?=
 =?utf-8?B?MDVmVW0xdjVEWkhDckR5VElOR2FrL0pMM3FtdEx0MzNRK2VVQUFuUVhRM0Ny?=
 =?utf-8?B?WHRKMHI5bTNsNG1nZE4vaWpQZndHcGtGYWxpT3BNb0NPd0s0cU1aNWdoR3Yx?=
 =?utf-8?B?UGRBLy90WXJGWVdaT0hqRVdsUnhnbDc5TERWVG56ajNpNTF6ZEE3VHV0ZlF0?=
 =?utf-8?B?dkdnbmxnU3pRaTNkSnJHbzlid2NOSG1ZVG9sRmdNS01yWVFidjNZMnlsN1ho?=
 =?utf-8?B?Y0J1RGJ6UjUza2VkS0tjQXVITmZmV25VZjVsMUF4amN2dU5ENmpwUzJ2VHk0?=
 =?utf-8?B?aEVnZzEyNnBra2JtK0x2c2pYOFB4T1RTUEhlRmZoWFc2RVBENS9nbnNmTEtR?=
 =?utf-8?B?WXkrUHBYR0VBbEpmVGlBaTRIREJQQ3NkRUk4bm51Z09jekQxV1ZxTUJRZm5K?=
 =?utf-8?B?OFdNdnowY2tGSXM1RXJoTjlzc3c5LzdXOUthZGx6VDBNc3dHTC9wYm91dEpH?=
 =?utf-8?B?L2NPQU9Jd3R3SC83aFJodmFlbXRLbWpSbEdIRzdQbGM1VldwcnR0ZTN3c2Iv?=
 =?utf-8?B?YUxIUmNreXV0ZWdncmYrVVpzTmQ5d1JlTTJodG1vUFNHY2E2SHdCT2luUlZP?=
 =?utf-8?B?b29pTk1zSGhYKzJ6bXJQQkFkcG4vaUZNbWRUSUkrVUhvMkhPQkdzZU41eE5J?=
 =?utf-8?B?ZVQ4b0dvSzg4WncvQTJyK0VOUDRrSmZWelVxQ0tpZWxwVENEV2d1eVdjYVha?=
 =?utf-8?B?Y1o3THV4ODV4SU42UmxsUTh4NytYUlNydkhaWkNNeXVkZVFsM3ppOFpEV2o1?=
 =?utf-8?B?cDJmbHFZU3VFRHh4Qy9zQVFvY2NMQUFZMGc5Z0szaUhGU3JQY3M3UUlrb05U?=
 =?utf-8?B?SnVabStoNFhLTk83bEpXZ01EWXByR3BnUEZGNVVBUmF3dkw3bk9PbUdlbWt1?=
 =?utf-8?B?Y0lHLzJRUmdTYmdJQytwdUZhZWRqLzE5aTJRa0NDMzVJQmNjNEdtMHV4SHdr?=
 =?utf-8?B?VDRycHhQaklVSHkzNFZISERIMzBmbjNwSU1lZFFxcW10SnBVaSt3NDU3a3hh?=
 =?utf-8?B?YjIwUTkxdHRSK2JBZXpya1hwZVZVbmkwckxZRnVuVnJSdS8yYzVvYzdZMXhL?=
 =?utf-8?B?dVBBL2h2VUpYcnN6NGpsV08zUTgwNlo1cXdybDUxRXM4b25VU1hBclFzaVJ6?=
 =?utf-8?B?ZzRTaW9GVFFYY0pocGdubHNaWHh3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IcVGRp/X193f18XYzJTRLberzlCybBIAdRpJ9JDT/zE62SQBo6eei7PCjVutck4FmtQvcEDns1gEH58kn4Yn4UmQwyZjRWuhHsDW4ujYMdEcPJKvwJSjGQq1zbNHitx51f+VyDvv+2Nxcs/OxNwBEjz0xaMNp9u3EUTnTALlP8QaGhFLh26JkgsY/fyOFcekH90mubiXffFGXuYORIEjRrM7BN7Z1jcx2nCiPfysYoPiyv7+JRgQ9yCb1PhTSak51oQ7PWg2dPVFqqneYuefMrfAT4tRRBOexmLLdek1A5ldZ92uJnH4lG0CebvHHGte2cb5aTofuoinMOKFfIX8BOjSv5x6UpDmAdddoCOxJBvrd0z6i48g1n4z4kJtOdU7lTrXvMX4dPuJl+P2Im+Srqfg/SyImWRDSPIZ48HuVH6ORC0FpDzxn++Q9WzsOsBw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 21:15:13.3502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8114b20d-c4b0-41aa-27a5-08de64327c93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900
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
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1584EECAED
X-Rspamd-Action: no action

Applied to drm-misc-next-fixes

On 2/4/26 10:07, Mario Limonciello wrote:
> On 2/4/26 11:11 AM, Lizhi Hou wrote:
>> Currently, amdxdna_pm_resume_get() is called during job creation, and
>> amdxdna_pm_suspend_put() is called when the hardware notifies job
>> completion. If a job is canceled before it is run, no hardware
>> completion notification is generated, resulting in an unbalanced
>> runtime PM resume/suspend pair.
>>
>> Fix this by moving amdxdna_pm_resume_get() to the job run path, ensuring
>> runtime PM is only resumed for jobs that are actually executed.
>>
>> Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   drivers/accel/amdxdna/aie2_ctx.c | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c 
>> b/drivers/accel/amdxdna/aie2_ctx.c
>> index fe8f9783a73c..37d05f2e986f 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -306,6 +306,10 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>>       kref_get(&job->refcnt);
>>       fence = dma_fence_get(job->fence);
>>   +    ret = amdxdna_pm_resume_get(hwctx->client->xdna);
>> +    if (ret)
>> +        goto out;
>> +
>>       if (job->drv_cmd) {
>>           switch (job->drv_cmd->opcode) {
>>           case SYNC_DEBUG_BO:
>> @@ -332,6 +336,7 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>>     out:
>>       if (ret) {
>> +        amdxdna_pm_suspend_put(hwctx->client->xdna);
>>           dma_fence_put(job->fence);
>>           aie2_job_put(job);
>>           mmput(job->mm);
>> @@ -988,15 +993,11 @@ int aie2_cmd_submit(struct amdxdna_hwctx 
>> *hwctx, struct amdxdna_sched_job *job,
>>           goto free_chain;
>>       }
>>   -    ret = amdxdna_pm_resume_get(xdna);
>> -    if (ret)
>> -        goto cleanup_job;
>> -
>>   retry:
>>       ret = drm_gem_lock_reservations(job->bos, job->bo_cnt, 
>> &acquire_ctx);
>>       if (ret) {
>>           XDNA_WARN(xdna, "Failed to lock BOs, ret %d", ret);
>> -        goto suspend_put;
>> +        goto cleanup_job;
>>       }
>>         for (i = 0; i < job->bo_cnt; i++) {
>> @@ -1004,7 +1005,7 @@ int aie2_cmd_submit(struct amdxdna_hwctx 
>> *hwctx, struct amdxdna_sched_job *job,
>>           if (ret) {
>>               XDNA_WARN(xdna, "Failed to reserve fences %d", ret);
>>               drm_gem_unlock_reservations(job->bos, job->bo_cnt, 
>> &acquire_ctx);
>> -            goto suspend_put;
>> +            goto cleanup_job;
>>           }
>>       }
>>   @@ -1019,12 +1020,12 @@ int aie2_cmd_submit(struct amdxdna_hwctx 
>> *hwctx, struct amdxdna_sched_job *job,
>> msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>>               } else if (time_after(jiffies, timeout)) {
>>                   ret = -ETIME;
>> -                goto suspend_put;
>> +                goto cleanup_job;
>>               }
>>                 ret = aie2_populate_range(abo);
>>               if (ret)
>> -                goto suspend_put;
>> +                goto cleanup_job;
>>               goto retry;
>>           }
>>       }
>> @@ -1050,8 +1051,6 @@ int aie2_cmd_submit(struct amdxdna_hwctx 
>> *hwctx, struct amdxdna_sched_job *job,
>>         return 0;
>>   -suspend_put:
>> -    amdxdna_pm_suspend_put(xdna);
>>   cleanup_job:
>>       drm_sched_job_cleanup(&job->base);
>>   free_chain:
>
