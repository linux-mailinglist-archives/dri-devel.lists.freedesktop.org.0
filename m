Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9DCA4BAA2
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DBA10E136;
	Mon,  3 Mar 2025 09:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sK7p1B0u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6037310E136
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:19:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-390dc0a7605so2232703f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 01:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740993549; x=1741598349;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gcNOncFZdUs+yNeq8pr7D0R7rzSHI/mcL2lr8MRssiE=;
 b=sK7p1B0uAn4/fr9uJ+P030OAvxX5BjKAdBzdzsuTm/n0JmC20TqdSiaU7c+sch4Aea
 db+yJGiwq1jsgneuOwrXOmqZyzOn52XTuFIlBVGzqkGzaYW5a3vVSWap6X5F8ziyZs3A
 OIJJ27UzCJFYzq3zFniGUW2kR94ltk36ArmnDYeeg3LvMhJMA0uj66B0T0LITTBkKvOn
 TRZUjO1xul1Z1kVfb/pt/wezC19p79gijYmV41eOrpWBNYEhrpVv2mUHrgPut4CrD3xI
 i1ueP0DrMTG6lNXPZAOejaVhXGjyCcNTRXibG6ueabfFjJgEFyBgBwPBSrOXDtU4vg37
 cVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740993549; x=1741598349;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gcNOncFZdUs+yNeq8pr7D0R7rzSHI/mcL2lr8MRssiE=;
 b=PzOt26gJb7H/QcwHav6YcS9KSN23HRgY8mwzQo83JJKGIg6KY4DPbq8uWkGYVyRtiA
 zDdVICLQ/ZaFx0cQ8udlagKeePYTp688lKR4t4UjBeWQLJLA1kmBaABPKt4Bznqz5vTb
 272KB7X/teITzs9bHJm/ws6JAdeDdW1h2IBqbKQti1Pn10E39jD8vCdTngg/NVYPYEWc
 v1AMKfPSqGZnwi7W3qTB8tsoE0O7+aIwYF2f8Lq8FVXf+gNM2YaVx+2hPHTlm7JcDLDw
 k+2OCY9rO0iKdCDlC4Bdnzjrp932BTWqaLulaDWN1OUNYjZE7a5e+gwEhhAQjSiajepC
 wMKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5mKc/DlJIiryjibMZabl5L13vDNmjt/LAwi7CUJ1plxuAHXgrFcnxVgtbpa/DVi7W75ufG+JYihc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI1jTaJMZRRuj8YPEDzRvCiLICl1nkHwzO3Gmux8FdM1XlZWK7
 VEQuQ5CeaI99TvgGXkSjlUnFQ5In+ffg6xHOAGTqpPw1Eq08/meB2qBa95+0dvc=
X-Gm-Gg: ASbGncs5UHufNmaz8/7rHCIA8TcLX1ct/rjYdB019nLOTH3n1J25NoY+o7a0lLEirG0
 6/LGltxUHT7uDzb7M6BpqwIU9Aen/Kpsso1hW9u0Nm5qN+eNCTd/urOpAk4uY9O9pqmVzrxoCKR
 P+oyLdw6VeK+fgO6/QymUWlnJaJx5waElCkU2/nejBANdxeaNOPVHSABpAPIZGr/LqZw1+BK4St
 d3duwc9j64J2yoAgDExm5f/UGUyDBImoiz3QsHHwShS6HL48jlVIDYhhqhKcOJ54OB0ptUz68t4
 HbxpUUmoLL5oXzi9FV60ustZ7LAtqHPtrgYgdKRrYLbJ/lW7RSCPKnbjY1wpVm3MxPPuNJPUwkE
 JpPlgs5IEzkk5yvnpF7OvgccUlw==
X-Google-Smtp-Source: AGHT+IEgqURih64QQq878LAlpoiWUHZ5SF6g+OaiNjsjRHNfpFnMktBq587o0TTR3FHczDy3N5hAQQ==
X-Received: by 2002:a5d:47c3:0:b0:38d:b610:190b with SMTP id
 ffacd0b85a97d-390eca377a4mr9441525f8f.46.1740993549456; 
 Mon, 03 Mar 2025 01:19:09 -0800 (PST)
Received: from localhost (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr.
 [109.210.4.206]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a6a87sm14038348f8f.32.2025.03.03.01.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 01:19:08 -0800 (PST)
Date: Mon, 3 Mar 2025 10:19:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Antonino Daplas <adaplas@pol.net>,
 Helge Deller <deller@gmx.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Yihao Han <hanyihao@vivo.com>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
Message-ID: <ugymllbkcsg22ffgyofvkquh5afbvoyv2nna5udmy3xfhv2rjz@jhgghzldzm4u>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <86551e6f-d529-1ff6-6ce6-b9669d10e6cb@web.de>
 <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b5ssf4zg6xgpebyg"
Content-Disposition: inline
In-Reply-To: <3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de>
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


--b5ssf4zg6xgpebyg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RESEND] video: au1100fb: Move a variable assignment
 behind a null pointer check in au1100fb_setmode()
MIME-Version: 1.0

Hello,

On Sun, Mar 02, 2025 at 07:02:12PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 13 Apr 2023 21:35:36 +0200
>=20
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function =E2=80=9Cau1100fb_setmode=E2=80=9D.
>=20
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable =E2=80=9Cinfo=E2=80=9D behind the null pointer check.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Fixes: 3b495f2bb749 ("Au1100 FB driver uplift for 2.6.")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Should also get

Cc: stable@vger.kernel.org

to ensure this is backported to stable.

Best regards
Uwe

--b5ssf4zg6xgpebyg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfFdAgACgkQj4D7WH0S
/k6Ubwf+PAWfTbo0e8l6pPMYDWTrIlWDVs6P8JwsxmPeNHmuw2L+6JmiXLUt4r8K
BVOnwleXuUC4G/EKeAKqCwELLweDzt6QsmUWLUCsc6MWiQ1O3QDCv13Fty9auThY
kk47fq5PjnBwjmIVoMGXAgkBlbRg7kL3mHisr4Znw6RGM/T4kW4GGSSRKBNUDTy3
3zTnFrB5Yu6Kzu4JeU34zrCMxKAvQQoBWC61PkTfjcagCj/XrRG86KI818e+6ZPr
P65IgsUOVTGAFKASeg4ZDgvdvaMnvoOH2w4RENMNeHuYWCe4wJaW/bn5brGZq1eP
MJFndsnaHk7DCh94RiyWcyZ7veHiLQ==
=VPpv
-----END PGP SIGNATURE-----

--b5ssf4zg6xgpebyg--
