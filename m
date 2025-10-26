Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1061C0AC9A
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 16:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EFA10E2E7;
	Sun, 26 Oct 2025 15:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hztc6NOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F7B10E2E7;
 Sun, 26 Oct 2025 15:35:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C0D6060055;
 Sun, 26 Oct 2025 15:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F55BC4CEE7;
 Sun, 26 Oct 2025 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761492958;
 bh=AlOh53yJfnPi5Z4IY9Rxr3C4zzHqodJBp4pikEkDgfg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hztc6NOPIvrXOMobE+TKWvpHF18TDMgl3L9rIvJYwzEQ0Ef1RMYg6YNJEuKQiqR9B
 0ryDixfkrxUCOfP53a20hx/ZmUboNuozZK96DI5NSv3fxgmGNGHegi7LnlZM/9YNw9
 NYCr08SvtXhUdDjuUE6JHbkT5u+rmTLzLZJjGJxV1+xhHjfa2sj16BiTcRk569OKQW
 d59v+d1ZtKCAIHFEABZ3sC5Pvatd/DBiUU8fZGMV0yOGQe3VZUglT/uXI/jlpthyOd
 fp5nZ42rHDjADsHfob6AYGvD64l34/eJj7n7KilN+47d1tfn+pbd7t+Ylp/ycRzn9+
 K054+H2ufX4xg==
Message-ID: <c64447d9-3e9f-40d4-944c-327f3f7e26ba@kernel.org>
Date: Sun, 26 Oct 2025 16:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] gpu: nova-core: remove use of `as` for integer
 conversions
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/26/25 3:39 PM, Alexandre Courbot wrote:
> This patchset tries to eradicate the use of `as` in nova-core, by using
> existing means and introducing new ones.

Thanks a lot for working on this cleanup!
> The first 4 patches use the already-available `From` and `TryFrom` trait
> where it is possible or advisable.
> 
> The fifth patch introduces a new module that proposes conversion
> functions for those that are infallible under the current build target.
> This is done through a set of const functions, and the `FromAs` and
> `IntoAs` extension traits which, as their names lightly suggest, offer
> conversion for those types on which the `as` operator can be used
> losslessly.
> 
> This new module is put to use in the sixth patch.
> 
> The idea was first suggested by Danilo, and I hope I captured it
> properly. :)

Yes, this is what I thought of.
> As Danilo suggested, this could eventually find its place in the kernel
> crate if the implementation is deemed to be fit, but for now let's
> review and let it mature in nova-core.

Yeah, I think this approach makes sense. Though, I think we want to move this to
the kernel crate sooner than later, it's definitely something we want for core
code and other drivers as well.

Depending on the initial feedback, it might even make sense to do it right away.

I won't have time for a thorough review, but at a first glance the patches all
look good!

Acked-by: Danilo Krummrich <dakr@kernel.org>
