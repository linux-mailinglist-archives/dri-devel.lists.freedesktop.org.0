Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBA779ED27
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 17:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2681010E0A9;
	Wed, 13 Sep 2023 15:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D8210E0A9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 15:35:04 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4c0so57056a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694619302; x=1695224102;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQS1uLzGm/YC/GzivOaGJCClvgDA4y68ZbPZk06T4sQ=;
 b=HZ72X3zozz213AuM3yyzIHo66GDhe/MMlEKES2RRPyCuStXg/O4vZ79VjZT7wROvsQ
 ZSKi6Oc9Y+o1jTpveBiUKKkTcnqTXRIvL7/GygKHXFxpih87URNsasqb3MBTxC0mmpEi
 D34nTQUBj5l8kwbo59mB2vAgvh/3tmb2+/MJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694619302; x=1695224102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQS1uLzGm/YC/GzivOaGJCClvgDA4y68ZbPZk06T4sQ=;
 b=OfIzmYNJoRoo1uH3gR3hz1zCW4t+3WY49QxrBfZdGCudXl/kQyxcCUJuZEoiCRSWTJ
 hgrJTh2qD0kQOtPaC46yfBMVWr5yT2YQ+cVP6oiuJUzd0etmpaoSMzpE2owMYWuSvpwh
 69rA6jW0EbMR/UwNJWZaIzR18z7L8ckBXd+ZUvjY2mdMXxrzqPWdHMICeo3J94VRCECB
 iPKcVGFN8RMQ2G5kJyV9r3VXFEXWokSFvumYkhpcCFKqBi3GmAgQili3aNBQaXgijbqK
 C0EKMaORius0BxkLt+lG9yAGH3LbclwHy4mOGsSfzpgcCUSFTPudwtaqEisay6wmGZ7R
 Ts9Q==
X-Gm-Message-State: AOJu0YzdURjDNPyVZsXWGByOx7k9heQ6dkEEtTVzv347w5UZBW5sHCgU
 FO/uLbr+VB/WqZ570kTBtwJJogjDdegoTcETySP4Mw==
X-Google-Smtp-Source: AGHT+IGxIZxNhqqoo6ivCD8Q0r+UZhEYw5p1+KCg/Vyj0u5bX7bAX1dAeW1Ny6jzz6v/lNbM/ejrMA==
X-Received: by 2002:aa7:d992:0:b0:523:37f0:2d12 with SMTP id
 u18-20020aa7d992000000b0052337f02d12mr4476110eds.17.1694619301840; 
 Wed, 13 Sep 2023 08:35:01 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com.
 [209.85.128.54]) by smtp.gmail.com with ESMTPSA id
 ek10-20020a056402370a00b0052f3471ccf6sm5735037edb.6.2023.09.13.08.35.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 08:35:01 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-402bec56ca6so95395e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 08:35:01 -0700 (PDT)
X-Received: by 2002:a05:600c:34d4:b0:3f7:3e85:36a with SMTP id
 d20-20020a05600c34d400b003f73e85036amr122941wmq.7.1694619300711; Wed, 13 Sep
 2023 08:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230901234202.566951-1-dianders@chromium.org>
 <20230901164111.RFT.1.I3d5598bd73a59b5ded71430736c93f67dc5dea61@changeid>
 <ZPSsBhbekKY7VyDg@shell.armlinux.org.uk>
 <CAD=FV=WT4Hf1XVA641WtNFg4WRYFKarU1WOkLPEbr0eiVQuZPg@mail.gmail.com>
In-Reply-To: <CAD=FV=WT4Hf1XVA641WtNFg4WRYFKarU1WOkLPEbr0eiVQuZPg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 13 Sep 2023 08:34:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UpJEFKcsnHSzPqEiGaWusp50DrcEh=mcra4eLeRQT5NQ@mail.gmail.com>
Message-ID: <CAD=FV=UpJEFKcsnHSzPqEiGaWusp50DrcEh=mcra4eLeRQT5NQ@mail.gmail.com>
Subject: Re: [RFT PATCH 01/15] drm/armada: Call drm_atomic_helper_shutdown()
 at shutdown time
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 5, 2023 at 7:23=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Sun, Sep 3, 2023 at 8:53=E2=80=AFAM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Fri, Sep 01, 2023 at 04:41:12PM -0700, Douglas Anderson wrote:
> > > Based on grepping through the source code this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > time. Among other things, this means that if a panel is in use that i=
t
> > > won't be cleanly powered off at system shutdown time.
> > >
> > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > instance overview" in drm_drv.c.
> > >
> > > This driver was fairly easy to update. The drm_device is stored in th=
e
> > > drvdata so we just have to make sure the drvdata is NULL whenever the
> > > device is not bound.
> >
> > ... and there I think you have a misunderstanding of the driver model.
> > Please have a look at device_unbind_cleanup() which will be called if
> > probe fails, or when the device is removed (in other words, when it is
> > not bound to a driver.)
>
> ...and there I think you didn't read this patch closely enough and
> perhaps that you have a misunderstanding of the component model.
> Please have a look at the difference between armada_drm_unbind() and
> armada_drm_remove() and also check which of those two functions is
> being modified by my patch. Were this patch adding a call to
> "dev_set_drvdata(dev, NULL)" in armada_drm_remove() then your NAK
> would be justified. However, I am not aware of anything in the
> component unbind path nor in the failure case of component bind that
> would NULL the drvdata.
>
> Kindly look at the patch a second time with this in mind.

Since I didn't see any further response, I'll assume that my
explanation here has addressed your concerns. If not, I can re-post it
without NULLing the "drvdata". While I still believe this is unsafe in
some corner cases because of the component model used by this driver,
at least it would get the shutdown call in.

In any case, what's the process for landing patches to this driver?
Running `./scripts/get_maintainer.pl --scm -f
drivers/gpu/drm/armada/armada_drv.c` seems to indicate that this
should go through the git tree:

git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-armada-devel

...but it doesn't appear that recent changes to this driver have gone
that way. Should this land through drm-misc?

-Doug
