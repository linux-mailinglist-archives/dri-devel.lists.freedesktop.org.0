Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418CB354C2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49A210E5D0;
	Tue, 26 Aug 2025 06:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nzpMLnWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B7410E5CC;
 Tue, 26 Aug 2025 06:51:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73A455C5B15;
 Tue, 26 Aug 2025 06:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9575CC113D0;
 Tue, 26 Aug 2025 06:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756191050;
 bh=1xqeDYgOtN+fbXijQEv4PbpP6hYNVxHLpg1R+RFdHeI=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=nzpMLnWbauEU7SotKMMyLUpd3pb8yLKUsQQ6QzFGIhe0slqdK5StmXwcvMGahXpMH
 T3z4uv/lxeTVe7IugmiuLHN9yO9N245LfmyppLRxbFb+iBSbc2DPZcjY2IqLHspHhx
 Z7f7F4afPGlSIB+5CX9FIVoQhkUyOdQGzaH8nZFch0ep23IG5E/W4dCThTOUhxE2Qh
 q2aWse04Appmzg4evMjmXe2uKEE0plfKASV86Sswdld5526BZFIspskidlbGCiPNRQ
 XI44B5kgo+JlbHm8kdjcPSRWODCKfh3yDCDy1mc0xQsK7PWNu5dAN5Dr5pGkOTIrVv
 W66NR3+ZeCxqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 Aug 2025 08:50:44 +0200
Message-Id: <DCC5RO5OQV3D.1I9HSU3SFE46Y@kernel.org>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/8] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
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

On Tue Aug 26, 2025 at 6:07 AM CEST, Alexandre Courbot wrote:
> `FromBytes::from_bytes` comes with a few practical limitations:
>
> - It requires the bytes slice to have the same alignment as the returned
>   type, which might not be guaranteed in the case of a byte stream,
> - It returns a reference, requiring the returned type to implement
>   `Clone` if one wants to keep the value for longer than the lifetime of
>   the slice.

I think that any `Sized` type that can implement `FromBytes` also can
implement `Copy`, so I don't feel like the last point is a strong one.
But the unaligned byte stream is motivation enough :)

> To overcome these when needed, add a `from_bytes_copy` with a default
> implementation in the trait. `from_bytes_copy` returns an owned value
> that is populated using an unaligned read, removing the lifetime
> constraint and making it usable even on non-aligned byte slices.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/transmute.rs | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
