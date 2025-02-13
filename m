Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B59A34BA5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D8D10EB4F;
	Thu, 13 Feb 2025 17:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P+y5s2Bn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFB610EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:21:11 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5ded69e6134so969671a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739467270; x=1740072070; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/L8X4e7idHOInm1E1NvmDqFmI3f3xIs3AaNrbgOvVqo=;
 b=P+y5s2BnHMtCWPSUfNQXD6LeBuQA6IELSxXRHdZs9A+CPVMc7vagkHTpq/RR6ERC4u
 M/utnY3c0y/+Dv/lv7QCeFw80ojWo6Gakdv2Xot424Q/BPEMnK5kRSVwFQ0ZKmFmVg8x
 mIeHAXpJw6R22WmikTqC31+GnsaDAsqaWNQqTHuomG2j+MuZx7v1sCmAvG+p4QKN28Nw
 BZnEBCP81XqvzqBbcMYS3+OHOsnYud9nlK9YX+AFGHU223lrFH9/ldFocHmUyelN7eLC
 4AV7oA09ht+orV2g0voY+PD0kbJ2VFyWnupniPcVHes4eNnviUNlsY/Smrb2qZUgdmde
 xK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739467270; x=1740072070;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/L8X4e7idHOInm1E1NvmDqFmI3f3xIs3AaNrbgOvVqo=;
 b=luFBa55CjAHfGCw4BQhYj+zw4pjna2dBCYHemypSzArRvGUfgnINjLY2X9kqv1Ip92
 ZEWhih5cFHuuO1jDJVs15RfWEHk/LLODMkWJkxdri2tvhXmVaaiMN7T4Q0y/GYSprSqp
 SNXNoyHDU45eA57EhydWPv7lxBtY2rA0/mPiE52+G0qvps60WyPDegUKeS4QKiti581k
 UR7mkYFvaee6MTh0fL65Ya6beJv3wO6kYWOvvqEMZ8uTDNPm9GTthMLokw8ek8RY8DGZ
 6zNtdhbXMtsHQuXvBRluc2P65yPBuChDF5+sLv2puvVHilkH4ugqNUmcE7gf8D8LfMYN
 mqKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz6HAHjHiGQUkzGo3bcCZwIQPjyrFQc3tWPAgUc83nbcR+IjFOIMkS0o442qQjGZccUbsN8Lk0MFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFJ0TXZH/IM4eo73RvG3bwKBpPzdxyTrIGpUchShiH+x3XuwH2
 Qu18l8B6348PaTI75S3MReiky8lpbN+1wQignyNMUjzThpvJK9i5
X-Gm-Gg: ASbGncvxywkyAJYUtnkUkkXFyqYOVdf2QO6IZuC+IsnxPUr4ng+Lvz1BSnobzgHEYDt
 P3P7zPxrqHzCwULn4kz0zHErCl/L1obBmA7HnxcPHToB+6JQT/cD/18L3bUfuL2YetkbJO6tL0Q
 VbnhXXjO0UgU1EDnd25AuFc5y4q7Ck6RLLUNXktdFfILCyNARSvAtiocC7Ytbpcxx8UlxxvV4ox
 uwIy5fWp5V+dKTjGKCHO3f4KhA8qR0yFG7hZgTdYOf0aKMbIilpMTftpBAbyJLA89g5e9JhDXGU
 RcXVx0WGjLZZSLM8+2U7PfwhrD5+jJcj+bDlqE17sXP4EunenM5DHjx34WPw6+/kcS6N6RJP
X-Google-Smtp-Source: AGHT+IErHbsUtfgzkzhuHG33dvhjaZL2J0Jo8G6oOoESna+1j7QGmuOo4G7y0Y6m+8a3iiqQL9uH6g==
X-Received: by 2002:a05:6402:3553:b0:5d9:82bc:ad06 with SMTP id
 4fb4d7f45d1cf-5deadd7b8b8mr7475158a12.3.1739467269631; 
 Thu, 13 Feb 2025 09:21:09 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl.
 [89.66.237.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1d349esm1490025a12.33.2025.02.13.09.21.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Feb 2025 09:21:09 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <D7RH63Z1VBBD.1AIOQJIWPZIXS@cknow.org>
Date: Thu, 13 Feb 2025 18:20:57 +0100
Cc: Damon Ding <damon.ding@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Algea Cao <algea.cao@rock-chips.com>, Robert Foss <rfoss@kernel.org>,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com, dmitry.baryshkov@linaro.org,
 vkoul@kernel.org, andy.yan@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <59278550-BD6E-454C-AB31-084E13C19409@gmail.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
 <D7RH63Z1VBBD.1AIOQJIWPZIXS@cknow.org>
To: Diederik de Haas <didi.debian@cknow.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
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



> Wiadomo=C5=9B=C4=87 napisana przez Diederik de Haas =
<didi.debian@cknow.org> w dniu 13 lut 2025, o godz. 17:56:
>=20
> On Thu Feb 13, 2025 at 3:54 PM CET, Piotr Oniszczuk wrote:
>>=20
>>=20
>=20
> I don't know if it's relevant, but while HDMI0 got enabled for quite a
> few devices in 6.13, it did NOT get enabled for Rock 5 ITX.
> I made a local patch (which does the same thing as was done for Rock =
5B)
> but I have no idea if it actually works (I don't have the board).
>=20
> Maybe you need that for eDP to work?
>=20
> Cheers,
>  Diederik
> <0001-arm64-dts-rockchip-Enable-HDMI0-on-ROCK-5-ITX.patch>

Diederik,
Thx for looking on this.

Im afraid patch will not make hdmi0 working as rock5 itx board has hdmi0 =
designed to use 3588 eDP1 + eDP->HDMI converter (in-house developed =
rk620 chip).

I suspect we need:=20
-enable eDP1 support (hope Damon code can do this easily)
-map eDP to port0 in vop2 (port1 should be mapped to eDP/HDMI tx1)
-set typeC1/eDP1 mux to eDP1
Then maybe we should have hdmi0 working?

Im curious a bit about vop port mappings: maybe we can go with generic =
approach like:

eDP/HDMI tx0 -> port0  =20
eDP/HDMI tx1 -> port1  =20
typeC0/eDP0 -> port2 (+ exception for for rock5 itx: typeC1/eDP1 -> =
port2)



   =20

=20=
