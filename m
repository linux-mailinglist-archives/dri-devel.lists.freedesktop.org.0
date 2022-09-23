Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 447C95E766E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BA510E7C5;
	Fri, 23 Sep 2022 09:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AC410E7A5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663923955; x=1695459955;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+RS8gtw78MU2eUZxM6E3oPsf/znOD0PyzrjZ9NyLwOw=;
 b=L1jSVc3jjfpvh0csZ/HuiCC9ZPx5Dy1vBgszVR4EWN8ys3qeYxn1BJXW
 q7RliOsX2vW+ArtqCNSB7vyMrYnvtElB3FryDMn6Ym+N8dPO+9DpAim5X
 U3YReR3Pg+yi/b8gnPEcHYtZ0HgMG3Sb1NCLAauwQwWvAkB4YPoT0QAFd
 JOtnc+sWWFBpSgNk3GsmODsmTvbIN6CBXSomZHIUE077RJE4HcDzhIEKO
 vS8Lr4/uNCQIlkfgcLVVdubv4XOIMjoDJJ3D39vMJMRqZl0QFuD3DHRaK
 wRt1uyfrBC0jqJLjWyqHBtolHhymQD73gU3D9grPWQBIHjVlp8AQFA661 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280274369"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280274369"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 02:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="622455883"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 23 Sep 2022 02:05:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Sep 2022 12:05:51 +0300
Date: Fri, 23 Sep 2022 12:05:51 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/ssd130x: Use drm_atomic_get_new_plane_state()
Message-ID: <Yy1271xW1SOlL41e@intel.com>
References: <20220923083447.1679780-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220923083447.1679780-1-javierm@redhat.com>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 10:34:47AM +0200, Javier Martinez Canillas wrote:
> The struct drm_plane .state shouldn't be accessed directly but instead the
> drm_atomic_get_new_plane_state() helper function should be used.
> 
> This is based on a similar patch from Thomas Zimmermann for the simpledrm
> driver. No functional changes.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

I wonder how many naked obj->state dereferences are still
left in places where they should be using the get_{new,old}()
stuff. Might have to write a bit of cocci to find out...


Btw on a somewhat related note, I've been thinking about bringing
for_each_crtc_in_state() & co. back (got removed in commit
77ac3b00b131 ("drm/atomic: Remove deprecated accessor macros"))
but this time without any object state iterator variable. Now that
we're more often just plumbing the full atomic state through I
think there are bunch of places that don't need the object state(s)
within the loop at all, so having to have those variables around
makes the whole thing a bit noisy. Also IIRC we had to add some
(void) casts into the current macros to hide some compiler warnings
about unused variables. Could get rid of at least some of those extra
casts again.

I don't suppose there's anyone interested in doing that so I don't
have to? ;)

>---
> 
>  drivers/gpu/drm/solomon/ssd130x.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 7fae9480aa11..a537692100d1 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -566,10 +566,10 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
>  }
>  
>  static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
> -						       struct drm_atomic_state *old_state)
> +						       struct drm_atomic_state *state)
>  {
> -	struct drm_plane_state *plane_state = plane->state;
> -	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
> +	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>  	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>  	struct drm_device *drm = plane->dev;
>  	struct drm_rect src_clip, dst_clip;
> @@ -591,7 +591,7 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
>  }
>  
>  static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
> -							struct drm_atomic_state *old_state)
> +							struct drm_atomic_state *state)
>  {
>  	struct drm_device *drm = plane->dev;
>  	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
> -- 
> 2.37.3

-- 
Ville Syrjälä
Intel
