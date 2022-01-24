Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 308D9498431
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE5E10E378;
	Mon, 24 Jan 2022 16:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE18110E378
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:03:53 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id me13so22758635ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=hHD1I6HBwWXdmu99NOtKXptCdvMp508sRo/7M3HfYGs=;
 b=Z+EuI9Pi5ZDJTsvU0GJbe6u9iQbz09QiMO9lztGoX794vCmEhRU6hlhU9YSGbtQE5j
 NSUsu2eCWgf+isH6LuoPiSSQlDOGV9ZfIbVVkpO+elQEUlHtqHS1E0OFBq7QUfQ0Nz6s
 Qy0ENSro1a5UtnAQAsHkl/PgskYfs0fK29Dis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=hHD1I6HBwWXdmu99NOtKXptCdvMp508sRo/7M3HfYGs=;
 b=LLS3O2EIXRuF3v9AXB4M39CBjeD0DXteMvHRXtesIUREZDbQpXUl7qOe42090araDQ
 WnyDCqy5NHCZh8dEmv79UxMZ5x8jmZb+79wgiZzmmmRmuIYsWv2n9itfg4KpAU50INCl
 xDuZNEsjp7tXjBChdHG/aBh/43jAcTrKZf9FKVxWwZlaODiHVvuS8bhGQPnVNv83cPai
 MEc3D3XxQCKRCipcWYTEpoIJu3+nlZGdLY55O6fkkm8sW6C1/ke929SD1pIKyIsIDycw
 4+0m6ln/wcnClYTKbL1TxQu1c6mKWOYsqLFjhPJy3GugyHfp1wXIpcjTG5zebHCgViH/
 h2og==
X-Gm-Message-State: AOAM533P7gjo/IIIdNk/HB5VsDv3V20rh8LVoxquhpQnXO3Phhgutei7
 S8eqFzun5k5wC8meUspkqPp78w==
X-Google-Smtp-Source: ABdhPJxdVfkKMEYbXujqgWUpyR3+7qh2oP6uKoyQ37sTd705e0vRoEIcpmauPwpBhopTpK2j9FowlQ==
X-Received: by 2002:a17:906:3089:: with SMTP id
 9mr12877415ejv.97.1643040232290; 
 Mon, 24 Jan 2022 08:03:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p21sm5051250ejj.156.2022.01.24.08.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:03:51 -0800 (PST)
Date: Mon, 24 Jan 2022 17:03:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: ira.weiny@intel.com
Subject: Re: [PATCH V2 3/7] drm/gma: Remove calls to kmap()
Message-ID: <Ye7N5ZrmVjOBo1RG@phenom.ffwll.local>
Mail-Followup-To: ira.weiny@intel.com, David Airlie <airlied@linux.ie>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20220124015409.807587-1-ira.weiny@intel.com>
 <20220124015409.807587-4-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124015409.807587-4-ira.weiny@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 23, 2022 at 05:54:05PM -0800, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> kmap() is being deprecated and these instances are easy to convert to
> kmap_local_page().
> 
> Furthermore, in gma_crtc_cursor_set() use the memcpy_from_page() helper
> instead of an open coded use of kmap_local_page().
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Applied to drm-misc-next, the others should all have full time maintainers
to make sure the patches land. Pls holler if not.

Thanks, Daniel

> ---
>  drivers/gpu/drm/gma500/gma_display.c | 6 ++----
>  drivers/gpu/drm/gma500/mmu.c         | 8 ++++----
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
> index 99da3118131a..60ba7de59139 100644
> --- a/drivers/gpu/drm/gma500/gma_display.c
> +++ b/drivers/gpu/drm/gma500/gma_display.c
> @@ -335,7 +335,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>  	struct psb_gem_object *pobj;
>  	struct psb_gem_object *cursor_pobj = gma_crtc->cursor_pobj;
>  	struct drm_gem_object *obj;
> -	void *tmp_dst, *tmp_src;
> +	void *tmp_dst;
>  	int ret = 0, i, cursor_pages;
>  
>  	/* If we didn't get a handle then turn the cursor off */
> @@ -400,9 +400,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
>  		/* Copy the cursor to cursor mem */
>  		tmp_dst = dev_priv->vram_addr + cursor_pobj->offset;
>  		for (i = 0; i < cursor_pages; i++) {
> -			tmp_src = kmap(pobj->pages[i]);
> -			memcpy(tmp_dst, tmp_src, PAGE_SIZE);
> -			kunmap(pobj->pages[i]);
> +			memcpy_from_page(tmp_dst, pobj->pages[i], 0, PAGE_SIZE);
>  			tmp_dst += PAGE_SIZE;
>  		}
>  
> diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
> index fe9ace2a7967..a70b01ccdf70 100644
> --- a/drivers/gpu/drm/gma500/mmu.c
> +++ b/drivers/gpu/drm/gma500/mmu.c
> @@ -184,17 +184,17 @@ struct psb_mmu_pd *psb_mmu_alloc_pd(struct psb_mmu_driver *driver,
>  		pd->invalid_pte = 0;
>  	}
>  
> -	v = kmap(pd->dummy_pt);
> +	v = kmap_local_page(pd->dummy_pt);
>  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] = pd->invalid_pte;
>  
> -	kunmap(pd->dummy_pt);
> +	kunmap_local(v);
>  
> -	v = kmap(pd->p);
> +	v = kmap_local_page(pd->p);
>  	for (i = 0; i < (PAGE_SIZE / sizeof(uint32_t)); ++i)
>  		v[i] = pd->invalid_pde;
>  
> -	kunmap(pd->p);
> +	kunmap_local(v);
>  
>  	clear_page(kmap(pd->dummy_page));
>  	kunmap(pd->dummy_page);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
