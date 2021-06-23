Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A6A3B143F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 08:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14766E29D;
	Wed, 23 Jun 2021 06:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AFD6E29D;
 Wed, 23 Jun 2021 06:55:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UW1GJWFJa5nLkWXmY4TwNPtR4jdvq8DM/ECwjkmHuS0XIGVmHw24/ounUMv4F8o1ISCN81ivLPW2BuFzNKwyTBOUyIRGHp4gx+acrmQ+r1jtGcLaD5vEo36eryN3HN4rx4j4p1kQK6hgEZ585ROIBhYspc+utbWDNKlVsmKl8tFFfEDNCqLBV6EEpCODdbdq1lp4BbYz5fPAyPYckHp1SozSR9Wqw5GbDy2if4DVUmDcmxZueUC02cB58yu0mrMQSYEBLSEeZl/+901lsqWHCdBu4J1BqhcfXJd0lp8ZguK7JOC+oS3/aCUjmq9M5p5ELH9+FgK246xpMv1y9rNL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbDwGjHXro7de7rsBma6YmoUCskHpRkqkavVp2bDM50=;
 b=WL3IcsfB5J/3xroO7ICibBVycCZuH9p78VNu2wd5P3tIye/zO9gChVq3Zuud/ZH/bS2rtSQubIXIBiF6zhdz56sfXWCXVqIg7+hUwG1c6+e/Pk4lLqEScC0sI8pP2D3wDPv3KkeMBIz9YvGRJDnKVz/FvravBGkZk4zHV0tVwYwGaYmyZyZJ9cTgHOaj9FWk5dndRRwd1rT8Q/303E+BKNoVdSn8pihKX3geOhZe1TES3QlOWR9pYnm/JeC0mizEWQ9j43ZY8+z19trGysC2anL1XvyJqtrVDXr/zEEBBaP5X1ml1/FCSUwuKnSrF97G1oB3E6fwg1zgsFe49VO3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbDwGjHXro7de7rsBma6YmoUCskHpRkqkavVp2bDM50=;
 b=XJXKOnMs9p4N99aHSOthrl+rhNO/r8lMp8Ah1GNiZZUsT92Lt8pYHhQnaLENw6ep06q+IHG73tWGoVHZ+h3NglTItgrcVsKSM+YI87CzJl+SLM7E/d16KPeKC6u4b87yXPT+LAtOpylIHOygPpV18VZWMh+XFfjd8dZnF1BjJaA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 23 Jun
 2021 06:55:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 06:55:07 +0000
Subject: Re: [PATCH v2] drm/radeon: Fix NULL dereference when updating memory
 stats
To: Mikel Rychliski <mikel@mikelr.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210622212613.16302-1-mikel@mikelr.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <085b7f51-15b8-42e0-fcf0-66da839542c8@amd.com>
Date: Wed, 23 Jun 2021 08:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622212613.16302-1-mikel@mikelr.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
X-ClientProxiedBy: PR0P264CA0171.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:69e4:a619:aa86:4e9c]
 (2a02:908:1252:fb60:69e4:a619:aa86:4e9c) by
 PR0P264CA0171.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 06:55:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1b6dc5a-8a8f-465d-c801-08d93613d644
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2386CB9FA185EBB769B22C9483089@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bgHiI8gvBy4cBUkwi/yyhC2D9iBkJVGr1qz9TETf+qlCS0pAepn2SBFodYJ3k5kdnS3kuQPOwTf1tuP1xbvtxG143bE6VVqUxPhI7/MG1A0cNwNIUsiqmtrkeoXR8ORn6m3WcWjFuTV8XT5nVxLwrOYL7fOrOFYtB0vzweBIJRdDFeF/PtFYg4joIDorr3EUrp+mko258GOO+71s+rnO7nRFpWfKhS81/jaAGYdYPKGFRvbqv7ykfkggTbtN92WjirXjWzP2tcuVYXLLA/wsbnxWOZvVn+0c277iXXHG43dg7lyQLcX+E++1SH8qkramGzMiK4wclROV5+5k/8448VkOdidwv7yMW0xugPZinFML85J7Q3cQ4ghlJAT5MS6hu02G3yHKMgIF77tF3M9IjU3g4qxr4UAtqa7rKpZ+a1r0hNVRh7oQgztmue08zjK0CVtOJ/hykoUCpwd5ozzr6SlQDszBVhwyjKNKhjEtSeBeKlEzfQzHq7RsbUayEBGzPjVeW+r7stNrjq8wvqgFw6RkY3CPduRKzBoHgbBVFsemXmoIivJdB89BgQ8ZdsnMXXajtsLx1Lj76fqzbDtPON4dPJBBiW2ERQpuh/vB0RNje4e5Wmwn7YOmGXXwxwOJ58yDKabpXSLHgra8+PjUARYWqYHb05Zo8JdcKF4XD3r5/g7w3k207cxUJfTNaut+OktCdfAtxfhWE73ml4jjMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(86362001)(110136005)(38100700002)(921005)(5660300002)(31696002)(36756003)(316002)(16526019)(8676002)(6486002)(66946007)(2616005)(8936002)(66556008)(66476007)(478600001)(31686004)(2906002)(83380400001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0pUZGdWS0xONk9maVFwOFhQbkJNMHgvS3dSc3UwSjROUDkyeldjbzJDWEJW?=
 =?utf-8?B?cGNabDlWVnJMK1BPd05mSkdWSCtlTjRWZitqTURvYTNPWDRlcDlLcUNuMCtK?=
 =?utf-8?B?Y05ML3Fmem8rNmQ2L05UdVNhbTZmeW80dXp2dGFHck1aTlYwbG40eERCcVRh?=
 =?utf-8?B?YWtSbjRMbkFWdU04M04xemkvYWx2c3FjcGpFbUZrckthWG9rRjdIVjFkZG1K?=
 =?utf-8?B?QnVuc1ZrbFlJd3lZYk1XN21vK1ZYZVVqaHBsaS82RW9Nd0xZWVlrcEZLVFdH?=
 =?utf-8?B?b2dUNEhwSVVROTNucis2K2FJTkoyRUVPMFdNYzBlNEx4L3I4VncwU2VaNzVI?=
 =?utf-8?B?OXpyUEpIZjY0RmE3a2J6QmFvd1RydEd4dzZpT2tjU1NrR2U0bnZQQllrdzk2?=
 =?utf-8?B?bFllN0lZWm1tWFFQclFqSklMSXpsS0V5SUx3TWEzMFdZdDhjVjdLRHhYam9l?=
 =?utf-8?B?TFF3c2VpMVl3MXJuVjV6eXN1RlJDVGl4bGNqdDVoWUEyRGpuQXNuZ3JtZFJP?=
 =?utf-8?B?OUpuM3VJc0V4OUNMWHorQVJ2eWFETlAyYWE2SDVyUkZsMTNUUEVhRTQ2SEE5?=
 =?utf-8?B?bzJhYzZOYVlhSmFaQ2ZQVk91RFE1SlRVZk0rRDhHOUo1K2EzT3RNSGFJT3c0?=
 =?utf-8?B?Q0Y1N0JnVGRGaTNhdjRMaGFUQWR4MkZKTlBHSXZPeGJOVkFXNnhpemVoVlJh?=
 =?utf-8?B?dEtFSVJxUGhwek9vRm02a0R0cVFYVThydWlMUmpLQVNER3JpQSs4UGxkenps?=
 =?utf-8?B?Q29mUHpQQ05oekthQVdFZk1Yc0Q1QTR3ZjlkVlgvL1p4STkxZDU0MFpXajdP?=
 =?utf-8?B?OXdSNFpCd2NmMFpNZ3RFM1FzVG9NdFFDTW4vTHQ3YTVEb0tEZUtPMUtmY1Np?=
 =?utf-8?B?WGRuYnVteW5Gbk5GZmIyQ3E5ZnA5cDNjb3pQcUo2OWlvWXFvbURwRnpaV0tu?=
 =?utf-8?B?NnNlSDBYU1BNVHhmSHNKckdKM2orODBDTHhxcDRYeVc1WlRhSnFyemdOemRQ?=
 =?utf-8?B?TGttSmZuZVN1eTFtVjhPWlVyR0d3SHhlWDMraGlhNCtSWm8vK1dKTTRheVAw?=
 =?utf-8?B?V08xSXQ2SytFZFJ2MHlzRml4VEEreFQ3Z09KcElGUHhaQ3JieTAzcHBUK1g5?=
 =?utf-8?B?OFQvOVFhR3czUjNHWVNwUG9VL3hXWVo1VnpwSHh3SnVLeGgzb0hSRzhNT2I3?=
 =?utf-8?B?d0lNS3BqblpaMnhtcllXaDVQSjBwM3p5ZjlnVjdNNkk5SnNoS1FmTGJubUQ0?=
 =?utf-8?B?WXVNK2JzV0FZOENtTkg1QXZ3ZFAvNHpmN2pvZCtSMjFJMi9aWUs3SU5vV0N1?=
 =?utf-8?B?eUZjcmxqZElOZ2pIWDZEWEtWaVJTVzV4M3BlVFA3QTUraDV0c25yd3dxWVlt?=
 =?utf-8?B?cWZIbStLTGhWU2MxY1dhUGlaaE9leVV0SFlFd1Nxc2xORDI5dW1jaUs5UWdD?=
 =?utf-8?B?cXg4RE5VblBLWllDNHNudW1RVEpGM0I3RG90VFY1THpiWmFBYVl0TDJ2WWNO?=
 =?utf-8?B?NnN1Z3RZVjhxSVRSN2V3R2hyQ1cyeEpEZ1pKQlBZeFRCOGdvckl2Sm1qOTFu?=
 =?utf-8?B?VUVMbFNqbGgrSkFRWEszT2lXNDN4SXB0RjdNUE02NDBrYmIrSE9oaVVFZlRr?=
 =?utf-8?B?OHBMUVQ4OWZoelY3RHFEa2NpeWJYbk01N3RzQ1Z3bm10V3k4LzlHVmNDaUs3?=
 =?utf-8?B?SERLMTd2MTRlcmYzYk9HWWlyVVQyNnFKS0JwbnBjdHFuZ1N3Ykg5VG0velpV?=
 =?utf-8?B?d082ejBXREQzQWh2ZE8rQW5kVForSEJia0dhVUQrZlJ5QWI3eEpYMm9mQnF0?=
 =?utf-8?B?eHNjc2h6UnVjUCtnLzNGb3k2eFl1dkl3aG1HOWQ2TVp1WjZIRGxQcFBmTXdh?=
 =?utf-8?Q?vQ+AsTIMjJkT5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b6dc5a-8a8f-465d-c801-08d93613d644
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 06:55:07.8685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rv9ZRLccRjmOioPJOstshvbHuQpQo2fMUIxbaHq6j7LAv+rWgfghN8HyjJ9cW4i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
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

Am 22.06.21 um 23:26 schrieb Mikel Rychliski:
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
> ---
>
> v2: Update statistics on ghost object destroy
>
>   drivers/gpu/drm/radeon/radeon_object.c | 33 ++++++++-------------------------
>   drivers/gpu/drm/radeon/radeon_object.h |  7 ++++---
>   drivers/gpu/drm/radeon/radeon_ttm.c    | 20 +++++++++++++++++---
>   3 files changed, 29 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index bfaaa3c969a3..e0f98b394acd 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -49,23 +49,23 @@ static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
>    * function are calling it.
>    */
>   
> -static void radeon_update_memory_usage(struct radeon_bo *bo,
> -				       unsigned mem_type, int sign)
> +void radeon_update_memory_usage(struct ttm_buffer_object *bo,
> +				unsigned int mem_type, int sign)
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
> @@ -726,25 +724,10 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
>   	return radeon_bo_get_surface_reg(bo);
>   }
>   
> -void radeon_bo_move_notify(struct ttm_buffer_object *bo,
> -			   bool evict,
> -			   struct ttm_resource *new_mem)
> +void radeon_bo_move_notify(struct radeon_bo *rbo)

Please rather keep the new resource as parameter here and update before 
adjusting bo->resource.

This way you also don't need to export radeon_update_memory_usage().

Christian.

>   {
> -	struct radeon_bo *rbo;
> -
> -	if (!radeon_ttm_bo_is_radeon_bo(bo))
> -		return;
> -
> -	rbo = container_of(bo, struct radeon_bo, tbo);
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
> index 1739c6a142cd..0be50d28bafa 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -133,6 +133,9 @@ static inline u64 radeon_bo_mmap_offset(struct radeon_bo *bo)
>   	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
>   }
>   
> +extern void radeon_update_memory_usage(struct ttm_buffer_object *bo,
> +				       unsigned int mem_type, int sign);
> +
>   extern int radeon_bo_create(struct radeon_device *rdev,
>   			    unsigned long size, int byte_align,
>   			    bool kernel, u32 domain, u32 flags,
> @@ -160,9 +163,7 @@ extern void radeon_bo_get_tiling_flags(struct radeon_bo *bo,
>   				u32 *tiling_flags, u32 *pitch);
>   extern int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
>   				bool force_drop);
> -extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
> -				  bool evict,
> -				  struct ttm_resource *new_mem);
> +extern void radeon_bo_move_notify(struct radeon_bo *rbo);
>   extern vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
>   extern int radeon_bo_get_surface_reg(struct radeon_bo *bo);
>   extern void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index ad2a5a791bba..1bc0648c5865 100644
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
> @@ -261,7 +264,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   out:
>   	/* update statistics */
>   	atomic64_add(bo->base.size, &rdev->num_bytes_moved);
> -	radeon_bo_move_notify(bo, evict, new_mem);
> +	radeon_update_memory_usage(bo, old_type, -1);
> +	radeon_update_memory_usage(bo, new_mem->mem_type, 1);
> +	radeon_bo_move_notify(rbo);
>   	return 0;
>   }
>   
> @@ -682,7 +687,16 @@ bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev,
>   static void
>   radeon_bo_delete_mem_notify(struct ttm_buffer_object *bo)
>   {
> -	radeon_bo_move_notify(bo, false, NULL);
> +	struct radeon_bo *rbo;
> +
> +	if (bo->resource)
> +		radeon_update_memory_usage(bo, bo->resource->mem_type, -1);
> +
> +	if (!radeon_ttm_bo_is_radeon_bo(bo))
> +		return;
> +
> +	rbo = container_of(bo, struct radeon_bo, tbo);
> +	radeon_bo_move_notify(rbo);
>   }
>   
>   static struct ttm_device_funcs radeon_bo_driver = {

