Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC3888132A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 15:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D2F10FA44;
	Wed, 20 Mar 2024 14:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aMofYQzO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504C810FA44
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 14:16:14 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-566e869f631so7701878a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 07:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710944172; x=1711548972; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ql0D62DG5O34DyZZnBopXCOQlRPDaNTvfI9HqIG83UA=;
 b=aMofYQzOUX0r6PropKJtmoSDgpU8WgiHbJxfvHGDUe1V5j9ZJCtFlC7QsE2VtZCnRz
 ppKPQuDWDKn+O/xaEG8bWtrDVGVwDNXL6K/Rv0/QZKYN6AngBE0moGaCKMryodFCwzv8
 pmt7Vkt6pJ5Qeqkz7emHZJYinOgiGgHN911HBAlMdsSLUko41HNOCf6TW4Wq0xI75o6T
 FHolGpJGRInEMxZI3wAiRARK1Zw2jB8qMB7pS8OKlsq2W95vk+NgT+oNiojls30Y9hBI
 Lkry7YiFh9Q467IzQh++519kWC+5+KTsteRhT5IuB8mMBFUV3Vwp/qnhDMaESxJhWU0X
 r8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710944172; x=1711548972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ql0D62DG5O34DyZZnBopXCOQlRPDaNTvfI9HqIG83UA=;
 b=Y+wPPMwAiIiDP24dz4S2m7KtZYGCg633rCt+LOKr+yuke3F99EHLF4GPGyQC6+GZvQ
 eX7kAL+4iM/OFP1qrSMDvROwhjgrbQRSQrsl/nUeiGtjFlBwCp3i3O4s3PIvcMZVS8aE
 dTyk6qw7DM0hFBl6trW6EiYJwzQ1c5KITCZi/jXTn60c4vBsclGYdxq7g9Aci0kyqv0d
 oMDD2kgW16HTqUsG3EnTF6IcB6Sj7LjSC1hfPDcvVMvU8Ogk2wUbntRYtcQwaOfcBAtJ
 dbKbDoJB+wo+eyKLccG9rVHXWl9UcG/60bomG8WIBus23Ytd5p7jIC/JxdyPi9q9cfHM
 Od4Q==
X-Gm-Message-State: AOJu0YxGYIPKDOSVmZQ1zTG2/HQ3WzTrmsAFOnBlH6YJfVUiHpU49PYW
 qNk9DW0lY+A8f4tSjEKZHfHBd8X9A2iN5iGg2/m0+V3hPhC987rE+6RfRGuDPC+Svh0bAKpw8OT
 5jvhTmXiS2olYai7pobMH24vR92Ee+EAq
X-Google-Smtp-Source: AGHT+IF5FW/OvSvlBm558DSHFH96fSWM9ZF7ZGl+kg/D3DGCbqwkazw6TQm1nv7C39VG98UvW0nxTd3Km3aRw34splY=
X-Received: by 2002:a05:6402:f0c:b0:56b:a017:e9 with SMTP id
 i12-20020a0564020f0c00b0056ba01700e9mr3187397eda.41.1710944172321; Wed, 20
 Mar 2024 07:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230302143502.500661-1-contact@emersion.fr>
In-Reply-To: <20230302143502.500661-1-contact@emersion.fr>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 20 Mar 2024 07:16:00 -0700
Message-ID: <CAF6AEGuQEq8kcKnHzr0zhb7UnNfeHy2ARhK7ZXc+4_oYbxPDkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/prime: reject DMA-BUF attach when get_sg_table
 is missing
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <maxime@cerno.tech>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dominik Behr <dbehr@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 2, 2023 at 6:35=E2=80=AFAM Simon Ser <contact@emersion.fr> wrot=
e:
>
> drm_gem_map_dma_buf() requires drm_gem_object_funcs.get_sg_table
> to be implemented, or else WARNs.
>
> Allow drivers to leave this hook unimplemented to implement purely
> local DMA-BUFs (ie, DMA-BUFs which cannot be imported anywhere
> else but the device which allocated them). In that case, reject
> imports to other devices in drm_gem_map_attach().
>
> v2: new patch
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index f924b8b4ab6b..ab1d21d63a03 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -544,7 +544,8 @@ int drm_prime_handle_to_fd_ioctl(struct drm_device *d=
ev, void *data,
>   * Optional pinning of buffers is handled at dma-buf attach and detach t=
ime in
>   * drm_gem_map_attach() and drm_gem_map_detach(). Backing storage itself=
 is
>   * handled by drm_gem_map_dma_buf() and drm_gem_unmap_dma_buf(), which r=
elies on
> - * &drm_gem_object_funcs.get_sg_table.
> + * &drm_gem_object_funcs.get_sg_table. If &drm_gem_object_funcs.get_sg_t=
able is
> + * unimplemented, exports into another device are rejected.
>   *
>   * For kernel-internal access there's drm_gem_dmabuf_vmap() and
>   * drm_gem_dmabuf_vunmap(). Userspace mmap support is provided by
> @@ -583,6 +584,9 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
>  {
>         struct drm_gem_object *obj =3D dma_buf->priv;
>
> +       if (!obj->funcs->get_sg_table)
> +               return -EOPNOTSUPP;

This breaks virtgpu, where buffers may not necessarily have guest
backing pages, but still may be shared with other virtual devices
(because the host side buffer _does_ have backing pages)

BR,
-R

> +
>         return drm_gem_pin(obj);
>  }
>  EXPORT_SYMBOL(drm_gem_map_attach);
> --
> 2.39.2
>
>
