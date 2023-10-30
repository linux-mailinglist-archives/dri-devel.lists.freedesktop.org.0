Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2AE7DB4C1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F94E10E225;
	Mon, 30 Oct 2023 08:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5739410E221;
 Mon, 30 Oct 2023 08:05:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n//XW07f7iUX4B1pLde5vFcH5M3Qvc3Zxlt0bT8GvpaHcVkyVRSFVO6bnFRlKVTNZus0p3bHxs67LHxoTFLhjtUO+nQUuHNCoXdxL585pcnbfX5hgxFy317zBTWuc6aRpyO8Y6PQEKC1DHIhiUqj4VnKrH/6yWgCAIeMER0DkX4y/F8+OXp1oSgwz73VJhRUCzT9SXtZ0PQVz2Jr1BrEXKaFI/7aCqB9KNNiXCxgqQhOvXFY8qUcYnYYCbgD4x0qCJCAgtGrX04l1bYK6UoyfR+S9/ssY8/ufTgPlEAAo30mVOM++y2bmBKuQCn1xt4K//QZJQ3qEACzKfoK7fnWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSvDIqxXLDWcgwOwQAFuTTdBKn8/lzzszP9EexDU66g=;
 b=hvJkU4djWSUWATdzB5MbRvlNMRGlNzVBGCJgy6J8bbToOD232o1bX9TZjuUM75b2V4EGQChXCavbO99E7VeQ7zSxOMspU7vi2bzNwhZKWMPhyemct9TAdPEPxj8bfmgaR2e+gMULFZXpGF121beLUewaGkmRcrNGch+cBOHyEKb1EFB0//YEIgkI7ZLjh0N4XisfFtQdCN0LfpbI0dtscSGhQFCHCFY+9qj6JWBKHp6ijBnDuUYGclY944WKO7RhTLoW6SupAXrfuTrV2GwgJazg0j1BRNPN78CLekhwMWDDKOAS8UxItNby52bK/YIBf7c5sw7uxTQLF/8ttkRQbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSvDIqxXLDWcgwOwQAFuTTdBKn8/lzzszP9EexDU66g=;
 b=ULzyE5SHxGclOOn3sySSOv+hE2ERHzzaMzsKfRxyi8xedJ8YZIqSdOio0jmka0NV6G6sTI4r6tdQX8zbYajxpxqtyl9FbGfxKuDoV4LQlcch7SIjhrRcn28HvBaa/tfX6623m1JhNMm0gzyyz3aYblALz3I1A0hG8X9q6LwDd4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 08:05:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.026; Mon, 30 Oct 2023
 08:05:16 +0000
Message-ID: <597b5bb3-ca75-4662-9904-12c4d8e9101a@amd.com>
Date: Mon, 30 Oct 2023 09:05:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/exec: Pass in initial # of objects
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231027165859.395638-1-robdclark@gmail.com>
 <20231027165859.395638-7-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231027165859.395638-7-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0398.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: b933451c-b439-4780-22eb-08dbd91ef3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G67RrMaQShjFy93iJ0zZqN7kM3J5eJJugpRgkiMyLumTMImdiJbaQ7SA+k+zboqc7uuFZ6B7hUBBNb3fkB+JF7fHNLHFN5RdYt3EfZRU2Q6POVFbwHUrxYtS07EE9wEAn0HNaKJXTBVq8uFttArGfWkYxFeAjIWFXH/VHM7h1ZMt+tWFBk5JBSj5X0pEGNuBEWzUrRJArjWIhDd8HdYHNb+Uzl6mlYjh85oyiFZ4xFhNRv1VVtUW83nFdP3FlDBMvTbbhgx6k4u20+AmC07B47YGg7qebNMnsQWfBB8JbpWiVCFuLDcZSOC+GYpcr2COV6I5a+5lioUVrcSrczss15wjnXg/EQLVyliVx5b2QjZPauyCzt3WDHvwzM9dy8Gsw/5tdoxoru+ZW/UjbmzzqHF11dRgg2squKLz3L7tDlNELbdjv7sQ4M25fp+1Zeep+3Gm6++JfpgbIwEbFy32/mg3limPzRBoYvlgaulaj0H8HuMJUzyyhOyI357EBb+7Kx41ikqtx9OV49YNZoHCm7gFqnNgQyRu1gkVB4JObQk6graOzzsJpq69CTCWxiY5DDTKpdjdbpfLH4HWWyrhaBsoiYFZArFXC4vswl2nTnBux6YoKOyHfsGq1Qpe3OGNgUQq41lyKnMr/8mEDyez7WFQU7UpliKzc1dqop4Nq40elmn5gfO6H/U0Wh8psvjm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6512007)(6666004)(6506007)(38100700002)(478600001)(31686004)(6486002)(36756003)(26005)(66946007)(2616005)(83380400001)(66476007)(66556008)(316002)(54906003)(66574015)(5660300002)(8936002)(7416002)(4326008)(8676002)(31696002)(86362001)(2906002)(41300700001)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnJObW5ROGJLMk5XOWFpZzVvNVh6Y0crcDBSWGZleERwQzJKckxtQzNLUVZr?=
 =?utf-8?B?UzhQcm9RYmRmcm9zMzZhaVhQOElWTVJ0YlFtTHJyZ1ZwY2RmdWxLRHdzSUVs?=
 =?utf-8?B?T0xyNFZJdXl4T2MzNGV3ajB3TGlzSnJxREJ6dU5JekpiaG9PSDFPOEhuYy9M?=
 =?utf-8?B?TEpabFV2RmFjZVlDd2V5YTJLWTFoZUdVL2pRK3VIV3lmYml1SXJDbTRrTlF1?=
 =?utf-8?B?TmZERVNGSm9uM0J2YThNREMrQjdpK1dmZWxPTkJjQUtOeGxYTlF3bVhOazR2?=
 =?utf-8?B?UUtzdFkrWjFCQkthYzYydFYxM2tuNVRxQkVVNjZwa2gvSlRUYzZuaVA0UWV6?=
 =?utf-8?B?c0tQUit6TnBCSTZyZVBsRWJHWEcvbW5IZkhHbG5Fb2tWN2NabkQ0Ynl6Ti85?=
 =?utf-8?B?a2ZiUzR2S0JxVzM4c1NIZjI2eUdsRzRXUWhROFlSVVIveXNQblRESCtzcW5O?=
 =?utf-8?B?YTV5NWh2Yi9VUXRGcXNaQUx1cjE2aWFXRGdZbFNSRkNrbTJPT0w3QTgvOFR1?=
 =?utf-8?B?S3NXQlB4aHo4azIveXJDbVJOVWFmS2RNQzFuc2JGcFlMYnZIM2JwbHdhTnRZ?=
 =?utf-8?B?ZnkwVEhDRmVrQWdjUWQvMU5lYmtLSlM2dS9FRTNHOGx1ZHprRVhnSHl0ZWJB?=
 =?utf-8?B?SGNXamp5aSt1b3JXN2VnajB3cEFYckFIQ0hDb0dDRldPZnU3OUhvMzBYczJ0?=
 =?utf-8?B?RHNyVUJHWkVYeTRuZURoWXJNdHJzZ0tBR3A5TXM1dWdRR1p4cGxKb09RN0JG?=
 =?utf-8?B?OFpJWlZIdnE3ZVRhYUU5T2lzcm5CbURrMlhnUDA3TC80emVPVWl4RkF2TDF5?=
 =?utf-8?B?Ym9tdG9KeE9JNGRzRlNTNkE1VUZtamxOelNkT2YyREsxa0ZzVzNaZWEvNHNI?=
 =?utf-8?B?NGJ3NC95WW9BWWxHU0N1OTQ3QnBwVUhySmZtM1pQRXo2S25JSE9sbWtqYjFi?=
 =?utf-8?B?dkR3bUM3ZFdUYnRZclRoRG9JVWJGd0I4M0dCblhHeWpsU0RpMHNZNXY2akJk?=
 =?utf-8?B?cDJPb204NmZkcERvZmJXMkV5UGdKZ3VGc2VteTNUeldWdDAyQlhWZXlmaHh3?=
 =?utf-8?B?QmppR3NOaGZjSGZnaFlOalMwb2s5TnEzL1M5WEM4VS9aVDBmWkpsOEd1TWJ5?=
 =?utf-8?B?OGVvNCtpTHhFcXpobCt4VTVEdmpUbGxZVXI4UnNySTBVclV4UGwxQUZpcUF0?=
 =?utf-8?B?ZGpLSzVlbndZZjdUSnBpUGNJeXhnam44dmFhQWY4Z0x4bWsvV3pmKzhENENH?=
 =?utf-8?B?dEdESzRGQW01K01TL25CNkppK05pRVRueVlvOHhJckM4ZHVEZWdHWXJ5STZJ?=
 =?utf-8?B?eGwwRWNLR0VMR0hDMFhTUU5YZzFxZitGNnF5OTNqbXRqQU9YbzZKdFZiVFN4?=
 =?utf-8?B?Y1liUTNSY3lpSFZVM3BTRzNuNHJLN1lSSWpDY0p2eVRaZFora0tvU01RR2FD?=
 =?utf-8?B?MDhrVXBXdEs3VlFoTWdjWDhJL0g5Z25mU0dMSndzMG05eTNPd05GTUhBSFpw?=
 =?utf-8?B?U3kxZkt2WENZem8vd1ZJcmJrNXl3S1crTzgwdERaNndKT3lUby9vOFlIdFY4?=
 =?utf-8?B?c3JrSnZ1cDV3d3pxUkFHYVl6ZXB5ZU5EdC9QTURQT3hWaFJ5M2RLYVR2MHNU?=
 =?utf-8?B?ZWJQMGE1eElwSXliM243SUNHdnVpMW1vditFTEhkN2xnTFdlVGpvelZEdjVZ?=
 =?utf-8?B?a3B1SFRqcm9tOHNsbDl3YTN4YkdxLzVNWDEvVXV4QWM5NXlBMDVTTFE1cXB1?=
 =?utf-8?B?QVAwVmg3VHpKM2ZqajRUU0orc3A0QnZXRCtIZ0FsenJ2UFZFQzMreTdBTzNu?=
 =?utf-8?B?bE1YTUo4VkVnN3NvSFJuVDB0SkY2enVFZ2Ntc1oySXdqNEtrSU5sRi92eTR6?=
 =?utf-8?B?ZU9CT1Q3bWtZUkRZeGtsNmgvNlNFSXBHaGRYWElaLy91cW81RE1vazErUXRu?=
 =?utf-8?B?bWdLZTJPeGFCL2RPOWdMWW5XMmJtVXgzU3U4dUFQQXVmMXNlRzVvc0VCV2FH?=
 =?utf-8?B?bUkrWHVVOE5DSEVwRDNBcVZBWEZkN2NTTDAzOWwyMldTYTQzUU9ONDF4bnho?=
 =?utf-8?B?b3BsTC92emJHZ0I1TXRORVBXRk8wWjc1UTFQNm8raUJMeEM0NVAvdE5HVVpo?=
 =?utf-8?Q?4De8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b933451c-b439-4780-22eb-08dbd91ef3bf
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 08:05:16.7248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hph7ThLNRKglZsQ024KZDOW0WZbnE+aAEokb1YXDFcGQmQ03rItG/gR7QZF36A8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Karol Herbst <kherbst@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Mario Limonciello <mario.limonciello@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Dong Chenchen <dongchenchen2@huawei.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Jonathan Kim <jonathan.kim@amd.com>, freedreno@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lang Yu <Lang.Yu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.10.23 um 18:58 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> In cases where the # is known ahead of time, it is silly to do the table
> resize dance.

Ah, yes that was my initial implementation as well, but I ditched that 
because nobody actually used it.

One comment below.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c |  4 ++--
>   drivers/gpu/drm/drm_exec.c              | 15 ++++++++++++---
>   drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  2 +-
>   include/drm/drm_exec.h                  |  2 +-
>   8 files changed, 22 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index efdb1c48f431..d27ca8f61929 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -65,7 +65,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p,
>   	}
>   
>   	amdgpu_sync_create(&p->sync);
> -	drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> index 720011019741..796fa6f1420b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
> @@ -70,7 +70,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	struct drm_exec exec;
>   	int r;
>   
> -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>   	drm_exec_until_all_locked(&exec) {
>   		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>   		if (likely(!r))
> @@ -110,7 +110,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	struct drm_exec exec;
>   	int r;
>   
> -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>   	drm_exec_until_all_locked(&exec) {
>   		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>   		if (likely(!r))
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index ca4d2d430e28..16f1715148ad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -203,7 +203,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>   	struct drm_exec exec;
>   	long r;
>   
> -	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES);
> +	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>   	drm_exec_until_all_locked(&exec) {
>   		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
>   		drm_exec_retry_on_contention(&exec);
> @@ -739,7 +739,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> -		      DRM_EXEC_IGNORE_DUPLICATES);
> +		      DRM_EXEC_IGNORE_DUPLICATES, 0);
>   	drm_exec_until_all_locked(&exec) {
>   		if (gobj) {
>   			r = drm_exec_lock_obj(&exec, gobj);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> index b6015157763a..3c351941701e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
> @@ -1105,7 +1105,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
>   
>   	amdgpu_sync_create(&sync);
>   
> -	drm_exec_init(&exec, 0);
> +	drm_exec_init(&exec, 0, 0);
>   	drm_exec_until_all_locked(&exec) {
>   		r = drm_exec_lock_obj(&exec,
>   				      &ctx_data->meta_data_obj->tbo.base);
> @@ -1176,7 +1176,7 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
>   	struct drm_exec exec;
>   	long r;
>   
> -	drm_exec_init(&exec, 0);
> +	drm_exec_init(&exec, 0, 0);
>   	drm_exec_until_all_locked(&exec) {
>   		r = drm_exec_lock_obj(&exec,
>   				      &ctx_data->meta_data_obj->tbo.base);
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 5d2809de4517..27d11c20d148 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -69,16 +69,25 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
>    * drm_exec_init - initialize a drm_exec object
>    * @exec: the drm_exec object to initialize
>    * @flags: controls locking behavior, see DRM_EXEC_* defines
> + * @nr: the initial # of objects
>    *
>    * Initialize the object and make sure that we can track locked objects.
> + *
> + * If nr is non-zero then it is used as the initial objects table size.
> + * In either case, the table will grow (be re-allocated) on demand.
>    */
> -void drm_exec_init(struct drm_exec *exec, uint32_t flags)
> +void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr)
>   {
> +	size_t sz = PAGE_SIZE;
> +
> +	if (nr)
> +		sz = (size_t)nr * sizeof(void *);
> +
>   	exec->flags = flags;
> -	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
> +	exec->objects = kmalloc(sz, GFP_KERNEL);

Please use k*v*malloc() here since we can't predict how large that will be.

With that fixed the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>.

Regards,
Christian.

>   
>   	/* If allocation here fails, just delay that till the first use */
> -	exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
> +	exec->max_objects = exec->objects ? sz / sizeof(void *) : 0;
>   	exec->num_objects = 0;
>   	exec->contended = DRM_EXEC_DUMMY;
>   	exec->prelocked = NULL;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index 19024ce21fbb..f5930cc0b3fb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -103,7 +103,7 @@ nouveau_exec_job_submit(struct nouveau_job *job)
>   
>   	nouveau_uvmm_lock(uvmm);
>   	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> -			    DRM_EXEC_IGNORE_DUPLICATES);
> +			    DRM_EXEC_IGNORE_DUPLICATES, 0);
>   	drm_exec_until_all_locked(exec) {
>   		struct drm_gpuva *va;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index aae780e4a4aa..3a9331a1c830 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1288,7 +1288,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
>   	}
>   
>   	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> -			    DRM_EXEC_IGNORE_DUPLICATES);
> +			    DRM_EXEC_IGNORE_DUPLICATES, 0);
>   	drm_exec_until_all_locked(exec) {
>   		list_for_each_op(op, &bind_job->ops) {
>   			struct drm_gpuva_op *va_op;
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index b5bf0b6da791..f1a66c048721 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
>   	return !!exec->contended;
>   }
>   
> -void drm_exec_init(struct drm_exec *exec, uint32_t flags);
> +void drm_exec_init(struct drm_exec *exec, uint32_t flags, unsigned nr);
>   void drm_exec_fini(struct drm_exec *exec);
>   bool drm_exec_cleanup(struct drm_exec *exec);
>   int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);

