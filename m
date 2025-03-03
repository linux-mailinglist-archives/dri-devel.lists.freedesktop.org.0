Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99756A4B943
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 09:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEBB089369;
	Mon,  3 Mar 2025 08:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gfMFfTUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DF889369
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 08:28:14 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-390ddf037ffso2060260f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 00:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740990492; x=1741595292;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gLvDvN37rSZdD6m86XjZbKgQ5aDQc83ylMnqHwB2npw=;
 b=gfMFfTUj0NeCCFLh5b28ECMJD2bVMPOtfHlQFmXLerKKiklbej1e/dgsawW57j+x2Z
 rG92N6JBrv+Vf9GlUD5BleyxyYbdPcEtSeuZVeBbY05M00DkqJoyj2Kc7L7YCTd+MXaO
 AR307B9PsIMzrkPdDN7vCjfgO9C8y9E3ZncFYqC4V7VzekQuXPI8oflfqW4isU3fm+wl
 fDZmPyWPFCzVd3LAyGMQacdyMsG1Q/F8MbME+9/p6EkaOhGHkUQR7L/ytg7qM1h1BNBD
 XHKTN0D1R33miD4O05wrhdU3Qzhu5oWIIOzcT/tr2Vofeft1cqbfBLgblvpXLYERKO78
 hMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740990492; x=1741595292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gLvDvN37rSZdD6m86XjZbKgQ5aDQc83ylMnqHwB2npw=;
 b=Wkb8gVeLSf0gi3XCIIcHDnYvrWJcoPcjR6haEgqthVp0i1mMw9rjqXPyMj9SRYRwln
 mhCFpjufypG0gFRCCHz0jxcSif06c01kRXPNB7eQq5Y6onBT2nTkn5hKySrEbPGbns9c
 XmA0ZlcZSpEmWDRSE32e9QBojP1jP72aEEqGasgs0SrC/KVgeBVetz5MTiV2SMMxRvLF
 PIJtT5UgPwoHcQ/Wu14kS3DYDW2u5rZ2BT0sqEmTlE1gJXSU0XTWsyaJqiyaY59X2oGO
 OQnJKL4657kk2VfcgiJBQSaEooeSJQqnyiJmIydADCxUV85yiXejmRuBAP+h8X8EMVgw
 jUxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjmRnfQ4MLSHGGUuwjFIuGqhg35ZLxvZFthFcSs3jOirVxNnTh8qZpFvg1SVgD1EV9chhUjXJn6QY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGnLdxy0ydIUagEcR9k/2UsoscfFOpjwBrEQwBH52EfiezCmRd
 sCnvjhIyWsrFGwvD4jY9HHFJKgZNYsC+Xtj5ByXWPb1hYCY4EHY4FptF/e/Vl4gtharDTFol9gG
 O3RjxRAqocw/xwHTxmn8JnVcD+m9CxMGqEJSw
X-Gm-Gg: ASbGncvmUMYK/V/lHD72iBItIXvOQrCjFkB23smIi0kPvC+880xTA/P0Ms3W1rkVuGA
 3Dval4R9FGJsnpxZoq3xXj2WbZgpbaDQoINoRRKCje0xuAlyLI65UL7tXiOVOJy/5dPcf0L2iso
 ujFg+Q9d9QwaWWUWbHyZd5keWdt8weTfZHCinSvZ2t/R0xbL136G1upi4I
X-Google-Smtp-Source: AGHT+IHnj4KwcJwR4hqqqZ0/9sOxcRdaZsnmJP5IDASm2FTMhGCue7uJvacKssbH0SCdqUWPbng41JGRR50dPvmLyKs=
X-Received: by 2002:a05:6000:156d:b0:38f:5057:5810 with SMTP id
 ffacd0b85a97d-390ec7d1e40mr10547737f8f.25.1740990492516; Mon, 03 Mar 2025
 00:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-3-569cc7e8926c@google.com>
 <CAJ-ks9ng6AqmDynFebR+2_ZEpmvxkUNWdTed2vr0kede0dxcxw@mail.gmail.com>
In-Reply-To: <CAJ-ks9ng6AqmDynFebR+2_ZEpmvxkUNWdTed2vr0kede0dxcxw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:28:00 +0100
X-Gm-Features: AQ5f1Jp_z3J9oogrNYre-GB0tMVaV9ocvNHvETVAolm9W0Emv57UL3K3-UTPtKA
Message-ID: <CAH5fLgj6jQ9Ga2HMqXF3bypxy4qA-wgrfQx2htq0k=V0jfNMpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] rust: add #[export] macro
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

On Fri, Feb 28, 2025 at 4:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Fri, Feb 28, 2025 at 7:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Rust has two different tools for generating function declarations to
> > call across the FFI boundary:
> >
> > * bindgen. Generates Rust declarations from a C header.
> > * cbindgen. Generates C headers from Rust declarations.
> >
> > In the kernel, we only use bindgen. This is because cbindgen assumes a
> > cargo-based buildsystem, so it is not compatible with the kernel's buil=
d
> > system. This means that when C code calls a Rust function by name, its
> > signature must be duplicated in both Rust code and a C header, and the
> > signature needs to be kept in sync manually.
>
> This needs an update given Miguel's comments on the cover letter. I
> wonder if the code should also justify the choice (over cbindgen).

Will do.

> > +/// Please see [`crate::export`] for documentation.
> > +pub(crate) fn export(_attr: TokenStream, ts: TokenStream) -> TokenStre=
am {
> > +    let Some(name) =3D function_name(ts.clone()) else {
> > +        return "::core::compile_error!(\"The #[export] attribute must =
be used on a function.\");"
> > +            .parse::<TokenStream>()
> > +            .unwrap();
> > +    };
>
> Could you also show in the commit message what this error looks like
> when the macro is misused?

It looks like this:

error: The #[export] attribute must be used on a function.
   --> <linux>/rust/kernel/lib.rs:241:1
    |
241 | #[export]
    | ^^^^^^^^^
    |
    =3D note: this error originates in the attribute macro `export` (in
Nightly builds, run with -Z macro-backtrace for more info)

But I don't really think it's very useful to include this in the commit mes=
sage.

> > +    let no_mangle =3D "#[no_mangle]".parse::<TokenStream>().unwrap();
>
> Would this be simpler as `let no_mangle =3D quote!("#[no_mangle]");`?

I'll do that. It requires adding the # token to the previous commit.

> > +/// This macro is *not* the same as the C macros `EXPORT_SYMBOL_*`, si=
nce all Rust symbols are
> > +/// currently automatically exported with `EXPORT_SYMBOL_GPL`.
>
> nit: "since" implies causation, which isn't the case, I think.
> Consider if ", since" can be replaced with a semicolon.

Will reword.

> > +#[proc_macro_attribute]
> > +pub fn export(attr: TokenStream, ts: TokenStream) -> TokenStream {
> > +    export::export(attr, ts)
> > +}
> > +
> >  /// Concatenate two identifiers.
> >  ///
> >  /// This is useful in macros that need to declare or reference items w=
ith names
> >
> > --
> > 2.48.1.711.g2feabab25a-goog
>
> Minor comments.
>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>

Thanks!

Alice
