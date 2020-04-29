Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABACF1BE631
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 20:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C705C6EACC;
	Wed, 29 Apr 2020 18:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD16A6EACC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 18:23:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C61D280503;
 Wed, 29 Apr 2020 20:23:19 +0200 (CEST)
Date: Wed, 29 Apr 2020 20:23:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/17] drm/mgag200: Clean up mga_crtc_do_set_base()
Message-ID: <20200429182318.GF31071@ravnborg.org>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-7-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=IaetqKenMiM3g_OWcZsA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 04:32:27PM +0200, Thomas Zimmermann wrote:
> The function now only takes the device structure, and the old and new
> framebuffers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index b16a73c8617d6..12df809d64f7c 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -861,21 +861,20 @@ static void mgag200_set_startadd(struct mga_device *mdev,
>  	WREG_ECRT(0x00, crtcext0);
>  }
>  
> -static int mga_crtc_do_set_base(struct drm_crtc *crtc,
> -				struct drm_framebuffer *fb,
> -				int x, int y, int atomic)
> +static int mga_crtc_do_set_base(struct mga_device *mdev,
> +				const struct drm_framebuffer *fb,
> +				const struct drm_framebuffer *old_fb)
>  {
> -	struct mga_device *mdev = crtc->dev->dev_private;
>  	struct drm_gem_vram_object *gbo;
>  	int ret;
>  	s64 gpu_addr;
>  
> -	if (!atomic && fb) {
> -		gbo = drm_gem_vram_of_gem(fb->obj[0]);
> +	if (old_fb) {
> +		gbo = drm_gem_vram_of_gem(old_fb->obj[0]);
>  		drm_gem_vram_unpin(gbo);
>  	}
>  
> -	gbo = drm_gem_vram_of_gem(crtc->primary->fb->obj[0]);
> +	gbo = drm_gem_vram_of_gem(fb->obj[0]);
>  
>  	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
>  	if (ret)
> @@ -900,6 +899,7 @@ static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
>  {
>  	struct drm_device *dev = crtc->dev;
>  	struct mga_device *mdev = dev->dev_private;
> +	struct drm_framebuffer *fb = crtc->primary->fb;
>  	unsigned int count;
>  
>  	while (RREG8(0x1fda) & 0x08) { }
> @@ -908,7 +908,7 @@ static int mga_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
>  	count = RREG8(MGAREG_VCOUNT) + 2;
>  	while (RREG8(MGAREG_VCOUNT) < count) { }
>  
> -	return mga_crtc_do_set_base(crtc, old_fb, x, y, 0);
> +	return mga_crtc_do_set_base(mdev, fb, old_fb);
>  }
>  
>  static int mga_crtc_mode_set(struct drm_crtc *crtc,
> @@ -1150,7 +1150,7 @@ static int mga_crtc_mode_set(struct drm_crtc *crtc,
>  
>  	WREG8(MGA_MISC_OUT, misc);
>  
> -	mga_crtc_do_set_base(crtc, old_fb, x, y, 0);
> +	mga_crtc_do_set_base(mdev, fb, old_fb);
>  
>  	/* reset tagfifo */
>  	if (mdev->type == G200_ER) {
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
