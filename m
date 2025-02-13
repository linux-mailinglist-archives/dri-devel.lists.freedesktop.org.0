Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30EA33E2C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDEC10EA74;
	Thu, 13 Feb 2025 11:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VH9KUzDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9DD10EA74
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 11:34:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0AE05C3F02;
 Thu, 13 Feb 2025 11:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6D1C4CED1;
 Thu, 13 Feb 2025 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739446465;
 bh=OiHvXcKA8YEFpd9Ho+xwvuJZYb/UQvHhXv95Idt26nk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VH9KUzDf56JrzQWwxUKQHMH8PhlT80HnzwC6f0hEa7xiJQCHJbsULUpCwdDCBmV9p
 4/RNBZyLaNjWHoVMUjVajSj9gH1Fjn5HgF4y3mdZ6iAF/ljFCqjAzP5hOKD9mM9FES
 vbL3Sbr9Dl8VCdvhKsBYjFsZkoCO2mpjKWF5iDY1LgoMpz5x+ayMB//WKs2t7Gw0rF
 gOw8MspHlbKYeHnFl1/SRW2OXQkGeacM8F+lv8uX8THx9WHxBHO7D9Vf2zUs3F4cbp
 WXXJHtTBlik1+ymnomlNF/nEwUaqr3nF7dfBnPFS9gnSL06jeFRCYBvVdCcpub70k+
 0UNM8tgqXONtQ==
Date: Thu, 13 Feb 2025 12:34:16 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Hector Martin <marcan@marcan.st>, Steven Rostedt <rostedt@goodmis.org>,
 "Dr. Greg" <greg@enjellic.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, phasta@kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bj??rn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z63YuDYEEXfurxpY@cassiopeiae>
References: <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
 <Z6bdCrgGEq8Txd-s@home.goodmis.org>
 <1e8452ab-613a-4c85-adc0-0c4a293dbf50@marcan.st>
 <07c447b77bdac1f8ade1f93456f853f89d4842ee.camel@icenowy.me>
 <Z6nTxks3u-ErSalQ@cassiopeiae>
 <d7d1fb8af8857e7ebfdea48213849ea9ba446477.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7d1fb8af8857e7ebfdea48213849ea9ba446477.camel@icenowy.me>
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

On Thu, Feb 13, 2025 at 11:49:20AM +0800, Icenowy Zheng wrote:
> 在 2025-02-10星期一的 11:24 +0100，Danilo Krummrich写道：
> > 
> > (Additionally, in this particular case even one of the reviewers of
> > DMA MAPPING HELPERS offered to be a reviewer of the Rust abstractions
> > too, in
> > order to keep eye on the DMA API angle.)
> 
> Sorry, but I did a fact check on this, and I found that the only
> "reviewer" of DMA MAPPING HELPERS is Robin Murphy, he has only one
> reply in this thread, and the reply only says "Indeed, FWIW it seems
> like the appropriate level of abstraction to me, 
> judging by the other wrappers living in rust/kernel/ already", he
> didn't offer to be a reviewer,

As Abdiel pointed out already, he did offer it in [1].

But that's not the relevant part, but I think how you handled being in doubt is
relevant.

I think the correct way would have been to just ask for a pointer that proves
the statement in question.

Instead you just went ahead with the big words "fact check" and then even got it
wrong. In your "fact check" you did not put any disclaimer to e.g. indicate that
you might not have the full picture, etc.

Ultimately, the way you replied to this, comes across as an immediate accuse of
lying.

I really think that we should *not* pick up this way of arguing that nowadays
became all too present.

- Danilo

[1] https://lore.kernel.org/rust-for-linux/4956d01e-2d06-4edd-813b-9da94b482069@arm.com/
