Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88EA25BFC0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 12:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229306E9A0;
	Thu,  3 Sep 2020 10:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F946E9A0;
 Thu,  3 Sep 2020 10:59:14 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w1so2223604edr.3;
 Thu, 03 Sep 2020 03:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5WkgJ0UxrcTDSXHkc4L8uoxCzIf7bxTFKt8UaneBiRk=;
 b=VN5ABvnSPO3JBWqCVBzuVDrdtbBS4cTdfDLq5oMYTr70VYewUC9snWrv1CvO6T90hX
 aALzfiWkNSMDqX7/WAXqlvrVEbEhTpIKKspQpuTJ628QKx8PzttjUuWi6DZCXbhR2hfI
 4uWT/TtvCeU0Ei5vMvMJzffGkf6xjHBaShp1yHKW9ops2wQpnfyN8XfJs+dx77bJSWVH
 qDcUVYxcze6PiB9tv9TflcENHU7MrnS5zmdgOHKPbbIXfdfT26ziBW0Smk9DXHHaqnub
 zcifV0K+hx6Q5eHZLWx3TD/jDPAXeaX18qgXI/+HRARz0CTKg599NAYpUFiwHtt4a4xT
 eq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5WkgJ0UxrcTDSXHkc4L8uoxCzIf7bxTFKt8UaneBiRk=;
 b=CWeoTK5gtkMbwwzF+42pgO//oP8rGwJ6kjpdUW4x7AsRkQltq9OiBfMZ1n6RD8i1b4
 2G1wA1uqmG1WuQPiShfeEJmpoz2+bnUPnyK2pPaGu7ye2zW2grzcUbVJBpFfo7z4nKes
 Ct8lwvvvOj3huC/RYC+TjjLur4BZEf8NrsqVfLmmB3QRs54NXLd0YmTCh2T7L+3NKB8E
 4u7xzbLRvJpanHRbA2Ynx6Gu0hSMgI0C9K53D0NYMBW+kVREuWTfw5FwyGtt9hQ3C/tu
 ioviD8q4guT9VDAitxBSKzgdp7+9SRPcqDAsn/ZfsnZfOANowCHriGNuqNrgbzS09ebL
 9ZAQ==
X-Gm-Message-State: AOAM530JSCZeX7wE8FZpoqSY3OYVzX1p61pkkhmX9cTvz9dsDGLnx5em
 4OaOG/bRaY4qsFnQlhs24Gs=
X-Google-Smtp-Source: ABdhPJwdofunMJ6Amnv+OjRxLrWPoFpcW9kCbNYB+KAWKb2V6jllwRKlhYdb9tn9/Gv+Xi9iFed4eg==
X-Received: by 2002:a50:ef15:: with SMTP id m21mr2452152eds.300.1599130753024; 
 Thu, 03 Sep 2020 03:59:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id sd17sm2978314ejb.93.2020.09.03.03.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 03:59:11 -0700 (PDT)
Date: Thu, 3 Sep 2020 12:59:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v9 06/17] pwm: lpss: Make pwm_lpss_apply() not rely on
 existing hardware state
Message-ID: <20200903105909.GA3756465@ulmo>
References: <20200903105114.9969-1-hdegoede@redhat.com>
 <20200903105114.9969-7-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200903105114.9969-7-hdegoede@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0755465377=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0755465377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 12:51:03PM +0200, Hans de Goede wrote:
> Before this commit pwm_lpss_apply() was making 2 assuming
> 2 pre-conditions were met by the existing hardware state:

I think that "making 2" is too much.

>=20
> 1. That the base-unit and on-time-div read back from the
> control register are those actually in use, so that it
> can skip setting the update bit if the read-back value
> matches the desired values.
>=20
> 2. That the controller is enabled when the cached
> pwm_state.enabled says that the controller is enabled.
>=20
> As the long history of fixes for subtle (often suspend/resume)
> lpss-pwm issues shows, this assumptions are not necessary
> always true.
>=20
> 1. Specifically is not true on some (*) Cherry Trail devices
> with a nasty GFX0._PS3 method which: a. saves the ctrl reg value.
> b. sets the base-unit to 0 and writes the update bit to apply/commit
> c. restores the original ctrl value without setting the update bit,
> so that the 0 base-unit value is still in use.
>=20
> 2. Assumption 2. currently is true, but only because of the code which
> saves/restores the state on suspend/resume. By convention restoring the
> PWM state should be done by the PWM consumer and the presence of this
> code in the pmw-lpss driver is a bug. Therefor the save/restore code will
> be dropped in the next patch in this series, after which this assumption
> also is no longer true.
>=20
> This commit changes the pwm_lpss_apply() to make any assumptions about the

Did you mean to say "... to _not_ make any assumptions ..."?

> state the hardware is in. Instead it makes pwm_lpss_apply() always fully
> program the PWM controller, making it much less fragile.
>=20
> *) Seen on the Acer One 10 S1003, Lenovo Ideapad Miix 310 and 320 models
> and various Medion models.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/pwm/pwm-lpss.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)

Other than the two small nits, this looks much more idiomatic and true
to the atomic API, so:

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9QzHoACgkQ3SOs138+
s6ESpBAAojLI3n0J8ZLi86BrLI0Z86TKMHv7NEsGF6+k2vdFDAfUVBQfONZmQdDf
+/6j3Z6xB7fE0VFOcui0c+jUcrC3bydlZx8oSr3PR1vh8F/IHp4mR7jROo2twyLA
P0xEiqkP3zkBf03gRICaM+TZMyurEytONhSyVrn3cHegv2fz2ifOBnhG/M0OY/4/
7298CjoudL4K59HZJW5D/FFR7+OjgP79umSGw16arD26gpM3GEWVyyT4kvxQ4vP/
7DDNsHFHhaqL+J5F9UB+tJU3o53J5CF9swb0xNKSaf5cZjB48TLLoMB38uUgjahi
0Wcd6PCVoJnlmM67qkGXTJfOMvZgfSdL1ArVIf6o8sRCPfbGCGqUt8pdJ9DxmNNQ
RtTX+jTsZ/dQXDLVI+n6G5eGxaSiyJDZdRLsM0fEwUNXexeoKfKXBOUuejO+zO0g
wctkpRc67HGTsJ2dVbut2x/oMfHUIbNm9tA9g6na3iX88bVczaMAivJg9sDygM9T
q4cyjjICSOcKUYNQcSk0Mxl5txkT1MdYV6yMeVRzk+N4xSHuPfmQ19/d6iQh5VKV
r2rcXsy7fftjRJU7xf46sqeWt92/0g437arMZDWQfrCVwGkCCoaTJbVGJvmzEMYy
C21YOOEedRM/Rx0ZYMlfykVMhEC60qySz+ihCvlTobIatGr8ITA=
=gIsS
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--

--===============0755465377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0755465377==--
