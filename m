Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD7A2DA09
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 01:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860A510E0C3;
	Sun,  9 Feb 2025 00:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZOekPdPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C736A10E0C3
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 00:48:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDE2D5C53AB;
 Sun,  9 Feb 2025 00:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CAFC4CED6;
 Sun,  9 Feb 2025 00:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739062080;
 bh=qzrkW/FtYpC4vxsTUm2M/DPtl7GUjdWaJCHRPy+ZSVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZOekPdPG9rGXAHwHCR6hmFwTQMVrCn3b0BkMOkL5ga4lVl9Bs1dV7Qj8jWjhegNaN
 k6ROCugHcyaC2GsNvAJMCwS3vFBqmdutah+OvU5vCstt6uSky2vq1mC0Ntlm+frb2C
 X0xFTOQ9fU5W68iySd8+jcI7HJZVFGPYagaFMyZu0Yv8H8hpMUpy+8+kFA8Jfor1sH
 iANNuiZ66aMDXpHLfZVRtVHNNoiCXmArinGre7+QqR9FS9NA4DVvwT/K9Cz7cL1nI2
 1YH+2yIZfba9d5ndLHMbRXsv6b4BtAKXU5z1HZB6z9YXcYElecobD3sDIfa+ajQkV3
 NzCmF/NhFCXPg==
Date: Sun, 9 Feb 2025 01:47:52 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: "Dr. Greg" <greg@enjellic.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hector Martin <marcan@marcan.st>, Dave Airlie <airlied@gmail.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
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
Message-ID: <Z6f7OPgge4k-gYIE@pollux.localdomain>
References: <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st>
 <CAHk-=wi=ZmP2=TmHsFSUGq8vUZAOWWSK1vrJarMaOhReDRQRYQ@mail.gmail.com>
 <20250207121638.GA7356@wind.enjellic.com>
 <20250208204416.GL1130956@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208204416.GL1130956@mit.edu>
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

Ted,

On Sat, Feb 08, 2025 at 03:44:16PM -0500, Theodore Ts'o wrote:
> This was the trust of my "Beyond Upstream First" presentation which I
> gave to the Linux Foundation Member Summit last fall[1].
> 
> [1] https://docs.google.com/presentation/d/11rMc8PBeyMItV6hv31OHSZ626_6FCZxjX6ZxEAehCpQ/edit#slide=id.p
> 
> Now, I'll say that the Rust developers are making strides in the right
> direction here.

Please let me add that a lot of those Rust kernel developers also have been
kernel developers before there has been Rust in the kernel and do still
contribute and even maintain C components, drivers and / or subsystems.

I think missing trust should not be a relevent factor in this matter.

> Miguel has stood for election for the Technical
> Adviory Board, and has been contributing in various ways beyond just
> Rust for Linux.

Thanks for pointing this out.

- Danilo
