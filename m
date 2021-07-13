Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEEC3C726C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661BE6E0CD;
	Tue, 13 Jul 2021 14:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638A96E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 14:40:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g16so20908498wrw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fIAgUEQ8iTfi4wa3uB+xD5n5RSDTLOl0Fk7tQpIXKqE=;
 b=QsXKR/xsm+XX2FAB1E1GyxWmxTAGN7vWJ1Z2bhkFCNjvBPk4grKkqw0iasdfXqVuDk
 PqxZjGTQh8NCEQ56G17tUVTeO4fwY2J50+5AE7XnbP9P1ZMvwwGkGHhm8StGKZQjKYVY
 QRpf1TqthIPI2PEbbpCqio/KHyPgPhwCrCmXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fIAgUEQ8iTfi4wa3uB+xD5n5RSDTLOl0Fk7tQpIXKqE=;
 b=paIrg+DmMnSxa+JnrMNct64h6faayDSpFVAQSk2BRjHKGKl+bfY1rE/CsQ6FKPaN8P
 PByoPZ5mQWHvG6Pdte+sGp2rOI0kYim4yM4RIxKn7JVcTjeoKkePrP56jdlvi4filSyk
 m6eRAUcR5VlEE30XihYTTWOpM6+L+egT+cHMz6P8ToBIfV86lEbsAwpCr+Soz/DsA/aC
 8x7VxCh5ceZzPlKBJwsj9BI7iJij/jBPcR/vFAZ4nMzdsm1NVtj9wx8xljsOax7grFyC
 7Afb+fmrRBd9zsq2edjuySfZfXl+3hHokqjp7oK7lMkFdTCu94ryGc6db3TlfRz+Elim
 fCCw==
X-Gm-Message-State: AOAM533mUjwWd92T/gqbV/6I8JNq9QzIDvDvZXZ43nyYJvarFfXSluvT
 Qdnt8or94su5id/suBJuYvJMbQ+WHsXOeA==
X-Google-Smtp-Source: ABdhPJw5klEG/uIHR992w/a1iep5Xc7M9J3jFWTuLxItJOERFMv854+z/zx80dge3+Ypxc+h+egTTw==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr6424717wrx.114.1626187226978; 
 Tue, 13 Jul 2021 07:40:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p3sm2537923wmq.17.2021.07.13.07.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:40:26 -0700 (PDT)
Date: Tue, 13 Jul 2021 16:40:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 1/2] drm/i915/gem: Correct the locking and pin pattern
 for dma-buf (v5)
Message-ID: <YO2l2I6Ln1EI0RoS@phenom.ffwll.local>
References: <20210712231234.1031975-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210712231234.1031975-1-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 matthew.auld@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 06:12:33PM -0500, Jason Ekstrand wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> If our exported dma-bufs are imported by another instance of our driver,
> that instance will typically have the imported dma-bufs locked during
> dma_buf_map_attachment(). But the exporter also locks the same reservation
> object in the map_dma_buf() callback, which leads to recursive locking.
> 
> So taking the lock inside _pin_pages_unlocked() is incorrect.
> 
> Additionally, the current pinning code path is contrary to the defined
> way that pinning should occur.
> 
> Remove the explicit pin/unpin from the map/umap functions and move them
> to the attach/detach allowing correct locking to occur, and to match
> the static dma-buf drm_prime pattern.
> 
> Add a live selftest to exercise both dynamic and non-dynamic
> exports.
> 
> v2:
> - Extend the selftest with a fake dynamic importer.
> - Provide real pin and unpin callbacks to not abuse the interface.
> v3: (ruhl)
> - Remove the dynamic export support and move the pinning into the
>   attach/detach path.
> v4: (ruhl)
> - Put pages does not need to assert on the dma-resv
> v5: (jason)
> - Lock around dma_buf_unmap_attachment() when emulating a dynamic
>   importer in the subtests.
> - Use pin_pages_unlocked
> 
> Reported-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  43 +++++--
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 118 +++++++++++++++++-
>  2 files changed, 147 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 616c3a2f1baf0..9a655f69a0671 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -12,6 +12,8 @@
>  #include "i915_gem_object.h"
>  #include "i915_scatterlist.h"
>  
> +I915_SELFTEST_DECLARE(static bool force_different_devices;)
> +
>  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
>  {
>  	return to_intel_bo(buf->priv);
> @@ -25,15 +27,11 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
>  	struct scatterlist *src, *dst;
>  	int ret, i;
>  
> -	ret = i915_gem_object_pin_pages_unlocked(obj);
> -	if (ret)
> -		goto err;
> -
>  	/* Copy sg so that we make an independent mapping */
>  	st = kmalloc(sizeof(struct sg_table), GFP_KERNEL);
>  	if (st == NULL) {
>  		ret = -ENOMEM;
> -		goto err_unpin_pages;
> +		goto err;
>  	}
>  
>  	ret = sg_alloc_table(st, obj->mm.pages->nents, GFP_KERNEL);
> @@ -58,8 +56,6 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma_buf_attachment *attachme
>  	sg_free_table(st);
>  err_free:
>  	kfree(st);
> -err_unpin_pages:
> -	i915_gem_object_unpin_pages(obj);
>  err:
>  	return ERR_PTR(ret);
>  }
> @@ -68,13 +64,9 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_attachment *attachment,
>  				   struct sg_table *sg,
>  				   enum dma_data_direction dir)
>  {
> -	struct drm_i915_gem_object *obj = dma_buf_to_obj(attachment->dmabuf);
> -
>  	dma_unmap_sgtable(attachment->dev, sg, dir, DMA_ATTR_SKIP_CPU_SYNC);
>  	sg_free_table(sg);
>  	kfree(sg);
> -
> -	i915_gem_object_unpin_pages(obj);
>  }
>  
>  static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
> @@ -168,7 +160,31 @@ static int i915_gem_end_cpu_access(struct dma_buf *dma_buf, enum dma_data_direct
>  	return err;
>  }
>  
> +/**
> + * i915_gem_dmabuf_attach - Do any extra attach work necessary
> + * @dmabuf: imported dma-buf
> + * @attach: new attach to do work on
> + *
> + */
> +static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
> +				  struct dma_buf_attachment *attach)
> +{
> +	struct drm_i915_gem_object *obj = dma_buf_to_obj(dmabuf);
> +
> +	return i915_gem_object_pin_pages_unlocked(obj);
> +}
> +
> +static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
> +				   struct dma_buf_attachment *attach)
> +{
> +	struct drm_i915_gem_object *obj = dma_buf_to_obj(dmabuf);
> +
> +	i915_gem_object_unpin_pages(obj);
> +}
> +
>  static const struct dma_buf_ops i915_dmabuf_ops =  {
> +	.attach = i915_gem_dmabuf_attach,
> +	.detach = i915_gem_dmabuf_detach,
>  	.map_dma_buf = i915_gem_map_dma_buf,
>  	.unmap_dma_buf = i915_gem_unmap_dma_buf,
>  	.release = drm_gem_dmabuf_release,
> @@ -204,6 +220,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>  	struct sg_table *pages;
>  	unsigned int sg_page_sizes;
>  
> +	assert_object_held(obj);
> +
>  	pages = dma_buf_map_attachment(obj->base.import_attach,
>  				       DMA_BIDIRECTIONAL);
>  	if (IS_ERR(pages))
> @@ -241,7 +259,8 @@ struct drm_gem_object *i915_gem_prime_import(struct drm_device *dev,
>  	if (dma_buf->ops == &i915_dmabuf_ops) {
>  		obj = dma_buf_to_obj(dma_buf);
>  		/* is it from our device? */
> -		if (obj->base.dev == dev) {
> +		if (obj->base.dev == dev &&
> +		    !I915_SELFTEST_ONLY(force_different_devices)) {
>  			/*
>  			 * Importing dmabuf exported from out own gem increases
>  			 * refcount on gem itself instead of f_count of dmabuf.
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index dd74bc09ec88d..3dc0f8b3cdab0 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -35,7 +35,7 @@ static int igt_dmabuf_export(void *arg)
>  static int igt_dmabuf_import_self(void *arg)
>  {
>  	struct drm_i915_private *i915 = arg;
> -	struct drm_i915_gem_object *obj;
> +	struct drm_i915_gem_object *obj, *import_obj;
>  	struct drm_gem_object *import;
>  	struct dma_buf *dmabuf;
>  	int err;
> @@ -65,14 +65,127 @@ static int igt_dmabuf_import_self(void *arg)
>  		err = -EINVAL;
>  		goto out_import;
>  	}
> +	import_obj = to_intel_bo(import);
> +
> +	i915_gem_object_lock(import_obj, NULL);
> +	err = ____i915_gem_object_get_pages(import_obj);
> +	i915_gem_object_unlock(import_obj);
> +	if (err) {
> +		pr_err("Same object dma-buf get_pages failed!\n");
> +		goto out_import;
> +	}
>  
>  	err = 0;
>  out_import:
> -	i915_gem_object_put(to_intel_bo(import));
> +	i915_gem_object_put(import_obj);
> +out_dmabuf:
> +	dma_buf_put(dmabuf);
> +out:
> +	i915_gem_object_put(obj);
> +	return err;
> +}
> +
> +static void igt_dmabuf_move_notify(struct dma_buf_attachment *attach)
> +{
> +	GEM_WARN_ON(1);
> +}
> +
> +static const struct dma_buf_attach_ops igt_dmabuf_attach_ops = {
> +	.move_notify = igt_dmabuf_move_notify,
> +};
> +
> +static int igt_dmabuf_import_same_driver(void *arg)
> +{
> +	struct drm_i915_private *i915 = arg;
> +	struct drm_i915_gem_object *obj, *import_obj;
> +	struct drm_gem_object *import;
> +	struct dma_buf *dmabuf;
> +	struct dma_buf_attachment *import_attach;
> +	struct sg_table *st;
> +	long timeout;
> +	int err;
> +
> +	force_different_devices = true;
> +	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
> +	if (IS_ERR(obj))
> +		goto out_ret;
> +
> +	dmabuf = i915_gem_prime_export(&obj->base, 0);
> +	if (IS_ERR(dmabuf)) {
> +		pr_err("i915_gem_prime_export failed with err=%d\n",
> +		       (int)PTR_ERR(dmabuf));
> +		err = PTR_ERR(dmabuf);
> +		goto out;
> +	}
> +
> +	import = i915_gem_prime_import(&i915->drm, dmabuf);
> +	if (IS_ERR(import)) {
> +		pr_err("i915_gem_prime_import failed with err=%d\n",
> +		       (int)PTR_ERR(import));
> +		err = PTR_ERR(import);
> +		goto out_dmabuf;
> +	}
> +
> +	if (import == &obj->base) {
> +		pr_err("i915_gem_prime_import reused gem object!\n");
> +		err = -EINVAL;
> +		goto out_import;
> +	}
> +
> +	import_obj = to_intel_bo(import);
> +
> +	i915_gem_object_lock(import_obj, NULL);
> +	err = ____i915_gem_object_get_pages(import_obj);
> +	if (err) {
> +		pr_err("Different objects dma-buf get_pages failed!\n");
> +		i915_gem_object_unlock(import_obj);
> +		goto out_import;
> +	}
> +
> +	/*
> +	 * If the exported object is not in system memory, something
> +	 * weird is going on. TODO: When p2p is supported, this is no
> +	 * longer considered weird.
> +	 */
> +	if (obj->mm.region != i915->mm.regions[INTEL_REGION_SMEM]) {
> +		pr_err("Exported dma-buf is not in system memory\n");
> +		err = -EINVAL;
> +	}
> +
> +	i915_gem_object_unlock(import_obj);
> +
> +	/* Now try a fake dynamic importer */
> +	import_attach = dma_buf_dynamic_attach(dmabuf, obj->base.dev->dev,

Since we don't do a fake dynamic importer please use the non-dynamic
version here. I think just needs you to delete the attach_ops.

> +					       &igt_dmabuf_attach_ops,
> +					       NULL);
> +	if (IS_ERR(import_attach))
> +		goto out_import;
> +
> +	dma_resv_lock(dmabuf->resv, NULL);

Also non-dynamic doesn't need dma_resv_lock here (dma-buf.c does that for
you if needed).

> +	st = dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
> +	dma_resv_unlock(dmabuf->resv);
> +	if (IS_ERR(st))
> +		goto out_detach;
> +
> +	timeout = dma_resv_wait_timeout(dmabuf->resv, false, true, 5 * HZ);

And also not this one here.

With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	if (!timeout) {
> +		pr_err("dmabuf wait for exclusive fence timed out.\n");
> +		timeout = -ETIME;
> +	}
> +	err = timeout > 0 ? 0 : timeout;
> +	dma_resv_lock(dmabuf->resv, NULL);
> +	dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
> +	dma_resv_unlock(dmabuf->resv);
> +out_detach:
> +	dma_buf_detach(dmabuf, import_attach);
> +out_import:
> +	i915_gem_object_put(import_obj);
>  out_dmabuf:
>  	dma_buf_put(dmabuf);
>  out:
>  	i915_gem_object_put(obj);
> +out_ret:
> +	force_different_devices = false;
>  	return err;
>  }
>  
> @@ -286,6 +399,7 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_private *i915)
>  {
>  	static const struct i915_subtest tests[] = {
>  		SUBTEST(igt_dmabuf_export),
> +		SUBTEST(igt_dmabuf_import_same_driver),
>  	};
>  
>  	return i915_subtests(tests, i915);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
