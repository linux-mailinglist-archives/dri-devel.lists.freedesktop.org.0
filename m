Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A15A49FF0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 18:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F61B10E07C;
	Fri, 28 Feb 2025 17:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="j66eu0jG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECAB10E07C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 17:11:17 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-390dd35c78dso1857047f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 09:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740762676; x=1741367476;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lm5tkiIKEouATjRnq6xZg2Gmt+vLmhfFkG47lHk6t/Q=;
 b=j66eu0jG5RAtYZItpUE4TX0IN8phQfxfO625IJ97Dwm08ghCHl2tnj/OGTaqkrcrFs
 b0w8fHxA32wSiG9hpwUA1hlBCFeP0f2K4dKdK48eIm+Tk1U/TFJu+lFEGICY/zVo0eLO
 BqWpHnLuoLlGpZOFa2JARPp9QVQpXP5PvvcqimTHRz5B6n5sJnGNBsbZjqdab/9Idads
 MSQfyz7YNogyxACghzG36ljh2D35J7cKXbaxKftkdCD0iFsro8EOGQjcaDuiEaBx54Je
 JLAmACHHw0xZCbiVLOgzRWRVEjnM1z5NfUM4BaAxS4pUKsEQgo9fmcazA/051xeLbzFx
 0P/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740762676; x=1741367476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lm5tkiIKEouATjRnq6xZg2Gmt+vLmhfFkG47lHk6t/Q=;
 b=f7SxXZOZkeCY//YOkgv9gkK0iTHq/hXgB2qH6rLfRO4lO8dpHcItsfVK6y+VXZf9UL
 l7R4f89/Q3nABXDpQhb0u9cIM4mByFZ5mCdC/6kRl2dmYZpE2cF0LMziIZQBwVPg+84P
 8+1XGZEjOrXy4b5q3IejVt9LyteNKxLNCxJzzGR56kRQPZ0u2l1nzqSErmM6FQRKKsru
 a+VCP01y6NXO5BWZH2S8TADmx6K8odjvjQKw96WnBN30uzdKodUT1PWY3qARnTJxBFAl
 kgKYIklPkMMytH3fgBz9RuspkUbnmWEZ9EIxHvo4/D4RR0gWmqdFo7Qr5c2eR8OUHpRP
 IUJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmZpqPf9zVNMN26w42MOKdAcp3WG+2dhXKVJw7EcUqSVel1vJXBNZSVqBeV0LpAyYJxe2uBlYvzWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGJRgtKMKS7BwDFRcM8Mm1sRpmbODssUcgJdCfVdF85UNDguTU
 wPWSewkhXkbXWa0quqBJ1/ocAU91OTvXzzEzMFMZrDKMaRi0ChN6dm26WXe8hecS11CtIG2/gnh
 x1pEPn0tXtbcSHA0Ti7XT40+L3qrEc0fIVzY5
X-Gm-Gg: ASbGncvs5Odjjo/8VLy+iMA5Y49friz/QjtQs41WVurGgyBcbt5VkwJIO6uuZjru8O8
 MJcSlelwNQa5gUhXF3+SsxeQhwntMlb9WuimmsNhbtvGA6MVfIo7Xngj63u+7O/uRl0LIpIGOEK
 8KxdVEvLN3Ce63TiEx0x3DU5oh76TOIROvJZUWGg==
X-Google-Smtp-Source: AGHT+IEMnuR0iRhtphtXv4C1QTHxHM1MIyDPo8Vyt1D9qZ9NHPH4ubF54Q6k9zhNs3EPbgW0cWdG6JTGPvwTNX3KM7g=
X-Received: by 2002:a5d:6dad:0:b0:38d:ae4e:2267 with SMTP id
 ffacd0b85a97d-390ec12f046mr3603491f8f.11.1740762675629; Fri, 28 Feb 2025
 09:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-4-569cc7e8926c@google.com>
 <Z8HYGTewVatzRJ34@smile.fi.intel.com>
In-Reply-To: <Z8HYGTewVatzRJ34@smile.fi.intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 28 Feb 2025 18:11:01 +0100
X-Gm-Features: AQ5f1Jph-NW-kfDiUlg4WnpPXpZgKBTJRy_DkE273cFFp2CxLlC5lP5nC9EVn5g
Message-ID: <CAH5fLgiGb0QrW-Vm2TLHvoCKCy4LiwyrfmMV_oGH0LanTuQHOA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] print: use new #[export] macro for
 rust_fmt_argument
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
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

On Fri, Feb 28, 2025 at 4:37=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Feb 28, 2025 at 12:39:33PM +0000, Alice Ryhl wrote:
> > This moves the rust_fmt_argument function over to use the new #[export]
> > macro, which will verify at compile-time that the function signature
> > matches what is in the header file.
>
> ...
>
> > I'm not sure which header file to put this in. Any advice?
>
> I believe you found the right place.

Thanks for checking!

Alice
