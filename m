Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E337BDA393
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693C210E639;
	Tue, 14 Oct 2025 15:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q2UrfZmp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA3910E63F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 15:07:12 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so34706035e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760454431; x=1761059231; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gL8ZkUM+9MNArpY6PXkMm1LfiIpSu2XTYwD3Z1PK1/M=;
 b=Q2UrfZmp4oensPsNVEIEH3mCTVcW4q6jh1K1fx+cEM+Wbo9BJcM1w9OLWkNqKULPCi
 jZ04wqWlIAEjvy/3P6lglVL+oFJEg5utoxb4ZaLZsTlU16dJOXxckux54G/c4qrkdnS+
 p6eoyV90jt1rs8rVkez6O+dCY7Z81n3VHg8Oux3st2g95z54IqIjmSCREjRPiHdhQ803
 b5EgFoXLrpiI/AN5gletf2Rm6fb+wArDJpbnyXaWgNZVrBGAO0BqeY6wp0TRVL1sQS76
 HHGHhsfFskM7VAyFJw/ZLUvpDrsLFalWe/YoKCmH6p+g/DhxJGWBzkuvJ5LYPPNrZ4L8
 oNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760454431; x=1761059231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gL8ZkUM+9MNArpY6PXkMm1LfiIpSu2XTYwD3Z1PK1/M=;
 b=N4PZwfaHNEseNFV7v2VBdz27511VykSo44M4TY+SkXvIANHnhGc5sB174pNs7Aj/Fa
 8I0+vCBUhU5YEAydmQ9Dz7QjYYVmT/54cbCz9NpSCr4jnhp7Mw4ibT9CO/d2rs/PpVaw
 2RTEETr9FP/K1IbMsJ9AUbBvGeUWzxwWwGAhn6bb8osPAiZWamNLcJK2HG+cgVgQwVTC
 s1hppLEJOyGAj8NpCrrfIFTUzwZIhYCXH3kZ8Jf5z+CRvPVlxUedrtIGcSoPQfJKc6td
 YBx8ccGywdymb3l/+0Kn0KO/garIBwhE9YZgOENY4SoPdFLwVFP5YxORtIIxbQoWAOk4
 473w==
X-Gm-Message-State: AOJu0YyV5Lsud1O1xHKMxw2eEHzBpG9wqqQpbAZVUTdp0Jr4ZAUlduWS
 kmpXLqBLxXwpYU7VUU+CAIgPUDt34xcaJL1hc14tsjeWUhG/N3+q2zKB
X-Gm-Gg: ASbGncufqLLaH51uv2LRnr9YK7VyUqilg+COcufFIwApFeqScnlHr+wBvZqj2R2CQRP
 z5HjKDSg6NGQUidH9m/dOG31BbKRlM8RVgHtgD4deBw+I7yK6Jf52SIA/fZZ2Zs8vDIBcLVDgdd
 GMog2qw+eZr1MSan82/++PLi6hOx6tIGeX65/KdCjWK4dF0fpj4Rld4VvvGMKi9CazVwZUa+Kyz
 lMFeMQcwqAyJnbkqK9Ugr4hxaYXEUYzi6qo99xxkAPnUwC6ofkcqn823UIg/BfJlSVJ1vXoTsuN
 NkIojrXpvt40gSRfD8aU8Uknms+9YNre9iMXP3lurfsjEJuNWtYY4+rppxVVLkre0xvdzHtk/DH
 6Cc+kRnhqdZBXAXGxYq6mNPbSs2HieYjYKmnZA5az4iR/KCHYHhbAfEXIX+350wsh0wjAeRQje4
 NwyQK6fq3ZFA2QRnRFl9P37Og7l9epNNqtfBJuSad7FOw=
X-Google-Smtp-Source: AGHT+IHZ1EadWTvtDCQYwV4WQfXt5YXLqudRi4J8yoZGK9Vlf1FSkWM87gQrzG78jUIiFgj68dWGqw==
X-Received: by 2002:a05:600c:4751:b0:46e:72df:a812 with SMTP id
 5b1f17b1804b1-46fa9a8641fmr200685715e9.4.1760454430587; 
 Tue, 14 Oct 2025 08:07:10 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce582a9csm24173702f8f.12.2025.10.14.08.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 08:07:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Remove myself for sun4i DRM driver
Date: Tue, 14 Oct 2025 17:07:09 +0200
Message-ID: <5928949.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20251014093628.564265-1-mripard@kernel.org>
References: <20251014093628.564265-1-mripard@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Maxime,

Dne torek, 14. oktober 2025 ob 11:36:28 Srednjeevropski poletni =C4=8Das je=
 Maxime Ripard napisal(a):
> I haven't been involved with the driver for a while. Let's reflect that.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Thank you for all your work on it till now!

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  MAINTAINERS | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 46126ce2f968..7875149c919e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7634,11 +7634,10 @@ T:	git https://git.kernel.org/pub/scm/linux/kerne=
l/git/ogabbay/accel.git
>  F:	Documentation/accel/
>  F:	drivers/accel/
>  F:	include/drm/drm_accel.h
> =20
>  DRM DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE
> -M:	Maxime Ripard <mripard@kernel.org>
>  M:	Chen-Yu Tsai <wens@csie.org>
>  R:	Jernej Skrabec <jernej.skrabec@gmail.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> @@ -8248,11 +8247,10 @@ T:	git https://gitlab.freedesktop.org/drm/rust/ke=
rnel.git
>  F:	drivers/gpu/drm/nova/
>  F:	drivers/gpu/nova-core/
>  F:	rust/kernel/drm/
> =20
>  DRM DRIVERS FOR ALLWINNER A10
> -M:	Maxime Ripard <mripard@kernel.org>
>  M:	Chen-Yu Tsai <wens@csie.org>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/allwinner*
>=20




