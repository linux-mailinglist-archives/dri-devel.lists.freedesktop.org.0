Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB398BC2092
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 18:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6395E10E6E0;
	Tue,  7 Oct 2025 16:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S10hb3Vk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6F610E6E1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 16:06:15 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-71d60157747so72064297b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Oct 2025 09:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759853174; x=1760457974; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zxd7w+3c/2swwtIgYgecKNq0yqsZikLr6MYY6N0WKtE=;
 b=S10hb3VkPw/nmdOUDx+vMkmAwcnn8Lm+bwpAD/dsDlHU5mDQ0BLntUQ94mFHxEVn9s
 O5D6SMqomvyJNlt/VkNufxFZQPne3GhZ5jQioS8LLGdfxINJREL7QLb3R0JT8Q0kgeKj
 tENfiAESuZPp28ALD+/6zgRiS83hWAu7imfeniUODh6lGNU8O3Gr31omz8zn1Xs1EzUo
 +Kb/1zegO6PG+Nph6N1Bm87thvtf8pndgSlVmjzdXfJT1KpLsiKTLePANqM0PMuQzhLm
 h126d/i/jtiY/Y3oTVbomR0Tdui07MNWPgQH1iQu1HXbuitEowrDAIoTAQ0cXBvvjvCz
 8Png==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759853174; x=1760457974;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zxd7w+3c/2swwtIgYgecKNq0yqsZikLr6MYY6N0WKtE=;
 b=AQnFsdeLoOLPj+KSXPU2hslPT51E6p0Bh9434dXb+PWLtN8RmtEGBtI7MTeW26uC2S
 8W6MSK0a1kXQ9Ua+jVniOs4GAWPDCbwOi9UWTz16CqIqbYMI4V4E4XCE1bRBX9f2I1Kx
 HER0+JtkEyw55NV4rgCSVBfcmWxEW/cLOp6Q8PoczYoydZM9tNNKcVS68S/dgiOe1i7+
 Ec/fFFzmJgJ5BjdvyxMXHLh5tyRh4rWSiINWgnimjWYSsnq7kZ2BoyDrl0JbeUQhYd5r
 2U6ip73D2a60ldFA+9L/30iH7Zp1ayT7jWe6i+PF4CGGagmP8a06SVJQclFTyl8MW+2d
 djtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQEpY1jddXJ6RJP2LKI/RDEzUE4gWLwtnR3Hg5O2Vu0RMPxNIvKKz+0bHWwVqVz+7rH9k+6Ok22Ao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw3ZnMwDW6tiWXswWXy0c6rGKbgfZfUJNt7491r/dPYb+NIsUV
 8GfBK4I3+lLf0AjE0SzEzB3nbmT3qxYHXgzvrDJ45spziWMFDEhFlMHe
X-Gm-Gg: ASbGncsNR0925P28u3iu08yTUYdlRLOYdJbH2LwEmu7ASJ/6Tcr/ZBGWycAyy2s4Fze
 RQctbOQ3p/9ZY/ozIytTLD8P10v2tWCRwyP44TPB5gXoPYgBbVg3LAUr83/py8b7F6bLh7cB9C/
 g3qBxwUeILD+S2+pjmLuHqXMGEtiFfiWITijDEIxcVpjqhukYQ/mrdnx77CJf23JeWX0ynreZJf
 B2R8M3/UvTOuiXUxdEmUfGcseuArqK5KYC4wopvFTrto7N+HJ3xZH8YtdkWq0UbGj4JH0vROYyg
 1AYh05MWbloK+JG7RwzA1TUn4lr35Key0FEnMUjjwzmg9UyWb1z9XOZG25/DlCyGBA9VxMY6OyM
 YMEugpiZUcIrIw1gEx+8GFd5ozcdfK8cO1XlYpuK3mB2KMgUI+AvW12Nf/AcUQgZPKgQYu8IQQd
 ZXsbg=
X-Google-Smtp-Source: AGHT+IGOfFA9QkKleZeWTFtFw7q0cnvtzA4e283IrCuPbzkVclh+0FUFO6eeZ9qg2IcZjjtJmEaW9Q==
X-Received: by 2002:a05:690c:4a05:b0:77f:a301:4634 with SMTP id
 00721157ae682-780e17aa12dmr3158717b3.45.1759853173810; 
 Tue, 07 Oct 2025 09:06:13 -0700 (PDT)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-77f81c0c2cesm54284547b3.11.2025.10.07.09.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 09:06:13 -0700 (PDT)
Date: Tue, 7 Oct 2025 12:06:12 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
Message-ID: <aOU6dEEedEnK5ZTk@yury>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <CANiq72m1eiGVJHNyym+JwM=tQ9bGnmoW0+OuKQ3Vxo_AQOy5dg@mail.gmail.com>
 <DDC4DA0BPHRC.3P5M2CXSJYYTI@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DDC4DA0BPHRC.3P5M2CXSJYYTI@nvidia.com>
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

On Tue, Oct 07, 2025 at 10:20:54PM +0900, Alexandre Courbot wrote:
> On Tue Oct 7, 2025 at 7:42 PM JST, Miguel Ojeda wrote:
> > On Tue, Oct 7, 2025 at 12:36 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >>
> >> We can assume maintainership of this of course, but is there a problem
> >> if this falls under the core Rust umbrella? As this is a pretty core
> >> functionality. Miguel and other core folks, WDYT?
> >
> > I think what Yury may mean is that this should get an explicit
> > `MAINTAINERS` subentry even if it falls under `rust/kernel/` -- I
> > agree that is a good idea.

Exactly. Otherwise we'll end up with a single maintainer for a huge
codebase written by different people for different reasons. This is how
lib/ is maintained now. Not very effective. 
 
> Ack - how do you expect things to work in terms of code flow? Do we need
> to have a dedicated tree and send you pull requests? If so, should we
> host it under the Rust-for-Linux Github org?

(Not sure you've asked me but anyways)

For maintenance hierarchy I'd suggest a structure where an author of
the new subsystem obviously becomes a maintainer, then some acknowledged
Rust person co-maintains it, and lately some non-rust person from a
related kernel subsystem becomes a reviewer or co-maintainer.

In 6.18 we did this for bitmaps, and the maintenance entry looks like:

 BITMAP API [RUST]
 M:     Alice Ryhl <aliceryhl@google.com>
 M:     Burak Emir <bqe@google.com>
 R:     Yury Norov <yury.norov@gmail.com>
 S:     Maintained
 F:     rust/kernel/bitmap.rs
 
Check 11eca92a2cae ("rust: add bitmap API").

Thanks,
Yury
