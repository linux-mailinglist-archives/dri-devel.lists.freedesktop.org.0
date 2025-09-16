Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE86B59214
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7783210E753;
	Tue, 16 Sep 2025 09:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WHyCsCYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010025.outbound.protection.outlook.com [52.101.46.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078BF10E76D;
 Tue, 16 Sep 2025 09:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/FcGxFK6jyVBfOiEPKLPz7cyX4hGg0QHewuas5/QnXQPLlu2qqB5rvlf9j8HHtye94vSSCKNqfe9Yu9djQ9juXIb/EcgpMF0mKKksFGUn2CN47xaLRxT9HaTRNs+ztKq4PSQQD+74g2mlDBXyJwQ+ouY/DepkDEvMZ92ZVGV936DpiPXVwXx9cxrEI77gBz7DrTe2BI56ZI+rtaEG82pjifemmII7pat6i/8YEiu/l/PKlJFiqTh8PB3MNnPONiQ9O7wGzvv1NTVaL/0pMpEfmju5wtvDi8noxwyXGmHDnw2fNZH187lkBbZK/T6vwYiiqGuigqwNIkzzmI8PtMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnnHTN28vrDGHuSct+UswkaDW4QJeRFlsVaTt0HmooQ=;
 b=PLSIhQXwH6twf0EoATiSpNa5BdiHQiMoFsKtsM2hyfSLf4M9Zh6sfwEA664tcCIGl6S/5riUfWD1GYuaK613SqSZrdgxyleH3JM/RhAxQS53ptOQFoJC+oXqZHWJbRKQHvwqtEgpAG5oFsS+i1XI0zd9Ny2BhdwWaqNh598psBgWpxDuNCdhDSm7mO8qyXD99yAyOEQTJcQH6xsmYTm8TXNcFREcTo5/OVjDaCcxO1SebLBDG7BKL4tsDEO6WtTcJO99oj6/06q0DTwUoW1tmxLcvDGSPVJeHF9cEyM/TByHsowPsJkzHDECWiM21eNwkAC5pCEnWCelm4+ldussZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnnHTN28vrDGHuSct+UswkaDW4QJeRFlsVaTt0HmooQ=;
 b=WHyCsCYtmlNbgcaXQD5bcKGsx+UHMpUdpoJRgZBZDM+VOwwqGtOyTXJRqe1O6Wk8eleZtnzeQpGgdlbovJVBm8G1e6YDHiT3RNRCh4i1wY+dixV4wYhedDNlQXiIW1Ui8pPy6ac55ZmvU3Kn6pyDi9UhiRhY/c5hfZLqo7ewWa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY1PR12MB9628.namprd12.prod.outlook.com (2603:10b6:930:105::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Tue, 16 Sep
 2025 09:25:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 09:25:11 +0000
Message-ID: <f66cc34f-b54b-4f91-a6fe-11a146c516b2@amd.com>
Date: Tue, 16 Sep 2025 11:25:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu: make non-NULL out fence mandatory
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250916070846.5107-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250916070846.5107-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY1PR12MB9628:EE_
X-MS-Office365-Filtering-Correlation-Id: 19091c16-09da-4462-043b-08ddf502ef2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzZub2QrTjRyZUlzdFU4MjRTOStmRGVYV0g2LzFBS2hCSkU5YkhUZGViRmpN?=
 =?utf-8?B?UjlnSUI5eGlrNVVCL3lSZ1dxY3c1Tmt3R0dLb2VvRFlGbU1CMkdIeDMvR3hL?=
 =?utf-8?B?aU5ZR1dVdE13VU1FNnBrcU9jb3dDTEhpTnluM1RPNmhSZkkxbHlBbitHV0kz?=
 =?utf-8?B?MjFSNGhPWmloSjVXSmw0cCtpcHNrY1NHN29lSzJ1V3Z5WFY5YkV5bmpDaHg5?=
 =?utf-8?B?dG1zTHJSZlROSHhMY3FDU3RadE9iQzl6RHBwRUIzQXdiS3JpUk9VQXVNb1Jr?=
 =?utf-8?B?aGlHTmU3aHJIZnR5Sk9XNXNrMjdCaGhZUDZmaVMrMWwyVTdkSWlEdnY5SUlD?=
 =?utf-8?B?RGZlYXgzSkF0Y0RxdlFqU2tueDNZZlpwL1VMdU1idEZpRWFzeE5YUWNhZ00y?=
 =?utf-8?B?aFQ0TTN6bW9heWxzek1RYXdDa2xSVWFnNzZiM1BRVUZzM1hzWWtOUzJ3V0Vl?=
 =?utf-8?B?ajI0VzB2TXZRY0xGWnhuQVpkU1Vxd1AyQlFnZUNnZWcrM0VPOFFwVkxIVXIv?=
 =?utf-8?B?cGE2VEc1eEFxWVZsWExqemliNzQvTjdOVTk3SjYzRGY3T1B2MkFEN0c0Y3VG?=
 =?utf-8?B?YWZvWmtrQkxiMHExNWVJcE13NXBqaTFaVFlDZG1nYVJ2SUFSNXExTUxUVXZ1?=
 =?utf-8?B?ZFpYeC9nNEpRMGxYZFh1SlFtSGNXZ2tGdmNuR3NpQTFweWY0bk9BTUVSQ0Jl?=
 =?utf-8?B?VjFpeE9NbmFQWTEzaEdSeFRtbjdFK2JYRndEZjZ3bHRGUTlFaWpvWVNJSDJC?=
 =?utf-8?B?QVJEQmVJckE3R0FKZ01lRDNhVnVDRHIyd1RJdEN6M2xscVArcHNJdjNlMW1T?=
 =?utf-8?B?VXF5azQ1TDZxcko0dWVTMlVyN2tGWkV5S2lQbjJqbXlzZmVnRkNtMEgvOGRn?=
 =?utf-8?B?eS8wZy9xc25keDBnRHVjeDVEcW01dTlqcDR3RExsRzBiSnBGb2Y3dFZwMEJ1?=
 =?utf-8?B?WUZhb2cxS2g1Z29kdEY2SXRkRWp0aEpVTEFFK3gvUkRUYWNnWVQxaXlqWlov?=
 =?utf-8?B?YUdwS3NHay8xd3pBTFI1bkplY0o2azNnaG52dEJoeWZFZEFCNU5jWTZSb003?=
 =?utf-8?B?WWRPUElYUWZuSWhxYWh2RlFVbWJ2KzF4ejlleWRZNEJKQkVoWWxSSWEwNU16?=
 =?utf-8?B?MGNWS2NNNmFJUXI5NFVCekxTRTVIVEwxYjJjelIvaWpJTjYyQWhFcktNUVRI?=
 =?utf-8?B?WiswN1pXT3FKNzBKb2dPNExRaUFFaXlFMzM5dGZGZGNrUHo4NVJBSG5adVlO?=
 =?utf-8?B?MkZST21CeFhsMXdsWTlkSEhvNWtmaWFtNEtNNFo3dUtwS2hzZlRVTEVkSExZ?=
 =?utf-8?B?a0xTMzNDYTNlWWw2a2ZBL0hMRnorL1VpdjBudUhqMDhrNDIzUFc4OWwzdkRM?=
 =?utf-8?B?UmFnMUdmYWJ3WHBnQm51REVjcHhSbENTVFZmTzFVYWE0dDRXY0Nqa1FlTTJQ?=
 =?utf-8?B?SitUWWdYb2FpTVc5T0lqYm1KMVdyUng4cm84QzFTQUtRbVh4RmZLTVQzNTVn?=
 =?utf-8?B?bHBza0Y3S256OWRFQWFadTYvWE1uSjdNa0dib3ZocFNwMlRYY2Y3a2pkNGxI?=
 =?utf-8?B?NUk4TnlINTVLcTg1RzV2V2cyRE5jSFB6KzlJREFDdkZ0ZHVvbUxDcXZVVm5B?=
 =?utf-8?B?dWdFSXFpTkt5dFpuUFc0MkdCaVFNOVpMeVdZODI2NjVWakhQWERSVENJa0lx?=
 =?utf-8?B?N1QxaWJpMHU3L0dmUnoxTEZmTWhlaFM5VzZFbWRMZ2NJZzNZRGtIY1ZWcUVE?=
 =?utf-8?B?UUphYjl4Wk1jNFJHR28wWUdIWFRSQTFJTndtejdxenVCYWNldUExSzRBWWJ2?=
 =?utf-8?B?cTJWRjJMT0pvd2REQm5qM1FPOVJtMWVEQUZvQUpHQmZpL2dWNHdoZ0hYcW1M?=
 =?utf-8?B?ZE9Lc1dqVGtDaUowQXE3MDl4MjlIbmR5SVFmSUNBdkxGQTBKYnlISjRQeWU1?=
 =?utf-8?Q?iTd7wLIwi04=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW5CQ2Urditva0FOVU9ETnNOUjJuREZnVk9FK2htRWhpeFVNVTZRcmZ2MmRy?=
 =?utf-8?B?YlY1T2hwUis3QzVwa0xNU1MzcENRVEo0cWF0bFpwMWo2dVJqb3dFSUdqd0ZR?=
 =?utf-8?B?dFBvVnVxbHZmV0xZMjdXT0ZXaStuVnNxSy9MT0d4bjc1VG5KZjdmZUx5ZEpS?=
 =?utf-8?B?cTF1Y0Z3RzJmajlnMHRWd21tUWt1cXlCKzVGQ3Vqc1lTYkRmWEc2bHRBS2pY?=
 =?utf-8?B?ZlZoQjMrOGQyUzN3SS9pQXd5YjVwOUd5ZWNpUkU3Wks0aFVoYS9WaThyUVBy?=
 =?utf-8?B?dzhQUXE0dGtUL3JSSXBLQTJNTmlEMmhaOWYzVHdVSTkxMlZBY3VqSjVmZGFW?=
 =?utf-8?B?bjRjem1GeWo5VnhLWVZvRnJnNkJ1Wlg0RFpmUW9pVUZnWW5rdG52dDliQ2Z6?=
 =?utf-8?B?NXI4N1dVS3NVdXFuRjZVdER4cmltQnVvNk5sdmRxTUc2eDd5UElNbitQbEtx?=
 =?utf-8?B?SEhjMGJZY3JPMmhRbUVLbDRsenQweWtvV2RSQXBmTk93eGVKVVRNQVRxYVdS?=
 =?utf-8?B?VTZiUjBoTlpGTVM3cmZpcjM4R252bXZ3d0JkYVVtK280N1MweVJ1T3RmWVpo?=
 =?utf-8?B?WTZoTCtvV0FhUmc1Q2dFcVVGZVdWUC81UEh6Z2VITEh3endQdCtOcDdONlNX?=
 =?utf-8?B?NzJwRm01bm15aGdsdFk3K3RJLy80RFVOYWRYNCtXQ3lTK0JkUmszTGUwWEFk?=
 =?utf-8?B?c0J1Zk01ZWlweTlXVDF2Q0h5SFFpODlTbFhPUm1vNXlNQTNVekoxZWVsbmps?=
 =?utf-8?B?QTRlTzdZTDhXYW84WmlZV21vL0hEeDdPN09QTlJ5TmRvT2JBWnI4eXlxT2g5?=
 =?utf-8?B?dk5EVHBLWFZncm5FaTBBU1l3R0JCdGVqSDhiOUtVOHBOZVZaRFdwNCtHa3RQ?=
 =?utf-8?B?VTBNZWhCcDhaL0VqdlFDY0FUTFhhbmlLZTZTNVFLRVUvMk0wZmNWdVdmZkhz?=
 =?utf-8?B?RXBsdTROM1ordlBtTFJOcG1FNE4rbXJubkxnQ3dtWllDdElMaDZTcTg5Rlp0?=
 =?utf-8?B?Qk5qNDVqOG5adFlJeEJldXZtT1B0Ni96SmhZeCt0NzNIYy94T1M1RmdYSnNO?=
 =?utf-8?B?RnhqTmkveEtkeHkxU3FrRTk4c2xnd1F2M2tiYmduM1lJUjFueVBwWE1DcWRS?=
 =?utf-8?B?bnhhaGg2VnNnVTdwS0RsclZJQXVsbDAvSTBvVDVvMXRtcEZYMG1EOU01b3hV?=
 =?utf-8?B?QnoxazdiMmkyNkhaV1Z5KzZQaDd3YURjcUJncTZaeitGbmFyVHMxZ0lxOWl0?=
 =?utf-8?B?bVgra3gyZjFOeVFEZjlBZWJNQnBUZFo4SjVjY3A2UEJqanZCV29ZNGx1Q083?=
 =?utf-8?B?dCtCeUxMWkl0U3lHOC8yZVRtOTFJS1VZRnpRNTd1MUxKQzU4V2RPOGVzQktv?=
 =?utf-8?B?b0kwYzczRVJWVzdxWWhVZzNMVjdNTzJIZG9FdDFyK1hrdi9CVjI1SlZSQUxK?=
 =?utf-8?B?QmVjV0Y2UG5HMThSa2ZwZnoraDZzd0xxWkt1SGpFM1h1Q0pGeTNCS3p0dUdQ?=
 =?utf-8?B?Sm84NFVkd2NNMUR1RkFUZTZ1bHNvSldBakgzWG1wclhzd0phbEdpbzdUSDhE?=
 =?utf-8?B?T3BzN1l5ZTlBT0tvLzNGNlN4L2M0KzFtTW9lekZLL0l3OUZ4UUNPcENWNnps?=
 =?utf-8?B?ZWRSVVRmWjZvNWdqaTdXM2JTMnRSNDI4RHBZTWt5QnBzYzEzcExlT0Y0RHFI?=
 =?utf-8?B?ekx2UjR1VFptYUVTR0EwTWpuS0JRakp2emVIM1dvWk1JTmFFSFJGTnFaNU11?=
 =?utf-8?B?WERlVThJK29TWFUwTit1dHdMT0k5a0QvdXpHcTFVN05aVFFjN09sTnJUWkx1?=
 =?utf-8?B?SjJ5Ym5xT093Yms0ZllqU3dMTnQxMXVlNzVHQTZQSjdjdWVLelJCZWg4TGov?=
 =?utf-8?B?YmVRRllYeGhzK0FQK3lOYjE4RTBrYmVkbzdlekt1UG9VWTV4WTFHM2I1SkVN?=
 =?utf-8?B?WEs4U0FKMVUvTGQ0QzB4c0hLK3VKekE5R2dUL3NaWmREOTdrSEdBT2lMdDBJ?=
 =?utf-8?B?dUVCV1M0S210MW1FZGR4Rnh3Y0pHMTk4ZW9sc1M0Q2JydHZvbUFOeEdoNUhr?=
 =?utf-8?B?UTBSSHRGODZjVzduMXpKaGFWU3ZRQnFlaHdxK0ptZENMV3kvZFN6RWROejZq?=
 =?utf-8?Q?VU+RbPDsVgUR/jRMYa3j76VLK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19091c16-09da-4462-043b-08ddf502ef2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:25:10.9873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXf3dQvRNFoHSiYEu0aLUtPuT+G6K8Xifpn320aHUkO5GHFKTpMmS4FlgvSVJyzt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9628
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

On 16.09.25 09:08, Pierre-Eric Pelloux-Prayer wrote:
> amdgpu_ttm_copy_mem_to_mem has a single caller, make sure the out
> fence is non-NULL to simplify the code.
> Since none of the pointers should be NULL, we can enable
> __attribute__((nonnull))__.
> 
> While at it make the function static since it's only used from
> amdgpuu_ttm.c.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 17 ++++++++---------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  6 ------
>  2 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 27ab4e754b2a..70b817b5578d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -284,12 +284,13 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>   * move and different for a BO to BO copy.
>   *
>   */
> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> -			       const struct amdgpu_copy_mem *src,
> -			       const struct amdgpu_copy_mem *dst,
> -			       uint64_t size, bool tmz,
> -			       struct dma_resv *resv,
> -			       struct dma_fence **f)
> +__attribute__((nonnull))

That looks fishy.

> +static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> +				      const struct amdgpu_copy_mem *src,
> +				      const struct amdgpu_copy_mem *dst,
> +				      uint64_t size, bool tmz,
> +				      struct dma_resv *resv,
> +				      struct dma_fence **f)

I'm not an expert for those, but looking at other examples that should be here and look something like:

__attribute__((nonnull(7)))

But I think for this case here it is also not a must have to have that.

Regards,
Christian.

>  {
>  	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>  	struct amdgpu_res_cursor src_mm, dst_mm;
> @@ -363,9 +364,7 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>  	}
>  error:
>  	mutex_unlock(&adev->mman.gtt_window_lock);
> -	if (f)
> -		*f = dma_fence_get(fence);
> -	dma_fence_put(fence);
> +	*f = fence;
>  	return r;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index bb17987f0447..07ae2853c77c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -170,12 +170,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  		       struct dma_resv *resv,
>  		       struct dma_fence **fence, bool direct_submit,
>  		       bool vm_needs_flush, uint32_t copy_flags);
> -int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> -			       const struct amdgpu_copy_mem *src,
> -			       const struct amdgpu_copy_mem *dst,
> -			       uint64_t size, bool tmz,
> -			       struct dma_resv *resv,
> -			       struct dma_fence **f);
>  int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>  			    struct dma_resv *resv,
>  			    struct dma_fence **fence);

