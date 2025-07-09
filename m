Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26378AFF4CD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 00:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A5EA10E125;
	Wed,  9 Jul 2025 22:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hc7Smzx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBE610E125;
 Wed,  9 Jul 2025 22:36:53 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-32b49ac6431so2569631fa.1; 
 Wed, 09 Jul 2025 15:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752100611; x=1752705411; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xhfrvtOMsoaE+gDC4ofthavQSM3N4fj7JS72/QkCgSI=;
 b=Hc7Smzx3xPHgWnXN8F1/BYvgPVLKv9k0Uy67a+UlxDmD5IVWMBaDoFrw58hsKvKW8K
 X37qjiuJm3GFs5mNZXemus9QbBsGCwbRcShOp+4FwBsLLBi91Gb0f5nWR0BFN8JKWYiY
 K2xJvgprmrP6y2ojN09GU0WmMW42Kw5Mh/ZqtBDjmE4LLctXlCSBGUnBSKW7yzOoAdwj
 G+t+Jex4izkNibiPid+QsdNMQrmRmo40RRs4UE+OG+xpsJhYFtSv6ES5m9pd5JCOyb5c
 3+CtWrcppayvf8+bv3DiBq7TSadVq26UQj9PEMDbHXALaaj2OFLZPD2c2YtGD03UpgVZ
 cVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752100611; x=1752705411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xhfrvtOMsoaE+gDC4ofthavQSM3N4fj7JS72/QkCgSI=;
 b=v0DsbTf/jAatDPExjjBwfeyzpaU7KpcpYfaKYoQwLeKICYEuELu7h7OfqIgv3f0BCW
 FNyKiFDZKPe9nFgABKAn9vTzWi1NwqlKuplLL0K8++qFedqIhFqdmLN8jDXwZrSpMq+s
 ZUs9GfVc3jixo+Dbjpql5D1DfTXR2G2yBhVIqc0GHcqYbO9KxXLOU5OFSbZ5b9IGJPpW
 LxJ1MebJytCewJZW00gYy1l/ukxQRh/NJcRXRrlwx/x24KHcvWBatnJvhCUpRmDVphNI
 l5WrAZeQRFtk6X9mAXM9/h5DpE5tEYx6OSnqcVU4hlNtFHgrd11O3dEByojCJtS2bojj
 pb8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvJ1fHCnPxSmvqpVJzsJqKXBQp8CiBQnCJitVBA7XzpXAQQOeuhpVcsVqYRJtiXhc3bNsHHjCszw==@lists.freedesktop.org,
 AJvYcCXADnnC8UiUI111NXZmxF6qStyud52CY6H9/RnNNq6DI+PgUymxLB+no8J08cSBau9g78Jkx1RrPcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLt8BkeL2tmzrDG2I19rDD+UR8IJYdX9ISAxZ5TM/0yLCQRSWH
 CC+d0fH5b8ELsDPaG4FJk4s7z2U9hRXPbb+TFijHBH8LLiOEtFCkgstFmCcBWDTG5rYJMFG0EbZ
 iigIRA6Sh5VA1YkdgeFWn0LYaZXjxmOk=
X-Gm-Gg: ASbGncug2dJIY5ow0EhbsGT1NrK+gJSZFRzyc4A6Q2out+6joVDqrEisNyf+ttYGxjP
 WTEWGxNdgRl6ZgGiJv4cW/bJtG/Lf7dsDMJFUdVbficBdmwD6ub16UUVtX4BzoA5NEFBQL01wsZ
 pPnFIkYZFITAxGZlLlroWTJxw1aU7OwuVwR838JpTo90LiJbSJ2V8lgFEDqu/kUW4fga0nzgVHx
 TPrnA==
X-Google-Smtp-Source: AGHT+IFONhq6F+DbkzpsEpK1WwNv3QQhAm3j21ralGrjpCechN0UN+rtIDTk39PxuYI9EYRr21JY2C6Wn5OzerY5ENU=
X-Received: by 2002:a05:651c:49c:b0:32b:80e1:300d with SMTP id
 38308e7fff4ca-32f4fdaa020mr4072561fa.0.1752100611215; Wed, 09 Jul 2025
 15:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-core-cstr-fanout-1-v1-0-64308e7203fc@gmail.com>
 <20250709-core-cstr-fanout-1-v1-7-64308e7203fc@gmail.com>
 <DB7SVTBZ46QB.31WTHFLWDHPZY@kernel.org>
 <CAJ-ks9nNc_pThtb+gHUcjEnvR6V0RAEG0tkv+_DHYYjXs1N7=A@mail.gmail.com>
 <DB7V0GL2HVMV.BR1JSWQPDMC3@kernel.org>
In-Reply-To: <DB7V0GL2HVMV.BR1JSWQPDMC3@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 9 Jul 2025 18:36:15 -0400
X-Gm-Features: Ac12FXy3ucGydWQMIVi5coi-DwzxVJ4W0f_hIIoGG4YPbQ2PMfi0zxdVxhB4wD8
Message-ID: <CAJ-ks9n9Z0PtBmqNupS2390B+gq7UJuV0npD+3Ri0tJrQZVB9g@mail.gmail.com>
Subject: Re: [PATCH 7/9] rust: pin-init: use `kernel::{fmt,prelude::fmt!}`
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jens Axboe <axboe@kernel.dk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
 Rae Moar <rmoar@google.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
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

On Wed, Jul 9, 2025 at 5:58=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Wed Jul 9, 2025 at 11:01 PM CEST, Tamir Duberstein wrote:
> > On Wed, Jul 9, 2025 at 4:18=E2=80=AFPM Benno Lossin <lossin@kernel.org>=
 wrote:
> >>
> >> On Wed Jul 9, 2025 at 10:00 PM CEST, Tamir Duberstein wrote:
> >> > Reduce coupling to implementation details of the formatting machiner=
y by
> >> > avoiding direct use for `core`'s formatting traits and macros.
> >> >
> >> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> >> > ---
> >> >  rust/kernel/init.rs | 4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> I usually prefix patches to init.rs with `rust: init`. I'll fix it up
> >> when picking the patch or Miguel can do it if he takes it:
> >>
> >> Acked-by: Benno Lossin <lossin@kernel.org>
> >
> > Actually, squinting at this patch more closely now, I think this isn't
> > what you had in mind. The comment says "Dummy error that can be
> > constructed outside the `kernel` crate." but the error now comes from
> > the kernel crate :(
>
> It's a re-export, so the comment still holds.
>
> > Perhaps you could suggest a different modification that would both
> > meet the original intent and allow references to core::fmt to
> > disappear?
>
> The code comes from a time when `Error::from_errno` was `pub(crate)`,
> but that was changed some time ago... Now we can just remove the
> `FromErrno` trait entirely from that example. Feel free to do that in
> this series or as a standalone patch.

Ack, sent https://lore.kernel.org/all/20250709-init-remove-old-workaround-v=
1-1-a922d32338d2@gmail.com/.

With that patch, this one can be dropped (since it is just a comment).
