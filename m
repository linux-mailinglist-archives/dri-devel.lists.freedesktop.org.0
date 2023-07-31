Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B258376A187
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 21:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DA210E082;
	Mon, 31 Jul 2023 19:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA4210E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 19:51:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3175d5ca8dbso4348462f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690833066; x=1691437866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PRr3pkV1Vuke2vElNk+azJI1sxDTVkFcTqoaWn2MjDg=;
 b=H7qjJTJTluojxj07lt9FQgXtsw0rVi++pV6xndtf9uWrl9f2ndOFHJlZn652P4qtAq
 xLYwqfJnm4H1JYNBiqxfyWIpqjeSGScoRI/o5x75wLl9CKnknv4P4B6scqtQ3v93prtl
 KrX4jNLbSc4UOp71LZDzuapU2USGFf//BVDT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690833066; x=1691437866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRr3pkV1Vuke2vElNk+azJI1sxDTVkFcTqoaWn2MjDg=;
 b=d21vqtSsXlqbF3DScuyotMCSVJK/7cCB+puJ+gux0jGljStmo9qEvnIdHOPU+kb1LM
 yCbFqob/EejXJAfDlFyPP8foZ6ar46Y1AC9ndhA+Ilr67zhp6hIensTZppPOB8BZuAtp
 pEkDwoS41fIUFjZm5kXO1tEZ/tJbWEhwpkuoSk+rAu4d83xgtYGp4zAqTHUw1paREtu2
 cBrjnOu0ZIj4u8x84hhf8a8uH7M4EQ4nG+YpJvIxf+Tm++M0Svk+Xt4VF50OYBIu7oKq
 Ouvrj3kXe/F4ilggGua3RX3mFpvOZs2CN8Zdu4kqvuPvscEGXEnw0HfvcMEfty2KoNwr
 joEQ==
X-Gm-Message-State: ABy/qLY/lIAvffSWu2qqu0xcV4z4YaiMIwm9X2kbybQVP027YI3wyHd8
 wFgxWLTaZzr522lc25DUsqAh9pWBGqLWR1/bztKaJg==
X-Google-Smtp-Source: APBJJlFQyXgA8lhwYQYHoVMupXcQCKzcsRj9styLWfNGRLjwdnEaQghcoZnOzx6JpYupXVMULIspBg==
X-Received: by 2002:a5d:4e04:0:b0:315:901b:e795 with SMTP id
 p4-20020a5d4e04000000b00315901be795mr628689wrt.13.1690833065858; 
 Mon, 31 Jul 2023 12:51:05 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 va16-20020a17090711d000b00992aea2c55dsm6626884ejb.153.2023.07.31.12.51.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 12:51:05 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-521e046f6c7so167a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:51:05 -0700 (PDT)
X-Received: by 2002:a50:9fca:0:b0:522:cc9c:f5a4 with SMTP id
 c68-20020a509fca000000b00522cc9cf5a4mr112533edf.4.1690833065104; Mon, 31 Jul
 2023 12:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230709135231.449636-1-marex@denx.de>
 <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
 <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
 <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
 <34985434-7ee4-d86e-e157-9ad670315315@denx.de>
 <CAD=FV=XAk423Z34ebiooHO874GmUf5BgssyQm4_HieCGhs7E_A@mail.gmail.com>
 <594f8182-b74d-6ef2-0d90-74061b35bc50@denx.de>
 <CAD=FV=VXMsZ-kUOgd32LnjBP4eP-j0rbiDhF6O0wSAQsEB5mng@mail.gmail.com>
 <2a6e338d-36ef-6836-bc9d-ef1f727463a4@denx.de>
In-Reply-To: <2a6e338d-36ef-6836-bc9d-ef1f727463a4@denx.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Jul 2023 12:50:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X17TEovhxm9Wh9qX0RZXAO3Km0coYnfnoO=nsr=doUFw@mail.gmail.com>
Message-ID: <CAD=FV=X17TEovhxm9Wh9qX0RZXAO3Km0coYnfnoO=nsr=doUFw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
To: Marek Vasut <marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 31, 2023 at 11:03=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 7/24/23 15:49, Doug Anderson wrote:
>
> Hi,
>
> [...]
>
> >> Maybe the EPROBE_DEFER actually happens and triggers the failure ?
> >
> > I could certainly believe that EPROBE_DEFER is involved.
>
> So no, it is not. It is difficult to set this up and access the signals,
> but so I did.
>
> What happens is this:
> panel_simple_probe() calls devm_regulator_get()
>    -> If the regulator was ENABLED, then it is now DISABLED

As per my previous response, I don't think this is true. This was the
part where I referred to `Documentation/power/regulator/consumer.rst`
which said:

NOTE:
  The supply may already be enabled before regulator_enabled() is called.
  This may happen if the consumer shares the regulator or the regulator has=
 been
  previously enabled by bootloader or kernel board initialization code.


My belief is that what's actually happening is that when the regulator
_probes_ that the regulator turns off. In Linux GPIO regulators cannot
read the state of the regulator at bootup. That means that when the
regulator itself probes that Linux has to decide on the default state
of the regulator itself. If the device tree has "regulator-boot-on"
then Linux will turn the regulator on (even without any clients). In
this case the regulator will stay on until some client enables and
then disables the regulator, or until the regulator boot timeout
happens and all unused regulators are powered off. If the device tree
doesn't have "regulator-boot-on" then Linux will turn the regulator
off.


>    -> For regulator-fixed, this means the regulator GPIO goes HIGH->LOW
>
> panel_simple_prepare() triggers panel_simple_resume()
>    -> If this occurs too soon after devm_regulator_get() turned the
>       regulator OFF and thus regulator GPIO low, then unprepare time is
>       not respected =3D> FAIL
>
> Since there is no way to find out in which state the regulator was when
> devm_regulator_get() was called, we have to wait the full unprepare time
> before re-enabling that regulator in panel_simple_resume().

So just as a point of order, do you agree that prior to the commit
that you are "Fixing" that we _weren't_ doing the full delay at probe
time? That means that if things worked before they were working by
some amount of luck, right? The old code used to do a delay after
turning _off_ the regulator (at unprepare time).

I will also continue to assert that trying to fix the problem via a
delay in the probe of the panel code is the wrong place to fix the
code. The problem is that you need a board-level constraint on this
regulator (off-on-delay-us) preventing it from turning on again within
a certain amount of time after it is turned off. This allows the
regulator framework, which is what decided to turn this rail off
during the regulator probe, to enforce this constraint.


-Doug
