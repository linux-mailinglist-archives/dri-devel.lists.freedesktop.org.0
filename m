Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE5EAB36E1
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F003D10E3A5;
	Mon, 12 May 2025 12:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ozxBVWXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C8F10E3A5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 12:23:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 58D1E44E46;
 Mon, 12 May 2025 12:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51193C4CEE7;
 Mon, 12 May 2025 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747052586;
 bh=2WNZsBiK3HiRTHULHlEXidSD2YudyevaPY4FvNsGzxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ozxBVWXoxSIkRzW8dM4064bu3lgZBaeQwAEp2tZRril6R8vRUFQDxo8DTgQzhA3CS
 +Tn0N5GnKfRSiv0LGu0wPgabbLIyYnXGfJdyz7frzpZK8BqfGnJkFKCFnAtxP/8dfY
 FVaYqi0c7CnvOMcTnqJEZ8KqlU4jg4/qFDmJ6eS5QkShg1a1pqtqARV+78KCdkYEiD
 KS53e3a8DMRTtlpqcvYa6IhsqYwuiECeUHg6B0ZLoDCqw1Slz12+4hGS8f7j1gST63
 aPdeqc79DuvbZb8OemzwG0OOLUj2ZUxJfIiDHQinqbTUV8BudxI0j5rBSmPsyW9apT
 7iEBuEHbY+j5g==
Date: Mon, 12 May 2025 14:22:59 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/4] rust: drm: gem: s/into_gem_obj()/as_gem_obj()/
Message-ID: <aCHoI2Em6M2Y8QdD@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
 <20250501183717.2058109-4-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501183717.2058109-4-lyude@redhat.com>
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

On Thu, May 01, 2025 at 02:33:18PM -0400, Lyude Paul wrote:
> There's a few changes here:
> * The rename, of course (this should also let us drop the clippy annotation
>   here)
> * Return *mut bindings::drm_gem_object instead of
>   &Opaque<bindings::drm_gem_object> - the latter doesn't really have any
>   benefit and just results in conversion from the rust type to the C type
>   having to be more verbose than necessary.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/drm/gem/mod.rs | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index f70531889c21f..55b2f1d056c39 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -42,8 +42,7 @@ pub trait IntoGEMObject: Sized + super::private::Sealed {
>  
>      /// Returns a reference to the raw `drm_gem_object` structure, which must be valid as long as
>      /// this owning object is valid.
> -    #[allow(clippy::wrong_self_convention)]
> -    fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object>;
> +    fn as_gem_obj(&self) -> *mut bindings::drm_gem_object;

Maybe just as_raw()? Either way,

	Reviewed-by: Danilo Krummrich <dakr@kernel.org>
