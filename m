Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE2C817ED
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 17:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B8710E2FA;
	Mon, 24 Nov 2025 16:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RWYcdLj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBB210E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 16:10:53 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b7380f66a8bso669199366b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 08:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764000652; x=1764605452;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PNJKw8p/bVC9DDihKlO6wvtRyoc2CqJVoOEDDkEFruo=;
 b=RWYcdLj//yFWygD48UVpWnbIZdrxvrsx4h/7cHRY6X8MiubxLaFMxVeNoNQXYPAFc3
 oLFohKvuXp4OiAsWN9KJ5ZJrz4cdZVmdqUvV6AnuSfmH97RpwgJ7fKOby2lBA/n41rHU
 Oa9O6SLhaur24/JEmtBinCWLlk+lC+5HZObVWX1wM0s71RoMtG6lMFHTzXojJFRQ705O
 uuHg/o2L4T5y3HxBjKODigBQ89qsAiSXOhktmUtsRRStUsdVCtYZzzb6TFmm61tfn94U
 UUEh/+eubCF2XF/uCfusY4tCZZ6gFxlPPxh6HVauEE8xRRX1baUnWbjuM7yRenwdOZ5W
 tzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764000652; x=1764605452;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PNJKw8p/bVC9DDihKlO6wvtRyoc2CqJVoOEDDkEFruo=;
 b=TOvdgnFGqQlk5N1UhSAZSHeafFx9yo+9Bn+HbbIqjM+8nTkTtanG+RZukytppw3IAG
 mvTMpAVaunSlco6fLoExDmYxYFzruKyGjuNl9EWKtITtSSI4IfVb1GLgjWL2Ujgm186v
 SDF58GeaxrhHf8D8LCUopB+PG8cqkrsHp6wFradmzSRIljXpfDIvzyac2dD5JuLDMkJT
 Ml218Ui5xRtxhpW/XbZPMYZTkZ1KwqsRfgR8tTOKKVR/6UH/x3TpQRNomEVmGGU0HKcQ
 ou6KX/bSOGbtdL/OKOrvzlJI2LB5a2X+GnrkzRCYAHqbsmBRkuLMwfVgg5vWFYXZKMIy
 Qelg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmlNpyZcE6LftbhejRT7TP/E4E8YiyZ13HlIjo0gpJyyRcangs/Gfn0yHFlMHqFGG+icqLMS78EE8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj7sjaKNIYtDZ5beKCaaMPJsumUzBDu3KBfER647e13dqqXp6O
 hMPOrWhbciyoSYqjIzNYxIhVIx7h7ewUtGnylKA0XLj9vAPWAeLlz43Y9svXAHm5z+8=
X-Gm-Gg: ASbGncu1WY5oL4yq+lq/OcwbsgXaGrELGfu/TGMqmvXw442wrulcSbNLXXYCapEUTul
 cKnLbGnmtL7oOlMsLaKxbJQDZO9P8Uxgg1y4TQSZLEHN9PQZV9ClCRXp/+EQb+5NDCFvOc25NJd
 eWNzV8jmvDLC14arsUY9PvyJBDt5bg8raz8G/plrNvmrOEtPQuQn75REHMtRClecmDfssuMx7Ci
 gz970A4QKwfZUu+g2CEd5m9mfKVCwu+gTA7UqTwSNiIse/dJ+k1Q6S0Prj2o09YBbX+iw7W0G1O
 asaglEUBCTU9PCVSGReA2WAsHfTspQ5HksDngKLV2+VlTz/C9uJwAguHVACyh2Gga1s6iNYqAPP
 5ubD8B++2yIgiLvAfd8ncK/1NlrSwMqthQMHqtTr+Gqi3O1BiLCCYpyIz33iWxLTz8Sfl6l5gcy
 rS5hsWRWl6li7OEkVOvjFPh0AkQNmRKM6g8A216GbkjxqEJ5fHnM/a2XpQbAa/jE/zyp2bdZm+w
 X269M7hsZJW
X-Google-Smtp-Source: AGHT+IGXZ9dwCsIFtfklKslD3fowlXA1qqiWl8NPh9/JTYvgg+1dn1ZwzOk8abK9I8dlvbUb861r3Q==
X-Received: by 2002:a17:906:b52:b0:b76:b76e:112a with SMTP id
 a640c23a62f3a-b76b76e11d8mr159583366b.11.1764000651916; 
 Mon, 24 Nov 2025 08:10:51 -0800 (PST)
Received: from localhost
 (p200300f65f0267087d3c06a64089a115.dip0.t-ipconnect.de.
 [2003:f6:5f02:6708:7d3c:6a6:4089:a115])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b766d386665sm1040566666b.53.2025.11.24.08.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 08:10:51 -0800 (PST)
Date: Mon, 24 Nov 2025 17:10:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shankari Anand <shankari.ak0208@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>,
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
Message-ID: <44gv3fhqppn4fyg5fnxkhhanlbbxr2slqq7k3kr3owx7frpnxw@idgwxlcv4otn>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-7-shankari.ak0208@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="neqw6trvue47vu5n"
Content-Disposition: inline
In-Reply-To: <20251123092438.182251-7-shankari.ak0208@gmail.com>
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


--neqw6trvue47vu5n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
MIME-Version: 1.0

Hello,

I suggest $Subject ~=3D s/kernel/pwm/.

On Sun, Nov 23, 2025 at 02:54:34PM +0530, Shankari Anand wrote:
> Update call sites in `pwm.rs` to import `ARef`
> and `AlwaysRefCounted` from `sync::aref`
> instead of `types`.
>=20
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
>=20
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>  rust/kernel/pwm.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
> index cb00f8a8765c..1605d13d5d64 100644
> --- a/rust/kernel/pwm.rs
> +++ b/rust/kernel/pwm.rs
> @@ -13,7 +13,8 @@
>      devres,
>      error::{self, to_result},
>      prelude::*,
> -    types::{ARef, AlwaysRefCounted, Opaque}, //
> +    sync::aref::{ARef, AlwaysRefCounted},
> +    types::Opaque, //
>  };
>  use core::{marker::PhantomData, ptr::NonNull};

having no clue about Rust:

Can this patch be applied independent of the others via the pwm tree? If
I understand correctly it's only patch #10 that depends on the previous
patches, right?

Is there already a merge plan for this series?

Best regards
Uwe

--neqw6trvue47vu5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkkg4gACgkQj4D7WH0S
/k4ZxggAnWhK6xpYiLeXmCfK1Sb7HgBa2AsbKye0MnHsSah6DHwnqx7klhUaZs6e
21hOZ4ecYKPAdKbbwZUE4xMwMLKlAEMhJbkWsmUow5Q9+c+jvw0hfGAhiscylqP/
yKADT4IOvjkjPQ0ty4go/b0bd0qvcWDcxJXhvKi5Z+AQokSHyF4QDqRLz3Jq+mE8
T20JB7XDuIOEG7dN8qebw7XS5c4FCeCpSrCm7jeCHdfPuJj2iXz+L1IOedk3+a32
6PdlPCZxmch7aH4fUMWHtsO81LM5JVhulRuGu1ItMrklyXvDV18T7HpvvOaWJaQY
KYI/KdOn48adECwq4ltKA6NkZMhc4Q==
=9ZGw
-----END PGP SIGNATURE-----

--neqw6trvue47vu5n--
