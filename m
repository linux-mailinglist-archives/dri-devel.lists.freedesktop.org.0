Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFABBF9A11
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 03:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D42310E03C;
	Wed, 22 Oct 2025 01:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QwPTvd7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DF410E03C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 01:44:02 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-781001e3846so5779430b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 18:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761097442; x=1761702242; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S9onf5CBmbSk29wszlhfpjcFikIXhbvWOl4PnOQkDlo=;
 b=QwPTvd7LisXYt3pV28Yv81gnIIYQtGBM7hM1V7G8sSYpf5PuDbLqHgzJTI+YRNzGkp
 DZgh+It+HuJ1TNETrDdVjtbC0+an1TAf/TxCpsBFRWfuf4SXJUQEA6q8/4EJZlIAtkLo
 AImTu/zX0hd4qCEfaDWqpBa+lfskYXu256+FNnoTReYZV+DF6Lc7Ax6I4xbGmXNPXLl1
 LXYviGQQ3l+kd3tkK2p+K/RkbDV6h3EvGM7q9L4uhhMyV3X2zR520zKI21YdzoieT7oO
 OrE2iKU3DvIibEYFB39/gOzp9E5xMwUHAWIUuJwH78OQJcE3wXl20xGvBLwaUz+ZViQs
 FlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761097442; x=1761702242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S9onf5CBmbSk29wszlhfpjcFikIXhbvWOl4PnOQkDlo=;
 b=ilFyARfQLCbQv8vOrNfNkebBjZhZFtplCbphHCHdDyb3h0zcQ7Ir89Dl5O06nJ6dCx
 QhO2nIY7RRrMe0F5PPf8nrUlFmlCFoFeQIZLTlLW046v47HvfzWIuDn085yt1Llvgj+4
 oPo4g4+Y12ucD8rXDsRRE7Bve6/t99jTsfO2B2j1nrb7h32tBw3WukYszZQhTObr9oe1
 CjLreD3H4JmaOB1s5GR/tH2JFWljwuGZN49QXen78CrQvatyp9wPnaOd1ms90qcv6yyV
 jUZC+j7sANkxWtGn6KoLJeYTxGJqL44zR6XD5Lj5jUGE8pApJ7FXzPsovaDBhuRka5zw
 /68w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1Qi5uhSzvPeDKhoaYhnLce1SU0Dxa3X5jeNT9azQL3278GrLJUAo8G/D8oJxh59AE0+B9v7ffAZo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7Q2tbd7B4PVomKtKpagnNhKK0VHPTKcHnA3hQHXI4tmNrcyTC
 06Q32CbrhKr1M1lv16hlSpdcJrU+rqY95yecI/CmiEYQyHaGRXGaYsUh
X-Gm-Gg: ASbGncsypXMjaAVf/egZuquz67BrFwypjJkAm5xyxalHTJgqKNjjgIJDcVex1WCi0as
 SOY+uJdxGRZRBYTQAgiGj3xqgU1Ao25EGOZomn42e5BadPPcnULaCyDcE2c2kOWcvqk5nbZQrCo
 SpAVrNeVzBxSf+pG23JN07UFw7N9Bg2I26dJFEQ+MwZbz2ptk7mTNK4Skv7/tPRIBYJMOUTmUsK
 AjOv3n+NLlTtJLSYfs+j+gG0hg57tNF8dBiHhcunutIZzR1NsSqhw9ns0hflxE90tGtAthCaeiv
 ds4zU+ToGSwHiEZm9+VMfVO/NM3iFcB3Qg1nRYniSL39KBYW1D4L1SAAda/ycP5GJE8Sc09ebJW
 9KIF8L4/ekXBdMhO+7URBgHA7OhRq+eqOHokzodO4J6A60t6CC5tcfqNY0k3x7iVegLJFAJx6AB
 7n7QbevAB5OV5C
X-Google-Smtp-Source: AGHT+IHulmK78/tDjF6qU3+kx2KCP7ODYLsRFIvylR8jvaOVGxcaG7BUiBMgRTf0SD5dvUFXuEiNXg==
X-Received: by 2002:a05:6a20:5493:b0:334:84f7:5646 with SMTP id
 adf61e73a8af0-334a8650262mr27706829637.58.1761097442076; 
 Tue, 21 Oct 2025 18:44:02 -0700 (PDT)
Received: from archie.me ([103.124.138.80]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a2301211besm12631232b3a.68.2025.10.21.18.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 18:44:00 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id DA1874209E4B; Wed, 22 Oct 2025 08:43:57 +0700 (WIB)
Date: Wed, 22 Oct 2025 08:43:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 3/7] docs: gpu: nova-core: Document GSP RPC message queue
 architecture
Message-ID: <aPg23d8wF6iVaWmv@archie.me>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-4-joelagnelf@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iAC4hEmvDvNxfLM9"
Content-Disposition: inline
In-Reply-To: <20251020185539.49986-4-joelagnelf@nvidia.com>
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


--iAC4hEmvDvNxfLM9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 02:55:35PM -0400, Joel Fernandes wrote:
> +The split read/write pointer design allows bidirectional communication b=
etween the
> +CPU and GSP without synchronization (if it were a shared queue), for exa=
mple, the
                                        as if it is
> +following diagram illustrates pointer updates, when CPU sends message to=
 GSP::
=20
Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--iAC4hEmvDvNxfLM9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPg22QAKCRD2uYlJVVFO
o7HnAP4u7KGRLbe+oCN/YmXK+pEcCGjInjoec1YU6PfZzmPKqQD9E7LICAzFtTAr
gFlcqzOanE9DrhfypJiAcTm9yVs4rA0=
=gCXr
-----END PGP SIGNATURE-----

--iAC4hEmvDvNxfLM9--
