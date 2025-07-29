Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5932AB1543E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 22:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D0310E3FE;
	Tue, 29 Jul 2025 20:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jPpXVoEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260DC10E3FE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 20:17:25 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6152faff57eso398276a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753820244; x=1754425044;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WV9Qd8VswLll4F/W1lnqlWzljnHTNQ+aOkT7Q5f8HDM=;
 b=jPpXVoEf1lo+wxVZA9naybUxf2EIVCH89NiMrX0kaFlubImBbHsb+XhB7wVYJVcLMq
 2PtMue6Gx9f5e8hXsuzAj3vLtl+JYTwPFIT3GMlHdFvwnT6+9mFYWYONHBpejOYtisbZ
 67SqtG1iICssuUI77wQ/8wRxi2QoBarE1hPkXTyAWcl6tajmbQygb3b8lpRQKlA40QJP
 J0y3D7ZAggd9MM/+442BS5evRN8IBtqp4Hqc2T2rG4xEuWeWHMCF+6k7/MTDEz9QjA7J
 jaDCpo/CeBlKqAdX547IA8gvKNo1zA0+jwrq7It7JIVKrZciLxmLzR9NKqYdd2hTv+kT
 OEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753820244; x=1754425044;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WV9Qd8VswLll4F/W1lnqlWzljnHTNQ+aOkT7Q5f8HDM=;
 b=rXugpo6YAXA57aUWfUsUl9d5CMMvQyfF40m6lWiMZCDFamGDRYYB1EnBRLFybsbUUj
 VMbsBeKhlZOl/zPdY0aYmcZ5U3ZzTGmsrsdzwgwUUaoP0UZNpAFt/xn7khuSmTe2Cquy
 +KnFAYACXMLuq1pMZg2N884xOacRH0LYGPI+dUp7NqoV5xfbujHXAXUkqFx746VF1gF9
 dmXIr/B9zti47M8TjgFnUwDRSLIMwdV8bjeHAONdc8+phRSQoLmwy4ojl9xmW+NAcKEz
 +XAkKEfR6TdnpMt/Wd6vGrYB0sIgnIItQb4PqUIq8DI/ZkZHCpCsR3L1TudE0AXGXjbU
 OGHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPopt9ctxbnAQfWPjAE+XjoSuuBokHf7qPLSOUmnIpf6QN94Px3ken7ui77d02KYtFihza2+H8m84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUQblAbsCXtDTiVKJ7uHToBpANsKBTLsXIQhIEvz10qjLIQUPj
 1ahxqU34uEyXbqmApFyiT6xrzBKqiw//LA6b/tFNMh33+BTSsf7UlHf/ZQnXCaZJwSM=
X-Gm-Gg: ASbGncupPfUu7Gge3SOiqgPC3ZK9dyYCsVRYbZ6Qxucf1gQWlB//jgN9wLLafsfEIkW
 aSl5CJxgnV/NftDcxQOO2A22tTdzR4MbDMbryALfe2rqzD1d07+TQuija/DBUEts2lUZ+W+/jB3
 +12QkKzL4SNJ0jAjAdvcLvQ9mE6TD3up20Q3YHP7vwuIdNhsogxai5pfprOcK7JKjnxxNcFDfVo
 qAfU4B1i1KLSG3yFar7jYlcCG/0wRuA2kJqJmoM3fOGizL4f/OeDX+cqykCTWBbwzQDnsUMJmlt
 FgsvmNb5wlCUGzaSHsIE1R2w/JkRZqOkso1iBlgxKN3zCeV+LqeVaO3YDZAj1O4QY3jAWV4IQM5
 LXt6maI1weWlAicK8YTRrA9ZgjDLiN+j8hS2OvA==
X-Google-Smtp-Source: AGHT+IEFcub92jjAML4HPfzljPRcZ/77M1VzhjyaMyYsWNiY6ZAsBgO9tT8uZc14CT8rztQkaVJldw==
X-Received: by 2002:a05:6402:3595:b0:612:a77e:1816 with SMTP id
 4fb4d7f45d1cf-61586a81e8emr904905a12.0.1753820243958; 
 Tue, 29 Jul 2025 13:17:23 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-61539ab9188sm3192426a12.26.2025.07.29.13.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 13:17:23 -0700 (PDT)
Date: Tue, 29 Jul 2025 22:17:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: FLAVIO SULIGOI <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Daniel Thompson <danielt@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, 
 "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>
Subject: Re: EXTERNAL: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
Message-ID: <lv6otiqcqa434anam2gx4czhh3jac4stlkl6w5aasqlb5c2ohj@mzvf4gc2bxsz>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
 <PH0PR22MB37899F7A6262C599400AF912FA4FA@PH0PR22MB3789.namprd22.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ndpangs3ennqytsz"
Content-Disposition: inline
In-Reply-To: <PH0PR22MB37899F7A6262C599400AF912FA4FA@PH0PR22MB3789.namprd22.prod.outlook.com>
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


--ndpangs3ennqytsz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: EXTERNAL: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
MIME-Version: 1.0

[Updating Daniel's email address as the linaro one stopped working]

Hello,

On Mon, Jul 07, 2025 at 03:44:25PM +0000, FLAVIO SULIGOI wrote:
> > the first patch of this series is what I really care about: There are
> > hardly any drivers left that use pwm_apply_args(). When all of them are
> > converted to not use it any more, I intend to drop that function.
> >=20
> > The 2nd patch is just a change that I noticed while editing the driver
> > that is IMHO nice. If you don't agree and only apply the first patch, I
> > won't argue. It's an alternative approach to what Daniel Thompson did in
> > commit 7ee6478d5aa9 ("backlight: mp3309c: Fully initialize
> > backlight_properties during probe").
>=20
> I've tested your patches on my board and all is ok.

@Flavio:
A Tested-by in this reply to the cover letter is understood by b4 (which
is the tool most maintainers use to apply patches from the mailing
list). So there wouldn't have been a need to reply to each mail
individually.

@backlight maintainers:
This patch didn't make it into next yet, I guess it's too late for
6.17-rc1 now?

Best regards
Uwe

--ndpangs3ennqytsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmiJLE0ACgkQj4D7WH0S
/k62qwgAnN30pyYbtWid6YYqnkI/SakoRr8lH8xnQ7FpBuTLizy1TJ+Rq5QPBW9G
OHoyHIkdXLY98NluE1dEAL4OhwsHkKOtuU2LUe+d4tCvANSdr3dSuqf8VGkwtrvH
hIVM2oiS0gGNdfvBHmEJ/TTd3Aw8bif3F4L2zkwmOGruxi6eAkh+TXkOXHkBZNXJ
wdY7mjnO6XkXB4OG6cUvX0N01zRjxtT6Bv+NQcLqnQL2n69erh9XmFvgMPBwA5v5
aPURv9W38wM/QTCGrs0H56lnCFFp4FJy1w8P7CUnSjnhvqhCs6KbyTt1VD7eFX9K
MXDbvP6A5jwrE/7msBl9s7d6MIVqlg==
=tAXd
-----END PGP SIGNATURE-----

--ndpangs3ennqytsz--
