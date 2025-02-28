Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B87CA4A72A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Mar 2025 01:40:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABBC10ED6B;
	Sat,  1 Mar 2025 00:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eJNE8hMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2E510E058
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 15:55:30 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-3098088c630so22141621fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 07:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740758129; x=1741362929; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHn0qaSarOO5nkT/BqsOGpUW4y3+EJjr5cHJDOEs+kg=;
 b=eJNE8hMNphnEcTYIkdJWVjwHo/SIiF7trccOJ64+uF2E9QK7IcQoa7w7KnKAmvRNLY
 EGmNcvYdnRWjo+DC0WWJHui/KQRdY9Z/YmgMt4dh3GbDi3yUVqF0pBynsT7/depliELi
 XIwBv3KVUwC+cmIXhAJjcY3q0iGSEJ4RFF0qt7RYbYX7Vpw6vzEqKM1WonL4Lb6g1lgq
 5G5BLZjPfcGj2yNrhnY/OrZ8l6yUWZb8gw2eZfsU8wSqleFhu2/P5wt2zjMt7EAfxXRk
 WM/VxQ4CtWPF8x48+7IvdUxO7oiPGWint7TKA8KVUQM9Ifk7H8IyXXmGZJOEuC1vnKOA
 HGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740758129; x=1741362929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bHn0qaSarOO5nkT/BqsOGpUW4y3+EJjr5cHJDOEs+kg=;
 b=RKxGOg2E/TZGLfq0DWZq8i3XP3rpgEQfOIDw9CccNtfT8DnwVeOqZ4fI2kSx9sSRZY
 J0QQOs1/fOEckL5xfXQ0n6UEAiyKnKCxLKtV/KcZtekvTu/35wfXFAeqEBVvFRt0frKI
 fepgqT0aDXr0uzBIHJ9nKgG8B0yhjjfPc5cPooyW6kZ3b7XeBwSVYouP0mRmfBi+vWxc
 LclS/w0af1gTkbsuNxmrNVjHNFXEbAQAIgKep+OrXZ94xjoE9VE81R+BPyqNkixy5hfI
 Ogy60JjL/k3XFjYWXlESH9s+ArrCDrC/A/y/gPu632Ae6RTJkWiIqdccQ+h6BOC828UA
 22yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0NG3Cpr9FuDqIUVddnWA6YRZvABNqBlvrSa5x2pusZJRXvxsAcEAYXdmm3Ve1yZnjGqopAcKdv3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbluBDSNRCjexeWlNh4wZox0IrDjDTUhJKE/mRo3+lgVPWCStn
 lG8q1bzpvyG6Zik2xy//7X3oc2xBtMdhprVUO61Q3EfhbQIsd3ze0Z0PpN/cf93Z+8+GetJjeKJ
 Y753PaKXFhHBhqrAwVXFVCxiffBw=
X-Gm-Gg: ASbGncvsTY3OdJPwjwOdTEcjeimcdvf7qjgxJJUuf1OfmmzYh2OP2dMngEv4RrD5GIN
 D0gkwoQDWxrnwswRXXE3ZN5xbuVRMbynyU6+k2v8XC5oaK6tqFntnFB5SeeWEGAEyujIN/0AQ7P
 bIVqHDF57ItN73saUHzxiPLWOkrNjzJvElglvwnXRu
X-Google-Smtp-Source: AGHT+IH4TnWs7AAWR6mSZJGzeTPP/IV0kwlekYfbQHJwIpvtqQS+Igon57DpTKr3TLAm0ffmLUtfQbT9lsn73QyqZdk=
X-Received: by 2002:a05:651c:555:b0:308:eb34:103a with SMTP id
 38308e7fff4ca-30b932f6d82mr16293581fa.28.1740758128998; Fri, 28 Feb 2025
 07:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-5-569cc7e8926c@google.com>
In-Reply-To: <20250228-export-macro-v2-5-569cc7e8926c@google.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 28 Feb 2025 10:54:53 -0500
X-Gm-Features: AQ5f1Jr5a2e-MB7tbyFJrVeNND-UBub9gCfxNxl1epYDa4dtBuxZ-xEM_hkDrMo
Message-ID: <CAJ-ks9k4rZdpL5dDfwMHuiKFdyYdY00YioYxdtsqszpcbhzjHQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] panic_qr: use new #[export] macro
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 01 Mar 2025 00:40:26 +0000
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

On Fri, Feb 28, 2025 at 7:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This validates at compile time that the signatures match what is in the
> header file. It highlights one annoyance with the compile-time check,
> which is that it can only be used with functions marked unsafe.
>
> If the function is not unsafe, then this error is emitted:
>
> error[E0308]: `if` and `else` have incompatible types
>    --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
>     |
> 986 | #[export]
>     | --------- expected because of this
> 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: =
usize) -> usize {
>     |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, fo=
und safe fn
>     |
>     =3D note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel::=
bindings::drm_panic_qr_max_data_size}`
>                found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_max_=
data_size}`
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/gpu/drm/drm_panic.c     |  5 -----
>  drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
>  include/drm/drm_panic.h         |  7 +++++++
>  rust/bindings/bindings_helper.h |  4 ++++
>  4 files changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f128d345b16d..dee5301dd729 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -486,11 +486,6 @@ static void drm_panic_qr_exit(void)
>         stream.workspace =3D NULL;
>  }
>
> -extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> -
> -extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_l=
en, size_t data_size,
> -                               u8 *tmp, size_t tmp_size);
> -
>  static int drm_panic_get_qr_code_url(u8 **qr_image)
>  {
>         struct kmsg_dump_iter iter;
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_=
qr.rs
> index bcf248f69252..d055655aa0cd 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -27,7 +27,10 @@
>  //! * <https://github.com/bjguillot/qr>
>
>  use core::cmp;
> -use kernel::str::CStr;
> +use kernel::{
> +    prelude::*,
> +    str::CStr,
> +};
>
>  #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
>  struct Version(usize);
> @@ -929,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item =3D u=
8>) {
>  /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
>  ///
>  /// They must remain valid for the duration of the function call.
> -#[no_mangle]
> +#[export]
>  pub unsafe extern "C" fn drm_panic_qr_generate(
>      url: *const kernel::ffi::c_char,
>      data: *mut u8,
> @@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Item =3D =
u8>) {
>  /// * If `url_len` > 0, remove the 2 segments header/length and also cou=
nt the
>  ///   conversion to numeric segments.
>  /// * If `url_len` =3D 0, only removes 3 bytes for 1 binary segment.
> -#[no_mangle]
> -pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize=
) -> usize {
> +///
> +/// # Safety
> +///
> +/// Always safe to call.

This should explain why it's marked unsafe, since it's always safe to call.


> +#[export]
> +pub unsafe extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len=
: usize) -> usize {
>      #[expect(clippy::manual_range_contains)]
>      if version < 1 || version > 40 {
>          return 0;
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index f4e1fa9ae607..2a1536e0229a 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -163,4 +163,11 @@ static inline void drm_panic_unlock(struct drm_devic=
e *dev, unsigned long flags)
>
>  #endif
>
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> +
> +extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_l=
en, size_t data_size,
> +                               u8 *tmp, size_t tmp_size);
> +#endif
> +
>  #endif /* __DRM_PANIC_H__ */
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 55354e4dec14..5345aa93fb8a 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -36,6 +36,10 @@
>  #include <linux/workqueue.h>
>  #include <trace/events/rust_sample.h>
>
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +#include <drm/drm_panic.h>
> +#endif

Why the guard here?

It'd be nice to have a comment here explaining the atypical need for
this include.

> +
>  /* `bindgen` gets confused at certain things. */
>  const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN =3D ARCH_SLAB_MINALIGN=
;
>  const size_t RUST_CONST_HELPER_PAGE_SIZE =3D PAGE_SIZE;
>
> --
> 2.48.1.711.g2feabab25a-goog

With Andy's comment about extern addressed:

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
