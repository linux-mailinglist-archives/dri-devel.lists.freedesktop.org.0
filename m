Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92155D12676
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D40210E3B2;
	Mon, 12 Jan 2026 11:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="v1uamZMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B8710E3B2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:53:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so50372345e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 03:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768218825; x=1768823625;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
 b=v1uamZMyxONn95POjzueNgym+rKzBN2MQOau8xrjxjhpEq69z18cWIrDgTUQKxpuV+
 zTMfjaL39URx/ld6nfQaChuHTAItcoL/BBBU34jOgtNHEd2SUfnfIXHah04Gc+7d5a91
 Ko94j1yJx28bTRpIoSiP14C/9gyeWi9cYW+aSKE8m5pSkSxzyYpWsHkGBigZTVbetOQs
 GcBT3F1cHBXGZZyayQonSx4bi55WUY1ciuaiQiwJWFJmQ/iq7GBIK5ExvIX0/ZGaeH3v
 56WdTijIKQz8gnmAR1CUQIoRLYFm6GHSM1anxSHiqjuaU1zQ0D3aUXzUxeMwnxb2ousj
 avSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768218825; x=1768823625;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vmTytKEFKU0ifzxVpiXhAKs/Bpsn0CVSj3hYAL8y0FE=;
 b=l38nzlkzBvimHwbra/XS1bNVsXf+WeE0Rkfy8MnNfHqRTTkLVjo00fRbvpiPxZMJJE
 r9CaCt1WZ0cJ9NE4VwCBth+etg6fIeRPrxPZ52n014HngDYz8vCOu6lZQuNiuk9clXrL
 COwKkzvueUa18CqRH4AGrWi+/EJjIhN5ale+SLpu4TIuSwCYsKWOWs2FrPkwUZPM8Urm
 ZxIBoUwmNFWshIM9NcU2DkZEuCRyFqbZfN+CrqrYo4BjMirLGitePmDG2ZTOVaVYPSrC
 qWN4XRzeOE4sX42LpzhtZQ+7dSozbQziOy7RF7gpuMRE76ROkXZmdmm7XTsyTtvh/ecJ
 R/8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMbKI/+quz1XjQxYRcRHhp0FHeVmhYGrYsZ/EcIiAHqONM4IB8k5ST7aNdN8Ub8nBLrS7KV3k2XBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRaUAjHnkYGbF3aXTVZfSKj2xtihXXkvJsb0kD380CkFS7d9aR
 k7EAh6kAepNSrXwOYeG9gZRbLGyMBjE6RiLeliH4ZTXJ5H7e+q++Cy3dq/tLujFPqEM=
X-Gm-Gg: AY/fxX4yakIVbQ7XEjsjczL6kSjhCOwtZCbzRhJPF4kDD2vis+YmOVAnJryWPGWeLtM
 ktmbbBAbycXt7jfDdqF+sFksojsvBLrD6FXtvI7zOVUkVJPBp+VnZlWfkixZS0NFTVKZQ+SK0ST
 9nCvGuaj4VCPMSM95YqvN0NJUYUOJdrcHdr5jABttWHlm3uTyJ43esIoHp3Usu+4a5fBymjr/mL
 NtGJbjZEfevzik2G1nZhnKe6l5t2Qf9XB6wPjOBvDRQAHF0XvJ9ObMXWYGDiYekzOYtclNJKBz0
 ZaXoLoWYSjwO+vd/Q3hizNI0ExpZNWQYYDz4+rbSyyHSpRGMC7VH6OahP8XJ6vz0fORqaZaPZnv
 pSpMT/rEkVrf82MAE8sgkG44/jJCbWQKrZ7W9gqG+qUDEsfw8VgTgVZOd5ikFbff8Am+l4khffq
 fpyDT26TBHH4+ClSZDlRiP7tOBVgnN0XUtOfs2g1VFe5r5JLDSpG0Np3Wo78p9gEzhPWybtcg6r
 w==
X-Google-Smtp-Source: AGHT+IHS+X3LSDt5qzxc7wN+ZiHbRa7V37jnrS+IUFcr2yrSlHBW3u8uORHbJtAGSuAyEXEXsweZBQ==
X-Received: by 2002:a05:600c:4ed1:b0:47d:18b0:bb9a with SMTP id
 5b1f17b1804b1-47d84b54031mr204347325e9.33.1768218825500; 
 Mon, 12 Jan 2026 03:53:45 -0800 (PST)
Received: from localhost
 (p200300f65f20eb045084e32706235b2b.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb04:5084:e327:623:5b2b])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-47d8660be14sm134733965e9.1.2026.01.12.03.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 03:53:44 -0800 (PST)
Date: Mon, 12 Jan 2026 12:53:43 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Akhil R <akhilrajeev@nvidia.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, 
 Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
Message-ID: <qqdjk5wi5xlily3cfa74lrepglo42ibnpoyam76vwkymju3hkh@b5dc4yg64mhs>
References: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="atue6rojhx5cbpx3"
Content-Disposition: inline
In-Reply-To: <cover.1765355236.git.u.kleine-koenig@baylibre.com>
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


--atue6rojhx5cbpx3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] host1x: Convert to bus methods
MIME-Version: 1.0

Hello,

On Wed, Dec 10, 2025 at 09:31:36AM +0100, Uwe Kleine-K=F6nig wrote:
> with the eventual goal to get rid of the callbacks .probe(), .remove()
> and .shutdown() in struct device_driver, migrate host1x to use bus
> callbacks instead.

This series got some positive feedback but nobody picked it up yet. Is
this still on someone's radar? The last patches to drivers/gpu/host1x
where picked up by Thierry.

Best regards
Uwe

--atue6rojhx5cbpx3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlk4MUACgkQj4D7WH0S
/k5w/QgAhE2EAWGMq3JkMD2P64EjS1rMwsjti9FFnLXqoSgWOD1/HpSebIxgHVUH
9SjJD/+aDtRXdiEaEM0CWYWAcTk673HShaX+R5uJ+NUSegWvD1bO8RXbwYW2lW0l
5XEoBJro1TsCECL4gBAlxENblu01RKLwAnTAcCHRjTFEgjM833wJgTFdHrtUAZxZ
uiEOWaOT1mxK+8rPLf3lPzeu/3NAhDsUGyqIMDA1IQ4PUkSxBwR1A6CZPsL916r1
+Rr9xh8Jo7dY4QKqb7SseBTkAoqcbozDpROJPfpUmUbHCPld8WkAx7mt8I/DTJ+M
+lGuvDBluoPISCAslcMNqdQ44lcyOQ==
=kDAI
-----END PGP SIGNATURE-----

--atue6rojhx5cbpx3--
