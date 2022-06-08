Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EE554378E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B376A112896;
	Wed,  8 Jun 2022 15:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47CF112895
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 15:37:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id k16so28891874wrg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6XNNQkZKgPmssLAHf6MSlgF2aV4I+1BVjg1Utoy07+0=;
 b=HXs2FloXoibOAI7Toe0jNUVVkb3f+HdHUGKRmblAbS/t4Oaf4WUwTVDeyKMa0Hphv0
 h2+n/AMIuQ/ulg7nH5oF7XD8r/xbWblUvA5GIxHtucs6fYM84zejc6N3HSOHb7om20EH
 LpitoCSLxUUEto84nfA5BGBAKEaul0m8l/vAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6XNNQkZKgPmssLAHf6MSlgF2aV4I+1BVjg1Utoy07+0=;
 b=Iuby0lKf0XJpTwNvBUs5C1CKYe9iBiKkOI6vBGCqo2eO2VAziHKJqO+jBKrs0YBL1Y
 sOgxtHFf1izB4zTmqOcC4wQZt8RVGAKbo1K0tJrlB2f/IhewH9C3G6S2+WTn005w4AWl
 xy70VJROsUy8rnR8dAVryf7GAqQyFt1fsD4vwcE00kSe/C+9YpRu5uZZz0vTG4P+5Dcw
 qrwTtwjMcTFGT3tnuqVKj28MFezqoR/OPwvVbBZPGtAbKJmXbufy/LPAmTh/C6tZebrP
 1gx8lmkwmrC9U1ZsyQAEZP+bzHQwHAjH0r1EiE9d5PHKOaXYRF0L8BrNe5j1DSr8iz2+
 oZiw==
X-Gm-Message-State: AOAM530wULGfImF72ELrpxFdKR7CkHl8PgTg4/KpEZv6ug6UP5DSPzLQ
 cPWXCUX5aQYN/TyiQleZiLei2A==
X-Google-Smtp-Source: ABdhPJwu+sLbb5doHOWv5pv89T/OItjdaE9EfmW31UNw7lpDTQOiqnbgFHnjs28fNpl9FZnUib3UHw==
X-Received: by 2002:a5d:4a4c:0:b0:210:27dd:e57 with SMTP id
 v12-20020a5d4a4c000000b0021027dd0e57mr32933633wrs.655.1654702673146; 
 Wed, 08 Jun 2022 08:37:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c224700b0039c693a54ecsm24886wmm.23.2022.06.08.08.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 08:37:52 -0700 (PDT)
Date: Wed, 8 Jun 2022 17:37:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [RESEND PATCH v3] drm/cma-helper: Describe what a "contiguous
 chunk" actually means
Message-ID: <YqDCTrlPmDZQei8Q@phenom.ffwll.local>
Mail-Followup-To: Daniel Thompson <daniel.thompson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>
References: <20220608135821.1153346-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608135821.1153346-1-daniel.thompson@linaro.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 02:58:21PM +0100, Daniel Thompson wrote:
> Since it's inception in 2012 it has been understood that the DRM GEM CMA
> helpers do not depend on CMA as the backend allocator. In fact the first
> bug fix to ensure the cma-helpers work correctly with an IOMMU backend
> appeared in 2014. However currently the documentation for
> drm_gem_cma_create() talks about "a contiguous chunk of memory" without
> making clear which address space it will be a contiguous part of.
> Additionally the CMA introduction is actively misleading because it only
> contemplates the CMA backend.
> 
> This matters because when the device accesses the bus through an IOMMU
> (and don't use the CMA backend) then the allocated memory is contiguous
> only in the IOVA space. This is a significant difference compared to the
> CMA backend and the behaviour can be a surprise even to someone who does
> a reasonable level of code browsing (but doesn't find all the relevant
> function pointers ;-) ).
> 
> Improve the kernel doc comments accordingly.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> 
> Notes:
>     Am I Cc:ing the correct reviewers/maintainers with this patch? There
>     has been no negative feedback but I've been rebasing and re-posting it
>     for three kernel cycles now. Do I need to queue it somewhere special or
>     get it in front of someone specific?

Occasionally stuff falls through a few too many cracks, that's all. We
have tons of committers for drm-misc (and Lucas is one of them), but
sometimes they shy away from pushing themselves and others see the r-b and
assume it's already handled, and then it doesn't move :-/

Anyway I pushed it now, thanks for your patch.
-Daniel

>     
>     Either way...
>     
>     This RESEND is unaltered (except for collecting tags) and is rebased on
>     v5.19-rc1.
>     
>     RESEND for v5.18-rc3
>     - Unaltered but rebased on v5.18-rc3
>     
>     Changes in v3:
>     - Rebased on v5.17-rc2
>     - Minor improvements to wording.
>     
>     Changes in v2:
>     - Oops. I did a final proof read and accidentally committed these
>       changes as a seperate patch. This means that v1 contains only
>       one tenth of the actual patch. This is fixed in v2. Many apologies
>       for the noise!
> 
>  drivers/gpu/drm/drm_gem_cma_helper.c | 39 +++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index f36734c2c9e1..42abee9a0f4f 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -26,12 +26,22 @@
>  /**
>   * DOC: cma helpers
>   *
> - * The Contiguous Memory Allocator reserves a pool of memory at early boot
> - * that is used to service requests for large blocks of contiguous memory.
> + * The DRM GEM/CMA helpers are a means to provide buffer objects that are
> + * presented to the device as a contiguous chunk of memory. This is useful
> + * for devices that do not support scatter-gather DMA (either directly or
> + * by using an intimately attached IOMMU).
>   *
> - * The DRM GEM/CMA helpers use this allocator as a means to provide buffer
> - * objects that are physically contiguous in memory. This is useful for
> - * display drivers that are unable to map scattered buffers via an IOMMU.
> + * Despite the name, the DRM GEM/CMA helpers are not hardwired to use the
> + * Contiguous Memory Allocator (CMA).
> + *
> + * For devices that access the memory bus through an (external) IOMMU then
> + * the buffer objects are allocated using a traditional page-based
> + * allocator and may be scattered through physical memory. However they
> + * are contiguous in the IOVA space so appear contiguous to devices using
> + * them.
> + *
> + * For other devices then the helpers rely on CMA to provide buffer
> + * objects that are physically contiguous in memory.
>   *
>   * For GEM callback helpers in struct &drm_gem_object functions, see likewise
>   * named functions with an _object_ infix (e.g., drm_gem_cma_object_vmap() wraps
> @@ -111,8 +121,14 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
>   * @drm: DRM device
>   * @size: size of the object to allocate
>   *
> - * This function creates a CMA GEM object and allocates a contiguous chunk of
> - * memory as backing store.
> + * This function creates a CMA GEM object and allocates memory as backing store.
> + * The allocated memory will occupy a contiguous chunk of bus address space.
> + *
> + * For devices that are directly connected to the memory bus then the allocated
> + * memory will be physically contiguous. For devices that access through an
> + * IOMMU, then the allocated memory is not expected to be physically contiguous
> + * because having contiguous IOVAs is sufficient to meet a devices DMA
> + * requirements.
>   *
>   * Returns:
>   * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> @@ -162,9 +178,12 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_create);
>   * @size: size of the object to allocate
>   * @handle: return location for the GEM handle
>   *
> - * This function creates a CMA GEM object, allocating a physically contiguous
> - * chunk of memory as backing store. The GEM object is then added to the list
> - * of object associated with the given file and a handle to it is returned.
> + * This function creates a CMA GEM object, allocating a chunk of memory as
> + * backing store. The GEM object is then added to the list of object associated
> + * with the given file and a handle to it is returned.
> + *
> + * The allocated memory will occupy a contiguous chunk of bus address space.
> + * See drm_gem_cma_create() for more details.
>   *
>   * Returns:
>   * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> 
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
> --
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
