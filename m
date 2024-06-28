Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB54591B785
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 09:04:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C5A110EBB9;
	Fri, 28 Jun 2024 07:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA0F10EBBC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 07:04:07 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-643f1ee4b3cso2641067b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719558244; x=1720163044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N4VYcLeI6FK6UKDIjd//YA7QOqVsn4Xvt1s7Cj81jOs=;
 b=mJJkgVr0a9xynIyShx77vZ5NnKIOx4DQnRPgUPHizedrJQUHlLNTwiU3EOyH+rOIGa
 dRVfQtorvsuzYTxiBMTeX07Fjc6OYZIEk9A+9y7+ffyf7p1FGJrycJWJdbHn03ktdTn0
 cMGDcGMZqKgRw2sHQUNTBWFV722MlahGOOif0dfKMq3WUKpiwd4o6r1DcrhpG6R31FAz
 2lSrWEPd1J1sQe4YSVO1kXZBNovD7jf7UaUEEFW07mQetJhjQchiQMRgVzY1MI39Rn99
 IHeh8hi4SKU0eLXzme+D3pNB/MAQewSSb+82K8umcb1E4QKxO0sP2/sAYHaaD7/akCFR
 tTWA==
X-Gm-Message-State: AOJu0YxuIbILMIfA6u//bPI3U0LkG/hgjnx02RMfxxmJzkEjGR61BpZC
 vn+F4tbOLewH1BvH0veFSgu4bTDWAhstEB81Bzy8zIQ8x37ZmvAEvrvBbF3R
X-Google-Smtp-Source: AGHT+IFvxN6vMHSrRMceap6LPVeaX8ZsQY3sJJ0XoaF/KWyiLuUjFYfcc4Jm9NtVycwy3oNVI/xThQ==
X-Received: by 2002:a81:9145:0:b0:64b:392a:b9d7 with SMTP id
 00721157ae682-64b392aba49mr2746747b3.45.1719558244132; 
 Fri, 28 Jun 2024 00:04:04 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-64a99d65cf3sm2461587b3.23.2024.06.28.00.04.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 00:04:03 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-643f1ee4b3cso2640607b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:04:03 -0700 (PDT)
X-Received: by 2002:a05:690c:944:b0:64a:397f:9599 with SMTP id
 00721157ae682-64a397f9801mr27078607b3.30.1719558242907; Fri, 28 Jun 2024
 00:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240627173530.460615-1-thuth@redhat.com>
In-Reply-To: <20240627173530.460615-1-thuth@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Jun 2024 09:03:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4cpizpk7CWPbCs3GKJcG95yrnh9FwwEgLsm17wa-fNA@mail.gmail.com>
Message-ID: <CAMuHMdU4cpizpk7CWPbCs3GKJcG95yrnh9FwwEgLsm17wa-fNA@mail.gmail.com>
Subject: Re: [PATCH] drm/fbdev-generic: Fix framebuffer on big endian devices
To: Thomas Huth <thuth@redhat.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>
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

Hi Thomas,

CC Christian

On Thu, Jun 27, 2024 at 7:35=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
> Starting with kernel 6.7, the framebuffer text console is not working
> anymore with the virtio-gpu device on s390x hosts. Such big endian fb
> devices are usinga different pixel ordering than little endian devices,
> e.g. DRM_FORMAT_BGRX8888 instead of DRM_FORMAT_XRGB8888.
>
> This used to work fine as long as drm_client_buffer_addfb() was still
> calling drm_mode_addfb() which called drm_driver_legacy_fb_format()
> internally to get the right format. But drm_client_buffer_addfb() has
> recently been reworked to call drm_mode_addfb2() instead with the
> format value that has been passed to it as a parameter (see commit
> 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to drm_mode_=
addfb2()").
>
> That format parameter is determined in drm_fbdev_generic_helper_fb_probe(=
)
> via the drm_mode_legacy_fb_format() function - which only generates
> formats suitable for little endian devices. So to fix this issue
> switch to drm_driver_legacy_fb_format() here instead to take the
> device endianness into consideration.
>
> Fixes: 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to dr=
m_mode_addfb2()")
> Closes: https://issues.redhat.com/browse/RHEL-45158
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
works fine on m68k-virt, so:
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Christian had reported a similar issue before[1].
I submitted a different solution fixing virtio[2] instead, but that
caused issues with virtio-mouse-pci cursor...

> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -84,7 +84,8 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm=
_fb_helper *fb_helper,
>                     sizes->surface_width, sizes->surface_height,
>                     sizes->surface_bpp);
>
> -       format =3D drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->s=
urface_depth);
> +       format =3D drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
> +                                            sizes->surface_depth);
>         buffer =3D drm_client_framebuffer_create(client, sizes->surface_w=
idth,
>                                                sizes->surface_height, for=
mat);
>         if (IS_ERR(buffer))

[1] https://lore.kernel.org/6530cea3-4507-454e-bc36-a6970c8e7578@xenosoft.d=
e/
[2] "[PATCH v2] drm/virtio: Add suppport for non-native buffer formats"
    https://lore.kernel.org/47a81d2e0e47b1715718779b6978a8b595cc7c5d.170014=
0609.git.geert@linux-m68k.org

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
