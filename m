Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EEDAF002D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5885010E5CF;
	Tue,  1 Jul 2025 16:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A365410E5D1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 16:42:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B136236D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:41:45 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BF703F58B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:41:59 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:41:58 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 05/19] drm: Allow the caller to pass in the format
 info to drm_helper_mode_fill_fb_struct()
Message-ID: <aGQP1pWrItse3dn4@e110455-lin.cambridge.arm.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-6-ville.syrjala@linux.intel.com>
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

On Tue, Jul 01, 2025 at 12:07:08PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Soon all drivers should have the format info already available in the
> places where they call drm_helper_mode_fill_fb_struct(). Allow it to
> be passed along into drm_helper_mode_fill_fb_struct() instead of doing
> yet another redundant lookup.
> 
> Start by always passing in NULL and still doing the extra lookup.
> The actual changes to avoid the lookup will follow.
> 
> Done with cocci (with some manual fixups):
> @@
> identifier dev, fb, mode_cmd;
> expression get_format_info;
> @@
> void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
>                                     struct drm_framebuffer *fb,
> +                                    const struct drm_format_info *info,
>                                     const struct drm_mode_fb_cmd2 *mode_cmd)
> {
> ...
> - fb->format = get_format_info;
> + fb->format = info ?: get_format_info;
> ...
> }
> 
> @@
> identifier dev, fb, mode_cmd;
> @@
> void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
>                                     struct drm_framebuffer *fb,
> +                                    const struct drm_format_info *info,
>                                     const struct drm_mode_fb_cmd2 *mode_cmd);
> 
> @@
> expression dev, fb, mode_cmd;
> @@
> drm_helper_mode_fill_fb_struct(dev, fb
> +	       ,NULL
> 	       ,mode_cmd);
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Cc: virtualization@lists.linux.dev
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c             | 2 +-
>  drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 2 +-

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  drivers/gpu/drm/armada/armada_fb.c                      | 2 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c            | 2 +-
>  drivers/gpu/drm/drm_modeset_helper.c                    | 6 ++++--
>  drivers/gpu/drm/exynos/exynos_drm_fb.c                  | 2 +-
>  drivers/gpu/drm/gma500/framebuffer.c                    | 2 +-
>  drivers/gpu/drm/i915/display/intel_fb.c                 | 2 +-
>  drivers/gpu/drm/msm/msm_fb.c                            | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c               | 2 +-
>  drivers/gpu/drm/omapdrm/omap_fb.c                       | 2 +-
>  drivers/gpu/drm/radeon/radeon_display.c                 | 2 +-
>  drivers/gpu/drm/tegra/fb.c                              | 2 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c                | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                     | 4 ++--
>  include/drm/drm_modeset_helper.h                        | 2 ++
>  16 files changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 10c57ded0e3e..4cbbae543e34 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1202,7 +1202,7 @@ static int amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
>  	int ret;
>  
>  	rfb->base.obj[0] = obj;
> -	drm_helper_mode_fill_fb_struct(dev, &rfb->base, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, &rfb->base, NULL, mode_cmd);
>  	/* Verify that the modifier is supported. */
>  	if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
>  				      mode_cmd->modifier[0])) {
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> index 29b05482f713..acd8e505ebc7 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
> @@ -178,7 +178,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	drm_helper_mode_fill_fb_struct(dev, &kfb->base, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, &kfb->base, NULL, mode_cmd);
>  
>  	if (kfb->base.modifier)
>  		ret = komeda_fb_afbc_size_check(kfb, file, mode_cmd);
> diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
> index 597720e229c2..7e94ec5bd4f4 100644
> --- a/drivers/gpu/drm/armada/armada_fb.c
> +++ b/drivers/gpu/drm/armada/armada_fb.c
> @@ -64,7 +64,7 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
>  	dfb->mod = config;
>  	dfb->fb.obj[0] = &obj->obj;
>  
> -	drm_helper_mode_fill_fb_struct(dev, &dfb->fb, mode);
> +	drm_helper_mode_fill_fb_struct(dev, &dfb->fb, NULL, mode);
>  
>  	ret = drm_framebuffer_init(dev, &dfb->fb, &armada_fb_funcs);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 7c0d2174dbc9..6fe4094bd0fe 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -75,7 +75,7 @@ drm_gem_fb_init(struct drm_device *dev,
>  	unsigned int i;
>  	int ret;
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>  
>  	for (i = 0; i < num_planes; i++)
>  		fb->obj[i] = obj[i];
> diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
> index 3fed2d5ab1d6..89ba99970735 100644
> --- a/drivers/gpu/drm/drm_modeset_helper.c
> +++ b/drivers/gpu/drm/drm_modeset_helper.c
> @@ -74,6 +74,7 @@ EXPORT_SYMBOL(drm_helper_move_panel_connectors_to_head);
>   * drm_helper_mode_fill_fb_struct - fill out framebuffer metadata
>   * @dev: DRM device
>   * @fb: drm_framebuffer object to fill out
> + * @info: pixel format information
>   * @mode_cmd: metadata from the userspace fb creation request
>   *
>   * This helper can be used in a drivers fb_create callback to pre-fill the fb's
> @@ -81,13 +82,14 @@ EXPORT_SYMBOL(drm_helper_move_panel_connectors_to_head);
>   */
>  void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
>  				    struct drm_framebuffer *fb,
> +				    const struct drm_format_info *info,
>  				    const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
>  	int i;
>  
>  	fb->dev = dev;
> -	fb->format = drm_get_format_info(dev, mode_cmd->pixel_format,
> -					 mode_cmd->modifier[0]);
> +	fb->format = info ? : drm_get_format_info(dev, mode_cmd->pixel_format,
> +						  mode_cmd->modifier[0]);
>  	fb->width = mode_cmd->width;
>  	fb->height = mode_cmd->height;
>  	for (i = 0; i < 4; i++) {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index 9ae526825726..7091d31835ec 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -76,7 +76,7 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
>  		fb->obj[i] = &exynos_gem[i]->base;
>  	}
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>  
>  	ret = drm_framebuffer_init(dev, fb, &exynos_drm_fb_funcs);
>  	if (ret < 0) {
> diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
> index a4a18ec2dd56..f9ade8361354 100644
> --- a/drivers/gpu/drm/gma500/framebuffer.c
> +++ b/drivers/gpu/drm/gma500/framebuffer.c
> @@ -47,7 +47,7 @@ static int psb_framebuffer_init(struct drm_device *dev,
>  	if (mode_cmd->pitches[0] & 63)
>  		return -EINVAL;
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>  	fb->obj[0] = obj;
>  	ret = drm_framebuffer_init(dev, fb, &psb_fb_funcs);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 571d2720575b..30fa287ed6b0 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -2254,7 +2254,7 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>  		goto err_frontbuffer_put;
>  	}
>  
> -	drm_helper_mode_fill_fb_struct(display->drm, fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(display->drm, fb, NULL, mode_cmd);
>  
>  	for (i = 0; i < fb->format->num_planes; i++) {
>  		unsigned int stride_alignment;
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 4aef51cef3d5..0615427e85ce 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -222,7 +222,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
>  		msm_fb->base.obj[i] = bos[i];
>  	}
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>  
>  	ret = drm_framebuffer_init(dev, fb, &msm_framebuffer_funcs);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 1ddd92901526..e1e542126310 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -321,7 +321,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  	if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
>  		return -ENOMEM;
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>  	fb->obj[0] = gem;
>  
>  	ret = drm_framebuffer_init(dev, fb, &nouveau_framebuffer_funcs);
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 36afcd1c1fd7..30c81e2e5d6b 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -440,7 +440,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
>  		plane->dma_addr  = 0;
>  	}
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>  
>  	ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 85b714ac9882..b4bf5dfeea2d 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1302,7 +1302,7 @@ radeon_framebuffer_init(struct drm_device *dev,
>  {
>  	int ret;
>  	fb->obj[0] = obj;
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
>  	ret = drm_framebuffer_init(dev, fb, &radeon_fb_funcs);
>  	if (ret) {
>  		fb->obj[0] = NULL;
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 24907573e758..d359683f5ce6 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -114,7 +114,7 @@ struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
>  	if (!fb)
>  		return ERR_PTR(-ENOMEM);
>  
> -	drm_helper_mode_fill_fb_struct(drm, fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(drm, fb, NULL, mode_cmd);
>  
>  	for (i = 0; i < fb->format->num_planes; i++)
>  		fb->obj[i] = &planes[i]->gem;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index f9a98fbbabd1..93763b91bab5 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -73,7 +73,7 @@ virtio_gpu_framebuffer_init(struct drm_device *dev,
>  
>  	vgfb->base.obj[0] = obj;
>  
> -	drm_helper_mode_fill_fb_struct(dev, &vgfb->base, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, &vgfb->base, NULL, mode_cmd);
>  
>  	ret = drm_framebuffer_init(dev, &vgfb->base, &virtio_gpu_fb_funcs);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 2d48a28cda9c..35965e29e408 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -548,7 +548,7 @@ static int vmw_kms_new_framebuffer_surface(struct vmw_private *dev_priv,
>  		goto out_err1;
>  	}
>  
> -	drm_helper_mode_fill_fb_struct(dev, &vfbs->base.base, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, &vfbs->base.base, NULL, mode_cmd);
>  	memcpy(&vfbs->uo, uo, sizeof(vfbs->uo));
>  	vmw_user_object_ref(&vfbs->uo);
>  
> @@ -634,7 +634,7 @@ static int vmw_kms_new_framebuffer_bo(struct vmw_private *dev_priv,
>  	}
>  
>  	vfbd->base.base.obj[0] = &bo->tbo.base;
> -	drm_helper_mode_fill_fb_struct(dev, &vfbd->base.base, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, &vfbd->base.base, NULL, mode_cmd);
>  	vfbd->base.bo = true;
>  	vfbd->buffer = vmw_bo_reference(bo);
>  	*out = &vfbd->base;
> diff --git a/include/drm/drm_modeset_helper.h b/include/drm/drm_modeset_helper.h
> index 995fd981cab0..7e3d4c5a7f66 100644
> --- a/include/drm/drm_modeset_helper.h
> +++ b/include/drm/drm_modeset_helper.h
> @@ -26,6 +26,7 @@
>  struct drm_crtc;
>  struct drm_crtc_funcs;
>  struct drm_device;
> +struct drm_format_info;
>  struct drm_framebuffer;
>  struct drm_mode_fb_cmd2;
>  
> @@ -33,6 +34,7 @@ void drm_helper_move_panel_connectors_to_head(struct drm_device *);
>  
>  void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
>  				    struct drm_framebuffer *fb,
> +				    const struct drm_format_info *info,
>  				    const struct drm_mode_fb_cmd2 *mode_cmd);
>  
>  int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -- 
> 2.49.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
