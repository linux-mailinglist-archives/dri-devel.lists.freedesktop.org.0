Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834ACB28798
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 23:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFAB10E28C;
	Fri, 15 Aug 2025 21:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OCEEO9d4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887DD10E28C;
 Fri, 15 Aug 2025 21:19:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78C2E5C1388;
 Fri, 15 Aug 2025 21:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86EDBC4CEEB;
 Fri, 15 Aug 2025 21:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755292748;
 bh=bhEvK5wK2YtXTqi0pcFGbwLRtRhDbn8qEwcWJyPDIl0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OCEEO9d414p+6Udjxo+1FmsrM7oKnOJfVjQGPBeV6CGKLFNIaMSbQAR+hILUCH+Cg
 UnnE+YMqvTgcjPqSJOBLXF5ls7xoCn28hMAvea/nsHFahCND82tEL4asID8M/YsmIR
 F2BSoAY3rY3Ape6Mvh90d8hzr6ujzF43dswID1gJu5a0HlkxLmCArceaU275JJXaBQ
 Quh4o95q6sw8mrmt2pQQaxB+Xqc0TQ4vyOxsVZGeaJPi4cc/qPrS+uliMQ/0R3Bc68
 WUuWEIf+HKXxE1oY5YTgLC4MpsRloH73GHWFTTVmymW+M45xC1j0sY/ngj76qgbqAI
 SH0za9Qjh/Org==
Message-ID: <1117b9e5-b46a-4661-bfe9-56ff844c1218@kernel.org>
Date: Fri, 15 Aug 2025 23:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: nova-drm: fix 32-bit arm build
To: Miguel Ojeda <ojeda@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Gaynor <alex.gaynor@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20250724165441.2105632-1-ojeda@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250724165441.2105632-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 7/24/25 6:54 PM, Miguel Ojeda wrote:
> In 32-bit arm, the build fails with:
> 
>      error[E0308]: mismatched types
>        --> drivers/gpu/drm/nova/file.rs:42:28
>         |
>      42 |         getparam.set_value(value);
>         |                  --------- ^^^^^ expected `u64`, found `u32`
>         |                  |
>         |                  arguments to this method are incorrect
>         |
>      note: method defined here
>        --> drivers/gpu/drm/nova/uapi.rs:29:12
>         |
>      29 |     pub fn set_value(&self, v: u64) {
>         |            ^^^^^^^^^        ------
>      help: you can convert a `u32` to a `u64`
>         |
>      42 |         getparam.set_value(value.into());
>         |                                 +++++++
> 
> The reason is that `Getparam::set_value` takes a `u64` (from the UAPI),
> but `pci::Device::resource_len()` returns a `resource_size_t`, which is a
> `phys_addr_t`, which may be 32- or 64-bit.
> 
> Thus add an `into()` call to support the 32-bit case, while allowing the
> Clippy lint that complains in the 64-bit case where the type is the same.
> 
> Fixes: cdeaeb9dd762 ("drm: nova-drm: add initial driver skeleton")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to drm-misc-fixes, thanks!
