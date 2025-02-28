Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1AA49FD6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCFA10ED0A;
	Fri, 28 Feb 2025 17:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="32qj+kMD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8565A10ED0A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:08:53 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-390eebcc331so632009f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740762532; x=1741367332;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IaPCTODeLwe+V7QIP7WdzTJW222I9T9UXPmt/Ut/lfU=;
 b=32qj+kMDy843SthibcPk1uBJx5v9SjpMIti8rYFvB1sC+D0Wkh8fzxbiwUWPkQS3m+
 6J2k0JlfEq7KWhhzZR5vMuHnfjNFL42K9U2A3vbfAkbMG4Tg+QPkzS9K8fTcGepSe2sz
 hLuq1fCcVEbm2H4//hTJPZ4trzbY7bW75TT79DeUyoMTfVFDkDEHy3KQNq/PzSBUu7Wg
 wo4NIvG9Dh09lyFwUGW33bcJOIRfF0Fcwkh1RKuOyk9vAz/zfBtLv6Y7TZ7Ebf42Lgmh
 A58wqyGSwiH/hycxh0yW05epKiPHJ3m/Pvz6VWCOC4pvZ78axTlv8HIj3P4d7IJDZ53S
 4LMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740762532; x=1741367332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaPCTODeLwe+V7QIP7WdzTJW222I9T9UXPmt/Ut/lfU=;
 b=E7Nl0Hna1VmolK70S6JvxFTIxEiHd/R0WA0RkCZvzlMgl4S9waOBmkPOj3JUd3g84v
 Nh4nmhXTPLRgLOUzCXkA9PtY61u+x9dlakagx/VWBrIMpGImYol98LqW03f4ai6a8MUI
 Em4eBF/RQIv2ijNKb3jxkasUHDNLLS7LZWwEDl9ETXFsNkYdKZYK2Dac0cp3o/UhLrlw
 sB4khEMWu/7jiCAjLqRtOIgZY98SmxdcH/kTTz9CB68e+RYuG/WuhdjTY4nFCucvwTLZ
 dzDkKlYesnCWNtS0h7/ee6QFTHWhIP9mlIZGKVstuG/7DJ5WgnY0tK+ATSLd6K16ZXyn
 BK9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX03b/zp8Iu7JBG19NewsVZ+gaLsHF6gCoTu5mODKS6k8jEYVQyrWfupJzvQgZqdTWWjdhVDHEanIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFC7AvbYEK4SEd+B6XEAOI5kasw15bcDmeZkYfvdyHzOnODSkS
 vJvkf4Ufpz2LSTcjJC678OjewSjX6SfrxRNGHdcqihD8c9fxPECD0eZKNtR6AtKaPh8H+zZuI8X
 KyuGeJOBqIlJYZpWW9X/m/0k4SEWBCoIXqlpU
X-Gm-Gg: ASbGncubDgifMQA+FQ0FqV2SS8QYcIA6zosAMpH1+abQ+riyUTPzwAdg14vMH2B4qLl
 yErTh0v+iCxsZ5cKJ2gtHd6UxU28icnNCqyQohSonJZjP8Zrdvmr+xnjD34Mg748UoNAJIhyxzm
 fTdnViBk0dSrBoTg0Do9pM5r73JaEmlgnKMO076g==
X-Google-Smtp-Source: AGHT+IG54e3GobkjZ8tPZxRoFcianUe+ZFTkJdAFfhIp2F2JiHuS56Xy9kQY/09d8HuGTQm+42i6miBW+7XanJXjdSQ=
X-Received: by 2002:a05:6000:400a:b0:38f:23c4:208c with SMTP id
 ffacd0b85a97d-390e18c8b0amr6664532f8f.18.1740762530834; Fri, 28 Feb 2025
 09:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-5-569cc7e8926c@google.com>
 <CAJ-ks9k4rZdpL5dDfwMHuiKFdyYdY00YioYxdtsqszpcbhzjHQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9k4rZdpL5dDfwMHuiKFdyYdY00YioYxdtsqszpcbhzjHQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 18:08:38 +0100
X-Gm-Features: AQ5f1JpN4S2btnyWpu2cTmIDiHVgyZ8OiCtI3DLh4W0P9eLmgQGdOBc2TieXEkk
Message-ID: <CAH5fLggDgYYk-0HzCjDmmHjV6JkR7WJhmQU-Nhbo4iBGBw1AJw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] panic_qr: use new #[export] macro
To: Tamir Duberstein <tamird@gmail.com>
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

On Fri, Feb 28, 2025 at 4:55=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Fri, Feb 28, 2025 at 7:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This validates at compile time that the signatures match what is in the
> > header file. It highlights one annoyance with the compile-time check,
> > which is that it can only be used with functions marked unsafe.
> >
> > If the function is not unsafe, then this error is emitted:
> >
> > error[E0308]: `if` and `else` have incompatible types
> >    --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
> >     |
> > 986 | #[export]
> >     | --------- expected because of this
> > 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len=
: usize) -> usize {
> >     |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, =
found safe fn
> >     |
> >     =3D note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel=
::bindings::drm_panic_qr_max_data_size}`
> >                found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_ma=
x_data_size}`
> >
> > Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  drivers/gpu/drm/drm_panic.c     |  5 -----
> >  drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
> >  include/drm/drm_panic.h         |  7 +++++++
> >  rust/bindings/bindings_helper.h |  4 ++++
> >  4 files changed, 22 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> > index f128d345b16d..dee5301dd729 100644
> > --- a/drivers/gpu/drm/drm_panic.c
> > +++ b/drivers/gpu/drm/drm_panic.c
> > @@ -486,11 +486,6 @@ static void drm_panic_qr_exit(void)
> >         stream.workspace =3D NULL;
> >  }
> >
> > -extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> > -
> > -extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data=
_len, size_t data_size,
> > -                               u8 *tmp, size_t tmp_size);
> > -
> >  static int drm_panic_get_qr_code_url(u8 **qr_image)
> >  {
> >         struct kmsg_dump_iter iter;
> > diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_pani=
c_qr.rs
> > index bcf248f69252..d055655aa0cd 100644
> > --- a/drivers/gpu/drm/drm_panic_qr.rs
> > +++ b/drivers/gpu/drm/drm_panic_qr.rs
> > @@ -27,7 +27,10 @@
> >  //! * <https://github.com/bjguillot/qr>
> >
> >  use core::cmp;
> > -use kernel::str::CStr;
> > +use kernel::{
> > +    prelude::*,
> > +    str::CStr,
> > +};
> >
> >  #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
> >  struct Version(usize);
> > @@ -929,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item =3D=
 u8>) {
> >  /// * `tmp` must be valid for reading and writing for `tmp_size` bytes=
.
> >  ///
> >  /// They must remain valid for the duration of the function call.
> > -#[no_mangle]
> > +#[export]
> >  pub unsafe extern "C" fn drm_panic_qr_generate(
> >      url: *const kernel::ffi::c_char,
> >      data: *mut u8,
> > @@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Item =
=3D u8>) {
> >  /// * If `url_len` > 0, remove the 2 segments header/length and also c=
ount the
> >  ///   conversion to numeric segments.
> >  /// * If `url_len` =3D 0, only removes 3 bytes for 1 binary segment.
> > -#[no_mangle]
> > -pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usi=
ze) -> usize {
> > +///
> > +/// # Safety
> > +///
> > +/// Always safe to call.
>
> This should explain why it's marked unsafe, since it's always safe to cal=
l.

Safety comments generally do not explain rationale for why they are
the way they are. Where would you like me to put it?

> > +#[export]
> > +pub unsafe extern "C" fn drm_panic_qr_max_data_size(version: u8, url_l=
en: usize) -> usize {
> >      #[expect(clippy::manual_range_contains)]
> >      if version < 1 || version > 40 {
> >          return 0;
> > diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> > index f4e1fa9ae607..2a1536e0229a 100644
> > --- a/include/drm/drm_panic.h
> > +++ b/include/drm/drm_panic.h
> > @@ -163,4 +163,11 @@ static inline void drm_panic_unlock(struct drm_dev=
ice *dev, unsigned long flags)
> >
> >  #endif
> >
> > +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> > +extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> > +
> > +extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data=
_len, size_t data_size,
> > +                               u8 *tmp, size_t tmp_size);
> > +#endif
> > +
> >  #endif /* __DRM_PANIC_H__ */
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
> > index 55354e4dec14..5345aa93fb8a 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -36,6 +36,10 @@
> >  #include <linux/workqueue.h>
> >  #include <trace/events/rust_sample.h>
> >
> > +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> > +#include <drm/drm_panic.h>
> > +#endif
>
> Why the guard here?
>
> It'd be nice to have a comment here explaining the atypical need for
> this include.

It's not necessary. I can drop it.

Alice
