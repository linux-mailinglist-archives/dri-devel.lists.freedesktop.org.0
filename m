Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63995B01E7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 12:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4D410E51E;
	Wed,  7 Sep 2022 10:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFB110E51E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 10:26:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f11so7696662lfa.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 03:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=zTb/MlfMguy2CKsoM1pwqvbZXL8b4EUzv5QG+eNBHcU=;
 b=SSsC2N6PQeDZz8Wt/QREKuTiav+DBC5OWMdKuGiGLK6GQeC04dkle5l630X3ESLHEl
 Bi+sG2JnGg3vnLF0xqCHOWmO08NeY1ryeto1oAVN20XJTG59uxJUvO4mxXzTIuJnPnfo
 9MYI913L+ySU3Z3L0i9b7gbqBs8LxSQV5xK7QDPah0e+ea3noCaRcfVi2qiL5v/3gId6
 RF+WZjC+VeIIAKN+d3j6SuGYNb6h1TJVA9C2K3t3REElmnWWnlKGWfN1ehsdrndKcKVd
 EMWLqM4JKlcDneNRFidbSTbWQS65HMe+8C4VlSSsbknEg72GuVsf1tdp6/17Io33I68Q
 p1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zTb/MlfMguy2CKsoM1pwqvbZXL8b4EUzv5QG+eNBHcU=;
 b=rgMlnbV4gtIUjt7nyg7agNB0YY0iqShPSZon1nrqLLJ1tAyNM0fJ/3SScNsd57KCzS
 RGnB4x+opXWWbfnV8eLzrJXr4D7shVDkWsJ3P0p/HuH/Pa4VIGBuKc11eXWeJDgnYjGc
 P4PkvZL/QJbIz7sBSFF396xb+OF2p+sC4YvJ1H0X44yEXXWgqBIXksubKDUrzSUc/php
 Br3W4P6TI1etG9jW7GmzTFdKe1KjyV/V0fE5jZ5y5k06idnLZc2gyI5XD0WT5fOjBfqw
 Qrb0ZTiVhOZmW3vm+kYd+skVD1NuCX0IgUBJud1r0IKM3oQHm7byfeyiTkuTjsWqm9Qi
 Ko+A==
X-Gm-Message-State: ACgBeo0sZSsAKvQ+B4cB045D/ScQa/jUPEUDL9zMOQzw7BKIA/Qc+Mnk
 UX2S5vWLCtor/si4jHgoBkvu1SkQlIPVy7UweOUJG4c0wx986g==
X-Google-Smtp-Source: AA6agR5uaaK2Go8j0xJwhj/Gcd0iJ7t8wwQ49XaGrreDasJjEHZJqZ2JY7wCwhHVdR/x1kd8BKbLAI8OgYBUSvFUSvg=
X-Received: by 2002:a05:6512:711:b0:494:9a1b:d34a with SMTP id
 b17-20020a056512071100b004949a1bd34amr845782lfs.185.1662546412422; Wed, 07
 Sep 2022 03:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220907100051.570641-1-christian.koenig@amd.com>
In-Reply-To: <20220907100051.570641-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 7 Sep 2022 11:26:24 +0100
Message-ID: <CAM0jSHMPbT1c=NZu+aj8iJ07Qz511K8mpC+g9ez9XTTX6b+8cw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: cleanup the resource of ghost objects after
 locking them
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: zhenguo.yin@amd.com, jingwen.chen2@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 7 Sept 2022 at 11:00, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Otherwise lockdep will complain about cleaning up the bulk_move.
>
> Not even compile tested.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Looks reasonable to me,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 57a27847206f..911141d16e95 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -236,6 +236,11 @@ static int ttm_buffer_object_transfer(struct ttm_buf=
fer_object *bo,
>         if (bo->type !=3D ttm_bo_type_sg)
>                 fbo->base.base.resv =3D &fbo->base.base._resv;
>
> +       dma_resv_init(&fbo->base.base._resv);
> +       fbo->base.base.dev =3D NULL;
> +       ret =3D dma_resv_trylock(&fbo->base.base._resv);
> +       WARN_ON(!ret);
> +
>         if (fbo->base.resource) {
>                 ttm_resource_set_bo(fbo->base.resource, &fbo->base);
>                 bo->resource =3D NULL;
> @@ -244,11 +249,6 @@ static int ttm_buffer_object_transfer(struct ttm_buf=
fer_object *bo,
>                 fbo->base.bulk_move =3D NULL;
>         }
>
> -       dma_resv_init(&fbo->base.base._resv);
> -       fbo->base.base.dev =3D NULL;
> -       ret =3D dma_resv_trylock(&fbo->base.base._resv);
> -       WARN_ON(!ret);
> -
>         ret =3D dma_resv_reserve_fences(&fbo->base.base._resv, 1);
>         if (ret) {
>                 kfree(fbo);
> --
> 2.25.1
>
