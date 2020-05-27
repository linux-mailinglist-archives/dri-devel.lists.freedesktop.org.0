Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8251E4C3C
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 19:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B696E191;
	Wed, 27 May 2020 17:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E2E6E191;
 Wed, 27 May 2020 17:44:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E7FAD8063B;
 Wed, 27 May 2020 19:44:14 +0200 (CEST)
Date: Wed, 27 May 2020 19:44:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: use drm_dev_has_vblank more
Message-ID: <20200527174413.GA98921@ravnborg.org>
References: <20200527111134.1571781-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527111134.1571781-1-daniel.vetter@ffwll.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=XJwfjo96hc9i5sMrGfkA:9 a=Jokcs-bknmqL94pQ:21
 a=swgEPVSOk_qj554C:21 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 01:11:34PM +0200, Daniel Vetter wrote:
> For historical reasons it's called dev->num_crtcs, which is rather
> confusing ever since kms was added. But now we have a nice helper, so
> let's use it for better readability!
> 
> Only code change is in atomic helpers: vblank support means that
> dev->irq_enabled must be set too. Another one of these quirky things
> ... But since it's implied we can simplify that check.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |  2 +-
>  drivers/gpu/drm/drm_irq.c           |  2 +-
>  drivers/gpu/drm/drm_vblank.c        | 14 +++++++-------
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 0a541368246e..bfcc7857a9a1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1097,7 +1097,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
>  		else if (funcs->dpms)
>  			funcs->dpms(crtc, DRM_MODE_DPMS_OFF);
>  
> -		if (!(dev->irq_enabled && dev->num_crtcs))
> +		if (!drm_dev_has_vblank(dev))
>  			continue;
>  
>  		ret = drm_crtc_vblank_get(crtc);
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index 588be45abd7a..09d6e9e2e075 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -181,7 +181,7 @@ int drm_irq_uninstall(struct drm_device *dev)
>  	 * vblank/irq handling. KMS drivers must ensure that vblanks are all
>  	 * disabled when uninstalling the irq handler.
>  	 */
> -	if (dev->num_crtcs) {
> +	if (drm_dev_has_vblank(dev)) {
>  		spin_lock_irqsave(&dev->vbl_lock, irqflags);
>  		for (i = 0; i < dev->num_crtcs; i++) {
>  			struct drm_vblank_crtc *vblank = &dev->vblank[i];
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index e278d6407f8e..162d9f7e692a 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -605,7 +605,7 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>  	int linedur_ns = 0, framedur_ns = 0;
>  	int dotclock = mode->crtc_clock;
>  
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return;
>  
>  	if (WARN_ON(pipe >= dev->num_crtcs))
> @@ -1065,7 +1065,7 @@ void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
>  	unsigned int pipe = drm_crtc_index(crtc);
>  	ktime_t now;
>  
> -	if (dev->num_crtcs > 0) {
> +	if (drm_dev_has_vblank(dev)) {
>  		seq = drm_vblank_count_and_time(dev, pipe, &now);
>  	} else {
>  		seq = 0;
> @@ -1137,7 +1137,7 @@ static int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
>  	unsigned long irqflags;
>  	int ret = 0;
>  
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EINVAL;
>  
>  	if (WARN_ON(pipe >= dev->num_crtcs))
> @@ -1506,7 +1506,7 @@ static void drm_legacy_vblank_pre_modeset(struct drm_device *dev,
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>  
>  	/* vblank is not initialized (IRQ not installed ?), or has been freed */
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return;
>  
>  	if (WARN_ON(pipe >= dev->num_crtcs))
> @@ -1533,7 +1533,7 @@ static void drm_legacy_vblank_post_modeset(struct drm_device *dev,
>  	unsigned long irqflags;
>  
>  	/* vblank is not initialized (IRQ not installed ?), or has been freed */
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return;
>  
>  	if (WARN_ON(pipe >= dev->num_crtcs))
> @@ -1558,7 +1558,7 @@ int drm_legacy_modeset_ctl_ioctl(struct drm_device *dev, void *data,
>  	unsigned int pipe;
>  
>  	/* If drm_vblank_init() hasn't been called yet, just no-op */
> -	if (!dev->num_crtcs)
> +	if (!drm_dev_has_vblank(dev))
>  		return 0;
>  
>  	/* KMS drivers handle this internally */
> @@ -1896,7 +1896,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
>  	unsigned long irqflags;
>  	bool disable_irq, fence_cookie;
>  
> -	if (WARN_ON_ONCE(!dev->num_crtcs))
> +	if (WARN_ON_ONCE(!drm_dev_has_vblank(dev)))
>  		return false;
>  
>  	if (WARN_ON(pipe >= dev->num_crtcs))
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
