Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9508F43DE60
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 12:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25956E943;
	Thu, 28 Oct 2021 10:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84386E943
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 10:02:35 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mg2Ex-0005zU-Sk; Thu, 28 Oct 2021 12:02:31 +0200
Message-ID: <89caea022a590a249b28744c155c17809dcb96d8.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: use new iterator in etnaviv_gem_describe
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 linux+etnaviv@armlinux.org.uk
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Thu, 28 Oct 2021 12:02:30 +0200
In-Reply-To: <20211025080532.177424-2-christian.koenig@amd.com>
References: <20211025080532.177424-1-christian.koenig@amd.com>
 <20211025080532.177424-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Montag, dem 25.10.2021 um 10:05 +0200 schrieb Christian König:
> Instead of hand rolling the logic.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 31 ++++++++++-----------------
>  1 file changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 8f1b5af47dd6..0eeb33de2ff4 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -428,19 +428,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
>  static void etnaviv_gem_describe_fence(struct dma_fence *fence,
>  	const char *type, struct seq_file *m)
>  {
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		seq_printf(m, "\t%9s: %s %s seq %llu\n",
> -			   type,
> -			   fence->ops->get_driver_name(fence),
> -			   fence->ops->get_timeline_name(fence),
> -			   fence->seqno);
> +	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
> +		   fence->ops->get_driver_name(fence),
> +		   fence->ops->get_timeline_name(fence),
> +		   fence->seqno);

Please just move this in the function below, it seems pretty pointless
now to have a separate function just to wrap the printf.

Other than this nit, both patches are:
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

>  }
>  
>  static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>  {
>  	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
>  	struct dma_resv *robj = obj->resv;
> -	struct dma_resv_list *fobj;
> +	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
>  	unsigned long off = drm_vma_node_start(&obj->vma_node);
>  
> @@ -449,21 +447,14 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
>  			obj->name, kref_read(&obj->refcount),
>  			off, etnaviv_obj->vaddr, obj->size);
>  
> -	rcu_read_lock();
> -	fobj = dma_resv_shared_list(robj);
> -	if (fobj) {
> -		unsigned int i, shared_count = fobj->shared_count;
> -
> -		for (i = 0; i < shared_count; i++) {
> -			fence = rcu_dereference(fobj->shared[i]);
> +	dma_resv_iter_begin(&cursor, robj, true);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		if (dma_resv_iter_is_exclusive(&cursor))
> +			etnaviv_gem_describe_fence(fence, "Exclusive", m);
> +		else
>  			etnaviv_gem_describe_fence(fence, "Shared", m);
> -		}
>  	}
> -
> -	fence = dma_resv_excl_fence(robj);
> -	if (fence)
> -		etnaviv_gem_describe_fence(fence, "Exclusive", m);
> -	rcu_read_unlock();
> +	dma_resv_iter_end(&cursor);
>  }
>  
>  void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,


