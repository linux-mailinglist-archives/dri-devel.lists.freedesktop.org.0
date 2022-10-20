Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B422A605B29
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBC310E5F7;
	Thu, 20 Oct 2022 09:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB2F10E540
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=IqJ+PXWSgAwEtUKSxNWOIpPEVROLORYHEj928+nb8F0=; b=mA+cP
 1Th1gRoOUnc4A4HI5zcTh4Qmq14q9vYCyFAGndWmeeQF9c9tbs283dNbMo0vOcljn/PaCnsvgCavd
 Vb8bmLkUYczh77aCyJg6rCfkx8Q9wRveH3TF1HvI901VLgXuPlqw+AUF0TzoAegl9NXlDhSjckzJ4
 5ttxSjMy7IP0T5Yev8vyLDqli4wYJjnEx7SgOCAfC4mjZOjCKK5ArFSKM0+rSkl/TJs8ISnQTB2L9
 /vE6Wjr4vroB/s0cEnBGdBnPG/SH+C1XP071rXyKgfA9Kxedl0CvfVp0r4N8drQEwpPEeMTRqlZ+8
 uv0pOaaQ80h5yWNhw75uke7Yy7t+A==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1olRt2-0007uq-8e;
 Thu, 20 Oct 2022 10:30:49 +0100
Date: Thu, 20 Oct 2022 10:30:48 +0100
From: John Keeping <john@metanate.com>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1] drm: rockchip: remove rockchip_drm_framebuffer_init()
 function
Message-ID: <Y1EVSNa6bkh5JCLV@donbot>
References: <ebe91504-c5df-99e4-635f-832218584051@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebe91504-c5df-99e4-635f-832218584051@gmail.com>
X-Authenticated: YES
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 11:35:03PM +0200, Johan Jonker wrote:
> The function rockchip_drm_framebuffer_init() was in use
> in the rockchip_drm_fbdev.c file, but that is now replaced
> by a generic fbdev setup. Reduce the image size by
> removing the rockchip_drm_framebuffer_init() and sub function
> rockchip_fb_alloc() and cleanup the rockchip_drm_fb.h header file.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Reviewed-by: John Keeping <john@metanate.com>

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 43 ----------------------
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.h |  6 ---
>  2 files changed, 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index 092bf863110b..409eaa1bf092 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -25,35 +25,6 @@ static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
>  	.dirty	       = drm_atomic_helper_dirtyfb,
>  };
>  
> -static struct drm_framebuffer *
> -rockchip_fb_alloc(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cmd,
> -		  struct drm_gem_object **obj, unsigned int num_planes)
> -{
> -	struct drm_framebuffer *fb;
> -	int ret;
> -	int i;
> -
> -	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
> -	if (!fb)
> -		return ERR_PTR(-ENOMEM);
> -
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> -
> -	for (i = 0; i < num_planes; i++)
> -		fb->obj[i] = obj[i];
> -
> -	ret = drm_framebuffer_init(dev, fb, &rockchip_drm_fb_funcs);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev->dev,
> -			      "Failed to initialize framebuffer: %d\n",
> -			      ret);
> -		kfree(fb);
> -		return ERR_PTR(ret);
> -	}
> -
> -	return fb;
> -}
> -
>  static const struct drm_mode_config_helper_funcs rockchip_mode_config_helpers = {
>  	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>  };
> @@ -106,20 +77,6 @@ static const struct drm_mode_config_funcs rockchip_drm_mode_config_funcs = {
>  	.atomic_commit = drm_atomic_helper_commit,
>  };
>  
> -struct drm_framebuffer *
> -rockchip_drm_framebuffer_init(struct drm_device *dev,
> -			      const struct drm_mode_fb_cmd2 *mode_cmd,
> -			      struct drm_gem_object *obj)
> -{
> -	struct drm_framebuffer *fb;
> -
> -	fb = rockchip_fb_alloc(dev, mode_cmd, &obj, 1);
> -	if (IS_ERR(fb))
> -		return ERR_CAST(fb);
> -
> -	return fb;
> -}
> -
>  void rockchip_drm_mode_config_init(struct drm_device *dev)
>  {
>  	dev->mode_config.min_width = 0;
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.h b/drivers/gpu/drm/rockchip/rockchip_drm_fb.h
> index 1a696521096d..bae4e079dfb1 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.h
> @@ -7,11 +7,5 @@
>  #ifndef _ROCKCHIP_DRM_FB_H
>  #define _ROCKCHIP_DRM_FB_H
>  
> -struct drm_framebuffer *
> -rockchip_drm_framebuffer_init(struct drm_device *dev,
> -			      const struct drm_mode_fb_cmd2 *mode_cmd,
> -			      struct drm_gem_object *obj);
> -void rockchip_drm_framebuffer_fini(struct drm_framebuffer *fb);
> -
>  void rockchip_drm_mode_config_init(struct drm_device *dev);
>  #endif /* _ROCKCHIP_DRM_FB_H */
> -- 
> 2.20.1
> 
