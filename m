Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235F440C658
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 15:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431C46E930;
	Wed, 15 Sep 2021 13:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0126E930
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=iQvD8r+bcolwgB0QgPL1SUt6DtelOQAM2px7rBxhL00=; 
 b=UemG3fmmnJ8E27NGY6zxOiG9RI0u4Y8uZYfEBtNUQNHMV5b1jEVlDvSQlkNznxpatgqJze12VUdHmUJtuQcyOJD28ehbqpbWsXtBQ7ZbB3cuYfD+CCpelciuJA20vfiToxHFkpZor7eGvbQ9B84/GpwQRlQSXgT0OfptbUVP2y0fU2DH5F8QcHcAMJV6JdnImn/Udp3svhn3g6rFBmujtCat42QCRi0h3B0iqdSJ6gRWITmQ2zplX6xhsjVUb9hrcGonJQil+ozXfR35g5Z9xwefYgCtBxfeRlykGoun9sccbGbxyp3jHgpf2eW1X5lZ3tXnQ+uZ3J60D7T6UgtoqQ==;
Received: from 191.49.165.83.dynamic.reverse-mundo-r.com ([83.165.49.191]
 helo=zeus) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mQUuE-0007FD-VD; Wed, 15 Sep 2021 15:24:55 +0200
Message-ID: <633623ded6ffc8c6021648452f171f9da38a02ab.camel@igalia.com>
Subject: Re: [PATCH 2/3] drm/v3d: add generic ioctl extension
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>, Boris
 Brezillon <boris.brezillon@collabora.com>
Date: Wed, 15 Sep 2021 15:24:42 +0200
In-Reply-To: <d5647f22567a71e5ecd3f86f0110aa14f8c6006d.1629307160.git.mwen@igalia.com>
References: <cover.1629307160.git.mwen@igalia.com>
 <d5647f22567a71e5ecd3f86f0110aa14f8c6006d.1629307160.git.mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-08-18 at 18:56 +0100, Melissa Wen wrote:
> Add support to attach generic extensions on job submission.
> This patch is a second prep work to enable multiple syncobjs on job
> submission. With this work, when the job submission interface needs
> to be extended to accomodate a new feature, we will use a generic
> extension struct where an id determines the data type to be pointed.
> The first application is to enable multiples in/out syncobj (next
> patch), but the base is already done for future features.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c |  4 +-
>  drivers/gpu/drm/v3d/v3d_gem.c | 80 ++++++++++++++++++++++++++++++++-
> --
>  include/uapi/drm/v3d_drm.h    | 38 ++++++++++++++++-
>  3 files changed, 113 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c
> b/drivers/gpu/drm/v3d/v3d_drv.c
> index 9403c3b36aca..6a0516160bb2 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -83,7 +83,6 @@ static int v3d_get_param_ioctl(struct drm_device
> *dev, void *data,
>  		return 0;
>  	}
>  
> -
>  	switch (args->param) {
>  	case DRM_V3D_PARAM_SUPPORTS_TFU:
>  		args->value = 1;
> @@ -147,7 +146,7 @@ v3d_postclose(struct drm_device *dev, struct
> drm_file *file)
>  DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
>  
>  /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have
> GMP
> - * protection between clients.  Note that render nodes would be be
> + * protection between clients.  Note that render nodes would be
>   * able to submit CLs that could access BOs from clients
> authenticated
>   * with the master node.  The TFU doesn't use the GMP, so it would
>   * need to stay DRM_AUTH until we do buffer size/offset validation.
> @@ -222,7 +221,6 @@ static int v3d_platform_drm_probe(struct
> platform_device *pdev)
>  	u32 mmu_debug;
>  	u32 ident1;
>  
> -
>  	v3d = devm_drm_dev_alloc(dev, &v3d_drm_driver, struct v3d_dev,
> drm);
>  	if (IS_ERR(v3d))
>  		return PTR_ERR(v3d);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
> b/drivers/gpu/drm/v3d/v3d_gem.c
> index 593ed2206d74..e254919b6c5e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -521,6 +521,38 @@ v3d_attach_fences_and_unlock_reservation(struct
> drm_file *file_priv,
>  	}
>  }
>  
> +static int
> +v3d_get_extensions(struct drm_file *file_priv,
> +		   u32 ext_count, u64 ext_handles)
> +{
> +	int i;
> +	struct drm_v3d_extension __user *handles;
> +
> +	if (!ext_count)
> +		return 0;
> +
> +	handles	= u64_to_user_ptr(ext_handles);
> +	for (i = 0; i < ext_count; i++) {
> +		struct drm_v3d_extension ext;
> +
> +		if (copy_from_user(&ext, handles, sizeof(ext))) {
> +			DRM_DEBUG("Failed to copy submit extension\n");
> +			return -EFAULT;
> +		}
> +
> +		switch (ext.id) {
> +		case 0:
> +		default:
> +			DRM_DEBUG_DRIVER("Unknown extension id: %d\n",
> ext.id);
> +			return -EINVAL;
> +		}
> +
> +		handles = u64_to_user_ptr(ext.next);
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * v3d_submit_cl_ioctl() - Submits a job (frame) to the V3D.
>   * @dev: DRM device
> @@ -549,15 +581,23 @@ v3d_submit_cl_ioctl(struct drm_device *dev,
> void *data,
>  
>  	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args-
> >rcl_end);
>  
> -	if (args->pad != 0)
> -		return -EINVAL;
> -
> -	if (args->flags != 0 &&
> -	    args->flags != DRM_V3D_SUBMIT_CL_FLUSH_CACHE) {
> +	if (args->flags &&
> +	    args->flags & ~(DRM_V3D_SUBMIT_CL_FLUSH_CACHE |
> +			    DRM_V3D_SUBMIT_EXTENSION)) {
>  		DRM_INFO("invalid flags: %d\n", args->flags);
>  		return -EINVAL;
>  	}
>  
> +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> +		ret = v3d_get_extensions(file_priv,
> +					 args->extension_count,
> +					 args->extensions);
> +		if (ret) {
> +			DRM_DEBUG("Failed to get extensions.\n");
> +			return ret;
> +		}
> +	}
> +
>  	render = kcalloc(1, sizeof(*render), GFP_KERNEL);
>  	if (!render)
>  		return -ENOMEM;
> @@ -711,6 +751,21 @@ v3d_submit_tfu_ioctl(struct drm_device *dev,
> void *data,
>  
>  	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
>  
> +	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
> +		DRM_DEBUG("invalid flags: %d\n", args->flags);
> +		return -EINVAL;
> +	}
> +
> +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> +		ret = v3d_get_extensions(file_priv,
> +					 args->extension_count,
> +					 args->extensions);
> +		if (ret) {
> +			DRM_DEBUG("Failed to get extensions.\n");
> +			return ret;
> +		}
> +	}
> +
>  	job = kcalloc(1, sizeof(*job), GFP_KERNEL);
>  	if (!job)
>  		return -ENOMEM;
> @@ -806,6 +861,21 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
> void *data,
>  		return -EINVAL;
>  	}
>  
> +	if (args->flags && !(args->flags & DRM_V3D_SUBMIT_EXTENSION)) {
> +		DRM_DEBUG("Invalid flags: %d\n", args->flags);
> +		return -EINVAL;
> +	}
> +
> +	if (args->flags & DRM_V3D_SUBMIT_EXTENSION) {
> +		ret = v3d_get_extensions(file_priv,
> +					 args->extension_count,
> +					 args->extensions);
> +		if (ret) {
> +			DRM_DEBUG("Failed to get extensions.\n");
> +			return ret;
> +		}
> +	}
> +
>  	job = kcalloc(1, sizeof(*job), GFP_KERNEL);
>  	if (!job)
>  		return -ENOMEM;
> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
> index 4104f22fb3d3..1f4706010eb5 100644
> --- a/include/uapi/drm/v3d_drm.h
> +++ b/include/uapi/drm/v3d_drm.h
> @@ -58,6 +58,19 @@ extern "C" {
>  						   struct
> drm_v3d_perfmon_get_values)
>  
>  #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
> +#define DRM_V3D_SUBMIT_EXTENSION		  0x02
> +
> +/* struct drm_v3d_extension - ioctl extensions
> + *
> + * Linked-list of generic extensions where the id identify which
> struct is
> + * pointed by ext_data. Therefore, DRM_V3D_EXT_ID_* is used on id to
> identify
> + * the extension type.
> + */
> +struct drm_v3d_extension {
> +	__u64 next;
> +	__u64 ext_data;
> +	__u32 id;
> +};
>  
>  /**
>   * struct drm_v3d_submit_cl - ioctl argument for submitting commands
> to the 3D
> @@ -135,12 +148,17 @@ struct drm_v3d_submit_cl {
>  	/* Number of BO handles passed in (size is that times 4). */
>  	__u32 bo_handle_count;
>  
> +	/* DRM_V3D_SUBMIT_* properties */
>  	__u32 flags;
>  
>  	/* ID of the perfmon to attach to this job. 0 means no perfmon.
> */
>  	__u32 perfmon_id;
>  
> -	__u32 pad;
> +	/* Number of extensions*/
> +	__u32 extension_count;
> +
> +	/* Pointer to a list of ioctl extensions*/
> +	__u64 extensions;
>  };
>  
>  /**
> @@ -248,6 +266,15 @@ struct drm_v3d_submit_tfu {
>  	__u32 in_sync;
>  	/* Sync object to signal when the TFU job is done. */
>  	__u32 out_sync;
> +
> +	/* Number of extensions*/
> +	__u32 extension_count;
> +
> +	/* Pointer to an array of ioctl extensions*/
> +	__u64 extensions;
> +
> +	/* DRM_V3D_SUBMIT_* properties */
> +	__u32 flags;

A silly nit: maybe put flags before the extension fields above for
consistency with the CSD and CL submission commands.

>  };
>  
>  /* Submits a compute shader for dispatch.  This job will block on
> any
> @@ -276,6 +303,15 @@ struct drm_v3d_submit_csd {
>  
>  	/* ID of the perfmon to attach to this job. 0 means no perfmon.
> */
>  	__u32 perfmon_id;
> +
> +	/* DRM_V3D_SUBMIT_* properties */
> +	__u32 flags;
> +
> +	/* Number of extensions*/
> +	__u32 extension_count;
> +
> +	/* Pointer to a list of ioctl extensions*/
> +	__u64 extensions;
>  };
>  
>  enum {

