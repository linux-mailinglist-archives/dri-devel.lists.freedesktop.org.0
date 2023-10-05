Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332427B9C15
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90BA10E1C7;
	Thu,  5 Oct 2023 09:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3DD10E1C2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 09:15:23 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5a24b03e22eso8137237b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 02:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696497322; x=1697102122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsQjmIe8M7KB7r0jUCrFtnwKHjJbITgjYmRPrfBA+Tg=;
 b=G0zDXxIS7VMZGuPf5eKlSi1o5gBG5GoNdvySsCvKOuTizucmT9KwXDAcUx4SF817gG
 IoYlfzcEzM4vXAA3XiZ/4oD1hK06a+aBREr10/YjHTIyz/d1MjLNfZXRQHzyXXrF1ycZ
 IKLWSsMI0COBqFMSyUbfYCuBK1HRJ8/OdB4R2pwawRSmlIHW+ExoLMtT+u3Kvpml3Tzl
 g1eWU6WDCzkxbYEFynIB5WHLwTayxe/n+a+i+wfYNOxVa7w4oZRVGVbD1ndPDy1ABFVu
 M+3bs4MaiBin+c3YNULeLDXkXPmCtaUhnjfH7o3paV3ziFXAXY9oLuoAl/8amf3TOFx4
 gfGw==
X-Gm-Message-State: AOJu0YwEiT1VZ6x4Im7TvOhqNpSiulSN8SK+rjIgbCZeCkZFV7MrXMmA
 4Lmv0qB0bNuxSERO2et9d773cWydsB2Qmw==
X-Google-Smtp-Source: AGHT+IF5TCvsyPCgvdmfPNkp1mAXikHC+TrItC14eZVkaoVz3vdIss2Etv6rbcZktMN90NXwil04kg==
X-Received: by 2002:a25:4110:0:b0:d7f:25c:b0ac with SMTP id
 o16-20020a254110000000b00d7f025cb0acmr4287712yba.65.1696497322355; 
 Thu, 05 Oct 2023 02:15:22 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 t40-20020a25aaab000000b00d853795d3e6sm285215ybi.9.2023.10.05.02.15.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 02:15:21 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5a24b03e22eso8136887b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 02:15:21 -0700 (PDT)
X-Received: by 2002:a0d:c104:0:b0:571:11ea:b2dd with SMTP id
 c4-20020a0dc104000000b0057111eab2ddmr4832404ywd.32.1696497321115; Thu, 05 Oct
 2023 02:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-7-tzimmermann@suse.de>
In-Reply-To: <20231005090520.16511-7-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Oct 2023 11:15:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqPYvXudvWN4kg7JKM=7ySqwoN=iHPgE1MHcxAws3gJg@mail.gmail.com>
Message-ID: <CAMuHMdWqPYvXudvWN4kg7JKM=7ySqwoN=iHPgE1MHcxAws3gJg@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] drm/ssd130x: Fix atomic_check for disabled planes
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 mairacanal@riseup.net, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Oct 5, 2023 at 11:05=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> The plane's atomic_check returns -EINVAL if the CRTC has not been
> set. This is the case for disabled planes, for which atomic_check
> should return 0. For disabled planes, it also omits the mandatory
> call to drm_atomic_helper_check_plane_state().
>
> Replace the test with the boiler-plate code that first invokes
> drm_atomic_helper_check_plane_state() and then tests for the plane
> to be visible. Return early for non-visible planes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d51f9fbd98b6 ("drm/ssd130x: Store the HW buffer in the driver-priv=
ate CRTC state")

Thanks for your patch!

> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -639,21 +639,22 @@ static int ssd130x_primary_plane_atomic_check(struc=
t drm_plane *plane,
>         struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_=
state(state, plane);
>         struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_st=
ate(plane_state);
>         struct drm_crtc *crtc =3D plane_state->crtc;
> -       struct drm_crtc_state *crtc_state;
> +       struct drm_crtc_state *crtc_state =3D NULL;
>         const struct drm_format_info *fi;
>         unsigned int pitch;
>         int ret;
>
> -       if (!crtc)
> -               return -EINVAL;
> -
> -       crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> -       if (IS_ERR(crtc_state))
> -               return PTR_ERR(crtc_state);
> +       if (crtc)
> +               crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc)=
;
>
> -       ret =3D drm_plane_helper_atomic_check(plane, state);
> +       ret =3D drm_atomic_helper_check_plane_state(plane_state, crtc_sta=
te,
> +                                                 DRM_PLANE_NO_SCALING,
> +                                                 DRM_PLANE_NO_SCALING,
> +                                                 false, false);

Aren't the above 6 new lines identical to the call to
drm_plane_helper_atomic_check()? So why duplicate that?

>         if (ret)
>                 return ret;

Insert blank line?

> +       else if (!plane_state->visible)

"else" not needed.

> +               return 0;
>
>         fi =3D drm_format_info(DRM_FORMAT_R1);
>         if (!fi)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
