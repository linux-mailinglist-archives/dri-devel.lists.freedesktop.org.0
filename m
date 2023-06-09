Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F5C729914
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B8A10E694;
	Fri,  9 Jun 2023 12:09:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52D810E694
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 12:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686312546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZR6reQCNcnuFfexOGBu5QAKgIdPCDJoW0kdpvy5S78=;
 b=ePDfjnrjAFwgIs3t3Orkuc/OtuI1uxZbpHYAC2h86JiUen4Zmhuxa2wPCE4+At+gCzPScu
 gToRaUjKFd06820wZwNx+sqcCTC5iBNicNOk2cD1Bf4r4o0D5lzrELuPyWYPnYxTtKNoZM
 E9zm9GN2mZmTe9+HQIIh9Zbyio/TwkI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-kBrmSa3EPaSGQbnwDCbp8w-1; Fri, 09 Jun 2023 08:09:05 -0400
X-MC-Unique: kBrmSa3EPaSGQbnwDCbp8w-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b1b8ec9343so2385791fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 05:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686312544; x=1688904544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZR6reQCNcnuFfexOGBu5QAKgIdPCDJoW0kdpvy5S78=;
 b=SSewWwMxowN7/Xir6SnXZJEIivuTwO8jtf62mhcBxmKyoTyiOGTnzDKHR+SWWkTM8L
 qHJ4yswnDgNnHFbvSAMsLJW/cEnxNAMqCKP59VJnxIVN99IQMHU+o+XvAYA+F7Wk57Zi
 sgmNWE06Y+nClVwKhhenjbWtNdj9zxBjTjkASBAJi6I2HPDqsT9c0KYn+bjkolAnJ4Au
 OR8FCudelkrnX5wfp/Z/5kU80Mp5/EJKXTRXhaY/M+uHPM9PvN64FdZ9VSDyviPzqFZQ
 9JvhUUB4+1RCMHqMYwFatCdh7Wd8XWCbcmMLWagAIS/nOVNOEBOEAC/iCYXX4M5AUtfn
 3uyQ==
X-Gm-Message-State: AC+VfDy8DiBia0fNvhZmoHTLSC1Wjn69GV8zg2LUQDQIYKPXkRHqH/Dn
 tplaj9omnx/BsXh3e8sNOpXob9jkZh3lTo3Qu8gfnLYBWrqIZnDIHsxXImZbh6gVYI15y/4deSW
 iCCwNAum18NO0xwmzLeXDiocMxHp3ziC+T2wYYQ9rsTmH
X-Received: by 2002:a2e:b5dc:0:b0:2b1:c184:9afe with SMTP id
 g28-20020a2eb5dc000000b002b1c1849afemr882682ljn.4.1686312544291; 
 Fri, 09 Jun 2023 05:09:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5aYnP4o6U74L5gjhqD1XkB3Wdjtyd80ogwjUXJ8HiSsGCkFoeBk+bdCktf2s1Lm6D5wtU5M2VftptBu7vekhE=
X-Received: by 2002:a2e:b5dc:0:b0:2b1:c184:9afe with SMTP id
 g28-20020a2eb5dc000000b002b1c1849afemr882669ljn.4.1686312544004; Fri, 09 Jun
 2023 05:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230609081732.3842341-1-lee@kernel.org>
 <20230609081732.3842341-9-lee@kernel.org>
In-Reply-To: <20230609081732.3842341-9-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Jun 2023 14:08:53 +0200
Message-ID: <CACO55tt_ivgVYCbVpGRp4BcsC-CNB5i7Cy=wiMPKUSuXKsOgNg@mail.gmail.com>
Subject: Re: [RESEND 08/15] drm/nouveau/nvkm/subdev/volt/gk20a: Demote
 kerneldoc abuses
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
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:49: warning: This comme=
nt starts with '/**', but isn't a kernel-doc comment. Refer Documentation/d=
oc-guide/kernel-doc.rst
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:62: warning: This comme=
nt starts with '/**', but isn't a kernel-doc comment. Refer Documentation/d=
oc-guide/kernel-doc.rst
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
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> index 8c2faa9645111..ccac88da88648 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> @@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_coef[] =3D {
>         /* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
>  };
>
> -/**
> +/*
>   * cvb_mv =3D ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
>   */
>  static inline int
> @@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, int s_scale, con=
st struct cvb_coef *coef)
>         return mv;
>  }
>
> -/**
> +/*
>   * cvb_t_mv =3D
>   * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
>   * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
> --
> 2.41.0.162.gfafddb0af9-goog
>

