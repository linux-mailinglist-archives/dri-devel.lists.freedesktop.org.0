Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50C978F24
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 10:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7342610E258;
	Sat, 14 Sep 2024 08:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="UD9rh84s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AA510E2AD
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 08:38:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726303126; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MLOmakQrtsg4TH4ciQgVKKbaYfee0msm0gpHo0IRm2TCR1PjW/dhublzRh0fRtGTGALhk45SIBObhSMIdaclT1VZ9llt1dpmAWq4/rrRaZnP0TlystVIRu8JLbEtT5I9dAY40SMVINghKRE66+gmMtnaXLBPvrGwUkoll0SY1iU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1726303126;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ej6QX9G1dmM07ksR/FVgVBTC5gPecCY6T1R8JXBXxZk=; 
 b=QY6lMDWN3HqBg2CDOf4cd+x4CEh43tB3mXTwIHABzoMI9JNSgz3eCEZESG2I+hR6nX15ncOa5pdT8gmwe3yMArbB0phGyXskFZyfoOp4NyvlZWvqyKpCJ2GuN5ZhbcTzbw8Mtg8QOC6CbLtFeId2ZLx38RRRTlrcB5KrD33AbT0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726303126; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=Ej6QX9G1dmM07ksR/FVgVBTC5gPecCY6T1R8JXBXxZk=;
 b=UD9rh84s/7G9dAEtd71GxxzLUEpLcscRJ47S8/+Pe+224BS1cdckHNW/uTnB9dg5
 ie+cQG6VuPJdexJ7jiJPsrCstd7qabLh6ikWCE7quHAz3dCrzp0Zv10KpGsPVcL2ajR
 EzZkbOiu/30stenQoIDwq5734cnSfpNxAyU85Jbc=
Received: by mx.zohomail.com with SMTPS id 1726303124615201.60398788551277;
 Sat, 14 Sep 2024 01:38:44 -0700 (PDT)
Received: by mercury (Postfix, from userid 1000)
 id 3FFFB1060578; Sat, 14 Sep 2024 10:38:28 +0200 (CEST)
Date: Sat, 14 Sep 2024 10:38:28 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 01/27] power: supply: add undervoltage health status
 property
Message-ID: <uta55qswxp43tdziertbwvopytx26kjanouxfffvkjfnhrkwj2@bwoyfygw3pp7>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-1-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r7xlkoqbyyg5k4lc"
Content-Disposition: inline
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-1-2d2efd5c5877@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/223.982.64
X-ZohoMailClient: External
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


--r7xlkoqbyyg5k4lc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 13, 2024 at 06:07:44PM GMT, Dzmitry Sankouski wrote:
> Add POWER_SUPPLY_HEALTH_UNDERVOLTAGE status for power supply
> to report under voltage lockout failures.
>=20
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

This is missing updates to
Documentation/ABI/testing/sysfs-class-power and
drivers/power/supply/power_supply_sysfs.c
(POWER_SUPPLY_HEALTH_TEXT).

Greetings,

-- Sebastian

>  include/linux/power_supply.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> index 910d407ebe63..8682e6466544 100644
> --- a/include/linux/power_supply.h
> +++ b/include/linux/power_supply.h
> @@ -58,6 +58,7 @@ enum {
>  	POWER_SUPPLY_HEALTH_OVERHEAT,
>  	POWER_SUPPLY_HEALTH_DEAD,
>  	POWER_SUPPLY_HEALTH_OVERVOLTAGE,
> +	POWER_SUPPLY_HEALTH_UNDERVOLTAGE,
>  	POWER_SUPPLY_HEALTH_UNSPEC_FAILURE,
>  	POWER_SUPPLY_HEALTH_COLD,
>  	POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE,
>=20
> --=20
> 2.39.2
>=20

--r7xlkoqbyyg5k4lc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmblS3wACgkQ2O7X88g7
+prRCxAAlhYUU4yJX7NEhfMbNTVWhURSBhobZ62HayXzgdpD6Mq48r79Maug7GC9
GT0mcYXyGLCZjLkte5Qn0695klYG9JsIWdZqOdQV7fgHhH6gDBkFYghMVv8NVnXF
Pmcmwc1QOCjmDp37EkvxjXKOc+XNdnVuAlSwpnP3zkXKtexwe3kvZtD3qLToP7vs
Q+6qA8/9KVvC83i5VqrHUoWdkR514ZI8YcPzjStj6FecIRitH0xtOm9inpeLj1tv
fFcknMQkRSdNAarhfpZNzFLoyOSpImY/yeUEx3qFUqKNGtDZVkXvWNHVaEEEtxih
+1mX44QV5thBOSuKfuIA0deafptEjaP/eXhQEwS619aqDJd7J+JBmnZAdlmiBLqK
iEsBgTeThbx7RuOvBvRUVYPlUPG1jpYBgfWT4OT6w7x9tkkfemxU/JT1tXJNmKAp
onm6UftL9rF/olPVoXIL4AZ8QhsLkGQ+2iDNWaUbcvhWdEAo0AFnJNIRJHdbUT4a
fPlTrlZ5DO/ufGCPj7rbPehkVjKD/apDK84Dp8mQrIjlzuxqMacWFBv0Szrj9k4L
ZpUae4iBOygN1fXd6M8w3SvZw+9JOixLL/1vm2Av8vJwMYUUt4eNInyN4Pr1cjMh
Rd6zPpSmphSU+AgGnN70hqkRetW7+zUoyFzoKWtQeWApkEdHhVE=
=Gfk0
-----END PGP SIGNATURE-----

--r7xlkoqbyyg5k4lc--
