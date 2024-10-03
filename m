Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6A798EC46
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 11:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D37D10E7DB;
	Thu,  3 Oct 2024 09:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jkAQUJLG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE75710E101
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 09:27:48 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37ccebd7f0dso530011f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 02:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727947667; x=1728552467;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8evBbk/IwxxgJLl6adf7U2FK+xKf3XGZPnSLuIWsvAs=;
 b=jkAQUJLGgOSq6YnbapxYLW6KOERs1D1jB1rT5yjA2dvbdPB4YauysI98mb/NU5mbNO
 qawFsHx5VjRjmgtt1OIhTGIH85wGN0xS81bBgEJ3NNyTMFcXOYfQCoJUzc0Cm0D/zEK4
 oro7UrIyySzzWMCxKtuxprbcZSXoG3w4/lwzYNrPos2G71GP1YaqBoxlanzT1pimmUQS
 XcpmmLF2NsXj49Yp1zrZJaOd8J6VY+3cXYOQKsFHJG+pSSpMTkb8lZjcjv0CjmxQZVhx
 VdNKae5pMcnxlFOXOSbKTnjttBu8i0UzD84s2Ph1rApsnchVuobQa8NcHEcUC3P3HQfI
 gNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727947667; x=1728552467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8evBbk/IwxxgJLl6adf7U2FK+xKf3XGZPnSLuIWsvAs=;
 b=clBbtMY6xB6fyJ2qku0K34tNm9QSwgvktUzgpKcL/VfP4VWLu1VbbLFFTYF9wF6G/W
 o2RFWTHOaIrQsaHaj6BhfS7GBwIC1jHULqhld6SOUT9Q3etUMvGiozzCF/hIIqo+yV6v
 29hHmxoIL7LT4qL6Q1baUP6xoDMlnyTwv0TGD1VDugi2oBbXZxoJa0i2VyvWIoM7YEjI
 LzIfbtXgYAaYt3ujwsVkfPyCGUhAGnkxgiyBzoK1Gez5/SOpvs/S8G1b61XqsHVAjxwf
 rHyYUsZj2voDVH06tXRL2+AJMszlSsAl45PvRbSNX3gnuHhWZpv7YsMR5k3Dm/vy8QoR
 DwKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoYUEV0+TWW9GBx8A5OpjlNdxpw3fqatV+dTYoszOQzN/wj8/r4zOFcooM5pTbf3wkMIamEIqc3Oo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqwDw/x+48gTtJdKV1lxAfNlSx4lkTU+CSv+qbxEACsqq1hHP8
 wGXJBInlySeVAd3lv5ZDWBVACWOMiQl3No99Yq7Cu+sGseBO/wnyaOiX1xBG65Q=
X-Google-Smtp-Source: AGHT+IHekoCrEouitVYfb8Yy3HlP99xd5ZykhItjucwYVLFSB9uXwVt08HFWHlBeglYtqaJQ2Pm8Mg==
X-Received: by 2002:a5d:4a90:0:b0:37c:d344:8b42 with SMTP id
 ffacd0b85a97d-37cfb8b2ec0mr3807558f8f.15.1727947666441; 
 Thu, 03 Oct 2024 02:27:46 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d08242d79sm847425f8f.51.2024.10.03.02.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 02:27:45 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:27:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Message-ID: <q53inyaxyvfib7okxzazepxzarqmq4rubbasumvvx2woioyp42@fbtn4poujsyh>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
 <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>
 <ees3m2qmazah2547ys62zvbrvo4dsgki2z2jwulwz4dfjtm4hk@kpmlapv6occv>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s5o77kb33dofvcnw"
Content-Disposition: inline
In-Reply-To: <ees3m2qmazah2547ys62zvbrvo4dsgki2z2jwulwz4dfjtm4hk@kpmlapv6occv>
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


--s5o77kb33dofvcnw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Wed, Oct 02, 2024 at 10:33:13PM -0400, Alex Lanzano wrote:
> On Wed, Oct 02, 2024 at 09:56:38AM GMT, Uwe Kleine-K=F6nig wrote:
> > On Tue, Oct 01, 2024 at 11:37:35PM -0400, Alex Lanzano wrote:
> > > Changes in v8:
> > > - Addressed review comments from Uwe
> > >     - Replace pwm_get_state with pwm_init_state
> > >     - Use pwm_set_relative_duty_cycle instead of manually setting per=
iod and duty cycle
> >=20
> > You didn't explicitly mention that it's fine if the PWM doesn't emit the
> > inactive state when you call pwm_disable(). You're code should continue
> > to work if you drop all calls to pwm_disable().
> >=20
> > Ideally you mention that in a code comment to make others reading your
> > code understand that.
>=20
> Sorry about that! The intent of the code is to stop the pwm from outputing
> when the display is disabled since the signal is no longer needed. If
> it's best to emit the inactive state rather than calling pwm_disable()
> I'm fine with making that change.

Calling pwm_disable() is best iff you don't care about the output any
more. If however you rely on it to emit the inactive level,
pwm_disable() is wrong. I don't know enough about your display to judge
=66rom here.

The code to disable the display looks (simplified) as follows:

	if (smd->enable_gpio)
		gpiod_set_value(smd->enable_gpio, 0);

	pwm_disable(smd->pwm_vcom_signal);

so maybe the logic you need is:

	if (smd->enable_gpio) {
		gpiod_set_value(smd->enable_gpio, 0);

		/*
		 * In the presence of a GPIO to disable the display the
		 * behaviour of the PWM doesn't matter and we can
		 * just disable it.
		 */
		pwm_disable(smd->pwm_vcom_signal);
	} else {
		struct pwm_state state;

		/*
		 * However without a GPIO driving the display's output
		 * enable pin the PWM must emit the inactive level,
		 * which isn't guaranteed when calling pwm_disable(), so
		 * configure it for duty_cycle =3D 0.
		 */
		 pwm_init_state(smd->pwm_vcom_signal, &state);
		 state.duty_cycle =3D 0;
		 state.enabled =3D true;
		 pwm_apply_might_sleep(smd->pwm_vcom_signal, &state);
	}

?

Best regards
Uwe

--s5o77kb33dofvcnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb+Y40ACgkQj4D7WH0S
/k6Jjwf/VkhVbrj5zZduvEjBR6Ryq5075XnahyFTpoqckqRcE+V8H/OzEfaT7fsA
VAT9CFZPEfJ02N0jj2m4V82vzDlwk8m9Tiw0b8m5eFB3NeJLpKUh4Fi4Np3Lp5AK
jIiCwhOEUY6Iw1bWsW2qj66Cism13MQ0tUlq43y7lxHNI/RzrysnZxYFX0FGCfkg
PDQp7WW3JWJF3uH4yr1Mycw1gSzd0ECUG0/VG4rwiqc+jr7H2FYU3tcnVZgNPsD4
Na680Wj75PWN6l5SYDEj04196IvNGz2psPJqxpaWwrtHquBLYQ/MvNXJ3XX21PnV
k4ppnw4FCPFAuN7nTlta4MWjKi66gA==
=YxME
-----END PGP SIGNATURE-----

--s5o77kb33dofvcnw--
