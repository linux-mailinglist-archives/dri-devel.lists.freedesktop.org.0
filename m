Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2C9AC4207
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 17:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3A110E3A0;
	Mon, 26 May 2025 15:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IbR+PWiL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2154D10E39E;
 Mon, 26 May 2025 15:04:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A77C5C24C2;
 Mon, 26 May 2025 15:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD838C4CEE7;
 Mon, 26 May 2025 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748271879;
 bh=+gkRavw80y95JfA55S2cbsTU1VnwkRey+yqVPwLmGzc=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=IbR+PWiLRlzK1wqzvi/6f+3kE05IZd4tHCCRSbak3GeaxcFRgh5Ij/KUmvM+4N3A9
 3vp1MLqjmgkCfRJwwqLDNzpLeU5LJ/Jjud1WDPXd0HUTtPC4CIEV1zNPWHRKoNHYBt
 XE1Si7WXymIULGVXt0VP+5++PD4Fx0SsJUC9MiDjDMoBqNqExOR8mDZi6kYi7KaJCh
 qc4Y2kAFlRHrTOb+dlqrX+eYyhJT7miklrP18uiU8uaLSBTGOruCvFxMuvpMnMGkc3
 31pLim2gS3jEopn5kJvB7Xz1Jeu+Byo+OkOtzEPCspIABgL5i2/SxoH9kkL8jHpeiR
 QEIwgjfUcKMDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 17:04:26 +0200
Message-Id: <DA66NJXU86M4.1HU12P6E79JLO@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <kunit-dev@googlegroups.com>,
 <dri-devel@lists.freedesktop.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <llvm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <linux-block@vger.kernel.org>
Subject: Re: [PATCH v10 4/5] rust: replace `kernel::c_str!` with C-Strings
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Michal Rostecki"
 <vadorovsky@protonmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <davidgow@google.com>, "Rae Moar" <rmoar@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt"
 <justinstitt@google.com>, "Andrew Lunn" <andrew@lunn.ch>, "Heiner Kallweit"
 <hkallweit1@gmail.com>, "Russell King" <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Arnd Bergmann" <arnd@arndb.de>, "Jens
 Axboe" <axboe@kernel.dk>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
 <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com>
In-Reply-To: <20250524-cstr-core-v10-4-6412a94d9d75@gmail.com>
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

On Sat May 24, 2025 at 10:33 PM CEST, Tamir Duberstein wrote:
> -/// Creates a new [`CStr`] from a string literal.
> +/// Creates a static C string wrapper at compile time.
>  ///
> -/// The string literal should not contain any `NUL` bytes.
> +/// Rust supports C string literals since Rust 1.77, and they should be =
used instead of this macro
> +/// where possible. This macro exists to allow static *non-literal* C st=
rings to be created at
> +/// compile time. This is most often used in other macros.
> +///
> +/// # Panics
> +///
> +/// This macro panics if the operand contains an interior `NUL` byte.
>  ///
>  /// # Examples
>  ///
>  /// ```
> -/// # use kernel::c_str;
> +/// # use kernel::c_str_avoid_literals;
>  /// # use kernel::str::CStr;
> -/// const MY_CSTR: &CStr =3D c_str!("My awesome CStr!");
> +/// const MY_CSTR: &CStr =3D c_str_avoid_literals!(concat!(file!(), ":",=
 line!(), ": My CStr!"));
>  /// ```
>  #[macro_export]
> -macro_rules! c_str {
> +macro_rules! c_str_avoid_literals {

I don't like this name, how about `concat_to_c_str` or
`concat_with_nul`?

This macro also is useful from macros that have a normal string literal,
but can't turn it into a `c""` one.

> +    // NB: we could write `($str:lit) =3D> compile_error!("use a C strin=
g literal instead");` here but
> +    // that would trigger when the literal is at the top of several macr=
o expansions. That would be
> +    // too limiting to macro authors, so we rely on the name as a hint i=
nstead.
>      ($str:expr) =3D> {{
> -        const S: &str =3D concat!($str, "\0");
> -        const C: &$crate::str::CStr =3D match $crate::str::CStr::from_by=
tes_with_nul(S.as_bytes()) {
> -            Ok(v) =3D> v,
> -            Err(_) =3D> panic!("string contains interior NUL"),
> -        };
> +        const S: &'static str =3D concat!($str, "\0");
> +        const C: &'static $crate::str::CStr =3D
> +            match $crate::str::CStr::from_bytes_with_nul(S.as_bytes()) {

Why is this still our CStr?

> +                Ok(v) =3D> v,
> +                Err(err) =3D> {
> +                    let _: core::ffi::FromBytesWithNulError =3D err;

Is this really necessary?

---
Cheers,
Benno

> +                    panic!("string contains interior NUL")
> +                }
> +            };
>          C
>      }};
>  }
