Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC6CF292E
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18F210E221;
	Mon,  5 Jan 2026 09:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UUlXDEQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4262B10E221;
 Mon,  5 Jan 2026 09:03:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7DDF40479;
 Mon,  5 Jan 2026 09:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC8BC19424;
 Mon,  5 Jan 2026 09:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767603785;
 bh=nDxFzRZrQadgSgMbm93SXcyEn3h84RlGVDadBNlZ1hE=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=UUlXDEQL2A9Ic+Wn0J0ClTK0vl/i2UeWaoUZgiNowFJeCtsUiUcpK5ybYc76HgqZD
 um31MMazdkRewo2Q2lssZ1qdlVi0+QlQwlkaeUZtf4/u3YKu5QpRI1iUmA0xy1nu7B
 o2Oy4tym1Xy33GAOPlKZiyUvmU6KxlSCUU6YcMKBc9qnqXRaSFHaJcoBCJB66FwUDz
 hb1N378SCb1fGVBbFDxg5+VPL/I278T7iAxe4nmWNfEP3ZVDZ0w4/ylcuCrzxdP12t
 XS7xzDh+xrU4B71cvl9asrb5dVbOXY1aPSAuRZ3zXWs/IwYt55evX2aGaGCH5WCZg+
 oI7Sap9ccR7vA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 10:02:59 +0100
Message-Id: <DFGJ8UBULO54.NRW84R2DTHIK@kernel.org>
Cc: <aliceryhl@google.com>, <acourbot@nvidia.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <ojeda@kernel.org>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] rust: macros: Add derive Display for enums
From: "Benno Lossin" <lossin@kernel.org>
To: "Maurice Hieronymus" <mhi@mailbox.org>, <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260104200733.190494-1-mhi@mailbox.org>
 <20260104200733.190494-2-mhi@mailbox.org>
In-Reply-To: <20260104200733.190494-2-mhi@mailbox.org>
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

On Sun Jan 4, 2026 at 9:07 PM CET, Maurice Hieronymus wrote:
> Add a derive macro that implements kernel::fmt::Display for enums.
> The macro outputs the exact variant name as written, preserving case.
>
> This supports all enum variant types: unit, tuple, and struct variants.
> For variants with data, only the variant name is displayed.

I don't think we should be adding this. Display is designed for
user-facing output and so it should always be carefully designed and no
automation should exist for it.

The use-case in the second patch is also much better served by either a
manual match on the enum:

    impl fmt::Display for Chipset {
        fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
            match self {
                Chipset::Variant =3D> write!(f, "Variant"),
                // ...
            }
        }
    }

Or by adding the respective code in the declarative macro already used
to define it.

Cheers,
Benno

> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> ---
>  rust/macros/display.rs | 52 ++++++++++++++++++++++++++++++++++++++++++
>  rust/macros/lib.rs     | 42 ++++++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 rust/macros/display.rs
