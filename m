Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24167CF585F
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 21:28:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFB210E1ED;
	Mon,  5 Jan 2026 20:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="m1Jd4w0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBDD10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 20:28:34 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-64ba9a00b5aso410141a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 12:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1767644910; x=1768249710;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50xGHnyMAYMUW9mHIcf/4vlyevvh06h79/UItY38+Nk=;
 b=m1Jd4w0ugRahVwe1ECCTBb/mgM8+umqy335ThOlryDKQjsFvuqehnfazGzNKEGRaWc
 L41MYnXgO1g7Xcv4OQUwICsi6R1b2/yl6B1h5v++mWb4bk/JHZn8hXN0r9aS9YyEThMY
 PG/4X2MazylCjIMLigVYbpTrWsbStNdoyzTGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767644910; x=1768249710;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=50xGHnyMAYMUW9mHIcf/4vlyevvh06h79/UItY38+Nk=;
 b=qMRr8L9bncuIkava3/V36m8CW4IPbOEnU2xe+/YSBBhRxTYb8Ct+E35fdACHmjLo6f
 FVDC/4iazshiNKst8nQboQrvzq7/I8wsUdKt8nBNXm1PDMBj75YnpdnkZgY0DpGCvTEB
 awiSN5+Re66CaLs5t8dSsqv8AP0bk2LAafvmQg41zJZqZAQrSncyOmnIE6AP0+N1HH9s
 7Y2igNXzDN5fm8B4naSufHLDa901lu+N72NoZBsfioOFtSFYnNzawt76ZPv7ELTgsTCJ
 IAFqf7QUdUSBq+G1X+IMoI7irBQ5wLq4gNB0qlWd6jlzMlJiTcj18PNxQRiuQwcw6ZwG
 n/Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuTimtG1ZvSuzwvBuN+nZpp+0ev84IFdEvoXSJrLiFa/lfd/oy/mLA+BHuAaM/d4t/0HI8j9Y53wY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMWS8EkszLtCCyAJYfYTxq2ouD45lXJ7NkmZ+61mzDnw/zisHY
 ayo9Or8NhaSGYbZQC3ge0pq8yO4bO9R8Yws4WzT1UhqjxEBONdd6dEWipgvcxP/Vti7SOX/XZ9F
 RrcUplQ==
X-Gm-Gg: AY/fxX7XsCoCdP2vnMzmsmifBQwhpvVpSAUYbGjYByOJPwaF2677n0RSwB/8caxPK19
 Tf3rhx//PQuHatigIF2SwnjBqiVJGVk567cqRXkymu3/Css77iXAOBZ1ZzmEwq1cVx1K3BDuNVu
 PKdh77Jt0vYM6Q3nV5zM+JC1s1XXPWj2lnzaud8F2ok9Bz90z1UpWgp4KKY0m6QQteYQeC+tZ5H
 l3jR2IjzKHGTytYStok2zOuSzxlnvmx3WzrSodgP83RF8FcuE3UlAA8zceebJR4bTjrDvZMIZnx
 AZVowINSYfHQ/Xw3Pe8czC0V27DUl7eKb1wWCN9sCIvTaqTQarjIfIcrE5727HYP+mdmpUOK4F+
 4fY3ME1NS81M+MEKJsm/nPl4Z0vJybMVFEcPpnZoEKtF6E6QiwiUS5Zrn61NBukrYycbjxu3XVz
 eqghRqSheGJN9dH5WuXqPeEDwj8c3iaPXquui2GY9RXsmRkMeNA7r8el9BHMz7
X-Google-Smtp-Source: AGHT+IFpZvHPcnnYMfSaHOVOrZT5LNdOPanpMcYAoBM0KHj9Itpcazl3DqpiHrph7i5LAECrQkxXDw==
X-Received: by 2002:a05:6402:2688:b0:649:d81b:7b7e with SMTP id
 4fb4d7f45d1cf-6507931ff57mr598680a12.8.1767644910076; 
 Mon, 05 Jan 2026 12:28:30 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c4454sm343414a12.3.2026.01.05.12.28.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 12:28:28 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so3567425e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 12:28:28 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWq6nqw6/oClef6o990v2etpcM+Ou0HPjtdVzb0loU0367NJ5paeLriNmpPwkWxQPEqvNP9e5vcDyU=@lists.freedesktop.org
X-Received: by 2002:a05:600c:3115:b0:47a:80f8:82ab with SMTP id
 5b1f17b1804b1-47d7f0988c5mr8202775e9.24.1767644908290; Mon, 05 Jan 2026
 12:28:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767111804.git.robin.murphy@arm.com>
 <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
 <CAD=FV=VB9XOm33VvsTN4cd22rBf9A-7ie4hN80TAByciQropfg@mail.gmail.com>
 <c76ae679-d05a-4192-8ffe-189649799ee4@arm.com>
In-Reply-To: <c76ae679-d05a-4192-8ffe-189649799ee4@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Jan 2026 12:28:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WKxCj6Wix0rvRpfuDMyM63oxgOZT1eVpphqtprr96_wg@mail.gmail.com>
X-Gm-Features: AQt7F2pkJeH8zNGpw_MUiT4YReeWLIU1tcbaA-2NAGp7RJZED21e57oHRAgpJJQ
Message-ID: <CAD=FV=WKxCj6Wix0rvRpfuDMyM63oxgOZT1eVpphqtprr96_wg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Add overlay for FriendlyElec
 HD702E
To: Robin Murphy <robin.murphy@arm.com>
Cc: heiko@sntech.de, neil.armstrong@linaro.org, thierry.reding@gmail.com, 
 sam@ravnborg.org, jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Hi,

On Mon, Jan 5, 2026 at 11:39=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> >> +&{/} {
> >> +       pwm_bl: backlight {
> >
> > nit: up to you, but I happened to notice that other rk3399 boards just
> > use the label "backlight:" instead of "pwm_bl:"
>
> Sure, if you prefer.

Totally up to you--I was just comparing what you had to what other
rk3399 boards had and the fact that this was different made it take 15
seconds longer to find the PWM backlight on the bother boards. :-P


> >> +               compatible =3D "pwm-backlight";
> >> +               pwms =3D <&pwm0 0 25000 0>;
> >
> > 40kHz is awfully fast for a PWM backlight. Are you sure you need it tha=
t fast?
>
> I guess I just copied this from somewhere without too much thought, but
> double-checking the schematic[1] now, the backlight driver where this
> signal ends up is apparently a SY7200A, whose datasheet says "And the
> recommend dimming frequency range is 20kHz~1MHz." So relative to that
> range it doesn't seem too bad!

OK, cool! I just know in the past that I've seen cases where people
copied the PWM values from elsewhere and ended up wildly out of spec
without really noticing. :-) Sounds like you're good.


> >> +&edp {
> >> +       force-hpd;
> >> +       status =3D "okay";
> >> +
> >> +       aux-bus {
> >> +               edp-panel {
> >> +                       compatible =3D "friendlyarm,hd702e";
> >
> > As per my response in your driver patch, any chance this can just be
> > "edp-panel"?
>
> Per the cover letter, I did try...
>
> >> +                       backlight =3D <&pwm_bl>;
> >> +                       no-hpd;
> >> +                       power-supply =3D <&vcc12v0_sys>;
> >
> > While not strictly required, it seems highly likely that you want
> > "hpd-absent-delay-ms". It's highly unlikely that you would have
> > "no-hpd" plus a "power-supply" but no hardcoded delay to wait here. I
> > haven't seen panels that turn on and respond instantly.
>
> ...but even with both delays bumped up and up and up to a ridiculous
> 2000ms it still didn't work. It reads the EDID as all-zeros then fails
> to probe due to a lack of modes. Whereas with the hard-coded mode, the
> display lights up immediately upon probe, so I don't think it's a timing
> issue. My working theory is that there's some fundamental ordering issue
> based on the comments in analogix_dp_detect_hpd() about aux not working
> until HPD is forced at the controller end, and from a brief skim of the
> history, quite possibly related to f2600d08d4e8 ("drm/bridge:
> analogix_dp: Improve panel on time") which maybe prevents that happening?
>
> By that point it's well beyond my expertise, hence my conclusion that
> since I'm not *adding* the legacy panel data, just rearranging what's
> already upstream to finally put it to proper use, that's just about
> acceptable :)

OK. It's unfortunate, but fair enough. :-) It would certainly be
interesting to know what eventually makes the EDID read correctly, but
I agree that it's a bit much to ask you to debug that.

FWIW, I took a _quick_ gander at the schematics you sent, and I
actually wonder if it's the "backlight" enable signal that you need.
Depending on the stuffing options, maybe that connects to the PWRDN
pin? If I trust the stuffing options in the schematic that GPIO
doesn't connect to anything at all, but I know stuffing options on
schematics aren't always right... In any case, it's also OK to just do
what you're doing...


> The power-supply entry is really just for cleanliness, to avoid a "dummy
> regulator" message - the screen module has all its own regulation on
> board, which didn't seem worth modelling in detail as it's all fixed and
> always-on, but the source is the board's main 12V input, so that much
> *is* true.

Fair enough.


> >> +&i2c4 {
> >> +       #address-cells =3D <1>;
> >> +       #size-cells =3D <0>;
> >
> > The base dts already specifies #address-cells and #size-cells, right?
>
> Indeed, but dtc doesn't know that when compiling the .dtbo in isolation.

Oh, right.


> >> +       touchscreen@5d {
> >> +               compatible =3D "goodix,gt9271";
> >> +               reg =3D <0x5d>;
> >> +               interrupt-parent =3D <&gpio1>;
> >> +               interrupts =3D <RK_PC4 IRQ_TYPE_EDGE_FALLING>;
> >> +               irq-gpios =3D <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> >> +               reset-gpios =3D <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;
> >
> > There's no power supply here, so I'll assume it follows the power
> > supply of the panel? You probably want to be a "panel-follower" then,
> > right? AKA you'd want to add a "panel =3D " node here to refer to your
> > edp-panel.
> >
> > Oh, except that the goodix driver you're using doesn't support
> > panel-follower. That's annoying. I guess you'd have to add support for
> > that (see history around "is_panel_follower" in "i2c-hid-core.c")?
> > Without it then I assume you'll just be lucky that things work? ...or
> > you'd need to mark the power supply as always-on?
>
> Yeah, as above it is in fact always-on anyway - somehow I missed that
> the goodix driver is getting regulators too. The 12V input is stepped
> down to a main VDD_3.3V rail from which everything else is derived, so
> if I add a fixed-regulator node for that which is sufficiently close to
> the truth for both these and the panel supply, would that be clear enough=
?

Sure, it's fine from my point of view. Really pretty much all of the
dts is up to Heiko. I'm mostly here because of the eDP-panel stuff.
;-)
