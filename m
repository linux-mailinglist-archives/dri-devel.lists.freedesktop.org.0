Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DBF2CDA13
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 16:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2656EB7C;
	Thu,  3 Dec 2020 15:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC7B6EB90
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 15:26:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k10so3087328wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 07:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wM/I8RV7zXyM3w+Dkw/l/K1Ahb7hTXXO2nGI9ZI6qDI=;
 b=UTxbnPO8yma/9M2WO0Ofzv0cR6DIY4+0GTAN+ucvqunjLN2tIoBApn6YL0vlpL2vx3
 wNJULpqjmW9u5dXOxcQN/mMXGY/h24T0tM2bi/fRsx6ZzbZMqcYJ8h1UIbtn4MjaqjbY
 eMBn9MwbFh2VpWGtXBjtfZKKFLeQc5V4XInS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wM/I8RV7zXyM3w+Dkw/l/K1Ahb7hTXXO2nGI9ZI6qDI=;
 b=Pia6enMvt/DCcyEwTXORzj2eRzDd7cxLPRT7zw0/QBoOe+bGziejTFz27anwRa/AeW
 kuzNqF2rvAMArDMbBDaBxXtcAKDNkS8A+cHvYUvEyT7uxkQc2iR9wgueLeuBf1rrIJ1j
 874sk7RCuPsNmXH2IqljQbJvY4CWC7UpP4yniERQRx1DQ1uxbuWmGOOFb/PklB73yKyM
 bUShMxfAVq3Kuw6hiZAnWW14FUjFNJXKA+r+E+zgiCNZsNbV6BK95k9q4uDo4G6anP13
 RpGPYH8f8pKd7Qo3HPQw4pj6uVBHej3hi5vLo6ZXi7Nm3JLE+BNOZ/wIJAnm7i7CoK2r
 TzJA==
X-Gm-Message-State: AOAM531fcGYhNLwjsvcjDnulrEDHmyFitTwOnVVWHrZ7tAgtoIwOWdm3
 OsuIbP7gTkeKGSWKQHHh/3BJdQ==
X-Google-Smtp-Source: ABdhPJwVV7mzdVhmNF2JM9gT7DntsOQF8ddieFxeGRPluwW9caDktD7s/Al9byRdu81G0haQqwBfQw==
X-Received: by 2002:a1c:9901:: with SMTP id b1mr3947710wme.18.1607009164432;
 Thu, 03 Dec 2020 07:26:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f199sm1915466wme.15.2020.12.03.07.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 07:26:03 -0800 (PST)
Date: Thu, 3 Dec 2020 16:26:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/7] dma-buf: Write down some rules for vmap usage
Message-ID: <20201203152601.GB401619@phenom.ffwll.local>
References: <20201203140259.26580-1-tzimmermann@suse.de>
 <20201203140259.26580-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203140259.26580-8-tzimmermann@suse.de>
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
Cc: linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 03, 2020 at 03:02:59PM +0100, Thomas Zimmermann wrote:
> Dma-buf's vmap and vunmap callbacks are undocumented and various
> exporters currently have slightly different semantics for them. Add
> documentation on how to implement and use these interfaces correctly.
> =

> v2:
> 	* document vmap semantics in struct dma_buf_ops
> 	* add TODO item for reviewing and maybe fixing dma-buf exporters
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I still don't think this works, we're breaking dma_buf_vmap for everyone
else here.

> ---
>  Documentation/gpu/todo.rst | 15 +++++++++++++
>  include/drm/drm_gem.h      |  4 ++++
>  include/linux/dma-buf.h    | 45 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 64 insertions(+)
> =

> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 009d8e6c7e3c..32bb797a84fc 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -505,6 +505,21 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Ch=
ristian K=F6nig, Daniel Vette
>  Level: Intermediate
>  =

>  =

> +Enforce rules for dma-buf vmap and pin ops
> +------------------------------------------
> +
> +Exporter implementations of vmap and pin in struct dma_buf_ops (and cons=
equently
> +struct drm_gem_object_funcs) use a variety of locking semantics. Some re=
ly on
> +the caller holding the dma-buf's reservation lock, some do their own loc=
king,
> +some don't require any locking. VRAM helpers even used to pin as part of=
 vmap.
> +
> +We need to review each exporter and enforce the documented rules.
> +
> +Contact: Christian K=F6nig, Daniel Vetter, Thomas Zimmermann <tzimmerman=
n@suse.de>
> +
> +Level: Advanced
> +
> +
>  Core refactorings
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  =

> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 5e6daa1c982f..1864c6a721b1 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -138,6 +138,8 @@ struct drm_gem_object_funcs {
>  	 * drm_gem_dmabuf_vmap() helper.
>  	 *
>  	 * This callback is optional.
> +	 *
> +	 * See also struct dma_buf_ops.vmap
>  	 */
>  	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>  =

> @@ -148,6 +150,8 @@ struct drm_gem_object_funcs {
>  	 * drm_gem_dmabuf_vunmap() helper.
>  	 *
>  	 * This callback is optional.
> +	 *
> +	 * See also struct dma_buf_ops.vunmap
>  	 */
>  	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>  =

> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index cf72699cb2bc..dc81fdc01dda 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -267,7 +267,52 @@ struct dma_buf_ops {
>  	 */
>  	int (*mmap)(struct dma_buf *, struct vm_area_struct *vma);
>  =

> +	/**
> +	 * @vmap:

There's already a @vmap and @vunamp kerneldoc at the top comment, that
needs to be removed.
-Daniel

> +	 *
> +	 * Returns a virtual address for the buffer.
> +	 *
> +	 * Notes to callers:
> +	 *
> +	 * - Callers must hold the struct dma_buf.resv lock before calling
> +	 *   this interface.
> +	 *
> +	 * - Callers must provide means to prevent the mappings from going
> +	 *   stale, such as holding the reservation lock or providing a
> +	 *   move-notify callback to the exporter.
> +	 *
> +	 * Notes to implementors:
> +	 *
> +	 * - Implementations must expect pairs of @vmap and @vunmap to be
> +	 *   called frequently and should optimize for this case.
> +	 *
> +	 * - Implementations should avoid additional operations, such as
> +	 *   pinning.
> +	 *
> +	 * - Implementations may expect the caller to hold the dma-buf's
> +	 *   reservation lock to protect against concurrent calls and
> +	 *   relocation.
> +	 *
> +	 * - Implementations may provide additional guarantees, such as working
> +	 *   without holding the reservation lock.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * Returns:
> +	 *
> +	 * 0 on success or a negative error code on failure.
> +	 */
>  	int (*vmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
> +
> +	/**
> +	 * @vunmap:
> +	 *
> +	 * Releases the address previously returned by @vmap.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * See also @vmap()
> +	 */
>  	void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>  };
>  =

> -- =

> 2.29.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
