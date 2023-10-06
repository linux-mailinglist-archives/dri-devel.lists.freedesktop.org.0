Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7930F7BB9CD
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 15:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30A110E4EC;
	Fri,  6 Oct 2023 13:51:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B702610E4EC
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 13:51:10 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-532c81b9adbso3858878a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696600267; x=1697205067;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=59BqFGPIq+MlLg0nO/rZFvmB+hLKOqd3eB7b4cqnV5I=;
 b=EtPGYp9RHCyS3N4/+3wk7rTjdxY06yqdgMtpPAJGfsarro2aff+krmuqLMmZAgSwLU
 7ylGbP4w4QId4fGqBPn/FFx0h+zAG4br+MUnz1kOHhpAq1MGa45l5EN63R6vgRx12dvD
 9Dbkrez8C0QDqqcaG3eAslvsMzgcI+Ts6kCvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696600267; x=1697205067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=59BqFGPIq+MlLg0nO/rZFvmB+hLKOqd3eB7b4cqnV5I=;
 b=TewQhYclRKr6d9UlqwApeW+wvho1Wf8p9PEjQgMxZ2DUqlry+YVpNbGxUblUAK9Zqh
 Jnb0tE4bIGJyz6bK8kqh5Jvhva4f2sN1jYTHhIGaJ4YMHBU7rXfe/3wm4ZjNtITdxhFt
 6d9C2Y2wF+VmOqR20d0zpV5J/j/Jgg8UUO9g4zLadqUnLVTZ9J7+CRDAnvPCpb8padNG
 k2qR0Nn3GXiicb4gdZjXj2Ws/Od9+uQGcMO5d9RWplESASXOTLm9jto1yVKbxmtaslc9
 1qd19f/0V2b0YIl3PVU6J6g9MdflCLty2ULg26TbcWEkmXUI6CTa/64a8RCnaxxJZP/V
 d/mg==
X-Gm-Message-State: AOJu0YxLsZhHUfj0KDVMywvU7h0JmBhBxsur/RFio+RUkg+BbrMF2LhZ
 joW2ZDSOEbE+oxcjwqas9Q8vOQlHIZzYv3QnWf/GiAgr
X-Google-Smtp-Source: AGHT+IEArdTq8peZ0VSUJhVu/Y/CXXXv4ZPXC2fyFLQ45TYjzjVtbCHJIqasD/+8jpmA6SW1wUb1Kw==
X-Received: by 2002:a17:906:7485:b0:9b7:1e26:e2e8 with SMTP id
 e5-20020a170906748500b009b71e26e2e8mr7533200ejl.57.1696600267139; 
 Fri, 06 Oct 2023 06:51:07 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 u18-20020a1709064ad200b0099d0a8ccb5fsm2924243ejt.152.2023.10.06.06.51.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 06:51:06 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so14116a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 06:51:05 -0700 (PDT)
X-Received: by 2002:a50:8756:0:b0:52f:5697:8dec with SMTP id
 22-20020a508756000000b0052f56978decmr206638edv.4.1696600265520; Fri, 06 Oct
 2023 06:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230921192749.1542462-1-dianders@chromium.org>
 <CGME20230921194907eucas1p1027c5dfc5c5f77bca3c43673427c89cc@eucas1p1.samsung.com>
 <20230921122641.RFT.v2.9.Iea33274908b6b258955f45a8aaf6f5bba24ad6cd@changeid>
 <fb9cd62b-6637-7bcc-e23d-37f3806f8460@samsung.com>
 <CAAQKjZNn4RTJ-SHHEugcQoS2U9fzNTOGtUpSLLM0w1V6Pb0amw@mail.gmail.com>
In-Reply-To: <CAAQKjZNn4RTJ-SHHEugcQoS2U9fzNTOGtUpSLLM0w1V6Pb0amw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Oct 2023 06:50:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2JSHsrTfdxP4=-nU4GGZB999iAb+NU3en-4o3-rLmYQ@mail.gmail.com>
Message-ID: <CAD=FV=V2JSHsrTfdxP4=-nU4GGZB999iAb+NU3en-4o3-rLmYQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 09/12] drm/exynos: Call drm_atomic_helper_shutdown()
 at shutdown/unbind time
To: Inki Dae <daeinki@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 alim.akhtar@samsung.com, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Oct 5, 2023 at 7:20=E2=80=AFPM Inki Dae <daeinki@gmail.com> wrote:
>
> Thanks for testing. :)
>
> Acked-by : Inki Dae <inki.dae@samsung.com>

Inki: does that mean you'd like this to go through drm-misc? I'm happy
to do that, but there are no dependencies here so this could easily go
through your tree.


> 2023=EB=85=84 9=EC=9B=94 22=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 3:00,=
 Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >
> >
> > On 21.09.2023 21:26, Douglas Anderson wrote:
> > > Based on grepping through the source code this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown tim=
e
> > > and at driver unbind time. Among other things, this means that if a
> > > panel is in use that it won't be cleanly powered off at system
> > > shutdown time.
> > >
> > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > of OS shutdown/restart and at driver remove (or unbind) time comes
> > > straight out of the kernel doc "driver instance overview" in
> > > drm_drv.c.
> > >
> > > A few notes about this fix:
> > > - When adding drm_atomic_helper_shutdown() to the unbind path, I adde=
d
> > >    it after drm_kms_helper_poll_fini() since that's when other driver=
s
> > >    seemed to have it.
> > > - Technically with a previous patch, ("drm/atomic-helper:
> > >    drm_atomic_helper_shutdown(NULL) should be a noop"), we don't
> > >    actually need to check to see if our "drm" pointer is NULL before
> > >    calling drm_atomic_helper_shutdown(). We'll leave the "if" test in=
,
> > >    though, so that this patch can land without any dependencies. It
> > >    could potentially be removed later.
> > > - This patch also makes sure to set the drvdata to NULL in the case o=
f
> > >    bind errors to make sure that shutdown can't access freed data.
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Seems to be working fine on all my test Exynos-based boards with displa=
y.
> >
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >
> > Reviewed-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >
> > > ---
> > > This commit is only compile-time tested.
> > >
> > > (no changes since v1)
> > >
> > >   drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.c
> > > index 8399256cb5c9..5380fb6c55ae 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> > > @@ -300,6 +300,7 @@ static int exynos_drm_bind(struct device *dev)
> > >       drm_mode_config_cleanup(drm);
> > >       exynos_drm_cleanup_dma(drm);
> > >       kfree(private);
> > > +     dev_set_drvdata(dev, NULL);
> > >   err_free_drm:
> > >       drm_dev_put(drm);
> > >
> > > @@ -313,6 +314,7 @@ static void exynos_drm_unbind(struct device *dev)
> > >       drm_dev_unregister(drm);
> > >
> > >       drm_kms_helper_poll_fini(drm);
> > > +     drm_atomic_helper_shutdown(drm);
> > >
> > >       component_unbind_all(drm->dev, drm);
> > >       drm_mode_config_cleanup(drm);
> > > @@ -350,9 +352,18 @@ static int exynos_drm_platform_remove(struct pla=
tform_device *pdev)
> > >       return 0;
> > >   }
> > >
> > > +static void exynos_drm_platform_shutdown(struct platform_device *pde=
v)
> > > +{
> > > +     struct drm_device *drm =3D platform_get_drvdata(pdev);
> > > +
> > > +     if (drm)
> > > +             drm_atomic_helper_shutdown(drm);
> > > +}
> > > +
> > >   static struct platform_driver exynos_drm_platform_driver =3D {
> > >       .probe  =3D exynos_drm_platform_probe,
> > >       .remove =3D exynos_drm_platform_remove,
> > > +     .shutdown =3D exynos_drm_platform_shutdown,
> > >       .driver =3D {
> > >               .name   =3D "exynos-drm",
> > >               .pm     =3D &exynos_drm_pm_ops,
> >
> > Best regards
> > --
> > Marek Szyprowski, PhD
> > Samsung R&D Institute Poland
> >
