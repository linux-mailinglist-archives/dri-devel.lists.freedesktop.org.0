Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21636C32BAC
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 20:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4265D10E31D;
	Tue,  4 Nov 2025 19:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BTL3JQJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530F910E31D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 19:06:54 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-78283098d7dso289866b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 11:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762283214; x=1762888014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/wAeCuRxzb2BXeoNq8+i8slzGY9RtvDmLaGwdLPgLzA=;
 b=BTL3JQJf+Ua+ddF6AOWaB2Gs0IwA5O2DN1wWc5WA+Y20SC0+PwHXdH5xK6YnESF5rQ
 9ntgrsCYKs8ktJQIVPYfLdOPKCwTX4GCl9M2SeQhW7AhfDWnFTw+R71rHLv74DsEKxRx
 4Bdpw0BpWx+2VPOuBuhyU5YlPZC9gWgH7/0hjh3Kmj/OXpN/eaRb4704w6hAzNNQuQgp
 pm3xxope3GW9BVi3Nd2aQHLZ2TvpUGrd1T59Zkg+LQqb5khVcUSCz/HkqFcyQabiGQTk
 IjEvqIk1+nE1Yo0rC8N+nIyb+Dk3Up9C+089PBi52j64T6Jr/revAfVPoX8uwf9gRamI
 36LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762283214; x=1762888014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/wAeCuRxzb2BXeoNq8+i8slzGY9RtvDmLaGwdLPgLzA=;
 b=oypV0PhCXMXUr3LDkdXYzCe/8gfsnNnEb0u6QbgdumR9PB4zbkrifvmEW393ukTAQj
 aL88drcIP6j2Tx95a/94UsxH8xTeAXh8XTdAi12q/fTLbLVckKJYPLqRHwgQiqUcqeaw
 KFsB09co/3KXyvUJ+Av8ZfqOCisdFtazjSxKQsYZsciRtnjlF/BzDbjEPzrvVr36VEjx
 nPwNi5STPfybWhezC31ObBWl1cuW08ti6Z1zMzk8wY+uAlmzaiv6Ppla/4XaJ6G9zqlD
 oaYtbvEZ6fw3FPAtTDcvFpgHrcqMUq/daU2KRwxMDsfSn1ytI8ZLVGzHX9FtBzc0wLkw
 gCbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq4dO/qsmVvqNLHVLAUZ9qjgXp9Ki7kwEHaJZgXrKEmAM31hR8IQ8eaoqNi2XRMw6f0Phyb9ux66w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz29zyuSy5zBYJJ8t9y5ozuYoJeNkqq5hT0GY2/mrfmaMtf/8hs
 mCvWJdmJPqFjC7HmB4dg2BbNWOZoCKwmyXl/xqwom936coylwu/5+CbDFiyvNhh0LzuBp3GQcT7
 Gx+SN+JVO++Iz3NswdlVGgCvQPTeF3VQ=
X-Gm-Gg: ASbGncuE+dV34RASnvZJ8Znx0B8Fa+Su3ZIA5Kpsfnhb7xI18En3mA2ZQh9yOyJ7tV2
 BIA2eb7u7iFTcBv2JnleYK3tB6tAW/o2oDNIS2b1GvG2/zpQL9pIiKt7P/YlaN5uGhAtCQBComG
 EvW/SsAcFLm57IuNE9w+QcYFQ77NByvxxEfN616sbA5QFCAnepLeT20/WgHdGO+Sbs+OeCrkhXx
 7SW4aB3PdePr2/tqDnnybZd/1lJR/ysLJDU5cUIcD+KsYJHE8b3TUwh22orjeh0FniYSXCnin8a
 rJ7w8WiSay6mOX5k+S7eaC52/JBK8c2PKMnv7Oz4sl37bgqk7FgqrY7jOHWhZw+InW5u3FKsSoG
 Q0qs=
X-Google-Smtp-Source: AGHT+IE6zMw0orjCDwKe71BtT9keGPs74U4T3Nt51J7XxmrJZBuNOyX0hJ52/hdnOd+9OYS5PomAI+ZTVm+Zm9uBsjU=
X-Received: by 2002:a05:6a20:3d8f:b0:341:29af:3be7 with SMTP id
 adf61e73a8af0-34f86d04830mr209534637.7.1762283213593; Tue, 04 Nov 2025
 11:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-2-joelagnelf@nvidia.com>
 <DDX1WYWQNTAB.BBEICMO8NM30@nvidia.com>
 <20251104005812.GA2101511@joelbox2> <DDZYCRCPYMOL.RMTIF0R404Q4@nvidia.com>
 <CANiq72=Cj_gJ27+EAiytxYGYk1dMwu7M3xQpLGByD4QstgDsHw@mail.gmail.com>
 <CAAOQCfQ_d_C7oZ9uq2siJHn1+m+j059qYUMBvTWOnQ5Etk91ug@mail.gmail.com>
 <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
In-Reply-To: <CANiq72nLzuCXh0r5W0HMM36f9yTSQfP9yCxXbzH+wS7VxFM2Eg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 20:06:41 +0100
X-Gm-Features: AWmQ_bnwMN6fmA9J5YYRK5sVTYidOU0VW_dN7yFlDXkN-QCauIAosWdhzgT_uW8
Message-ID: <CANiq72kYYu9C94aY72HK1ELSmvktF3nq+G4+smdAW_Xaxw1kqw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] rust: clist: Add abstraction for iterating over C
 linked lists
To: Guillaume Gomez <guillaume1.gomez@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, dakr@kernel.org, 
 David Airlie <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
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

On Tue, Nov 4, 2025 at 7:35=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Orthogonally, the script that generates the doctests could perhaps
> help to automate some of that. For instance, we could have a way to
> specify an "environment" for a given Rust file or Rust `mod` or
> similar, and then every doctests would have the code prefixed to them.

I guess this could probably best generalized as "tagging" doctests
with custom tags that `rustdoc` just forwards in the generated JSON.

Something like:

    /// ```tag:foo,tag:bar

would give us a:

    "tags": ["foo", "bar"]

in the JSON. Then a custom generator like the one we have could do
whatever it needs with it, including prepending code or other things.

Now, I see there is already an `unknown` field in the attributes which
already give us the unrecognized ones, which is great and we could
potentially use that.

However, should there be a particular way/namespace we should create
our custom tags so that we don't conflict in the future with `rustdoc`
ones?

I have added it to the usual list:

    https://github.com/Rust-for-Linux/linux/issues/350

(There is also the question about supporting the old non-JSON way for
things like this, but I am ignoring that for now)

Cheers,
Miguel
