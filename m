Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 493653EEA88
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 12:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2178999A;
	Tue, 17 Aug 2021 10:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7E96E159
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:06:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q11so27715428wrr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BifyNKAqAMPpz9hfLfvWIfoZfb2cgkzK0yl0J0jE64I=;
 b=OA21YJ9AMoP7KMkjR379Y1L6MYf1N8mDQnplNSJDrd6sg7rSxQq5f6qo/MO1dx9o7R
 NHSIAg2O1GC9XUgRYc7/7xyAP+OBYsa/TvVIt4WmrbSYqNqQfEQlcdJoLk1B4CDseLTM
 1n4BNMdiPELY+v/L8SeqChSyhSoGHPMW2wOlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BifyNKAqAMPpz9hfLfvWIfoZfb2cgkzK0yl0J0jE64I=;
 b=FDoDOR/ZIkOof7Tuj+pU080q7cOrR+/76QcCPMZ8ixnKet+IdtDZpvNjZtDTU5ZXS+
 6qAxmLFupXyIUCP6a1fAff1WqDpOm4ziGIjbbzCh4RbYMJHneClX7jj1YXFbucQ+q5Pd
 OLLtRuOtg9j8Y6hT0l5r0F0TGsM4Uyb+TXMyhlH5+4N6dBmzgTI00Lr/64lsPjcLyqd6
 6Y4q22wPPXSa4WPq5YQL03Z19M2/d9Myv91121bSL91oY6ZvStM6hi+aYJDaXlPUlteO
 lUTyDLzaKvg5hQKffYx3zFcAIpXCLyP/nFWHh2jSI2J0oxbxy3olu/m3OjJVo7jXsGcy
 5UGw==
X-Gm-Message-State: AOAM531ID5RSgz94oSnk5wjKmYzDW5u8weObvljqgKf8vpuN/DMtNMMm
 dxXEXtsk+9+fBKg67MSo7SHLdw==
X-Google-Smtp-Source: ABdhPJzn+BRJ8jHxEIh0JS/37GJq8U44Ef3JMzn1eYd3WGXVZ7iRHtEnsr4SLRorrwlMCQIpnGyXhA==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr3059804wrn.235.1629194778827; 
 Tue, 17 Aug 2021 03:06:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e25sm2242118wra.90.2021.08.17.03.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:06:18 -0700 (PDT)
Date: Tue, 17 Aug 2021 12:06:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: Re: [PATCH 14/22] drm/i915: Allocate error capture in atomic context
Message-ID: <YRuKGIAqBXwv6e6J@phenom.ffwll.local>
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-15-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816135139.10060-15-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 16, 2021 at 06:51:31AM -0700, Matthew Brost wrote:
> Error captures can now be done in a work queue processing G2H messages.
> These messages need to be completely done being processed in the reset
> path, to avoid races in the missing G2H cleanup, which create a
> dependency on memory allocations and dma fences (i915_requests).
> Requests depend on resets, thus now we have a circular dependency. To
> work around this, allocate the error capture in an atomic context.
> 
> Fixes: dc0dad365c5e ("Fix for error capture after full GPU reset with GuC")
> Fixes: 573ba126aef3 ("Capture error state on context reset")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_gpu_error.c | 37 +++++++++++++--------------
>  1 file changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 0f08bcfbe964..453376aa6d9f 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -49,7 +49,6 @@
>  #include "i915_memcpy.h"
>  #include "i915_scatterlist.h"
>  
> -#define ALLOW_FAIL (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
>  #define ATOMIC_MAYFAIL (GFP_ATOMIC | __GFP_NOWARN)

This one doesn't make much sense. GFP_ATOMIC essentially means we're
high-priority and failure would be a pretty bad day. Meanwhile
__GFP_NOWARN means we can totally cope with failure, pls don't holler.

GFP_NOWAIT | __GFP_NOWARN would the more consistent one here I think.

gfp.h for all the docs for this.

Separate patch ofc. This one is definitely the right direction, since
GFP_KERNEL from the reset worker is not a good idea.
-Daniel

>  
>  static void __sg_set_buf(struct scatterlist *sg,
> @@ -79,7 +78,7 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
>  	if (e->cur == e->end) {
>  		struct scatterlist *sgl;
>  
> -		sgl = (typeof(sgl))__get_free_page(ALLOW_FAIL);
> +		sgl = (typeof(sgl))__get_free_page(ATOMIC_MAYFAIL);
>  		if (!sgl) {
>  			e->err = -ENOMEM;
>  			return false;
> @@ -99,10 +98,10 @@ static bool __i915_error_grow(struct drm_i915_error_state_buf *e, size_t len)
>  	}
>  
>  	e->size = ALIGN(len + 1, SZ_64K);
> -	e->buf = kmalloc(e->size, ALLOW_FAIL);
> +	e->buf = kmalloc(e->size, ATOMIC_MAYFAIL);
>  	if (!e->buf) {
>  		e->size = PAGE_ALIGN(len + 1);
> -		e->buf = kmalloc(e->size, GFP_KERNEL);
> +		e->buf = kmalloc(e->size, ATOMIC_MAYFAIL);
>  	}
>  	if (!e->buf) {
>  		e->err = -ENOMEM;
> @@ -243,12 +242,12 @@ static bool compress_init(struct i915_vma_compress *c)
>  {
>  	struct z_stream_s *zstream = &c->zstream;
>  
> -	if (pool_init(&c->pool, ALLOW_FAIL))
> +	if (pool_init(&c->pool, ATOMIC_MAYFAIL))
>  		return false;
>  
>  	zstream->workspace =
>  		kmalloc(zlib_deflate_workspacesize(MAX_WBITS, MAX_MEM_LEVEL),
> -			ALLOW_FAIL);
> +			ATOMIC_MAYFAIL);
>  	if (!zstream->workspace) {
>  		pool_fini(&c->pool);
>  		return false;
> @@ -256,7 +255,7 @@ static bool compress_init(struct i915_vma_compress *c)
>  
>  	c->tmp = NULL;
>  	if (i915_has_memcpy_from_wc())
> -		c->tmp = pool_alloc(&c->pool, ALLOW_FAIL);
> +		c->tmp = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
>  
>  	return true;
>  }
> @@ -280,7 +279,7 @@ static void *compress_next_page(struct i915_vma_compress *c,
>  	if (dst->page_count >= dst->num_pages)
>  		return ERR_PTR(-ENOSPC);
>  
> -	page = pool_alloc(&c->pool, ALLOW_FAIL);
> +	page = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
>  	if (!page)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -376,7 +375,7 @@ struct i915_vma_compress {
>  
>  static bool compress_init(struct i915_vma_compress *c)
>  {
> -	return pool_init(&c->pool, ALLOW_FAIL) == 0;
> +	return pool_init(&c->pool, ATOMIC_MAYFAIL) == 0;
>  }
>  
>  static bool compress_start(struct i915_vma_compress *c)
> @@ -391,7 +390,7 @@ static int compress_page(struct i915_vma_compress *c,
>  {
>  	void *ptr;
>  
> -	ptr = pool_alloc(&c->pool, ALLOW_FAIL);
> +	ptr = pool_alloc(&c->pool, ATOMIC_MAYFAIL);
>  	if (!ptr)
>  		return -ENOMEM;
>  
> @@ -997,7 +996,7 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>  
>  	num_pages = min_t(u64, vma->size, vma->obj->base.size) >> PAGE_SHIFT;
>  	num_pages = DIV_ROUND_UP(10 * num_pages, 8); /* worstcase zlib growth */
> -	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ALLOW_FAIL);
> +	dst = kmalloc(sizeof(*dst) + num_pages * sizeof(u32 *), ATOMIC_MAYFAIL);
>  	if (!dst)
>  		return NULL;
>  
> @@ -1433,7 +1432,7 @@ capture_engine(struct intel_engine_cs *engine,
>  	struct i915_request *rq = NULL;
>  	unsigned long flags;
>  
> -	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
> +	ee = intel_engine_coredump_alloc(engine, ATOMIC_MAYFAIL);
>  	if (!ee)
>  		return NULL;
>  
> @@ -1481,7 +1480,7 @@ gt_record_engines(struct intel_gt_coredump *gt,
>  		struct intel_engine_coredump *ee;
>  
>  		/* Refill our page pool before entering atomic section */
> -		pool_refill(&compress->pool, ALLOW_FAIL);
> +		pool_refill(&compress->pool, ATOMIC_MAYFAIL);
>  
>  		ee = capture_engine(engine, compress);
>  		if (!ee)
> @@ -1507,7 +1506,7 @@ gt_record_uc(struct intel_gt_coredump *gt,
>  	const struct intel_uc *uc = &gt->_gt->uc;
>  	struct intel_uc_coredump *error_uc;
>  
> -	error_uc = kzalloc(sizeof(*error_uc), ALLOW_FAIL);
> +	error_uc = kzalloc(sizeof(*error_uc), ATOMIC_MAYFAIL);
>  	if (!error_uc)
>  		return NULL;
>  
> @@ -1518,8 +1517,8 @@ gt_record_uc(struct intel_gt_coredump *gt,
>  	 * As modparams are generally accesible from the userspace make
>  	 * explicit copies of the firmware paths.
>  	 */
> -	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
> -	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
> +	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ATOMIC_MAYFAIL);
> +	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ATOMIC_MAYFAIL);
>  	error_uc->guc_log =
>  		i915_vma_coredump_create(gt->_gt,
>  					 uc->guc.log.vma, "GuC log buffer",
> @@ -1778,7 +1777,7 @@ i915_vma_capture_prepare(struct intel_gt_coredump *gt)
>  {
>  	struct i915_vma_compress *compress;
>  
> -	compress = kmalloc(sizeof(*compress), ALLOW_FAIL);
> +	compress = kmalloc(sizeof(*compress), ATOMIC_MAYFAIL);
>  	if (!compress)
>  		return NULL;
>  
> @@ -1811,11 +1810,11 @@ i915_gpu_coredump(struct intel_gt *gt, intel_engine_mask_t engine_mask)
>  	if (IS_ERR(error))
>  		return error;
>  
> -	error = i915_gpu_coredump_alloc(i915, ALLOW_FAIL);
> +	error = i915_gpu_coredump_alloc(i915, ATOMIC_MAYFAIL);
>  	if (!error)
>  		return ERR_PTR(-ENOMEM);
>  
> -	error->gt = intel_gt_coredump_alloc(gt, ALLOW_FAIL);
> +	error->gt = intel_gt_coredump_alloc(gt, ATOMIC_MAYFAIL);
>  	if (error->gt) {
>  		struct i915_vma_compress *compress;
>  
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
