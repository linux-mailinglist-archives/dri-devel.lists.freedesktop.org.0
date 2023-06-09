Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5585B729919
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5C410E6A0;
	Fri,  9 Jun 2023 12:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4FB10E69F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3YEGdNvp8HrOlSgpTvQVmaRiPOQzGrP0bC+OvJCrwQ=;
 b=ZK3o4OGs5x4PjWSXrc8QPRbVeegBGkDhhaUVMxdrMRswHugw8I1J4nFlFJe6XuoowGdy9h
 SuNr13xeoAMbnEYZ7A6nZjopptpHV0nI2aRDKx0j+lqECDa5RwUYDil6wanYRPJveMYxAm
 JAvPBsKHWnOjqp8TkQDvj5j3Qbf8ssg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-EgdLZ3r_PziX26wp71zPfw-1; Fri, 09 Jun 2023 08:09:41 -0400
X-MC-Unique: EgdLZ3r_PziX26wp71zPfw-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b0982c99adso1154901fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 05:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312580; x=1688904580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k3YEGdNvp8HrOlSgpTvQVmaRiPOQzGrP0bC+OvJCrwQ=;
 b=LNpUUifGMB5EMJox8Db6kBT4wW+5c5EB3ltvEkVYHWnyOUD/RA5xk9nIsqKk83PTvR
 ZXsnqJT7mGFGpIhsAa37Eoe1ic9mJpsnWie11d8uoX8w6UkniLC/VEGgKZEeYwzCiMA1
 Si5JOKTHY7fISyYBQDlgkiQSDNWic3At7zfoFNYzd+I1xOtPp/GqVH4MLkmoYIICnypR
 IqrsvOKJsUdg0eitseM0/72C6d/L+g9jdshnT30ugFVGtn9PH7JqvDQr9+7nJTL85JrG
 LemFQaTJ1eddbV4MrbCXneyMLHkc4hQOA0RIuuTYesHXENOtlCsmKw0AKLBr38cCEfZw
 r1oA==
X-Gm-Message-State: AC+VfDxMsi4Jx5vdXFj8Hg4R+QBbcyu/E+5cB8iNAkR/w8wgto5cT9EY
 1NPd6VZmlj10J8YV8OnknyGRACRFfFP8WkPDXlVxzs9ZwUOJYeA5pIajcO5B2728O+pF3qnc18d
 p4wfO0utf3QGefMtKZvuyxl3mKLrzL98LyRXfTMcqUqym
X-Received: by 2002:a2e:aa1c:0:b0:2b1:e724:4d08 with SMTP id
 bf28-20020a2eaa1c000000b002b1e7244d08mr988060ljb.4.1686312580324; 
 Fri, 09 Jun 2023 05:09:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/t2tD8MaFXp12L6CGZR5hbVtX9aWeEyd2gjiDmsXx5pBr/sPbrekf6193BsmLX+ZVCnheOQK5h1GW9Ht/eq8=
X-Received: by 2002:a2e:aa1c:0:b0:2b1:e724:4d08 with SMTP id
 bf28-20020a2eaa1c000000b002b1e7244d08mr988048ljb.4.1686312580168; Fri, 09 Jun
 2023 05:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-11-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-11-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:09:29 +0200
Message-ID: <CACO55tuaNOYphHyB9+ygi9AnXVuF49etsW7x2X5K5iEtFNAAyw@mail.gmail.com>
Subject: Re: [RESEND 10/15] drm/nouveau/nvkm/engine/gr/tu102: Staticify local
 function gf100_fifo_nonstall_block()
To: Lee Jones <lee@kernel.org>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 9, 2023 at 10:18=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previo=
us prototype for =E2=80=98tu102_gr_load=E2=80=99 [-Wmissing-prototypes]
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/tu102.c
> index 3b6c8100a2428..10a7e59482a6f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> @@ -206,7 +206,7 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, stru=
ct gf100_gr_pack **ppack)
>         return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
>  }
>
> -int
> +static int
>  tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *=
fwif)
>  {
>         int ret;
> --
> 2.41.0.162.gfafddb0af9-goog
>

