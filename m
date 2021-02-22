Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2987F321D2A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 17:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F646E12A;
	Mon, 22 Feb 2021 16:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F226E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 16:38:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t15so19698105wrx.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 08:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zTsftwC8e5HexQG3eAXArL8+qeYtunQQ85gGMBV0pv4=;
 b=EW+seZw1TZ/rUf3GQVyWlXXys1VanDYP4T63Miu4YinF9Xo7uKUrWERCtKraN3Fz2N
 G+Y2JkAxkF240L/rbFKfcqAD649WeFpfvU2sIWieU95zzGZcuYpKaEgvYgtvfxzsHcsX
 bYOi12/w0yo2gc+XpKI5Rbg2eAhj2by2IcNN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zTsftwC8e5HexQG3eAXArL8+qeYtunQQ85gGMBV0pv4=;
 b=A7/T2j9PpQ5+6D9cp6t8RBFu9CO7MZ0mPmH4176e/bjtLUhhapntvWjf2cLw7u6I35
 3ADvp2Uul61fYZdfa343rGOZnpUcv1Zt72I9mGYK4gLBICVqegCSWoeBFf3XrNZO7n3X
 UPSM3MHndFfoBxHMM23OFuTrsB064Um2S30q6lDyXH/Zs+Y8EOqyONNsCOIjLwvViilW
 /7Ml/bqTeR9wsCxhL6GbrUWOVwOT7qXv7f29lpyOYUKhGkUvm6Z1Kfx50dD8fm1ZyhS4
 PNCfMf5/K9MS2VqPzWPSLm4Vp5Gi2f+j7gKVYHETgVR07tz3ngLrptOt0idp5wsjiQBf
 bwuw==
X-Gm-Message-State: AOAM533LrB9F4FWeq7sbXpxyR47WHWLtASuwpc40ZQNBToQaiPUavfqK
 533uBHQbwoDvzcWYJUqBF0dfng==
X-Google-Smtp-Source: ABdhPJy8keU6WSgUaFUq6jiI2xGjVLPjqoHL0P33CHa3948got7CcfSaVHG2Q8qr/ebVTw/1ars7YA==
X-Received: by 2002:a5d:4848:: with SMTP id n8mr5665272wrs.241.1614011932611; 
 Mon, 22 Feb 2021 08:38:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z21sm20946231wma.29.2021.02.22.08.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 08:38:52 -0800 (PST)
Date: Mon, 22 Feb 2021 17:38:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [RFC PATCH 1/3] drm/vkms: decouple cursor plane setup from
 crtc_init
Message-ID: <YDPeGjnrQKRdfRpZ@phenom.ffwll.local>
References: <20210220143850.k22n4r4uel5zhxr2@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210220143850.k22n4r4uel5zhxr2@smtp.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 20, 2021 at 11:38:50AM -0300, Melissa Wen wrote:
> Initialize CRTC only with primary plane (without cursor) as a preparation
> to init overlay plane before cursor plane and keep cursor on the top.
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>

Why can't we first initialize all the planes (primary, cursor, overlay)
and then the crtc?

For drivers where there's not really a functional difference between these
planes (like vkms, since it's all sw, only difference is z position
really) the usual approach is to initialize all planes in a loop. And then
call crtc init with the first and last plane for that crtc.

Passing NULL for the cursor for crtc_init and then patching it up
afterwards is a bit a hack, so would be good to avoid that.
-Daniel

> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c   |  4 ++--
>  drivers/gpu/drm/vkms/vkms_drv.h    |  2 +-
>  drivers/gpu/drm/vkms/vkms_output.c | 14 +++++++++-----
>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 0443b7deeaef..2d4cd7736933 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -270,12 +270,12 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
>  };
>  
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor)
> +		   struct drm_plane *primary)
>  {
>  	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
>  	int ret;
>  
> -	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> +	ret = drm_crtc_init_with_planes(dev, crtc, primary, NULL,
>  					&vkms_crtc_funcs, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init CRTC\n");
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 35540c7c4416..9ad5ad8b7737 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -110,7 +110,7 @@ struct vkms_device {
>  
>  /* CRTC */
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor);
> +		   struct drm_plane *primary);
>  
>  int vkms_output_init(struct vkms_device *vkmsdev, int index);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index f5f6f15c362c..05d3bb45e6c1 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -47,6 +47,10 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> +	ret = vkms_crtc_init(dev, crtc, primary);
> +	if (ret)
> +		goto err_crtc;
> +
>  	if (vkmsdev->config->cursor) {
>  		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
>  		if (IS_ERR(cursor)) {
> @@ -55,9 +59,9 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		}
>  	}
>  
> -	ret = vkms_crtc_init(dev, crtc, primary, cursor);
> -	if (ret)
> -		goto err_crtc;
> +	crtc->cursor = cursor;
> +	if (cursor && !cursor->possible_crtcs)
> +		cursor->possible_crtcs = drm_crtc_mask(crtc);
>  
>  	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
>  				 DRM_MODE_CONNECTOR_VIRTUAL);
> @@ -100,11 +104,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  err_connector:
>  	drm_crtc_cleanup(crtc);
>  
> -err_crtc:
> +err_cursor:
>  	if (vkmsdev->config->cursor)
>  		drm_plane_cleanup(cursor);
>  
> -err_cursor:
> +err_crtc:
>  	drm_plane_cleanup(primary);
>  
>  	return ret;
> -- 
> 2.30.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
