Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3213BC5F375
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 21:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6C510EB0D;
	Fri, 14 Nov 2025 20:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qR/2tGZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011005.outbound.protection.outlook.com
 [40.93.194.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F07110EB0D;
 Fri, 14 Nov 2025 20:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOjPUVc8VkJq/Q2GTqCsHhEkdZIgqr++xVu5keOU6xXLJEVRj+GIagN6xG6QSzM5TsjWvYMXGYrjPUYj8kDY2Hw5SkAzfT7lXX0SoPBxCfka58vucN3PYDRbaj/KLksOk9lv8lfJp+3kcjc4JiPcv0XUM/IkrDDe5Yz+QAK6MA+tF40/iCRjnN3NPIH19AUTmQdbPsoas1PSlJWVRhWEEkxiEvK5weJe3XOPEctlYlLLztbvzbQXucnz7MnXXIo+2R354ODs/5f1gn3yrWHipdGi5zKmhDhrjQfOm9VBoVbsxWzXmnJ3s0HwvvhlvxUDcP+8JD71uuS/EehV/iXLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umSGkdbPs5eEK0o3kVnhYsenIMCYKcifg/bkw1FWHPo=;
 b=CS1mrIbIK45p++wpOF/yWaCDrF3lleN6aHzGIzOMc4Lr9DRAf8bbuiF46WoFEIdMwEatTJqwTiiDL+1VPRqqhZfT/jDDWtkPjjHb3TiC4cv/i+r2+Rjg33Ck+4GNAtnyMpIRpm4Q4WeB8bQOoblmAjrWHMwAMPv9hXgZLfhSBhGDYOMRV/POMo1wKjYqQPxQmyMM6QvDipSsZdJ/wdzN/zPZdx1Og48cnaMICk5AyTXPklVxKqLFufibSCcWa4aSNUIw288LvOyBdTrOEYLtAMgVal1RcaZS/hVn1+vapXqGnrJX4WNoZ7k2rPCXEPV+o6ZgJT1mqrUvGbDg28LOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umSGkdbPs5eEK0o3kVnhYsenIMCYKcifg/bkw1FWHPo=;
 b=qR/2tGZfUUyLty2wsCCrLp3SUhS2kuGIjDcWjyf7pJ/0/VKWQhgN9V6vISdK06Ak9reewPm7TLLNFDIaGeQ09iPs6CwUZFD7JG73rWP2rB0gJvpka3Aqr9yxubazbyybkCW4KpKvUxRQAde/Uq7wYix1O8TGlSS3MXxsijG44Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 20:20:07 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 20:20:07 +0000
Message-ID: <3c127f68-90ee-4614-aac2-96cf02796a16@amd.com>
Date: Fri, 14 Nov 2025 15:20:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/20] drm/amdgpu: pass the entity to use to ttm
 functions
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20251113160632.5889-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0184.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4f3211-9e0e-477e-443f-08de23bb3419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU1RcHFpNUQzMHdMSkpMYVppOXFCRXZEV0xPak1VKzBFMDc5VXZLd0Rpb2tZ?=
 =?utf-8?B?OEp5RW8xbVlvWko3S1NYUVdXN1BHeFRITFlnSjlRcm1jQmQ1V0N4QlgxUGRG?=
 =?utf-8?B?alVKUHd3cG85ZEdFSlFnVXpJcTMvajUwRzhnU2J1WDRPZ2FxY296TklodlVU?=
 =?utf-8?B?d2tWbmk2MmEyZXQ2dzZjanMvcU1Wc1pOVWh5MGFyZ1hPYXhucXpiSVE5ZlJK?=
 =?utf-8?B?eTJDZG5TdFk2RXNUNTZkbE9CbnR4NkdtbXRnNTU0MG1jK2lrTmhEakVvNW90?=
 =?utf-8?B?SkJaVkZpbFpwWmEyM1Qvdlc1NGIxamk5cS9tV0lOYmFsRjQwN1lkQ00zRFBy?=
 =?utf-8?B?N2hJeDZWWTVrbVA3ekVPQS8rcFhRSFhkN29kSXdBL1BlUzRsQndMU1VhZWlH?=
 =?utf-8?B?M3JyRVV1MFgxVU9TbHJzZjh3SVd3QWRMV3hrQkVJMGpKelVhclk5aDg4NHk0?=
 =?utf-8?B?MUM2SElYVHpCWFU3cytHRS9GZUNWZGN5STVyS0ZMZUhyQURVNGRwOWdOMEh1?=
 =?utf-8?B?WjBMV0JOaEQ3ZllVeStXNmRZR0FLL3dmbDVnK0RWSTFoODhnWVFieU5DUkFI?=
 =?utf-8?B?NzByNmN4dyttWElQMHFvbW91VUU2Zm9NclVzWmFheGdWRkVtamVVYnAxS09Y?=
 =?utf-8?B?Nlh6OVhONzRNakdBUS8zTUdPN1FDMEE4N1l6dVExazZ4T2QxNGQ5d1ErMU0v?=
 =?utf-8?B?OVcrUlNEeC8rU0ExUGxtRUdSWXlQMU10SXp2YUhjYUtTeUVrb2V5OGdzbzcz?=
 =?utf-8?B?UHlZeHJaVExsYVVXcnVQQlhpVGUvcmZEcGI0dGxYb2YxcnRobC9UZnJOZDlQ?=
 =?utf-8?B?UDE5OG8wUk9TT3pxeHc3WWlOK2ZtQS9YTWpuM0djU2Z1NFlwMHN5c3BlZm9h?=
 =?utf-8?B?bWFBOGhKb25TODZ5NVB1SmpTcm84K05OeXJjSkdJS2MxY2VLYlFISEZncllM?=
 =?utf-8?B?UTN4NzRYcmd4VGZHWG5yVVUxdE5RYUI0K0lKa3lOQ1BOREVuRlNPTXYrN0Fi?=
 =?utf-8?B?elg5U0RRQ0JkVmtmK21CSGZKNGZkaWwray9XZDVwdFdHY0J0Y1F0Q1V1Slc5?=
 =?utf-8?B?OUN2ZmpJT0RMbXltYUFDZUtPTWtlc0t0Uzh4VHRHZWpmandxZ2pMcTVNcVFp?=
 =?utf-8?B?TVN6SGwwZGtrOFdTdUM1ckRXbkprYnV3SFM5amJobGtPUHJJN3R1a01tc3M0?=
 =?utf-8?B?Y0QydUMza1hIUlZFOXA1OWFqNE15UWFRa2xNVnJnMDZTVmhtcEdOdVg4dnNz?=
 =?utf-8?B?c2lBSXBYMXJsdGp2NEs1WFB3TFJxdll6WmRPREppVnl1M2NIbHJ1OHZaMWhF?=
 =?utf-8?B?VnByUUoxUm9qcE9BNlBRdC9PVW5obVdkditYZ29RWm1iVytUdFhHN1JFaEJt?=
 =?utf-8?B?bGZyNkFScTQvbkFtelI3ZG9GZE5LRVNTZjcrUzBodkdudEc2b01NMFdsWmpB?=
 =?utf-8?B?TDliV1FjOWMyLzNtMUllSjFKZVlML3JZVWpENHVGTEZjS0JiUXhIRW51eVM3?=
 =?utf-8?B?OXdYT1B5VnJwN29JZjQrbEhnVDhxY1I2U1JqUkxOYVFTcVpOdCtTMkFsRkhQ?=
 =?utf-8?B?U05kYVIrN3JQOCtoQkZ2TzYyWkkwOVVrVFVWYnJPMjlsVGo5bDZZcVBCQUsw?=
 =?utf-8?B?a2s2OTlhYkdCL25HMTJuLzh6OEFhTGkzOVdQMmhMaFgrVGYrQ2NURERsLzRO?=
 =?utf-8?B?MjVYQUxrUElrUW1Lc29oWExpelZ5cjRJOUs1VWNWUEREOTJtWEcrN3FrWk1D?=
 =?utf-8?B?eWVuTTMvTGVaNmYzczZRcVZnKzBvSTRhUkY0N0ZSMGltZnMyMlpJSytyS3lp?=
 =?utf-8?B?aWNjdUI1K0FiWXV4S3FhRDArcTlSdjR4ak14djZwMnk2N09VWVBEd3FjMHBC?=
 =?utf-8?B?VStaQldGWkFtUSswV2ZXa05DKzV3T29VRG55blMyNThGcGh6dlAzS0Y2ODM5?=
 =?utf-8?Q?hRB9xFPF7qIILFxmMfPg6MuUjA8NN+ma?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZEbXVHbmtVSG1KVkczdzhVWEdMTWg5UW1TMFQwbU9vVEVOYkZQbko4NHpm?=
 =?utf-8?B?eWIzTXFaMkdzeFBUQldZTWVvUUtZRk5hOEZpb0xxVS81WXB5YVVKbEJHYXVR?=
 =?utf-8?B?bTVyUkJLS3ljMmo1cDRiaE9RejRZSWxZL3N0ekhzL2lVY2VqMG0rRDRJSVdW?=
 =?utf-8?B?YnpxaTd4VnNlRndmc2JvVXFQNlRkN2lRUWlYSnp1cDNtZWZjSFMzYTVNaGFV?=
 =?utf-8?B?aERmT1RXczVoUTRKWmRlUEUzdHZLSk1PRUlCZ1h6NEpET0JUd1hTNjI3MUVY?=
 =?utf-8?B?MUVyVk5tOEt4Q2xyWmNqWEVQUXJtM1FPUHo3NVFmNzFaU0NvUTdXWDJhVHNa?=
 =?utf-8?B?L2hpei9yWmJ6M2F4NHJCeDhCUEV2UFBhN2Z3aTJ3ZHA1eTFFcXhOME9BUVdX?=
 =?utf-8?B?ODFXRzd0UWRzUzJQdllLWkZpcXNtTjBja2hNelB6TFhseHV0ajEyeGhVME00?=
 =?utf-8?B?YnhrY3pkdGdSUVdVVnVIZXdualJRMEx6RUpVUWx0cUxrcTcwaHFEL0RsTlJ1?=
 =?utf-8?B?elluM1FrRmp4T2ZNbEorb0Jhd21LeS9ZcXlETFdUdm5XQU9XUjF5WExBQy9k?=
 =?utf-8?B?enFpZ3ZCbHVadEgxdUp6RWZJbExZMzdDeG1nZUlYcDFtNjA4OGR5N0N4Ykcw?=
 =?utf-8?B?MWY0WmNMNHZZcHdITy9UVkU1Q29VMHd4aWc2Ly8xSGV4dmJQQnMzcDRBdnM3?=
 =?utf-8?B?OUx5M09PdjluWWZ0RXJ2c1RxTUkxc3l0blcvVzRJQTBpSVhHcjdObTU5R09Z?=
 =?utf-8?B?Q0E3MmJrMjJBT1VHWmY5Ujhka1lpamNaU0N5TEFBWWpiZHlNTVdGRGlSS0Mv?=
 =?utf-8?B?MkJBdXZGOVk3L3BQMCtZRWhpV08rWTVYa1NWZEdKajl2NFcvNnhSR2pQWXpZ?=
 =?utf-8?B?Y3A1REVpRS9BQzl3b1VXN2tpd0h6K1Y3NW54RzJSdkxxTitvbWpTM2crTmlY?=
 =?utf-8?B?N1owUHhudlFwNlBkUFNkNmhpZWREYTdiRFRWQWF2eEJzYWRRNkJkTnEyWXdU?=
 =?utf-8?B?ME1Hd3E2bWJjV3pQaVNiM3BCemI4Zkx1My9iK3lONG1JZlJkNUdMUkV2S3Iv?=
 =?utf-8?B?VE5lSUV2dHJxNzlrQ0JCby9GT1FhcjVhczhRMGlEN0tyN1dDU2pHOWNOZkl0?=
 =?utf-8?B?ZHBTM2FrSEkxamI0WWw4a3dacmV5Mk1JYzlOU1lpMVErZUpsTHZ6NkJYM0lr?=
 =?utf-8?B?TDFWMkdUQUF4NmNhanJxUFdXZUNJSXVBMlQ2QkM5ai9NNGkxNkF6NTF5eVp3?=
 =?utf-8?B?by9VMkthWHlHZ2tKZldGUGpabkk2V2g3Vm5lOXZJQTBndkRyTHY3SHBSdVVV?=
 =?utf-8?B?MjFWck53NHFtNzRiM09vdUtXSWw3MG9JbmFOSWlGRGw4Ty9DTG1iVGxtb2tn?=
 =?utf-8?B?dkh5VVYzZU1VZU8rcHNLT29xTFZ1elZlVXFDYy8zTVlxUWc2dUJJNTRabC93?=
 =?utf-8?B?KzByWUM1Z0d1VFJqa0gyODJIRVVmQ2hOZjdRWG9Vc3FRK3V4azJPTjFGallu?=
 =?utf-8?B?cEpUQ3VUM2h3ZnZndzZ3emhkd1lkcFM5TTVjQVVBKy9oWnJ0Nk8yQTNhVXFE?=
 =?utf-8?B?OHFkSHJnazRPM2dDRXhnNC9FTS9nTUZOMGVFSWRNcnFVdlBwSlJFWm13U1lT?=
 =?utf-8?B?cXlUdHNPZ2k3YlM1aE81Mkd2Q0diNEZJb1pDOUtZR2o4YSt5SC9yL1E0c2E0?=
 =?utf-8?B?N3g0ekZjbk0rK1hoOW1DV2YzeVhrdFd0MERPQ3ZwVm1BYUZjZm43UldpcnV1?=
 =?utf-8?B?TTFsRS9lOEMrUW02Z0Q5ck9mMHVZOE9wRFFuREpVSXlGa1FNNU05Q3dDbDNa?=
 =?utf-8?B?Ukppc0NLOEQ4VXgzZ2dhamo0WXJBRGZWSVpnMGhuRnZ3dGZHeUgzcm15eTly?=
 =?utf-8?B?Y0dESnZyc2FwTjZqQTFVTktRMTZCQTlrbEkvY2t4bEpDUXBjdTdoQ0xqR3FV?=
 =?utf-8?B?bWc4Q3RJdy93ck1QK2pFc1pUV2ppM0tFcGkwa0M5T056TU1mWWlodzBlNHdJ?=
 =?utf-8?B?MGF5OG1JbEE2aXQ2U0VqUVdkMlhPNVcxaTJoZi84T3RCU3diWmF3TGFBVkJ5?=
 =?utf-8?B?RXNybDNDR2svaStDbS9qbGFsU21YVUtvZXNiSnZuNlFtcXZZeXpWNEIyQWF2?=
 =?utf-8?Q?624M7kiA8HTzyGZZrHamugEAm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4f3211-9e0e-477e-443f-08de23bb3419
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 20:20:07.5863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1io4MMxgs/MeFWhLIegiRtL3srjCm4lmfpqvJefqzDFi6UMydTiyQz2MSR3XEBlTNSJFMZfKMwpTIcx672dygg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622
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


On 2025-11-13 11:05, Pierre-Eric Pelloux-Prayer wrote:
> This way the caller can select the one it wants to use.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

I agree with Christian's comment to eliminate the ring parameter where 
it's implied by the entity. Other than that, the patch is

Acked-by: Felix Kuehling <felix.kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 75 +++++++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 16 ++--
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
>   5 files changed, 60 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index 02c2479a8840..b59040a8771f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -38,7 +38,8 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>   	stime = ktime_get();
>   	for (i = 0; i < n; i++) {
>   		struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> -		r = amdgpu_copy_buffer(ring, saddr, daddr, size, NULL, &fence,
> +		r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
> +				       saddr, daddr, size, NULL, &fence,
>   				       false, 0);
>   		if (r)
>   			goto exit_do_move;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index e08f58de4b17..c06c132a753c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1321,8 +1321,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
>   	if (r)
>   		goto out;
>   
> -	r = amdgpu_fill_buffer(abo, 0, &bo->base._resv, &fence, true,
> -			       AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
> +	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
> +			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
>   	if (WARN_ON(r))
>   		goto out;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 42d448cd6a6d..c8d59ca2b3bd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -164,6 +164,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>   
>   /**
>    * amdgpu_ttm_map_buffer - Map memory into the GART windows
> + * @entity: entity to run the window setup job
>    * @bo: buffer object to map
>    * @mem: memory object to map
>    * @mm_cur: range to map
> @@ -176,7 +177,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>    * Setup one of the GART windows to access a specific piece of memory or return
>    * the physical address for local memory.
>    */
> -static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
> +static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
> +				 struct ttm_buffer_object *bo,
>   				 struct ttm_resource *mem,
>   				 struct amdgpu_res_cursor *mm_cur,
>   				 unsigned int window, struct amdgpu_ring *ring,
> @@ -224,7 +226,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>   	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>   	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>   
> -	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
> +	r = amdgpu_job_alloc_with_ib(adev, entity,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     num_dw * 4 + num_bytes,
>   				     AMDGPU_IB_POOL_DELAYED, &job,
> @@ -274,6 +276,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>   /**
>    * amdgpu_ttm_copy_mem_to_mem - Helper function for copy
>    * @adev: amdgpu device
> + * @entity: entity to run the jobs
>    * @src: buffer/address where to read from
>    * @dst: buffer/address where to write to
>    * @size: number of bytes to copy
> @@ -288,6 +291,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>    */
>   __attribute__((nonnull))
>   static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
> +				      struct drm_sched_entity *entity,
>   				      const struct amdgpu_copy_mem *src,
>   				      const struct amdgpu_copy_mem *dst,
>   				      uint64_t size, bool tmz,
> @@ -320,12 +324,14 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
>   
>   		/* Map src to window 0 and dst to window 1. */
> -		r = amdgpu_ttm_map_buffer(src->bo, src->mem, &src_mm,
> +		r = amdgpu_ttm_map_buffer(entity,
> +					  src->bo, src->mem, &src_mm,
>   					  0, ring, tmz, &cur_size, &from);
>   		if (r)
>   			goto error;
>   
> -		r = amdgpu_ttm_map_buffer(dst->bo, dst->mem, &dst_mm,
> +		r = amdgpu_ttm_map_buffer(entity,
> +					  dst->bo, dst->mem, &dst_mm,
>   					  1, ring, tmz, &cur_size, &to);
>   		if (r)
>   			goto error;
> @@ -353,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>   							     write_compress_disable));
>   		}
>   
> -		r = amdgpu_copy_buffer(ring, from, to, cur_size, resv,
> +		r = amdgpu_copy_buffer(ring, entity, from, to, cur_size, resv,
>   				       &next, true, copy_flags);
>   		if (r)
>   			goto error;
> @@ -394,7 +400,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	src.offset = 0;
>   	dst.offset = 0;
>   
> -	r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
> +	r = amdgpu_ttm_copy_mem_to_mem(adev,
> +				       &adev->mman.move_entity.base,
> +				       &src, &dst,
>   				       new_mem->size,
>   				       amdgpu_bo_encrypted(abo),
>   				       bo->base.resv, &fence);
> @@ -406,8 +414,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>   	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>   		struct dma_fence *wipe_fence = NULL;
>   
> -		r = amdgpu_fill_buffer(abo, 0, NULL, &wipe_fence,
> -				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
> +		r = amdgpu_fill_buffer(&adev->mman.move_entity,
> +				       abo, 0, NULL, &wipe_fence,
> +				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>   		if (r) {
>   			goto error;
>   		} else if (wipe_fence) {
> @@ -2223,16 +2232,15 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   }
>   
>   static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> +				  struct drm_sched_entity *entity,
>   				  unsigned int num_dw,
>   				  struct dma_resv *resv,
>   				  bool vm_needs_flush,
>   				  struct amdgpu_job **job,
> -				  bool delayed, u64 k_job_id)
> +				  u64 k_job_id)
>   {
>   	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
>   	int r;
> -	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
> -						    &adev->mman.move_entity.base;
>   	r = amdgpu_job_alloc_with_ib(adev, entity,
>   				     AMDGPU_FENCE_OWNER_UNDEFINED,
>   				     num_dw * 4, pool, job, k_job_id);
> @@ -2252,7 +2260,9 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>   						   DMA_RESV_USAGE_BOOKKEEP);
>   }
>   
> -int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
> +int amdgpu_copy_buffer(struct amdgpu_ring *ring,
> +		       struct drm_sched_entity *entity,
> +		       uint64_t src_offset,
>   		       uint64_t dst_offset, uint32_t byte_count,
>   		       struct dma_resv *resv,
>   		       struct dma_fence **fence,
> @@ -2274,8 +2284,8 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>   	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
>   	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
>   	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, num_dw,
> -				   resv, vm_needs_flush, &job, false,
> +	r = amdgpu_ttm_prepare_job(adev, entity, num_dw,
> +				   resv, vm_needs_flush, &job,
>   				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
>   	if (r)
>   		return r;
> @@ -2304,11 +2314,13 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>   	return r;
>   }
>   
> -static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
> +static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
> +			       struct drm_sched_entity *entity,
> +			       uint32_t src_data,
>   			       uint64_t dst_addr, uint32_t byte_count,
>   			       struct dma_resv *resv,
>   			       struct dma_fence **fence,
> -			       bool vm_needs_flush, bool delayed,
> +			       bool vm_needs_flush,
>   			       u64 k_job_id)
>   {
>   	struct amdgpu_device *adev = ring->adev;
> @@ -2321,8 +2333,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>   	max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
>   	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
>   	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
> -	r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
> -				   &job, delayed, k_job_id);
> +	r = amdgpu_ttm_prepare_job(adev, entity, num_dw, resv,
> +				   vm_needs_flush, &job, k_job_id);
>   	if (r)
>   		return r;
>   
> @@ -2386,13 +2398,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   		/* Never clear more than 256MiB at once to avoid timeouts */
>   		size = min(cursor.size, 256ULL << 20);
>   
> -		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
> +		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity.base,
> +					  &bo->tbo, bo->tbo.resource, &cursor,
>   					  1, ring, false, &size, &addr);
>   		if (r)
>   			goto err;
>   
> -		r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
> -					&next, true, true,
> +		r = amdgpu_ttm_fill_mem(ring, &adev->mman.clear_entity.base, 0, addr, size, resv,
> +					&next, true,
>   					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>   		if (r)
>   			goto err;
> @@ -2408,12 +2421,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   	return r;
>   }
>   
> -int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> -			uint32_t src_data,
> -			struct dma_resv *resv,
> -			struct dma_fence **f,
> -			bool delayed,
> -			u64 k_job_id)
> +int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
> +		       struct amdgpu_bo *bo,
> +		       uint32_t src_data,
> +		       struct dma_resv *resv,
> +		       struct dma_fence **f,
> +		       u64 k_job_id)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>   	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
> @@ -2437,13 +2450,15 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   		/* Never fill more than 256MiB at once to avoid timeouts */
>   		cur_size = min(dst.size, 256ULL << 20);
>   
> -		r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &dst,
> +		r = amdgpu_ttm_map_buffer(&entity->base,
> +					  &bo->tbo, bo->tbo.resource, &dst,
>   					  1, ring, false, &cur_size, &to);
>   		if (r)
>   			goto error;
>   
> -		r = amdgpu_ttm_fill_mem(ring, src_data, to, cur_size, resv,
> -					&next, true, delayed, k_job_id);
> +		r = amdgpu_ttm_fill_mem(ring, &entity->base,
> +					src_data, to, cur_size, resv,
> +					&next, true, k_job_id);
>   		if (r)
>   			goto error;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index d2295d6c2b67..e1655f86a016 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -167,7 +167,9 @@ int amdgpu_ttm_init(struct amdgpu_device *adev);
>   void amdgpu_ttm_fini(struct amdgpu_device *adev);
>   void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
>   					bool enable);
> -int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
> +int amdgpu_copy_buffer(struct amdgpu_ring *ring,
> +		       struct drm_sched_entity *entity,
> +		       uint64_t src_offset,
>   		       uint64_t dst_offset, uint32_t byte_count,
>   		       struct dma_resv *resv,
>   		       struct dma_fence **fence,
> @@ -175,12 +177,12 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>   int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>   			    struct dma_resv *resv,
>   			    struct dma_fence **fence);
> -int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> -			uint32_t src_data,
> -			struct dma_resv *resv,
> -			struct dma_fence **fence,
> -			bool delayed,
> -			u64 k_job_id);
> +int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
> +		       struct amdgpu_bo *bo,
> +		       uint32_t src_data,
> +		       struct dma_resv *resv,
> +		       struct dma_fence **f,
> +		       u64 k_job_id);
>   
>   int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>   void amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index d74ff6e90590..09756132fa1b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -157,7 +157,8 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
>   			goto out_unlock;
>   		}
>   
> -		r = amdgpu_copy_buffer(ring, gart_s, gart_d, size * PAGE_SIZE,
> +		r = amdgpu_copy_buffer(ring, &entity->base,
> +				       gart_s, gart_d, size * PAGE_SIZE,
>   				       NULL, &next, true, 0);
>   		if (r) {
>   			dev_err(adev->dev, "fail %d to copy memory\n", r);
