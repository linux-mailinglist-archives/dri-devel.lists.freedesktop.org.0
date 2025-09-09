Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D03B4FC31
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE2210E24A;
	Tue,  9 Sep 2025 13:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v7/iAwDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A13E10E24A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:17:00 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3e5190bca95so2004222f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757423819; x=1758028619;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fdo9zUh3cC7JZ4YMFIK1It9t13duwlrpE1xo6oVXcCI=;
 b=v7/iAwDtfm+sZzoWY+8/dar9ehaRZx867ux4Kkywe6KAWlqD5IonclzMEOMyFnRkUR
 8yVLfvsnFXZschQyOrJsY9vwHDAh4V1dCA8DVfPy+kQMqY4sTulA9L6H5ffDeXNnp17B
 w8bA9LWXniYYFU53xHi7KRXaouznxY4mof738WekVp4k/3dwwq29+lS6J4w0ESarAi6i
 rr2RKvBgWDFvgHYZqrUULLDAmGHNA6v4nUX02yh866K0IReuJLUe/WztBs+l05bdgfXd
 SQY0836U2GOhQNuZbGyldkl91OVWI3Bc2IJkH/AUpVcb5iOaDe1hXbLuoIpT4K8NIk2R
 sTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757423819; x=1758028619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fdo9zUh3cC7JZ4YMFIK1It9t13duwlrpE1xo6oVXcCI=;
 b=oqzIs/LfzbXDujlb5Kp3Ca8t/V+tN4WXGpZTasDBMwqanRItHI13KW8tXSHf6CfRX2
 zsTImSq1Ap8F+KT5R+9u70m3ZofJCUtPTZgG957fIeI+sVj65SetSxJc+FuX4f01ET3r
 4xw8fa9cc1k5JJ8YR8h+AY9Zp4ILi085KvZGEYVGARlSsgqcwcjtvJ8TyCayEJNVqxss
 yCBH6WAYvUxHPDXbZjZk7S2Ed/Tv0+E1bcLSm+UzfVfnqZke+PyAplF135CBii7+1XGc
 CRTJEtOH+sWSUBxLEyFkVuRAiDj3z0EUEMIGisWnrbjT7zUG0WW/xt6xTPRjI69utDA+
 7GWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0tKNqpXMxTL48E2KD9HlFAkd4YsOfRCG7Po3MeIAaOqEti6agvxaGEAtBgN41iHs7YLCBzDkMX28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvaWwDCqJ9Mh8RPygp4fo1XvtsxPX3UV6ohSTj4bnNZnQi5eWJ
 0bR2oYSPWvgAtZjyGSyIRA689WS1VZ4uZedOfRX6zPD/psUKhbgyYD261o4x9EdWn0A=
X-Gm-Gg: ASbGncswkjzmPscbDKgvNk//qNLFZyQYKQHwTqIVSn+3/LPHAf8pfv2DrdSLMGbn8+Z
 cu5sKwOgOMNr8S9kJ0D4WhSRqQNKz0pdKKEC9No1ZawcesST/PXwUeXqd/FQ0G/uveMkwS54I9s
 zBYYv9ddw+kiCoQQf2yiB/gJO0yndtQ75w5JZQreddftcUAJc7eD/ZA/kuSzq63sVfyGH1BAEHz
 bJS1CIthU70wsXLWnUD6rZ7NQBgGIXlpDudptA8gwZjCVkaqyWKyz24Niuj911Tt5Zjx/Lof7yY
 WZPYkgI67jPMtV0YmdjLEazUkmufSlJfhOsGxgxX0gx0YtdINGPIz6K6VR2ux/HLGpzW6amHGWE
 7WJvyuiATW1HGIl9p8rV4iH3X84hLh0HKrVkB0uYqn/KRnTrgwUxvOFn9Hgdd5j5c
X-Google-Smtp-Source: AGHT+IFhCowW9gu1/w93obIiBVf6Vuc4ShjzL0HEHZ6PJqdOO6o5Jz7iReA+oY0Aa+n+lLDZfcOsfA==
X-Received: by 2002:a05:6000:4211:b0:3e5:d2f1:403d with SMTP id
 ffacd0b85a97d-3e6440ef05fmr11560309f8f.36.1757423818701; 
 Tue, 09 Sep 2025 06:16:58 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3e7532f90e6sm2066036f8f.6.2025.09.09.06.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 06:16:57 -0700 (PDT)
Date: Tue, 9 Sep 2025 15:16:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel@riscstar.com>, 
 Flavio Suligoi <f.suligoi@asem.it>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 2/2] backlight: mp3309c: Initialize backlight properties
 without memset
Message-ID: <d3mnxjbtek2q4465xgje2orjbzmbrkcicapal4apiqk3hc3hbq@3jp4yytvtmfc>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
 <14514a1b0d3df6438aa10bb74f1c4fc2367d9987.1751361465.git.u.kleine-koenig@baylibre.com>
 <aKLvaP55PIVhyFSc@aspen.lan> <20250902103632.GH2163762@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dbmzc4rcf7ixa6l5"
Content-Disposition: inline
In-Reply-To: <20250902103632.GH2163762@google.com>
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


--dbmzc4rcf7ixa6l5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] backlight: mp3309c: Initialize backlight properties
 without memset
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 11:36:32AM +0100, Lee Jones wrote:
> On Mon, 18 Aug 2025, Daniel Thompson wrote:
>=20
> > On Tue, Jul 01, 2025 at 11:22:37AM +0200, Uwe Kleine-K=F6nig wrote:
> > > Assigning values to a struct using a compound literal (since C99) also
> > > guarantees that all unspecified struct members are empty-initialized,=
 so
> > > it properly replaces the memset to zero.
> > >
> > > The code looks a bit nicer and more idiomatic (though that might be
> > > subjective?). The resulting binary is a bit smaller. On ARCH=3Darm wi=
th
> > > an allnoconfig + minimal changes to enable the mp3309c driver the
> > > difference is 12 bytes.
> > >
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >=20
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
>=20
> Looks like you cannot send tags from non-related email accounts:
>=20
> NOTE: some trailers ignored due to from/email mismatches:
>     ! Trailer: Reviewed-by: "Daniel Thompson (RISCstar)" <danielt@kernel.=
org>
>      Msg From: Daniel Thompson <daniel@riscstar.com>
>=20
> I'll add the tags manually this time.

FTR: The email address *or* the real name has to match the From: line to
make b4 happy.

Best regards
Uwe

--dbmzc4rcf7ixa6l5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjAKL4ACgkQj4D7WH0S
/k5BrQf+JX3ho13wgiKmkcJ0Tjb0+y2mxhAU2VHfSxu0jGL6GsKb00SZXQ7/bQ0y
FpqkmXr91kb5uhg5pOQL0D6W3OxwLRFLf4XfOL84TaAHintXN8gMBOsJA+Pn9iIA
5rqGHhO7dT4zJt9SmdGVn7f9VBu2qdvo4wpf/tvzlIcYTYFGD8W/giikgRQcJcI3
Hb3zRDIrRZWcNfHoN7yGFYC13iL2PyRFns/eyw+YqzCud+fHvfHbWV89l8LEzNod
iwlF/fHCaSa7fqG154A0PgXPyF3ltgNwwi0RUNiwAtX/i0WcZrWYMavCTToq+SgE
KrERYvE7oOdpFcIJNmXdRWQYyeDDZQ==
=qQ6Z
-----END PGP SIGNATURE-----

--dbmzc4rcf7ixa6l5--
