Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C1EA881E6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31C110E5BC;
	Mon, 14 Apr 2025 13:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05AC10E5BA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:27:53 +0000 (UTC)
Date: Mon, 14 Apr 2025 09:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744637269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1C5c64+p1nlRmCwVxuXDjyKl+SEqJCNd/ze97PWy/U=;
 b=0B/BIb8f5qUt/LbiP0iShpoR3FU4ZHSAwxZPIVoLPYjNQQETr8ZxY1gAYDUfwulLT2JQSD
 1kKygRQ218lQKl5O41sVq17IzGGli19+3nC3uaJUiQXeLvGUk5NZl/76VoyZO2FOJUBeDO
 alHcJ5IS+WysIMpHRe379gEAL/yPJLUHdEvPdGujbOCGLEAT2aVkzJALNqyeu7VXxwx67z
 0FkC6GUpsx+YdPp+t/2hi3JLzxspXeP7R8sPD8vSHPWQyqhyUzjrSHYd+xStEgmSW5u58W
 c50jAZd9ZzTiprkACqzGlq5JimbJ9aJBBoWNmg0vn6BnqPJc4uRAzc6Pl0oLpQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/8] drm: drv: implement __drm_dev_alloc()
Message-ID: <Z_0NTwPsHoPFdEXF@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-2-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410235546.43736-2-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Fri , Apr 11, 2025 at 01:55:20AM +0200, Danilo Krummrich a écrit :
> In the Rust DRM device abstraction we need to allocate a struct
> drm_device.
> 
> Currently, there are two options, the deprecated drm_dev_alloc() (which
> does not support subclassing) and devm_drm_dev_alloc(). The latter
> supports subclassing, but also manages the initial reference through
> devres for the parent device.
> 
> In Rust we want to conform with the subclassing pattern, but do not want
> to get the initial reference managed for us, since Rust has its own,
> idiomatic ways to properly deal with it.
> 
> There are two options to achieve this.
> 
>   1) Allocate the memory ourselves with a KBox.
>   2) Implement __drm_dev_alloc(), which supports subclassing, but is
>      unmanged.
> 
> While (1) would be possible, it would be cumbersome, since it would
> require exporting drm_dev_init() and drmm_add_final_kfree().
> 
> Hence, go with option (2) and implement __drm_dev_alloc().
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/drm/drm_drv.c | 58 ++++++++++++++++++++++++++++-----------
>  include/drm/drm_drv.h     |  5 ++++
>  2 files changed, 47 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..ebb648f1c7a9 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -808,36 +808,62 @@ void *__devm_drm_dev_alloc(struct device *parent,
>  EXPORT_SYMBOL(__devm_drm_dev_alloc);
>  
>  /**
> - * drm_dev_alloc - Allocate new DRM device
> - * @driver: DRM driver to allocate device for
> + * __drm_dev_alloc - Allocation of a &drm_device instance
>   * @parent: Parent device object
> + * @driver: DRM driver
> + * @size: the size of the struct which contains struct drm_device
> + * @offset: the offset of the &drm_device within the container.
>   *
> - * This is the deprecated version of devm_drm_dev_alloc(), which does not support
> - * subclassing through embedding the struct &drm_device in a driver private
> - * structure, and which does not support automatic cleanup through devres.
> + * This should *NOT* be by any drivers, but is a dedicated interface for the
> + * corresponding Rust abstraction.
>   *
> - * RETURNS:
> - * Pointer to new DRM device, or ERR_PTR on failure.
> + * This is the same as devm_drm_dev_alloc(), but without the corresponding
> + * resource management through the parent device, but not the same as
> + * drm_dev_alloc(), since the latter is the deprecated version, which does not
> + * support subclassing.
> + *
> + * Returns: A pointer to new DRM device, or an ERR_PTR on failure.
>   */
> -struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
> -				 struct device *parent)
> +void *__drm_dev_alloc(struct device *parent,
> +		      const struct drm_driver *driver,
> +		      size_t size, size_t offset)
>  {
> -	struct drm_device *dev;
> +	void *container;
> +	struct drm_device *drm;
>  	int ret;
>  
> -	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> -	if (!dev)
> +	container = kzalloc(size, GFP_KERNEL);
> +	if (!container)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = drm_dev_init(dev, driver, parent);
> +	drm = container + offset;
> +	ret = drm_dev_init(drm, driver, parent);
>  	if (ret) {
> -		kfree(dev);
> +		kfree(container);
>  		return ERR_PTR(ret);
>  	}
> +	drmm_add_final_kfree(drm, container);
>  
> -	drmm_add_final_kfree(dev, dev);
> +	return container;
> +}
> +EXPORT_SYMBOL(__drm_dev_alloc);
>  
> -	return dev;
> +/**
> + * drm_dev_alloc - Allocate new DRM device
> + * @driver: DRM driver to allocate device for
> + * @parent: Parent device object
> + *
> + * This is the deprecated version of devm_drm_dev_alloc(), which does not support
> + * subclassing through embedding the struct &drm_device in a driver private
> + * structure, and which does not support automatic cleanup through devres.
> + *
> + * RETURNS:
> + * Pointer to new DRM device, or ERR_PTR on failure.
> + */
> +struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
> +				 struct device *parent)
> +{
> +	return __drm_dev_alloc(parent, driver, sizeof(struct drm_device), 0);
>  }
>  EXPORT_SYMBOL(drm_dev_alloc);
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index a43d707b5f36..63b51942d606 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -473,6 +473,11 @@ drmm_cgroup_register_region(struct drm_device *dev,
>  
>  struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
>  				 struct device *parent);
> +
> +void *__drm_dev_alloc(struct device *parent,
> +		      const struct drm_driver *driver,
> +		      size_t size, size_t offset);
> +
>  int drm_dev_register(struct drm_device *dev, unsigned long flags);
>  void drm_dev_unregister(struct drm_device *dev);
>  
> -- 
> 2.49.0
> 
