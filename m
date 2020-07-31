Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC7C2346CC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85D46E912;
	Fri, 31 Jul 2020 13:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690074.outbound.protection.outlook.com [40.107.69.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6111A6E912
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:23:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1vtqL9ETuVb8X0e6Os8hCP89lwb0ehlgBgwvE+v2kfWEG7+82ZljBOUiHxTP5/oagfPj44404BE9LrDqOUrubeOHZiAmD+K0SjhH0hLLuSOVWJa9jZhaGT8qm2JKKVOACeJ9j/lfUX/YBc7mC4xzLCabX8SNoIIO7k1rtyZT7HoYcM3ykxWdtgK2Rjf8A8xjn8B/rfQ1U64Sf/jkRP/7ds5OrERMZ4hSysBaw9939wBvy2V/VRadhze6Dlav+Vy/cYG5bliIpnfhAkvXj3iBA3gmSIjU8MSMFg1rFVqrHu259Fa0HEQbOhtuPyEf44z9J+N9Loj0nSEiNDY3y7wtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYNerwyMX8bh55IlOnrZkSBU5WA2xEdYBr5tY3EKTnE=;
 b=XAw8AOHKT3BYsOcuC+8+35mnf0fYH9qRWg13gY7IRc8MgP6wdFU2P63tJTyTxhGPx34gcFMukxTYaRONzhfvv5fpNSMhuhlaQFgG7OkxdUuLVKeUnAe1pIkTLo3N7jE6EnzG0jQ5HsFmqzgnkjQ1Qjo1iI2xhjz1Sk7UIeakzbJEyP9tN5+psTh88+igCRrDa0Y+SO/SZcZw9gQ+mQb4/1ltaBse7l+GQDxo6cjpFe5rh2krGWTDc/h8a1dFZmRf4iOvgwgcBJVDM2LiU8JTE4mJve5idOEaLvJZGtjXFC5jSTHC3QXLyfbMTvjyzGCl7a7quw5XPSiBamhW3TgyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYNerwyMX8bh55IlOnrZkSBU5WA2xEdYBr5tY3EKTnE=;
 b=EWffLBQsQsNhlW8ayAqUp5KKqeUJTzSH+S+IfRJw1hILcaXkur9i9LSgZ44ywAbE0FbPvgkynI/ow0LZimq4vVHREwPrI/M/BbHWn4lCf5BzoIosa0pU18/WErx/6KLPx2fS4aRwbDpRZjbo0YWFI47xks5u3r2EfXflGi7eW8I=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Fri, 31 Jul
 2020 13:23:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:23:56 +0000
Subject: Re: [PATCH 26/49] drm/ttm: add wrapper to get manager from bdev.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-27-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ddedce74-8269-f815-c244-38c18ea4bccd@amd.com>
Date: Fri, 31 Jul 2020 15:23:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-27-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0108.eurprd07.prod.outlook.com
 (2603:10a6:207:7::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0108.eurprd07.prod.outlook.com (2603:10a6:207:7::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9 via Frontend Transport; Fri, 31 Jul 2020 13:23:54 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f6a2b21d-66d9-4d8c-aa52-08d83554f9b6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43428E1F62CEC729931067F1834E0@MN2PR12MB4342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nfC9m/3heJlYqmx+ynRkswfAxI/aWi04CkzTN6SRHpl8R4Mspy1JKCpkMTlKpQXYssv/7+RM6BnIL/yy6H6Cj1vkNxOweBEJYJFAT/1aExxqNVF6J9ndUpYMXSu49/83BqupfoS+rkW/7SSHg2hLcPmbwiKRfpVKtF77JLpinZN3kI6OI78UvIHIzk6z2jMcPSJCOFFAkERjxiqYKf76pMkPr3k8aB9ntF82efjSxGapLt5Ny7H7f8lv0cDdepTLEYC8j6qvAoNzYSJYRj1P7EnYUtczGygye5eufjmrByv34qiy8zz46po4ySfUmDhyAaUTRgUWP2qzUN52s7NaFR3BkGCCbhCUJxxBGNfKydvwtU8aSW83FplDmd3ZHXD/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(2616005)(186003)(16526019)(36756003)(30864003)(31686004)(83380400001)(31696002)(86362001)(8936002)(316002)(2906002)(66556008)(66476007)(66946007)(478600001)(5660300002)(52116002)(6666004)(4326008)(8676002)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QRO/yUoGHWPBNmDmQYagpz7R451dpyfgxUUfcgFvCe87vv2Ryuq7s14OJwLFd3f+x6GkhimljKrh1wCQDpfRmguAvTFmQzIcTrt7TTwkdeYzo9QNHtjdY+zq7J+HBNtMrE3x/hj+MPpL++fm9ntf2cjpZQ2wcnqKVIzJwF2+4oJqdrlfzUpSt6PqPZZoutYcbRmAc5CpMN4ERHbvhCUVp/QnIEt8YxXWrqiWuhM1Rl4Aby5+B4QFQ9KIHACGpxgo/jngaor989Xy61Jb4A8BFshGzEgOvtfSApnt9CKhaaiJOUaXhwD+0enZNt/8Tk+OZHVBnR0b9+lYmYA4HCPuXspD5OCNmvXcvhBXkmFliWekcOgJwxREiDPo/Mq3RlxMtPHOaVvQn09pPYlmSs3lbdek7yTfJ3mA7U9eQkO6oODZK747Gr1Kwl2nS6oPRJT+bv8TQU5WnqWg/4WwWbM/0rp3FPZIhAlaqeiBGZ60DYsuDrAblp/xiIJDLaqf1ouIz8P3GDIq0NkVBkshtdFFkW77UxPGOdVlw8YnKiAb7NXuLpvui6RG9OyuKKhaOMhiBIqgAVyooc/SCq4VFJq1BxZ2eYoIWlYRDG/hq9tT6Ohuue1X/Nkgb65jL5B4C7F9BQQ0LhmEAs745NoLHwZUgBKgkIY3f2SJQgc5SKfsx8K4jjOHIWHr/8wJn5FP5TSZEHklG95Z40dSicmcxyjILQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a2b21d-66d9-4d8c-aa52-08d83554f9b6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:23:55.8576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlgKYhozX9O8S2qrkQta2JFBSvZJiwv3aBRbTFxvJiWyfeL7jZYywasHJeqc+E13
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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

Am 31.07.20 um 06:04 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> This will allow different abstractions later.

Mhm, I'm questioning if this is really worth it and not just overkill.

Running "sed -i 's/&bdev->man/bdev->man/'" on all drivers when we make 
the switch to a pointer should do it as well.

Christian.

>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c      | 34 +++++++++++++++----------------
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 20 +++++++++---------
>   drivers/gpu/drm/ttm/ttm_bo_vm.c   |  2 +-
>   include/drm/ttm/ttm_bo_driver.h   |  6 ++++++
>   4 files changed, 34 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 07c653374f15..7c6389ea067f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -80,7 +80,7 @@ static inline int ttm_mem_type_from_place(const struct ttm_place *place,
>   static void ttm_mem_type_debug(struct ttm_bo_device *bdev, struct drm_printer *p,
>   			       int mem_type)
>   {
> -	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem_type);
>   
>   	drm_printf(p, "    has_type: %d\n", man->has_type);
>   	drm_printf(p, "    use_type: %d\n", man->use_type);
> @@ -156,7 +156,7 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer_object *bo,
>   	if (mem->placement & TTM_PL_FLAG_NO_EVICT)
>   		return;
>   
> -	man = &bdev->man[mem->mem_type];
> +	man = ttm_manager_type(bdev, mem->mem_type);
>   	list_add_tail(&bo->lru, &man->lru[bo->priority]);
>   
>   	if (man->use_tt && bo->ttm &&
> @@ -231,7 +231,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
>   		dma_resv_assert_held(pos->first->base.resv);
>   		dma_resv_assert_held(pos->last->base.resv);
>   
> -		man = &pos->first->bdev->man[TTM_PL_TT];
> +		man = ttm_manager_type(pos->first->bdev, TTM_PL_TT);
>   		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>   				    &pos->last->lru);
>   	}
> @@ -246,7 +246,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk)
>   		dma_resv_assert_held(pos->first->base.resv);
>   		dma_resv_assert_held(pos->last->base.resv);
>   
> -		man = &pos->first->bdev->man[TTM_PL_VRAM];
> +		man = ttm_manager_type(pos->first->bdev, TTM_PL_VRAM);
>   		list_bulk_move_tail(&man->lru[i], &pos->first->lru,
>   				    &pos->last->lru);
>   	}
> @@ -272,8 +272,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   				  struct ttm_operation_ctx *ctx)
>   {
>   	struct ttm_bo_device *bdev = bo->bdev;
> -	struct ttm_mem_type_manager *old_man = &bdev->man[bo->mem.mem_type];
> -	struct ttm_mem_type_manager *new_man = &bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *old_man = ttm_manager_type(bdev, bo->mem.mem_type);
> +	struct ttm_mem_type_manager *new_man = ttm_manager_type(bdev, mem->mem_type);
>   	int ret;
>   
>   	ret = ttm_mem_io_lock(old_man, true);
> @@ -338,7 +338,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   	return 0;
>   
>   out_err:
> -	new_man = &bdev->man[bo->mem.mem_type];
> +	new_man = ttm_manager_type(bdev, bo->mem.mem_type);
>   	if (!new_man->use_tt) {
>   		ttm_tt_destroy(bo->ttm);
>   		bo->ttm = NULL;
> @@ -550,7 +550,7 @@ static void ttm_bo_release(struct kref *kref)
>   	struct ttm_buffer_object *bo =
>   	    container_of(kref, struct ttm_buffer_object, kref);
>   	struct ttm_bo_device *bdev = bo->bdev;
> -	struct ttm_mem_type_manager *man = &bdev->man[bo->mem.mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, bo->mem.mem_type);
>   	size_t acc_size = bo->acc_size;
>   	int ret;
>   
> @@ -838,7 +838,7 @@ static int ttm_bo_mem_get(struct ttm_buffer_object *bo,
>   			  const struct ttm_place *place,
>   			  struct ttm_mem_reg *mem)
>   {
> -	struct ttm_mem_type_manager *man = &bo->bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
>   
>   	mem->mm_node = NULL;
>   	if (!man->func || !man->func->get_node)
> @@ -849,7 +849,7 @@ static int ttm_bo_mem_get(struct ttm_buffer_object *bo,
>   
>   void ttm_bo_mem_put(struct ttm_buffer_object *bo, struct ttm_mem_reg *mem)
>   {
> -	struct ttm_mem_type_manager *man = &bo->bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bo->bdev, mem->mem_type);
>   
>   	if (!man->func || !man->func->put_node)
>   		return;
> @@ -906,7 +906,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   				  struct ttm_operation_ctx *ctx)
>   {
>   	struct ttm_bo_device *bdev = bo->bdev;
> -	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem->mem_type);
>   	struct ww_acquire_ctx *ticket;
>   	int ret;
>   
> @@ -996,7 +996,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
>   	if (ret)
>   		return ret;
>   
> -	man = &bdev->man[mem_type];
> +	man = ttm_manager_type(bdev, mem_type);
>   	if (!man->has_type || !man->use_type)
>   		return -EBUSY;
>   
> @@ -1059,7 +1059,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>   		if (unlikely(ret))
>   			goto error;
>   
> -		man = &bdev->man[mem->mem_type];
> +		man = ttm_manager_type(bdev, mem->mem_type);
>   		ret = ttm_bo_add_move_fence(bo, man, mem, ctx->no_wait_gpu);
>   		if (unlikely(ret)) {
>   			ttm_bo_mem_put(bo, mem);
> @@ -1448,7 +1448,7 @@ EXPORT_SYMBOL(ttm_bo_force_list_clean);
>   
>   int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   {
> -	struct ttm_mem_type_manager *man = &bdev->man[mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem_type);
>   
>   	if (mem_type == 0 || mem_type >= TTM_NUM_MEM_TYPES) {
>   		pr_err("Illegal memory manager memory type %u\n", mem_type);
> @@ -1551,7 +1551,7 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
>   	unsigned i;
>   	struct ttm_mem_type_manager *man;
>   
> -	man = &bdev->man[TTM_PL_SYSTEM];
> +	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
>   	ttm_bo_disable_mm(man);
>   
>   	mutex_lock(&ttm_global_mutex);
> @@ -1578,7 +1578,7 @@ EXPORT_SYMBOL(ttm_bo_device_release);
>   
>   static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
>   {
> -	struct ttm_mem_type_manager *man = &bdev->man[TTM_PL_SYSTEM];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
>   
>   	/*
>   	 * Initialize the system memory buffer type.
> @@ -1642,7 +1642,7 @@ void ttm_bo_unmap_virtual_locked(struct ttm_buffer_object *bo)
>   void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
>   {
>   	struct ttm_bo_device *bdev = bo->bdev;
> -	struct ttm_mem_type_manager *man = &bdev->man[bo->mem.mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, bo->mem.mem_type);
>   
>   	ttm_mem_io_lock(man, false);
>   	ttm_bo_unmap_virtual_locked(bo);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 1f502be0b646..879c8ded0cd8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -129,7 +129,7 @@ static int ttm_mem_io_evict(struct ttm_mem_type_manager *man)
>   int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
>   		       struct ttm_mem_reg *mem)
>   {
> -	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem->mem_type);
>   	int ret;
>   
>   	if (mem->bus.io_reserved_count++)
> @@ -162,7 +162,7 @@ void ttm_mem_io_free(struct ttm_bo_device *bdev,
>   
>   int ttm_mem_io_reserve_vm(struct ttm_buffer_object *bo)
>   {
> -	struct ttm_mem_type_manager *man = &bo->bdev->man[bo->mem.mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
>   	struct ttm_mem_reg *mem = &bo->mem;
>   	int ret;
>   
> @@ -195,7 +195,7 @@ static int ttm_mem_reg_ioremap(struct ttm_bo_device *bdev,
>   			       struct ttm_mem_reg *mem,
>   			       void **virtual)
>   {
> -	struct ttm_mem_type_manager *man = &bdev->man[mem->mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, mem->mem_type);
>   	int ret;
>   	void *addr;
>   
> @@ -232,7 +232,7 @@ static void ttm_mem_reg_iounmap(struct ttm_bo_device *bdev,
>   {
>   	struct ttm_mem_type_manager *man;
>   
> -	man = &bdev->man[mem->mem_type];
> +	man = ttm_manager_type(bdev, mem->mem_type);
>   
>   	if (virtual && mem->bus.addr == NULL)
>   		iounmap(virtual);
> @@ -303,7 +303,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   		       struct ttm_mem_reg *new_mem)
>   {
>   	struct ttm_bo_device *bdev = bo->bdev;
> -	struct ttm_mem_type_manager *man = &bdev->man[new_mem->mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
>   	struct ttm_tt *ttm = bo->ttm;
>   	struct ttm_mem_reg *old_mem = &bo->mem;
>   	struct ttm_mem_reg old_copy = *old_mem;
> @@ -571,7 +571,7 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo,
>   		struct ttm_bo_kmap_obj *map)
>   {
>   	struct ttm_mem_type_manager *man =
> -		&bo->bdev->man[bo->mem.mem_type];
> +		ttm_manager_type(bo->bdev, bo->mem.mem_type);
>   	unsigned long offset, size;
>   	int ret;
>   
> @@ -601,7 +601,7 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
>   {
>   	struct ttm_buffer_object *bo = map->bo;
>   	struct ttm_mem_type_manager *man =
> -		&bo->bdev->man[bo->mem.mem_type];
> +		ttm_manager_type(bo->bdev, bo->mem.mem_type);
>   
>   	if (!map->virtual)
>   		return;
> @@ -634,7 +634,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>   			      struct ttm_mem_reg *new_mem)
>   {
>   	struct ttm_bo_device *bdev = bo->bdev;
> -	struct ttm_mem_type_manager *man = &bdev->man[new_mem->mem_type];
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
>   	struct ttm_mem_reg *old_mem = &bo->mem;
>   	int ret;
>   	struct ttm_buffer_object *ghost_obj;
> @@ -697,8 +697,8 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
>   	struct ttm_bo_device *bdev = bo->bdev;
>   	struct ttm_mem_reg *old_mem = &bo->mem;
>   
> -	struct ttm_mem_type_manager *from = &bdev->man[old_mem->mem_type];
> -	struct ttm_mem_type_manager *to = &bdev->man[new_mem->mem_type];
> +	struct ttm_mem_type_manager *from = ttm_manager_type(bdev, old_mem->mem_type);
> +	struct ttm_mem_type_manager *to = ttm_manager_type(bdev, new_mem->mem_type);
>   
>   	int ret;
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 468a0eb9e632..5ae679184eb5 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -282,7 +282,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   	vm_fault_t ret = VM_FAULT_NOPAGE;
>   	unsigned long address = vmf->address;
>   	struct ttm_mem_type_manager *man =
> -		&bdev->man[bo->mem.mem_type];
> +		ttm_manager_type(bdev, bo->mem.mem_type);
>   
>   	/*
>   	 * Refuse to fault imported pages. This should be handled
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 9d066529ca61..ec25451b503f 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -444,6 +444,12 @@ struct ttm_bo_device {
>   	bool no_retry;
>   };
>   
> +static inline struct ttm_mem_type_manager *ttm_manager_type(struct ttm_bo_device *bdev,
> +							    int mem_type)
> +{
> +	return &bdev->man[mem_type];
> +}
> +
>   /**
>    * struct ttm_lru_bulk_move_pos
>    *

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
