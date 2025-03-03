Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B8A4BB29
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 10:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B905E10E265;
	Mon,  3 Mar 2025 09:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="VtgWdjE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F69C10E265
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 09:49:23 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-39104c1cbbdso457518f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 01:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1740995361; x=1741600161;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnL9Hz24S3kNKDp8b2cNl9jZ/3k9Ss4gpw9SmsSpB2g=;
 b=VtgWdjE85mRpp8aITnLQC4gOmH/0S5Fco446OeBxD2w5Kx1u7QnUiUTLUo/XXeMCd5
 cUeCHz3HwKj0MQTD0UmlvSA0eVnXbqLcUiVu3SQeqUG4SFD6fVaDcMx6d5mF9jsz/1sF
 Am5aZwDDCbfFB2HaczD9CuxuZ2S8AjB6d7fFOO/9T9prQwmhopggmeK7paiJJ5RhlSr3
 1RCFQ096HjWohBNFoFhmoUPgn6kL20RUExS9nJn8TxXeTSrFcF2U1mXo1X5+gocan6ok
 RIOeltUPpAqGAmwe9cnrWNwYsN2dP6G0S+Xt5M/rmGsxAuXxobF+FbE/7e/Ocm/ETV8i
 i0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740995361; x=1741600161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SnL9Hz24S3kNKDp8b2cNl9jZ/3k9Ss4gpw9SmsSpB2g=;
 b=gtd2Qu1zbP0QxtLQJT1T6/sX8WNHwtS4bHIextlpmteoGQEDm86WCRLWwg+5f0kALb
 gqfPdM5jryxDtI5ReFRZDyiIWo8nkVhVpVGeBCL4RDolVpMM06i0FOvQIypnQO6SDfa4
 cAXygCYEJ7Vlqre9fLo4YWOgjnWJlEz9U9ME0lWTZeIWOyOFSrnZ8Icypck4Z/QI5J8y
 tDWzI7H0ulsspaf8rq49bPjCIxeH3GWYBrtcqSA4a4SuMpuA+qiBPx/0WZgX2nLwJV3E
 1LqBBWdv2c+PT5J6YgNaMyaT0jiWcnIY50MdNiIJDuPJqHjeCeINlduuj7vD6a906c4N
 cD4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX50HOAGHU+BqaqB5BxXOrDft5Cy3wTVB34FkB24lEgJeN3b+HunC5jcFfRXveyJnt/Oam4U+Pa43o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsojwMbikB8nEmxysp40eriJnOCpMZrHmORXa5dci6KWrPAiiU
 McjNEqK+4C5tdkfWR00jmhtaEn+cpYR1a1JbZUP4VJF6MivYnCGOBdwhN9JKETlugDgwxsMAeh3
 k581zCJg8uYD5P/vlLL4QIKfZnJnzpP1h5ez9
X-Gm-Gg: ASbGncvD+mnSdYcy//tHlVrUir+KSGcStBr2FPK7zvOLlo6fnbMQiT2LpH9ABP1P4yo
 44P2IB5MMp/oJtfDvfkfwkjaafzCEo2frjYCs7xT3lR0BYPx3nwRhlnhc3B/idpd2ockL2GdUhd
 AZHHqbOe7daDRbPyetrsb7g4k8qiqr30yf/doe69lixUcDV3NwlvKvbZXI
X-Google-Smtp-Source: AGHT+IGTVr2JIj2NM1dARmHjx2Q20a0Sj+PRO/QysiCo1gjTEuQGm9OoWgT0wK6Y1r6W2Tsdd+R6BGWXSNz0RLNl2NM=
X-Received: by 2002:a05:6000:270f:b0:390:ea34:7d83 with SMTP id
 ffacd0b85a97d-390ec9c166cmr8927299f8f.31.1740995361321; Mon, 03 Mar 2025
 01:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-4-41fbad85a27f@google.com>
 <Z8V6XafrTyrB4z8D@smile.fi.intel.com>
In-Reply-To: <Z8V6XafrTyrB4z8D@smile.fi.intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 10:49:09 +0100
X-Gm-Features: AQ5f1JoxwuAGeit50aUfVN8jQmqWDDJZmGrbhn2c83aPm7MkhBxBt-nYtmFZSyw
Message-ID: <CAH5fLgimM6gL2v4z_x717iYU8LYTfypEi=wkj3mXS4uu8Raq0A@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] print: use new #[export] macro for
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
 Tamir Duberstein <tamird@gmail.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Mon, Mar 3, 2025 at 10:46=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 03, 2025 at 08:45:15AM +0000, Alice Ryhl wrote:
> > This moves the rust_fmt_argument function over to use the new #[export]
> > macro, which will verify at compile-time that the function signature
> > matches what is in the header file.
>
> ...
>
> >  extern bool no_hash_pointers;
> >  int no_hash_pointers_enable(char *str);
> >
> > +/* Used for Rust formatting ('%pA'). */
>
> In case you need a new version, please drop a period at the end as this i=
s the
> style used in the sprintf.h already.

Sure, I will remove the period if I send a new version.

Alice
