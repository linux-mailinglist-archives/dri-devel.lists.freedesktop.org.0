Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E260684BC81
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 18:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D3210F27E;
	Tue,  6 Feb 2024 17:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K6gpZQw6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D425B10F27E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 17:51:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-33934567777so924175f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 09:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707241864; x=1707846664; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyDSK4F15cuDmx/vu6ZGAEnvOFxcasBhnuqvACgOoY8=;
 b=K6gpZQw6/4+TkD19glJDzi9aOGKFf8BoboOOJDcC4L0VLxqbaCyEuodkuyVRQqTwAy
 R0ziQTJK0Bot8uq7guPVlK9waKxjIvIp1YUOlCSEd+y0zGN2ye9HAboUBarDZsdn8LVk
 eEZBCeefCpIlTHfRwOl1FY48IFlA+kx5CcsP5giMttqNRBazrhUFScBxTc2z6OUfP3j3
 dg0xqQtbSeFYnsD6nDZwCmKX5TwBYydGH5AwrWfBu6wA+ZAAyzKYDf6prS0e6En0hI8C
 /ARRAvWoVe8lYAffDiCIFuu5WoPQ4jn9Oj3ZlXH4sY2fF1JgLpvtJY3HM5KaiPZtpeW6
 KwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707241864; x=1707846664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RyDSK4F15cuDmx/vu6ZGAEnvOFxcasBhnuqvACgOoY8=;
 b=iniCXUMv0ffdOtdYYse24uVYT9DqM88+SBA5VYPXFCjMkyyVhNtYRGbg/bW4hLvCYa
 FyoG6KHeoPZqr3r906qq276KvesWaA/X+n6t+h2h2BG1z9A8uYqraY9gCWxre7lkpITM
 WXc0HynOyuoHbtvnC7uL8FyTQZgvW1CRl2rRnaPyPsy+iBDXkcPFaXd2KHbKASVNCzt0
 WGH2yohpkVmi3AeSxd9YfUuHWsayXdhCYe0rk/aViA+a3jKU3SsxMC9+Cys/Hr3PCrEs
 oWLMXb0uONfe6wTB3PYdxz3cZRVLjpjrzFQG+DdEZZDOh6k1i0bSlqCA3w2CFBhkrxTc
 lwKQ==
X-Gm-Message-State: AOJu0YyUYJYi/hfnyAEDN1o++oVU9A6vCs5fyNHcXsO1FEhNXz9gZVSw
 ZuPTlmom08ioPeq2UuMKIqUoUxnERWp3z4PVZoLmn6gXwpUsoSai
X-Google-Smtp-Source: AGHT+IFFGw8MurJEQRDhd3NrPc7k/aeq09X31PYFeQnZKxSyzmXwRdTODxBIQmNqM5wVALjwXtAHqw==
X-Received: by 2002:a05:6000:108d:b0:33b:2856:5188 with SMTP id
 y13-20020a056000108d00b0033b28565188mr2440903wrw.44.1707241864183; 
 Tue, 06 Feb 2024 09:51:04 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVnl+77EHlyL7OjE70j4LZEUM8ybfGzihKXR1fW7X87Lb8QtN/NH2w5BHRaSzjtsOgKSoIXtGS4t4G2jjpQ6fSTVquJjK474xw5tcMreE2+/4zq8GNkR7I+4PuKylb2TaUemBu8BQP7che3uNZh5Y06mYd0CAMqKsnemk02z49VekronMmyA8f6CLLE7d5KTtqwYc6Q7eUOOBwe3rgL/qsmc+DP2wZ+iBdqianq9pVLVdQ1zQm+HDfUj5IvasaTVJtULALl7VDi30cJJjKTVj9GDa2xNanGFQa+hD5zoKLggjJPLh1g/IFHIU9AnQgQK8mNFy1nZAb5mf4aTmNH8Xljyyh2fbOzfQGWE7nRbkcuN90nt2+jcCMRJgjcbftVXgdxEFEW6TJDUR5HK50qp/20EdMikeoENxf8WfXOBoE6dtpnGLsyomGZ5rat1Xym13QtVmVi2WEffS+IRcHJPyaBPzgCfBFlmYqVcnO3QtGxWM7ZpHXohGrN7VFLnEZT34g7ajm2XGbCcrLh6bAoulKDPol4jszQem+JN18eRgFXIxAyVlp5pCb8YBFDMbSLJ3iSl110HAlJE0k/LFnhooj9NkTJ9apVJdXKxbKfMwIyeD6F/m52kaq8PhuhQKP1z8iad1wLx3x4daI6ITF3tsnGgPiJCpw0B8AclUtFNQaXQYA2H1uQmY1PaYyF+7BT8LHG1aaUGT8lm7k5QY0BrmrV8jAipi7pEyIuB4Km30ZBf4LLfh4zb+Y3brtRzdyIoUXXLnGPxmbK5mVnGcVv0MI=
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 q11-20020adfab0b000000b0033b2276e71csm2627016wrc.62.2024.02.06.09.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 09:51:03 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] clk: sunxi-ng: nkm: Support minimum and maximum
 rate
Date: Tue, 06 Feb 2024 18:51:02 +0100
Message-ID: <3280499.44csPzL39Z@jernej-laptop>
In-Reply-To: <87eddqzm4j.fsf@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <4543794.LvFx2qVVIh@jernej-laptop> <87eddqzm4j.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Dne ponedeljek, 05. februar 2024 ob 21:34:04 CET je Frank Oltmanns napisal(=
a):
>=20
> On 2024-02-05 at 18:56:09 +0100, Jernej =C5=A0krabec <jernej.skrabec@gmai=
l.com> wrote:
> > Dne ponedeljek, 05. februar 2024 ob 16:22:26 CET je Frank Oltmanns napi=
sal(a):
> >> According to the Allwinner User Manual, the Allwinner A64 requires
> >> PLL-MIPI to run at 500MHz-1.4GHz. Add support for that to ccu_nkm.
> >>
> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >> ---
> >>  drivers/clk/sunxi-ng/ccu_nkm.c | 13 +++++++++++++
> >>  drivers/clk/sunxi-ng/ccu_nkm.h |  2 ++
> >>  2 files changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu=
_nkm.c
> >> index 1168d894d636..7d135908d6e0 100644
> >> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> >> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> >> @@ -181,6 +181,12 @@ static unsigned long ccu_nkm_round_rate(struct cc=
u_mux_internal *mux,
> >>  	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
> >>  		rate *=3D nkm->fixed_post_div;
> >>
> >> +	if (nkm->min_rate && rate < nkm->min_rate)
> >> +		rate =3D nkm->min_rate;
> >> +
> >> +	if (nkm->max_rate && rate > nkm->max_rate)
> >> +		rate =3D nkm->max_rate;
> >
> > Please take a look at ccu_nm_round_rate() code. You need to consider po=
stdiv
> > and you can return immediately.
>=20
> There is a difference here insofar that ccu_nm is always connected to a
> fixed rate parent (at least that's my understanding). Therefore, in
> ccu_nm_round_rate() we can be sure that the min or max rate can really
> be set. In ccu_nkm we don't have that luxury, we actually have to find a
> rate that is approximately equal to the min and max rate, based on the
> parent rate. Therefore, we can't return immediately.

Good point.

>=20
> Also, I'm not sure what you mean about me needing to consider postdiv.
> That's what I did. The check is after multiplying with the postdiv. It's
> the same as in ccu_nm_round_rate() (just minus the immediate return).

Nevermind, this applies only for immediate return.

Best regards,
Jernej

>=20
> >
> >> +
> >>  	if (!clk_hw_can_set_rate_parent(&nkm->common.hw))
> >>  		rate =3D ccu_nkm_find_best(*parent_rate, rate, &_nkm, &nkm->common);
> >>  	else
> >> @@ -220,6 +226,13 @@ static int ccu_nkm_set_rate(struct clk_hw *hw, un=
signed long rate,
> >>  	_nkm.min_m =3D 1;
> >>  	_nkm.max_m =3D nkm->m.max ?: 1 << nkm->m.width;
> >>
> >> +
> >> +	if (nkm->min_rate && rate < nkm->min_rate)
> >> +		rate =3D nkm->min_rate;
> >> +
> >> +	if (nkm->max_rate && rate > nkm->max_rate)
> >> +		rate =3D nkm->max_rate;
> >> +
> >
> > No need for this, clk subsystem calls round rate before setting actual =
clock
> > rate.
>=20
> I'll remove the checks in V3.
>=20
> Best regards,
>   Frank
>=20
> >
> > Best regards,
> > Jernej
> >
> >>  	ccu_nkm_find_best(parent_rate, rate, &_nkm, &nkm->common);
> >>
> >>  	spin_lock_irqsave(nkm->common.lock, flags);
> >> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu=
_nkm.h
> >> index c409212ee40e..358a9df6b6a0 100644
> >> --- a/drivers/clk/sunxi-ng/ccu_nkm.h
> >> +++ b/drivers/clk/sunxi-ng/ccu_nkm.h
> >> @@ -27,6 +27,8 @@ struct ccu_nkm {
> >>  	struct ccu_mux_internal	mux;
> >>
> >>  	unsigned int		fixed_post_div;
> >> +	unsigned long		min_rate;
> >> +	unsigned long		max_rate;
> >>  	unsigned long		max_m_n_ratio;
> >>  	unsigned long		min_parent_m_ratio;
> >>
> >>
> >>
>=20




