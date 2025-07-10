Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F5B00032
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 13:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0735510E8B0;
	Thu, 10 Jul 2025 11:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mhLPpExV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DFC10E382
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 11:10:49 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-55502821bd2so809228e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752145848; x=1752750648; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=s5c6mdpZ5N5FmfKJmH2vsM3IpF/Oago8XZttHkyE30c=;
 b=mhLPpExVS+EbOsE9RxDW79Q/vutSrAsnxsfFLMeaPiYmAujyZvw79X1SQW1PNq332t
 9EwrasokOQlo2XM3dMt4vimJatfbA6aE2etGAK8kYkBCHBJEkosRcY9bp+bm0rz2sCvp
 UswZo9SVsrqpfwkxvbEcYB5UrLKdUwBuroDl6XxYaE0YIxQ/tf2S+6CDXAI8hjGiQxGD
 6cUA0jX4YAiDPOJa3qtDTyrptY+rt/BgGUVepVQFpTd8kYrPVrKK00eRwv3j9WHkrsfI
 4Rx5kqKv5QolbNN0THVFGY+o6KuoCeQR22HDZC74mA3UWkbU/64RI15yveO5LoAtBFad
 jeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752145848; x=1752750648;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s5c6mdpZ5N5FmfKJmH2vsM3IpF/Oago8XZttHkyE30c=;
 b=llfOPZWlEUQPGbhWlhYeLDzKu2L9LJzgN3h+SJdqan+2LSaUmAsV315SM9R8iSPkut
 jl9tI1d5hUJU6tP/aJGj3xcTSJdH2vHtUnuYAV6fyEcJ6gmJJhSF0Tcku7MVLyjumyqd
 LXM/JHjVNHxF8dUsnoUojSXQQ1VNke0N7PUeN1tG6OQp7qCYrj4OFMq3Ayw/9KENTA51
 ou9ihlOBQ1XLr1Y8oTd1ZbgN18OIFilpQFtE6ZPHuEvZDKObijiDd50lJbArjVHD0noz
 hoGTPqu2Jy8egHbTI1ofQc57PCgqYOzfb9PxpWsGZc6mTU/D0YjTD0G79wY1a3RGy6pX
 CRBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzExFA904FZggIJcZHUiil5/oEI52X8ElrDK3pDSLKgfOLKt+8dantWbcYoYPdcCMNPj/j2JOsIYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxM2WCbTTE8V2++agnDebAEzUbAeREwk/ExphdKOHMc8Gmgz6E
 1iXofsJN4DVie8PwEEYC5Jby0kSbh8meatRRzH3Q5YB0TQmh3kMyxJ2U
X-Gm-Gg: ASbGncschEzB9EUu5zUkrW8AKrLL9mB2ZzZZPIt4O4vr0mUMOqEIiOHJoVaGoWk+SgG
 ITcUQUH8hnIXXSjtzTooizQkehnFB5G2hO5FEunHOqcJylE8qGRPV0ddb4HIaTsczWAMHoz/hT3
 aTh9MFiPhpjZDaLuzEuyAY7LCr9Raetu7hH8CgZ997qduGV030xwXs6kHLuzRpD1+K2SHwAP10b
 ZkDsczjniJ3WiKQkLFfzk2/+SrcJNfIijbRQdOG6o5JMKjN7ynly9yM5yZIy4ayVmbK1PkCqxjG
 4Vtg6MHeGCXRHaUnE4G2FyZV55dRKGf/pjr7cdkI5Ia01bxAUj1mvtNrM38JYGKa4VKqmvvDxWm
 gqBnn9oQFRk1n+EaXrwP5508=
X-Google-Smtp-Source: AGHT+IGAn8vcyrP1uTYa71RAZUTwdPJo5Eh/xm1IGiD6J5/7twt94HWi6Z71hsGH1I9HpbsakCg0Jg==
X-Received: by 2002:a05:6512:3b23:b0:553:314e:81f7 with SMTP id
 2adb3069b0e04-5592e34ff2dmr912102e87.17.1752145847792; 
 Thu, 10 Jul 2025 04:10:47 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b808efsm331907e87.245.2025.07.10.04.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 04:10:47 -0700 (PDT)
Date: Thu, 10 Jul 2025 13:10:45 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, ipedrosa@redhat.com,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/sitronix/st7571-i2c: Make the reset GPIO to be
 optional
Message-ID: <aG-ftUl7l2zNm_eH@gmail.com>
References: <20250710102453.101078-1-javierm@redhat.com>
 <20250710102453.101078-3-javierm@redhat.com>
 <aG-aXTgycE4JEJEZ@gmail.com>
 <87jz4gfgyu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fti6taVECEwEdkZW"
Content-Disposition: inline
In-Reply-To: <87jz4gfgyu.fsf@minerva.mail-host-address-is-not-set>
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


--Fti6taVECEwEdkZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Thu, Jul 10, 2025 at 01:00:41PM +0200, Javier Martinez Canillas wrote:
> >
> > devm_gpiod_get_optional() returns -ENOENT when the GPIO is not found,
> > and that is no error we want to propagage upwards.
> >
> > Maybe something like this instead:
> > if (IS_ERR(st7571->reset) && IS_ERR(st7571->reset) !=3D -ENOENT)
> >
>=20
> Are you sure about that? As far as I know, that is exactly the
> difference between gpiod_get() and gpiod_get_optional() variants.
>=20
> From the gpiod_get_optional() function helper kernel-doc [0]:
>=20
> /**
>  * gpiod_get_optional - obtain an optional GPIO for a given GPIO function
>  * @dev: GPIO consumer, can be NULL for system-global GPIOs
>  * @con_id: function within the GPIO consumer
>  * @flags: optional GPIO initialization flags
>  *
>  * This is equivalent to gpiod_get(), except that when no GPIO was assign=
ed to
>  * the requested function it will return NULL. This is convenient for dri=
vers
>  * that need to handle optional GPIOs.
>  *
>  * Returns:
>  * The GPIO descriptor corresponding to the function @con_id of device
>  * dev, NULL if no GPIO has been assigned to the requested function, or
>  * another IS_ERR() code if an error occurred while trying to acquire the=
 GPIO.
>  */
>=20
> while the gpiod_get() kernel-doc says the following:
>=20
> /**
>  * gpiod_get - obtain a GPIO for a given GPIO function
>  * @dev:	GPIO consumer, can be NULL for system-global GPIOs
>  * @con_id:	function within the GPIO consumer
>  * @flags:	optional GPIO initialization flags
>  *
>  * Returns:
>  * The GPIO descriptor corresponding to the function @con_id of device
>  * dev, -ENOENT if no GPIO has been assigned to the requested function, or
>  * another IS_ERR() code if an error occurred while trying to acquire the=
 GPIO.
>  */
>=20

You are completely righ.

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

Best regards,
Marcus Folkesson

--Fti6taVECEwEdkZW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmhvn7AACgkQiIBOb1ld
UjIffw//c3pLhZJ1bRWdSMjo7egI2nUhTlVDEXVGWlnY+fPOG4uQJzFvUV0PM2vx
usQXvEGi1V2wJn4OF+937kfNUqoYyS/bkBj/QlBZN+/XRPlDitve0B83uUt4nQgJ
4jxjoaUnsQI/RNX2YSepQJaRh5FGTceeSPyRpVIlW2sy7IcheAB9mCxfhNc6ACtp
lUhrgsKiZKF3gjpNn5GctJbVyPPrFsdN90wIPXaD6vHdiVGk4gZfqUSxakb5Ifrb
cx3scfJMYWNPefjYoSmHeCLhBT+nWUls1kXBIWejE45f6tyToHzrIXs737/UFk6Q
qE7YYfyVsdWFEbzFALq1qY1AkPzVqwshEBNU8kDoL74DW4/pd+dlGctxGgZZYj/q
UEw/qT5gaq2xyRjDPitUaliFG/40sl1F5MVkcMRux2B7uxOrobZu9iJEPzN5oiA+
O5ywh6Ky6G4+lSJksgxv5fX4LoNgw6Xg1t5CiJREvhZzEpeqDaMndNfGZQsJg73i
qaXy5LHd9ApoMkLtCUKgRUP33uUh9GUzXwE5CkY0YGi8lo8ehxz7vxSAhIqXXlUf
JaLskasLS379gId/czLgtIrdC0DWLgaRILo/ccFspccgVf7UEcF9xxozEnoNfzIW
bkcNeSkSbgFtSANueTT839c/Q1JgbFZ3mjchardAJ8APLtGq6do=
=TOBA
-----END PGP SIGNATURE-----

--Fti6taVECEwEdkZW--
