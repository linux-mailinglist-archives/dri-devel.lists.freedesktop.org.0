Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63485BA5EB1
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 14:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4115B10E192;
	Sat, 27 Sep 2025 12:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XVIuhLYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10F10E192
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 12:14:34 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-26816246a0aso5645785ad.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758975274; x=1759580074; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cQ/vViuV5kkPC8N6xSHm2TBoNeswpTWYDcjW2WZz3iw=;
 b=XVIuhLYHh47c6LZHGg2B2gtcdT6OEV96jIKqf9nSqSY9LkfnBo2qOTG5wX6VhCoSgm
 IXVriaCwgapRXnvpWMv8YVo6cqm26k6c3LeRRHHa9Zz4YmJKUpDJA3EMb/YcvzWLgD92
 VBlKSMRgrHoU1bs6r9t3Z+pE331B292Hlf72xg23ElZvn6eEhlYeS5T5wo8Pet1xoqoQ
 XArhjzrs3yk6caJUTDXqPp4wwJ2D6P7mVnIRuAZyl5UMWlDyIwvzrhcdTn4FgmZKYW5n
 x6ADDN2P/j/0fakKEeEImYNsDaUNjx1Bfd6o3yNVGVg8fyImqadNlMx0FHyefYNj8TZH
 TXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758975274; x=1759580074;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cQ/vViuV5kkPC8N6xSHm2TBoNeswpTWYDcjW2WZz3iw=;
 b=A8h2AAdxu4p7eZrl7ti8GzZ37qDZZ+qmU4iaSgjxuIEf61GUIK11GyiOZTRulqj+3q
 3jfBBPWQ9f2DXiRaS++9UmnpBZgiJepjXwMBMoAesjiRQL6cEdrbLHM5qFZLZQc3uN8O
 gTS/ahbRID0anwygAHkaHZcRHyqYmYVVSZkuzvTdAsGQ5GWg8ZtgyuwM0iiK0N4ycsIj
 iMbbW1IDxo8jUs8wNaxcnLLR4nwAyP3geXPZiXdAIgQh9LtDM6Gw0mPP7bJCiQpOobOD
 AzYugjVVaXYjbVBtGT875s/NUN8KtZ+ReYXHL7ErDQGjP3HFqan1R2G3P8uh58JhctA8
 STIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsxPr9eQ76Qa8PurO5/VVDF/0CPvItRNg4w7YSWwA+s7C/IFvfa191hVGk68wvtQtqRnPH6Q76fmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfguoX8lBz+AGbtkDVcDBA7lKQGhrgpvKD4vRHmVYH2/TQF8ve
 Y8CH560YTi35PcGRzRWhKhs7i0cgVBLS5MhOnOZgeEWzB21eaCMy9s8Z59Pz/DON5uhnPtmynHL
 K8pnFyAUStOBx1yUfIbUx57mzX+PiocU=
X-Gm-Gg: ASbGncsv7Kb/6buD3xHfGwJpR7IR8zJpAgq2XnSWZNhYay6kn9WCbe8SnkBq8vj35aL
 z7hNjHMGhZz4sVF46sOIFJ2J8wMQh6b5O6VW3YKC5Zc8bT9dLepHlPjgiC/IKufb8F81JcbxjFu
 o9YvGyH7xuQoT0UmdJsLr8jUr2p6DoHZ4pjbqS9A1OU8hu4W9I9cVTxynSdrfnsB28jkVBVbyx8
 UKvvny+XRkfPPkDZMOhexFBnKc8dcFXyhtEbzBxeF4A4isq2VszJUH9y9a35twj2mae8akfqUWE
 cjLnW3dMw6onwmAqAIev3hvnI4jUI3AAEAky
X-Google-Smtp-Source: AGHT+IHZjp/EfiazAV4KIr6CKQXQ4M+vN6ByhlopidH8GmTXvgth0071YPgESmpcClrC9cwMbzePH8Og+U45ZvhzRpU=
X-Received: by 2002:a17:902:db11:b0:25c:9c28:b425 with SMTP id
 d9443c01a7336-27ed4aca4a5mr73015705ad.11.1758975274365; Sat, 27 Sep 2025
 05:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250918123100.124738-2-phasta@kernel.org>
 <aNa7BDpKS2KA__4M@tardis.local>
In-Reply-To: <aNa7BDpKS2KA__4M@tardis.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Sep 2025 14:14:22 +0200
X-Gm-Features: AS18NWCd0oDH3VKEokXgs76roViozK_Ajh78YilTwKiHy-TyrYWiBu0MM9gxng4
Message-ID: <CANiq72=6pGtKKr3XeZXLVrJTNMv7YbGzbezSUrZ7A43MJQLwJg@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Philipp Stanner <phasta@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, 
 Lyude Paul <lyude@redhat.com>, Mitchell Levy <levymitchell0@gmail.com>,
 linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
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

On Fri, Sep 26, 2025 at 6:10=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?

Either way sounds OK.

More generally, one thing to consider nowadays is whether we will want
something to eventually live in its own crate etc., but for this I
don't think it applies and being in the `kernel` crate is fine.

By the way, should Gustavo and -media be Cc'd?

Thanks!

Cheers,
Miguel
