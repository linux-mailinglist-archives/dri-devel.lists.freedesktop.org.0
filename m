Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CE486959A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 15:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1189010E58C;
	Tue, 27 Feb 2024 14:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xdXZfNtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D791F10E515;
 Tue, 27 Feb 2024 14:03:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAdCy7D+UNvl2CURmMoDspZEGHiOUb3tNnQYHBQgJtBb3hBTX4O3Ode0jsqoJEOb2/2MOdSDa09/aA0excUjyYxN8O1i9n1LRqssBaHOh1FFj7FbRwZpRUNrntfAJZI1SBUNfSo2CO3hlF9o+F/v5stRmSDdeCzUgakjk5LjJrkvaYxCuMW43OMP5FRk/Rwae9UPKA8SeKvO+ccFQlEeo1k6WZhEKnlFqeXlEIQKNtzUHEW6kF+navn927/Vv+rnc7EJjR8axEjJYypZb2n6BI1HIq8igZI1zQEEGY4pg5qO5/rAcvQqejZemx5WfkKzeFYiUtXJNdvUHf3xJzZGfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1V6xCBbYtWoYyiUxlYa0lJKCldzJVPRmYsZPAO4dWs=;
 b=OsBBKPcDvnYvYxNVQZrv7+sIwlojz4VKmBUAPZpanHaNMCpqURE/diE9wDaD0dUSJivOM4raIv/SEAg79jpoqSSKg9+D+pRhPnK5yGlzvYcleELipcVSpyx6fZ1JbgexkaExvOx4IuB8NaAGDW5oIUG7CC25niccJNqNOmdDJjSCsaU6bqM2snN/Lr4c2k6O8sTGrza8omschO+fxeR70nH63ZNfvTz+ZbZMK4HMYPjClRbKcgbbNDrc4tfoiEdYixa73I+sEMyoItV8AvZiE7B2JcLWuMlmFxbyKu2aWpt3RX81xmXwYOGM+WRJ7Ym6HGoJHypeu7h+JE0PR/USvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1V6xCBbYtWoYyiUxlYa0lJKCldzJVPRmYsZPAO4dWs=;
 b=xdXZfNtb9u6OZQDtqYUf0E32dEbr9SIVP0zMZwtztT/dqcs3iLcK1NwLgVx8EEOCBS6oYokIHFuqQlgD4AE4Y0BHKHb/QRDbfDzMxwgdcKQu5/2VnR6sqyxJmvhmYAYXyJyLL/nrXZYfeffKk4qW0R2Z46d77TZ4pyjEikWyfdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 14:03:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7316.031; Tue, 27 Feb 2024
 14:03:19 +0000
Message-ID: <86907cb5-553e-469c-b23e-52ef2e5e22ba@amd.com>
Date: Tue, 27 Feb 2024 15:03:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/13] drm: Fix reservation locking for pin/unpin and
 console
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sumit.semwal@linaro.org, dmitry.osipenko@collabora.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, suijingfeng@loongson.cn, kherbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@redhat.com, kraxel@redhat.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20240227113853.8464-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0135.eurprd04.prod.outlook.com
 (2603:10a6:208:55::40) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 879578e1-0a47-481d-3561-08dc379cda0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xr2zjaU/a02a9dt1e3dLwSd3rYmXlNvpencF+7IBjYZ03+4qDeLwBjenJ97bmMHLTwkoDEd8C0hgrQeEyd6hxIzZ9GBsYtyTiPa/v4ARJ+9M56rPd3g6M7gyXJ5TESlWZC2gtGIubCxQfIpUdBRQF28w8US2SLKHsHuKKF8zLjRYuZ6G2G8Cn0b5Eifc4M2Hvs7rlRhKRQO1HGFH5gl297KCdruy2w2xpUrRQiHzkqrvYpFVB3Nj+78oSfzgpUx+2ET+Q1zPCjLfNJdzuezc8krLd7l/mbTdkCuaBrkfkMYwdx3DI0mlepH8TtbJ03wRIaSsHUAjYNZwK2hMU1Foh7bDp38Y4MlHHNcf9Pdo1G2WnEREDNRBgrnUemsvzcb6+UFET8BtHDP38I00qbGLoxRQvlsAtKc2XPTWKtw5mgYBjgxz52I3wALSkDhiM3wosFjAk2UoiCEPh4R8cza6zwyPhbPiHJuvrOZsp0LwfQK8v+mG2PwzeDhP/yPqS+wMSWzS4nDCX/XpuHa3EeMaAL2US3TfpMqLZd13Je8rh15cdb7rC233zXqIMhUAeAVVENlZzhAwNDuiqxreWQnGjhW70eufMIYIbZc7GDN9kbgpTJpWExYz6dOSTzPvhGVj+jdGa6Ue+c5iaAyVQFyqxp4vFTeO8cNtK9MV2cvf7XZ4CVH63vDRSrWcGyA4Iq2Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE1XaE16RXlyMEN5WGU3aVRMeW13aDN2NkZDaWJXWTVRWnloZWZlamViTENH?=
 =?utf-8?B?WFczTjJ0S3l6NVB3VnlhaEF0Ym1udVM2UmxtUE5taCtTUGt0Z1hwY3hiaEJH?=
 =?utf-8?B?MkR5MXp2cXlEZGtIK05NVm0wcmVSUXJEa05sb09Jb3hvRU5IWi9XcWFHUHB5?=
 =?utf-8?B?RFM2MTQ0ZVZUV04xWXhITytlcEZ4cEZXWjRLRlVZOXhkRjdGSWFFbW5FQTMy?=
 =?utf-8?B?V2xRUTRxN2VOWXZocjhBaEpFWkVjamZkeDhWMEpmcHE5cWZXOXl3dmtmYmRa?=
 =?utf-8?B?Zk1uSFJDSy9jbFlWdjRJaW8rTTJXUTl4bDBFc0pFdVU2ZEZkNjFrcFNCZXM1?=
 =?utf-8?B?cU1OYmxtbVdRV3h4cWl6TWQyV2JYdkdHdVp6NnBCeHIrWjFHRUVSeG1Id21M?=
 =?utf-8?B?QllTOU9jbEU3M1d2TWhHNU9VamI0V0xUVzlFQWN2cWJIRkRVVWl1dWV3enNj?=
 =?utf-8?B?bWtDRVpqeGo5by9qbHNRbzgrdnNCbjBIcStGaVJrVzFHdmZHekFmbGVraHdN?=
 =?utf-8?B?Nkg5VUNqUTBzWGV4VWprSks2WGhQY2ZVUzZOR0ZSWlhyVFVubWVYb3MwME10?=
 =?utf-8?B?SDhoZ2pFMHcxaFRaaUQweWtUcWxoN3JUZHBXek05SlE4U3hSdDJQSmJUcUlO?=
 =?utf-8?B?cDY3Y1RGeHhGQWVZdmhPVWZFOEdXZWtYRE5KV2orcm1hMWhINnVxZWJtVVI3?=
 =?utf-8?B?cVdjRkVRMG5zSEVjTWNybE4wS1lBUTJ4ZFIvYlhsT3ZWN0tUdExSS0JuNUpu?=
 =?utf-8?B?bVRlTFhyalpNR0NkOHJCeWRmS29tOWp2NnpNV0h1SDkyZDhibFQzNDluNmhz?=
 =?utf-8?B?YkkwU3dNSW5KZjFMTytEQVlZY1ZwaEtOUmYxbytFZEczNjkvZURXM2RLcVdN?=
 =?utf-8?B?MllMd0FwQy9RemdYY050bWxneDArNVV3OWcrNkhBVlF0cXRQSVdTWDRpK20x?=
 =?utf-8?B?eFVnRnZMN0VVQXo5RHlZYWZsbHhxQjlkcVRkVld4T3dqcTErZmZteFRwR2V6?=
 =?utf-8?B?RXYwdDlRVkRNR28yMEpnWjZkdUNEQTVXeWJaUC9CcThDVjF0clhRWlNkTmd4?=
 =?utf-8?B?dEhpSDM3eCsvdlgvb3MzUzFiaVdJYXNSZVZYenh5MUx0R0UvQmtZakh5THBo?=
 =?utf-8?B?Ujl5Z1diN2R3VUMwSlMzNTNoT0sxM3dZTy9DSjhDWTdTb0hSbm9Hc2M3Tkoz?=
 =?utf-8?B?aTh1ZzcwQVdaVGZoRDJpZVdWdjlEeFZxQ2wxMU5KYm02RUFYbG85NVdXcmFl?=
 =?utf-8?B?c0dvbUYvanM0RGtxQzRRem4vZitqcFdPSnpXcVNaaGw0RFdWSlpZNlZxVHNE?=
 =?utf-8?B?UTBEU0cwNWEzSFl1TUxJUDBoU29WbThtZEJMSFVZWFRvcmZ4ZjYzcXZNMm5y?=
 =?utf-8?B?YTlKdkFvek4vNFB2OVhKc0dNZXJHRGdFVEJhY2xxYWZIS0tSYnRUaUIvR2JE?=
 =?utf-8?B?RHNhVHJmaFBkU1BkWFJ2L2w1bjhhVFY1dVVtZWhOZ0lKSjFsYmVWSGJQVG5h?=
 =?utf-8?B?RmU2SjVkUGJsUzVwSXlGekU3Z1N5eXYxb01lS0VRdXlnczlyK2plNThxNUI1?=
 =?utf-8?B?Q0tkaHlNRWhzZ2NZVTJsRHJMRzcyUUwxTzYxYTJKdGVvLzFJNlVIWXloaHBj?=
 =?utf-8?B?QkM5Ti9QdllQMTdzTElTcDZtdjV3WVBDS04xZHhHK0VLRnJpRk1Pak1MNUhY?=
 =?utf-8?B?b2hUeTVURUxyOEFpSlROc1lQWURpeXc1bkxzaVpicklZUzZMYU5PTXFlTnNh?=
 =?utf-8?B?anNPL3d3OVR1MEsrWjB5ZFJFNG5zVHVncCt6VWxUdkVqd0Q4RVh0a2FzT2RO?=
 =?utf-8?B?T253U1JObFpzUkl4Qnd2aE8rUXlsMklGZHhvZkFvSytkTnFvTFRnQW9hNCtN?=
 =?utf-8?B?SnFOSEpqMGJ0eEFmd2VEWjFnZnpGRXRPOUJtTkhVQ21MakhIMHl4cUZCL0Vy?=
 =?utf-8?B?OGMzYkxUSnpLa0hQOE1WMlYrUW5tS1cyN0oxQkpVVW12WEZKYzNvVUpQOHM1?=
 =?utf-8?B?ZjZPcGVNT1BOY1lSSnpUVTVwVjJoNXdHUE5oN0NkcEliMXJTOVg5bUs0dWN4?=
 =?utf-8?B?amkybGkxWXNaVWczZThOMkJLVzNmRnFCVDc4RFFDZ1pKem9zRTcwVkk5NGtX?=
 =?utf-8?Q?/aEbnCf0/TU7h7ahnKrYgKznY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879578e1-0a47-481d-3561-08dc379cda0b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 14:03:19.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlKjevoA9AuYR+cjBhIvhtwjTDaoYsZernO1HQOWQjBavwb+lp7Fo+ZFCzqTYfWY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693
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

Nice, looks totally valid to me.

Feel free to add to patch #2, #9, #10, #11 and #12 Reviewed-by: 
Christian König <christian.koenig@amd.com>

And Acked-by: Christian König <christian.koenig@amd.com> to the rest.

Regards,
Christian.

Am 27.02.24 um 11:14 schrieb Thomas Zimmermann:
> Dma-buf locking semantics require the caller of pin and unpin to hold
> the buffer's reservation lock. Fix DRM to adhere to the specs. This
> enables to fix the locking in DRM's console emulation. Similar changes
> for vmap and mmap have been posted at [1][2]
>
> Most DRM drivers and memory managers acquire the buffer object's
> reservation lock within their GEM pin and unpin callbacks. This
> violates dma-buf locking semantics. We get away with it because PRIME
> does not provide pin/unpin, but attach/detach, for which the locking
> semantics is correct.
>
> Patches 1 to 8 rework DRM GEM code in various implementations to
> acquire the reservation lock when entering the pin and unpin callbacks.
> This prepares them for the next patch. Drivers that are not affected
> by these patches either don't acquire the reservation lock (amdgpu)
> or don't need preparation (loongson).
>
> Patch 9 moves reservation locking from the GEM pin/unpin callbacks
> into drm_gem_pin() and drm_gem_unpin(). As PRIME uses these functions
> internally it still gets the reservation lock.
>
> With the updated GEM callbacks, the rest of the patchset fixes the
> fbdev emulation's buffer locking. Fbdev emulation needs to keep its
> GEM buffer object inplace while updating its content. This required
> a implicit pinning and apparently amdgpu didn't do this at all.
>
> Patch 10 introduces drm_client_buffer_vmap_local() and _vunmap_local().
> The former function map a GEM buffer into the kernel's address space
> with regular vmap operations, but keeps holding the reservation lock.
> The _vunmap_local() helper undoes the vmap and releases the lock. The
> updated GEM callbacks make this possible. Between the two calls, the
> fbdev emulation can update the buffer content without have the buffer
> moved or evicted. Update fbdev-generic to use vmap_local helpers,
> which fix amdgpu. The idea of adding a "local vmap" has previously been
> attempted at [3] in a different form.
>
> Patch 11 adds implicit pinning to the DRM client's regular vmap
> helper so that long-term vmap'ed buffers won't be evicted. This only
> affects fbdev-dma, but GEM DMA helpers don't require pinning. So
> there are no practical changes.
>
> Patches 12 and 13 remove implicit pinning from the vmap and vunmap
> operations in gem-vram and qxl. These pin operations are not supposed
> to be part of vmap code, but were required to keep the buffers in place
> for fbdev emulation. With the conversion o ffbdev-generic to to
> vmap_local helpers, that code can finally be removed.
>
> Tested with amdgpu, nouveau, radeon, simpledrm and vc4.
>
> [1] https://patchwork.freedesktop.org/series/106371/
> [2] https://patchwork.freedesktop.org/series/116001/
> [3] https://patchwork.freedesktop.org/series/84732/
>
> Thomas Zimmermann (13):
>    drm/gem-shmem: Acquire reservation lock in GEM pin/unpin callbacks
>    drm/gem-vram: Acquire reservation lock in GEM pin/unpin callbacks
>    drm/msm: Provide msm_gem_get_pages_locked()
>    drm/msm: Acquire reservation lock in GEM pin/unpin callback
>    drm/nouveau: Provide nouveau_bo_{pin,unpin}_locked()
>    drm/nouveau: Acquire reservation lock in GEM pin/unpin callbacks
>    drm/qxl: Provide qxl_bo_{pin,unpin}_locked()
>    drm/qxl: Acquire reservation lock in GEM pin/unpin callbacks
>    drm/gem: Acquire reservation lock in drm_gem_{pin/unpin}()
>    drm/fbdev-generic: Fix locking with drm_client_buffer_vmap_local()
>    drm/client: Pin vmap'ed GEM buffers
>    drm/gem-vram: Do not pin buffer objects for vmap
>    drm/qxl: Do not pin buffer objects for vmap
>
>   drivers/gpu/drm/drm_client.c            |  92 ++++++++++++++++++---
>   drivers/gpu/drm/drm_fbdev_generic.c     |   4 +-
>   drivers/gpu/drm/drm_gem.c               |  34 +++++++-
>   drivers/gpu/drm/drm_gem_shmem_helper.c  |   6 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c   | 101 ++++++++++--------------
>   drivers/gpu/drm/drm_internal.h          |   2 +
>   drivers/gpu/drm/loongson/lsdc_gem.c     |  13 +--
>   drivers/gpu/drm/msm/msm_gem.c           |  20 ++---
>   drivers/gpu/drm/msm/msm_gem.h           |   4 +-
>   drivers/gpu/drm/msm/msm_gem_prime.c     |  20 +++--
>   drivers/gpu/drm/nouveau/nouveau_bo.c    |  43 +++++++---
>   drivers/gpu/drm/nouveau/nouveau_bo.h    |   2 +
>   drivers/gpu/drm/nouveau/nouveau_prime.c |   8 +-
>   drivers/gpu/drm/qxl/qxl_object.c        |  26 +++---
>   drivers/gpu/drm/qxl/qxl_object.h        |   2 +
>   drivers/gpu/drm/qxl/qxl_prime.c         |   4 +-
>   drivers/gpu/drm/radeon/radeon_prime.c   |  11 ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  25 ++----
>   include/drm/drm_client.h                |  10 +++
>   include/drm/drm_gem.h                   |   3 +
>   include/drm/drm_gem_shmem_helper.h      |   7 +-
>   21 files changed, 265 insertions(+), 172 deletions(-)
>
>
> base-commit: 7291e2e67dff0ff573900266382c9c9248a7dea5
> prerequisite-patch-id: bdfa0e6341b30cc9d7647172760b3473007c1216
> prerequisite-patch-id: bc27ac702099f481890ae2c7c4a9c531f4a62d64
> prerequisite-patch-id: f5d4bf16dc45334254527c2e31ee21ba4582761c
> prerequisite-patch-id: 734c87e610747779aa41be12eb9e4c984bdfa743
> prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36

