Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D946B2779B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE1E10EBD8;
	Fri, 15 Aug 2025 04:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PA9uNDF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E5610EBD8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 04:03:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTe2+pU4RNxBgco7ZRdf/oLQbYLGChVcYhTuIS86GYMEsOWFvthWr/PzHRheMg1qwu87xX0UD8CH3Yu+2Ck+RvcYH7b0QzNBaSAkSWBfx3cKGaldClMUq6mz340I/WJgDLlJsOJT6uUDimKnvjMpavWq8eppZ8V80lbuS7ulYrpf372KkTsVZx6yhRSGR69aDXf5/xpqLVqWKj5zR1/1Z0bKQVWSzF0iMPhJEapw+j9/I6emqxT0oZCtyj0nZ3zUG0KmHTeF18b1qDNgy+MXIKgShOoYeVMs5i8viVca1bcMz8AgY2y4LXZO0mAliYD67bHqEshp45RFzojCR5gNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7b1+u7NH22lB72SZIS/004LoTRdT6a6oJ5dJExhxvo=;
 b=WqI/anNxaXe88SuvIH18xf5CLY+AVCJ0B6HjyQ1Ainhm5Z5VQhT6vHe+EBm5MeomUvFPUZl5+LM22FReakb2O5zL0wlTq+C2FRmcOl3W49OY+DVcnLYxEp1Ug5XPLbUjoUhW0Qy13OlCObf1CMYvq/YHp6fd4jRmFcKY+ySrMTg3vT4fvxXSpIFYwttAIqRiG7AHfi6EP6/c9YxBe8RWvdMxOBYbSl5tOpiXD/XKtViF20ycX5V7aH/m2j3MphpjBqo2L5GYwyL4YGYvArEPOmRAIGlwsL2VdlNF2B7B8CTJB4cUTpAL/YLGoUFmqPLK2HzG+MohOYtIGLfkkS0zrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7b1+u7NH22lB72SZIS/004LoTRdT6a6oJ5dJExhxvo=;
 b=PA9uNDF3PAUrJy+C8kGcfKH1P3THc88bn4JKPhld1YWOm8K34DOCgbqROUyGgCsVqNZJNLiHC6SGscDXVjQ3Z2N6sugKefJ8nnTbWy3G0fYbVMJzmkecaJ73JZVoGmGbjT4Tb2UMU2/5jkS9+DdKLcJoRmNs345il7yuU2IxEIk=
Received: from SJ0PR05CA0069.namprd05.prod.outlook.com (2603:10b6:a03:332::14)
 by IA1PR12MB7711.namprd12.prod.outlook.com (2603:10b6:208:421::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Fri, 15 Aug
 2025 04:03:43 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::9e) by SJ0PR05CA0069.outlook.office365.com
 (2603:10b6:a03:332::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.13 via Frontend Transport; Fri,
 15 Aug 2025 04:03:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:03:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:03:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:03:41 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Aug 2025 23:03:40 -0500
Message-ID: <be16a45b-286f-5ea8-7fa2-6a59930e1ac0@amd.com>
Date: Thu, 14 Aug 2025 21:03:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Add a function to walk hardware contexts
Content-Language: en-US
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, "quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
 "jacek.lawrynowicz@linux.intel.com" <jacek.lawrynowicz@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhen, Max"
 <Max.Zhen@amd.com>, "Santan, Sonal" <sonal.santan@amd.com>
References: <20250814202924.3335547-1-lizhi.hou@amd.com>
 <3a981eac-6036-4a77-aed1-61fcc6c9c2f5@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <3a981eac-6036-4a77-aed1-61fcc6c9c2f5@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|IA1PR12MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: b6912be8-f823-4f60-8045-08dddbb0b90f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjF1OXhmUktqZHI2QTFRcVV0eHdtT0YzUnk0VWhYQnMyZ3p5WTVsWW0xbmJX?=
 =?utf-8?B?N2ljN01aRVR1WHZhdkd5dURrUUtPZnl1aktaUlVPL3NpemRZbUpYNUJYcjYw?=
 =?utf-8?B?RG1VZDF0WUVLQnlKS0xlbWt2ZndtUnVYR2NGbU13M1pPVFc2RzJJWTJwV0lN?=
 =?utf-8?B?bGtVQ29hMGw0VEQ0QU5Vb2lxSVVIamVkb2IzOTAxSThuRG5nYXdIY25vcUNZ?=
 =?utf-8?B?YVNOWkVZeTVyaWpDMXBYYlBGLzhHTmVQYkpCSDNnS3FwSGw4V3JRVEthWU5h?=
 =?utf-8?B?OW1HSzV6bTc5SWJNMnBrblRGMHI3TWx4eG5tS3psa3dwRmc5ZzBYeEFUV2hY?=
 =?utf-8?B?RW5VOTJhZGZvN3hrV0dqdTRBNkZYZlM3cUd1RkhvalU5YWxseXdFRkx2NG13?=
 =?utf-8?B?UHRjNjZpMUI0dERmQUp5RnQzSDdhajhDUGxGYnFrSFNsRGJZdjhVMVg1Wlhj?=
 =?utf-8?B?cDJIU1VmNk82bXlqVHprbUVzbWMvcEZ2emhueHRHbURrNDgycmVjTU42eklx?=
 =?utf-8?B?RmI4dVJnTzNsN0pjak5BNW16N2ZCaWhlYTZhbUZ0Umo5M1czTGxzQ3Y5YVl1?=
 =?utf-8?B?QVFzZ0tRQVV6c2k3YTBSN2R3WStMWkdCK2NyMTc4T0NCeG5xUWo2VXl2eXhL?=
 =?utf-8?B?M0lSWU9sVjREanBpeDNZd0ZyNE9aNHIwUjZXd2hXQ0JEc1M3Sjd2eUZHUVRM?=
 =?utf-8?B?ZGhqRDlhUTZNNWZwcUVoOURZcUI0QnhxL1NLNXhXUlZhZGR6c1dGMkg5U2wr?=
 =?utf-8?B?WDVLZlhFUEMzSm5FQkFBalBqdm50UTZsU25lTDlhK0YwcmNOWFoyeUdMaGxv?=
 =?utf-8?B?eTJodXQwNTl6R055TmNZY1JCQXBEdmJLUFNmQ244cHpPN1NXdzAyNHZBSmFh?=
 =?utf-8?B?aVJPQW8xNDlsQ2NLR0c5cUJzMy94T0xlMzZ6NXZEZGNNNkhUeGVoV0NGMjFw?=
 =?utf-8?B?U21WSk5UczJKdkcvNWtuZldmcWdqem1ZMDZ0cWYvK1h1TmVmRjM5aUZkMGN3?=
 =?utf-8?B?aW9MZlZuQTZ0dWhjYzVuNXQyZWtWZ2FzaURnUUF3UThwZXB6TlJjNE5VRnR1?=
 =?utf-8?B?QjZOY2l1cnFkdVk0R2J3c0UybVBIKy95aHEvQlJrcjF1NEIxbWZNei9tMm1Q?=
 =?utf-8?B?MHo4TFNLQnBXMGxweGNzTWdTUm1UUjV2aWJtVHJ4RWNqQ01aUlFqNmFXYkFq?=
 =?utf-8?B?WXQ4OUc2Q3hoSEl6ZEVtWlRMOVdqT3djRkdPaFltcVd6NWNYZmpRT2x5V0dy?=
 =?utf-8?B?UDhWTVpyYW4zRUlyS0wvMTdWR2dMaHkyMjlUU2hsakRPQklLeUc4RVRnNUtj?=
 =?utf-8?B?a09MNDYxZmU4THNKc0p1eHV5OGRwK1FkYUJQcGFBUWl5bU04T3pNaHIySUl0?=
 =?utf-8?B?SitOTmxEYzBCZ3k2VVQzUFdSNk4rOHVERTJZM2hIcGlHVU5GYnhSdVJ2M1Bm?=
 =?utf-8?B?MmFheXpHV21FblA0OEdpSThENFFwODdqWTkrYjRFOXJQY2NsZTZOeEV4SDg0?=
 =?utf-8?B?VjZVaG44aUNPR2tqK1hrTm1Ub3pkM0tHOTFqa3pqVm9tc0ZCSVNuSWlqaWJ4?=
 =?utf-8?B?b0VSK2NhK0pKZlVmaEdKQWhjb0Z3UzJPSlB6eXJYeGZtRUlIQVJJQWUwZTN4?=
 =?utf-8?B?Y2dnTVRYTWY5NmpjQS82YzFVVFZCL2NlVnFKS0RuK3hBaDlDVXM5WTBzWjIr?=
 =?utf-8?B?bTN1K2dldS9DZUVsMWFmMVNEd1BzbWxucnRSbXlveSt0bEZtMmRPYVZzMzdC?=
 =?utf-8?B?NDc0N0UwaFE3d0hUZlIyd1FWUDQvMHFDZndXdnhNNXV2RS9wa3dMUkdNNEtR?=
 =?utf-8?B?dG5uemV3eWw5bmdZZG1VS2cvaGE4R2dNQ0oyNkx4Zmo3ZUdENS9JY09BaDRr?=
 =?utf-8?B?cTVsN0xEMHYzTVhLQmdFUW03N0NQbnl0R0U3Wklsc08vOHl4MFJoZGZlai85?=
 =?utf-8?B?NjlYTk0yVlBtaWcwZVFMQmc4ZUdXWFBjUkYzZWE4WnpZQ0h4TnpWN1B1S21D?=
 =?utf-8?B?dlRkak8rQTVZaVFDdkFYR0YwMWZyNVE1Sys1b0JxbS9XMmxBSDlZQ1A1ajlq?=
 =?utf-8?Q?0HOWQE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:03:42.1266 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6912be8-f823-4f60-8045-08dddbb0b90f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7711
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


On 8/14/25 13:43, Limonciello, Mario wrote:
> On 8/14/25 3:29 PM, Lizhi Hou wrote:
>> Walking hardware contexts created by a process is duplicated in multiple
>> spots. Add a function, amdxdna_hwctx_walk(), and replace all spots.
>>
>> hwctx_srcu and dev_lock are good enough to protect hardware context list.
>> Remove hwctx_lock.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>    drivers/accel/amdxdna/aie2_ctx.c        | 38 ++++++-----
>>    drivers/accel/amdxdna/aie2_message.c    | 21 +++---
>>    drivers/accel/amdxdna/aie2_pci.c        | 86 +++++++++++--------------
>>    drivers/accel/amdxdna/amdxdna_ctx.c     | 26 ++++++--
>>    drivers/accel/amdxdna/amdxdna_ctx.h     |  8 +--
>>    drivers/accel/amdxdna/amdxdna_pci_drv.c |  7 +-
>>    drivers/accel/amdxdna/amdxdna_pci_drv.h |  2 -
>>    7 files changed, 97 insertions(+), 91 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
>> index 910ffb7051f4..b76877179b62 100644
>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>> @@ -133,11 +133,20 @@ static void aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
>>    	dma_fence_put(fence);
>>    }
>>    
>> +static int aie2_hwctx_suspend_cb(struct amdxdna_hwctx *hwctx, void *arg)
>> +{
>> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +
>> +	aie2_hwctx_wait_for_idle(hwctx);
> This is an existing problem; but shouldn't aie2_hwctx_wait_for_idle() be
> looking at the return code for dma_fence_wait_timeout()?
>
> Otherwise you can end up with a case that you put() the fence prematurely.

The job submitted to hardware context was expected to be finished in 2 
seconds in worst case. If wait timeout, there is nothing can be done by 
driver and the following aie2_hwctx_stop will force all jobs bound to 
the hardware context complete and fences are signaled.

>
>> +	aie2_hwctx_stop(xdna, hwctx, NULL);
>> +	aie2_hwctx_status_shift_stop(hwctx);
>> +
>> +	return 0;
>> +}
>> +
>>    void aie2_hwctx_suspend(struct amdxdna_client *client)
>>    {
>>    	struct amdxdna_dev *xdna = client->xdna;
>> -	struct amdxdna_hwctx *hwctx;
>> -	unsigned long hwctx_id;
>>    
>>    	/*
>>    	 * Command timeout is unlikely. But if it happens, it doesn't
>> @@ -145,19 +154,22 @@ void aie2_hwctx_suspend(struct amdxdna_client *client)
>>    	 * and abort all commands.
>>    	 */
>>    	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -	guard(mutex)(&client->hwctx_lock);
>> -	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>> -		aie2_hwctx_wait_for_idle(hwctx);
>> -		aie2_hwctx_stop(xdna, hwctx, NULL);
>> -		aie2_hwctx_status_shift_stop(hwctx);
>> -	}
>> +	amdxdna_hwctx_walk(client, NULL, aie2_hwctx_suspend_cb);
>> +}
>> +
>> +static int aie2_hwctx_resume_cb(struct amdxdna_hwctx *hwctx, void *arg)
>> +{
>> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
>> +
>> +	aie2_hwctx_status_restore(hwctx);
>> +	aie2_hwctx_restart(xdna, hwctx);
>> +
>> +	return 0;
> return aie2_hwctx_restart(xdna, hwctx);

Sure. Will fix it.


Lizhi

>
>>    }
>>    
>>    void aie2_hwctx_resume(struct amdxdna_client *client)
>>    {
>>    	struct amdxdna_dev *xdna = client->xdna;
>> -	struct amdxdna_hwctx *hwctx;
>> -	unsigned long hwctx_id;
>>    
>>    	/*
>>    	 * The resume path cannot guarantee that mailbox channel can be
>> @@ -165,11 +177,7 @@ void aie2_hwctx_resume(struct amdxdna_client *client)
>>    	 * mailbox channel, error will return.
>>    	 */
>>    	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>> -	guard(mutex)(&client->hwctx_lock);
>> -	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>> -		aie2_hwctx_status_restore(hwctx);
>> -		aie2_hwctx_restart(xdna, hwctx);
>> -	}
>> +	amdxdna_hwctx_walk(client, NULL, aie2_hwctx_resume_cb);
>>    }
>>    
>>    static void
>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
>> index 82412eec9a4b..9caad083543d 100644
>> --- a/drivers/accel/amdxdna/aie2_message.c
>> +++ b/drivers/accel/amdxdna/aie2_message.c
>> @@ -290,18 +290,25 @@ int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u6
>>    	return 0;
>>    }
>>    
>> +static int amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx, void *arg)
>> +{
>> +	u32 *bitmap = arg;
>> +
>> +	*bitmap |= GENMASK(hwctx->start_col + hwctx->num_col - 1, hwctx->start_col);
>> +
>> +	return 0;
>> +}
>> +
>>    int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>>    		      u32 size, u32 *cols_filled)
>>    {
>>    	DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
>>    	struct amdxdna_dev *xdna = ndev->xdna;
>>    	struct amdxdna_client *client;
>> -	struct amdxdna_hwctx *hwctx;
>> -	unsigned long hwctx_id;
>>    	dma_addr_t dma_addr;
>>    	u32 aie_bitmap = 0;
>>    	u8 *buff_addr;
>> -	int ret, idx;
>> +	int ret;
>>    
>>    	buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
>>    					  DMA_FROM_DEVICE, GFP_KERNEL);
>> @@ -309,12 +316,8 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
>>    		return -ENOMEM;
>>    
>>    	/* Go through each hardware context and mark the AIE columns that are active */
>> -	list_for_each_entry(client, &xdna->client_list, node) {
>> -		idx = srcu_read_lock(&client->hwctx_srcu);
>> -		amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
>> -			aie_bitmap |= amdxdna_hwctx_col_map(hwctx);
>> -		srcu_read_unlock(&client->hwctx_srcu, idx);
>> -	}
>> +	list_for_each_entry(client, &xdna->client_list, node)
>> +		amdxdna_hwctx_walk(client, &aie_bitmap, amdxdna_hwctx_col_map);
>>    
>>    	*cols_filled = 0;
>>    	req.dump_buff_addr = dma_addr;
>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
>> index 6fc3191c3097..b3ae03d05fb0 100644
>> --- a/drivers/accel/amdxdna/aie2_pci.c
>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>> @@ -10,6 +10,7 @@
>>    #include <drm/drm_managed.h>
>>    #include <drm/drm_print.h>
>>    #include <drm/gpu_scheduler.h>
>> +#include <linux/cleanup.h>
>>    #include <linux/errno.h>
>>    #include <linux/firmware.h>
>>    #include <linux/iommu.h>
>> @@ -779,65 +780,56 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
>>    	return ret;
>>    }
>>    
>> +static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
>> +{
>> +	struct amdxdna_drm_query_hwctx __user *buf, *tmp __free(kfree) = NULL;
>> +	struct amdxdna_drm_get_info *get_info_args = arg;
>> +
>> +	if (get_info_args->buffer_size < sizeof(*tmp))
>> +		return -EINVAL;
>> +
>> +	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>> +	if (!tmp)
>> +		return -ENOMEM;
>> +
>> +	tmp->pid = hwctx->client->pid;
>> +	tmp->context_id = hwctx->id;
>> +	tmp->start_col = hwctx->start_col;
>> +	tmp->num_col = hwctx->num_col;
>> +	tmp->command_submissions = hwctx->priv->seq;
>> +	tmp->command_completions = hwctx->priv->completed;
>> +
>> +	buf = u64_to_user_ptr(get_info_args->buffer);
>> +
>> +	if (copy_to_user(buf, tmp, sizeof(*tmp)))
>> +		return -EFAULT;
>> +
>> +	get_info_args->buffer += sizeof(*tmp);
>> +	get_info_args->buffer_size -= sizeof(*tmp);
>> +
>> +	return 0;
>> +}
>> +
>>    static int aie2_get_hwctx_status(struct amdxdna_client *client,
>>    				 struct amdxdna_drm_get_info *args)
>>    {
>> -	struct amdxdna_drm_query_hwctx __user *buf;
>>    	struct amdxdna_dev *xdna = client->xdna;
>> -	struct amdxdna_drm_query_hwctx *tmp;
>> +	struct amdxdna_drm_get_info info_args;
>>    	struct amdxdna_client *tmp_client;
>> -	struct amdxdna_hwctx *hwctx;
>> -	unsigned long hwctx_id;
>> -	bool overflow = false;
>> -	u32 req_bytes = 0;
>> -	u32 hw_i = 0;
>> -	int ret = 0;
>> -	int idx;
>> +	int ret;
>>    
>>    	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>    
>> -	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
>> -	if (!tmp)
>> -		return -ENOMEM;
>> +	info_args.buffer = args->buffer;
>> +	info_args.buffer_size = args->buffer_size;
>>    
>> -	buf = u64_to_user_ptr(args->buffer);
>>    	list_for_each_entry(tmp_client, &xdna->client_list, node) {
>> -		idx = srcu_read_lock(&tmp_client->hwctx_srcu);
>> -		amdxdna_for_each_hwctx(tmp_client, hwctx_id, hwctx) {
>> -			req_bytes += sizeof(*tmp);
>> -			if (args->buffer_size < req_bytes) {
>> -				/* Continue iterating to get the required size */
>> -				overflow = true;
>> -				continue;
>> -			}
>> -
>> -			memset(tmp, 0, sizeof(*tmp));
>> -			tmp->pid = tmp_client->pid;
>> -			tmp->context_id = hwctx->id;
>> -			tmp->start_col = hwctx->start_col;
>> -			tmp->num_col = hwctx->num_col;
>> -			tmp->command_submissions = hwctx->priv->seq;
>> -			tmp->command_completions = hwctx->priv->completed;
>> -
>> -			if (copy_to_user(&buf[hw_i], tmp, sizeof(*tmp))) {
>> -				ret = -EFAULT;
>> -				srcu_read_unlock(&tmp_client->hwctx_srcu, idx);
>> -				goto out;
>> -			}
>> -			hw_i++;
>> -		}
>> -		srcu_read_unlock(&tmp_client->hwctx_srcu, idx);
>> -	}
>> -
>> -	if (overflow) {
>> -		XDNA_ERR(xdna, "Invalid buffer size. Given: %u Need: %u.",
>> -			 args->buffer_size, req_bytes);
>> -		ret = -EINVAL;
>> +		ret = amdxdna_hwctx_walk(tmp_client, &info_args, aie2_hwctx_status_cb);
>> +		if (ret)
>> +			break;
>>    	}
>>    
>> -out:
>> -	kfree(tmp);
>> -	args->buffer_size = req_bytes;
>> +	args->buffer_size = (u32)(info_args.buffer - args->buffer);
>>    	return ret;
>>    }
>>    
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
>> index b47a7f8e9017..4bfe4ef20550 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>> @@ -68,14 +68,30 @@ static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
>>    	synchronize_srcu(ss);
>>    
>>    	/* At this point, user is not able to submit new commands */
>> -	mutex_lock(&xdna->dev_lock);
>>    	xdna->dev_info->ops->hwctx_fini(hwctx);
>> -	mutex_unlock(&xdna->dev_lock);
>>    
>>    	kfree(hwctx->name);
>>    	kfree(hwctx);
>>    }
>>    
>> +int amdxdna_hwctx_walk(struct amdxdna_client *client, void *arg,
>> +		       int (*walk)(struct amdxdna_hwctx *hwctx, void *arg))
>> +{
>> +	struct amdxdna_hwctx *hwctx;
>> +	unsigned long hwctx_id;
>> +	int ret = 0, idx;
>> +
>> +	idx = srcu_read_lock(&client->hwctx_srcu);
>> +	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>> +		ret = walk(hwctx, arg);
>> +		if (ret)
>> +			break;
>> +	}
>> +	srcu_read_unlock(&client->hwctx_srcu, idx);
>> +
>> +	return ret;
>> +}
>> +
>>    void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size)
>>    {
>>    	struct amdxdna_cmd *cmd = abo->mem.kva;
>> @@ -126,16 +142,12 @@ void amdxdna_hwctx_remove_all(struct amdxdna_client *client)
>>    	struct amdxdna_hwctx *hwctx;
>>    	unsigned long hwctx_id;
>>    
>> -	mutex_lock(&client->hwctx_lock);
>>    	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
>>    		XDNA_DBG(client->xdna, "PID %d close HW context %d",
>>    			 client->pid, hwctx->id);
>>    		xa_erase(&client->hwctx_xa, hwctx->id);
>> -		mutex_unlock(&client->hwctx_lock);
>>    		amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
>> -		mutex_lock(&client->hwctx_lock);
>>    	}
>> -	mutex_unlock(&client->hwctx_lock);
>>    }
>>    
>>    int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>> @@ -225,6 +237,7 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
>>    	if (!drm_dev_enter(dev, &idx))
>>    		return -ENODEV;
>>    
>> +	mutex_lock(&xdna->dev_lock);
>>    	hwctx = xa_erase(&client->hwctx_xa, args->handle);
>>    	if (!hwctx) {
>>    		ret = -EINVAL;
>> @@ -241,6 +254,7 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
>>    
>>    	XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, args->handle);
>>    out:
>> +	mutex_unlock(&xdna->dev_lock);
>>    	drm_dev_exit(idx);
>>    	return ret;
>>    }
>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
>> index c652229547a3..7cd7a55936f0 100644
>> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
>> @@ -139,14 +139,10 @@ amdxdna_cmd_get_state(struct amdxdna_gem_obj *abo)
>>    void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size);
>>    int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
>>    
>> -static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
>> -{
>> -	return GENMASK(hwctx->start_col + hwctx->num_col - 1,
>> -		       hwctx->start_col);
>> -}
>> -
>>    void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
>>    void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
>> +int amdxdna_hwctx_walk(struct amdxdna_client *client, void *arg,
>> +		       int (*walk)(struct amdxdna_hwctx *hwctx, void *arg));
>>    
>>    int amdxdna_cmd_submit(struct amdxdna_client *client,
>>    		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> index fbca94183f96..8ef5e4f27f5e 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -81,7 +81,6 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
>>    		ret = -ENODEV;
>>    		goto unbind_sva;
>>    	}
>> -	mutex_init(&client->hwctx_lock);
>>    	init_srcu_struct(&client->hwctx_srcu);
>>    	xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
>>    	mutex_init(&client->mm_lock);
>> @@ -116,7 +115,6 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
>>    
>>    	xa_destroy(&client->hwctx_xa);
>>    	cleanup_srcu_struct(&client->hwctx_srcu);
>> -	mutex_destroy(&client->hwctx_lock);
>>    	mutex_destroy(&client->mm_lock);
>>    	if (client->dev_heap)
>>    		drm_gem_object_put(to_gobj(client->dev_heap));
>> @@ -142,8 +140,8 @@ static int amdxdna_flush(struct file *f, fl_owner_t id)
>>    
>>    	mutex_lock(&xdna->dev_lock);
>>    	list_del_init(&client->node);
>> -	mutex_unlock(&xdna->dev_lock);
>>    	amdxdna_hwctx_remove_all(client);
>> +	mutex_unlock(&xdna->dev_lock);
>>    
>>    	drm_dev_exit(idx);
>>    	return 0;
>> @@ -330,11 +328,8 @@ static void amdxdna_remove(struct pci_dev *pdev)
>>    					  struct amdxdna_client, node);
>>    	while (client) {
>>    		list_del_init(&client->node);
>> -		mutex_unlock(&xdna->dev_lock);
>> -
>>    		amdxdna_hwctx_remove_all(client);
>>    
>> -		mutex_lock(&xdna->dev_lock);
>>    		client = list_first_entry_or_null(&xdna->client_list,
>>    						  struct amdxdna_client, node);
>>    	}
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> index 40bbb3c06320..b6b3b424d1d5 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>> @@ -116,8 +116,6 @@ struct amdxdna_device_id {
>>    struct amdxdna_client {
>>    	struct list_head		node;
>>    	pid_t				pid;
>> -	struct mutex			hwctx_lock; /* protect hwctx */
>> -	/* do NOT wait this srcu when hwctx_lock is held */
>>    	struct srcu_struct		hwctx_srcu;
>>    	struct xarray			hwctx_xa;
>>    	u32				next_hwctxid;
