Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E54AC702F
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 19:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA46B10E682;
	Wed, 28 May 2025 17:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tUFKPI41";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF0F10E682
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:54:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwD+af48w19zAzRAPmFOnmW8r3jT8X8go0owGwPuWDrqMhJYy4UhN45VtfiywXow3r8op1LZ4jt8Z0BgCbA7BLG22hz3PE6H25spxYpsetCr9hVj+At/lkq1qsASXSahT6e00nPrQddDnVmiLUN7DQd+Ndvgi6VSV+bJvatVphqFS04WFK4d1nNCO8TI3sK56N9bBKiG/zKJEbia3pmqL9mbJb3PJURsDJ+x4g0q4MAdcwAfmU9gCJs+4S1qLCD+JPLX6JIby1mE314i/KfiSeCnAL3kreSy+nGS6JdEOGpvh7JNof4m7TNnMMp8YLe/FGSp5+Gpf0T4LM3LRo/pjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5jysxfdEscl3fAdrvVRUsGk+HDPMJc428jfPsKR8Jo=;
 b=iwYEy4L/AGvFphH6H1EydR1dxZKSOZ4lPQlhzRkna0DJ7HnNuk+u3Vab0Zv1eY3YC7l1aUOhBJyv9piusu79CqZ08N3aVzfWBX/HdD9e54gfaMTBAKbp5DEds1fO6oW9hwe8OzLU+uR7SeyDZMC66JhFQUXgWVSOYe7lWt95YIQu0EBxgtRXa/siOf4/mQ33Y9m5047Dxora33Et0XkHynlj8Z2a64uoAGcQNoZA5CgbOa8Ock/a0+k77u0ruxzv5UEWxbz7aqtJfMXSH3y9ZZGavbRgDMA6YOWkrATIGK3gYmEFEXRNB7OWWhs69mtToMDprvNN6tLi5QKEgOMD8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5jysxfdEscl3fAdrvVRUsGk+HDPMJc428jfPsKR8Jo=;
 b=tUFKPI418BTIoKscraXElCt8WT96sv04i4wnQAOTGpm08XFfn7LyV7hmcYT1uJjopVaYzMjxuRJWrFj/RRwDp9mqH/CAXttqJRGVJT+f3vlT0l7IE4O0WuTHU/jDAoVmXplD/hif0DAef0jCknzpSLIZKOzBtOgKO2UZsAx8Sr8=
Received: from BN9PR03CA0506.namprd03.prod.outlook.com (2603:10b6:408:130::31)
 by MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 28 May
 2025 17:53:59 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::39) by BN9PR03CA0506.outlook.office365.com
 (2603:10b6:408:130::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Wed,
 28 May 2025 17:53:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 17:53:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 12:53:57 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 28 May 2025 12:53:56 -0500
Message-ID: <5b8763f2-3c1c-3621-912f-995af0076d91@amd.com>
Date: Wed, 28 May 2025 10:53:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Trigger device recovery on engine
 reset/resume failure
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>, Karol Wachowski <karol.wachowski@intel.com>, 
 <stable@vger.kernel.org>
References: <20250528154253.500556-1-jacek.lawrynowicz@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250528154253.500556-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|MW3PR12MB4409:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e27c02-abcb-43ac-54f0-08dd9e109ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tiszd08xSXgwRmxCaU1WbHg1ZzFNQnA0REN5ZFE5QVh5Nkd2ZUdRdnlZNU54?=
 =?utf-8?B?U1p4cFBPYUFxL3k2ZUtVLy9XUkE2K1hqbXIrVHdhMndEeFRoczFsQ0RBWVov?=
 =?utf-8?B?Z1NDUzdFcFkzTnlyOFU2TmN6WFNEajZlWEFPWEdiRzBNL3hURmVKWE11THB2?=
 =?utf-8?B?UCtxT3ZTaDFxZ3dFRHovWEJhTnZ6RWoyeFZ4bGNjVmFWYzhuWjVsUmhLd2h5?=
 =?utf-8?B?RUcxNWV2MFlvSzA0Njk3Yi9PQjM2a2NWekRkWTVRbmEwSjc3Z0ZmamNwZUxU?=
 =?utf-8?B?aXpWRzNtcDU0ekpXQ2E0eG5MbjZ0YnduR3U5TjlXRGR6bWpxNml1NzE1b0Y4?=
 =?utf-8?B?WVN4L3VjOTFzVDdQanl4VjMzT1RUa1hpNVZRNnUrRXhidHBRdkJod0R0c2lR?=
 =?utf-8?B?VWtzR3d1NSthV005NmJGOHF3RnFjRkVhRVZDaHRxbS94bDJ4UmlENlhWdDdp?=
 =?utf-8?B?ZFRCQ2hESEJRajdGa2o2c3V0Z0lxNFBKZS9sdGlZd3FCbm8xVURJVktYT0l2?=
 =?utf-8?B?WE1TYXNkNmtBWXA0REdic3VaR1NRQ3l1a3lKMWEvR0dLVEk1SjkwYU1RZE5S?=
 =?utf-8?B?ejZaN2tjYVlCSHNCSXJCMjkyRmM2dnExSXIwcEdMMm4vdDNFcnJRZVQ3TmVI?=
 =?utf-8?B?WTR0TnJIN2s2MXN5QzJyZDN6QlZPSTVNYk1ubnZMbjJGU2paaWc0Yk9SQVZV?=
 =?utf-8?B?UllCT2RzSEVCaDM5M0xkbUhZRm9KekE2V1JFV2lsZzgyZ0VHL1o4Qk1tWEE1?=
 =?utf-8?B?THRSUjdpNm1mTTFqUTRUK1pneUJGLzlDd2FOWEozdmEzUVlBTmlqWWZSdVA3?=
 =?utf-8?B?N0ZDLzhEb1V2UURQYURudEx6cnBEOWZFUkFkT1Z0Rm0rMG1hYUV4MVN6OFdQ?=
 =?utf-8?B?OS90VHV2aG85ZC9pdG9kSzh3MmhOUHVsWlVYbXBNR2t4T29lRlNmUkhnaFlB?=
 =?utf-8?B?Y3RmVTl4SGdmaXg0eXh3STJlYkxkWHN3YXdQWnBqRm14ZkZhUXd1TlVuWE1L?=
 =?utf-8?B?WFppNS9odWVZNlFFb1ZQVHJGbTNEU2NheGZCOThMaTNBeFhlanhMZ3V6OXNM?=
 =?utf-8?B?Y3A2VmZFNFJvR0pmMVB1ZmpBa1pJWWliMjVYZmFpSmtCSmFBR0VJQ3JxWFhx?=
 =?utf-8?B?WDhaVHhVYVlFb1BQRU5LSFl5cy9URUxBV1FwVEV0U1lCbi94RGRXbnVRUjg3?=
 =?utf-8?B?N1dOL0d5dTJQUU8vbUI4bGMwVDRnWWg2Wk9IL0hzUmZ0S0JENDUwcUs3SG1k?=
 =?utf-8?B?TFg4TkRvNitET1VIUlZIYndrYTh5VkRrWHRHZmtFeCs4R2dkOUVwQi9CeU1i?=
 =?utf-8?B?QzJUdVM3d2VVZ0QxbHhBRDBtM21BYXpaZ0dEQUo0cHovbnU5djEvVkExZnB5?=
 =?utf-8?B?TXE4cnk0eUVnbEJFeUt4TkxVUmpPaFN3NWNPMXZWc0E2Yk1oeEhrNTlSUWNs?=
 =?utf-8?B?UE9Yc2JYNWUxR3REU3Y2Y2wxRWwyTWtPWUhudkIxQUxQT21tTTBiMXc5d2xp?=
 =?utf-8?B?VTFyOUpvZzI0aUVXdjJZM3FuRXh1dkw4RHRFNkxQT1RzODdHMUk4VFJwN1ZQ?=
 =?utf-8?B?ZEN5MVE2dVJvSUxGQW1EWFc4dEpMcnR4b0F0TVcvSXJuMXkrNklPRlhSTUl1?=
 =?utf-8?B?RmN1UEdnUEp0RzR5cVByOEt3Q0w2VjRkYnhJM252ZDZ5M2FwelJUakpoeGZ1?=
 =?utf-8?B?TEtqVUhPei95OU9wL1hyNFZaMldEa2p0djVBOTBNTElDSzdNbWIzMTNYa1BX?=
 =?utf-8?B?WEFXMjBUUzdnNW9VMFZBR3RzT09lblBVOUVPSGVleXlPc25xMnBoMW5lTHJn?=
 =?utf-8?B?K1BmcWZ6dVVNMkMvQVJFaS9rQVFldkpsVHNoN1gvWUJWeDhLSUF6a3N6RU5m?=
 =?utf-8?B?S2dSS0k5UTRhSTZ2OUZ2TkZ4blFqMm9VUytTcTJaNUJXSHlNcFRma0d5aTd5?=
 =?utf-8?B?ODdhYmVocTNJRjBUOTdzYjI4T3JDQm1HUXU4SUtQU3FETU50TGdUNWJJNjBS?=
 =?utf-8?B?cW9LVWtGQ1JlZndsL3hOQjNxMi9oTjFsckNJN05MUzBzbXlsWFo0d2hWWUha?=
 =?utf-8?Q?c0ptzg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 17:53:57.4279 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e27c02-abcb-43ac-54f0-08dd9e109ea7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4409
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


On 5/28/25 08:42, Jacek Lawrynowicz wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
>
> Trigger full device recovery when the driver fails to restore device state
> via engine reset and resume operations. This is necessary because, even if
> submissions from a faulty context are blocked, the NPU may still process
> previously submitted faulty jobs if the engine reset fails to abort them.
> Such jobs can continue to generate faults and occupy device resources.
> When engine reset is ineffective, the only way to recover is to perform
> a full device recovery.
>
> Fixes: dad945c27a42 ("accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW")
> Cc: <stable@vger.kernel.org> # v6.15+
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_job.c     | 6 ++++--
>   drivers/accel/ivpu/ivpu_jsm_msg.c | 9 +++++++--
>   2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> index 1c8e283ad9854..fae8351aa3309 100644
> --- a/drivers/accel/ivpu/ivpu_job.c
> +++ b/drivers/accel/ivpu/ivpu_job.c
> @@ -986,7 +986,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>   		return;
>   
>   	if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW)
> -		ivpu_jsm_reset_engine(vdev, 0);
> +		if (ivpu_jsm_reset_engine(vdev, 0))
> +			return;

Is it possible the context aborting is entered again before the full 
device recovery work is executed?

Thanks,

Lizhi

>   
>   	mutex_lock(&vdev->context_list_lock);
>   	xa_for_each(&vdev->context_xa, ctx_id, file_priv) {
> @@ -1009,7 +1010,8 @@ void ivpu_context_abort_work_fn(struct work_struct *work)
>   	if (vdev->fw->sched_mode != VPU_SCHEDULING_MODE_HW)
>   		goto runtime_put;
>   
> -	ivpu_jsm_hws_resume_engine(vdev, 0);
> +	if (ivpu_jsm_hws_resume_engine(vdev, 0))
> +		return;
>   	/*
>   	 * In hardware scheduling mode NPU already has stopped processing jobs
>   	 * and won't send us any further notifications, thus we have to free job related resources
> diff --git a/drivers/accel/ivpu/ivpu_jsm_msg.c b/drivers/accel/ivpu/ivpu_jsm_msg.c
> index 219ab8afefabd..0256b2dfefc10 100644
> --- a/drivers/accel/ivpu/ivpu_jsm_msg.c
> +++ b/drivers/accel/ivpu/ivpu_jsm_msg.c
> @@ -7,6 +7,7 @@
>   #include "ivpu_hw.h"
>   #include "ivpu_ipc.h"
>   #include "ivpu_jsm_msg.h"
> +#include "ivpu_pm.h"
>   #include "vpu_jsm_api.h"
>   
>   const char *ivpu_jsm_msg_type_to_str(enum vpu_ipc_msg_type type)
> @@ -163,8 +164,10 @@ int ivpu_jsm_reset_engine(struct ivpu_device *vdev, u32 engine)
>   
>   	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_ENGINE_RESET_DONE, &resp,
>   				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
> -	if (ret)
> +	if (ret) {
>   		ivpu_err_ratelimited(vdev, "Failed to reset engine %d: %d\n", engine, ret);
> +		ivpu_pm_trigger_recovery(vdev, "Engine reset failed");
> +	}
>   
>   	return ret;
>   }
> @@ -354,8 +357,10 @@ int ivpu_jsm_hws_resume_engine(struct ivpu_device *vdev, u32 engine)
>   
>   	ret = ivpu_ipc_send_receive(vdev, &req, VPU_JSM_MSG_HWS_RESUME_ENGINE_DONE, &resp,
>   				    VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
> -	if (ret)
> +	if (ret) {
>   		ivpu_err_ratelimited(vdev, "Failed to resume engine %d: %d\n", engine, ret);
> +		ivpu_pm_trigger_recovery(vdev, "Engine resume failed");
> +	}
>   
>   	return ret;
>   }
