Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA1A494A2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B013A10EC2B;
	Fri, 28 Feb 2025 09:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NjWGqT+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3C110EC30
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:18:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B86461F62;
 Fri, 28 Feb 2025 09:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E52C4CED6;
 Fri, 28 Feb 2025 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740734336;
 bh=uB5PTVlXDv0B3iRpX4jdZ8TQyFJQWls/IBwSuYbL3/g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NjWGqT+JamxuUjZZRDeSqqR1JlMUGON4jg2mxVUseVyQqPe5bXTCBbhysMJqRtRFp
 nZOJFXaQ7h5jFv0PRII2Fexl5hW3qnW+S7TvX71bwyq9hma8I5ZY3+UekWkkhPklmE
 bNNANQJA8ZU662X8MTZpIAfihQ6EWfpTepVjqyfbrVtr+oBya/k7I6vSBiZwbPu/bs
 ic4JIf7KPbmXPjI7P8W0VyvDTZKaN71QNZSntlxIAN+8DZjDDpayajvQpGvVBPCOsA
 gqmYnORCxsalzkJIe+UVdloEpFPzOd66PgHVog8b6+Cfb7QDfHImixzYyyf6OFCVz7
 1wdaUT5PnYfig==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Petr Mladek" <pmladek@suse.com>,  "Steven Rostedt"
 <rostedt@goodmis.org>,  "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>,  "Rasmus Villemoes"
 <linux@rasmusvillemoes.dk>,  "Sergey Senozhatsky"
 <senozhatsky@chromium.org>,  "Andrew Morton" <akpm@linux-foundation.org>,
 "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,  "Benno
 Lossin"
 <benno.lossin@proton.me>,  "Trevor Gross" <tmgross@umich.edu>,  "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,  "Maxime Ripard"
 <mripard@kernel.org>,  "Thomas Zimmermann" <tzimmermann@suse.de>,  "David
 Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>,  <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] rust: fix signature of rust_fmt_argument
In-Reply-To: <CAH5fLgjKoHpGS9ugxawwJJbb68trHEVvBCCNWFcNSbScGKpuDA@mail.gmail.com>
 (Alice Ryhl's message of "Fri, 28 Feb 2025 09:44:21 +0100")
References: <20250227-export-macro-v1-0-948775fc37aa@google.com>
 <qxbD5y-rJZMJDMN1wtODJBCAdNtNdQFsYIDhZUex7KcbPiUvABElh5V8c9EFoAPZ7xQe_L8JS6MzAIqciAb12w==@protonmail.internalid>
 <20250227-export-macro-v1-1-948775fc37aa@google.com>
 <87v7suo5ay.fsf@kernel.org>
 <gVJNIhgBAA9F_JwBjIVAALoIygNL07ep4CbT7nvqOdSCFdsMFZ8yFyfmQuPIChTqoQrrUs1kl11GsYYgz_mW_A==@protonmail.internalid>
 <CAH5fLgjKoHpGS9ugxawwJJbb68trHEVvBCCNWFcNSbScGKpuDA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 28 Feb 2025 10:17:30 +0100
Message-ID: <87eczio2c5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Fri, Feb 28, 2025 at 9:20=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > Without this change, the rest of this series will emit the following
>> > error message:
>> >
>> > error[E0308]: `if` and `else` have incompatible types
>> >   --> <linux>/rust/kernel/print.rs:22:22
>> >    |
>> > 21 | #[export]
>> >    | --------- expected because of this
>> > 22 | unsafe extern "C" fn rust_fmt_argument(
>> >    |                      ^^^^^^^^^^^^^^^^^ expected `u8`, found `i8`
>> >    |
>> >    =3D note: expected fn item `unsafe extern "C" fn(*mut u8, *mut u8, =
*mut c_void) -> *mut u8 {bindings::rust_fmt_argument}`
>> >               found fn item `unsafe extern "C" fn(*mut i8, *mut i8, *c=
onst c_void) -> *mut i8 {print::rust_fmt_argument}`
>> >
>> > The error may be different depending on the architecture.
>> >
>> > Fixes: 787983da7718 ("vsprintf: add new `%pA` format specifier")
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> > ---
>> >  lib/vsprintf.c       | 2 +-
>> >  rust/kernel/print.rs | 8 ++++----
>> >  2 files changed, 5 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
>> > index 56fe96319292..a8ac4c4fffcf 100644
>> > --- a/lib/vsprintf.c
>> > +++ b/lib/vsprintf.c
>> > @@ -2285,7 +2285,7 @@ int __init no_hash_pointers_enable(char *str)
>> >  early_param("no_hash_pointers", no_hash_pointers_enable);
>> >
>> >  /* Used for Rust formatting ('%pA'). */
>> > -char *rust_fmt_argument(char *buf, char *end, void *ptr);
>> > +char *rust_fmt_argument(char *buf, char *end, const void *ptr);
>> >
>> >  /*
>> >   * Show a '%p' thing.  A kernel extension is that the '%p' is followed
>> > diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
>> > index b19ee490be58..8551631dedf1 100644
>> > --- a/rust/kernel/print.rs
>> > +++ b/rust/kernel/print.rs
>> > @@ -6,13 +6,13 @@
>> >  //!
>> >  //! Reference: <https://docs.kernel.org/core-api/printk-basics.html>
>> >
>> > -use core::{
>> > +use core::fmt;
>> > +
>> > +use crate::{
>> >      ffi::{c_char, c_void},
>> > -    fmt,
>> > +    str::RawFormatter,
>> >  };
>> >
>> > -use crate::str::RawFormatter;
>> > -
>> >  // Called from `vsprintf` with format specifier `%pA`.
>> >  #[expect(clippy::missing_safety_doc)]
>> >  #[no_mangle]
>>
>> The changes in this last hunk is not mentioned in the commit message.
>
> The diff is rendered pretty poorly, but this is just importing
> integers from crate::ffi instead of core::ffi, and I do believe that
> the commit message makes it clear that this is needed.

I see, thanks for clarifying. Consider including the clarification in
the commit message.


Best regards,
Andreas Hindborg






