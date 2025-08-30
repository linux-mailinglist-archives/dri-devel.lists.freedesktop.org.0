Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236EEB3DAA9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264EB10E393;
	Mon,  1 Sep 2025 07:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eYsKvaCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7FA10E290
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 23:11:33 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b4f1ee2e250so218254a12.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Aug 2025 16:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756595493; x=1757200293; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pKJR3d1y6/pE646jp/qQ2LVHmuXD7qWjBS7Rpy0QVAg=;
 b=eYsKvaCjY3vD9NNFfpjrscNN419aXyhIZHQKc4i2OZYysqwmRb+WQNhKKXnWXBqlzQ
 0TR/4EW0PxlUcX6Tqx1ygxVwJ7D4P0ihM0TbgcziE1Ey7ZkFQlOKJUpUlg9zsqInKFMJ
 ljwE/rhBbBmcMNmomc+UKiEic5kHy6MYNXb26jElvdowhxvnnOCmexO8PwkCI2IIM8aZ
 NbhqyDFluRC/gE2DrRjsZK17cTM92bwzR4XPrCsRdwapKwVNhIMBWxClyAZI9CA3947h
 nXfTp3+2V8lte/a7GbhjfUSkSwwYGILXIClLArE9dWnUEGrs/c8vNfKg6r5d8LSTaJ0g
 dA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756595493; x=1757200293;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pKJR3d1y6/pE646jp/qQ2LVHmuXD7qWjBS7Rpy0QVAg=;
 b=IOdUR9UE92x7KTeU3PpOO7s5hbVPDPaS81teS4nnvXUbBX9ndY86tTanuHIXefglTb
 eRh6o747YSARn+pIh+m/dv0ujjqHWejH6Xcev1av99NVAnxCV1EhEQ3RVGBdSkuZCo0z
 ObyIUlroMD887o+21Vofrktw61SS+y9VKsKvy2ULd/udvzcKOYxR42a0ycLe7ctGxw+6
 iyG3hgCWYFpFG2G0zqfIYAAK3zKOKR5+E6GVETEAfvR1p3/7Rxe4oeEvcgjVqJFhCcWh
 INJyqHRSB6Uvpxyv4IvTgWTR8FeI2XdG8bWrFerYD9QvvX0Dl8TR663zNm8qgT3mTAVJ
 ZZpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWDXwUQCR6EIg0feXVycwkWpPpAGni27jBsK69e3O8DRJNkSlZ5vDYFbGfvWwkoSZlTSB7P1GWBhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4g1LYb/Lw6uiqYayoIvO+43YRoosS6Nxc5/uQbXHKG8jtoReb
 uWkOWv8fuvbpgln3o9C5zEXFSvvU2x2sAvD6IV6jM7+kdl6gYceYbH0T
X-Gm-Gg: ASbGncsur5z6YxCyPj4AUIL3YT0B58gomKDlajOs+WMWSTgCMWjuKk8/sh9ZnBib+Go
 87iQ5xSuAP0IBmG4C4XKI72xKlCKDIsu1eNqF7INheAFemb08mB5OopVjegpT5FbLYk6ZTb3baW
 iKoHBOeNIBV/WaHG0PjTIP3vkAdTBXYGrUJGKIPH4/tjX82VharNAnwDaSw5fho8sBY2JFP+ha3
 b+dcPZaHJCbxpCiUSYz6gwV5n5tWN+y0eGdotYLMBQE9ykGglyo6SqaeS24KzQodcuRxEGXcDeS
 l8PpOZ7F4E6ywj6HdxI/EkPQ9mPbTnUtjq8iCq850ZAXu+58pL4MH7r49IpQqZABmHPFb6luzje
 lvE9n6me+3rRLLyHCOgpBY6WMAJ9Be/f4DZJA
X-Google-Smtp-Source: AGHT+IH09TdLkBTBS46a9KkDQcsPHCKV5BjcOl3BN1JIlX/axUWBHc8jxps5fYfmQWtY+6vT/lzr2w==
X-Received: by 2002:a17:902:c952:b0:248:cd4c:d6e with SMTP id
 d9443c01a7336-2494488a679mr39782015ad.9.1756595492940; 
 Sat, 30 Aug 2025 16:11:32 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24906395aa0sm61840295ad.100.2025.08.30.16.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 16:11:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 3F63E4222987; Sun, 31 Aug 2025 06:11:28 +0700 (WIB)
Date: Sun, 31 Aug 2025 06:11:28 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DAMON <damon@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Power Management <linux-pm@vger.kernel.org>,
 Linux Block Devices <linux-block@vger.kernel.org>,
 Linux BPF <bpf@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux KASAN <kasan-dev@googlegroups.com>,
 Linux Devicetree <devicetree@vger.kernel.org>,
 Linux fsverity <fsverity@lists.linux.dev>,
 Linux MTD <linux-mtd@lists.infradead.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Build System <linux-lbuild@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Sound <linux-sound@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Huang Rui <ray.huang@amd.com>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, Jens Axboe <axboe@kernel.dk>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, tytso@mit.edu,
 Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shay Agroskin <shayagr@amazon.com>,
 Arthur Kiyanovski <akiyano@amazon.com>,
 David Arinzon <darinzon@amazon.com>,
 Saeed Bishara <saeedb@amazon.com>, Andrew Lunn <andrew@lunn.ch>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexandru Ciobotaru <alcioa@amazon.com>,
 The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Steve French <stfrench@microsoft.com>,
 Meetakshi Setiya <msetiya@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 12/14] ASoC: doc: Internally link to Writing an ALSA
 Driver docs
Message-ID: <aLOFIEknbxQZ6FM2@archie.me>
References: <20250829075524.45635-1-bagasdotme@gmail.com>
 <20250829075524.45635-13-bagasdotme@gmail.com>
 <20250830224614.6a124f82@foz.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q50L9+H94gXo88jD"
Content-Disposition: inline
In-Reply-To: <20250830224614.6a124f82@foz.lan>
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:02:45 +0000
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


--q50L9+H94gXo88jD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 30, 2025 at 10:46:22PM +0200, Mauro Carvalho Chehab wrote:
> Em Fri, 29 Aug 2025 14:55:22 +0700
> Bagas Sanjaya <bagasdotme@gmail.com> escreveu:
> > -Please refer to the ALSA driver documentation for details of audio DMA.
> > -https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-als=
a-driver.html
> > +Please refer to the :doc:`ALSA driver documentation
> > +<../kernel-api/writing-an-alsa-driver>` for details of audio DMA.
>=20
> Don't use relative paths for :doc:. They don't work well, specially
> when one uses SPHINXDIRS.
>=20
> The best is o use Documentation/kernel-api/writing-an-alsa-driver.rst
> and let automarkup figure it out. As we have a checker, broken
> references generate warnings at build time.

Thanks for the tip!

--=20
An old man doll... just what I always wanted! - Clara

--q50L9+H94gXo88jD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaLOFGwAKCRD2uYlJVVFO
o9MMAPwIm+r4BZdTF0jZV4Naj+z2WrUBji4gRFJQ4f97vYNhfgEAwX/UGgC71a9U
lMJHF+utPAWnldcv9PoyPOBgO71EEAA=
=C7rV
-----END PGP SIGNATURE-----

--q50L9+H94gXo88jD--
