Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9762C31706
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458DB10E610;
	Tue,  4 Nov 2025 14:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yCuEbFEZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AB210E60E;
 Tue,  4 Nov 2025 14:13:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpMsHZ7CtGnyYKl9FtRGDfYnLaNK/lZ2zhpoOKGjrjvbllvdsJhTrQZU1tiRI1WaNgdjKJ6O1LdnXYw9vAHV6S7dLbJW8enmcUdMxpCpewrVjlgjn6MOzqrGpSrTZe8ioqhH2zUrCMS0aYLnRn9D1g7aGY/Xb0iIh7nt41Lph6IdPTqtyTe6qCWjOCU+AoGMByWgPf4dPhVnAkbGeIdyECIS36JGalKIXqbdIPziI29EWKeuxFCFPot1mI01NvQ2tpFAPCNO3bYMRENUf6L78gRvGAlxAzT1evGj7tW18fg8fDNhYtuZP0cHSXEYViGMw3vbVFoEUToTqXkvcW5ITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIZeaH2b0DzNanqeQBJ+aciF/CjScye7lkNVhm1UeJw=;
 b=DxC9pC8MItq2vUBunpsHR34xPAsaRWy/7x1KjSpGqaYaYR96y0WcShHwl2G7RVEdUzDbfkFxIHvRihtiegqRQu0F/NBdyIclsEeIIzEDmcxHC7MUgozqcHfUkYJ0q2KErPCcR3qvM1+tP7ijagf9irVTdCnvp1x6BaBgmrKDPc5SZsgKiWaV+MO2iDskO601tQpV4Qynd2VIl1adiDLK6y59TddJNoX70dSFLkZ2cp7GP0PpkzV4yYZ7XrAyVWNXA/4dJZ4MSU4M/HlgLwv7Se40lyUJ93dM5pndq00Xh5Q6uP4yOtinrJyVtTTSez7If/BHxF4jefGj3jKAVdP/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIZeaH2b0DzNanqeQBJ+aciF/CjScye7lkNVhm1UeJw=;
 b=yCuEbFEZ6Uemi4Pp/O1b8IYauTE0XRQUbHFMgv3eMLf5j5/TtgbwlmClp/BYmPihLdSz3ZOpKXE3+x3q2yFZwZZCR//ghGKYrwjGUKTGhYSUMqoqTzPdXTBPT0LdYc9u6jxZv1PxAcAcDiwg05gQ+Rht2f1VEtS1iHxvyxqIJRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY1PR12MB9700.namprd12.prod.outlook.com (2603:10b6:930:108::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 14:13:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 14:13:07 +0000
Message-ID: <4bf843a9-9727-43bc-adb2-66402338dd15@amd.com>
Date: Tue, 4 Nov 2025 15:13:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/20] drm/amdgpu: remove direct_submit arg from
 amdgpu_copy_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-4-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251104083605.13677-4-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LV3P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY1PR12MB9700:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b19c22a-3db3-4def-b31b-08de1bac46f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2FwbTQ2SE4vQWpCSDFaNzI4Q3Z3L25DWEhtWit1YnRzbDRPS29tRkc2NnBt?=
 =?utf-8?B?ekg0djMwUmdhWTA2TDN0UU5TZ1lGeDI4RS9tTDJIOGQ5ci9IOHhkdjk3WERh?=
 =?utf-8?B?SHp6UFRSVXc5cXJMK1dCRDZZN0Z3aVdQYjE5RXdvNGVxM2xLRkVjVWVlMGwx?=
 =?utf-8?B?ODJsR1pHWXNRUFNWTG9kemJWQ1VrV3lOK1RGWVJCSHpuU0RoWWhaaXpOcGt6?=
 =?utf-8?B?WC81RElZWEI5cmtRNjF5L3pOQ3ZGQ3lTMW9ucVBnbTNjU29aR0EzNHZjVDQ5?=
 =?utf-8?B?azA2SnMzSzZmYzhld2FPTmNPYXNCS3BUM0FQRnhobC9OaWEzUnBHWnNVWEZG?=
 =?utf-8?B?OWZjVGVDSmUxQWxON0FXMDFXTUNEMnh1RFBGVHlTUjlNWndCcXNTVmVvaGJN?=
 =?utf-8?B?cWFYMkVYbTUrRkx4bGVJMDIzOHB4SlRmYjJGc3V0K2Nmb2twS2RSdlAybVJ6?=
 =?utf-8?B?a3dERzFZQWZ2V1lZL1VRaVJsaWpwNjRzOVppQTJ6dzdEQmUzNlEra09VL1g0?=
 =?utf-8?B?TnZPZU1oaUl2dWxPL0ZZVG1zWTZoWnptTTVFeU8rY3pNSlpUOTJqTCsreWpq?=
 =?utf-8?B?cnBKRGh5TTVZQTJrdEpja2RZc3ZJTVFQNUx2TnNYT3VaRmtuaWJTcForbWJ3?=
 =?utf-8?B?Q0NrZFZ1bVVQeVZ2N0IvRGoydW0xb0JoOWtWL2ROOHUrNE5YcmJLYXhReTk1?=
 =?utf-8?B?TzFULzZJWlp5QjMzbHEvbndoR3FmVU8zZCtPZ0t3VjNoa1JmNzhNSnRENkZm?=
 =?utf-8?B?SFZpVjdId3pJYlVJYVdkd3BuQTBFVUw0OCsyYVI3T0xzemh5aVFQL2VYbEc5?=
 =?utf-8?B?dFFkTUJCa29RMHFERkZOcHdIYkUwajF5bmVLQkRtYVFlcUpKejVTUU1uVTY0?=
 =?utf-8?B?SnlEN2pJVlArOERoaTJadENURkptbldkZTRLdGdYeGdocXluMUxpNWpYR3NX?=
 =?utf-8?B?RHk4WFBiWXZSTjhSVFgzdU9SN005ZzlwMW5CcThwSVhRRHp1T3Jqa1pEcUJZ?=
 =?utf-8?B?R0t3RUk2dGFrMVZabktQL1g3em8rZEc4THlQS2lIZjQwQ2x5aStLS1NkUmsx?=
 =?utf-8?B?KzdmVGhZTVVpd0RmOFB2QldtM1ZvemVveDNmaGNvVC9FbktNZnJrQzYzcXJO?=
 =?utf-8?B?VWpIU3NZMThUSU5uMjF0cDNCTnZ4dTJ3SkUxVFhzblcyRG9lTGFLMUZHRzRY?=
 =?utf-8?B?Vll3TmpHcjVHMGlDREUyYTZjMEFvMkRYK1FhQkpEaFRONUNSdFhwTnNyNjJY?=
 =?utf-8?B?eDgwNmJLNHdKRHdVSXYzMEJ4WU1JcFZrYU5XZVYxYjlwdi9MNk9HbVIrTTFU?=
 =?utf-8?B?Sit3ZURDRXBXSUVRd2wrNk5nRTdUNGpvc3dzWm9qVHhWV3FqbUpzUHZDK0FO?=
 =?utf-8?B?WEhMM0pHSmNWL1RseTV3Q3ByaGNJRUhHcGxyejdkOG9XM0R3ck5FSlk2SytG?=
 =?utf-8?B?MUE1ZjRZMHovYmtCYU5NK1pmdkhzREJoZ0JOallBeFhCU0wyOUJiN1ZuU05x?=
 =?utf-8?B?Tjc1N2RhQXpRcVp0TkxPb1V4TUV5S0VJYWxsdFZMMG03ZWpZbE5odU43TGJn?=
 =?utf-8?B?YWE4R2g5QjI1cGZaMWdnRVJ5WStyd0hjRXNMcXRYRXdmSzUyaEcza3BmOTVD?=
 =?utf-8?B?VzBCaEhFZGxaU3M2cjIySTNpRVVUQ25NaUpvWm1CUHBpclFnMmQwZVp1NERk?=
 =?utf-8?B?QnJZbVcrQ2R6YnJBSE1uSlcyaEtlY1ZrYUpQeGFtNUczanQrUnlmRkcyNXFu?=
 =?utf-8?B?aWxwc1EvQ0haU1ZxQ1pQTURDRDV1WjlBSVZCY0hDY2EwdWxLUFpPUFVwcngx?=
 =?utf-8?B?c0lqdE5mbXpLZmo0cWtxQUxVMnNGY0xsZnhUdWFKancwazR1ckN1SWFiaEcr?=
 =?utf-8?B?Zm9sdm5XVlNLRG9vRTNrdlJkTTY2N3F2a2M3Y2xIZ1ZsMTdseTRYMUpvUUJ2?=
 =?utf-8?Q?G6JnSsfM0X49+jgFy2Yh+hJUo8SGz49b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDJWZUVtTEgxbVpiOXJYK0ZnWndWVmhtMEpqYUpYb244V2Q4R2JvbTA4Z3Ix?=
 =?utf-8?B?NGhkRDhCZlBxQ2ZoWStPQWI5c0FaRkNPa0szN2pMcXRsbVBpM1V3bnRjTVNZ?=
 =?utf-8?B?YXBiYjVSaDNYSDNwQ2laeXNiaWI1YkxMV1RDakdBcWp3RGJ6NjE2STRJSlBj?=
 =?utf-8?B?Tkl4cGIwaEJRRWVxMlNlamtmaWtqSFJDaWNoUFgvRHFud3cySEdTZE9nOUVZ?=
 =?utf-8?B?bGhTNzZYWHorekF0YW9qWnJGczJQYmFkcFJIYm1ITDRlWFRCYWVDYjB4R1hT?=
 =?utf-8?B?K2VDR0pHS3pvSEthRVlYaWNBQW5BVDBQSHI1NE9oYkkrSVBweXpnekJWTHlz?=
 =?utf-8?B?MWxZTWtLQkh1a0dYaDlKUktTdnpHMjB6cE5tQmc0Mjg2bEhpdzBuTWMzdm5J?=
 =?utf-8?B?UDBmSkVXazlZQ0w2N3hyRzFKWFhXVlpUcEtSYjZqeFpFM0o2bHFsRVJMcXBS?=
 =?utf-8?B?bmpTdVAxRnlGM1JQYXlTWW0rWjhTaWJNVWlIdDhOVmNsaUF5aUVYbUN6bDdn?=
 =?utf-8?B?cVhkblpyMkhmRWxhazZ3SHNwWUN1bFQrK1pTZmNMSS9kdStaeEtobHcvRFhZ?=
 =?utf-8?B?T01BN25ta2ozRXlPVFFueU95YWR5bVUxVjA0Q0plMFVPQlVvc3lRSWg0d1Jp?=
 =?utf-8?B?SUE4Sjk1dXpJZU1Wc3dQclYwcVFsMTlBR3ZNSVNvazNGL3A5OHFxYTRrcmp5?=
 =?utf-8?B?RDFIVHZVbndMVGYwMGV5SjlaZTZYdTFoVXlSRHBHcUhkWDJ0OXJlV1M2TW53?=
 =?utf-8?B?WTl4VjRrNjBlZ3crcXVDNlVWeSs4RkhnZk5oU082MU1SSDBVd0E1UDlLU045?=
 =?utf-8?B?OGlOUGpYb29McVBuL1duWTV6YzlJVDhhM3RHd2VLaFRiNmNhYXcvdm14UjM2?=
 =?utf-8?B?azJOU1pLSDJKc1pHbHlOcUhNaHFjaTJEdThuT1d5UVRNZXo0MjJ0dnpsdFV3?=
 =?utf-8?B?VEpOa051VU40NnIvWjg3bC94bEJraFd4YjcwN1o1MmswM0NxY1VNajgxRkxL?=
 =?utf-8?B?L2VPRm9idHhQejdzNVNsQ2grQnFGOEY5VDllRHRobElGOVd6WjZYVk5vU3Nn?=
 =?utf-8?B?RWlqYUFJUVNjN0hRTWFoVm1XQlAxWWFzakhQMzdwTDltakozZjVhMThzOTJF?=
 =?utf-8?B?a2REU1Jqck1NZnZ4bkx4YXQ3UzI2VHl6cExxbEhLQXoxZ2FFaWVLNktlQUU3?=
 =?utf-8?B?a0dtNkJnTzNkQ1F5K3hZTEFMRGJQekJaL0RHMnRIZjBjb3hlS0ZrM2phWnA0?=
 =?utf-8?B?cnAzaDlZRWhRMzdRb1RKL1FUWEx3SDZzb0hGUWF4U21weHFZTm5MVi9FZity?=
 =?utf-8?B?Q08xVXVjK1BLbTdrUVoyNVVUSS90SnVhK051OVdZbVBLQWpJdGFwRC9makNN?=
 =?utf-8?B?ZWpMSWpBUTgyaGJkUFgvR2laOGlmTW5OWHlrN1pUOGVnV2ZMNlVTZVlvc1d5?=
 =?utf-8?B?THpGRDZCSXVzWm1PbmFEeEdsVk9aTE95STUwZXQ5aW1VSHhXOW8rMHZwMEtl?=
 =?utf-8?B?Q3crVlhVWDIxLzlNOHpFeDdTSzVKNHlMZTBVanpKTFRCRWszc0xvSjdPTUNF?=
 =?utf-8?B?M21GZWpkM21YL3lPV3JpODRlUGp2c0tyeDJKZFVkeWFYS0ZuY1Y5dHFTTVlG?=
 =?utf-8?B?VlZzeFZqTXZxTnhVSURGeUJXRVFZa0dtNzBHNS8rMDdXNElRYm1VUU1nNUxm?=
 =?utf-8?B?bFYyK2VjdDdTRm4xRFZFemJZVG9PNXc2V3RoRGgwcVpvN1NiZkF4K2prOE5o?=
 =?utf-8?B?TDc1ay9raVFXZ25xY1NqcWRxSjVhYmdSKzFuVkFPcjlObTlNSkEwZGFJU1J5?=
 =?utf-8?B?bG10T255eUswNW8rbFZIaEhTOExlMGhVbzZtM2VyY2dOZTAyM3hqL3l1ZWlU?=
 =?utf-8?B?WURjRXp6WUVYV2RmWGhRaC9IUE1Wdm5Rc1pUWDBYUmgxUlQwU1ZuWWNkb200?=
 =?utf-8?B?NHhXK1QrZ2ZaWTdkQVJkVDYwRzZydGFmZTU1RmRQSDZXQlVlc08yOTR1QlRO?=
 =?utf-8?B?RGd3QklldEFsL1lzWTlYUk5maXRBeFdHbUxWdUhjZWpHUG8rQTA2RGFQNW51?=
 =?utf-8?B?OXdDQ1JXVDdzYXlDRTllaVBQNno2QlQwdEgvMlRINnpoWkQrbWZrb1pVdDBm?=
 =?utf-8?Q?wbSgl6vPmUslF3TmDrQHiQRsL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b19c22a-3db3-4def-b31b-08de1bac46f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 14:13:07.4285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aq6oPjjoeevJi1f4xnuEWZJ7O67VyT/dP9ouuIWEdINaFXYA4DYxx/Eh7l0KHIXK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9700
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

On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
> It was always false.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 20 +++++++------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  2 +-
>  4 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index 199693369c7c..02c2479a8840 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -39,7 +39,7 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>  	for (i = 0; i < n; i++) {
>  		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>  		r = amdgpu_copy_buffer(ring, saddr, daddr, size, NULL, &fence,
> -				       false, false, 0);
> +				       false, 0);
>  		if (r)
>  			goto exit_do_move;
>  		r = dma_fence_wait(fence, false);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c66f00434991..fce22712396b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -354,7 +354,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  		}
>  
>  		r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
> -				       &next, false, true, copy_flags);
> +				       &next, true, copy_flags);
>  		if (r)
>  			goto error;
>  
> @@ -2211,16 +2211,13 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> -				  bool direct_submit,
>  				  unsigned int num_dw,
>  				  struct dma_resv *resv,
>  				  bool vm_needs_flush,
>  				  struct amdgpu_job **job,
>  				  bool delayed, u64 k_job_id)
>  {
> -	enum amdgpu_ib_pool_type pool = direct_submit ?
> -		AMDGPU_IB_POOL_DIRECT :
> -		AMDGPU_IB_POOL_DELAYED;
> +	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
>  	int r;
>  	struct drm_sched_entity *entity = delayed ? &adev->mman.low_pr :
>  						    &adev->mman.high_pr;
> @@ -2246,7 +2243,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
> -		       struct dma_fence **fence, bool direct_submit,
> +		       struct dma_fence **fence,
>  		       bool vm_needs_flush, uint32_t copy_flags)
>  {
>  	struct amdgpu_device *adev = ring->adev;
> @@ -2256,7 +2253,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	unsigned int i;
>  	int r;
>  
> -	if (!direct_submit && !ring->sched.ready) {
> +	if (!ring->sched.ready) {
>  		dev_err(adev->dev,
>  			"Trying to move memory with ring turned off.\n");
>  		return -EINVAL;
> @@ -2265,7 +2262,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
>  	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, direct_submit, num_dw,
> +	r = amdgpu_ttm_prepare_job(adev, num_dw,
>  				   resv, vm_needs_flush, &job, false,
>  				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>  	if (r)
> @@ -2283,10 +2280,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	WARN_ON(job->ibs[0].length_dw > num_dw);
> -	if (direct_submit)
> -		r = amdgpu_job_submit_direct(job, ring, fence);
> -	else
> -		*fence = amdgpu_job_submit(job);
> +	*fence = amdgpu_job_submit(job);
>  	if (r)
>  		goto error_free;
>  
> @@ -2315,7 +2309,7 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  	max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
>  	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>  	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, false, num_dw, resv, vm_needs_flush,
> +	r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
>  				   &job, delayed, k_job_id);
>  	if (r)
>  		return r;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 577ee04ce0bf..50e40380fe95 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -166,7 +166,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
>  int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  		       uint64_t dst_offset, uint32_t byte_count,
>  		       struct dma_resv *resv,
> -		       struct dma_fence **fence, bool direct_submit,
> +		       struct dma_fence **fence,
>  		       bool vm_needs_flush, uint32_t copy_flags);
>  int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			    struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 46c84fc60af1..378af0b2aaa9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -153,7 +153,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>  		}
>  
>  		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
> -				       NULL, &next, false, true, 0);
> +				       NULL, &next, true, 0);
>  		if (r) {
>  			dev_err(adev->dev, "fail %d to copy memory\n", r);
>  			goto out_unlock;

