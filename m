Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BF0BC81F0
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 10:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390D10E0E6;
	Thu,  9 Oct 2025 08:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HyA1t7j/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7606A10E0E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 08:50:44 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b3ee18913c0so105197466b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759999842; x=1760604642;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mqcknWB6eCX2VYrA61jN3BkPJkr8rXkQ5glVIbwi/1I=;
 b=HyA1t7j/q+8Rwiw6jKsNOlNL1VGMYKKRB2sm5O0RIFQ2fspgSzcY1NGMSv5sWidX8J
 xpqLV6Ym9QO31nkO0RKNfy7TjpYLsN7xhCPlgAoSUpENlAfdpp/GSO9TfxwGf0g4vLl8
 5ZyOl3gl5sU1SAiSSJzjSIRO2t9MGnLaJMmRETo1yZ24r4GmdOQeu+sl6NkNeHqWJE7N
 2N0VHxITDuZE4xMukMSQYz927JISFIzMWoIghW31mqb4rYRg8o0oDTeI85l0KL1iSRXK
 fxZ1GcFTa8tpgMXdtJG/G7UDe+vMw8pn/84jpAb1bUF69LJAWntwJmrqylA725bh3jjQ
 tFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759999842; x=1760604642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqcknWB6eCX2VYrA61jN3BkPJkr8rXkQ5glVIbwi/1I=;
 b=jUvy5N2wgh+2Gj959RR7oqDHHX2BkOQ4eq0ykRkzjdMH+DwCZp5g81htsZVevsLN4L
 B9gXOcA8S/WwAYprsFxHC1k0AfE6P1GzqsS+xLSNJ/qydyrilrvc7WbizELOEau2NKZA
 a/uh04GYL3jHZl11cKguyK1FCRDKlcolERDVwdtztkwW3uA+HMEq3X75W2waA07/i/V4
 RVvWso9jLgW7q3kBEZcFTQXP9WbJ1aK4xYuSnK+rJjxeA1RAoAHvmQ21jDahVMv3AgwK
 eVxS1n+unUjzFke3fc/YKp1rtJhd3mxA8nLvLwbAr7YbgdriPF6XugZjSqHS4C65a53R
 vMyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE8U6U9rLdGtTsSy4c26RgIrEpwxn/IUHtfoeQOeoEdNnIUiSZ5mO3s2pNlSXKww37mJVHcp2fvzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqW4tkjIA580V8IepFmJiapOBJ+3kDXW0yiEGV4hFxlXZEownk
 Evb3CqWLV2FlMg0UOuioLAlD2GWbgo4jpHuEf10NnmnyjXo4B03suX21p1u3rdCbxEw=
X-Gm-Gg: ASbGncv6Ho+UBNYyr8ERPPgy9ikTLOCzmVPJqGiAoWBfm9FC8Rue8sdjAy//FMLJlJq
 KxTtc5UrFsEqbr2t4AWEe9i+aY4wtdrrfD0z0jHAibwpjkOabAkNGEoqEFO80pA9ITbW+1ijGvX
 szrx6AMH9sdpgVOS9ImsqBfoXHLf+p8Pn/9BbEuzXcNiDtHOc/csrl6HQPys2oztZIwTE5VLbBU
 +Eq5H/M4BQB6qW444gMK6rUHUwzck6ZrDNoiDCohUt6Cs7rMoH6f0741cTVVicVjrrCOdsBCvR2
 9uFTYS3c2uFzf4WfSiZwUno3QnRWY6QYjvDgxlycjw87ygrfWbD720t7gWANVwOj9BWm6+rCImZ
 rbLLsBE3gmhtBiowKx5H7P3+DqonL1lYQpdEdU+cW70jlCh/I3Jo=
X-Google-Smtp-Source: AGHT+IHTCsyomQHU3pUrJjrilmhEN+1Nd+VpUwPLw6bAW+0LgCwbEc5fSDmHQ9jLfCM8ldZVWEaKhA==
X-Received: by 2002:a17:906:d54b:b0:b45:66f6:6a0a with SMTP id
 a640c23a62f3a-b50abed1a00mr678418766b.44.1759999842334; 
 Thu, 09 Oct 2025 01:50:42 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b4c855585d1sm1116706366b.67.2025.10.09.01.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 01:50:41 -0700 (PDT)
Date: Thu, 9 Oct 2025 10:50:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Javier Garcia <rampxxxx@gmail.com>
Cc: deller@gmx.de, tzimmermann@suse.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, shuah@kernel.org
Subject: Re: [PATCH v3] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
Message-ID: <dis2jb72ejrbmv26jdj3rwawrdmhmde5fahrkdn6y3elsgg4p7@wsjopejnmz5f>
References: <20251006164143.1187434-1-rampxxxx@gmail.com>
 <20251008183627.1279115-1-rampxxxx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2pqbmbzj5q22iux5"
Content-Disposition: inline
In-Reply-To: <20251008183627.1279115-1-rampxxxx@gmail.com>
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


--2pqbmbzj5q22iux5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
MIME-Version: 1.0

Hello Javier,

On Wed, Oct 08, 2025 at 08:36:27PM +0200, Javier Garcia wrote:
> This patch wraps the relevant code blocks with `IS_ENABLED(CONFIG_FB_DEVI=
CE)`.
>=20
> Allows the driver to be used for framebuffer text console, even if
> support for the /dev/fb device isn't compiled-in (CONFIG_FB_DEVICE=3Dn).
>=20
> This align with Documentation/drm/todo.rst
> "Remove driver dependencies on FB_DEVICE"
>=20
> I've not the card so I was not able to test it.

I still don't understand why the creation of the dispregs sysfs file
should be conditional on FB_DEVICE. Either they have nothing to do with
each other, or I'm missing something. The former makes this patch wrong,
the latter would be an indication that the commit log is still
non-optimal.

Best regards
Uwe

--2pqbmbzj5q22iux5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjnd1sACgkQj4D7WH0S
/k7BbAf/QLsyGkuDfs6LkdXxSM3JUBB+yt7DzUjuOuGak31kVLqt/53SRBN6dK5H
hutjVuB8TOyFnQe5u+U5sL4xHApig5CPAl6OZmT+rAiNMTf78uJI5vO0kHeDhhcE
9dvxQvzxWZ1v52BcqSmNZNN0zXF+K8PvCSmbsTK5dqGYWi0YtrI1/U7SGzaUuPHY
jfMHmpOs9nNjJw0xjaXgSt2dP5Qjp7OvhAMf/VqXZVU/xTgKyndHZykUV4HnmVWb
RojLM4msHiUv14Njgqio0sR90BzGq734oI9JZE50PcMhB/Ch/1LGCKNJOVHfRNcQ
9/kD0Fn12tVy8Zz5XjBV+Sq9rUPI4A==
=RLfl
-----END PGP SIGNATURE-----

--2pqbmbzj5q22iux5--
