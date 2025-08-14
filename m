Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4C7B25B7D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 08:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7064710E7EF;
	Thu, 14 Aug 2025 06:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oXcIRmbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFBC10E7EF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:03:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9E3AFA4F072;
 Thu, 14 Aug 2025 06:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DC5C4CEEF;
 Thu, 14 Aug 2025 06:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755151402;
 bh=8EKk4Xw7VwzxxEJxQKhC4NtiY9g+vxyPs5oc5M5f27E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oXcIRmbmH611HxPBJ16ayYXCwh/f3OX6xihUMZUY5BxoJM/BAHDUwtGS8uff5vakB
 SgxhZMyh+cRuZep0oKfMc3HbFd93ucJU0hT+7HvF35U7RaGve9idaQUHxeF+rXC0fb
 cP6IK3PK9KYBiNqVacCqSVmMcxk5YtkDUxqvsQXKCFnLivc6MNzg0cFF5cqp+XvmjZ
 kXyWQ7hGmYufk5Wirp/sPdsWvbxXSUwPfry7NXRzZyaJMNG9Vxv4QN+/nt+3xc4o+e
 fu3pawPjzQXhlVTsNJqHEvqvfRMQZ4rP2kkU9XEOanb5sSH/QLQFtN5/unRrZWeVfo
 fhqJ6XQWXjx0g==
Date: Thu, 14 Aug 2025 11:32:58 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [PATCH v11 5/9] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
Message-ID: <aJ18En7EV1fGc4V_@sumit-X1>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-6-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813060339.2977604-6-jens.wiklander@linaro.org>
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

On Wed, Aug 13, 2025 at 08:02:54AM +0200, Jens Wiklander wrote:
> From: Etienne Carriere <etienne.carriere@foss.st.com>
> 
> Add a userspace API to create a tee_shm object that refers to a dmabuf
> reference.
> 
> Userspace registers the dmabuf file descriptor as in a tee_shm object.
> The registration is completed with a tee_shm returned file descriptor.
> 
> Userspace is free to close the dmabuf file descriptor after it has been
> registered since all the resources are now held via the new tee_shm
> object.
> 
> Closing the tee_shm file descriptor will eventually release all
> resources used by the tee_shm object when all references are released.
> 
> The new IOCTL, TEE_IOC_SHM_REGISTER_FD, supports dmabuf references to
> physically contiguous memory buffers. Dmabuf references acquired from
> the TEE DMA-heap can be used as protected memory for Secure Video Path
> and such use cases. It depends on the TEE and the TEE driver if dmabuf
> references acquired by other means can be used.
> 
> A new tee_shm flag is added to identify tee_shm objects built from a
> registered dmabuf, TEE_SHM_DMA_BUF.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c    | 63 ++++++++++++++++++++++++++++++++-
>  drivers/tee/tee_private.h |  8 +++++
>  drivers/tee/tee_shm.c     | 74 +++++++++++++++++++++++++++++++++++++--
>  include/linux/tee_core.h  |  1 +
>  include/linux/tee_drv.h   | 10 ++++++
>  include/uapi/linux/tee.h  | 31 ++++++++++++++++
>  6 files changed, 183 insertions(+), 4 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index b89f93b1f8f2..fe414595fc2c 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -354,11 +354,49 @@ tee_ioctl_shm_register(struct tee_context *ctx,
>  	return ret;
>  }
>  
> +static int
> +tee_ioctl_shm_register_fd(struct tee_context *ctx,
> +			  struct tee_ioctl_shm_register_fd_data __user *udata)
> +{
> +	struct tee_ioctl_shm_register_fd_data data;
> +	struct tee_shm *shm;
> +	long ret;
> +
> +	if (copy_from_user(&data, udata, sizeof(data)))
> +		return -EFAULT;
> +
> +	/* Currently no input flags are supported */
> +	if (data.flags)
> +		return -EINVAL;
> +
> +	shm = tee_shm_register_fd(ctx, data.fd);
> +	if (IS_ERR(shm))
> +		return -EINVAL;
> +
> +	data.id = shm->id;
> +	data.flags = shm->flags;
> +	data.size = shm->size;
> +
> +	if (copy_to_user(udata, &data, sizeof(data)))
> +		ret = -EFAULT;
> +	else
> +		ret = tee_shm_get_fd(shm);
> +
> +	/*
> +	 * When user space closes the file descriptor the shared memory
> +	 * should be freed or if tee_shm_get_fd() failed then it will
> +	 * be freed immediately.
> +	 */
> +	tee_shm_put(shm);
> +	return ret;
> +}
> +
>  static int param_from_user_memref(struct tee_context *ctx,
>  				  struct tee_param_memref *memref,
>  				  struct tee_ioctl_param *ip)
>  {
>  	struct tee_shm *shm;
> +	size_t offs = 0;
>  
>  	/*
>  	 * If a NULL pointer is passed to a TA in the TEE,
> @@ -389,6 +427,26 @@ static int param_from_user_memref(struct tee_context *ctx,
>  			tee_shm_put(shm);
>  			return -EINVAL;
>  		}
> +
> +		if (shm->flags & TEE_SHM_DMA_BUF) {
> +			struct tee_shm_dmabuf_ref *ref;
> +
> +			ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> +			if (ref->parent_shm) {
> +				/*
> +				 * The shm already has one reference to
> +				 * ref->parent_shm so we are clear of 0.
> +				 * We're getting another reference since
> +				 * this shm will be used in the parameter
> +				 * list instead of the shm we got with
> +				 * tee_shm_get_from_id() above.
> +				 */
> +				refcount_inc(&ref->parent_shm->refcount);
> +				tee_shm_put(shm);
> +				shm = ref->parent_shm;
> +				offs = ref->offset;
> +			}
> +		}
>  	} else if (ctx->cap_memref_null) {
>  		/* Pass NULL pointer to OP-TEE */
>  		shm = NULL;
> @@ -396,7 +454,7 @@ static int param_from_user_memref(struct tee_context *ctx,
>  		return -EINVAL;
>  	}
>  
> -	memref->shm_offs = ip->a;
> +	memref->shm_offs = ip->a + offs;
>  	memref->size = ip->b;
>  	memref->shm = shm;
>  
> @@ -842,6 +900,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return tee_ioctl_shm_alloc(ctx, uarg);
>  	case TEE_IOC_SHM_REGISTER:
>  		return tee_ioctl_shm_register(ctx, uarg);
> +	case TEE_IOC_SHM_REGISTER_FD:
> +		return tee_ioctl_shm_register_fd(ctx, uarg);
>  	case TEE_IOC_OPEN_SESSION:
>  		return tee_ioctl_open_session(ctx, uarg);
>  	case TEE_IOC_INVOKE:
> @@ -1303,3 +1363,4 @@ MODULE_AUTHOR("Linaro");
>  MODULE_DESCRIPTION("TEE Driver");
>  MODULE_VERSION("1.0");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("DMA_BUF");
> diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> index 6c6ff5d5eed2..a9b5e4a6a8f7 100644
> --- a/drivers/tee/tee_private.h
> +++ b/drivers/tee/tee_private.h
> @@ -13,6 +13,14 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> +/* extra references appended to shm object for registered shared memory */
> +struct tee_shm_dmabuf_ref {
> +	struct tee_shm shm;
> +	size_t offset;
> +	struct dma_buf *dmabuf;
> +	struct tee_shm *parent_shm;
> +};
> +
>  int tee_shm_get_fd(struct tee_shm *shm);
>  
>  bool tee_device_get(struct tee_device *teedev);
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index daf6e5cfd59a..76195a398c89 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -4,6 +4,7 @@
>   */
>  #include <linux/anon_inodes.h>
>  #include <linux/device.h>
> +#include <linux/dma-buf.h>
>  #include <linux/idr.h>
>  #include <linux/io.h>
>  #include <linux/mm.h>
> @@ -45,7 +46,15 @@ static void release_registered_pages(struct tee_shm *shm)
>  
>  static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>  {
> -	if (shm->flags & TEE_SHM_POOL) {
> +	void *p = shm;
> +
> +	if (shm->flags & TEE_SHM_DMA_BUF) {
> +		struct tee_shm_dmabuf_ref *ref;
> +
> +		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> +		p = ref;
> +		dma_buf_put(ref->dmabuf);
> +	} else if (shm->flags & TEE_SHM_POOL) {
>  		teedev->pool->ops->free(teedev->pool, shm);
>  	} else if (shm->flags & TEE_SHM_DYNAMIC) {
>  		int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
> @@ -59,7 +68,7 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
>  
>  	teedev_ctx_put(shm->ctx);
>  
> -	kfree(shm);
> +	kfree(p);
>  
>  	tee_device_put(teedev);
>  }
> @@ -169,7 +178,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size)
>   * tee_client_invoke_func(). The memory allocated is later freed with a
>   * call to tee_shm_free().
>   *
> - * @returns a pointer to 'struct tee_shm'
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
>   */
>  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
>  {
> @@ -179,6 +188,62 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
>  
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> +{
> +	struct tee_shm_dmabuf_ref *ref;
> +	int rc;
> +
> +	if (!tee_device_get(ctx->teedev))
> +		return ERR_PTR(-EINVAL);
> +
> +	teedev_ctx_get(ctx);
> +
> +	ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> +	if (!ref) {
> +		rc = -ENOMEM;
> +		goto err_put_tee;
> +	}
> +
> +	refcount_set(&ref->shm.refcount, 1);
> +	ref->shm.ctx = ctx;
> +	ref->shm.id = -1;
> +	ref->shm.flags = TEE_SHM_DMA_BUF;
> +
> +	ref->dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(ref->dmabuf)) {
> +		rc = PTR_ERR(ref->dmabuf);
> +		goto err_kfree_ref;
> +	}
> +
> +	rc = tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
> +					  &ref->offset, &ref->shm,
> +					  &ref->parent_shm);
> +	if (rc)
> +		goto err_put_dmabuf;
> +
> +	mutex_lock(&ref->shm.ctx->teedev->mutex);
> +	ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> +				1, 0, GFP_KERNEL);
> +	mutex_unlock(&ref->shm.ctx->teedev->mutex);
> +	if (ref->shm.id < 0) {
> +		rc = ref->shm.id;
> +		goto err_put_dmabuf;
> +	}
> +
> +	return &ref->shm;
> +
> +err_put_dmabuf:
> +	dma_buf_put(ref->dmabuf);
> +err_kfree_ref:
> +	kfree(ref);
> +err_put_tee:
> +	teedev_ctx_put(ctx);
> +	tee_device_put(ctx->teedev);
> +
> +	return ERR_PTR(rc);
> +}
> +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> +
>  /**
>   * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately shared
>   *			      kernel buffer
> @@ -442,6 +507,9 @@ static int tee_shm_fop_mmap(struct file *filp, struct vm_area_struct *vma)
>  	/* Refuse sharing shared memory provided by application */
>  	if (shm->flags & TEE_SHM_USER_MAPPED)
>  		return -EINVAL;
> +	/* Refuse sharing registered DMA_bufs with the application */
> +	if (shm->flags & TEE_SHM_DMA_BUF)
> +		return -EINVAL;
>  
>  	/* check for overflowing the buffer's size */
>  	if (vma->vm_pgoff + vma_pages(vma) > shm->size >> PAGE_SHIFT)
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index 28b65010b9ed..b6c54b34a8b5 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -28,6 +28,7 @@
>  #define TEE_SHM_USER_MAPPED	BIT(1)  /* Memory mapped in user space */
>  #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
>  #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
> +#define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
>  
>  #define TEE_DEVICE_FLAG_REGISTERED	0x1
>  #define TEE_MAX_DEV_NAME_LEN		32
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index a54c203000ed..824f1251de60 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
>  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
>  					    void *addr, size_t length);
>  
> +/**
> + * tee_shm_register_fd() - Register shared memory from file descriptor
> + *
> + * @ctx:	Context that allocates the shared memory
> + * @fd:		Shared memory file descriptor reference
> + *
> + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
> + */
> +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> +
>  /**
>   * tee_shm_free() - Free shared memory
>   * @shm:	Handle to shared memory to free
> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> index d0430bee8292..d843cf980d98 100644
> --- a/include/uapi/linux/tee.h
> +++ b/include/uapi/linux/tee.h
> @@ -378,6 +378,37 @@ struct tee_ioctl_shm_register_data {
>  	__s32 id;
>  };
>  
> +/**
> + * struct tee_ioctl_shm_register_fd_data - Shared memory registering argument
> + * @fd:		[in] File descriptor identifying dmabuf reference
> + * @size:	[out] Size of referenced memory
> + * @flags:	[in] Flags to/from allocation.
> + * @id:		[out] Identifier of the shared memory
> + *
> + * The flags field should currently be zero as input. Updated by the call
> + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD below.
> + */
> +struct tee_ioctl_shm_register_fd_data {
> +	__s64 fd;
> +	__u64 size;
> +	__u32 flags;
> +	__s32 id;
> +};
> +
> +/**
> + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file descriptor
> + *
> + * Returns a file descriptor on success or < 0 on failure
> + *
> + * The returned file descriptor refers to the shared memory object in the
> + * kernel. The supplied file deccriptor can be closed if it's not needed
> + * for other purposes. The shared memory is freed when the descriptor is
> + * closed.
> + */
> +#define TEE_IOC_SHM_REGISTER_FD	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 8, \
> +				     struct tee_ioctl_shm_register_fd_data)
> +
>  /**
>   * TEE_IOC_SHM_REGISTER - Register shared memory argument
>   *
> -- 
> 2.43.0
> 
