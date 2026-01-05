Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDBDCF505E
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C0310E05B;
	Mon,  5 Jan 2026 17:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AmXx33uz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F0310E05B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:39:52 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b8010b8f078so40496266b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 09:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1767634789; x=1768239589;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NaYcqNx5rMYLhdSC0kSUgZT1tN8fo/ryKgabcNZ/bCw=;
 b=AmXx33uzxMxEZCDZCYo6MEX8hAaz3QrUZzT7Ila6JkxCvkaIAOK2pPMzN0byU6WT51
 9ihWcQ3MMHB1Xk3JTW2ymXqPiJ2RNLidcvAi+cvWAyijVBucU2MUliBF8IH0VGepAoOg
 oAw9ooQ1L5wx5kZZL8mbW79XMDpEyjTnIjqug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767634789; x=1768239589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NaYcqNx5rMYLhdSC0kSUgZT1tN8fo/ryKgabcNZ/bCw=;
 b=DbFCVZcZq/9Nf8eL4PbJtMYkFwxa1DsNvErql6ykG/bD2+Y5CceDtxEuPWO3AMuccm
 qTr+bFmp49lJxRFWe+LHq5jaOVmZytRzJtsKWd14gsriFAt8RFtgY1XrmfHKIfgpKYmG
 sEskjYbqhFpDtDSzij60Tpw3tQjf5rDF50pcDFX95By3UA+9KGnTENA9ameA0iaVEHU2
 jDiYEYVLUhR5BGhFCL2Z7OR6L3O5zUlQ4Ixy9PCeQlVbB+5dAMciUhH31IR1VDmQv9UQ
 MyNSXL7grfMFY2JcUqS6ykbtgbMbSzI5tNFxnM4rKtzxtLxUX1ITwgIWXRs+kEA/QQJf
 0Y+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiFoYGNl1sCk9G3ZjWHcy/yY7A02xfkWmy2jPQp5xBsH5K3WasQqPBGG9MeIsCxeLi0d9/wIhR8uQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB5wrK2CyVlj0PJP4lgMfUNStRdbzPlVk57Ukq1Um7WXgGdmTf
 xtYZ986yygZ5zNg05H2o1tlIdgUKryJv8I4XsTRckgnQjmBGAVn5RCqqWQWb5dXFtYxPhFO2nVr
 MzXzUNQ==
X-Gm-Gg: AY/fxX6io1IcD/hZhpFXwodeXeqo0X4XgvO7KgHCQZPumBE33dE/0W4UIg8+rLmEkjw
 CRPN0s39rgXedjQw+U7xazEAWngk7AtghNWHhNSo59qdMf142plTO9Tx7UdQz1x6WqDjAxXBnjc
 WIKD68jGUb6GXxywAe5dvPq81Q1PIHjMWB2pAQDfP0izD6yefordDNV2TkQH/+dbp3DDoJvw1fG
 RzNkDxhx/BLSOIwhmssPvAb0zFvE99hGVuEzQ7syXbeBfD+Td4hZpD9gxRbLhSQ23Ddkn4RGYwC
 ocuXfYPEH4nL8sYSO6gmVJGl0WZ0mQPnIAR6V3u5JKqPZj+m4Ym8BKuITgkm2swD1C4Zm820wJh
 TbRdNpC6c0EijSbYnQ/mQGSRSZfqWEx8RDBA1GB+hjqI4or+Hfrg+oiUN07sILCxVS9YEUaqRhs
 Yq3swEBTv0E59Qj+APbFkvg4EnES3iWGVIi4ejWyG9f8AlODaj+Q==
X-Google-Smtp-Source: AGHT+IFyLsL31B7mO5ZIKcBslHDnbzNXKs96ZGjipBfM2pILqy28xjfnW25fW8uba7y6jNsB5GYjmQ==
X-Received: by 2002:a17:907:1b04:b0:b7a:39a2:7f50 with SMTP id
 a640c23a62f3a-b8426bb943fmr59008666b.39.1767634789253; 
 Mon, 05 Jan 2026 09:39:49 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842678aac7sm47200166b.56.2026.01.05.09.39.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 09:39:47 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-430f5ecaa08so54754f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 09:39:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUdPIfHoLoYS2kK7i/PWZpzANiuIHGDuQ04UOkEVRbjk8bAtHj4+lA4GIYewiFP1jA1OICjh+nmSYo=@lists.freedesktop.org
X-Received: by 2002:a5d:64e5:0:b0:42f:b581:c69d with SMTP id
 ffacd0b85a97d-432bca2cba0mr696796f8f.3.1767634787333; Mon, 05 Jan 2026
 09:39:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767111804.git.robin.murphy@arm.com>
 <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
In-Reply-To: <bc54c6c700a4be244bd4f81cb846cf628313a6ee.1767111810.git.robin.murphy@arm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 Jan 2026 09:39:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VB9XOm33VvsTN4cd22rBf9A-7ie4hN80TAByciQropfg@mail.gmail.com>
X-Gm-Features: AQt7F2olhV1Qt_uuATpZxGz_1-vircsLH4yPAB7cIo-0B798684oC2-AXT17Qsc
Message-ID: <CAD=FV=VB9XOm33VvsTN4cd22rBf9A-7ie4hN80TAByciQropfg@mail.gmail.com>
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

On Tue, Dec 30, 2025 at 9:21=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> +&{/} {
> +       pwm_bl: backlight {

nit: up to you, but I happened to notice that other rk3399 boards just
use the label "backlight:" instead of "pwm_bl:"


> +               compatible =3D "pwm-backlight";
> +               pwms =3D <&pwm0 0 25000 0>;

40kHz is awfully fast for a PWM backlight. Are you sure you need it that fa=
st?


> +               enable-gpios =3D <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;

Not that I'm doing a thorough review here, but I happened to notice
that you're referring to a GPIO without adding a pinctrl entry. I
think the usual convention is to add one.


> +               brightness-levels =3D <0 255>;
> +               default-brightness-level =3D <200>;
> +               num-interpolated-steps =3D <255>;
> +       };
> +};
> +
> +&edp {
> +       force-hpd;
> +       status =3D "okay";
> +
> +       aux-bus {
> +               edp-panel {
> +                       compatible =3D "friendlyarm,hd702e";

As per my response in your driver patch, any chance this can just be
"edp-panel"?


> +                       backlight =3D <&pwm_bl>;
> +                       no-hpd;
> +                       power-supply =3D <&vcc12v0_sys>;

While not strictly required, it seems highly likely that you want
"hpd-absent-delay-ms". It's highly unlikely that you would have
"no-hpd" plus a "power-supply" but no hardcoded delay to wait here. I
haven't seen panels that turn on and respond instantly.


> +
> +                       port {
> +                               panel_in_edp: endpoint {
> +                                       remote-endpoint =3D <&edp_out_pan=
el>;
> +                               };
> +                       };
> +               };
> +       };
> +};
> +
> +&edp_out {
> +       edp_out_panel: endpoint {
> +               remote-endpoint =3D <&panel_in_edp>;
> +       };
> +};
> +
> +&i2c4 {
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;

The base dts already specifies #address-cells and #size-cells, right?


> +       touchscreen@5d {
> +               compatible =3D "goodix,gt9271";
> +               reg =3D <0x5d>;
> +               interrupt-parent =3D <&gpio1>;
> +               interrupts =3D <RK_PC4 IRQ_TYPE_EDGE_FALLING>;
> +               irq-gpios =3D <&gpio1 RK_PC4 GPIO_ACTIVE_HIGH>;
> +               reset-gpios =3D <&gpio1 RK_PB5 GPIO_ACTIVE_HIGH>;

There's no power supply here, so I'll assume it follows the power
supply of the panel? You probably want to be a "panel-follower" then,
right? AKA you'd want to add a "panel =3D " node here to refer to your
edp-panel.

Oh, except that the goodix driver you're using doesn't support
panel-follower. That's annoying. I guess you'd have to add support for
that (see history around "is_panel_follower" in "i2c-hid-core.c")?
Without it then I assume you'll just be lucky that things work? ...or
you'd need to mark the power supply as always-on?

I guess I can also note the same comment that there is no pinctrl for
your GPIOs here.

-Doug
