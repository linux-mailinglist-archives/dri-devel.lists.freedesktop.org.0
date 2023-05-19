Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C81C709D97
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987B710E605;
	Fri, 19 May 2023 17:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC5F10E5B8;
 Fri, 19 May 2023 17:10:30 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-19a1ac5e200so2531971fac.1; 
 Fri, 19 May 2023 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684516230; x=1687108230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=poNphkfZwNdP6GeKL2W2z8I4b6XaR+5+jgr9kWrFxz8=;
 b=roESMr5O9UgQcD2w6NwXUF7WHCxMJSjcu8W1TdbscQ+GCF3tqbdSN/1THf0GSknwZ2
 Wy4KVv/tUTz1rdC8vOgNlHKuSNeteUdhMmAGzSgoZjtsDgioJTns8PInOWfhuBjxmkqd
 TK/zhMAomAg20E7i/rDz8l4sK2+T+kXBTGnucBuw2UzeF7ux3hoskXK1rqd7w6Z3JQNw
 wMzMDMpfZws8mti7qOCmO0Y26W1xeFw6xBsJZ8supfUTn0e3tEKXb6/7IOyr1Ab5cY46
 1x+Vsls920AP2YsQo4tFVhAFLxbrtoK8B2wSLEwZwuHZPWMLBTmj6RVa2rwZAxlR9LAk
 37Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684516230; x=1687108230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=poNphkfZwNdP6GeKL2W2z8I4b6XaR+5+jgr9kWrFxz8=;
 b=SJFkYtpavCbwoixe4IDSyc829dKbpMfmJlslMD285v37FlKNULM0XptSs5M2XVdKAF
 lsTEEC8hCY4RC5pWcvAc76h6bUnK6XE7SWx+HdfIPXTQHOg9mibDp7eagXGX0CgtFXbH
 AlU+SyPvqEda1RfZ4mbxZWJVwzMZjxEdFIsWDLr069bw/qbjQECOiWE49pJBD1j9GT5n
 jtk2e2jXVfTq6Hq9EgGSh+dB2wgtqGS+3o1ymGhCaqrrx6Sh19A1JLgkR+Ez2PC0mhCV
 QdbLrLetp/YoGQCdurThgnrwZ63tb8QUsC6O7m+RppxfS83fbuntJbMFfmCnnV9oV6Uz
 iQ7Q==
X-Gm-Message-State: AC+VfDzvd8bhsINAEDLK2yobRYG5j3HYGOghq9MMWbIGzpSuzYzvlQ7N
 lhpLv6FNmePmFTvoJ+Khd8b7pGtZ+wBhhCz+6ejkXWkQ
X-Google-Smtp-Source: ACHHUZ7yTXOh02l/eiEu30G7cg1D3eXhmE7kPZzFc1iqb5D2Y8Ok17f72/u4+Pa3zHt+mAXCGrexBzGW+udtQm5wjek=
X-Received: by 2002:a05:6808:24a:b0:396:3dc7:948c with SMTP id
 m10-20020a056808024a00b003963dc7948cmr1432453oie.54.1684516229793; Fri, 19
 May 2023 10:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230519153327.231806-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20230519153327.231806-1-n.zhandarovich@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 May 2023 13:10:18 -0400
Message-ID: <CADnq5_MWD1p3Aej7Hawo_0sRM+5Og0i7cr1vgvcj=o=oxRujoA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: fix possible division-by-zero errors
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
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
Cc: lvc-project@linuxtesting.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In practice this should never happen.  Applied with some minor coding
style fixes.

Alex

On Fri, May 19, 2023 at 11:33=E2=80=AFAM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> Function rv740_get_decoded_reference_divider() may return 0 due to
> unpredictable reference divider value calculated in
> radeon_atom_get_clock_dividers(). This will lead to
> division-by-zero error once that value is used as a divider
> in calculating 'clk_s'.
> While unlikely, this issue should nonetheless be prevented so add a
> sanity check for such cases by testing 'decoded_ref' value against 0.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Fixes: 66229b200598 ("drm/radeon/kms: add dpm support for rv7xx (v4)")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>
> ---
>  drivers/gpu/drm/radeon/cypress_dpm.c | 7 +++++--
>  drivers/gpu/drm/radeon/ni_dpm.c      | 7 +++++--
>  drivers/gpu/drm/radeon/rv740_dpm.c   | 7 +++++--
>  3 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cypress_dpm.c b/drivers/gpu/drm/radeo=
n/cypress_dpm.c
> index fdddbbaecbb7..3678b7e384e1 100644
> --- a/drivers/gpu/drm/radeon/cypress_dpm.c
> +++ b/drivers/gpu/drm/radeon/cypress_dpm.c
> @@ -555,10 +555,13 @@ static int cypress_populate_mclk_value(struct radeo=
n_device *rdev,
>
>                 if (radeon_atombios_get_asic_ss_info(rdev, &ss,
>                                                      ASIC_INTERNAL_MEMORY=
_SS, vco_freq)) {
> +                       u32 clk_s, clk_v;
>                         u32 reference_clock =3D rdev->clock.mpll.referenc=
e_freq;
>                         u32 decoded_ref =3D rv740_get_decoded_reference_d=
ivider(dividers.ref_div);
> -                       u32 clk_s =3D reference_clock * 5 / (decoded_ref =
* ss.rate);
> -                       u32 clk_v =3D ss.percentage *
> +                       if (!decoded_ref)
> +                               return -EINVAL;
> +                       clk_s =3D reference_clock * 5 / (decoded_ref * ss=
.rate);
> +                       clk_v =3D ss.percentage *
>                                 (0x4000 * dividers.whole_fb_div + 0x800 *=
 dividers.frac_fb_div) / (clk_s * 625);
>
>                         mpll_ss1 &=3D ~CLKV_MASK;
> diff --git a/drivers/gpu/drm/radeon/ni_dpm.c b/drivers/gpu/drm/radeon/ni_=
dpm.c
> index 672d2239293e..9ce3e5635efc 100644
> --- a/drivers/gpu/drm/radeon/ni_dpm.c
> +++ b/drivers/gpu/drm/radeon/ni_dpm.c
> @@ -2239,10 +2239,13 @@ static int ni_populate_mclk_value(struct radeon_d=
evice *rdev,
>
>                 if (radeon_atombios_get_asic_ss_info(rdev, &ss,
>                                                      ASIC_INTERNAL_MEMORY=
_SS, vco_freq)) {
> +                       u32 clk_s, clk_v;
>                         u32 reference_clock =3D rdev->clock.mpll.referenc=
e_freq;
>                         u32 decoded_ref =3D rv740_get_decoded_reference_d=
ivider(dividers.ref_div);
> -                       u32 clk_s =3D reference_clock * 5 / (decoded_ref =
* ss.rate);
> -                       u32 clk_v =3D ss.percentage *
> +                       if (!decoded_ref)
> +                               return -EINVAL;
> +                       clk_s =3D reference_clock * 5 / (decoded_ref * ss=
.rate);
> +                       clk_v =3D ss.percentage *
>                                 (0x4000 * dividers.whole_fb_div + 0x800 *=
 dividers.frac_fb_div) / (clk_s * 625);
>
>                         mpll_ss1 &=3D ~CLKV_MASK;
> diff --git a/drivers/gpu/drm/radeon/rv740_dpm.c b/drivers/gpu/drm/radeon/=
rv740_dpm.c
> index d57a3e1df8d6..ca76efa0f59d 100644
> --- a/drivers/gpu/drm/radeon/rv740_dpm.c
> +++ b/drivers/gpu/drm/radeon/rv740_dpm.c
> @@ -247,10 +247,13 @@ int rv740_populate_mclk_value(struct radeon_device =
*rdev,
>
>                 if (radeon_atombios_get_asic_ss_info(rdev, &ss,
>                                                      ASIC_INTERNAL_MEMORY=
_SS, vco_freq)) {
> +                       u32 clk_s, clk_v;
>                         u32 reference_clock =3D rdev->clock.mpll.referenc=
e_freq;
>                         u32 decoded_ref =3D rv740_get_decoded_reference_d=
ivider(dividers.ref_div);
> -                       u32 clk_s =3D reference_clock * 5 / (decoded_ref =
* ss.rate);
> -                       u32 clk_v =3D 0x40000 * ss.percentage *
> +                       if (!decoded_ref)
> +                               return -EINVAL;
> +                       clk_s =3D reference_clock * 5 / (decoded_ref * ss=
.rate);
> +                       clk_v =3D 0x40000 * ss.percentage *
>                                 (dividers.whole_fb_div + (dividers.frac_f=
b_div / 8)) / (clk_s * 10000);
>
>                         mpll_ss1 &=3D ~CLKV_MASK;
> --
> 2.25.1
>
