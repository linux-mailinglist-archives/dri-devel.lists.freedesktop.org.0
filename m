Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 538417970AB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875D710E794;
	Thu,  7 Sep 2023 08:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6041010E793;
 Thu,  7 Sep 2023 08:16:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BC10066072BB;
 Thu,  7 Sep 2023 09:16:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694074593;
 bh=AZhW7TkDJ0NROEspGrEULlcp3rZ1V2RM/nyaqMUOXRY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=My30FZb5xJVaXxy2bRS3XjyfSL36XHfmKTkh1FrqVd6gluyT4aXCCOuhjXd04YFiL
 lLemSCXgKnZYAm2351HlHjKBwxQ8hu10L1BKG+kMx3kE14edAs1GV8jW+3nbOhBoyT
 Nk2bdq7RO+Kyd1JXuiF/wXbmAT9GyDSlYeldoZjLbatHsuGdge/ySGIM2kkCX2qwLE
 V2bA/JjzNDdL8I3WvF/nXuQHcnKOn9+aIAQoQZXJ05tKCfp70ZTfQ/JxQp+MGFqZVO
 Kbb8jUYcTVwbprZbCx56WYswEy5krrcj+SolIsmSNXT6rG+YCLQEpk7e4T2cKbL0ku
 uVg8GLdN/2PsQ==
Date: Thu, 7 Sep 2023 10:16:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v2 5/7] drm/gpuvm: add an abstraction for
 a VM / BO combination
Message-ID: <20230907101630.7213c919@collabora.com>
In-Reply-To: <20230906214723.4393-6-dakr@redhat.com>
References: <20230906214723.4393-1-dakr@redhat.com>
 <20230906214723.4393-6-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  6 Sep 2023 23:47:13 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> @@ -812,15 +967,20 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>  /**
>   * drm_gpuva_link() - link a &drm_gpuva
>   * @va: the &drm_gpuva to link
> + * @vm_bo: the &drm_gpuvm_bo to add the &drm_gpuva to
>   *
> - * This adds the given &va to the GPU VA list of the &drm_gem_object it is
> - * associated with.
> + * This adds the given &va to the GPU VA list of the &drm_gpuvm_bo and the
> + * &drm_gpuvm_bo to the &drm_gem_object it is associated with.
> + *
> + * For every &drm_gpuva entry added to the &drm_gpuvm_bo an additional
> + * reference of the latter is taken.
>   *
>   * This function expects the caller to protect the GEM's GPUVA list against
> - * concurrent access using the GEMs dma_resv lock.
> + * concurrent access using either the GEMs dma_resv lock or a driver specific
> + * lock set through drm_gem_gpuva_set_lock().
>   */
>  void
> -drm_gpuva_link(struct drm_gpuva *va)
> +drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo)
>  {
>  	struct drm_gem_object *obj = va->gem.obj;
>  
> @@ -829,7 +989,10 @@ drm_gpuva_link(struct drm_gpuva *va)
>  
>  	drm_gem_gpuva_assert_lock_held(obj);
>  
> -	list_add_tail(&va->gem.entry, &obj->gpuva.list);
> +	drm_gpuvm_bo_get(vm_bo);

Guess we should WARN if vm_obj->obj == obj, at least.

> +	list_add_tail(&va->gem.entry, &vm_bo->list.gpuva);
> +	if (list_empty(&vm_bo->list.entry.gem))
> +		list_add_tail(&vm_bo->list.entry.gem, &obj->gpuva.list);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuva_link);
>  
> @@ -840,20 +1003,40 @@ EXPORT_SYMBOL_GPL(drm_gpuva_link);
>   * This removes the given &va from the GPU VA list of the &drm_gem_object it is
>   * associated with.
>   *
> + * This removes the given &va from the GPU VA list of the &drm_gpuvm_bo and
> + * the &drm_gpuvm_bo from the &drm_gem_object it is associated with in case
> + * this call unlinks the last &drm_gpuva from the &drm_gpuvm_bo.
> + *
> + * For every &drm_gpuva entry removed from the &drm_gpuvm_bo a reference of
> + * the latter is dropped.
> + *
>   * This function expects the caller to protect the GEM's GPUVA list against
> - * concurrent access using the GEMs dma_resv lock.
> + * concurrent access using either the GEMs dma_resv lock or a driver specific
> + * lock set through drm_gem_gpuva_set_lock().
>   */
>  void
>  drm_gpuva_unlink(struct drm_gpuva *va)
>  {
>  	struct drm_gem_object *obj = va->gem.obj;
> +	struct drm_gpuvm_bo *vm_bo;
>  
>  	if (unlikely(!obj))
>  		return;
>  
>  	drm_gem_gpuva_assert_lock_held(obj);
>  
> +	vm_bo = __drm_gpuvm_bo_find(va->vm, obj);

Could we add a drm_gpuva::vm_bo field so we don't have to search the
vm_bo here, and maybe drop the drm_gpuva::vm and drm_gpuva::obj fields,
since drm_gpuvm_bo contains both the vm and the GEM object. I know that
means adding an extra indirection + allocation for drivers that don't
want to use drm_gpuva_[un]link(), but I wonder if it's not preferable
over having the information duplicated (with potential mismatch)

> +	if (WARN(!vm_bo, "GPUVA doesn't seem to be linked.\n"))
> +		return;
> +
>  	list_del_init(&va->gem.entry);
> +
> +	/* This is the last mapping being unlinked for this GEM object, hence
> +	 * also remove the VM_BO from the GEM's gpuva list.
> +	 */
> +	if (list_empty(&vm_bo->list.gpuva))
> +		list_del_init(&vm_bo->list.entry.gem);
> +	drm_gpuvm_bo_put(vm_bo);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
