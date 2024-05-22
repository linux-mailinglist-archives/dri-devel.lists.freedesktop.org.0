Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26348CC031
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 13:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C9B10EE21;
	Wed, 22 May 2024 11:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oOG7JpZF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8161E10E2E8;
 Wed, 22 May 2024 11:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2WA30AfbPrhZ3Ogo0KG4zyypA6W9T7x9B64k66hOiKkSCqYys8ogH9R4OJsqVhMJOAwDv1knfSjrP4LJvhefjO+Op6/Xg3HxFWSRMtv0nl8t4d7g6+E3KEg2AVkTbi03+NSqjDoidE9NbqZkdsu8A75IKT6VXzjD73xtuCpUVH3rBOg5KdbdcRDtvErVo0oxIEhVlSl2vbWxq6b1BNX/l33zdFIjbTOqJ2WTzInKFGXoxcYCbS7thPV9O1ci7XagWwdFLm/amwYRSS4yOZdD7ZEs7Y2Nqdde4Haj8EX1VJ3X/6sp6HUqiVsTuWj0qR85Y9vzd0/UYNUNYJ+ZIz8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N13SZ7B6S4SUiQo0/ZE8j16+oBGaD5e+WV9A6PnI4/0=;
 b=mDT9M0puLe1AwxiliNLjbWDRpo+zvY8a0ezCSZ3axopIrFK4ZX8AdLqUrw9MrQ7R9V1m4+ykFPwsHe3sypvvsE1mC/2Bd1xNPbIv4W4jh/qVhVUihmAq21UkogKIOzxIM9OwxAKqL0kvi0DiPTFUaS9RlC6uSWRXsGcSu+3zOrF+AZ9Tavur8iObIXE3ZJLNmSBRVlJsdsSSi4wFy2jTlK2UnEnQSN88dytmqrQbsC4GR2lsM3To7E4xpxIVP1jLyuYuMGExNwZ6Q1WugjugYFaYN0+yKhbVETIu/iCDjgp18g41h/tAuABxRGHuEB/p0bHskBn75VAQUaIEtx0Pfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N13SZ7B6S4SUiQo0/ZE8j16+oBGaD5e+WV9A6PnI4/0=;
 b=oOG7JpZFMV4qSu9kAVfY/QP/c/fyPqj3Bs9617V9VwY1F3I/2ymhAP8Qj8V5Ak0IoJuqdmdD73aqJoFm42CbsXCKtiBxw5Qw6fYHiIkmWNqTVdMR6icNnM5fuDTs2y89hAfgxn8UnDVLYWcyahvi/Fryo8d1O5/JjcXDarvWXG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7609.namprd12.prod.outlook.com (2603:10b6:930:99::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 11:27:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.037; Wed, 22 May 2024
 11:27:07 +0000
Message-ID: <964e2a3c-5417-40c9-b3cf-a9614881bc51@amd.com>
Date: Wed, 22 May 2024 13:27:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 15/21] drm/exec: Add a snapshot capability
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-16-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240521071639.77614-16-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 08297806-99e0-4931-3b4c-08dc7a521d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N280TU9SSTd5YzJydWYyUk51M0FPUUdHRXF6L2VuNG1QTkRYS21scGhTeWli?=
 =?utf-8?B?ODRNbHl1TTUwTXhNNGVwcW9LV2kvaHMrbzIyd1NMNWpiTnJwWjR5QkVZVGJS?=
 =?utf-8?B?d2tzTVJRTVlzcjBveC95cFFMRFBGWXI4Zjl5KzQvaEhZRGJzWFdMYUgwSVpJ?=
 =?utf-8?B?YlczNVhKQTBtWEtCT0VUcHpSdTVQdGdQUmh4WUNXVkMvQVgxZDdXZ0RScy93?=
 =?utf-8?B?a2gwVnd4ajBaMjFkWE1FZmNQb3Zlc1kwRXJadnpGRU92c3dLVnVEQ0JZek9z?=
 =?utf-8?B?QitPL09CanJmREZ6OCt3NDZ5Wmkwc081TDdBRkNNcTZDekt5dW8yTXlnRGFn?=
 =?utf-8?B?R0NOY3NCOUdGck1GdTdYYUVYRlV1eHh1NnV3THV2OHRpVWlhVmhuYkFaZDhv?=
 =?utf-8?B?KzdHY2x5aStPMjg2d1BwUFEwNkxOampHSmF2MGs4a2QvMDYwdS84M2tYSVdh?=
 =?utf-8?B?MWNJSFFZUVg0UmwycjdUZGMydDhLMzFMMTJlL0owZHJnV29Zc1VmY29zdnJ3?=
 =?utf-8?B?cU5tQkRVcTlHMWZBZURZSUFGbThSMDEvdzd1cWEwaExYcG0zRmJjc1ExRUpX?=
 =?utf-8?B?Tjg1TlVXQmsraUprSHFHbDlrcEVmNDRBdU1UUlVGejRwTjdhUkc4VjU4cC9v?=
 =?utf-8?B?b0ZWQXpDdW81Yk96dGNhbi9FWTFBMTJyUWZkUTloNEd6clNUNlppMzd5U0xV?=
 =?utf-8?B?Ly96bERhbGptaWQ4aWNtL0UrQ2xnNFI0RmFZTE5MYStGMlZwMm5SMjVoVm1q?=
 =?utf-8?B?dXhyWkxITjIzd0EydUxRTURJUUFzNEFVY01yTU82U2hTbU5aMGc1TGJORmlx?=
 =?utf-8?B?Wk9DMGJLZFkvMHR4dnhqTUc5a3dydnBkTEFlNmxSVTF1cUdYZnlQZUVGcDEx?=
 =?utf-8?B?WEo2TW9nSEVqUFBHNWFNeXhROFEzTTdoWFF6ZGhuYVNtQ0VsSkFQdmI5bmRT?=
 =?utf-8?B?blAzWTdUWG51Nzh1NlgwZHJhTjhBeVFEcnJoSGRsR0kwY1I1b0svbkpRakNh?=
 =?utf-8?B?RkpIUXlOL012d1l2QkdDTE4ySGYwNjdRbXFEemEvVllEWUh5T0ZPU1d6U1Nn?=
 =?utf-8?B?SmVZOC8zS1JPazd3Wm9VbERFMVpoZUhjVVpYeitpbk5nc2t3b1MxdC9SVElL?=
 =?utf-8?B?OHd1ZlI4alBmTGhQTTlXVVJ4QWVoY0lnWEp5ZEljVHNKSVUxUTV5OGZDdzJQ?=
 =?utf-8?B?R0ZWSnFnYWJlOHJFcE42UlJocDd2a3ppUnVmaUEzSFhaYTd2dzkzWklqOWov?=
 =?utf-8?B?bXlmVlpkVmNFTzB5cDk4elExVHJXbWIrZHZRd21sTDBlTERjZUR6NFFVcE1G?=
 =?utf-8?B?dC9kdGlvZWhPZFA5cWtvVExMRE9HMTEzMkFPSEU5ajdNQUVhMUpBQ2Fsc3Qx?=
 =?utf-8?B?dlZsYWszVUJUSHliSmpUVTJ4M01iNnZFenFOdG9jeGFON1hxSm4zRFBLVWVK?=
 =?utf-8?B?aURSN0dmNTNaWWJIUDFYUS9jRHYraDE1ZXlvRXdibmxtK1JUcm04ZDkzWUg2?=
 =?utf-8?B?K0JvRjFUL1pvcG0wdElEMG0vbXJBdjNPNklobXpXVmVRU2FQZ2c2cjJZZExq?=
 =?utf-8?B?WWpmMExMSm16RXVpN1FML2hTYjBDYjQwL0licjF0c2EyUnh1cE9DeCtiUU5q?=
 =?utf-8?B?YndMc0xRMXNNTW1mZzhRMG5CbG5NYVRxVEUvdWMxM2dRdzFDM2dnczZoWDEv?=
 =?utf-8?B?UDNaV2VtYWdzTi9vMExOMFZoSUFqVEkwdU93SzNkbndnVmR0RVBqQzJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxXeHNJbVpoSTllRWcrbGJIQVJNTFlYLzhRb2FsUUdXR2pDUVc1aXM1dCti?=
 =?utf-8?B?dStLNkE5T3ZuVXA5ZCs4QmNxcngwWE1kVCtTZ0QwVWNDNldlbzRsM3c4RkZI?=
 =?utf-8?B?M0l1enkwcTFlVHZVMnB3RkFKdlg1T3IwUnpORktvMFdhTFhvTE4vUGhuYXRo?=
 =?utf-8?B?Vlc2Y3RMdkFDNHROQUFVbHdKQTYxTnpsL1RHbjZNejVsWE9MMi9Vcmp4UStm?=
 =?utf-8?B?SGhwamZwN1Q3aE5rSjZnUTRlT2tEaFFTRlgrc2JvN0Z6Ym5LZjV0NW5NeVZy?=
 =?utf-8?B?ZyszOHlQWjdJZ3B0Mzlrdm9wMHlwa05uQkNjWWRpdC9HZk9hdXhIWnprL2xE?=
 =?utf-8?B?MWFJYTJ1OUM1azdiY2dzOXlHZ3EwRE96ckVmNm5NOVQvNUIzRDJCY0x5V1lS?=
 =?utf-8?B?cFNSQnY5ajQ0clpwOG1qOEYxc2Riejc5dzFRYzNuZjBwQStkSWxoQ0FsV1F3?=
 =?utf-8?B?dTdGNXAwSWhuNWhqV0sxWmdOUURIT3c2TEpYbVJ6TnlObVVZMGhlZmx5ZytB?=
 =?utf-8?B?TS9MV2k3NlFIOExHRWlISXJMWmNxSjRmSURBK1BXaWdxTHM3QzVCLzU2cnM0?=
 =?utf-8?B?UHpwdGU2dWlZdEE0OXErVWdVWk5UV3JGSnl6aEgxV1BCTC9aUUNnREQwQVd4?=
 =?utf-8?B?SlA1UHdWVmdvdnpPTDErcng4eVcydXlQei9FZndiOHdma2t6d2pRWVIzSDJl?=
 =?utf-8?B?SExrWW5MK2R4bUhFSzBXOGhQZHY5L0VEQ3VOd0pZaG1sMVNVbVdHdlFoVndq?=
 =?utf-8?B?ZzRnRVBuT09rMWV6K21JUktWcjUxRXJOZXBKMVpPVnJORzF4Z1Y2cVd4YmJV?=
 =?utf-8?B?MkdOZ05rM0hPWmo5RFZLRG0rNWdNMkVncVA4YnFSMm1vS1NZNktSRHhycmx1?=
 =?utf-8?B?VjBudFdzVFZjajRXZ044RWI3L0RHN0Y2V0JuUlhkNnhGMUFPencyVnZuT3d2?=
 =?utf-8?B?WkNnZDlYRDhMaW9OL0loaEVoNVZ1d0FHRHpBQXVVV1hYeUxIcUJxU3NlVGUy?=
 =?utf-8?B?bWt2OUt0azdPMHlzSjQzc0Z1OVJDL2JWWHJDSXZEbUdjQi96Q2tyZ2MwNGdT?=
 =?utf-8?B?OG9mNm9DNVMza0cwajBwcnFjR091V2w1a0RjVzIxVUZOdk9KYk9XTWd2Rm1X?=
 =?utf-8?B?N1ZEd3pzZWNvMll2VUhvUU5tQlArOEpmSnk2a3JObEIwT29vRXFOd1RuQUlm?=
 =?utf-8?B?czJDcmN4SERvZ0tKV00xWHMxU2w1bmYvV29lelJncjVwN1hUdVh4bzhLdDJ1?=
 =?utf-8?B?UlMxTkJvTENqR3B6QmRHV3Zsa0IvenU0UitpYjhOZ2UyY2dQTmpMRFE5MUpB?=
 =?utf-8?B?akdOWk56Y214R1R4L1E2S0dpb2JnRFJDK0RBREVGMWJQc0lBRjJwZ3FUZm1i?=
 =?utf-8?B?eHk1WVRDeVlyOThJdXVWVElzRFhkQTJqV21wK2VNV245Vnp5VElSOXo3eHRy?=
 =?utf-8?B?eHV5ZmdXODV6UWdTQ21RakNmTmNJTXk5OTY0bmQ5VDFHV0hENXRlUDJOU0F4?=
 =?utf-8?B?ZDlIUjFqbnNsVTNZQUVyOThhYUprNmljdWNydzVZbDlhM0N0NXVzbXYwMkFG?=
 =?utf-8?B?STYyclhYRGovU0Rzcm42V2ZtOCtIR214Q1huWDBrS3MxTmpQRzBxNEsycHRw?=
 =?utf-8?B?ckNYMGJpdVRZV29vWThKRHI1R3FrdGdOcnNCeFhXeVpYbzVQaWZ6UWFGUlZz?=
 =?utf-8?B?Q2MyNTFkZjVuaUpIdERVMCtwOTl0eFBMOVJjNG5YeEJOSTVGd1UwamMrcUZy?=
 =?utf-8?B?YWliOEN5amwvZG1pd2ord1ZNdmg2eDNhc1VzZDZxRHFGOHJET1RCU1p5UE9C?=
 =?utf-8?B?L0hmYVQrQzBzcmxzWit6bm5mZGVyRDU1eERPQ0dCdHNBQklwdVE2YnNuc0dU?=
 =?utf-8?B?WU41QWRWUHMwOFk2eG5RejQvMlpycXM2RWNsU3FkKzVrSXdvd1dvM1pxOXg0?=
 =?utf-8?B?cmlwaTQycGN6RGRuUGkyNmFqUlc5MlNNNEZiU0w0TW9qTTVtcFkyRnB6dzg3?=
 =?utf-8?B?WTFUeTl4Y1Rlc01vN1lzTTBuQmF4ZHpYR3ZpS2hNb2ZyQ2RwWmM3alR4NHRS?=
 =?utf-8?B?ZklzYlN4M0dHQkFQa2svSnNkL0Y0cDIvZDQvSEpaRk05V29NM3hCUGhrTTNQ?=
 =?utf-8?Q?NmyrGtyMVCHUe/63ODx5vqPIA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08297806-99e0-4931-3b4c-08dc7a521d4c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 11:27:07.8409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54yfndDmBmejzgHEADpMBbINwpdMBIJt4yd7dgIlgLzaJkYMbbkA+50HQtpbZqtz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7609
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

Am 21.05.24 um 09:16 schrieb Thomas Hellström:
> When validating a buffer object for submission, we might need to lock
> a number of object for eviction to make room for the validation.
>
> This makes it pretty likely that validation will eventually succeed,
> since eventually the validating process will hold most dma_resv locks
> of the buffer objects residing in the memory type being validated for.
>
> However, once validation of a single object has succeeded it might not
> be beneficial to hold on to those locks anymore, and the validator
> would want to drop the locks of all objects taken during validation.

Exactly avoiding that was one of the goals of developing the drm_exec 
object.

When objects are unlocked after evicting them it just gives concurrent 
operations an opportunity to lock them and re-validate them into the 
contended domain.

So why should that approach here be beneficial at all?

Regards,
Christian.

>
> Introduce a drm_exec snapshot functionality that can be used to
> record the locks held at a certain time, and a restore functionality
> that restores the drm_exec state to the snapshot by dropping all
> locks.
>
> Snapshots can be nested if needed.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_exec.c | 55 +++++++++++++++++++++++++++++++++++++-
>   include/drm/drm_exec.h     | 23 +++++++++++++++-
>   2 files changed, 76 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 1383680ffa4a..9eea5d0d3a98 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -57,6 +57,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
>   	struct drm_gem_object *obj;
>   	unsigned long index;
>   
> +	WARN_ON(exec->snap);
>   	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
>   		dma_resv_unlock(obj->resv);
>   		drm_gem_object_put(obj);
> @@ -90,6 +91,7 @@ void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr)
>   	exec->num_objects = 0;
>   	exec->contended = DRM_EXEC_DUMMY;
>   	exec->prelocked = NULL;
> +	exec->snap = NULL;
>   }
>   EXPORT_SYMBOL(drm_exec_init);
>   
> @@ -301,7 +303,6 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
>   		goto error_unlock;
>   
>   	return 0;
> -
>   error_unlock:
>   	dma_resv_unlock(obj->resv);
>   	return ret;
> @@ -395,5 +396,57 @@ int drm_exec_prepare_array(struct drm_exec *exec,
>   }
>   EXPORT_SYMBOL(drm_exec_prepare_array);
>   
> +/**
> + * drm_exec_restore() - Restore the drm_exec state to the point of a snapshot.
> + * @exec: The drm_exec object with the state.
> + * @snap: The snapshot state.
> + *
> + * Restores the drm_exec object by means of unlocking and dropping references
> + * to objects locked after the snapshot.
> + */
> +void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap)
> +{
> +	struct drm_gem_object *obj;
> +	unsigned int index;
> +
> +	exec->snap = snap->saved_snap;
> +
> +	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
> +		if (index + 1 == snap->num_locked)
> +			break;
> +
> +		dma_resv_unlock(obj->resv);
> +		drm_gem_object_put(obj);
> +		exec->objects[index] = NULL;
> +	}
> +
> +	exec->num_objects = snap->num_locked;
> +
> +	if (!exec->prelocked)
> +		exec->prelocked = snap->prelocked;
> +	else
> +		drm_gem_object_put(snap->prelocked);
> +}
> +EXPORT_SYMBOL(drm_exec_restore);
> +
> +/**
> + * drm_exec_snapshot() - Take a snapshot of the drm_exec state
> + * @exec: The drm_exec object with the state.
> + * @snap: The snapshot state.
> + *
> + * Records the @exec state in @snap. The @snap object is typically allocated
> + * in the stack of the caller.
> + */
> +void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap)
> +{
> +	snap->num_locked = exec->num_objects;
> +	snap->prelocked = exec->prelocked;
> +	if (snap->prelocked)
> +		drm_gem_object_get(snap->prelocked);
> +	snap->saved_snap = exec->snap;
> +	exec->snap = snap;
> +}
> +EXPORT_SYMBOL(drm_exec_snapshot);
> +
>   MODULE_DESCRIPTION("DRM execution context");
>   MODULE_LICENSE("Dual MIT/GPL");
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index ea0f2117ee0c..0ce4d749511b 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -19,7 +19,6 @@ struct drm_exec {
>   	 * @flags: Flags to control locking behavior
>   	 */
>   	u32                     flags;
> -
>   	/**
>   	 * @ticket: WW ticket used for acquiring locks
>   	 */
> @@ -49,6 +48,25 @@ struct drm_exec {
>   	 * @prelocked: already locked GEM object due to contention
>   	 */
>   	struct drm_gem_object *prelocked;
> +
> +	/**
> +	 * @snap: Pointer to the last snapshot taken or NULL if none.
> +	 */
> +	struct drm_exec_snapshot *snap;
> +};
> +
> +/**
> + * struct drm_exec_snapshot - drm_exec snapshot information
> + */
> +struct drm_exec_snapshot {
> +	/** @saved_snap: Pointer to the previous snapshot or NULL. */
> +	struct drm_exec_snapshot *saved_snap;
> +
> +	/** @prelocked: Refcounted pointer to the prelocked object at snapshot time. */
> +	struct drm_gem_object *prelocked;
> +
> +	/** @num_locked: Number of locked objects at snapshot time. */
> +	unsigned long num_locked;
>   };
>   
>   int drm_exec_handle_contended(struct drm_exec *exec);
> @@ -160,5 +178,8 @@ int drm_exec_prepare_array(struct drm_exec *exec,
>   			   struct drm_gem_object **objects,
>   			   unsigned int num_objects,
>   			   unsigned int num_fences);
> +void drm_exec_snapshot(struct drm_exec *exec, struct drm_exec_snapshot *snap);
> +void drm_exec_restore(struct drm_exec *exec, struct drm_exec_snapshot *snap);
> +
>   
>   #endif

