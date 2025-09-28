Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E60BA73E9
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 17:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8634B10E1DA;
	Sun, 28 Sep 2025 15:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e0SM9na7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FC110E1DA
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 15:21:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C5436218F;
 Sun, 28 Sep 2025 15:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D785C4CEF0;
 Sun, 28 Sep 2025 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759072867;
 bh=Qy13vn/0xGJisCs8MfBrt3Mi0jPcM5ZsRRMAKMd4hds=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=e0SM9na7g5z+/YmdwtIrWAvqZlqdauEPixsNjBAEuutoSLqXcYLvyWLQZOAq6GSck
 2fLuaOmmlsxhdaMkKMWYf4qmEjLed3qy/qbkDnMfHxM4WXdvduT1+s1ZMRqqMmXg0S
 EgirIm3T1nkz0fW3RLyvEtoD2fs/vZwRtI71Sjp2UsrXsVwk26j8Xyry0Syg3dQiD6
 t+P5uQ5ITRG5VoxNEqsOj2MbGawm1apTKPRDq0eSPpuOCQJaODbTqjJy26K+AqA8fp
 4Rb07T4rKlSWoAAHjcHVbiTQHLzi0dOloAmX6EiRFwG2wMrTv9/UdUqccz9FSXwAXX
 iOV61NQUDgQyQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Sep 2025 17:20:59 +0200
Message-Id: <DD4JABIXIZLT.120ZAR2GODC1O@kernel.org>
Cc: "Philipp Stanner" <phasta@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt"
 <justinstitt@google.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@gmail.com>, "Wedson Almeida Filho" <wedsonaf@gmail.com>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Krishna Ketan Rai"
 <prafulrai522@gmail.com>, "Lyude Paul" <lyude@redhat.com>, "Mitchell Levy"
 <levymitchell0@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <llvm@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
References: <20250918123100.124738-2-phasta@kernel.org>
 <aNa7BDpKS2KA__4M@tardis.local>
In-Reply-To: <aNa7BDpKS2KA__4M@tardis.local>
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

On Fri Sep 26, 2025 at 6:10 PM CEST, Boqun Feng wrote:
> I missed this part, and I don't think kernel::sync is where dma_fence
> should be, as kernel::sync is mostly for the basic synchronization
> between threads/irqs. dma_fence is probably better to be grouped with
> dma-buf and other dma related primitives. Maybe in kernel::dma? Like:

I agree, kernel::sync may be a bit misleading.

> rust/kernel/dma.rs
> rust/kernel/dma/dma_buf.rs
> rust/kernel/dma/dma_fence.rs
>
> Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?

To me it depends on if we want to maintain the code under a global
DMA MAPPING & SCATTERLIST API entry or if it will just be added to the
DMA BUFFER SHARING FRAMEWORK entry.

In case of the latter I'd go for rust/kernel/dma-buf/, analogous to
drivers/dma-buf/. (Though, I'm not sure why this is under drivers/, there's
nothing like dma-buf drivers; I think kernel/dma/ would have been the bette=
r
fit.)

In any case, the target tree would probably be the drm-rust tree.
