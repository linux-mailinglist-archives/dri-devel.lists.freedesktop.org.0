Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D2CD6BB4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 17:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FC010E08E;
	Mon, 22 Dec 2025 16:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="adNhm9LB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D4910E08E;
 Mon, 22 Dec 2025 16:58:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE33B6014C;
 Mon, 22 Dec 2025 16:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2DF3C4CEF1;
 Mon, 22 Dec 2025 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766422711;
 bh=Jt8y+TLci5YpF2GwIQAC9U6va+XnEFxp3SVTV8kkOAQ=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=adNhm9LBUsrrX+DenP00f+d1onGx9CMbQVcwRi+QychBpcZn9LpCuKw6hY+hG5FZh
 YDkQ0AOnOGmYRdKPr06ZAibR+unUh1UU6EL444/AY0820H1u69EnJUHuHI/loBTXO2
 fDLze0vpoHFyr0dzMySitB6+zAsHueo/AT2zG2jndQH6PMUHQV8JafK/EDX0VZdKQX
 8uZdRnQjkX4vadyNmLXoRNLEV931OylnXYIyKsO36YnzV1p8l4qVxw8utcZ/Hl0hba
 TQ9hEtIVzvODY3xA+WtWHHtUOfs0nC4I0vDTQnr52s9TEN6m2ypPvdqRLIMuDULupT
 /T8BPZBrZsBXw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 17:58:23 +0100
Message-Id: <DF4WL7CPEB0G.34Q08IOBC1I5L@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: replace `kernel::c_str!` with C-Strings
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Tamir Duberstein" <tamird@gmail.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
In-Reply-To: <20251222-cstr-nova-v1-1-0e2353d5debe@gmail.com>
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

On Mon Dec 22, 2025 at 1:20 PM CET, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to drm-rust-next, thanks!

    [ Use 'nova' commit subject prefix; use kernel vertical import style.
      - Danilo ]
