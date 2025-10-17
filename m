Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 154D8BE7285
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 10:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6601710EB47;
	Fri, 17 Oct 2025 08:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r/FOHOK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8FD10E15B;
 Fri, 17 Oct 2025 08:26:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4B9CE64289;
 Fri, 17 Oct 2025 08:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8C7C4CEF9;
 Fri, 17 Oct 2025 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760689610;
 bh=kbYlbb2vWzoBZ20nmxTT1jLO3BgY9QweNZ2+SNF6NR8=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=r/FOHOK/KV30W9AU1CLlFZr7Uo1nt7j3bZpfAoNf7pLarQJDffIexQ+Caee9cxKAE
 yWLtItXISda1kqRcnbW7Fq525yc0tSmY6FmHR+2l/kehCTieOvZViXTwGMODOBh0kO
 yhT4xZ7huZ4JJloh1JFwmwKqgu9MPcGketcuNCnak+Zuq7y4tSU7leFiIcH0xjMCeN
 66ezK0K71KhY90ckpGXCToE8maTmVN4O3KA9iqr+4nssdX6YAc1vZNVBSqjqAma1CB
 87r5pmy5mTtOmoEEQgZBEjNpZW2lTJ6WsSTyqMxPIOr2KJ7CtfbJAHJJ+KUmUHkLaH
 jcc1Oo3Qej4nw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 10:26:43 +0200
Message-Id: <DDKGDHEH4QOJ.2QCE60PQ5OJRM@kernel.org>
Cc: <viresh.kumar@linaro.org>, <ira.weiny@intel.com>, <leon@kernel.org>,
 <daniel.almeida@collabora.com>, <bhelgaas@google.com>,
 <kwilczynski@kernel.org>, <abdiel.janulgue@gmail.com>,
 <robin.murphy@arm.com>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: driver: let probe() return impl PinInit<Self, Error>
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251016125544.15559-1-dakr@kernel.org>
 <DDK8EYINVIKJ.2ZK04J2C06GGR@nvidia.com>
In-Reply-To: <DDK8EYINVIKJ.2ZK04J2C06GGR@nvidia.com>
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

On Fri Oct 17, 2025 at 4:12 AM CEST, Alexandre Courbot wrote:
> On Thu Oct 16, 2025 at 9:55 PM JST, Danilo Krummrich wrote:
>> The driver model defines the lifetime of the private data stored in (and
>> owned by) a bus device to be valid from when the driver is bound to a

>> device (i.e. from successful probe()) until the driver is unbound from
>> the device.
>>
>> This is already taken care of by the Rust implementation of the driver
>> model. However, we still ask drivers to return a Result<Pin<KBox<Self>>>
>> from probe().
>>
>> Unlike in C, where we do not have the concept of initializers, but
>> rather deal with uninitialized memory, drivers can just return an
>> impl PinInit<Self, Error> instead.
>>
>> This contributed to more clarity to the fact that a driver returns it's
>
> nit: s/it's/its
>
>> device private data in probe() and the Rust driver model owns the data,
>> manages the lifetime and - considering the lifetime - provides (safe)
>> accessors for the driver.
>>
>> Hence, let probe() functions return an impl PinInit<Self, Error> instead
>> of Result<Pin<KBox<Self>>>.
>>
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> Short anecdote: I was curious about measuring the footprint impact of
> pin initializers, so I did a `size vmlinux` before and after this patch
> to compare the size of the `text` section. This patch removes exactly 60
> bytes of binary code, which I guess corresponds to the duplicated `KBox`
> allocations that are now gone. It's great to confirm once again how Rust
> abstractions are indeed zero-overhead! :)

Thanks for the test! If you find that at any point they aren't, let me
know, then we can fix that :)

---
Cheers,
Benno
