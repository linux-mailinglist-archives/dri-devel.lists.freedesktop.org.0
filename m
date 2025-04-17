Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C63A91817
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242F510EA7A;
	Thu, 17 Apr 2025 09:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aZwEyCZK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A51610EA7A;
 Thu, 17 Apr 2025 09:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgMXg3qJtfpdv2ishM37nj7/xrm3uy2HV9TX7vt5pbMEoVPE5Vg0h8egRhfjvzwskjkw4DQtSGzWDuxlyNo3FaZrZaO676E82R1NNwYcnnQ3VzL+HLWRfyGf/gT+scSPNJ1/J/08tuP6KV8JSbgzaYahMAg1iiWrNhpEJz9GaslTShoZulQ25n61twspq+B+a3n0CMWhRV1lrqtJdl0pxN64D2wHbdYNjZOWw2j8YHd6TwofEvP4ihhIJ74g7GR0BlvdQK0FyqUjvf7QVQ7EkGHlJkgPP0iQ+adaTlbSdQomj08AZVdSXFcJkQNavSO496fi+rrSrqXTU1b1T9nl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/peQngsFWC8lO9pLAuc9H/VILhy/wqqydMkIboRMCU=;
 b=T+yHOnRNzDOHGBNL03FE1mH0VNly4tV2BBWXakTJbG/twYWG1w4/6XVmlE+CIVpJQAZl3zwzhTsjLIAguSbEUEX8oUpMZIHb/qywkbarBuAim4RZOn2qeMxuuTjEyHsJmERhq1j1+AEpyGRQGvgHXDWCEgKCZuXBRbiKptWwAyz4I74dJ++kSrUZ7Xioj70fSTWLNakkm9pFZoCUa8Z84xrYzN18fHMVKP678xo2UrD8MOHnBBF1L837UZDHY+xHU9WVT0Q6HCGDbdoLlowP/5coIAZTUSq6JKhxmL/5gzd1JmTSDkBQwF3f3KAATAuPVpaiX44YfvlAGeFfiF1gDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/peQngsFWC8lO9pLAuc9H/VILhy/wqqydMkIboRMCU=;
 b=aZwEyCZKaF3tDwyJ/+JO2OOyTN6QVzhiup6Url3Y1fkqUPynwaFfQLRnIwQQbnQ+56tualGgKYpqxkcqE4o0wKgI3YAA15+x4y7VeCfSVwzH4IsH36mu6K8RgYlktJRLV1DXidU0IdXgvGKq5S8uNy2G5xWWDhtNzIytB9gM5mQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by MW3PR12MB4395.namprd12.prod.outlook.com (2603:10b6:303:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.25; Thu, 17 Apr
 2025 09:35:44 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 09:35:44 +0000
Message-ID: <8f94e32a-4ba7-468c-98ec-e4762069cfcc@amd.com>
Date: Thu, 17 Apr 2025 15:05:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/schedular: fix the warning in drm_sched_job_done
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>
References: <20250417092514.2241612-1-sunil.khatri@amd.com>
 <cfaffac8-e1cb-4a1f-b35c-7832a5da2d98@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <cfaffac8-e1cb-4a1f-b35c-7832a5da2d98@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::7) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|MW3PR12MB4395:EE_
X-MS-Office365-Filtering-Correlation-Id: c481f2cc-bc8d-46d9-6540-08dd7d9339fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjBlemx0U2xPam91Sm0zREF3V0hjZTJzOEROM21RZkcxZUhFcFF4SkFQNU5z?=
 =?utf-8?B?YzJUMGZjd051bDhGYjdvVFFVRGJTbnVzSmZBUTc3NUpZSmc3b3l4NnZhdG1m?=
 =?utf-8?B?MzhtaTlqcFNrMUxFR01lZ1Frb3loTFRsczhjeVpMczZnbVNYc3NXWDMxKzFp?=
 =?utf-8?B?NDhjT3Z5WEorNG84SVBidjZVUjJOQ3QwTGNHcVZQWlBxZ1ZMZWxVNENHL3RQ?=
 =?utf-8?B?M3oxZ2ExaC8wRnA0S0diL2QyRXRzTHJ0MG9TSitBT2UwSG1PRmo3SUE3dHlk?=
 =?utf-8?B?dm9UTksyNlpRTzBFTFhWWVdqTmhZQ1V2dFdJc0sxcnd1bnlhM3RyYVVJcnY3?=
 =?utf-8?B?MEZyNlVLd252WkdNZDUxNzlwVEZ4NUhaM2pvRmpzQ0R5d2tWRlRmRjA1Y1ZD?=
 =?utf-8?B?YWFWNVVEZUZMemk2VVY4QzBhVjF5MVo3clVPTDcxWU5NS2tWQk1UdjdmcjFn?=
 =?utf-8?B?akdtYjJPZy93RlBOQmx5eWpQdjFlQmFhRHRtVE1BME9yaEFIUmgyWXlsWXJG?=
 =?utf-8?B?KzVHQ2dIcmhXQTMwaVNROWFXSEpCcmJwWklrYktFV2svZGM4a3FtZUNJandX?=
 =?utf-8?B?WVE3QmtBRjIzZUc4bGluSzNxQzUxNjJjcVpBKysxeWZwUmdEVUhpMkdzWWtz?=
 =?utf-8?B?UStzUFY1NkR0S2Q2ZEU3c1Q2QUFtZmlHWklHdkphdFV4TlVWMU1aYkM0SlVP?=
 =?utf-8?B?aHZhTGxpL1BMWXhRVW0wWVQ4K1VYTXdrcjNCYm1vL1hzb0ZFUVRzdTFScXpk?=
 =?utf-8?B?NFAyR0ZYZWkxZnJsRnF4b0Z5ZVNCcnU4amNVUGY4bmIwd3dMRmV0VWFUdFNz?=
 =?utf-8?B?RnhJWnFObzVoUm4wR1ZkY2s3UzBEQW5oM1dINE1SQjBwUTJMUVpHWVlHbkI0?=
 =?utf-8?B?UHo0NlBpeGdUSmlZQjd4WmEyYTd6WVZ1V0RIMDJwS0IzWGNtSDlva2hkVkl1?=
 =?utf-8?B?SlBtLzNyMHNXeGZzYXRiZlkvY2RSMEcySHN3NGo0OUNSaUVnaElnZnh5RzJP?=
 =?utf-8?B?aytybkIydlExWUx0NXdadHhsRWE1VnYzRXo4Qk9ac1dWK0ZUN3EwRFJBQzQw?=
 =?utf-8?B?RHZ6RUhNQmJSOVZyY0hxaGJ0MGZzeXd0SWpYREZrZDZzcXhoeGF1ZDRhWFlZ?=
 =?utf-8?B?eVE3aFFZbFN4K201dUE2anA2UjNSODA4czVscGVMWjVzZm1xTURlaHlXcVlJ?=
 =?utf-8?B?UkJiRnVxU1paT2xzZjI2QlhWNE81NmFadFFxSllUU1RxU2VFeGpVS3dwb3pa?=
 =?utf-8?B?LzN0YmdoRTk2TzhWVEtkTkhvZUpsRE90WURpdFJueTFqaDRleFBkZjlxSW0v?=
 =?utf-8?B?RkdyZE8zanRBK2JIT0NZUmZVRU9ScHBuQTVqbGJjV28ybi9YQ0NVamlWM2cz?=
 =?utf-8?B?MllLT3NNM0E5Y0ErSHJwTjc0NUlJVk9VY0RsNlBxWWpZRUtWTnJ0ZnNxV0V0?=
 =?utf-8?B?aDlveEd2cEF1a2ExN1N0OUFtNHoybEpXRDAyNXhTNURkeTZmcjJ5c2hpUWdG?=
 =?utf-8?B?MUpaWi9qRm91dEROSVU4NFphREc5eTdyWXMrUzNIYlIyT3hWcVFHMUZtNzZQ?=
 =?utf-8?B?cTB1cVZlWHhlWDBUSlU1QmNVaWxHZFovL05LaUdYNTlNbWVCdHVFUVU4VVJJ?=
 =?utf-8?B?ck93WmlUaGIxeGVZRG5iaG1xMGFzY3R4ZFh4NXFvYllZYmg2WW1SK0MvQWRK?=
 =?utf-8?B?dTUxY1l3ZWM0TUlrWnNPUFdiTEsra05aMzc4OEFiSjFRck84RUxZVWQzcnhz?=
 =?utf-8?B?WHFoUGpUcUlwcGtjMW45YmJSWHdRbUdIOTlCSHFrb0s5Z1FCZGJXbnprdFd5?=
 =?utf-8?B?YmtKbE14cmJDWkdRYVpReHpFaTZJNk90Nm1wdTc0akZGSmpaR3hoYkdKTkRk?=
 =?utf-8?B?L0JZLzg2aFNFNjRGVjZtSXhpMU1CMWhsYlJDaXpzYmhwbEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THprcG4zd3lIUmZheUlUSmF5d1VXc2hOdHl6alpkTkFlT2xSR01lUkNoMTdY?=
 =?utf-8?B?VEJ4T3JWd2JmZExyNHcveGhkZEc0MGhRYlp4ZnE5aFQzeTN0Y0Q0d0Rhb3Yr?=
 =?utf-8?B?c1FBL0pxaWthVHhTTlhGRFZrc1RFQUpHclNsclg3elNxVVhHK3J6NDFRYSts?=
 =?utf-8?B?c0hHTUcxTUJJQU15L2JoM0tHL1FkS01FN0dpVWZtNmxGLzR5aFRVTm5UZkYy?=
 =?utf-8?B?Wlc5NkRQNzFabUw3MmZjUXYyUUE4SHFGUTNJU1pzaTViTFhnYVR3bEpjeEF3?=
 =?utf-8?B?NFE5MHg5MDJ5YmZadXNTWlFJNFlQaFFmdEFRK1FHcmE1TGo5UWxmOThVcERZ?=
 =?utf-8?B?MS8vRGlGYjMyejA5cWtXbmcrcUU5YUZKWElYeWpLZTlXd2N1dGxoRkZHYkE1?=
 =?utf-8?B?T0lvQ1ZRUHlEbytsendUUjNTa2VoVUFGc3QwZjdBMGk2d3pWZlZMdUtyQmRU?=
 =?utf-8?B?QTNtL1FjRlZLanJmOTRnSjl6Y3ZMcTNoU3UzdEdSYlZweVFiQktCSXIrNklT?=
 =?utf-8?B?RjJxSFNISnlySHp3NU9RWEtuRXdMZzJ2VHJLS0U4OVBCTTBMNWp5dnFmdldp?=
 =?utf-8?B?SUZRZXhuT3cwM1hpWFdzNXE2R2JYb1Z1NDJyYUVXRFB6SW9Sd2Y4dlo3T2sz?=
 =?utf-8?B?ZTFyQXR5Y1VJQ0c4ZTh3Sm12bERSMjl5emJYRm9MTTUyQWhJdnRpcmJBTkE5?=
 =?utf-8?B?Umk1UThjeDdkdmVCczNzTmhEcVVnOVNVS1BvaEViSGhtV1AwMGlvSEo0Y3Rj?=
 =?utf-8?B?bTFQVGxLWi9OMW56YnMyOWsrdVBGU0RoUUVvdGV0T1Jzalg4M1lCbjBiUWhp?=
 =?utf-8?B?RDlKNFNXWlVrTXNqTUQ4MitnT2dYaTkwV1FYcjJ6UTlBMFR0YXBtWGJBcXFX?=
 =?utf-8?B?alVCQWU5cHBRUlJWNmtiMXlwOUlHUU93bWVpTFdJMytydWMrQm5wVVpVcVdh?=
 =?utf-8?B?VURtZm0ycVpqdVQ4MUVXelVrOTlTM2U0VTRTcFRtOXpiODh6TjBkZ0tKc1Bq?=
 =?utf-8?B?Um1hSDRGUXRUZm5WL2lZNWFaRUZldnMwZWp3azFCSWovazhQbWlVVE56MGwr?=
 =?utf-8?B?L2FLdTQ2ZWxyRVE1aEJha2owUnBySEJXZnRqcnAwTUF4Wm9UYUFlOGtzcFZE?=
 =?utf-8?B?SW54VllpdFNqS3dSeFM4dWJMRTJtMlROMURXeFdvRmlsVUxuUEoxZFhXSUJk?=
 =?utf-8?B?WWYzditOUGFUcFBvcElkQnJmTVdCWnBkM0RoUE5kV0wrS2NlTjZBbndoWFc2?=
 =?utf-8?B?VzQ5Wk5PQVZERC9EQ2s3eUxBamRZeWJsL2o2V21DVzBmTnUxcm5Dc2FBTnha?=
 =?utf-8?B?K1J5WHlmbEdnSythb1NEQ3VjNktKVWhmNUlQa3lMcW1DSnNsV0o3YnRXWmdj?=
 =?utf-8?B?Nk55b09qSG5aTDZLV0h2RzJReVBBODJKd09tMXd1S0RrV3JrYzduR0pVMkJt?=
 =?utf-8?B?K3NnOFJqSXJHMFJwY3FBZjhWaS9FVVk2Y3kvVVdMSmRqdm9ITGczcGJGRXNn?=
 =?utf-8?B?a29NN2cvN3dCRXRnQmVUcWFpRVFQenVKZnZZWnltRzFmcDZJTWhUMmpYNmlE?=
 =?utf-8?B?aU1RQnhpSXgxUzJ5UzJnM0FoaHNQQUFFVllhalZkQ0ZsTzF4NjFhSkZ2UjFG?=
 =?utf-8?B?djZPcE01MkZMWGtKSit2TldPaW9tWlhPa1BSZUt1d2hhNjZyUEtYWFdKbytl?=
 =?utf-8?B?ZTdVd1RhQmpwTG45WUczazdiZFNUYm94Y2w4Qk1KZEdpVFJOeEFKbW1jN1ZE?=
 =?utf-8?B?UHNzakJDaXlXREVpSmZmK3N6MU1ZN3FIZThuZHBPTUpTSitCck1wSVhDRDVQ?=
 =?utf-8?B?dStrbENHNmRjblFRYTIwSUJlY3N4NTJwTGRyZTFZeGd3NFFRRjIxSFVpVFlO?=
 =?utf-8?B?SUpqNUQ5U2dVSGtRRnpzWng4RHdyNjNkS3NPeWJsOGp5K3doeWxSV3dOMi96?=
 =?utf-8?B?Nk1UU0t2S21lRHIra3ZMNXQ1YzJHTVBoMG1VbEFTY2NqSzdhdHNPbDVNRXdY?=
 =?utf-8?B?Z1NkMVlEck1vSkxkcTB2cW1QWkN4dklZUzhxNEVjNjZBR1kvNS9SdmYxNVpa?=
 =?utf-8?B?U3IzMGZYYjhxYnhLZXI3a2dEeUFVZjg4dElDUHdsVU1XUHBBMzJHMDNXOVBw?=
 =?utf-8?Q?G8fS9a3aMa9c9qxhi+5Y/IAPW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c481f2cc-bc8d-46d9-6540-08dd7d9339fc
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:35:44.5775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIzj/DPrMMtvqXAlH4Z0qJCMUaEK3LUu/y2IaMJVdn9RYmGQg3g0y/TA2xRd2OM+7lHLK6H7ysLC+xjPE7Bzkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4395
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


On 4/17/2025 3:01 PM, Tvrtko Ursulin wrote:
>
> [Added Philipp and Danilo to cc.]
>
> On 17/04/2025 10:25, Sunil Khatri wrote:
>> Fix the below warning.
>> scheduler/sched_main.c:397: warning: Function parameter or struct 
>> member 'result' not described in 'drm_sched_job_done'
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index bfea608a7106..2b5cf2bdf900 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -390,6 +390,7 @@ static void drm_sched_run_free_queue(struct 
>> drm_gpu_scheduler *sched)
>>   /**
>>    * drm_sched_job_done - complete a job
>>    * @s_job: pointer to the job which is done
>> + * @result: passed dma fence error
>>    *
>>    * Finish the job's fence and wake up the worker thread.
>>    */
>
> s/drm\/schedular:/drm\/sched:/
Noted
>
> With that:
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Optionally, "passed dma fence error" could perhaps be improved to say 
> something like "Error code to set on the scheduler fence".
Noted, Thanks a lot.
>
> Regards,
>
> Tvrtko
>
