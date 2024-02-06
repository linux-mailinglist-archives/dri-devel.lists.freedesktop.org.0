Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746E684BC6E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 18:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A16510F202;
	Tue,  6 Feb 2024 17:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="emvavMe8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FAB10F202
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 17:44:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33b130f605eso3860022f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 09:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707241475; x=1707846275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9t4eRXqQzvNfu/98QWiAgJdjJHSNxLreUnAsT7Bnw7I=;
 b=emvavMe8vmrg6vyM/zJFyLoVCUahiaaghhhSI+08l3R+pAOtsh8Ju7eK83yhqnAfJu
 Cenmewy6hilXl/LdjDN1KvysgML+e4aQ3vdODmb06oCFfjVOYirt6tQswhZaj28TuzZf
 LkjZLSzV79ZxD8QabKImfrUGbN1cJLyEkvAweFalrjV0+59yzhcisBETmcegfYzjpwlw
 Wmfm6KajrU8CZMDZGN/YzlmpJI4/dQH8MX29AynTtZPzoxCjKbcin/63oWMAbjaTvsaU
 gp5djaLuD7ea6FN1A7iofE+Ir28yAz994w/LI93UFxmM1H16Ytprsr+Evm3gJkaiOKXx
 Tm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707241475; x=1707846275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9t4eRXqQzvNfu/98QWiAgJdjJHSNxLreUnAsT7Bnw7I=;
 b=aYN1od+yH87MOCbbwMeedI5UTQqPm117f6mH+QBkkQnNSNBRrKKNVZsXW9VYL0Wj7F
 U91Gfbb6XLGQDPhv+5fX3XT/6Nc/brfjH6sNeXWscW6A/76/sQfMS697o2v/WFdmVE3H
 hw+IMWT7q3It2b+l/BlVE5156I2oOb6YeVgYc9X6kBReEdkAV1WuqFrRWaJjYiTcvKic
 8vEW5iplW/CAMjOKN6hVgmAPZf4iKKw9MYQPDRngMs1Xb1Tod6x4kvs3Krzn7mOoJPgm
 RlQzjy/RNbAGE+W1heyzWblW4lt/XuWWNXzKtTBElUFrdZfrLMPMwC/80iyf62P4BRvv
 ZVOQ==
X-Gm-Message-State: AOJu0Yyr5bGEJ/jV/cpVrvTFZS6GhnAA4BNmImu1bMqW2jRGFGthHwUU
 73yerb7NRjt93R/lfSRrRkfzKDA+/QryYqoiYvQsa1op+7x2wtrS
X-Google-Smtp-Source: AGHT+IF1lpIFhtZgzKWW6d/q831mG+OpyLzRSJ+x7f9PpC4Ax09tVNR/VhUDDcXc/dOAuLQ7nXPoXQ==
X-Received: by 2002:adf:f551:0:b0:33b:232f:63f7 with SMTP id
 j17-20020adff551000000b0033b232f63f7mr1878813wrp.31.1707241475073; 
 Tue, 06 Feb 2024 09:44:35 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV2DypM6qI/Z832xi9QRDqWoQqPSTkHy+i8RGjG++zwuixmvADhnUsdCaRHqQHOvmF5uGxzDjlB0z8Wdx0EGu4a6VMYHl/G4S0LwTUm+IoTcISKtm5rSHcdlhUaFO7eTg28wUKXr/wIsq4ZreujpJtefRmwac18lB+XYTOdMpfjGYdz74pvUnJEBewCxOIwm3+KGF5eYpT2h4KN5lRmzfeOzqBkcQKedgEx8A83GYOk/+h5ajdUcqJIVQINPliwFX9FOSDlzH1LqZRWxYPmz/u2X9cI3nJA4kpafVgEU6ecRrkiRPdaHHLr0yPNxRpv0zZjX/nsA/4C02U0QK5jo98esbPEPvGda3cD6cWmhYyKOos0JpLETIclyG/oxE3YDXN75btyjGXuEiKvSyada4xu+ycGnvXnFes3Dp+lVVafA3GDDK0fsbLYrCf6lUXj8Dp6MhqDRAlFRgy7m1VboGHLhheAFH+RHvz1SUQFo+MKg2s75824X5zBU4quACJNj3+n8PsAwDjyRyCnr+C8QTNcrHXLwtrrowqQgOyerem1HCTlXiGRmIIAwuL3yfAfFZq1mh+eyDtiO33faydFVxXEIP7ZM98U+xGCiA0AYTWVAE/0r2HCpUBpA/CT1mSXYecahhcUq4fkxBzdEgYMaX0k+LkEVY6mwg129kyEDpnwolSkS4V4ev8ZXopp2cHTPmhqibJleCdfoHRaZ/V7N9t3ncg3Ek1ot6/EFHpQpRtqnnHe8yQlzJ512hU3fgwXrjTrTaSxRQYbl0DYc4pY4hw=
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 k18-20020a5d6292000000b0033b13922263sm2568357wru.60.2024.02.06.09.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 09:44:34 -0800 (PST)
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
Subject: Re: [PATCH v2 1/6] clk: sunxi-ng: nkm: Support constraints on m/n
 ratio and parent rate
Date: Tue, 06 Feb 2024 18:44:33 +0100
Message-ID: <2172947.irdbgypaU6@jernej-laptop>
In-Reply-To: <87il32ztp8.fsf@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <2717565.mvXUDI8C0e@jernej-laptop> <87il32ztp8.fsf@oltmanns.dev>
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

Dne ponedeljek, 05. februar 2024 ob 18:50:27 CET je Frank Oltmanns napisal(=
a):
> Hi Jernej,
>=20
> On 2024-02-05 at 18:45:27 +0100, Jernej =C5=A0krabec <jernej.skrabec@gmai=
l.com> wrote:
> > Dne ponedeljek, 05. februar 2024 ob 16:22:24 CET je Frank Oltmanns napi=
sal(a):
> >> The Allwinner A64 manual lists the following constraints for the
> >> PLL-MIPI clock:
> >>  - M/N <=3D 3
> >>  - (PLL_VIDEO0)/M >=3D 24MHz
> >>
> >> The PLL-MIPI clock is implemented as ccu_nkm. Therefore, add support f=
or
> >> these constraints.
> >>
> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >
> > Haven't we discussed that this patch is unnecessary because same effect=
 can
> > be reached by limiting minimum frequency?
>=20
> The patch for ccu_nm was unnecessary:
> https://lore.kernel.org/all/87jzoug2jz.fsf@oltmanns.dev/
>=20
> Unfortunately, we still need this one.

Ok, then:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> Best regards,
>   Frank
>=20
> >
> > Best regards,
> > Jernej
> >
> >> ---
> >>  drivers/clk/sunxi-ng/ccu_nkm.c | 21 +++++++++++++++++++++
> >>  drivers/clk/sunxi-ng/ccu_nkm.h |  2 ++
> >>  2 files changed, 23 insertions(+)
> >>
> >> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu=
_nkm.c
> >> index 853f84398e2b..1168d894d636 100644
> >> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> >> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> >> @@ -16,6 +16,20 @@ struct _ccu_nkm {
> >>  	unsigned long	m, min_m, max_m;
> >>  };
> >>
> >> +static bool ccu_nkm_is_valid_rate(struct ccu_common *common, unsigned=
 long parent,
> >> +				  unsigned long n, unsigned long m)
> >> +{
> >> +	struct ccu_nkm *nkm =3D container_of(common, struct ccu_nkm, common);
> >> +
> >> +	if (nkm->max_m_n_ratio && (m > nkm->max_m_n_ratio * n))
> >> +		return false;
> >> +
> >> +	if (nkm->min_parent_m_ratio && (parent < nkm->min_parent_m_ratio * m=
))
> >> +		return false;
> >> +
> >> +	return true;
> >> +}
> >> +
> >>  static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_com=
mon *common,
> >>  						       struct clk_hw *parent_hw,
> >>  						       unsigned long *parent, unsigned long rate,
> >> @@ -31,6 +45,10 @@ static unsigned long ccu_nkm_find_best_with_parent_=
adj(struct ccu_common *common
> >>  				unsigned long tmp_rate, tmp_parent;
> >>
> >>  				tmp_parent =3D clk_hw_round_rate(parent_hw, rate * _m / (_n * _k)=
);
> >> +
> >> +				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
> >> +					continue;
> >> +
> >>  				tmp_rate =3D tmp_parent * _n * _k / _m;
> >>
> >>  				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
> >> @@ -64,6 +82,9 @@ static unsigned long ccu_nkm_find_best(unsigned long=
 parent, unsigned long rate,
> >>  	for (_k =3D nkm->min_k; _k <=3D nkm->max_k; _k++) {
> >>  		for (_n =3D nkm->min_n; _n <=3D nkm->max_n; _n++) {
> >>  			for (_m =3D nkm->min_m; _m <=3D nkm->max_m; _m++) {
> >> +				if (!ccu_nkm_is_valid_rate(common, parent, _n, _m))
> >> +					continue;
> >> +
> >>  				unsigned long tmp_rate;
> >>
> >>  				tmp_rate =3D parent * _n * _k / _m;
> >> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu=
_nkm.h
> >> index 6601defb3f38..c409212ee40e 100644
> >> --- a/drivers/clk/sunxi-ng/ccu_nkm.h
> >> +++ b/drivers/clk/sunxi-ng/ccu_nkm.h
> >> @@ -27,6 +27,8 @@ struct ccu_nkm {
> >>  	struct ccu_mux_internal	mux;
> >>
> >>  	unsigned int		fixed_post_div;
> >> +	unsigned long		max_m_n_ratio;
> >> +	unsigned long		min_parent_m_ratio;
> >>
> >>  	struct ccu_common	common;
> >>  };
> >>
> >>
>=20




