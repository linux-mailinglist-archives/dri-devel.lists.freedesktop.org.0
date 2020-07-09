Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBCB21A1C1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 16:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA0C6EA75;
	Thu,  9 Jul 2020 14:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A476EA70;
 Thu,  9 Jul 2020 14:05:38 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E9788804B9;
 Thu,  9 Jul 2020 16:05:32 +0200 (CEST)
Date: Thu, 9 Jul 2020 16:05:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/virtio: Remove open-coded commit-tail function
Message-ID: <20200709140531.GA220817@ravnborg.org>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <20200709123339.547390-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200709123339.547390-2-daniel.vetter@ffwll.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=7qquH0MEfeve11GKqesA:9
 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-rdma@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 09, 2020 at 02:33:39PM +0200, Daniel Vetter wrote:
> Exactly matches the one in the helpers.
> 
> This avoids me having to roll out dma-fence critical section
> annotations to this copy.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> ---
>  drivers/gpu/drm/virtio/virtgpu_display.c | 20 --------------------
>  1 file changed, 20 deletions(-)
Very nice catch:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index f3ce49c5a34c..af55b334be2f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -314,25 +314,6 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
>  	return &virtio_gpu_fb->base;
>  }
>  
> -static void vgdev_atomic_commit_tail(struct drm_atomic_state *state)
> -{
> -	struct drm_device *dev = state->dev;
> -
> -	drm_atomic_helper_commit_modeset_disables(dev, state);
> -	drm_atomic_helper_commit_modeset_enables(dev, state);
> -	drm_atomic_helper_commit_planes(dev, state, 0);
> -
> -	drm_atomic_helper_fake_vblank(state);
> -	drm_atomic_helper_commit_hw_done(state);
> -
> -	drm_atomic_helper_wait_for_vblanks(dev, state);
> -	drm_atomic_helper_cleanup_planes(dev, state);
> -}
> -
> -static const struct drm_mode_config_helper_funcs virtio_mode_config_helpers = {
> -	.atomic_commit_tail = vgdev_atomic_commit_tail,
> -};
> -
>  static const struct drm_mode_config_funcs virtio_gpu_mode_funcs = {
>  	.fb_create = virtio_gpu_user_framebuffer_create,
>  	.atomic_check = drm_atomic_helper_check,
> @@ -346,7 +327,6 @@ void virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
>  	drm_mode_config_init(vgdev->ddev);
>  	vgdev->ddev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>  	vgdev->ddev->mode_config.funcs = &virtio_gpu_mode_funcs;
> -	vgdev->ddev->mode_config.helper_private = &virtio_mode_config_helpers;
>  
>  	/* modes will be validated against the framebuffer size */
>  	vgdev->ddev->mode_config.min_width = XRES_MIN;
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
