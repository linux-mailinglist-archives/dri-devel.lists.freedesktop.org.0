Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70D491C099
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 16:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928C210E21D;
	Fri, 28 Jun 2024 14:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UAFx551l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE51210E21D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 14:13:55 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42565670e20so11118795e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719584034; x=1720188834;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Aq9SouLfDkAq2b4kiLL/vjr3Qpha12g+yMURW/ZzG/E=;
 b=UAFx551lpLhG43dhUmoO7dClAmMfhOh6dUiFxK/q8eNVZhE7ntcrwHWvD5GmDXZFwF
 ogRYlyXtFWxBmTcMtaNisVFjcOqdgirKLx1rG4e0Yg+jREXxPEREmlSktbRHEITv0kBQ
 N5vut/4iIGmzxXXK+9a70PXQ76/ojlp872Dl9fH6e2dhHjW4Rp7PVDYoseLn18+I2tuo
 B6oXItGCCdGtMT072ocGvTCjnwnKyv3TSvw0J7ZDgZ/DHqcP0O5vvQF8cEh/RcI3hPgy
 +RK1lMNxXeZM1u4spKh0DiDaCI7pCOPxDLufaEYykDDBeje81COrZdJIkPFbtbawpN0I
 IMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719584034; x=1720188834;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aq9SouLfDkAq2b4kiLL/vjr3Qpha12g+yMURW/ZzG/E=;
 b=WJC98xVxKSVXmnq82f5DPaiAEJEVfwiQqpCDNSCEFHbP5DA9Fy13MZwGEw5ao3hsY2
 wNDUKBRDMVmp+++Je2/QTcecCcfhAsFiTgJWNqe+T64v/4quWcN8cAaKK85+NEJ7PWvb
 XkVrvTr1itBTgxxIwpNrBDcRB49phC285n4zAFJXPzBZ2MuiQMStslGuIMrduoJsb4FV
 eOIfE49ojXM18R6Qef/ocP93gr/xM6QC6XWbwSPKck9FMlhXzq5J4O8jWzFcb/Tz+BuR
 k/Zkvc9lu8c8uNvI6FAbUgyhfgxPjovtQYo6AxTQEaeaAqlDp1o5EOZP7vPrh8/oDX9o
 R/+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIpXg9p4sfkeKtPDfyaRIeWIxiNcn3jWOD9XOttww3kePB//zSNhdvf4Kcj7CFwKlqmwKQStN8dChsZSIPubTR7PPTOKcjwsl2fIUtN2dw
X-Gm-Message-State: AOJu0YwmzsyM4ZmvgGO/akkd1t90jeZ2zstjSRRkRTT6R7CVEkTt3ftt
 p7MNZRDtLfVoVyWiDrfp6kSJ0cPBHDpcWnIaNjgP4kXI1k8F/2Wo90bU3YisAZg=
X-Google-Smtp-Source: AGHT+IE0BlUwhF204AB9g4b6OLsdn4teKyk6Fag2Qv65HRVh4aDPpq9NzuY0p47pWCuW2XMrGGe9CA==
X-Received: by 2002:a05:600c:4645:b0:425:6424:5f97 with SMTP id
 5b1f17b1804b1-4256d4e579cmr18385955e9.5.1719584033689; 
 Fri, 28 Jun 2024 07:13:53 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b098426sm36633245e9.32.2024.06.28.07.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 07:13:53 -0700 (PDT)
Date: Fri, 28 Jun 2024 16:13:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 Sam Ravnborg <sam@ravnborg.org>, Hsiao Chien Sung <shawn.sung@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
 Michael Walle <mwalle@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] mediatek drm next for 6.11
Message-ID: <idb7c2ogmvecxetkuqo52sqkih7iflba4x22fgfcdt7c4l4rnp@tjysd6nkha4s>
References: <20240628134632.28672-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dchb2smjqohke7fi"
Content-Disposition: inline
In-Reply-To: <20240628134632.28672-1-chunkuang.hu@kernel.org>
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


--dchb2smjqohke7fi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 28, 2024 at 01:46:32PM +0000, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
>=20
> This includes:
>=20
> 1. Convert to platform remove callback returning void

Note that this change (commit f5d5759d29e93fa76466204ad34169b3900a36c6)
is already in next (as commit 573a39d05053cb234a9ac3c7b0b359fb3258bd76)
via

	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git drive=
r-core-next

=2E A quick test doesn't show any problems, your branch merges fine into
next. Still I thought I'd let you know.

Best regards
Uwe

--dchb2smjqohke7fi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ+xR0ACgkQj4D7WH0S
/k4cEAf/S6QnpqRwzYlwKHcPhnbzcx1y0kL8li82wdsXH5v18xQvthvSeToiduB+
0IQHWhoLOH1ZsRVxXBWDIKQ3buKXOIljwJzjxuqbOog5zyCLgJ2JHlBDDxK1TXSe
YPdqV6D2/+g7JX7jLo+d2houzoJKB6ZPVmmmKOqbfr9uMvlfeT/TZeVWkQTPiI/W
p1X0omkCzRZVebN8WV2Cwf0PSmPM2i72TmkUcwHILXqQ3wpqhtkdMh3xAG/3UjKm
O+95C/M0306/FAagcja/jgWQHxKoYMZ0IIR1a0FhCqtLw4CxSHmeR/RecdY77juF
c2piaGs6UTb1c5PIbh6YM1N5vkzJXw==
=A9h2
-----END PGP SIGNATURE-----

--dchb2smjqohke7fi--
