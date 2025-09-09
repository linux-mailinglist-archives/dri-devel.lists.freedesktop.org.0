Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81071B4FDA8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D01710E74C;
	Tue,  9 Sep 2025 13:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZCVAb86M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEF010E74C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:43:43 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45b9853e630so52302255e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757425421; x=1758030221;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+nWLB9y4BzdWZAFh61duSVbe7oQYF/G0igBbtFxPdK4=;
 b=ZCVAb86M6MwKnW33JWZQU/QmAG5sQ+OgdBxAkeTjUzIQTdJ4P8XsENRxDsNHjCRyHX
 CQ6cISmbqu6ZLibt2tTGWAKh6fLVcUx3DcJT3xdgEo3+Czew0T3+Z7eyepvge0ywD1Gp
 6vvsHf/8wdjr5Yh9KggC9/d9gpCyaicRAGchRfdflzzBqaa/QGjE/BsN09gMCQB+c2HZ
 Sf79O8Kb9CxurjDa/2bYt8j2cf0frJ0X/E21XyXhsPzCWe8ECRrSCzjyfEUlEtYedcYI
 74Nfl+tahMyOz8nYC9aPncEfi4yh9bomzyZR6V6UMC6vbSROUEh69NaWNDASZBAl7PEY
 B6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757425421; x=1758030221;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+nWLB9y4BzdWZAFh61duSVbe7oQYF/G0igBbtFxPdK4=;
 b=rOG+FOQE/MtBw/PT3WG57NIogb50eEY6WybsSt0b/M+hG5hrM2qnu2BUdZuwh+cb1w
 xqnyyDYsbHr8CxJxXMo88WWJJnzpu/6qQURTlK/DmHjmDQA44luaNWEurjgV2ka0Rmli
 fFmyfmZGJ4US8kfvwxLN9/B7dp0uV6zRSGUhiBP+ASf7n5Ow7d7K24tRx+tXKsCAWOAp
 X96UoopGG7JMsci2EnkgY77EF/FXjeQMxypbw/Ui0RtkcB1v+gEL97ACApmnBXsdTVfi
 nxn/0ZGFyT9sESwSMyRBcI0ITlFwTIGzymSFjim9fyaHAGBfB3YKQI/yF62XrNymVlYQ
 wjuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqxoOzKtYYtt7gbjoikxkxVAH9/z2pNiW0JQR/YQTHq/6lppGnsdsP/AhxmjyGFXm1cC7JRSrNwRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdQne6nqXB84GE+SEckQXq5obOHc93n+s9iQkVCbJWLHI7s38F
 yop02BmW58DXFaZgX0fBpGi6wAS8kgOovdGD/ky+THTxcEgpXu7BeXrdVcl5F2rBNT4=
X-Gm-Gg: ASbGnctqa5N0j4gl+3aiv5qTpv7LxeByvr2VnOnpRy2lltMyIRfwL28+Btnr4G5Whme
 ChEMw6ekzogwul87+Nwbw3APbxT/IvE0eing0cST+RBWwWISJ/K2SG+qT5hvfFB2L5OaXCDMVYA
 GlV9vQj1PhXZItJd4HFxFSzXzYkgL8YQdeBhCatQJbGAXFcpRFCVpPYzPkpuZOpY2XKueGMX1TE
 4hL5PkaJFKfEFtgZd4YfzAiuiT404nFxJWSTp6KDMj2WE2np+1/bKmZP08sr7QEj2w/bsQBxbNC
 J+DHjl4WYQC4LjqwGGyRcPbtrJO3h8SawuyYyn2tDiU39Ww9kuHZDLFIWVH7RPSqdN4YpQ0HhKW
 CEz6xqTSIk1Ekgrr0ZrlsmPRHxhHHcyJ9M65q6013cJK6j1bflFHHKXJiHJ9JmJ+F+ds5q+4lmr
 4=
X-Google-Smtp-Source: AGHT+IExZonjFWWehqLYtueahKiysRYM0WBg9S+ifayg52A4BJxC/bn3wEJPtkVa1EA4aEoE0OkwQA==
X-Received: by 2002:a05:600c:4585:b0:45b:8ac2:9759 with SMTP id
 5b1f17b1804b1-45dddecf557mr111182145e9.23.1757425421489; 
 Tue, 09 Sep 2025 06:43:41 -0700 (PDT)
Received: from localhost
 (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de.
 [2003:f6:5f06:ab04::1b9]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3e75223897dsm2886401f8f.30.2025.09.09.06.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 06:43:40 -0700 (PDT)
Date: Tue, 9 Sep 2025 15:43:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Flavio Suligoi <f.suligoi@asem.it>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
Message-ID: <zkqqw2jxtx7mhwbck5jr5kgdg5ze5bk65aqarpdzl2ieh2hdj5@fnm5lybd227v>
References: <cover.1751361465.git.u.kleine-koenig@baylibre.com>
 <175680932706.2261091.9987211835426797993.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kug3zs2e2qoaurrt"
Content-Disposition: inline
In-Reply-To: <175680932706.2261091.9987211835426797993.b4-ty@kernel.org>
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


--kug3zs2e2qoaurrt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] backlight: mp3309c: Drop pwm_apply_args()
MIME-Version: 1.0

Hello Lee,

On Tue, Sep 02, 2025 at 11:35:27AM +0100, Lee Jones wrote:
> On Tue, 01 Jul 2025 11:22:35 +0200, Uwe Kleine-K=F6nig wrote:
> > the first patch of this series is what I really care about: There are
> > hardly any drivers left that use pwm_apply_args(). When all of them are
> > converted to not use it any more, I intend to drop that function.
> >=20
> > The 2nd patch is just a change that I noticed while editing the driver
> > that is IMHO nice. If you don't agree and only apply the first patch, I
> > won't argue. It's an alternative approach to what Daniel Thompson did in
> > commit 7ee6478d5aa9 ("backlight: mp3309c: Fully initialize
> > backlight_properties during probe").
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/2] backlight: mp3309c: Drop pwm_apply_args()
>       commit: d22caa15de3a11b503157aec079cad4bf305ff47
> [2/2] backlight: mp3309c: Initialize backlight properties without memset
>       commit: 71ca0594c11b4030c6dece9ba9b080d652a82473

I would expect to see these commits in your repo at
https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git, but
the exact commits don't exist there and if the patches are included
under a different commit-id it's not obvious to me in which branch. Did
you forget to push?

Best regards
Uwe

--kug3zs2e2qoaurrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjALwgACgkQj4D7WH0S
/k68WAf+J5wpvAmD9PQ9ddCpeNb3UNH+0Vei7XvjmZIMHOe1A9WCJYVk8SaQ0xtk
4nFVbHWjAJUPCxxNqeMD9hR/ENXo2yUgAxD9r2ifDde8PMid35w9o6VJkgDvRTmn
APYswRylywm9RWDTqxO3TzrTvbUXOwUebUofJzrW9wzZIMDbh2TP8m8VS+x7+L59
NzwCKKIUSxvRMH1PzqkMmk9VNGlCksWpKSDa+KZn1QkY0nSgUXqmBzDe9E97rNF/
tRCRy8SRHmKAAuCWW5CwDGhhQExU2iooq3eW5lHa/oFEzfLwni6b+EZsZjzoSBWU
fX5AUmn3Vk2diZgaKg/m8Sc1h2D+9A==
=m9sa
-----END PGP SIGNATURE-----

--kug3zs2e2qoaurrt--
