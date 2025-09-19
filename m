Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F4B8A103
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 16:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEFF10EA4E;
	Fri, 19 Sep 2025 14:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gVzj5Ynp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E8410EA4B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WgjCDGx0DnZyMYrByaDSTfS4FdWN3VQ3zz0VFJ7PFzw=; b=gVzj5YnpKVcibCaD3nJgJd+kpG
 M8y11bjg525WBdn2gHXfNybtwZshRovbUw+DlX/5+OWCp8gTsm8bKqqw/W93P6Ewn/eAa3zGa8yXS
 SU4OdEyJdrTRRNrxXlvG4WR4Y/2mSbOfjaHYc3xSaiN0tHC+msZqLvfmgSosOkzyKRZudmhweYSYo
 rP1IzlrTlz1FKWJ36A+LCshpSdvGttbRN3nJ6tpoVujUaVII9WIOQgFRSgBPM8d/kVi9kFsKzQ2g8
 3HzyJxFyrJh+pY5456QuMF0QDrzZiBUlWhTd9p2q7XWU93wxy9qDzn4FlBQu5qAsRN0Gcxphb0X4P
 HrpSu4vg==;
Received: from 179-125-87-227-dinamico.pombonet.net.br ([179.125.87.227]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzcOG-00E8B0-EU; Fri, 19 Sep 2025 16:47:12 +0200
Date: Fri, 19 Sep 2025 11:47:08 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 3/4] drm/ttm: Tidy ttm_operation_ctx initialization
Message-ID: <aM1s7LwPjuT8SrFy@quatroqueijos.cascardo.eti.br>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
 <20250919131530.91247-4-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919131530.91247-4-tvrtko.ursulin@igalia.com>
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

On Fri, Sep 19, 2025 at 02:15:29PM +0100, Tvrtko Ursulin wrote:
> No need to initialize a subset of fields to zero.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c  | 10 ++--------
>  drivers/gpu/drm/ttm/ttm_device.c   |  5 +----
>  drivers/gpu/drm/ttm/ttm_resource.c |  5 +----
>  drivers/gpu/drm/ttm/ttm_tt.c       |  2 +-
>  4 files changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index acbbca9d5c92..94a72db76f52 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -343,10 +343,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>  			   struct ttm_bo_kmap_obj *map)
>  {
>  	struct ttm_resource *mem = bo->resource;
> -	struct ttm_operation_ctx ctx = {
> -		.interruptible = false,
> -		.no_wait_gpu = false
> -	};
> +	struct ttm_operation_ctx ctx = { };
>  	struct ttm_tt *ttm = bo->ttm;
>  	struct ttm_resource_manager *man =
>  			ttm_manager_type(bo->bdev, bo->resource->mem_type);
> @@ -530,10 +527,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>  		iosys_map_set_vaddr_iomem(map, vaddr_iomem);
>  
>  	} else {
> -		struct ttm_operation_ctx ctx = {
> -			.interruptible = false,
> -			.no_wait_gpu = false
> -		};
> +		struct ttm_operation_ctx ctx = { };
>  		struct ttm_tt *ttm = bo->ttm;
>  		pgprot_t prot;
>  		void *vaddr;
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index c3e2fcbdd2cc..00c405f1c9b8 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -134,10 +134,7 @@ static int ttm_global_init(void)
>   */
>  int ttm_device_prepare_hibernation(struct ttm_device *bdev)
>  {
> -	struct ttm_operation_ctx ctx = {
> -		.interruptible = false,
> -		.no_wait_gpu = false,
> -	};
> +	struct ttm_operation_ctx ctx = { };
>  	int ret;
>  
>  	do {
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index b78be0c342f2..55ce363a73ae 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -543,10 +543,7 @@ EXPORT_SYMBOL(ttm_resource_manager_init);
>  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  				   struct ttm_resource_manager *man)
>  {
> -	struct ttm_operation_ctx ctx = {
> -		.interruptible = false,
> -		.no_wait_gpu = false,
> -	};
> +	struct ttm_operation_ctx ctx = { };
>  	struct dma_fence *fence;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 506e257dfba8..226d2762a1d6 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -453,7 +453,7 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_unpopulate);
>  /* Test the shrinker functions and dump the result */
>  static int ttm_tt_debugfs_shrink_show(struct seq_file *m, void *data)
>  {
> -	struct ttm_operation_ctx ctx = { false, false };
> +	struct ttm_operation_ctx ctx = { };
>  
>  	seq_printf(m, "%d\n", ttm_global_swapout(&ctx, GFP_KERNEL));
>  	return 0;
> -- 
> 2.48.0
> 

Acked-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
