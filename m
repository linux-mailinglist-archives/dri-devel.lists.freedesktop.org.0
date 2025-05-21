Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22141ABEE8F
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 10:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3875210E6C2;
	Wed, 21 May 2025 08:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bnm4wAjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5575E10E6C2;
 Wed, 21 May 2025 08:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wxugf6EfQwLiNckktnE7hRge5vkqji8pv8J8ujIXyDaipNo7uQL3JOWPxoxfXo+IUACNganVoXRzgEjnFkSjcuE6KKOlj4xqv1N4czesWJf8USmgXphJxKuDwDKGHCJrDkYAaQc28AKRgIzR+oDg41y/h8RZ1Llip0jUaTHSQEaAhhBCIx7HGekIMcMqEMNtoU1uM0NcmMNGkJ+rgwrzUuP12W1/iSLw9HILen17OBDsNZ3ahNWOL3Rz/UwK6VQNMcF2KFGNQ4JyEFvy9ysvB24dpq9tuU5ohPsGi+rChCvu9Uj9wjYItGukd9BRpZ2DnhH5VqfptkoNelrDOM65TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q89QkSCDrmsWE028N4mMutDY1e6jq5ZuP1O/VsXByk4=;
 b=gLOqEzlzUPYIH2l5rNU89CE9QTqINg/oKJOitUR+rbt3+d4//3gLqJ/hDWJMts22fvqPXGEDOIwjRwejOtEV6Hk7YkpdQvcF4zv7YLHieDkUAxQuQ+oTCVk62R25CHYNudfuMOJudynciLJ6wnxa4iPFTDfcb9JXMSWkl1SOT+W0S0/gwGLvvMih3ZuyaiLms8HyJcX/CX9RytVoX7I8CaShp8M3CK9Vxqr21Fgr7y3rmYKIxslIe9JhWuAlVIuSkaseSZa8BSyMlaeXShsVacb91u4iYDfG4GnSMMEjYUnw5ulazvjmE29baCufltuaLo4W/e9U4CUM2O3Rkmit/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q89QkSCDrmsWE028N4mMutDY1e6jq5ZuP1O/VsXByk4=;
 b=Bnm4wAjjeQScDcCwdJewBR7rnQHzu10Jt6j2iyU+0spMoUDSxtFpQBRGQWV8/K1m+J/COPPsQNlpaElav12yYq1ufnixUj2JJydbekK6o3YSh2DPixxKV+noJk6mk7G0DmVDGo0Jh93Yq/Qv3c/tgvOvEbeTgJUZoMOeI+MPHe0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Wed, 21 May
 2025 08:50:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 21 May 2025
 08:50:26 +0000
Message-ID: <52c44a4b-b633-4df9-a2c7-a98aae8e3087@amd.com>
Date: Wed, 21 May 2025 10:50:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
To: Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 phasta@mailbox.org, dakr@kernel.org, amd-gfx@lists.freedesktop.org
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
 <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:208:530::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: b38acf3e-3211-41c7-dcaf-08dd98448806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGczajZtZDUxcmNPQ0VubUtnZEZKanQxRjBGYUt1MVVNK0VmdlZPaXB0a1M4?=
 =?utf-8?B?Z3dsMmtpeFluS1paVmpVMSs1elZHeHY4R3dSUE90VHJ4QlVzNnU4eHNENlZ5?=
 =?utf-8?B?dSttSzE3OU9kZEhremJCRW5FeGRYNGFyMzdpQmoyTnFLYmxJY094Q2gwTlhH?=
 =?utf-8?B?TlluZlZjZFhIMXRKYmFsTXBtZ1BSUnQ2bTB0NUp4dy9BZ3YzTjZOblc5M1o0?=
 =?utf-8?B?KzFlck5EcXk5OGZxUTIvRXBRUHZxdk9aZXIxcERQVEFIREpMRGpPeXNEODFB?=
 =?utf-8?B?KzhVRFNtbTBOTUt1TEZrRjhQV2VXbWlBY1htcjFTMk5jTCtYelVZN1JDU1ZX?=
 =?utf-8?B?MVk3cklwV2c4c1Z4QzFuWFpRTUJybm1BWkorTzNYYkRST2x3TjlvQUtGODN5?=
 =?utf-8?B?KzF3L0JzaFptaUJmNmROT1NNbmF2NFE5RlIzcUM4YVpra3dwSEk0bzNGbTF5?=
 =?utf-8?B?eWN2WlpON28yYzZsY0lmQ3grQ0VpWEFUMFZGUGtTK0lGRnlUeEVMaEg0Rmo5?=
 =?utf-8?B?Z2pyTDNlbExYV3BGS2czYTAyRG5jV0JLUVdVa09uUEo0Z3BreHNIcHc2Yys2?=
 =?utf-8?B?cTN5bjNDSEd5dFZldC9PWjd0V2pLVFlBVFBKcjFpNVl5UjJYRkdXMGJWb2Vy?=
 =?utf-8?B?YTBKMHBRUmVoanM2cTB6bWtPV0Q2SXFaV3cyOVA4NFA2SVZFWHRxODROSnh2?=
 =?utf-8?B?VFVMVGhZTndTdWR6ZER3Tkhnb1Q4cG5Pb0wzaExTbzh1TG9BSHNITVJYS1Qv?=
 =?utf-8?B?OUV3M1Y4Y3NrUjBnYVNIZWtCZmtnTzR1V3ViV2lHMFJLcWxNYjRTL05pMXFy?=
 =?utf-8?B?VEN4cXczMHNoQUI2RXBhbnFqTDIzQ01OQXhVblR0TUV3Z2VTeHltOU9uZ2ND?=
 =?utf-8?B?bThiWjFIZGVMdXZCWGxrWCtYaXVaREJscVMyVHhpOVNteFYzcDcyZzRkOFFr?=
 =?utf-8?B?ZjRuSXJHbmZvNlZQZlhaWUEyVXVqY2EveDFwWDFSWlh6aHlEZ0Mwd2dON0FJ?=
 =?utf-8?B?T3IzTE11TXdVaUc2d0JnN2E5K3pHeXNQN0JjSGhNQmtoRDNtTHBxK1RzSTV5?=
 =?utf-8?B?eG4xa3Rsa2pPcGZkYmJZblFRd0QxWmQxbno2bThoVVUxRkliMTJMTHlTeUVU?=
 =?utf-8?B?cHladjluZ04wZUxDbmJWUnEvdkROWGdzT2p1U1czNFpCSW45Wi9HTUU1c1l5?=
 =?utf-8?B?SFU1MCtUaDdBeXdkNXlFT1gyR0lQRzZhRk9vcFdRbzl1WVdZUmY5QStFb0gv?=
 =?utf-8?B?NlhFdE5RSzdpYWdDMVZIa0tyaFNIdmpMNkhOcjlIQm1SVWJDbUcvVnVrbU93?=
 =?utf-8?B?L055QnEvLzFHU2hBMGNBQU1LMW5RS1VRNFJZYkxtM0prZytJNHNIS0xXT2Rj?=
 =?utf-8?B?WGVEejN3NzJNdm8xU0FxZ3ZKZ0ZJekFGVEwwWElIUkdiTEFReW45aS9xc0U3?=
 =?utf-8?B?aFlka1dQZXc3ajRhd21sNHRXL3VnOXJaeC8wMlFFcjVtZTJ5bjJNS0h1bG5n?=
 =?utf-8?B?emlPUHg4bHdPb3lPaXRTVmRkMzZ3TksrSGw0RWdGbE4rQ3lnNWNDUE4rc0li?=
 =?utf-8?B?ZTFZdGR3eHNsekF0cEZCQVQyUm5uQm9RSE1mUU8vbEpDcTcvenJRSDhZaVh5?=
 =?utf-8?B?aGZaVFQ4MkdNakNTUzJrN2FoWHkyTmFZN3kvK3k0RGdTQ1U5Q0dZR3VYS1lu?=
 =?utf-8?B?UGVMcmxZSzZYdXp5aFJnNzRTSE1ub0cwY0Ivb0xqakdnTjVCWSszckhHL2Uy?=
 =?utf-8?B?a2NobWZKTDRXY0E4RDBFdWVuZE14Y2hvVmtxWkRnNzQ5NUJQT3YyQW5zV0kx?=
 =?utf-8?B?eUhrZmJWRjB4bHRsWVNQYkVFSG81OHAzcmlXbTJrSXVUNUxoRDA5U1lFQWsr?=
 =?utf-8?B?UjdIa21jWGl5OGNYSG5aY3huUzErK3dzdTdDb24wc1o5bHJ4NUxoRlk3bHha?=
 =?utf-8?Q?WkZdRLEt/vk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TThuZUFRWUlZZ28ra3RBaFJYa3pxNC9Ka2RTc1hodGYva1hyOFlqalp5aDlH?=
 =?utf-8?B?Rkk5ajdHQWlHcTQvZkowTTRBWjJxVnZYVWVneWM2YUNYZko5UW56WVF0VCtp?=
 =?utf-8?B?YTFmRUlnSlM5YkxHRW8zQ1B3bTBqUmVLTVB0cEhxcWlXRlY5aGtsb2wxbU8z?=
 =?utf-8?B?YUxTVnlEQUwrakE5TFZEbmpBbC9ZVHYvVVNiZXNLaXZkc3Y1ZmRlbnd5am5v?=
 =?utf-8?B?OUR4d2JIaEN4YVpmZDZuTGZmOHkyWHJYRVV2bjRpY0NhOFhKbXBzNGtQZHFQ?=
 =?utf-8?B?TUZrNFpQRk9acWZHN0NTWFkxZ2V6Q00wRHhUVDVRaHQ1RGh0dVNrRHFZczln?=
 =?utf-8?B?UThZUVhtaGZCd3AzeVJoSmt3Yk41eUc3cUd5aFg0Rjc5eHR4WmNkZ2lNM2VV?=
 =?utf-8?B?THBPUmFTOHE3SEdoREV2K0xrdDFvYTBFT0xhb1dZcUUveTB4WWpsL2c2bGdX?=
 =?utf-8?B?bXFHVngvTVZ5MU9NL2Ewb2lVcEhLSkswUk1CSVlPOHpFL1VOYWlBNlhibmo0?=
 =?utf-8?B?TDB0VkluenVFQUgyQ2xkdTR1eDJiQktjS2luaDRpOVFZbTh3S2U1WUcvL0Jk?=
 =?utf-8?B?Zm1HSXV4N2RiZHAzOVpvSDhwUTRZaklFTElyN2YyM21DQzhpdzlqdVhmZk1I?=
 =?utf-8?B?Vm5jQ3hDY0ozU2xsL25oYW9sa3VzZ1pEVXlEbE1Ka2h3dlg5NlNEQUpjL29F?=
 =?utf-8?B?aDFmVW9jY1k5dzhaMEwwR3MvWXRzRDNma1FkdDlsanNLVkNtUG5sdnZaMDZV?=
 =?utf-8?B?dThBc0p5aFcwTHNUSmkxMzViQm9XYnFEazNkSFpXQmhyVGthK256OFdLWUxB?=
 =?utf-8?B?Qm9HYlhKOFNUeU01YjFsTE1DSXNtM0FFQ0x4TUlJOW1JRGdNV21hVTNuM3hQ?=
 =?utf-8?B?L0RRYkRweGJsQ0ZJdnkwam1pQkIyZ29YT1dyU0d1M1VkbkpPQWM4WldEdEJo?=
 =?utf-8?B?SnlPUDNFTkt0dzUrU1Q0cGt2YUF6RVJXSjAzenZrdURXQkZ1OU1xcXFiU3NZ?=
 =?utf-8?B?anNaeHYrWDBqTjRLRTBFVys5N2ppYm1EV1Z2YlpsMXZjaW5RdWx6VUpJV2Nh?=
 =?utf-8?B?WUR1QnVmSC8wb1ZkNCtPQ0VncGtLQlhFNSs1TTgvY2MxRk9Zclpuc1NVd0sx?=
 =?utf-8?B?QnU4c0JvUGtXTUY0MGJ5TERkTUhEdE9pR3dNekJBVGVINUVyTHhTMTBqajlY?=
 =?utf-8?B?cFpkaEkzd0F4ZEZnVnRSOG4wVlVVdDNra09RZkN6THFnRTFkcno5L1Zvangv?=
 =?utf-8?B?VlFHVUpFc3VsUUVKNXBZWjI1TFROTHVJSDM5M05id1RUbzhVcUhzbG1qVlFK?=
 =?utf-8?B?eDVhcEltV3h4WC93ZEhnM0loZ0tZN0llSUszMVd3eEhwbXJGalpvQWtOZ2pj?=
 =?utf-8?B?a1BuNjEvbnVhcVNZTHAvMllTQkY3aUJDVnU5azBQVDNVRTYwY1l4ai9IZE5X?=
 =?utf-8?B?MkdReVo4T2NWTFpmVlpIVVJ2dnc2SElUdnAwVW1uT04zWDRBMk9vUWVqbUow?=
 =?utf-8?B?dzBVTmFva0h2TS9jTmdXeXllY0xMdk9LUHJ5NU8zeUdlZnY1K25haTdvMnh2?=
 =?utf-8?B?WGl1VFAybDFhdTZCRzBLSnMvSEE1Z2NCRWZpYnBnSTdlR2ppK3NiMzhIaTNE?=
 =?utf-8?B?TzFtcWtnM3kzdUsrQWZGdllvaXJHWHdYR1hERHRPU2E3WnR6RTJQNUFnT05r?=
 =?utf-8?B?TUNTMnU3Sm5EZy8zNXVtNmRMQXVtWTl2YUx2Z0tLQTFBTHRrVlNTUm5PaU9M?=
 =?utf-8?B?SkNmTnNhUUNUZE9yNWViTVd3T21pUGtRV1FRYXNOcU9LZ1A0UHcrM3F5MEZN?=
 =?utf-8?B?U0JrWHluYzVYYkNOL2dubXRQR0s5bEFxWGo5Q3RwZ3pMY3FEV0s4STJvL0pi?=
 =?utf-8?B?ZURIa0VvdXZRUTVrTy90Wm94d3poY1lWYjNRN2FEbk5wQ0ZoTFVHYysvRlpo?=
 =?utf-8?B?MWN2N3A3U3ZYTTMrMS9HMEpjaXh1KzhwOU9uNkY0Z3cxSzhyaGM0V0hTcEx1?=
 =?utf-8?B?cTlYTGVOR1NFUWdDWElqbkFNM1paWCtFeGlSNkkvRnNtZUUweUhJOE9mOVNh?=
 =?utf-8?B?UGp0NHFXVFpaMEFJUW1PUi9uZm4wWWdEYTRQRks3OWlCeUc5Zms4OHJkOWFN?=
 =?utf-8?Q?tH8k+efnUdlzBZ3+wUzQuYZOu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38acf3e-3211-41c7-dcaf-08dd98448806
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:50:26.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uS9KcQbFVVTOTcyajYPiXemo0nCynPu2/ofgi2BJi4cy0BUpJ/TsDmsn+/s5nfYm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148
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

On 5/15/25 18:17, Tvrtko Ursulin wrote:
> 
> On 15/05/2025 16:00, Christian König wrote:
>> Sometimes drivers need to be able to submit multiple jobs which depend on
>> each other to different schedulers at the same time, but using
>> drm_sched_job_add_dependency() can't fail any more after the first job is
>> initialized.
>>
>> This function preallocate memory for dependency slots so that no ENOMEM
>> can come later while adding dependencies.
>>
>> v2: rework implementation an documentation
>> v3: rework from scratch, use separate function to add preallocated deps
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 45 ++++++++++++++++++++++++++
>>   include/drm/gpu_scheduler.h            |  4 +++
>>   2 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index f7118497e47a..b95e7089aa70 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -858,6 +858,51 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>   }
>>   EXPORT_SYMBOL(drm_sched_job_arm);
>>   +/**
>> + * drm_sched_job_prealloc_dependency_slot - avoid ENOMEM on adding dependencies
>> + * @job: scheduler job where dependencies will be added
>> + * @id: id for the allocated slot
>> +  *
>> + * Sometimes drivers need to be able to submit multiple jobs which depend on
>> + * each other to different schedulers at the same time, but using
>> + * drm_sched_job_add_dependency() can't fail any more after the first job is
>> + * initialized.
>> + *
>> + * This function preallocate memory for a dependency slot so that no ENOMEM can
>> + * come later while adding dependencies. The index of the preallocated slot is
>> + * returned in @id.
>> + *
>> + * Return:
>> + * 0 on success, or an error on failing to expand the array.
>> + */
>> +int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job *job,
>> +                       u32 *id)
>> +{
>> +    return xa_alloc(&job->dependencies, id, NULL, xa_limit_32b, GFP_KERNEL);
>> +}
>> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slot);
>> +
>> +/**
>> + * drm_sched_job_add_prealloc_dep - add dependency to preallocated slot
>> + * @job: scheduler job where dependencies will be added
>> + * @id: the preallocated slot index
>> + * @fence: the dependency to add
>> + *
>> + * Consumes @fence and adds it to the preallocated slot dependency.
>> + */
>> +void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32 id,
>> +                    struct dma_fence *fence)
>> +{
>> +    fence = xa_store(&job->dependencies, id, fence, GFP_ATOMIC);
> 
> Add assert that the passed id exists (was preallocated) and is NULL?

That is partially done by the WARN_ON below, but I couldn't find a way to check if the slot was pre-allocated.

> Also, if someone preallocates and does not consume the slot will that confuse the iteration in drm_sched_job_dependency()?

No, slots with NULL in them are skipped by xa_for_each(). I will add a comment explaining that.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>> +    /*
>> +     * Be defensive just in case driver messed it up and used preallocated
>> +     * slot twice.
>> +     */
>> +    if (WARN_ON(fence))
>> +        dma_fence_put(fence);
>> +}
>> +EXPORT_SYMBOL(drm_sched_job_add_prealloc_dep);
>> +
>>   /**
>>    * drm_sched_job_add_dependency - adds the fence as a job dependency
>>    * @job: scheduler job to add the dependencies to
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index d860db087ea5..0286e0934317 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -632,6 +632,10 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>                  u32 credits, void *owner);
>>   void drm_sched_job_arm(struct drm_sched_job *job);
>>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>> +int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job *job,
>> +                       u32 *id);
>> +void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32 id,
>> +                    struct dma_fence *fence);
>>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>                    struct dma_fence *fence);
>>   int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
> 

