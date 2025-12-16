Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D9CC1114
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 07:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690DD10E3E6;
	Tue, 16 Dec 2025 06:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tGTelK3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDEC10E3E6;
 Tue, 16 Dec 2025 06:12:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6FA3160010;
 Tue, 16 Dec 2025 06:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23DAC4CEF1;
 Tue, 16 Dec 2025 06:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765865555;
 bh=A+I04UHKw5lCsiggJwC3a6zTxGbfv3jvV4SKBE4/dIA=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=tGTelK3QrmUWjrzbl++x6Q4x6OHDRdVlombnRPiRpgCFQ3inqoNZ6kLLmFJ//fAXP
 6dhGAz9vuaka5p0xyBWMLk8pxcP3XWeQxXiSMe6YDWnfeSA2j1qxg76KY3+jAvwWqk
 jHKdzzRnfBb+j5WBh21YZn6XUB7JANxaLDIG06rdkYwk/tISO6r8O1q5qpc86RdgZ6
 a3aE3Spw97ncm9LKkgCgDa4nI+aVWFkeMII2lzNTqay7NJYiHMVNYZa6NJ/XIurr9A
 xmcz73A6w2Q0DP3EU9JNr+UpweueFG8UlXfb0gDSelk/dM1NEp9Hq4TeSh4MeYqMhm
 gxq3tZTalVndg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Dec 2025 07:12:27 +0100
Message-Id: <DEZF3DDSQXA9.2WAC2D5ZDKHDZ@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC 4/7] rust: pin-init: allow `dead_code` on projection
 structure
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-4-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-4-6a5d823be19d@nvidia.com>
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

On Tue Dec 16, 2025 at 6:13 AM CET, Alexandre Courbot wrote:
> Projection structures are not necessarily (and often not) used in their
> entirety. At the moment partial uses result in warnings about the unused
> members.
>
> Discard them by allowing `dead_code` on the projection structure
>
> To: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> ---
> Benno, please let me know if this looks good to you and I will send you
> a Github PR for this.

Looks good :)

Cheers,
Benno

> ---
>  rust/pin-init/src/macros.rs | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/rust/pin-init/src/macros.rs b/rust/pin-init/src/macros.rs
> index 682c61a587a0..fe60e570c729 100644
> --- a/rust/pin-init/src/macros.rs
> +++ b/rust/pin-init/src/macros.rs
> @@ -1004,6 +1004,7 @@ fn drop(&mut self) {
>          @not_pinned($($(#[$($attr:tt)*])* $fvis:vis $field:ident : $type=
:ty),* $(,)?),
>      ) =3D> {
>          $crate::macros::paste! {
> +            #[allow(dead_code)]
>              #[doc(hidden)]
>              $vis struct [< $name Projection >] <'__pin, $($decl_generics=
)*> {
>                  $($(#[$($p_attr)*])* $pvis $p_field : ::core::pin::Pin<&=
'__pin mut $p_type>,)*

