Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86983257805
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C006E0A8;
	Mon, 31 Aug 2020 11:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E3D6E0A8;
 Mon, 31 Aug 2020 11:15:05 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l23so5015017edv.11;
 Mon, 31 Aug 2020 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2rrQHLBYa1+tiZ8Q7iWizy3NNCeteIY8vsFlUNQofBI=;
 b=kxNuPgHUfvNcf9tL5W+rXd6xrtB7YipguU0tt0fPSQljMG3UMCHXCRzutv3qAia288
 sFwT1hEFtqvAdVQe8OuhzDKhz9GOGPOrrQobgDjU2Mzabc2k6Mczhjd4mu3+hnKbYHBf
 ac/XbAfMZtjKZtL2/uXOSYjMOqHyMCwZiIx7tf4+IYejjaGP1dFwHWdjOlkq5mooXEgH
 Uy7zT2rPm3VrDZrSuyNGy0kW0JZQO9ix+bOsDJIqCZHHgoYf0ak2gkhH5mzvo7b5QGVi
 yC8jTv2EEqJsmNPSb6iso1Q6WK9e5TdgFCdIul1N+NQVlGxcZHrNrY4Av4rMl8GN0+No
 SY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2rrQHLBYa1+tiZ8Q7iWizy3NNCeteIY8vsFlUNQofBI=;
 b=doNY/KRCbghGaHsqXEFEVIXXXih7pbrwM7+2Yn0OcI/4COYSn6gTQbYbvzGaE7orMR
 3IZNG3RPmrocQp6xg+1Olmt9XJBQVgikpN+s5tgymu5sXCpbRXpaJsHNhL1QuKKCZG5a
 wzxEgG1+Uv4yoqE+RDjvFgEArgXZtJRs9JxU/DIZy8+cBd22vPLq5iPxD8QNxk0sqDDB
 FKON2MvfHXOcI1Y13Ofz+8srVT9XsNN9QUCoc51AdmDQNtSNVTdl9/HLts9Ka6g5yL1g
 kA52XclESLynmC4U20xu/e/+Uo4CPoUwRrMAS2OzEu+lFWZE5uk9dG5mwZQrAzkNiFn9
 550Q==
X-Gm-Message-State: AOAM532P1KIkzGdGL8M2CncMZdZ4Q2lBglCWh61MDJ8s+UziuziQWaK5
 vv7w4HxTnH78CH/mxTl8fPE=
X-Google-Smtp-Source: ABdhPJwsk4qn+3BRHDfqdQOc30c9nW4c0A3sudJ9mpSXWOHXX9O6dVsnd0LHjhATK3j7rKrC7tvg8Q==
X-Received: by 2002:a05:6402:6d6:: with SMTP id
 n22mr717531edy.79.1598872504008; 
 Mon, 31 Aug 2020 04:15:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id g19sm7824486ejj.124.2020.08.31.04.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 04:15:02 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:15:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 09/17] pwm: crc: Fix off-by-one error in the
 clock-divider calculations
Message-ID: <20200831111501.GH1688464@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-10-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200830125753.230420-10-hdegoede@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============2040003186=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2040003186==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BXr400anF0jyguTS"
Content-Disposition: inline


--BXr400anF0jyguTS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 02:57:45PM +0200, Hans de Goede wrote:
> The CRC PWM controller has a clock-divider which divides the clock with
> a value between 1-128. But as can seen from the PWM_DIV_CLK_xxx
> defines, this range maps to a register value of 0-127.
>=20
> So after calculating the clock-divider we must subtract 1 to get the
> register value, unless the requested frequency was so high that the
> calculation has already resulted in a (rounded) divider value of 0.
>=20
> Note that before this fix, setting a period of PWM_MAX_PERIOD_NS which
> corresponds to the max. divider value of 128 could have resulted in a
> bug where the code would use 128 as divider-register value which would
> have resulted in an actual divider value of 0 (and the enable bit being
> set). A rounding error stopped this bug from actually happen. This
> same rounding error means that after the subtraction of 1 it is impossible
> to set the divider to 128. Also bump PWM_MAX_PERIOD_NS by 1 ns to allow
> setting a divider of 128 (register-value 127).
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Introduce crc_pwm_calc_clk_div() here instead of later in the patch-set
>   to reduce the amount of churn in the patch-set a bit
> ---
>  drivers/pwm/pwm-crc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--BXr400anF0jyguTS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M27UACgkQ3SOs138+
s6Gs7BAAkDVsNGuKpdYxyV/XBnq4T6ySPHcL3M15sN9QMC7UTr1DhcOGFHWlfC9E
cJK7ctPCe74/xareIjriY3xTCumhIOj1dAYvFxJGiw4W6qzNG6bXUNrrn/QpGOTy
tIUbrhj//YOgqwpzYvwwKbUjHtRRakOgAl6ayfXu1XggtVB2Tq/bf7wioyjNQGjy
bFrN97KYyePQZ9dv9ig6/8Z4dsLaMNc1pcYSnOsixUewDxscC9rQYmtovoqyZTS2
AWSNnCzp0YZqVhVFssYArwzMiimxESmAfTqsc9L9D3vVj6EYiJoc9CYsX46nkmbr
xeggxecSNtrGMSS8uce2krUt9KkqTTl8Li2tVtJZQ6N+jsEKEREnUISVJ7jvWCVJ
ygTtZahw6Qx/aafFFaXjPoivcWc40QJS3obin8hUV452ktoX7p9DjWtHDbeiW8s/
wggeEy5ySja9kp1zzwz7Ijg3aW97wFvcAGHpGEpTCPXF4acWq6WbVLjWC3h+QQ9w
II7rAObTNua3i+UDJ5JVS/bbxR9AwGMtYn3JwqLlXIUP7QvN8v8U8uCatj2Hg2Bd
+C/jjZJeNM7TA8BayiZ9qUaXRjjD1V0cHM5h4GOSAQsBMA2emE8wY43PGwZCx3CW
DgFi43ZSBldkZLZZQzm3CRXxWFWWdLv/k6rGHTy+B4Md1cqqIVw=
=MFCA
-----END PGP SIGNATURE-----

--BXr400anF0jyguTS--

--===============2040003186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2040003186==--
