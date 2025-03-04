Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D094A4D850
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A2310E3F2;
	Tue,  4 Mar 2025 09:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BMO1ZHs2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7271E10E3F2;
 Tue,  4 Mar 2025 09:29:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjPt/iyupvEI+3zraYbxBeirwDx/JszqEPEAcEOmiv6ZZWSLY4fJ3lz12mibCtpNNJWLcQLSHsINcXYZ7F3nCrKJH/eXLBj+ZVcsVU7p6AXyHxx8VwX6JuAJ9mFfzdlzng1VnVQzTD2NaFCa0pWD+SLf1OFHUL6xndLJDIFSRfEgh0Rf8QNiQKupSW4TRgwrAne3KnCkBYpXfZ1W5lN2+PtzQvrQN75JqseuBUnPYsOly7a2MK40bILE0vM/GX1ItVMWg/WwD/qvoDW5djXq2HyCjF3asESHLjc/7v8/Te84Sf+YymiFEi4w/R51iAlBCxU7/Mwya3xTKLFMAPwW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIMUdytEQwRq4gRWpCoPKKvmPud0UGUi37Hui304iX4=;
 b=hzFRObTOmcbH/nIVNcNM0kwpjNTxYhzDYu+Q3Tkp3ElUJRtk0mNZQNehZmtMV0RjftCbbiCHUWO9zcjs2Vul7ByvGppTFE3uGoQ5ZYDIRHRU+GhLhqdnjoCJljcQldDDmG0Ddc2Wz2nLFeesEEN0YGSlHnUjwjp9t3DBKuHqQN3ImpW6aw3Nou6b+/08zCNDWt06/JZIAWtNMosemcBEmfEyYeaXkpj60ffKTwaBpNzoRzeHciHL/+AvXQSFzfYgUwM5Y4UvJysGNzBdupquPvwrWh0Koy2VvhTOU50a5q++lmTpHFx0nXfbryVfFxOLE07HG4AfqeZ9Gs3iUlB8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIMUdytEQwRq4gRWpCoPKKvmPud0UGUi37Hui304iX4=;
 b=BMO1ZHs2I4sC2Nb5hAE2mgJcg8hQzSxKxB0E6wPXZPMkELKCiQjpxPuStz+tIBrjhSMbe74T0WVbNFnygGKZrVXxkFvP3jIFb2T43zngqDJCzZgaCmtmx6d7EIIy4dvc9EUTo2w4UeMp95+OaGTaew2LDuXALXSFlQ/MbuNeK10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4145.namprd12.prod.outlook.com (2603:10b6:a03:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 09:29:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 09:29:41 +0000
Message-ID: <334ebbe1-6897-4946-b64c-d7d85cae765f@amd.com>
Date: Tue, 4 Mar 2025 10:29:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/amdgpu: Trigger a wedged event for ring reset
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, siqueira@igalia.com
References: <20250225010221.537059-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250225010221.537059-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4145:EE_
X-MS-Office365-Filtering-Correlation-Id: 80194b6a-60de-4ec3-f2cf-08dd5aff1765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S01JN0IxSnZYVDN1aFlhUUlhL0U3bGJrL2NEcXV1L3RwcUVwVUxvUE5jMXE2?=
 =?utf-8?B?dzdGTHd1U0lmam9TY1F3dFJscXFXUFVQanE1MkhiZjlhTC85YmFCZlcyMm9k?=
 =?utf-8?B?TGJKbjVyS0pJL0FNNnorMnd0d3U1R1lwRi9XMVBaWG02QkJzUUpvemx1OEwy?=
 =?utf-8?B?cnNGMVdUQ0ZZaGdOSmh5SFROL1BhUFIrY1BkbEl6OElNQ25YYmZWcmNIdHhr?=
 =?utf-8?B?RFVPWklhQm5KN0ZERG92NXlyYVdNVkc3bXBOUWNhV3F0VFJWOFVCMCtFdkJm?=
 =?utf-8?B?RDAySGRUUnFwMTFQWUVlSW9qeFZoWVduZmFlNU45dElybFRZM25kRm1RRnEv?=
 =?utf-8?B?c2xBcjA1dElUdmwyVDlXVzdSVTBhQ1Q2cnZDNk8yK2dDRStCdSs3VjVHVmxZ?=
 =?utf-8?B?dnAxU1JPQ1ZPOEhJRU9YNnZvYmNGYnA4dEt3d3JoMkxzNERoaktkWTQ4ZlFv?=
 =?utf-8?B?M2RVMTl0cHArbnNDU2FOM2J6SnlLQ2xOci9FR2JhN3pxQzRKdFRPb0wySHRM?=
 =?utf-8?B?RFJzUllHMnk1QXVCSHlmNDN5SVZjTGZIL3NwRHJLK1cxUjkxTVZwaXlLWTMz?=
 =?utf-8?B?bnQyRkw3VGJXZEsxekR0Tm9rZVRZSnl3VlI4d2NraFNucmY0SS9MS29SMnJj?=
 =?utf-8?B?RHhMaGc5Mlk2aWNmLzJGTTQrdEQwTUs1YUU2elJqQlZyMit5VzJjeHpqVkUx?=
 =?utf-8?B?QmhNU0pGVHFhZkdCaGx1cEJnKzJMbWxRdU5MdnAxS0dXNG5rOE9YcG8wWENY?=
 =?utf-8?B?L3Z1WlhKNEx1Y0ZFUkFya0xtQUZONVl0NUl3blp1TlJHN1h1R2JqWHJhQ3RG?=
 =?utf-8?B?VklZSzFOU0wvenhNWElOdjYxWEFWSHgwbWk2cFk0WFFROUNNdVQ3VktkL01i?=
 =?utf-8?B?ZmNXdTAxUFBBZjdITm1ybU1ZKzBBbzNXK1YwcnRmVjVTVUs1OUsrb3NZRHhT?=
 =?utf-8?B?cDhLYTBqMVV6Sk4zamZLK2NUTlpjc3lYSmpraWtEUEJuSDduaFk3Y2VVY0w2?=
 =?utf-8?B?ajNmZGJZa3lhRW5ZYnNGYWhORTJlMDkwUjV6YjNyQzRMZEtHcDYrS09memti?=
 =?utf-8?B?WmZ1UjRicXNUaHEwcjF1QWtLUVF4WjU4NXdUWmZsQm9EU1RLY2FoMzlkZjdL?=
 =?utf-8?B?QVI5MWcva1dQOFV1ZjNERGEwSE04Q0ZnbVZOdXJmbGNTd1hjNGdndnk4UW5m?=
 =?utf-8?B?YXN3Q3paSHR2ckFSWDV2Z1Z1SzJpai9sZE9XRFlzdUxWT3VySmxCdTI2RUx2?=
 =?utf-8?B?VitjbTIwWEJRbENEc1lucG9Tcm03ZnBKczdZZmh1RC9KdTZERHIzdGpVRUFZ?=
 =?utf-8?B?MFd4UXFuMTgrMUgzTUJucXBXQzFseGs3TDFSNCswRWtBbFBCc3QwMkdSME82?=
 =?utf-8?B?a0luTjYvZUxES25xOWc2dyt4V1VDRTh5NWZjZGN5bDQxRWRnQVpod0JLcTNV?=
 =?utf-8?B?dXdGcy9WWXZBNUpTZElmUk1uZEZBaVBOZWhmTSt2UnRsNHdXR0N0eDBQMmNT?=
 =?utf-8?B?TWcyYXR0M2cycTR6VUVEL0s0WVM4YmVoUjlCNTlydUkzOS9FdVUxbHNaM05m?=
 =?utf-8?B?V0lvVUM2ZXFGSklTckJ1UTZwcmRZOGpTa0FRTVpTSnNBdGlwLzg4Y3cvalVC?=
 =?utf-8?B?T0NQazNRZmwrVTN5S0hDbnVHUGJlbG9hZGRTTWJRTkE2NzJheDcrc2dObFRw?=
 =?utf-8?B?MS9KYnNOMVdRbm5VT2F2bWdCZkZTem5HaGhlRFBkc1VIcHh0dTJBVkRMSisv?=
 =?utf-8?B?cDl5Q1NTamVuYU5rRmk1cmU1ZFdpR3BvL3YrUS9TNWxxVmFTSkhpQXR5SWdY?=
 =?utf-8?B?anhRalRqUGZmcElNbUhNZzZpTlhrSGtYanVxckJpbUg3TjQreXYvcEI4U21X?=
 =?utf-8?Q?tp05nzq2QitzX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUtXckZvTFNCbEoyS1RQVWVWYmIyMS81N0V2akl3ZFlpNDF3RWVlWmF0cFRU?=
 =?utf-8?B?b2V0MWxoaWF0SG13NXBXNjBCbm9UckFENEQvaUNNZkVMbjdRclhXZ2VtcFRK?=
 =?utf-8?B?QzMwVHlBTmRFZGJ4OVJ5NkFWOTlhNEtFLzlsN0pVNjcwc3RzTWJmRUNKUzdz?=
 =?utf-8?B?ZC9YUWFRTVB5c0lxWFZmN1hjY2JsWUNJRVhRaDVsemRlcHdONmM0U0tFSTI3?=
 =?utf-8?B?VzFnMUNiSFJaYTJ3VE5QYnpkMW9EVHBiL1JUNzJTWmQrcUZpYWs4bFBIWk5z?=
 =?utf-8?B?cGg2cjJsQnp1SDA2aFJDa0xqTG9laWY1SjJCVVg3VGdXY2JQeDYrTEFGT1hL?=
 =?utf-8?B?SWdjcmFSRE5oTmtoOFU3TFE0SU5uY0JIRy96a05iVG5zRjVsRHNSYVdjakE4?=
 =?utf-8?B?ejFWMmV4Q2VpWUFpV0gvY00wUVVpbWZYNjdoR00ycndoeXVpNnIxMGhXSisy?=
 =?utf-8?B?bzVBczFHUHhuVmhqWW4rdEdaRGg4OVc5NmFqLzNiaU1vWkVBT2ROUXUxMGIv?=
 =?utf-8?B?NlFUaUhYaGZjR0VlYXNha3Myb2NlR3psclVkTzh5OXhwOEZwRC9SbXF4OExU?=
 =?utf-8?B?U2RkSVFIRnBCQ3NxL1dldXVWLzE5S1lmMCtEOUg2ZFo5OW9QaGEvdlJCeUUy?=
 =?utf-8?B?TklsMis4S3loSk9rZTRzYnNYSkRsbFlBblNqSmovalJwb2JyWDN6WWFwR1lD?=
 =?utf-8?B?VjcyYUhBMzJPTWRlaWRpQmV6TEI5RFpna0t4YjZOQXBLb3pmc0RpR29pZEwy?=
 =?utf-8?B?QjcrRDR6UHBkMUcvNGozOGZOUHpxZktpOTVjSitCTExmVXRacU5mY2o1R2dq?=
 =?utf-8?B?MWZLNTZaNHZ0dHN1YWNXdGpOdGw1NkEzVFBDSmpQSHgyOHhRZ1N0aUx3MndB?=
 =?utf-8?B?a1NoZ08za3BWV1oyYVNwSFQwWkYzT2tzQXZIRjRYSit5RGs2c0hOaUo2d0F1?=
 =?utf-8?B?QUFrVmVpaHNmMUljS2Z5c3JrdkRtSzg1am1BcVJrSXdncG9ZOU5ZT3JMd1BC?=
 =?utf-8?B?UVJOY3N0SXJoRE8rQVJCRlp0SVhTcnVVVEM3Z3ZOZFNkbWZrSzhLYXdBeHNu?=
 =?utf-8?B?c0ZPZzZkODQyNE9XcWw2eVdGOHo0QlRMNFg3Z0hHamIwUDV1aU9vUElNOC9E?=
 =?utf-8?B?MS92ZjNPL3p5Ny9UcEpwRi93dU5qWGo5KzlKRGtXdGxvbEQ2S1k1V1BYOTNX?=
 =?utf-8?B?TExOQlVVR3dqcHBoczJyTkRpRmVPM2hnamMrdUQwQVI2TW8wOEwvMjNST0NR?=
 =?utf-8?B?OGp1eDlZWnY0WS9Edkg3d3NJYzVqOXpHMTBJWDNSaWNrLzNYMytHcnRURlpF?=
 =?utf-8?B?V3RLRmJ1cUl5TXRBVnBhYVFrTGdmTmFvK3dJb2VIQ3ZUc0M3OC9UOCtFbGVi?=
 =?utf-8?B?RnM1aEU0K0hkdmh4cTVHcEVYZnpPeEZuQnNPKzMzeGd3Tk5FeWJIcEs2Snpt?=
 =?utf-8?B?ZDVCT01XTTUwZ3JEYkdpcEkycXVVRmR3ODk2clJpQU9naUt0T09pQ09NTTRk?=
 =?utf-8?B?U3dHVTUrWEgrOTNWWWVVaENxNVVEaitWMHZCZUlWZ3c4L1Fld09jOEtiWkVG?=
 =?utf-8?B?eUQ0V3VjeTdieXBKV0VaNVVmcTB2K1NwZG1Dd0FQbWFjZllDQ094SEozN2tV?=
 =?utf-8?B?SytleVFidngyR0c5MDgrVlVHdWdLWURSTURKQldGU1FWa3dqNHR5Ylg1c1N5?=
 =?utf-8?B?QU96aTNhV3d3RTF1U2lLdGU3d3YzeWhjMHZRZks1Q2tvcEJkTFowWGtjZTlo?=
 =?utf-8?B?d1BvUElVb2V3YmhHUjIyazVhRmEzRFJmYStkdkV4cnovR0RsZlhrMDh0VDk0?=
 =?utf-8?B?SVhSMytUWFdIL3RzS3U3MXdjQjlab1VjTG10N0kvK0Z6THZyam9TVkZOeFZJ?=
 =?utf-8?B?OTVSVk9WazdQVFVxR3pwTitPOTk0enlZdWxwSG9mcjlyOW1STFMxOTc5V09O?=
 =?utf-8?B?c09qVk82a2FsendPTU02VzQrUkJZM3dPS01vWmgwSVpwU1FFMnhEYlhMUGRU?=
 =?utf-8?B?QmFBeHBLNno5enl1amcrTGY3ajY3ay92bE1SbnlvL3BmeDhLU2x4Nng5UjZi?=
 =?utf-8?B?bFcwWmZZYXIvOXNJMjgzL0dRMDEzb3EyL3hXNVl3ZkZEL1NEZGVxb1ZDcW9r?=
 =?utf-8?Q?hMTtf/rCq2leF9NaAX5zMXY21?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80194b6a-60de-4ec3-f2cf-08dd5aff1765
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 09:29:41.4873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsfV2Gt6g64JkqgtN3IWdsk29P1S8gn+5UYNQAgGyVYSqHRKK9kTUCyT9YVWVF8d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4145
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

Am 25.02.25 um 02:02 schrieb André Almeida:
> Instead of only triggering a wedged event for complete GPU resets,
> trigger for ring resets. Regardless of the reset, it's useful for
> userspace to know that it happened because the kernel will reject
> further submissions from that app.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Sorry for the delay, have been on sick leave for nearly two weeks.

Regards,
Christian.

> ---
> v3: do only for ring resets, no soft recoveries
> v2: Keep the wedge event in amdgpu_device_gpu_recover() and add and
>     extra check to avoid triggering two events.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 698e5799e542..760a720c842e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -150,6 +150,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_start(&ring->sched, 0);
>  			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
> +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
>  			goto exit;
>  		}
>  		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);

