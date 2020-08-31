Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED9C257800
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C086E0E4;
	Mon, 31 Aug 2020 11:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADF46E0E2;
 Mon, 31 Aug 2020 11:14:01 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n13so5015269edo.10;
 Mon, 31 Aug 2020 04:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FExIKAHJpPJFM3Hd44tazabRIhwd+0VFgHYZYcprPmE=;
 b=EKtSjKtzv24vUhMxF+gt7LwUCEObaU3gPowz0n9Rvrs8wdxgAIP+QWufXKZujYYBhU
 Uo3CawjQpfdgFZBlGzpSwcubxyiiNXXVDUdNI9pGzCRScHb+9Bx0Wi6AFSI38OW/MVsW
 mb5I7dO6ZerK1fHSeLbbvhUX8Mk7s4nXY26gGXR0ddg0f/1pkKMVDJ7n6HCmfyccD01O
 TznDM/nTvjkVwovGVCCZqGsAi99CkHPtrA75S8+H4pbgxqW7Agw7EvCJ4jPhT3AO0jZR
 VaBi0zdqGpEtCxJsbI8Y7bMV9TAgfmtiuqHV0OqjC1iMDTIKHeR6L+M0OzsqDwofuF2e
 eWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FExIKAHJpPJFM3Hd44tazabRIhwd+0VFgHYZYcprPmE=;
 b=gkLvFn4GWFFFRQew8DhrY5oKUVM6z4AyapiNFpx5qk/BEMfKzWiYUlS5hOfPat760x
 pKen6GOQa/QBQyUC1xX0F8JhXK0/Sh5TajCRYnK/I4yB8PqvOiuSBQBee7Wa08sz9iWd
 REejxn6hEicDPXVI/+KfTF5apBAa3udcWkzY2gE4mxBKDo04U+91sv/6qNuon3AfL1ru
 KKxRXZdQZTpIvUuuGksCqd1JWIrQAJcfuwwZZyLccKYszQie0kIAi1HBXT8y3Z4KeLrH
 JnQKBiQgCJYDsW7xrlTAJKtFp9JV986SE/n7ZE65RidYmolbs3RivTkYmMpLcW5fh8f7
 apmA==
X-Gm-Message-State: AOAM5303VQkmx+eDmKRMKTbpKXPzhM1CXJt3sy3hpR5figRk01/YXM7j
 cRap7ysqYXE+wukABWL6NHg=
X-Google-Smtp-Source: ABdhPJzSou1EakYOIg96I8GnoircE3Vn7kSNmn6F1/7zwYOg6k41dpCvAPKfpjEEd/aEdMlY9skw5w==
X-Received: by 2002:aa7:d146:: with SMTP id r6mr720807edo.335.1598872440245;
 Mon, 31 Aug 2020 04:14:00 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id o7sm7165100edq.53.2020.08.31.04.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 04:13:59 -0700 (PDT)
Date: Mon, 31 Aug 2020 13:13:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 08/17] pwm: crc: Fix period / duty_cycle times being
 off by a factor of 256
Message-ID: <20200831111358.GF1688464@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-9-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200830125753.230420-9-hdegoede@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0686068576=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0686068576==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline


--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 02:57:44PM +0200, Hans de Goede wrote:
> While looking into adding atomic-pwm support to the pwm-crc driver I
> noticed something odd, there is a PWM_BASE_CLK define of 6 MHz and
> there is a clock-divider which divides this with a value between 1-128,
> and there are 256 duty-cycle steps.
>=20
> The pwm-crc code before this commit assumed that a clock-divider
> setting of 1 means that the PWM output is running at 6 MHZ, if that
> is true, where do these 256 duty-cycle steps come from?
>=20
> This would require an internal frequency of 256 * 6 MHz =3D 1.5 GHz, that
> seems unlikely for a PMIC which is using a silicon process optimized for
> power-switching transistors. It is way more likely that there is an 8
> bit counter for the duty cycle which acts as an extra fixed divider
> wrt the PWM output frequency.
>=20
> The main user of the pwm-crc driver is the i915 GPU driver which uses it
> for backlight control. Lets compare the PWM register values set by the
> video-BIOS (the GOP), assuming the extra fixed divider is present versus
> the PWM frequency specified in the Video-BIOS-Tables:
>=20
> Device:		PWM Hz set by BIOS	PWM Hz specified in VBT
> Asus T100TA 	200			200
> Asus T100HA 	200			200
> Lenovo Miix 2 8	23437			20000
> Toshiba WT8-A	23437			20000
>=20
> So as we can see if we assume the extra division by 256 then the register
> values set by the GOP are an exact match for the VBT values, where as
> otherwise the values would be of by a factor of 256.
>=20
> This commit fixes the period / duty_cycle calculations to take the
> extra division by 256 into account.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Use NSEC_PER_USEC instead of adding a new (non-sensical) NSEC_PER_MHZ d=
efine
> ---
>  drivers/pwm/pwm-crc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M23UACgkQ3SOs138+
s6FFYg/+Mtzc1XwV7Zl1w99FCSgZyIrsahQ4SvPhVAXHLByxVW0Sgfi/z9K/bDcB
Fjw3E5MB0XL4UD9DWtdCKefCLe/5kIlbsS/LK7BPplf1GNfctSYQ72L5soS7HKrn
vBjHnIr5ohFn/EGf3RWeLczkUoFVhfbMYFgor/H1FjXo5OeHQ3Fkr2AVPsnyIYXZ
Iuc7iGLT8lI57IoxRlJ7ZKu0IXImzrN7YU4a+pfZ77fBAu3B9D9jom+L+U0E+E6q
Y+ZBnaRVz13j6OSRMtfu13/kATzx1HgJZfjmMiimldrXbucWCovYXK2GWz8RJp5J
YrXCFi8WdHdxB/JxDSYsswynJtRiSmGTjQmvxy6GYXZe8IvSB3VkpaTkQS5bzA65
QAYAclX3dnxT46eQ+yiNH4WEWlgL5gxsLeOMCvFWa5Lismv4q2gvxjBTF0RapKaD
oncskpQfC4HlP1vQieYkUrYQUfAq+Gq2a6OU5qk0HES6N504YLAhS35xqHvWvT+9
QT50ulvZJVyUzZN9HgmMphXKi0jTeJ5dAZjdf8RbzIXD8hBlFJbObnPl6Xk2VRh2
kJSwxDm74OT4sD2IydJQQCBnOtf6MZ/HjfLa5M6UP34DyWKg5LTlUbBDjp5+cJcs
jrZ53SdqyD8MbZ/0meG1wcRvneBbIEKkPtAkowDRt2wkQHEO6nc=
=4Oyz
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--

--===============0686068576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0686068576==--
