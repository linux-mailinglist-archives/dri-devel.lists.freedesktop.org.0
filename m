Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298E7D8165
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 12:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB3210E7B0;
	Thu, 26 Oct 2023 10:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550FB10E7B0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 10:58:23 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-66d09b6d007so5366416d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 03:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698317902; x=1698922702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UDVEUxvK7+Eyyn8Hq5kqjRW7YiimQw2JlBQO9I3XAFk=;
 b=telzHkDW8wjujtFuFM1+Gkw+4KmGwFUyHAkPGR7ndXHTrmPKqA4XrsYbKGVDBbCG95
 5qFynMyLfkg7TkX4pJmt325WsC6l0UO3aCMeMYpytpChyAKieXMfmIMYqww6akA8lY8S
 PvXM3WrNoDEXHWt2lQZPDs/MRo2MzGELB0+gryxpO0uysShU0JliKdJhA5kIIBCkpLUq
 ESiNZOXwad3dTn+FAv1HFsSQxoMf+8sqjxWLODmMxutsNeQlIlHs89vxjaxJ0/lLglLU
 kWiwAlMHbkeGSbe/bzcrAccWuLtYXC9HdfM/iQbmxOQVqrdFTy16Txp9E/4Wff5BsNSZ
 guPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698317902; x=1698922702;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UDVEUxvK7+Eyyn8Hq5kqjRW7YiimQw2JlBQO9I3XAFk=;
 b=bPqvrfUwpB+TWXuARsk6MtUDnXeOM6dlevdF780jymFL2G0D9rbJaKTfv1jFqcdo0u
 75/xs8N+5cuZxRqMrhJHDLfV+fZZ5Xn2H2QBxhYMy6PIxd0daN8YquhJ9oY/lV7u93Ok
 btxitCyQwSTQHFxIewR8hgczHe6si4WRWsBxwt9pOKGmdOE8Rrj+0q4mSCqFlufd3KTH
 Ke0qAxAkdJuVgo2rWu6nlCmLz3tKahHW7TYkdjXsBpjEZehF8sFt01yUYQX/09LIcHRC
 eMa/9tMh2aJoS05PvvV4Du4a/0mvEfImjCorL+MpjnUU4nVVfavvuK8u2N73+hjC6PB3
 V9Aw==
X-Gm-Message-State: AOJu0YwVDdYjotTP+0eS0uQCryokdD7WkpNRk8QADmVj7Qda4qItQPGV
 jwjkGSxzwDCVqKxGflNGw7jdS8ozQCZstSH5RSkFBw==
X-Google-Smtp-Source: AGHT+IEajrVjssQmchLlHLm8ZYIpiMOfrlaR1G6rK8l7HyWEr1GSJD+5260M+lo2POh+r/qCjx/O5998AXmhRpKWXJU=
X-Received: by 2002:a05:6214:2a4a:b0:66d:a309:275d with SMTP id
 jf10-20020a0562142a4a00b0066da309275dmr19191896qvb.1.1698317902444; Thu, 26
 Oct 2023 03:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20231024105640.352752-1-mripard@kernel.org>
 <bc7271e7-f485-fb08-d37e-5756e6bd7a2b@igalia.com>
In-Reply-To: <bc7271e7-f485-fb08-d37e-5756e6bd7a2b@igalia.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 26 Oct 2023 12:58:11 +0200
Message-ID: <CADYN=9LROnn94Cm-8ug7iXnhoFxOeaQ4-aUf9egXo82OP1eFLw@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: tests: Fix UAF in the mock helpers
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
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
Cc: David Airlie <airlied@linux.ie>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Oct 2023 at 18:38, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> On 10/24/23 07:56, Maxime Ripard wrote:
> > The VC4 mock helpers allocate the CRTC, encoders and connectors using a
> > call to kunit_kzalloc(), but the DRM device they are attache to survive=
s
> > for longer than the test itself which leads to use-after-frees reported
> > by KASAN.
> >
> > Switch to drmm_kzalloc to tie the lifetime of these objects to the main
> > DRM device.
> >
> > Fixes: f759f5b53f1c ("drm/vc4: tests: Introduce a mocking infrastructur=
e")
> > Closes: https://lore.kernel.org/all/CA+G9fYvJA2HGqzR9LGgq63v0SKaUejHAE6=
f7+z9cwWN-ourJ_g@mail.gmail.com/
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

I tested this patch ontop of next-20231025 and on next-20231011 when
we first saw the issue,
both kernels booted fine on a RPI4(bcm2711-rpi-4-b)

Cheers,
Anders


>
> Best Regards,
> - Ma=C3=ADra Canal
>
> >
> > ---
> >
> > Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> > Cc: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c   | 2 +-
> >   drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c b/drivers/gpu/dr=
m/vc4/tests/vc4_mock_crtc.c
> > index 5d12d7beef0e..ade3309ae042 100644
> > --- a/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
> > +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c
> > @@ -26,7 +26,7 @@ struct vc4_dummy_crtc *vc4_mock_pv(struct kunit *test=
,
> >       struct vc4_crtc *vc4_crtc;
> >       int ret;
> >
> > -     dummy_crtc =3D kunit_kzalloc(test, sizeof(*dummy_crtc), GFP_KERNE=
L);
> > +     dummy_crtc =3D drmm_kzalloc(drm, sizeof(*dummy_crtc), GFP_KERNEL)=
;
> >       KUNIT_ASSERT_NOT_NULL(test, dummy_crtc);
> >
> >       vc4_crtc =3D &dummy_crtc->crtc;
> > diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/=
drm/vc4/tests/vc4_mock_output.c
> > index 6e11fcc9ef45..e70d7c3076ac 100644
> > --- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> > +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> > @@ -32,7 +32,7 @@ struct vc4_dummy_output *vc4_dummy_output(struct kuni=
t *test,
> >       struct drm_encoder *enc;
> >       int ret;
> >
> > -     dummy_output =3D kunit_kzalloc(test, sizeof(*dummy_output), GFP_K=
ERNEL);
> > +     dummy_output =3D drmm_kzalloc(drm, sizeof(*dummy_output), GFP_KER=
NEL);
> >       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dummy_output);
> >       dummy_output->encoder.type =3D vc4_encoder_type;
> >
