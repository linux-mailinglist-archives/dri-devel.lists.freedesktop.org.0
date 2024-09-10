Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69FF97304B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 11:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE5E10E75F;
	Tue, 10 Sep 2024 09:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gTvRXqMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A0210E75F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 09:59:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374c7d14191so3510186f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725962375; x=1726567175;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OxZS7VLlvlNcdBPu4dATlqzqCH0SG09iCapcqr1ry4w=;
 b=gTvRXqMm6BvTq2D/HCkfcj3xN0no26FR3yQyVoWPIlkNBUcGOQAGCUNgVtXD4QF5vl
 6StsuOrjEeFnt9iL20h0cTUtN9N2vT1HvddbSFg7NiB58PfKIpfOR/dbZFH0qQL8WZN0
 GzZRhboMJ+IY8pRlo3zzb+rtksW0PchOUrsbukAJBzm/YA86imFCxOGJN/LRAmsU3LUD
 NwdJ0aOeqG+yVwe+mKllTdsVPyJypRcXRE5KANICOoF9EmCCjqQFEImhYvobTUTZGEa0
 qb3Uo88clLvkb2nXTlRCfSOH6R4rTShREHTgxrPMT5xfF4mT8gjzEPuMzfi+FMN+ml3g
 CGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725962375; x=1726567175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OxZS7VLlvlNcdBPu4dATlqzqCH0SG09iCapcqr1ry4w=;
 b=Wy/4pP6dx43CHWX3iZEBUjwMmByfSJXlTvfjFRjtsVRgfZ1caGyz0+7MToaG4VnBDC
 Wxr0/ZxPX9C+SRzfisF2e8X8TlF+MJgP1aSbI1F9m17qJwvdJOrKVoEZp2zuCz76CmEv
 mbpoBM3mRon1ExREjULZ57EUVuam3rlB+XuLVqP2Wgrlb0BCyZ/2O6qL+9xup6a7H7LE
 MWPWc6rtu/lysLhXw32aRIiuPT4NcFpKdR3QPbOU24N58phDccwLSG7QdRbvMWn0lujB
 ex5fhFqwD48xYISnQ6hLtrVelBEuBO49DCu3GpM66u5Cq8JvQgZ9FndHchHIiu9AOIav
 ggNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE0TaznBm4uKD7X47+kbPno8sqtb0h6tmBs3IKiDYnI0ch2Z1+k91CFnfUAoCJezYsQ9sZ1jF63O8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwehOW1JZ+3R+HPTFfCMpevOxM8gUEgsCoxzUDYrV/jnWYlIiI1
 /W0zMnSkj7021KVlnwqLF7n1cdOOw/CfyH1HV2jPterNKQM8FNL2tvRnPKGDq/s=
X-Google-Smtp-Source: AGHT+IEtmAPvqyyaWuRoKy32eCJyGneGNTbPJN2tRd224P8AECPcesi7ike/qTX7P5GRwYiq+pSdJw==
X-Received: by 2002:a5d:46ca:0:b0:374:c3e4:d6e3 with SMTP id
 ffacd0b85a97d-378a89fd45fmr1331874f8f.5.1725962375253; 
 Tue, 10 Sep 2024 02:59:35 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789564a072sm8465192f8f.2.2024.09.10.02.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 02:59:34 -0700 (PDT)
Date: Tue, 10 Sep 2024 11:59:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: dmitry.baryshkov@linaro.org, Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 27/28] gcc-sdm845: Add general purpose clock ops
Message-ID: <uevafpb6r7rfutiqrm5asfvv7zfxcb3acrlxqpispele5er52x@eegonpzqlm7j>
References: <20240719-starqltechn_integration_upstream-v4-0-a7f644821941@gmail.com>
 <20240719-starqltechn_integration_upstream-v4-27-a7f644821941@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d2rlzxmgwshy2k4w"
Content-Disposition: inline
In-Reply-To: <20240719-starqltechn_integration_upstream-v4-27-a7f644821941@gmail.com>
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


--d2rlzxmgwshy2k4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jul 19, 2024 at 03:55:04PM +0300, Dzmitry Sankouski wrote:
> SDM845 has "General Purpose" clocks that can be muxed to
> SoC pins to clock various external devices.
> Those clocks may be used as e.g. PWM sources for external peripherals.
>=20
> GPCLK can in theory have arbitrary value depending on the use case, so
> the concept of frequency tables, used in rcg2 clock driver, is not
> efficient, because it allows only defined frequencies.
>=20
> Introduce clk_rcg2_gp_ops, which automatically calculate clock
> mnd values for arbitrary clock rate.
>=20
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg.h    |   1 +
>  drivers/clk/qcom/clk-rcg2.c   | 162 ++++++++++++++++++++++++++++++++++++=
++++--
>  drivers/clk/qcom/gcc-sdm845.c |  19 ++---
>  drivers/pwm/pwm-clk.c         |   5 ++

I don't understand why a change to some qcom clk implementation detail
needs a change to drivers/pwm/pwm-clk.c in the same commit. I guess if
the change to drivers/pwm/pwm-clk.c is needed it should better go into a
separate patch with an appropriate commit log?!

Best regards
Uwe

--d2rlzxmgwshy2k4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbgGIIACgkQj4D7WH0S
/k7x2AgAluuv/f/FtpsMhu/tAKjHUOr1Y+1vUefo+pFCKzhUDjMyHMtIz8by9GsE
1pZ9fiw/to0h6iyEctQmMN3sqoMqkEwL4aKMYb9WOopkDgY36I7oAWjXs4mio6Ed
DPguLwTovw/p+OJMmgb/ndu5GNyQCb9AsmjekXGIx4ZVDJPX3pc8v/DX5HQj2y3x
sCi8NmmXABsckLz42oxrky2ZGcNmFddqBJxJdgjVcXfa5BEetdtLnUhmtmhiKyJy
g1rWCprL53Lj1ZWKLdQgu6yiNCQK9LS45ETRzHX8idzAODnagfx6by+X58QljgMg
i72ZlH212j1K035K3UHJar7Lo0D7FQ==
=xssr
-----END PGP SIGNATURE-----

--d2rlzxmgwshy2k4w--
