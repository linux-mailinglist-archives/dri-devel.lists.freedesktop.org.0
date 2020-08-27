Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CBB254476
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 13:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9E56E16B;
	Thu, 27 Aug 2020 11:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE626E16B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 11:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6/UPJPq8xb+tgk4PTQ/2PDDAF7u/3v4xfkQZZZn4iTLeoHkUp/Q3gdhFbTLHVvQFFETvgQimcKNJUKjiP5ml1KJXQXRXZd3RcUpE9qziBwT3X5hhnCrF2980g0QgbYmkAnvXU67d5iEG8DXZedPb63q9OjmGSm17X8lM04ZMFxdHBR2x/mTqJKbXfsC/zqvIBVxUqTVAM6u8jnMQphaXADfQQIi755QTmDcM8LpatUp9liz293hRTuYMpea7E/DB6B7hyPrs57gX7DjwafYvlUuRtq/mtD+zgrFzP9u9nfIEzYDVPg5wsdymDEdoJ9nch/6lN3ezNGGGEbSuamlWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEulzzyFbnny+DduBLBU2kUN42lVCtGozwfsN+SL0aI=;
 b=RGyAMx/n1fAHm0m6Rr1Eel3kUHK2c2flyFdYvhOw3TMLf+escjoDToYj4vL5BDpVCAmfUpO3H8Y1fvqDXWs9LB16FY6lbmFAma6IQIdhcaevkgho7jfCzrrEPGgHlfTmndK7R9Yadr0ZYnzV1h6+w7T+GDQ25Urx5iMkK+faH4Cm0oApSbOOMcm3+IajwyXWb6dbbMuCfDB02qHg9iy9tZvTmEdF3mkP0uTs27DQitN+oWnZVHBYdUTkUO2A1ZlpPj9AAm+LmV1k/Ht3cwxKYx6EJBas1/BgmhxKY9I4jyUBdyBpl7gdbER+l6c2nfTFKeHjeBRfUmVPbVnzAUEfQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEulzzyFbnny+DduBLBU2kUN42lVCtGozwfsN+SL0aI=;
 b=pGqEppCA39cofKMIRX1/1KPMkAdIxJb+WmpNSNJ6yRa7Oq3fvn9XrPyNpnc661HmJpWqrm+s4y+4pNpX/irt2ECjd6wknBhBR5/cM7KiJj6fu8LHhEV2Qcgu33fFikm5rpeSMj7ynWaT/FwklAXzc5Us9FIjjbvcAsOkTqTWQqU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3694.namprd12.prod.outlook.com (2603:10b6:208:165::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Thu, 27 Aug
 2020 11:42:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.030; Thu, 27 Aug 2020
 11:42:41 +0000
Subject: Re: [PATCH 07/23] drm/radeon/ttm: move to driver binding/destroy
 functions.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200826014428.828392-1-airlied@gmail.com>
 <20200826014428.828392-8-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d2ea1a5e-2b9b-8e38-5159-d894cdda1fab@amd.com>
Date: Thu, 27 Aug 2020 13:42:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200826014428.828392-8-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.10 via Frontend Transport; Thu, 27 Aug 2020 11:42:40 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34b043ac-b3c2-42a9-2d45-08d84a7e4e48
X-MS-TrafficTypeDiagnostic: MN2PR12MB3694:
X-Microsoft-Antispam-PRVS: <MN2PR12MB369490E0FC26570E842D33B383550@MN2PR12MB3694.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QMQ99XZQBN4vF4N1/6paz+bV7yZQi1/4P5ZEITL3IvdGm4WN+ZwTSeDJQmyGS2yTMt2fGAVyVlvGBQFu+dMR5hx88DTkgpZsoenQdHZ3T+6jQWpoSznDtR7jv4bAmx6oxfGMk+XqvQ/gWwlIOZv4jhD8rhWiP4qwR+7EF3DVDzBSdJZ2surry7iIqj5UreISuDNlIMqu5D/0z94FIi+70oAuplK9+sJlXNLfQLZkHoUu8eiMosm8FChJoMwLY3cvvodE4TGm+KpZspSgr8Y0mP5hQ0midjCImWwQH+hPiGpgXOYooBNY81xYeetLdrfIuKOyx98scf0SRSpxGgL34ImCwxAtjEn3//gObSwjt8rdeJDK++V79r7ixP+BrnhAwjNN7mbZcMxv5A+2p6ENMHUt/gxvNDH6rxRb/SItnhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(2906002)(2616005)(6666004)(30864003)(6486002)(52116002)(86362001)(4326008)(8676002)(83380400001)(66476007)(31696002)(8936002)(16526019)(186003)(66946007)(5660300002)(316002)(478600001)(36756003)(66556008)(31686004)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lesK5NkHsDGcW298yUJxTGM+ivNdYEgGrnoe/CiMHu/BVIEg9NuQf0aaMQD/Z/Fl/k3Nz4DIEkP22ndB0DcP3TSDNQjAlZLuG98CoyoqmGmkflRwhqKuCAOrUb9vBaAAzie1wkw3/xkq8pO8iuaEKtCSq2lBQ0+F9+ujczQ4ZB/KFh2XT3x/QSeboohFxTLegZvMQtBxKFUybuB4voR49G7Cn4UvbbJcfjJhs3sElhTqn/0Pq+RVW5zJRYTMoKD2Pf/kx4rDQPyWyvTViW3q3F0xm0rn8hP+K4K8P0jqOhavR6Glxn8rFEszTybV/kLIUJ1+rBk4+vW0ekZWNtgBxFbl/O/PqJBAYRCYD4TUbPGv37Se9X79R2R6JzKMQU1M+KL65GcXbh94ZxXZHrpF8OCeCAtSdLlX0ygQZ0lHr0nVjYBOu/khJiToUKBTtheW4UjWIfuLGUfHYPXg2jX4lEsnlLbzhqMXJ/LGuEkCGlcEmATkIRuQ0a+dU8vi89v5dAVGJcci9Cg5ilFtESfN/1DF0C/SZwZL4lVWLC74/nHVqa3r/hjU5gm25cgV6lIchV8IoPQSx5oc8IWScQG5pPVHgwkuzdZMG0pmrE/xn8fBYws3mMhTkyQVmr8+HYgl83SV7Yx9J551QiMb5cnkCfV0SEAhYnrvDzkSUXeOKGn/IF8fnp1zT8dB/4bqiAd1Y1G/4WCdFlTqFrt7K8PMDg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b043ac-b3c2-42a9-2d45-08d84a7e4e48
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 11:42:41.4531 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmiHWp/7qV+rwHV4RSlBkzrrx39kuwRnvnM9Mdfg/JoHH82pKRuzznUKxo5MEsvk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3694
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.08.20 um 03:44 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Do agp decision in the driver, instead of special binding funcs
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/radeon/radeon.h        |  7 +-
>   drivers/gpu/drm/radeon/radeon_cs.c     |  2 +-
>   drivers/gpu/drm/radeon/radeon_gem.c    |  6 +-
>   drivers/gpu/drm/radeon/radeon_object.c |  2 +-
>   drivers/gpu/drm/radeon/radeon_prime.c  |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c    | 92 ++++++++++++++++++++------
>   drivers/gpu/drm/radeon/radeon_vm.c     |  2 +-
>   7 files changed, 81 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index cc4f58d16589..df6f0b49836b 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2815,10 +2815,11 @@ extern void radeon_legacy_set_clock_gating(struct radeon_device *rdev, int enabl
>   extern void radeon_atom_set_clock_gating(struct radeon_device *rdev, int enable);
>   extern void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain);
>   extern bool radeon_ttm_bo_is_radeon_bo(struct ttm_buffer_object *bo);
> -extern int radeon_ttm_tt_set_userptr(struct ttm_tt *ttm, uint64_t addr,
> +extern int radeon_ttm_tt_set_userptr(struct radeon_device *rdev,
> +				     struct ttm_tt *ttm, uint64_t addr,
>   				     uint32_t flags);
> -extern bool radeon_ttm_tt_has_userptr(struct ttm_tt *ttm);
> -extern bool radeon_ttm_tt_is_readonly(struct ttm_tt *ttm);
> +extern bool radeon_ttm_tt_has_userptr(struct radeon_device *rdev, struct ttm_tt *ttm);
> +extern bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev, struct ttm_tt *ttm);
>   extern void radeon_vram_location(struct radeon_device *rdev, struct radeon_mc *mc, u64 base);
>   extern void radeon_gtt_location(struct radeon_device *rdev, struct radeon_mc *mc);
>   extern int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon);
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
> index 33ae1b883268..21ce2f9502c0 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -160,7 +160,7 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
>   			p->relocs[i].allowed_domains = domain;
>   		}
>   
> -		if (radeon_ttm_tt_has_userptr(p->relocs[i].robj->tbo.ttm)) {
> +		if (radeon_ttm_tt_has_userptr(p->rdev, p->relocs[i].robj->tbo.ttm)) {
>   			uint32_t domain = p->relocs[i].preferred_domains;
>   			if (!(domain & RADEON_GEM_DOMAIN_GTT)) {
>   				DRM_ERROR("Only RADEON_GEM_DOMAIN_GTT is "
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 7f5dfe04789e..e5c4271e64ed 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -331,7 +331,7 @@ int radeon_gem_userptr_ioctl(struct drm_device *dev, void *data,
>   		goto handle_lockup;
>   
>   	bo = gem_to_radeon_bo(gobj);
> -	r = radeon_ttm_tt_set_userptr(bo->tbo.ttm, args->addr, args->flags);
> +	r = radeon_ttm_tt_set_userptr(rdev, bo->tbo.ttm, args->addr, args->flags);
>   	if (r)
>   		goto release_object;
>   
> @@ -420,7 +420,7 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
>   		return -ENOENT;
>   	}
>   	robj = gem_to_radeon_bo(gobj);
> -	if (radeon_ttm_tt_has_userptr(robj->tbo.ttm)) {
> +	if (radeon_ttm_tt_has_userptr(robj->rdev, robj->tbo.ttm)) {
>   		drm_gem_object_put(gobj);
>   		return -EPERM;
>   	}
> @@ -721,7 +721,7 @@ int radeon_gem_op_ioctl(struct drm_device *dev, void *data,
>   	robj = gem_to_radeon_bo(gobj);
>   
>   	r = -EPERM;
> -	if (radeon_ttm_tt_has_userptr(robj->tbo.ttm))
> +	if (radeon_ttm_tt_has_userptr(robj->rdev, robj->tbo.ttm))
>   		goto out;
>   
>   	r = radeon_bo_reserve(robj, false);
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index bb7582afd803..3fcd15d21ddc 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -331,7 +331,7 @@ int radeon_bo_pin_restricted(struct radeon_bo *bo, u32 domain, u64 max_offset,
>   	struct ttm_operation_ctx ctx = { false, false };
>   	int r, i;
>   
> -	if (radeon_ttm_tt_has_userptr(bo->tbo.ttm))
> +	if (radeon_ttm_tt_has_userptr(bo->rdev, bo->tbo.ttm))
>   		return -EPERM;
>   
>   	if (bo->pin_count) {
> diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
> index b906e8fbd5f3..d6d9c8b46ab4 100644
> --- a/drivers/gpu/drm/radeon/radeon_prime.c
> +++ b/drivers/gpu/drm/radeon/radeon_prime.c
> @@ -121,7 +121,7 @@ struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
>   					int flags)
>   {
>   	struct radeon_bo *bo = gem_to_radeon_bo(gobj);
> -	if (radeon_ttm_tt_has_userptr(bo->tbo.ttm))
> +	if (radeon_ttm_tt_has_userptr(bo->rdev, bo->tbo.ttm))
>   		return ERR_PTR(-EPERM);
>   	return drm_gem_prime_export(gobj, flags);
>   }
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 1d3e8bb69f8e..af5479ea154c 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -141,8 +141,9 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
>   static int radeon_verify_access(struct ttm_buffer_object *bo, struct file *filp)
>   {
>   	struct radeon_bo *rbo = container_of(bo, struct radeon_bo, tbo);
> +	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
>   
> -	if (radeon_ttm_tt_has_userptr(bo->ttm))
> +	if (radeon_ttm_tt_has_userptr(rdev, bo->ttm))
>   		return -EPERM;
>   	return drm_vma_node_verify_access(&rbo->tbo.base.vma_node,
>   					  filp->private_data);
> @@ -561,12 +562,6 @@ static void radeon_ttm_backend_destroy(struct ttm_bo_device *bdev, struct ttm_tt
>   	kfree(gtt);
>   }
>   
> -static struct ttm_backend_func radeon_backend_func = {
> -	.bind = &radeon_ttm_backend_bind,
> -	.unbind = &radeon_ttm_backend_unbind,
> -	.destroy = &radeon_ttm_backend_destroy,
> -};
> -
>   static struct ttm_tt *radeon_ttm_tt_create(struct ttm_buffer_object *bo,
>   					   uint32_t page_flags)
>   {
> @@ -585,7 +580,6 @@ static struct ttm_tt *radeon_ttm_tt_create(struct ttm_buffer_object *bo,
>   	if (gtt == NULL) {
>   		return NULL;
>   	}
> -	gtt->ttm.ttm.func = &radeon_backend_func;
>   	if (ttm_dma_tt_init(&gtt->ttm, bo, page_flags)) {
>   		kfree(gtt);
>   		return NULL;
> @@ -593,9 +587,16 @@ static struct ttm_tt *radeon_ttm_tt_create(struct ttm_buffer_object *bo,
>   	return &gtt->ttm.ttm;
>   }
>   
> -static struct radeon_ttm_tt *radeon_ttm_tt_to_gtt(struct ttm_tt *ttm)
> +static struct radeon_ttm_tt *radeon_ttm_tt_to_gtt(struct radeon_device *rdev,
> +						  struct ttm_tt *ttm)
>   {
> -	if (!ttm || ttm->func != &radeon_backend_func)
> +#if IS_ENABLED(CONFIG_AGP)
> +	if (rdev->flags & RADEON_IS_AGP) {
> +		return NULL;
> +	}

Style nit: You can drop the {}.

> +#endif
> +
> +	if (!ttm)
>   		return NULL;
>   	return (struct radeon_ttm_tt *)ttm;

Maybe turn this into a container_of while at it.

Apart from that looks good to me,
Christian.

>   }
> @@ -604,8 +605,8 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
>   				  struct ttm_tt *ttm,
>   				  struct ttm_operation_ctx *ctx)
>   {
> -	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
> -	struct radeon_device *rdev;
> +	struct radeon_device *rdev = radeon_get_rdev(bdev);
> +	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
>   	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>   
>   	if (gtt && gtt->userptr) {
> @@ -625,7 +626,6 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
>   		return 0;
>   	}
>   
> -	rdev = radeon_get_rdev(bdev);
>   #if IS_ENABLED(CONFIG_AGP)
>   	if (rdev->flags & RADEON_IS_AGP) {
>   		return ttm_agp_tt_populate(bdev, ttm, ctx);
> @@ -643,8 +643,8 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
>   
>   static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
>   {
> -	struct radeon_device *rdev;
> -	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
> +	struct radeon_device *rdev = radeon_get_rdev(bdev);
> +	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
>   	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>   
>   	if (gtt && gtt->userptr) {
> @@ -656,7 +656,6 @@ static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *
>   	if (slave)
>   		return;
>   
> -	rdev = radeon_get_rdev(bdev);
>   #if IS_ENABLED(CONFIG_AGP)
>   	if (rdev->flags & RADEON_IS_AGP) {
>   		ttm_agp_tt_unpopulate(bdev, ttm);
> @@ -674,10 +673,11 @@ static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *
>   	ttm_unmap_and_unpopulate_pages(rdev->dev, &gtt->ttm);
>   }
>   
> -int radeon_ttm_tt_set_userptr(struct ttm_tt *ttm, uint64_t addr,
> +int radeon_ttm_tt_set_userptr(struct radeon_device *rdev,
> +			      struct ttm_tt *ttm, uint64_t addr,
>   			      uint32_t flags)
>   {
> -	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
> +	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
>   
>   	if (gtt == NULL)
>   		return -EINVAL;
> @@ -688,9 +688,53 @@ int radeon_ttm_tt_set_userptr(struct ttm_tt *ttm, uint64_t addr,
>   	return 0;
>   }
>   
> -bool radeon_ttm_tt_has_userptr(struct ttm_tt *ttm)
> +static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
> +			      struct ttm_tt *ttm,
> +			      struct ttm_resource *bo_mem)
> +{
> +	struct radeon_device *rdev = radeon_get_rdev(bdev);
> +
> +#if IS_ENABLED(CONFIG_AGP)
> +	if (rdev->flags & RADEON_IS_AGP) {
> +		return ttm_agp_bind(bdev, ttm, bo_mem);
> +	}
> +#endif
> +
> +	return radeon_ttm_backend_bind(bdev, ttm, bo_mem);
> +}
> +
> +static void radeon_ttm_tt_unbind(struct ttm_bo_device *bdev,
> +				 struct ttm_tt *ttm)
> +{
> +#if IS_ENABLED(CONFIG_AGP)
> +	struct radeon_device *rdev = radeon_get_rdev(bdev);
> +
> +	if (rdev->flags & RADEON_IS_AGP) {
> +		ttm_agp_unbind(bdev, ttm);
> +		return;
> +	}
> +#endif
> +	radeon_ttm_backend_unbind(bdev, ttm);
> +}
> +
> +static void radeon_ttm_tt_destroy(struct ttm_bo_device *bdev,
> +				  struct ttm_tt *ttm)
> +{
> +#if IS_ENABLED(CONFIG_AGP)
> +	struct radeon_device *rdev = radeon_get_rdev(bdev);
> +
> +	if (rdev->flags & RADEON_IS_AGP) {
> +		ttm_agp_destroy(bdev, ttm);
> +		return;
> +	}
> +#endif
> +	radeon_ttm_backend_destroy(bdev, ttm);
> +}
> +
> +bool radeon_ttm_tt_has_userptr(struct radeon_device *rdev,
> +			       struct ttm_tt *ttm)
>   {
> -	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
> +	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
>   
>   	if (gtt == NULL)
>   		return false;
> @@ -698,9 +742,10 @@ bool radeon_ttm_tt_has_userptr(struct ttm_tt *ttm)
>   	return !!gtt->userptr;
>   }
>   
> -bool radeon_ttm_tt_is_readonly(struct ttm_tt *ttm)
> +bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev,
> +			       struct ttm_tt *ttm)
>   {
> -	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(ttm);
> +	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
>   
>   	if (gtt == NULL)
>   		return false;
> @@ -712,6 +757,9 @@ static struct ttm_bo_driver radeon_bo_driver = {
>   	.ttm_tt_create = &radeon_ttm_tt_create,
>   	.ttm_tt_populate = &radeon_ttm_tt_populate,
>   	.ttm_tt_unpopulate = &radeon_ttm_tt_unpopulate,
> +	.ttm_tt_bind = &radeon_ttm_tt_bind,
> +	.ttm_tt_unbind = &radeon_ttm_tt_unbind,
> +	.ttm_tt_destroy = &radeon_ttm_tt_destroy,
>   	.eviction_valuable = ttm_bo_eviction_valuable,
>   	.evict_flags = &radeon_evict_flags,
>   	.move = &radeon_bo_move,
> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
> index 71e2c3785ab9..ebad27c91a0d 100644
> --- a/drivers/gpu/drm/radeon/radeon_vm.c
> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> @@ -942,7 +942,7 @@ int radeon_vm_bo_update(struct radeon_device *rdev,
>   	bo_va->flags &= ~RADEON_VM_PAGE_VALID;
>   	bo_va->flags &= ~RADEON_VM_PAGE_SYSTEM;
>   	bo_va->flags &= ~RADEON_VM_PAGE_SNOOPED;
> -	if (bo_va->bo && radeon_ttm_tt_is_readonly(bo_va->bo->tbo.ttm))
> +	if (bo_va->bo && radeon_ttm_tt_is_readonly(rdev, bo_va->bo->tbo.ttm))
>   		bo_va->flags &= ~RADEON_VM_PAGE_WRITEABLE;
>   
>   	if (mem) {

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
