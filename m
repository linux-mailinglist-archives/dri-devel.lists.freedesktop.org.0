Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA8E786A50
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B21810E4F0;
	Thu, 24 Aug 2023 08:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5440C10E4EC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692866523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IsB/rgE71MKRCAfugQoyX1VTNTlOQvUYEhfYQX7N874=;
 b=JlN/3UFfr9XQLohJBMtabr5wjyjLIc7UZrZK4A0uZ20uWy6GSWlJwFrUDMNwIzmNT8A4Fe
 8NhuoXWumtYqRTusoROZT/oQoZvSoCH1S9iUFWt5pE8p80QD1vu3EDu/hT0XMWZviqdjpd
 SsSjUR+odpRlJyid/95Mdg9N+MiYb64=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-E6UDpq0jO4GladBpTKw_fw-1; Thu, 24 Aug 2023 04:41:58 -0400
X-MC-Unique: E6UDpq0jO4GladBpTKw_fw-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-500994f6b4bso343234e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 01:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692866516; x=1693471316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IsB/rgE71MKRCAfugQoyX1VTNTlOQvUYEhfYQX7N874=;
 b=bxuWR1G+2AW0rw0ZE9tt3CnxN2TCIYsROBTN8GrZTV2/WLhp/XRNKhr8ZAgBXAWu4/
 WKdmuSFaUgtE60M90h6SVwVeM3YEeaGZckt3SFcPKbRYIF8v/sB55WG6io6dIPc7DRo7
 BrwYjETcKKcZJ+S/Pj+Rgs7csxK4t3DQIPyc6J6hadrZ7ta2aFxlsUpF81s3I18Zg8dX
 vLttr0fdlQE1r8bkTVn/ZeOZKD6OyeR4igtkkKYRuigQ0hbgZ0hUQ5VNcTx1pv0sMKEh
 NcIGkaiEsnOfo+PH7lEmzwA73nQRlnRGrJl5Kb6yME+CHPYtVHIYPUg7lF8QPYJ32KGy
 OTug==
X-Gm-Message-State: AOJu0YyoOTAeXT7o1DSTJf5RN0oY8psRlDnKSoOdKaHQM3GEJV2YLiAk
 x3K36AYG+rj73+tGaeGGFVNsKeX62BmZrj0dFMxBs9A478pRMMdT5wuUwFWHSDjvwDSj5UoJAKN
 IB8HQ6His6xtDMirHFqSjIXUxduEJ4hk1jyn6CQr9rvWSsCay1bOuM+8=
X-Received: by 2002:a2e:a795:0:b0:2b6:7c3a:6adc with SMTP id
 c21-20020a2ea795000000b002b67c3a6adcmr12550892ljf.5.1692866516036; 
 Thu, 24 Aug 2023 01:41:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZUHPWZDKgvC3dNDa3Zh4y3brX0dAkFwoJfBWqG0XeVgAinujTjApQBRr3j9aCYGGyak4hQCHpLkui5aRtbIw=
X-Received: by 2002:a2e:a795:0:b0:2b6:7c3a:6adc with SMTP id
 c21-20020a2ea795000000b002b67c3a6adcmr12550879ljf.5.1692866515666; Thu, 24
 Aug 2023 01:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-5-lee@kernel.org>
In-Reply-To: <20230824073710.2677348-5-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 24 Aug 2023 10:41:44 +0200
Message-ID: <CACO55tvZ+mv7xxRB4hbM7ttTnJznbyVAs41fn1Dq-rEeLUWYyg@mail.gmail.com>
Subject: Re: [PATCH 04/20] drm/nouveau/nvkm/subdev/volt/gk20a: Demote
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

On Thu, Aug 24, 2023 at 9:37=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
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
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
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
> 2.42.0.rc1.204.g551eb34607-goog
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

