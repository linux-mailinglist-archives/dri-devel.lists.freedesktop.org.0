Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969995B015A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 12:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A51910E4D9;
	Wed,  7 Sep 2022 10:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A828A10E4D9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 10:10:54 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id s15so15378868ljp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=wHEZ+AU/kiXyybt6W+wU+TqlsdbihjuEsA8RrE9nb/8=;
 b=n4wtMgtPkm9SRzfo50YOAJBvEaz/cP8mYsKkm7wREN7etbsIAEegX99KkQDnGDRyuy
 h/Z/zaQtvbh9x5sX3GmHvbiMK6lskDERVe/hlJFcKVriqQ2PpCcsX6EJ0YBiyf+dQyqg
 KGZW3554z3+4cEjBEPmAf94AzME9Zi+hcl56Fwu/JnXsDKMmfZvCvRRzzewzRwtXVc5K
 A+WcUPzo7VxrW+MfW49zlSbmj0PcnFbAQcdfw5QlHeSA3/T9OwU6U6e5alxoxDy4+Fzx
 Us3u432cRqnQzxdkv/zrZGkfwfrSRYzPoVBwewzAGBm4KeNxcQj7nU9jQ7FFvfuUfqiA
 jPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wHEZ+AU/kiXyybt6W+wU+TqlsdbihjuEsA8RrE9nb/8=;
 b=HBmuTRr6TW+2GkR1QZTX8Fb1V2QAm3zrw4RH+x/t68j/wIk/V7r0cvR3Wr4TMDbefn
 SKQgCtTk85DadAEVUYGGEGU3hNUAcvA5SglZCzV835B83JXVfAnMpEsv8iBpr5HXFlv5
 oec0yRcjNs6aa3U+auvlNEeOjgrPt8n09TmmM0Hkmq4EXMxfjC6pcOtTLTb/xJostSrk
 zj+PBXCux0F4u5ODYpFgIXYKmE9wFspEuIfqLalJW3PcsKAo0k2KzETgkERUzeJo4OFD
 B6n3xCgNnek/KmKLlIlshl2P7TgmVyTBo0Is9Qf/+H/yU9uPE8//JdblIPm2rQ4fWxng
 mhVQ==
X-Gm-Message-State: ACgBeo0XcaAkGjsDhE0TrsKECV1WFEekIBb/6vLKlWouoK6zuq/tEuwU
 hGbClppW1AA1/7gA2hgtTib1Z8OMhjtK13QugpPyqzuHL8Tnq00y
X-Google-Smtp-Source: AA6agR56RMnENIxOaiKr+rTxB/UG6cTevs6f5yX6LSYJz9qCb+mvjtO5vJmuUVcb9+ZJDtxRa3RGXkfgux0chphiJ8k=
X-Received: by 2002:a05:651c:160c:b0:264:a5ae:7dd2 with SMTP id
 f12-20020a05651c160c00b00264a5ae7dd2mr786414ljq.80.1662545452652; Wed, 07 Sep
 2022 03:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220907100051.570641-1-christian.koenig@amd.com>
In-Reply-To: <20220907100051.570641-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 7 Sep 2022 11:10:25 +0100
Message-ID: <CAM0jSHPZq4TmOuuTPNydNk=XwwrW_9UKrBR8j5ES7z6nZ6QzWw@mail.gmail.com>
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

Can we quickly resend with --cc=3Dintel-gfx@lists.freedesktop.org to
trigger a CI run? It will even compile test it for you, and confirm if
this fixes the issue or not :)

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
