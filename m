Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B4179F110
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 20:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA64A10E4D9;
	Wed, 13 Sep 2023 18:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9815710E4D7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 18:21:25 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a64619d8fbso20930166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694629282; x=1695234082;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nc0iKQaFbvx2OY31KmNWuTwAoAIg4JTwX3WveSIcUxk=;
 b=kscHzzQckDkaLNC349MZxpT7MDJkIBwmSl3YkaiS+9mxMLKVy88yWbTRqLJUxHKPLx
 CSPilvQsdLLmZj6R2bbg4zI6BQCmITI7WJaa2aY69aREO1dMQ5KF96NQnBavwocx320F
 yH7o2Ly94dfXRpKfZyZRF6Nr8nDpLubgxz4oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694629282; x=1695234082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nc0iKQaFbvx2OY31KmNWuTwAoAIg4JTwX3WveSIcUxk=;
 b=P5ThZG2FUKw1gqh116bbctXZbYmP5PVV96UxEyxez9dSGo7caGHsCf46jgzDBnAl9C
 +LAy1wFGjEh42Rrb9uG3HBsa6q877S1dPxNBiV6ZF2a7QwCFiSik7Csz7D/ZLplEYp9j
 TgMAUzJcbeO5mXJ4iRNbHt6x/ke6skio9yrw9ztZGxDVPDh/RJgREBjM98wmzvU/3Qy0
 qp1h8+LpoifrWWhz7t2w4vTwjPBV+XlKDT1hwfLy1rhJ2HkFeW8QnKDqxkj4Dvq0C41L
 Kg1OYcUk4Bh0Zq3MUxiV3D37KLg18Z5b9UvAhZjPHDQS66a7AUbcn54P6M8wlLq61SO7
 NmOA==
X-Gm-Message-State: AOJu0Yzs6n3b6DkDyDqzp3Pt/VxO1JKe5F4ZdqT+Zb9hPUy334ossAR0
 GLXktRQ4PfSiKJRGWG3FOzGQnTNVoOLA2Q+1ChCkHAVa
X-Google-Smtp-Source: AGHT+IFVi/G920PuSD9S8rB8f+uLvlKEO6YnuUblQeybPYA5SktstmsUe2DIKb4QfYmk5pH6ixHbOg==
X-Received: by 2002:a17:907:1deb:b0:9a1:bd82:de24 with SMTP id
 og43-20020a1709071deb00b009a1bd82de24mr2578932ejc.12.1694629282135; 
 Wed, 13 Sep 2023 11:21:22 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 rp26-20020a170906d97a00b00988be3c1d87sm8761256ejb.116.2023.09.13.11.21.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 11:21:21 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-402c80b71ecso11635e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 11:21:21 -0700 (PDT)
X-Received: by 2002:a05:600c:1c24:b0:401:a494:2bbb with SMTP id
 j36-20020a05600c1c2400b00401a4942bbbmr160360wms.5.1694629281276; Wed, 13 Sep
 2023 11:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
In-Reply-To: <20230901164111.RFT.3.Iea742f06d8bec41598aa40378fc625fbd7e8a3d6@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 11:21:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFQUDP+_MoamvSW71ieGCZD5M9FJpZLgQWd_KZcj3OnA@mail.gmail.com>
Message-ID: <CAD=FV=VFQUDP+_MoamvSW71ieGCZD5M9FJpZLgQWd_KZcj3OnA@mail.gmail.com>
Subject: Re: [RFT PATCH 03/15] drm/ingenic: Call drm_atomic_helper_shutdown()
 at shutdown time
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
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
Cc: paul@crapouillou.net, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 1, 2023 at 4:42=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> Since this driver uses the component model and shutdown happens at the
> base driver, we communicate whether we have to call
> drm_atomic_helper_shutdown() by seeing if drvdata is non-NULL.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
>
> NOTE: this patch touches a lot more than other similar patches since
> the bind() function is long and we want to make sure that we unset the
> drvdata if bind() fails.
>
> While making this patch, I noticed that the bind() function of this
> driver is using "devm" and thus assumes it doesn't need to do much
> explicit error handling. That's actually a bug. As per kernel docs [1]
> "the lifetime of the aggregate driver does not align with any of the
> underlying struct device instances. Therefore devm cannot be used and
> all resources acquired or allocated in this callback must be
> explicitly released in the unbind callback". Fixing that is outside
> the scope of this commit.
>
> [1] https://docs.kernel.org/driver-api/component.html
>
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 66 +++++++++++++++--------
>  1 file changed, 44 insertions(+), 22 deletions(-)

[ ... cut ... ]

> @@ -1612,6 +1633,7 @@ static struct platform_driver ingenic_drm_driver =
=3D {
>         },
>         .probe =3D ingenic_drm_probe,
>         .remove =3D ingenic_drm_remove,
> +       .shutdown =3D ingenic_drm_shutdown,

I resolved the trivial conflict with commit 2b9b0a9fc548
("drm/ingenic: Convert to platform remove callback returning void"),
then pushed to drm-misc-next:

c3ca98396ffa (HEAD -> drm-misc-next) drm/ingenic: Call
drm_atomic_helper_shutdown() at shutdown time
