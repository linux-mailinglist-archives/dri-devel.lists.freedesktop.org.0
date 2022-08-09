Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5158DC49
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 18:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C9299FCD;
	Tue,  9 Aug 2022 16:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA489089C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 16:38:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id v3so15008751wrp.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 09:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc;
 bh=egGjE4gcTI4ZNAZGDpX66ocjeXYssjsRdLj9YeQUY3E=;
 b=B2QyLmc8VlDweK2PI4k9RXc/p5vtr8UlqQgLseFuaJs384B8mnwGUPEznaOre+W8KU
 dCb2kUkiV9frQpsm2MK2hXcQd952unPYPqAxmcWOXJ7yNHPAE/spL/7omuzRabpV8JQa
 bFQK6DEtn7QbT/8vhHtXB4DtObuPnn38JsTgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=egGjE4gcTI4ZNAZGDpX66ocjeXYssjsRdLj9YeQUY3E=;
 b=4HK5DvEmDoMtiGw5VBepL1FiCEbwJms95bKgFzJ/+YZAhkfXT+6J0HCot0+uktXjrZ
 BRwD5aChDj3e6Kce43z7CeMZzf8XX0axjv+Jg4NctAnI94wiHMyxson3D8LdXiMCAgTi
 Iw4Y9kb2LH61k5nRtU9a1U7QrgdnbUko+ngQeSNAEkWrYVwq2cRLG0RPFsxTsyROQfX0
 XvkyHEXQL/IkOeWZy7G6NZ9mkDetzfLoDBF+flHu0E/MtHaQqlrQ6ScN2Ytdxe1Pc4M4
 VUfoOUuzSdJmMfBJpMVhewmunrGTdlHXo7Dz/P8oEBa0j84gXvjR1PsNvERRXB1JTJJ/
 A63A==
X-Gm-Message-State: ACgBeo2d0FcNP1pgSgDxdRpCkIYGqJ2xDnvc9Co8SUU7gsZBaF9149d9
 Y/cpleWyc+ANm5vgBzl1WZLOUA==
X-Google-Smtp-Source: AA6agR4ZFwXQZW5QC9CXMnKGH0wNYij8ek8dXvdT/548E2OvefRpOTikGrUr+rxEJ1dXgSkB0dxUFw==
X-Received: by 2002:a5d:5984:0:b0:220:5cb7:f772 with SMTP id
 n4-20020a5d5984000000b002205cb7f772mr14591665wri.3.1660063099331; 
 Tue, 09 Aug 2022 09:38:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c384800b003a503a64e5esm20550022wmr.15.2022.08.09.09.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:38:18 -0700 (PDT)
Date: Tue, 9 Aug 2022 18:38:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v7 1/2] drm/shmem-helper: Add missing vunmap on error
Message-ID: <YvKNeMJjOjy8B+YH@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
References: <20220630200058.1883506-1-dmitry.osipenko@collabora.com>
 <20220630200058.1883506-2-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630200058.1883506-2-dmitry.osipenko@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 11:00:57PM +0300, Dmitry Osipenko wrote:
> The vmapping of dma-buf may succeed, but DRM SHMEM rejects the IOMEM
> mapping, and thus, drm_gem_shmem_vmap_locked() should unvmap the IOMEM
> before erroring out.
> 
> Cc: stable@vger.kernel.org
> Fixes: 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and convert GEM backends")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Pushed to drm-misc-next-fixes, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 8ad0e02991ca..904fc893c905 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -302,6 +302,7 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
>  		if (!ret) {
>  			if (WARN_ON(map->is_iomem)) {
> +				dma_buf_vunmap(obj->import_attach->dmabuf, map);
>  				ret = -EIO;
>  				goto err_put_pages;
>  			}
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
