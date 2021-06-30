Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9533B8078
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 11:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29376E977;
	Wed, 30 Jun 2021 09:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B3E6E976;
 Wed, 30 Jun 2021 09:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJ8tvMw19IN0v7BMDKO1iTzGCtIay7Rw1ufnWwt4pbeKq0mtZH+brWZRT8AfSXzunN4dEdKbhDZsq85zDGSFWbJpKuGzBA+lRmLi9ni7WghYjRhpoK19l8NKzx50J2T1CLnbRucoNU5lWDlHSP/pA1bntNbPSBx1/Q3KLMJwpYd+rQlu1FAaAZk0lkOvdH2XgYpF+jX+4MGBJKnMC6WRKl0BH2zw52YeHmX+RNJStZqZFU0j9VyNe+0/MBWYrCXXivcDpmKdTKtAFDKGvRPy7Mhhya3rKf02ut9Ra3Aey5T5B52hHOytQi9ql9VjjhssRR0PijE4nJVyd7TXFr63ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoQcQ7fwpxF2UvNtN9XQjUnpGRiwq4usOh4K3qC84As=;
 b=JQUnbOKZn+Q6g40fl9aL54VA+ZUTirzDYM8duRBiByCkaY4OJ/rB2PW5ijVktUP+e3YMoj8IQ4YE19wQDkChsbCDUH1X53JjVNGjxRTufvC3uIk4a8qGG1Ep+MteyYr1AvM9lhj/gIwamAiKDnXUebbHVfR0FfUFtVRvs5E3vUsEvuenMgp4TV0L3D+/32FW1QSdytSNFZJPB/kq5ABnEZkn8BSl8CzXOQdci36asyRFMH3+2kmQoOUaHoDw/lr/toeuViwDnXPSOfKIRvg8uOJ52JOlZBmB97BoPmNAElAuhLAZG5VBRj7Q1xEJjBOSuT10t05v7IroljM/gMMjlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoQcQ7fwpxF2UvNtN9XQjUnpGRiwq4usOh4K3qC84As=;
 b=z+dK9lKtb0TWr0ejysbItYSO8oeu3+b1Jhc0Bg+Kyw0h3ymUp/bky7VQiSW8cyIYF+gI1IaTywwu66C4L1pkiR3HRVDeUt96ni/mzNs+TDeSloRFLBjhck7lyZDK6rVWhU9QMyxrA7LzyGsk+Mh8nEfUx0CJOZ+ncJoPANvOT4Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4638.namprd12.prod.outlook.com (2603:10b6:208:ff::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Wed, 30 Jun
 2021 09:55:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 09:55:15 +0000
Subject: Re: [PATCH v3] drm/radeon: Fix NULL dereference when updating memory
 stats
To: Mikel Rychliski <mikel@mikelr.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <085b7f51-15b8-42e0-fcf0-66da839542c8@amd.com>
 <20210624045121.15643-1-mikel@mikelr.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <18a31cb0-9dae-0dc2-e33b-7ec555b586a8@amd.com>
Date: Wed, 30 Jun 2021 11:55:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624045121.15643-1-mikel@mikelr.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fd79:22d7:4c21:2421]
X-ClientProxiedBy: PR3P189CA0056.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fd79:22d7:4c21:2421]
 (2a02:908:1252:fb60:fd79:22d7:4c21:2421) by
 PR3P189CA0056.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 09:55:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eeb5d85-f609-41f8-31a5-08d93bad2916
X-MS-TrafficTypeDiagnostic: MN2PR12MB4638:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB46385C89BD75C05AD652A40D83019@MN2PR12MB4638.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:356;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QsySLWquBTzdGuSQtUF8f2WhJhT4mklGKqkKfGOK9uxzZOESmlCdoixiZumV0BTNeHsHzois3voJ8YY2ij5DFgyFeC9HpYBRIB9skUrnLwh2SnnU4wVYjFyaSA1kINcwb4IhiLX2A1by1BjOGsKdPPVlwS4Xcpa4Ut73UOV2WAi0AXPlDZGdO6b8p/LdbNOIH0PYf9JA+d5TLmqQCevVv7pfXGT45LvWtDcgO5vT4xhmbQGjB4dB1JyATJ3Fv/9RzmmubpTSNqBLLIl8Bhoe1pbBAQDPqn5kVhayMR8R36m/aW6CG8mKRNFQdse9YoK6/D3mtSBtkK09/P8Sa+1OlTgEEKOcnr4k8PzU8UsCFnwCNpFMMzaZ4c0Ke7GGbWypQerSJK6zgHdVyvAf8bBYB9vn+vQPrG8H5DSqpy23/eX7dGcDiZmG6PGsbC3Hj7e889i30MJbwFGK2tGOEMYI2mPFL/gU3Ane8s2rsXTbo7EN+zF1JnVMIz1fEKbn4kv9gRWXb4yVMmkVAtZrtujGPl0l3HmUI1zksifZ8bjCSo8QvqBsJCjUgxc5/CDRrz4shkRn3rWtk5ysmJL/6FbXAhzGp6VRkVdFS8I8QfnSdeYUGyqfAogKyi5Q2R+c9IaPScTHYQl9pl15HOXX8lmtzpJf1Vv0zoIS8DGB2uD5J+2N9ijdYV5JL9GB4EJy7hv/ks7UNzkaiArZP5H3+dIJkgABOrA4ZH94OjL9/vvb12kvrxsWSKpgxHYa1LF4S4oQgI+0+WrKKaePH1w6pku8tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(83380400001)(478600001)(36756003)(16526019)(921005)(186003)(31686004)(5660300002)(316002)(2906002)(31696002)(6666004)(8936002)(66476007)(2616005)(6486002)(86362001)(38100700002)(110136005)(66946007)(66556008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDRkekw4V1ltcTd0UGQ0K2IrUWFRV000d2FIY2lsMGM0LzZFMzBpNkZNbThZ?=
 =?utf-8?B?RmxtNjRMTWtkeGc0am9FTHAzelo4S0hycXhuazhxWExLdXFsdk1uNEhzaEVl?=
 =?utf-8?B?d3AxY0xjSHZjTkVKQ2hGOXlXWlkwbEdJZyt6ZSsveC94Z2hnMXJmNEhPRTh0?=
 =?utf-8?B?bEZhWW1kRW50R1lUQmI0dnVXREZwWjFvcVdCZEQxL1NvMEFNRkJoSisrb3J4?=
 =?utf-8?B?TW1vektNSUtjUlNBc090ZnZ0ck1KeGpQMUVwV0prUXJKb2ZFT2E3OTVmZXRK?=
 =?utf-8?B?bjRjbS9lR3FzN0ZacC9BV1hscjR4aHh6U25nVHc4OVB5YWJLb2xJVnpxK08z?=
 =?utf-8?B?NEdxR245cnV6WmRBZURwTm93NnR2cFVZU3pGUkwzR3NWeDZDQytsM3M2R3Vh?=
 =?utf-8?B?THJUVUJPTGJnU1EzYUNGeEdnbnN4L2ZFMVdyMHZFbnZnaTFZVzBMVHRnTkJk?=
 =?utf-8?B?QW9Pc1RZb2RhOVRxT1ViM3ZOUFAvQmZUcnk4RVk5MU9xdlZsZ25MZU5vNmp5?=
 =?utf-8?B?MXBhTURheE1QMkVjbSt3c3UzcEdxMU1KY3ZHWWUzQWQvM2FCcmFlRGFBb05w?=
 =?utf-8?B?bDMwR1ZiSzV4ZENCVnB3NEdCTTd4MWUxYnE1eVZxMmdzVWh5Y1VsUkxja21J?=
 =?utf-8?B?aVpQd04xUGdyYi9nNDhjZnV0UzNIdDNJSWkwb3FIczBtaTVLYlRYbiswY3RU?=
 =?utf-8?B?a1JHOU9vaXFtQlFaYWxaWkxSSHZ4c05uQWhFaFljZUl0c1A4VElSaEswUzJM?=
 =?utf-8?B?OWVneEN5bzg1MG9QMXVXZFBhNi9ORmt4M0c2N0F0VGJqbzJ2aHkrMXBwc2hV?=
 =?utf-8?B?TzA0cUJPdU1aRUdYTmdBMU5sSlMxdllpOEwxNXNIRklTMEFRZzYwVUdYcTJw?=
 =?utf-8?B?VWRZek9IOXh5clQ3emp3dkxhcjc5aUs5UkViS2tZVWIrWEw5enRqcXhIL2NQ?=
 =?utf-8?B?UW15RW5aMEZ4UGhuU21sTkdTUno3OTZpb0hYR1dibUZoTlBwd0tpRzQ4YTFR?=
 =?utf-8?B?QjY3NTA3YXlCMnBYN3JSYjJpaCtTMTQ2Y3YveXVEdDVQa2FqNG5jUlhiWGFC?=
 =?utf-8?B?UlN6NFJSWTRwdFQxR1RMMTFBdFhSUFIzaUsyYjZLL0hiaE9JZVlMbjFTdWpO?=
 =?utf-8?B?dW1jRlhhSWMxU3ovVkV4YUR1NkswSFJHR3Y2ZlNySVZzQUswM0djK0RmNUdz?=
 =?utf-8?B?S2ZkM29nQmFGZVVKYkNqT21zSmM5ZmhuS24wOSs1MHZ2M1NiTVpIb2QwaUor?=
 =?utf-8?B?K2FmRHZoZE52UWkrVWR3cTEwL3c1bTkrZkRJalorb3hKa2FXZ0VBUjZnNTlp?=
 =?utf-8?B?dWZGZmEzaG43WlJ2RDVXM1FmTDFQQ0lKdUZUaEh4blhaNzVERStyL3pNa2Vr?=
 =?utf-8?B?WWRId1VNSUxFWmd6TWgzNURXQ3BuckUxZ0hyMmQ5QlQwM25zd3V2RHBaV0Fa?=
 =?utf-8?B?aWl3SEI2a3plZ1ZiZHY0TmxSRUxvdXN1Nm04NW9raGlQcVZlazNsNTBDVzRV?=
 =?utf-8?B?NFF6MzZOc2pXQmpsSFowdEZvOEhTelEvdW91T0lDY3ozdmNrb2ZPY0pzTXo4?=
 =?utf-8?B?WFVWR3J3QkdyaXVidklJSldQOGxuNDFQUmtURHBVU1VOY2ZuWGgwRjRuL29Q?=
 =?utf-8?B?bzAraGRiaG1pNnBscmdXNmY5OVRjbVorTnI1Smo0L1BlR21xalpQOVVzOUtj?=
 =?utf-8?B?YXRlb1A4Z2NERE9sMTdZWEp4eGJaVThVS1JFSUdZdVJTbDJwbStxRFo0bkhk?=
 =?utf-8?B?UFBTcDFPT3Y1ZUZ3VnlxaUdGV3RwcUVid01DTFhTTnN3Uk8xb2xiZnJlMmYy?=
 =?utf-8?B?VkhLSW96Y3ROaDg1NjRTeExZcU9yaFJNUXU3OGN3SS90ZVBkcUtycGRZdUFw?=
 =?utf-8?Q?aGqXoZ24EZss2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eeb5d85-f609-41f8-31a5-08d93bad2916
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 09:55:15.5856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xUm2bwUwrk1Peaf9VRvX5+2mKY9Fmy8gXtQBDgglItWqPbxPrV+wDa1Y2Ya5nqw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4638
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

Am 24.06.21 um 06:51 schrieb Mikel Rychliski:
> radeon_ttm_bo_destroy() is attempting to access the resource object to
> update memory counters. However, the resource object is already freed when
> ttm calls this function via the destroy callback. This causes an oops when
> a bo is freed:
>
> 	BUG: kernel NULL pointer dereference, address: 0000000000000010
> 	RIP: 0010:radeon_ttm_bo_destroy+0x2c/0x100 [radeon]
> 	Call Trace:
> 	 radeon_bo_unref+0x1a/0x30 [radeon]
> 	 radeon_gem_object_free+0x33/0x50 [radeon]
> 	 drm_gem_object_release_handle+0x69/0x70 [drm]
> 	 drm_gem_handle_delete+0x62/0xa0 [drm]
> 	 ? drm_mode_destroy_dumb+0x40/0x40 [drm]
> 	 drm_ioctl_kernel+0xb2/0xf0 [drm]
> 	 drm_ioctl+0x30a/0x3c0 [drm]
> 	 ? drm_mode_destroy_dumb+0x40/0x40 [drm]
> 	 radeon_drm_ioctl+0x49/0x80 [radeon]
> 	 __x64_sys_ioctl+0x8e/0xd0
>
> Avoid the issue by updating the counters in the delete_mem_notify callback
> instead. Also, fix memory statistic updating in radeon_bo_move() to
> identify the source type correctly. The source type needs to be saved
> before the move, because the moved from object may be altered by the move.
>
> Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")
> Signed-off-by: Mikel Rychliski <mikel@mikelr.com>

So, back from vacation. I've reviewed and pushed the patch to drm-misc-next.

Thanks for the help,
Christian.

> ---
>   drivers/gpu/drm/radeon/radeon_object.c | 29 ++++++++++++-----------------
>   drivers/gpu/drm/radeon/radeon_object.h |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c    | 13 ++++++++++---
>   3 files changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index bfaaa3c969a3..56ede9d63b12 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -49,23 +49,23 @@ static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
>    * function are calling it.
>    */
>   
> -static void radeon_update_memory_usage(struct radeon_bo *bo,
> -				       unsigned mem_type, int sign)
> +static void radeon_update_memory_usage(struct ttm_buffer_object *bo,
> +				       unsigned int mem_type, int sign)
>   {
> -	struct radeon_device *rdev = bo->rdev;
> +	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
>   
>   	switch (mem_type) {
>   	case TTM_PL_TT:
>   		if (sign > 0)
> -			atomic64_add(bo->tbo.base.size, &rdev->gtt_usage);
> +			atomic64_add(bo->base.size, &rdev->gtt_usage);
>   		else
> -			atomic64_sub(bo->tbo.base.size, &rdev->gtt_usage);
> +			atomic64_sub(bo->base.size, &rdev->gtt_usage);
>   		break;
>   	case TTM_PL_VRAM:
>   		if (sign > 0)
> -			atomic64_add(bo->tbo.base.size, &rdev->vram_usage);
> +			atomic64_add(bo->base.size, &rdev->vram_usage);
>   		else
> -			atomic64_sub(bo->tbo.base.size, &rdev->vram_usage);
> +			atomic64_sub(bo->base.size, &rdev->vram_usage);
>   		break;
>   	}
>   }
> @@ -76,8 +76,6 @@ static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
>   
>   	bo = container_of(tbo, struct radeon_bo, tbo);
>   
> -	radeon_update_memory_usage(bo, bo->tbo.resource->mem_type, -1);
> -
>   	mutex_lock(&bo->rdev->gem.mutex);
>   	list_del_init(&bo->list);
>   	mutex_unlock(&bo->rdev->gem.mutex);
> @@ -727,24 +725,21 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
>   }
>   
>   void radeon_bo_move_notify(struct ttm_buffer_object *bo,
> -			   bool evict,
> +			   unsigned int old_type,
>   			   struct ttm_resource *new_mem)
>   {
>   	struct radeon_bo *rbo;
>   
> +	radeon_update_memory_usage(bo, old_type, -1);
> +	if (new_mem)
> +		radeon_update_memory_usage(bo, new_mem->mem_type, 1);
> +
>   	if (!radeon_ttm_bo_is_radeon_bo(bo))
>   		return;
>   
>   	rbo = container_of(bo, struct radeon_bo, tbo);
>   	radeon_bo_check_tiling(rbo, 0, 1);
>   	radeon_vm_bo_invalidate(rbo->rdev, rbo);
> -
> -	/* update statistics */
> -	if (!new_mem)
> -		return;
> -
> -	radeon_update_memory_usage(rbo, bo->resource->mem_type, -1);
> -	radeon_update_memory_usage(rbo, new_mem->mem_type, 1);
>   }
>   
>   vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
> index 1739c6a142cd..1afc7992ef91 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -161,7 +161,7 @@ extern void radeon_bo_get_tiling_flags(struct radeon_bo *bo,
>   extern int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
>   				bool force_drop);
>   extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
> -				  bool evict,
> +				  unsigned int old_type,
>   				  struct ttm_resource *new_mem);
>   extern vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
>   extern int radeon_bo_get_surface_reg(struct radeon_bo *bo);
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index ad2a5a791bba..a06d4cc2fb1c 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -199,7 +199,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   	struct ttm_resource *old_mem = bo->resource;
>   	struct radeon_device *rdev;
>   	struct radeon_bo *rbo;
> -	int r;
> +	int r, old_type;
>   
>   	if (new_mem->mem_type == TTM_PL_TT) {
>   		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
> @@ -216,6 +216,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   	if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
>   		return -EINVAL;
>   
> +	/* Save old type for statistics update */
> +	old_type = old_mem->mem_type;
> +
>   	rdev = radeon_get_rdev(bo->bdev);
>   	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
>   		ttm_bo_move_null(bo, new_mem);
> @@ -261,7 +264,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   out:
>   	/* update statistics */
>   	atomic64_add(bo->base.size, &rdev->num_bytes_moved);
> -	radeon_bo_move_notify(bo, evict, new_mem);
> +	radeon_bo_move_notify(bo, old_type, new_mem);
>   	return 0;
>   }
>   
> @@ -682,7 +685,11 @@ bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev,
>   static void
>   radeon_bo_delete_mem_notify(struct ttm_buffer_object *bo)
>   {
> -	radeon_bo_move_notify(bo, false, NULL);
> +	unsigned int old_type = TTM_PL_SYSTEM;
> +
> +	if (bo->resource)
> +		old_type = bo->resource->mem_type;
> +	radeon_bo_move_notify(bo, old_type, NULL);
>   }
>   
>   static struct ttm_device_funcs radeon_bo_driver = {

