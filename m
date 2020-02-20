Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446C165CB2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 12:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F14A6ED34;
	Thu, 20 Feb 2020 11:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3810F6ED34
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 11:24:11 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BAEC8294D99;
 Thu, 20 Feb 2020 11:24:09 +0000 (GMT)
Date: Thu, 20 Feb 2020 12:24:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 33/34] drm/rockchip: Use helper for common task
Message-ID: <20200220122406.383f4ea8@collabora.com>
In-Reply-To: <20191217145020.14645-34-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-34-andrzej.p@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: kernel@collabora.com, Mihail Atanassov <mihail.atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019 15:50:19 +0100
Andrzej Pietrasiewicz <andrzej.p@collabora.com> wrote:

> Use generic helper code.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> index 221e72e71432..5806f908aa53 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
> @@ -18,6 +18,7 @@
>  #include "rockchip_drm_fb.h"
>  #include "rockchip_drm_gem.h"
>  
> +

You can drop this blank line. Looks good otherwise, but I'll wait for v6
(with the new ->check_size() maybe) before giving my R-b.

>  static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
>  	.destroy       = drm_gem_fb_destroy,
>  	.create_handle = drm_gem_fb_create_handle,
> @@ -30,22 +31,13 @@ rockchip_fb_alloc(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cm
>  {
>  	struct drm_framebuffer *fb;
>  	int ret;
> -	int i;
>  
>  	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
>  	if (!fb)
>  		return ERR_PTR(-ENOMEM);
>  
> -	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
> -
> -	for (i = 0; i < num_planes; i++)
> -		fb->obj[i] = obj[i];
> -
> -	ret = drm_framebuffer_init(dev, fb, &rockchip_drm_fb_funcs);
> +	ret = drm_gem_fb_init_with_funcs(fb, dev, mode_cmd, obj, num_planes, &rockchip_drm_fb_funcs);
>  	if (ret) {
> -		DRM_DEV_ERROR(dev->dev,
> -			      "Failed to initialize framebuffer: %d\n",
> -			      ret);
>  		kfree(fb);
>  		return ERR_PTR(ret);
>  	}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
