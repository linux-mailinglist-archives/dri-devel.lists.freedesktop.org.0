Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC81999F2D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 10:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED11B10EA7F;
	Fri, 11 Oct 2024 08:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bks3fA7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87D210EA7F;
 Fri, 11 Oct 2024 08:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/+5GNvjFMW5c3Yk7Tsg+ygnn6iABwJkkht036+T2GA0SW0/yGae1Z8MX4eExW+bLZjWSYu+WRfI8bglGXb7n75xklfStoR/+pARfxUoFVO3FuyHBEzj+XGW/6BaMmpb4Kk/TYy56NxbuN5m2pAa5W2AHjl9s97y6N+tXmw3v0+3B+THHZFH+OhEb11ELD1EadA1nwZu4Un2Z1QwjnFp/8HqGHtX6mkwKSLv+dI+nTsY89TYnxKqrGkkEuani4tuUg5bC5LzSA1o2w4ybduYHkSjPQq6l4qRfmsMpK1X4b9yAuVP4AK49A0sMKFONjtAPdMRJHvHbvRyTbMnk57Evg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54HyW5TZLL3qbUX1YVD/lnCyTTYsN63z7KiX1DSZzBg=;
 b=xVAmL5wJsU0bqspblJQ5zanIznX3le67fqIi8xu3v+hgPf/fEWQASCFSjGFytygdIAI8ncCX5yYE5ad4Cpgtu4VfPJUfkdaHn7tQx+pv3u/+GfIDGWNEjXNPBGPiaHs7FyiLcxIimjjs7U4oZ3k0a9LQxKuULisFLZbwEOghHR+dtmAdX/bR9dd9FInzyd6R6S4VwWC7mnpYjAtyE1JfYlw4KDEUZdG5T9JrHKSGBeJoZD746qXPBggDiVP4g3xIDgVlUEPdMpwDpxAU8GmNXsFXy8cSDKH8utRG0ifOSpeZW9va3OPOLgr4UpsT+QEKEVCbE45ixqzCN5M62q+U3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54HyW5TZLL3qbUX1YVD/lnCyTTYsN63z7KiX1DSZzBg=;
 b=bks3fA7LWEgGGGe1J40IxNmgsbqvYSeDMQTJD2uVygpkhQTqh3XNouT8X958RJ7DnHtP04eO4cfNpkBWlrTUOwACDQDvqjBjfCrn4lFZvnF+EQydymUzZ+PrP96fv/uR49tA8BC9xM8MG+qvWOxVrQE/FwjG9ozCSjdzvIcKies=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6469.namprd12.prod.outlook.com (2603:10b6:8:b6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Fri, 11 Oct 2024 08:40:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 08:40:25 +0000
Message-ID: <db1694f2-031c-44e8-aa74-e6b002a136c5@amd.com>
Date: Fri, 11 Oct 2024 10:40:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: adding a new scheduling policy
To: jesse.zhang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com
References: <20241011062136.1019695-1-jesse.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241011062136.1019695-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c362e9b-9790-4cbc-39dd-08dce9d059e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVhBTy9qaG9ZOVNZV0o2Yng0d3c0RzBLR3JRTTdhYjJqSVg1R3pGWjZPWHFC?=
 =?utf-8?B?SEVxN29JeEZjcjFSUHlLc2RubU1tUUUyZW5INmpZNGF2SmwydGtNVU50NDRJ?=
 =?utf-8?B?bGgwR1U3NGZnM2lvcVZmbmhRL20yYTJVcldsMVVmUXpiWlhBbUlVWUY5aFl5?=
 =?utf-8?B?K2ZLZHI4VTVyQnpjNEtNV1BjcVF4L2xDVXFEK1lrZXJjSUFheTVyQnJqQkk5?=
 =?utf-8?B?S1R2Qzlod3EvVm80T2FFYytReFFlUmNNNGFPY1l0dzZ5cEpvWHUzZm1RRUMr?=
 =?utf-8?B?eW9pMzZ3UjcwZHB6aWtWaDR0K1VkU3o1UzJEaWQ0MkRRMGp3clBVZnBVZVpq?=
 =?utf-8?B?T04wZEEweU85dlp6aVhzVHBuWDNmQkpLc0l0ZlVRWEpEelpsZHJjTlVHNVlj?=
 =?utf-8?B?T09uQ3NLYk1yeEJVSDRuRk9OZUgyV2NDa09GbzhTbmFSZ2h1QkhuOURxc1NK?=
 =?utf-8?B?ajlSK1lNZGZYTk1zYUZOZmVORVVVMUlOaWlBTVh6OGJKQjdYYnVQTFNyV1Vm?=
 =?utf-8?B?NjNxR21TSFBKaVRCSWJqV2dPTUxFME9oQTRvZnZad2lYcElERmoyR3ZxTnht?=
 =?utf-8?B?KzArVWRXMjNRT1B2RFhVVkNWQ3ZRZXBFeXpOUlEzanppVEM4d1F3T1RNalRv?=
 =?utf-8?B?YXROM2hMUUVTa2RCT0IwMXRnbTBJT0hCeUxaUUxESEdVOXFNTytweDF0TGNH?=
 =?utf-8?B?eVM0aGhyYVdpRFZtd1pHRUs3ZWZJQXdPY1gva2xiNGcyQWJORjlkT1gza0x5?=
 =?utf-8?B?SFcraXA4YTBycGxQY0ltMHdTdXVuN0hpK3JmUURtWlBGUUpLd3hwbmh4K1E1?=
 =?utf-8?B?eWxVYSs1ZUplci9yNXB0bWlZS2ZnTFZxZHVQTHF0YU1KSGxMZnI3L29XeXFs?=
 =?utf-8?B?bUFMOSt3V3ZIRFBMWW8wR0FIbEJhcU1DYkJNd0ZxbldQNVBTK2JhVWY3ZGxS?=
 =?utf-8?B?MDFhVWU0V29GYXkyaW5paWdRcjBKeHJoQjRLR21yR2UvdnJyZzZBTktEUElp?=
 =?utf-8?B?NzR5MWROM0x0VjJQUjlQNlAwdzJSdExrVkxGaGw4bXg5VkNJVldEU3RzbC9G?=
 =?utf-8?B?Vng5VlBCbTQzVWRmRHRGYWEvdU1BU2FEWGRBN0NaYXNOd3ZNaXJMUkg0THdI?=
 =?utf-8?B?a2FqTFNxdGhTWGViQVpYWXJobWU2THc5eFFoaXdiYU9jQlc5SGovNnpJait2?=
 =?utf-8?B?cUtxUkh1UFdyRUVuaVQ5dVM5dE9vWEtLclNldnk5WUkybjk0V2IvQUxhRGNV?=
 =?utf-8?B?eS9lOVJOOUZ6OFBGODEzK0tBeXM2Tkg4ZGNGam1kblVuZEk0SlJ6T3FnTHFV?=
 =?utf-8?B?Ly8vVWZ4TDBobS9aV3l4Skh1Q3VXTnFXSldrbUhURCtSUkRBS1Q5alk1UUZY?=
 =?utf-8?B?eWx2WXhQVkg0ZTczZGg1WnV5Qmo2NU9xakhFV3BjbjNSUitML3pkSmNsS2tP?=
 =?utf-8?B?U2oweXBtNzZEMmdpdlB0Y0RpRVlSellsd2crSWw1cHJ4WndxVGF5eU4xNEJ4?=
 =?utf-8?B?Q2UrRXpZSzFUa3FBeGUwVmVRUHdHVGMxdEw1UDhyQXM5MUFtVVJiNW1ITmpV?=
 =?utf-8?B?VWNQZDd5a0tMWDdDc0I0U0lXQytDaUF0RlNmcFVEZllwakdhMEp5aXp5cjE0?=
 =?utf-8?B?YUhmNjYvMzllQm5sVGlUdGlrSCthNlBqc0ExaXRNSGovQ0Z6UzRBaHlGMUNw?=
 =?utf-8?B?NFZnd2NKZ1RxL1prbUsxV2IycHh6M0s3dW9kQkRCa0psM0ozMnhMamlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGwxWEViV2NPbDdDMVo1Zlgyanl0ODJGcU5mUExlYTZLVlpDZDMzeHljNE5a?=
 =?utf-8?B?TDJSTU5HRFc4c2svTUlnaXJWUlpVTUpzcTV0RC9kT3NGWjlBVVV1TVNzTW1B?=
 =?utf-8?B?WVd5RWhiaUpRR0o4eW5wWjRhWXZpUTdPUWpFZU9IWnppU0d2bWUyN2o1TkFV?=
 =?utf-8?B?TFhacGs5aHpVNWYwUEZGUmlGR0FheDR2WHQxZ1hXOTh2eThWK3BkenphenY3?=
 =?utf-8?B?cmNUdXhGZnYwMDBDZXhEbG5pUmVLdHlNaDZBZFBKdS9USENSMUFSVWdWMUw4?=
 =?utf-8?B?VjNDd2s1YithSDM2SmpHUXpoSzRBbGpLOU8xbU1JaXNVZk9ad0QzN1BseFZH?=
 =?utf-8?B?ZjcxTEdLVFJ6cU9iQ3BrOXA1bGFPaDZwcGVKQlk0eXhWWENJTXloVGNBS0Vv?=
 =?utf-8?B?L1dvdGliWGlKZmJzM2ppaWlhd1cvZG5BamVZVmE1dGUwbHJpYUtsTTZ0VGdi?=
 =?utf-8?B?eUYrZkI5bWZ0aEROazRGeUdMRlpMNmoyU1gwQ09TeG54NXIrQVhUeU5JZEJz?=
 =?utf-8?B?SmtGZFF0OStZeWJZWkJiOVhEMXkrWnlNN2ovclBBQ0JzUk9ISENTeC9PdkJk?=
 =?utf-8?B?V0hxQjdlNHlWbGtoL25SWGNuWkdDeUI3ZmhyeVV0d1poekVVWVIxT0pyd1lD?=
 =?utf-8?B?V2d2bkVhN1cyZGNyTGpNMTYzclUwakZiOFl3YmthWVphdytudkNreTZ4R1Jm?=
 =?utf-8?B?MjJIbXZsb1h1TkJzV290OWJKUEtKeGVyNm5sRU1VWEl2czBPWGFKSGREMGNv?=
 =?utf-8?B?QXVjU2hLWXF6YnlSUVJpdC93L2dTQm92Wm92NGZZVWZyaW5Lc0JWT1JqdkYv?=
 =?utf-8?B?NnVIYTZFUmVwMmlyWTBjUVdZNGc1NzJLckdteFRjN1dXUkZtVHcrOGlWVDVP?=
 =?utf-8?B?QTA1QVBqVXdvQnVZaTZkMU5MdXJ4NVJhS3F5RGo4aGExVCtBb0RRNW9kZHpX?=
 =?utf-8?B?RHRKWmI4VGExNkJoYVpmNWJ3QjBUVGhTK3p4MklBTUtleUNaVlNHaTdNVlI0?=
 =?utf-8?B?RHVNUUN1c0lQS3duWjRibnJ4eG1WR3AwSDBzalVFUXVFcUhuZ2FFY0xTMWRL?=
 =?utf-8?B?YlAzRjdQUWVYdmk2RzNOYjF6ZExwWXJnclIxZXI3aWJKdGg2MVNxMUF0MWp5?=
 =?utf-8?B?RlNlR2ZiMkRVYzRYUEprZFlGemhzNEpzZ0FVdDRRVWVPSkJHaHNxN2lLVWV5?=
 =?utf-8?B?NHBtQlhWSFJZeFZ3SStaTmVoWTRQcFNkUW5uNzdqWmhJVVBVSU1kaFcvcnRu?=
 =?utf-8?B?WDQ3V25MQ3Q2Uk9iWTNIK3E0MndKWTlZWjBWR3pBbjNFQ3VFd3ZLcnJSNCtw?=
 =?utf-8?B?aHpjUUN1NWcrYTNjNFlsQjVNejBGS1IycCsvdG1EenNqeno5dGh5bWt6RFNL?=
 =?utf-8?B?YWtITTlxNkJJRjF5cHFmK0RHNFJsSGw1eHB3djduTGw2VlY4OFdZZU4vS3Zv?=
 =?utf-8?B?bWNxVkJ6YWNOVGJ6NUhrUVQ0NkVrN3lvUkM3NmVSbjNabnZ5M1BZNTd6MEV6?=
 =?utf-8?B?ejBhK3ZEWUJvZFdiN0x3c0I2NTFFeVNRYmloRElrQUVQNCtZMFpsa25TSVht?=
 =?utf-8?B?Q210ZEd3TmdBbVNPVStqSFBZOTJxZy9MVVRZYzZ1WUZLeGhjbEFXWVZ2NnNz?=
 =?utf-8?B?ZDRpd3pZbzFNbUwyQzBIU3VRTzNuK1VZVlpOcDI2RVlJWlBvYVlTVVJMa2ZD?=
 =?utf-8?B?WUJvalFSVElNMVRoemRBcWdoTnY0VTd6Rkd5dGxYWkwxeU0vc2ROS1JHbkYv?=
 =?utf-8?B?eGdlbXlrenlJNmIzWENXZmtXc3hzbEdEdUJvTnBzemZoTm96ZDA4TFVzdFF0?=
 =?utf-8?B?aXB0c2sxVGUwSitDcmFOeFVCSGhpYkFXMWdqdGF6UmwwOTlPSXR2WUhHakRY?=
 =?utf-8?B?eXMyTnIyMHpCVE5RZVdOR3R3Y1hnbkRhVWlOSWQ1K3pMbEZtOURya3Z3MTZB?=
 =?utf-8?B?RTBmOVNhcWJwc3BFTy9yQXdHdEt0TEtEOUFiRXRuWEdSdnhtU2thN0Z1VG9l?=
 =?utf-8?B?Mm44TkRKcHdKT1pKQkx2NzVDZjVlOVcwTktieUxFT0RoSFhxdnVsRWRGbE00?=
 =?utf-8?B?T200WVNIOVNRWEgxUGZZK2YvU2RKVzRZWGxzR0FUT054dFdlTUdTQzVwOFNp?=
 =?utf-8?Q?ncWU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c362e9b-9790-4cbc-39dd-08dce9d059e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 08:40:25.3357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lu9+LpnwdgYzHm8lhCII/1BXjC19uKVCD1NiwMLN8R+mYgYQH3ihF4TDSt39S8R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6469
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

Am 11.10.24 um 08:21 schrieb jesse.zhang@amd.com:
> From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
>
> Added ring ID scheduling.
> In some cases, userspace needs to run a job on a specific ring.
> Instead of selecting the best ring to run based on the ring score.
> For example, The user want to run a bad job on a specific ring to check
> whether the ring can recover from a queue reset.

Absolutely clearly a NAK, we don't want to expose the different HW rings 
directly to userspace.

Regards,
Christian.

>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 +-
>   drivers/gpu/drm/imagination/pvr_queue.c  |  2 +-
>   drivers/gpu/drm/lima/lima_sched.c        |  2 +-
>   drivers/gpu/drm/msm/msm_gem_submit.c     |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_sched.c  |  2 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c  |  2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++++--
>   drivers/gpu/drm/scheduler/sched_main.c   |  4 ++--
>   drivers/gpu/drm/v3d/v3d_submit.c         |  2 +-
>   include/drm/gpu_scheduler.h              |  4 ++--
>   12 files changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index d891ab779ca7..18887128a973 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1286,7 +1286,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>   	int r;
>   
>   	for (i = 0; i < p->gang_size; ++i)
> -		drm_sched_job_arm(&p->jobs[i]->base);
> +		drm_sched_job_arm(&p->jobs[i]->base, -1);
>   
>   	for (i = 0; i < p->gang_size; ++i) {
>   		struct dma_fence *fence;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 717adcedf096..8d75ffa9a097 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -320,7 +320,7 @@ struct dma_fence *amdgpu_job_submit(struct amdgpu_job *job)
>   {
>   	struct dma_fence *f;
>   
> -	drm_sched_job_arm(&job->base);
> +	drm_sched_job_arm(&job->base, -1);
>   	f = dma_fence_get(&job->base.s_fence->finished);
>   	amdgpu_job_free_resources(job);
>   	drm_sched_entity_push_job(&job->base);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 62dcfdc7894d..98d003757af1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -107,7 +107,7 @@ int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
>   	 */
>   	mutex_lock(&gpu->sched_lock);
>   
> -	drm_sched_job_arm(&submit->sched_job);
> +	drm_sched_job_arm(&submit->sched_job, -1);
>   
>   	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>   	ret = xa_alloc_cyclic(&gpu->user_fences, &submit->out_fence_id,
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
> index 5ed9c98fb599..ed7398a0ff21 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -1115,7 +1115,7 @@ int pvr_queue_job_init(struct pvr_job *job)
>    */
>   struct dma_fence *pvr_queue_job_arm(struct pvr_job *job)
>   {
> -	drm_sched_job_arm(&job->base);
> +	drm_sched_job_arm(&job->base, -1);
>   
>   	return &job->base.s_fence->finished;
>   }
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index bbf3f8feab94..cc83b2aab9ce 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -130,7 +130,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
>   		return err;
>   	}
>   
> -	drm_sched_job_arm(&task->base);
> +	drm_sched_job_arm(&task->base, -1);
>   
>   	task->num_bos = num_bos;
>   	task->vm = lima_vm_get(vm);
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index fba78193127d..74c4e1b4df78 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -831,7 +831,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   		goto out;
>   	}
>   
> -	drm_sched_job_arm(&submit->base);
> +	drm_sched_job_arm(&submit->base, -1);
>   
>   	submit->user_fence = dma_fence_get(&submit->base.s_fence->finished);
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 32fa2e273965..3ff8142b5370 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -309,7 +309,7 @@ nouveau_job_submit(struct nouveau_job *job)
>   	list_add(&job->entry, &sched->job.list.head);
>   	spin_unlock(&sched->job.list.lock);
>   
> -	drm_sched_job_arm(&job->base);
> +	drm_sched_job_arm(&job->base, -1);
>   	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>   	if (job->sync)
>   		done_fence = dma_fence_get(job->done_fence);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index a61ef0af9a4e..cc937420cd35 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -301,7 +301,7 @@ int panfrost_job_push(struct panfrost_job *job)
>   		return ret;
>   
>   	mutex_lock(&pfdev->sched_lock);
> -	drm_sched_job_arm(&job->base);
> +	drm_sched_job_arm(&job->base, -1);
>   
>   	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 58c8161289fe..f4669422b3f9 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -525,7 +525,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   	return sched_job;
>   }
>   
> -void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
> +void drm_sched_entity_select_rq(struct drm_sched_entity *entity, int ring)
>   {
>   	struct dma_fence *fence;
>   	struct drm_gpu_scheduler *sched;
> @@ -554,7 +554,14 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   		return;
>   
>   	spin_lock(&entity->rq_lock);
> -	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
> +	if(ring >= 0) {
> +		if(entity->sched_list[ring] && entity->sched_list[ring]->ready)
> +			sched = entity->sched_list[ring];
> +		else
> +			sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
> +	}
> +	else
> +		sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>   	rq = sched ? sched->sched_rq[entity->priority] : NULL;
>   	if (rq != entity->rq) {
>   		drm_sched_rq_remove_entity(entity->rq, entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 7e90c9f95611..356adf510670 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -833,13 +833,13 @@ EXPORT_SYMBOL(drm_sched_job_init);
>    *
>    * This can only be called if drm_sched_job_init() succeeded.
>    */
> -void drm_sched_job_arm(struct drm_sched_job *job)
> +void drm_sched_job_arm(struct drm_sched_job *job, int ring)
>   {
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_entity *entity = job->entity;
>   
>   	BUG_ON(!entity);
> -	drm_sched_entity_select_rq(entity);
> +	drm_sched_entity_select_rq(entity, ring);
>   	sched = entity->rq->sched;
>   
>   	job->sched = sched;
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 88f63d526b22..d33749017f93 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -211,7 +211,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>   static void
>   v3d_push_job(struct v3d_job *job)
>   {
> -	drm_sched_job_arm(&job->base);
> +	drm_sched_job_arm(&job->base, -1);
>   
>   	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 5acc64954a88..0eab405a2683 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -553,7 +553,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>   int drm_sched_job_init(struct drm_sched_job *job,
>   		       struct drm_sched_entity *entity,
>   		       u32 credits, void *owner);
> -void drm_sched_job_arm(struct drm_sched_job *job);
> +void drm_sched_job_arm(struct drm_sched_job *job, int ring);
>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>   				 struct dma_fence *fence);
>   int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
> @@ -603,7 +603,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
>   void drm_sched_entity_fini(struct drm_sched_entity *entity);
>   void drm_sched_entity_destroy(struct drm_sched_entity *entity);
> -void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
> +void drm_sched_entity_select_rq(struct drm_sched_entity *entity, int ring);
>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,

