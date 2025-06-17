Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D8ADCE53
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 15:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EBC10E69C;
	Tue, 17 Jun 2025 13:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tnWj9Uy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EFE10E69C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 13:54:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 16B3D5C6790;
 Tue, 17 Jun 2025 13:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1C9C4CEE3;
 Tue, 17 Jun 2025 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750168465;
 bh=0k2cvXqcvQ++6SyJaasJsgpYXhw/jpea2Kwx1uvjjR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tnWj9Uy2c7BCkpWha/u5uEkmT9SIqT2blzfoI0++eLbOOlF9K8/ENCbm14xbzK6Hp
 P+imT5MRdqto5N7EKqoPey2PiJfxbqPYCn06GNnC7RvNU0O2WL3eFQFcbwWA+AHheJ
 VtZmUFcF6PRX1htfkCNNYnuDuNqqFxNBDbVdJEKm2kV7IqavgTt1eCwSzds7yJLx49
 ClwaApk4XLGc6lGRsFEbipSSflok8A2jb0Z6bstQV3hjllpB1OlTcxn4Ec1bFgZhKA
 TUdOMw6wcOmpi82Qa1SMg/Hi3dgQ6p2PwFa6g4kwVSfvrwfyYwdzEgqtzIS2+/rskC
 3bR5PRmt2Hcog==
Date: Tue, 17 Jun 2025 15:54:19 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: types: add Opaque::from_raw
Message-ID: <aFFzi88miMbCZ0yQ@pollux>
References: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-opaque-from-raw-v1-1-a2e99efa3ba2@google.com>
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

On Tue, Jun 17, 2025 at 01:36:47PM +0000, Alice Ryhl wrote:
> Since commit b20fbbc08a36 ("rust: check type of `$ptr` in
> `container_of!`") we have enforced that the field pointer passed to
> container_of! must match the declared field. This caused mismatches when
> using a pointer to bindings::x for fields of type Opaque<bindings::x>.
> 
> This situation encourages the user to simply pass field.cast() to the
> container_of! macro, but this is not great because you might
> accidentally pass a *mut bindings::y when the field type is
> Opaque<bindings::x>, which would be wrong.
> 
> To help catch this kind of mistake, add a new Opaque::from_raw that
> wraps a raw pointer in Opaque without changing the inner type.

The patch does more than that, it also adds a hint to container_of!() and fixes
up two occurences. I feel like we should split it up.

> +    /// The opposite operation of [`Opaque::raw_get`].
> +    pub const fn from_raw(this: *const T) -> *const Self {

Do we want to name this from_raw()? Usually from_raw() methods return either
Self or &'a Self.

Maybe something like cast_from() and rename raw_get() to cast_into()? I think
the latter may be confusing anyways, since it sounds like it would do somthing
with reference counting.

> +        this.cast()
> +    }
