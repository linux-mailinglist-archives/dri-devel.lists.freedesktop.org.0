Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1FB3DF242
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 18:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CD989F2E;
	Tue,  3 Aug 2021 16:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FC289F2E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 16:13:29 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id c00e4ed9-f475-11eb-9082-0050568c148b;
 Tue, 03 Aug 2021 16:13:33 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 520E9194B79;
 Tue,  3 Aug 2021 18:13:48 +0200 (CEST)
Date: Tue, 3 Aug 2021 18:13:21 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 noralf@tronnes.org, drawat.floss@gmail.com, kraxel@redhat.com,
 hdegoede@redhat.com, sean@poorly.run, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 01/11] drm/gem: Provide offset-adjusted framebuffer BO
 mappings
Message-ID: <YQlrIZxoz9kdUqUz@ravnborg.org>
References: <20210803125928.27780-1-tzimmermann@suse.de>
 <20210803125928.27780-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803125928.27780-2-tzimmermann@suse.de>
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

Hi Thomas,

On Tue, Aug 03, 2021 at 02:59:18PM +0200, Thomas Zimmermann wrote:
> Add an additional argument to drm_gem_fb_vmap() to return each BO's
> mapping adjusted by the rsp offset. Update all callers.

rsp? respective?

> 
> The newly returned values point to the first by of the data stored
by => byte

> in the framebuffer BOs. Drivers that access the BO data should use
> it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c      |  2 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 17 ++++++++++++++++-
>  drivers/gpu/drm/gud/gud_pipe.c               |  2 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c        |  2 +-
>  include/drm/drm_gem_atomic_helper.h          |  8 ++++++++
>  include/drm/drm_gem_framebuffer_helper.h     |  3 ++-
>  6 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index b1cc19e47165..8410ec3c5db0 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -339,7 +339,7 @@ int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *p
>  	if (ret)
>  		return ret;
>  
> -	return drm_gem_fb_vmap(fb, shadow_plane_state->map);
> +	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
>  }
>  EXPORT_SYMBOL(drm_gem_prepare_shadow_fb);
>  
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 02928607a716..7f2bbe4f0053 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -316,19 +316,25 @@ EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
>   * drm_gem_fb_vmap - maps all framebuffer BOs into kernel address space
>   * @fb: the framebuffer
>   * @map: returns the mapping's address for each BO
> + * @data: returns the data address for each BO, can be NULL
>   *
>   * This function maps all buffer objects of the given framebuffer into
>   * kernel address space and stores them in struct dma_buf_map. If the
>   * mapping operation fails for one of the BOs, the function unmaps the
>   * already established mappings automatically.
>   *
> + * Callers that want to access a BO's stored data should pass @data.
> + * The argument returns the addresses of the data stored in each BO. This
> + * is different from @map if the framebuffer's offsets field is non-zero.
> + *
>   * See drm_gem_fb_vunmap() for unmapping.
>   *
>   * Returns:
>   * 0 on success, or a negative errno code otherwise.
>   */
>  int drm_gem_fb_vmap(struct drm_framebuffer *fb,
> -		    struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES])
> +		    struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES],
> +		    struct dma_buf_map data[DRM_FORMAT_MAX_PLANES])
>  {
>  	struct drm_gem_object *obj;
>  	unsigned int i;
> @@ -345,6 +351,15 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
>  			goto err_drm_gem_vunmap;
>  	}
>  
> +	if (data) {
> +		for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
> +			memcpy(&data[i], &map[i], sizeof(data[i]));
> +			if (dma_buf_map_is_null(&data[i]))
> +				continue;
> +			dma_buf_map_incr(&data[i], fb->offsets[i]);
> +		}
> +	}
> +
>  	return 0;
>  
>  err_drm_gem_vunmap:
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 7e009f562b30..6270a1a32a65 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -162,7 +162,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>  	if (len > gdrm->bulk_len)
>  		return -E2BIG;
>  
> -	ret = drm_gem_fb_vmap(fb, map);
> +	ret = drm_gem_fb_vmap(fb, map, NULL);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 425b6c6b8cad..3a8e2ed93e7c 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -75,7 +75,7 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
>  	if (!vkmsjob)
>  		return -ENOMEM;
>  
> -	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map);
> +	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map, NULL);
>  	if (ret) {
>  		DRM_ERROR("vmap failed: %d\n", ret);
>  		goto err_kfree;
> diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
> index f9f8b6f0494a..48222a107873 100644
> --- a/include/drm/drm_gem_atomic_helper.h
> +++ b/include/drm/drm_gem_atomic_helper.h
> @@ -42,6 +42,14 @@ struct drm_shadow_plane_state {
>  	 * prepare_fb callback and removed in the cleanup_fb callback.
>  	 */
>  	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
> +
> +	/**
> +	 * @data: Address of each framebuffer BO's data
> +	 *
> +	 * The address of the data stored in each mapping. This is different
> +	 * for framebuffers with non-zero offset fields.
> +	 */
> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
>  };
>  
>  /**
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index ff2024dd7b77..905727719ead 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -40,7 +40,8 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd);
>  
>  int drm_gem_fb_vmap(struct drm_framebuffer *fb,
> -		    struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES]);
> +		    struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES],
> +		    struct dma_buf_map data[DRM_FORMAT_MAX_PLANES]);
>  void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
>  		       struct dma_buf_map map[static DRM_FORMAT_MAX_PLANES]);
>  int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir);
> -- 
> 2.32.0
