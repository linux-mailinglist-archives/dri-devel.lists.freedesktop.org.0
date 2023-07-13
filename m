Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC6751CE2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D363C10E650;
	Thu, 13 Jul 2023 09:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE9410E64C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgFtZUgh5go8zila2S4ZY5xFxZuToGtLb3sGveBEJbY=;
 b=dTHaiTl1AABD4TzZVYdT6WF1Vya3G8ddDRpjtmQJUw+2YTy16kZOmopNJ01ZI1Z41a74FL
 B4JHjtDkrGm94OiOUjGRx1CmNqeTMW8SXaxkX0Dmyv1JmEpGBa1z1TRucqbCDMAI0LkjF8
 mKl4KPu6GT051uE6MgGNPqOA7zTwOJg=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-g3wyFBNbNvyeI2EssDbvTQ-1; Thu, 13 Jul 2023 05:11:41 -0400
X-MC-Unique: g3wyFBNbNvyeI2EssDbvTQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso1260201fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239499; x=1689844299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgFtZUgh5go8zila2S4ZY5xFxZuToGtLb3sGveBEJbY=;
 b=aZ/pi3NzIGqMpD/tupX2E3vlqyA463lWw6CGLrOIZI2WJyzDPElEgwTxo/PXQAHzpc
 N8bCgfvhBi7kXVs29m4V+eadgMpEROtwhkecb3PEcLJ2YGuxEbKQxuOUgnxuhctWNfEW
 aFTNMyj13zuWQDn7YHoaIUHosqAdECnkEfPkGGEpSKYr2igmYSGkSat++lfoYhIkDi+F
 ie9w2ZzCjj8a34owmz0jDkOnWuLV9g4saQz226RDWBkc1bbawFC4sr5L2YOm1UUq8ogi
 Z4SsaV613z/7SyT43nhz5R6VF3TcdjV3CYyEWT93I1TfNrC9/qJa8nTqf6YDyjTaGjBk
 zrgA==
X-Gm-Message-State: ABy/qLYjYI/7UWPyPMGWzNUZZdH/MoQxJiNKUpVAg6I+jw74UWUE1qFX
 06wjMCWMUgDu3OW1gsUD/9iAu9xkWI9vRmBsKaP+6QZl0vhcqEIVrZBsyO50CCaYLJTVPj3ynRn
 UjlfVKh2+4GpTiLKKp2xuuBu7XPlPHJKJEdJrHirHdmo4bGBLhAGzJ4w=
X-Received: by 2002:a2e:a790:0:b0:2b6:99a7:2fb4 with SMTP id
 c16-20020a2ea790000000b002b699a72fb4mr1029820ljf.0.1689239499531; 
 Thu, 13 Jul 2023 02:11:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHNMXMfFllIlbsS7OgZ8tt30TUpflSFE8vHptSmh10AZhpcrU0369e6fqWHgckt6hGkADlesM/GIl6gUWcIL/8=
X-Received: by 2002:a2e:a790:0:b0:2b6:99a7:2fb4 with SMTP id
 c16-20020a2ea790000000b002b699a72fb4mr1029800ljf.0.1689239499293; Thu, 13 Jul
 2023 02:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230710062932.53655-1-xujianghui@cdjrlc.com>
 <7ab55aa7169d6a3bd0309b43c3de592e@208suo.com>
In-Reply-To: <7ab55aa7169d6a3bd0309b43c3de592e@208suo.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:11:28 +0200
Message-ID: <CACO55tu=5HKnywnnV499YkVUg-o_HY8gMEQHozkLDdbNE=YQwg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/i2c: do not use assignment in if condition
To: sunran001@208suo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 9:23=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Assignments in if condition are less readable and error-prone.  Fixes
> also checkpatch warning:
>
> ERROR: do not use assignment in if condition
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> index d063d0dc13c5..098051d3755c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> @@ -209,7 +209,8 @@ nvkm_i2c_aux_new_(const struct nvkm_i2c_aux_func
> *func,
>             struct nvkm_i2c_pad *pad, int id,
>             struct nvkm_i2c_aux **paux)
>   {
> -    if (!(*paux =3D kzalloc(sizeof(**paux), GFP_KERNEL)))
> +    *paux =3D kzalloc(sizeof(**paux), GFP_KERNEL);
> +    if (!*paux)
>           return -ENOMEM;
>       return nvkm_i2c_aux_ctor(func, pad, id, *paux);
>   }
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

