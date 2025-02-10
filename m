Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2166A2E92B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 11:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B6710E4E0;
	Mon, 10 Feb 2025 10:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NnxyMAmp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0512610E4E0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 10:24:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8FF32A40FB2;
 Mon, 10 Feb 2025 10:22:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A394C4CED1;
 Mon, 10 Feb 2025 10:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739183054;
 bh=TctaVDweRinYvOUGBU0wd63UFzTDTBKv9BZiXXpCc9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NnxyMAmpYjpQViak815nMD2Q3JlAq3Zygy6vwbdlyHRtFyRXPpB1asssv+q0Mvih7
 oSBdssa6nD+bGnMOfNizXItRLhGFMDW1fW+CI71oiYb9B0XlsQMQJAbaHTfTjPTKSB
 mDqzPt0uRQrhgO9SSroduw8+Z54KwVIhOdCjD7MY5R5JiRBpMlisy6U287QhtJz+0L
 hDx5R4iSMxs5sBxIJPwJHTR/Ul/38Vpz0CsQ5Jtn/34njFOOa8TPOQVeTwC9tqXV0D
 FpHnUhjyTVwyzX0AhbV1dhTNfXSBnSkYsMYKRHGAf6J1wTp/j/2YYs0juHoa/Rsd+G
 hS69W013Cv/1A==
Date: Mon, 10 Feb 2025 11:24:06 +0100
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
Message-ID: <Z6nTxks3u-ErSalQ@cassiopeiae>
References: <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
 <Z6bdCrgGEq8Txd-s@home.goodmis.org>
 <1e8452ab-613a-4c85-adc0-0c4a293dbf50@marcan.st>
 <07c447b77bdac1f8ade1f93456f853f89d4842ee.camel@icenowy.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c447b77bdac1f8ade1f93456f853f89d4842ee.camel@icenowy.me>
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

On Mon, Feb 10, 2025 at 05:41:30PM +0800, Icenowy Zheng wrote:
> Furtherly, the monorepo nature of Linux kernel means to refactor an
> interface, it's usually the person changing the callee that need to
> change all callers to satify the interface change; having Rust code in
> tree calling the interface effectively means adding the responsibility
> of fixing the Rust code when the interface changes, which could be not
> acceptable by the C-only maintainers. In regards of adding a
> maintainer, having more maintainers means more communication.

This is exactly the same as for every new driver / component, regardless of
whether it is written in C or in Rust.

It is absolutely common that driver maintainers help with integrating core API
changes, if necessary.

I don't see why the same process should not work for Rust abstractions.

(Additionally, in this particular case even one of the reviewers of
DMA MAPPING HELPERS offered to be a reviewer of the Rust abstractions too, in
order to keep eye on the DMA API angle.)
