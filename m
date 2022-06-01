Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6923539EF2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:03:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C94E10EC47;
	Wed,  1 Jun 2022 08:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FEA10EC47
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngOKAOCyb572Wh9co34sJq8aTjNo2/bj5wb/5Iw7FO6f92bBs4YQIYig0GHSmYfJH61qgofF5I0sL2dvhykecAGx13ZoQsskAFJLku+tA0Hbi6fsriKky0/igOxHWscXjLSuaF3CIzKGX0jTOvqMWqE84tCBSpAHQeQS8mV+PESC++jN/IDRWQA2XpaS8tn/ZaHHXNYn1s7P1FSa2EbuVOI6FTEmtJJRfZzyFCMh0HlFUBLo+CjOqdPcIALecETpIQsvA3zqvCDnnH+M24n+ZjDe+xEBPnBTeffjl6EN8auBn+PDZ3/u8mmvjzz71a7z72CJ9eyataX2grkspPfYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELQxKPgzhD/pfI0D2iO95EABL8Ogwa8fDYjY7kTQaME=;
 b=k4mJfJZsHHb5d1duXRTV7Z0iRR4DGsvV4pnQZXwFlCoC7FKdScrpy9LK6MSwEtDRJVapaFz9YMvDSgLsZiNGMie4u1wOBKoAT8W3Z5P9L6guAf91XiKlG8AdTOgiaumtdp1b+6aa3edgDBOz4H0d4nEviNslMVQTXwsU3ljrFm2yEZYJPPjF7uzFIQrKAa4jP/zO2g/6R9C1LBubI+hCd0TGQUuHDePUA9PYbs7Rs4SyTL+rswBes3f7wCMyBSHWTDPM2sf80/iCoBW3c7a1o674mbS7fFEmfQNE0vyj/M8LtlxY/6eXfptkkcItA9AxWffr6e/WHFkA8mX7P3Y0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELQxKPgzhD/pfI0D2iO95EABL8Ogwa8fDYjY7kTQaME=;
 b=1Q+AIXJJjFnI3F4THotrs9qefiU5xmPF0gqbpyn5j5z4pkmPTmh9LFU/d29Oihg44vTMbXvXkp2FjxxHAF2TUzazykTy5ZrHH8pO5wOCP8Cdh7STe/97LEWcCVSEs6u+3dGWpS9qO2EogNlDBuQILAQmX0qZtT/JWjaBv39xRgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6323.namprd12.prod.outlook.com (2603:10b6:930:20::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 08:03:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:03:49 +0000
Message-ID: <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
Date: Wed, 1 Jun 2022 10:03:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 dri-devel@lists.freedesktop.org
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::32) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d797209-8e32-473a-a6f7-08da43a542ae
X-MS-TrafficTypeDiagnostic: CY5PR12MB6323:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB6323E9EE2CEBD2A4AB8DEDA683DF9@CY5PR12MB6323.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uWjOZxDEDCH2iEvF1N9LkdmSTiMnmAFhJsWlFVITRiTWMEIvE7e02Ie7dnwSglXzUu0w0u7lqX4QEHaUBHnl5fxSGLmrTSQupPmZyyD9eQqugadoY8mi7AvtqWFj/pq9RYqCRIbOx9ZnP7j4uxDMWL7bIeeb0CZI3iMTQP5tF49brWvKpPF9FBSAuCKAWus77H2/g4ItlvNw+SF+4Bd0Nv8oM5BHjdDo3dYbGQeRnZH7Ci6wQFPTmvgS/WSq2wd4KOHJeaqd3NyFNZ66A99xpGU4brUltj11JPl9vIYUVxRQA4d1wcgf/W+kIFyd0akLABzVG5NWFzQvwEo9WuUQbi7DFQZCIKxsXprQyAL+Yy+BX2y5JfK1elqD55xNRdvJRpS6GoTh+FDc4L9+ldVhTS7E7mYBRKgttgcuJj5MkUqb65schw9XotS4fSs+vGmWZtlAh2TD4lj/Zhx1aa4ae//PRWTgvGBdsizSf/KtKVOIgBVye7Wj+AM22Btbgqcaj+Qsyviw6x+ObqCqRNQIRiXWuqX7Bw29sKDOQZ495yPIXXVcW7hi13arlABKynZuju7T1OihWAXebxnI2aN9VJuV5ORhCCOnVFv2VKG/ZOjzzYQ4qnI3/xX5TYPlcioU7cu1vtREDwWyAVO8IcCg9nHaCTItc1Fw4BgqkEzhGGKI36Km9DIgckXfJnDhyizj+/IwYx4l3TiD39DPxqJQwivkr0UpeKix5/0m+ZEnRev5kkEsfC92hcRr0gL7FKF6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(316002)(83380400001)(8676002)(66476007)(8936002)(4326008)(38100700002)(26005)(66946007)(66556008)(2906002)(5660300002)(6506007)(6486002)(508600001)(6666004)(31686004)(186003)(36756003)(86362001)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1podTNHTGhsZ04vZy91WWVZakJBWTRVSWgzZkJNNWE4K2d2R1hYM0NvYXFU?=
 =?utf-8?B?bzlkelpCZk1CaDJ4OW9rbzlYTUI1QStMNlFLMDFFSjFJcDc5OHM0c1ZrR3F6?=
 =?utf-8?B?WDJUeXlRVDNPMnhDS1NJQmhJVXhWTlQ4V3d1S1d1WVJpcUh2NENWZGMzcU1M?=
 =?utf-8?B?aG5OdmIyRWhCa3ArV3NJUUc3Tk9lQkZUdkdqUjRmYWRnblZMbERyQWhucFhh?=
 =?utf-8?B?cktCejY0TmxBWHppRFpSbkQ1R3VPbktUU0VrczNLVGpRWWJ0MmpTUDNFWGJh?=
 =?utf-8?B?UlFBc2lYWWRscTJvQUE4Zi9jNzRwWWttUE55Rks0eHJDckxmUy9YWTU5ejNK?=
 =?utf-8?B?RUxRUlAzOXM2Mk8yWGc3TDJTWjlJZWlmaWk3d2hZWXYxMC9zbWVOWXR6QnhP?=
 =?utf-8?B?elVSVmJXS2Y4elhhM2Vsa2NXTjVncTl3b0ptOWk4WklLcUpsUXdUZ2pDRm16?=
 =?utf-8?B?bkRDVm94YVpBVkp1czhlQ0U3MTlKWStJNnMzbzdSaTdVRndwNWlTK1FhcXg0?=
 =?utf-8?B?bTBjaWZXTFFWNDJTS095SEYyb1ErYUFodFN6NlpCYklnVnR6bzNBM0lyOHpr?=
 =?utf-8?B?RiszdDRtenlyYXJiMnpTWng4aFhFYUphSHBKSFg5bWRMc3k1bEROY1MycHRV?=
 =?utf-8?B?a3JQUzh3cm5RZjlTMmFIWnFDL0FkekZ1ejY4U0VhQjNKSUhza2dVREY0djhn?=
 =?utf-8?B?dmR3V1hiQ1FPZVErSStUQWNtek0yRE9IVDVZeVJzWm9HYkNKMnFFSzBBVjR0?=
 =?utf-8?B?TGxobGJDc2s0cm5GUm1ENFNsMit5UFlYcThoTDd6d1JCeWNZeVRRaUVSTFlI?=
 =?utf-8?B?MnZDWmUyNmlMNFNSZU1XTzZKdmlEWmV6bnlWYi9RR1ZSWHlSWHIzOWJQcSti?=
 =?utf-8?B?dkIwYjlqWjBnOXEvdkRzbGhuWmtDYnUwTWJvWkVzRXVKdFRHQjJjMnB1WGZn?=
 =?utf-8?B?TjRDRUtmV1l2UGcrSW1DdUYydkRWNk01NzQvSnBTNmhVV2ZzbVR3YVVOVTl6?=
 =?utf-8?B?VlgyaE1CcVlmaDdOYVBaOXNhZy8xaDlEc3RvelYzbyt2aHg4N1diWGtGdkkv?=
 =?utf-8?B?bUV4NnZ3b3BVRGYzQml5clN0Z2NRSGdQTDkzTVpTTDU4ak1STW5wVzd2Q2JJ?=
 =?utf-8?B?d2M5NUc0UzRNemM5ZDRjQ29JYVU5di9VRzd3RUhZWEtZdTN6TXhhd09pekRn?=
 =?utf-8?B?NXhmcndtUHptZU51R2E4S0VhZDNmUE5YYVFPREQvd1J0aGZmR00yUldQaXpE?=
 =?utf-8?B?N1dadllraCtHTjBValptYTNJeDhXR2VlT2ZvVkpZRXozUlpIYnBuaDluQjkv?=
 =?utf-8?B?ckVkeVhDLzRldS9YYzRLb1VPTDJWREY4SUVyY3dLTXd0eFJ6eHptSVZGUjAv?=
 =?utf-8?B?bDUvMXhBa25aZ01FcWFWbXJ1bFNHYnZ4N3U2NVZwV0NUZXFXbXdFMkRjSkly?=
 =?utf-8?B?MFhQWWJvdmhXTGtCOUtEaGExUndBUUdXdW9HYVpCOEVNL1FRdXRSVWM3dkJx?=
 =?utf-8?B?cUlIdlZ0cGxlRUY3RGtxUWlyVkpOcGluSmFEaDhSVXZPRkgzWmcwTlVHMmRO?=
 =?utf-8?B?NzFrK2hXVGdNRC94UVNmK2cvemxHY3ZNbXlWMThmYTdOTUl0K0xiNG13Ty8v?=
 =?utf-8?B?ZlFnSmsvQWpYZStFT2NGeUJFaG8vSmt4YWFVaG5XMW5qSXVTOEdlSGxoUVl3?=
 =?utf-8?B?ak4vVjhHaG1qaURCYUZ5TERmanBXbTVlcHVScFBQeFh0S2FVdUhQQ2lzMDkv?=
 =?utf-8?B?TmtlSmR4cUJIMFVsVklwRHlFSmdUb0RKTVFjRERqVURJN2c5MnNhYjNuY2lF?=
 =?utf-8?B?TmhvRjQxZG5BbGt1OWdtMWdzUG1nSDlGc09EYnJtOXN1VW1hVHM3SFNJOEt0?=
 =?utf-8?B?RlIrRXI1WEdFOGZlSGJUcnpHN3BCNjhXUDYrNHlqN1V5c1NaYnhocEtrak83?=
 =?utf-8?B?QmR0NVdSYkxZMnptQ1FlWC84MERCcGVZak5oTjRsR2sxMnI1UXB1QjBpTkVv?=
 =?utf-8?B?Y2NBNkVlaWt6eWhtSXZjSkJNVFp4VkxPSjloWFRwSFluMXhabUVYUDI2ZHM1?=
 =?utf-8?B?TnY5R3lmMTVJM3RRYWg5R2VVZDFURWgzeGRNV1lKUmx6NmRkVU92NmJwWXVG?=
 =?utf-8?B?dkI0b3J0UmQ4aXVnK21jTU45N0NEMFpPOGFjUTBHUGxrL2UwOC9acXNHNkoy?=
 =?utf-8?B?TEtmWlZEV3huSVRRc2lhSnBCdlBzYUdWd2l5dkFNTGFFamdHa3B2eFIzQ2tz?=
 =?utf-8?B?Q1JleklJWCtxTGNzR3pncEl0dDE2dSt1cERkZFVJT2FVOTF6TFF1VzdIVnRJ?=
 =?utf-8?B?ZUgvdjRuMVlaZXlzRExhM1ZyeGRDREJ6MzkxaGtZTVRrRzlKdU9FUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d797209-8e32-473a-a6f7-08da43a542ae
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:03:49.5784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOonDKRUWnJJTXC4QkwzIx9JeJ8Qeny1sAA/suf5IF8knDKZ8sIcslL45jeDUZDq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6323
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

Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
> This should be okay because moves themselves use KERNEL usage and
> hence still sync with BOOKKEEP usage. Then any later submits still
> wait on any pending VM operations.
>
> (i.e. we only made VM ops not wait on BOOKKEEP submits, not the other
>   way around)

Well NAK again. This allows access to freed up memory and is a complete 
no-go.

Regards,
Christian.

>
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> index f10332e1c6c0..31bc73fd1fae 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
> @@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
>   	if (!resv)
>   		return 0;
>   
> -	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_mode, p->vm, true);
> +	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p->vm, true);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 63b484dc76c5..c8d5898bea11 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
>   	if (!resv)
>   		return 0;
>   
> -	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, sync_mode, p->vm);
> +	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p->vm);
>   }
>   
>   /**

