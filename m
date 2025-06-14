Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CA0AD9F5D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 21:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9E710E1AE;
	Sat, 14 Jun 2025 19:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SoFx9wZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9490010E0D7;
 Sat, 14 Jun 2025 19:16:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E745AA50AAC;
 Sat, 14 Jun 2025 19:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53CBC4CEEB;
 Sat, 14 Jun 2025 19:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749928576;
 bh=mmw5jhQLybady/7202hcLfn6hRFOBIqOFwgpzfoEdeM=;
 h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
 b=SoFx9wZIX1OI9wd6nGUhXheiyY3QdZlbZ5z9TdQnx/xnbda1R3j25z3Nw40owzddy
 sMJQkYY4+YLU1fR0J18xYq8lnNWpVYFyHOTv0vxd3MuzST8R2Yek+uqsTiG8XbZPBP
 FlHTc+UpfhnSQJCMh8kfuViz3RP/pYNAUPqRmZc0dlVS0h2m5nuDcRwRinM5GtW/fl
 mQaOu/dnKu1bdoLNXl3IhS2dd5zYxzyRAt+7pypC3XOBm1KyhhCXx1NBK0o6uT2IBX
 aWetXBQrRQPG56TW0XcXI9XGkLdPnaubFbcXR+i43tPVV2RqzNim1dlAxuo3OabiDI
 s8c/+6H60H07Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 21:16:10 +0200
Message-Id: <DAMHWN6ML8A1.2AUE4UWR58KR2@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 05/23] rust: num: add the `fls` operation
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
In-Reply-To: <20250612-nova-frts-v5-5-14ba7eaf166b@nvidia.com>
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

On Thu Jun 12, 2025 at 4:01 PM CEST, Alexandre Courbot wrote:
> Add an equivalent to the `fls` (Find Last Set bit) C function to Rust
> unsigned types.

Have you tried to upstream this?

> It is to be first used by the nova-core driver.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num.rs | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> index ee0f67ad1a89e69f5f8d2077eba5541b472e7d8a..934afe17719f789c569dbd545=
34adc2e26fe59f2 100644
> --- a/rust/kernel/num.rs
> +++ b/rust/kernel/num.rs
> @@ -171,3 +171,34 @@ fn borrow(&self) -> &T {
>          &self.0
>      }
>  }
> +
> +macro_rules! impl_fls {
> +    ($($t:ty),+) =3D> {
> +        $(
> +            ::kernel::macros::paste! {
> +            /// Find Last Set Bit: return the 1-based index of the last =
(i.e. most significant) set
> +            /// bit in `v`.
> +            ///
> +            /// Equivalent to the C `fls` function.
> +            ///
> +            /// # Examples
> +            ///
> +            /// ```
> +            /// use kernel::num::fls_u32;
> +            ///
> +            /// assert_eq!(fls_u32(0x0), 0);
> +            /// assert_eq!(fls_u32(0x1), 1);
> +            /// assert_eq!(fls_u32(0x10), 5);
> +            /// assert_eq!(fls_u32(0xffff), 16);
> +            /// assert_eq!(fls_u32(0x8000_0000), 32);
> +            /// ```
> +            #[inline(always)]
> +            pub const fn [<fls_ $t>](v: $t) -> u32 {

Can we name this `find_last_set_bit_ $t`? When the upstream function
lands, we should also rename this one.

---
Cheers,
Benno

> +                $t::BITS - v.leading_zeros()
> +            }
> +            }
> +        )+
> +    };
> +}
> +
> +impl_fls!(usize, u8, u16, u32, u64, u128);

