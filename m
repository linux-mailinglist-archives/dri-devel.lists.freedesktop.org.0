Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91E4C20FD0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 16:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A5910E9FB;
	Thu, 30 Oct 2025 15:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="opFa9EB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277E410E9FB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 15:42:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35E3C611C5;
 Thu, 30 Oct 2025 15:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDADC4CEFF;
 Thu, 30 Oct 2025 15:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761838922;
 bh=eozvD8BiZTEUnA7DiffXKpGEYQxiDYuYcu96Z+MljZ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=opFa9EB3kf2HPWuKsWqldnW6T3nRIaodWxyQMElc5H5C/9w0CUkQx5fuiN+zz+GDJ
 6oU6ojYp29KVqKQ4o9JOq7bm/wN1u8BZxnVIDxPxl05iQHAGd4LPaGxeNG6szm3zgz
 knzQfaNarq69pObXhbLlN0bNLGU4RiYlci4gRndRcaVWrJJIp3Ub09ZftRKnRxqy2S
 D/arenc3myE6nF65cBHYFGlOyukq9Muh69qOeXS/UhyE9C3/0Jbr87BAQSJQV1LcgU
 2upr3k26lQtCXLCncsqm68XhP56t4O/0eNmEeAcnf27HNCUHEYbVCs9ub6ax7se+IC
 KZ9Baf7ZU9OUg==
Message-ID: <cc28d048-5e0f-4f0e-b0f2-1b9e240f639b@kernel.org>
Date: Thu, 30 Oct 2025 16:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/4] rust: types: Add Ownable/Owned types
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org
References: <20251001-unique-ref-v12-0-fa5c31f0c0c4@pm.me>
 <20251001-unique-ref-v12-1-fa5c31f0c0c4@pm.me>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251001-unique-ref-v12-1-fa5c31f0c0c4@pm.me>
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

On 10/1/25 11:03 AM, Oliver Mangold wrote:
> From: Asahi Lina <lina+kernel@asahilina.net>
> 
> By analogy to `AlwaysRefCounted` and `ARef`, an `Ownable` type is a
> (typically C FFI) type that *may* be owned by Rust, but need not be. Unlike
> `AlwaysRefCounted`, this mechanism expects the reference to be unique
> within Rust, and does not allow cloning.
> 
> Conceptually, this is similar to a `KBox<T>`, except that it delegates
> resource management to the `T` instead of using a generic allocator.
> 
> [ om:
>   - Split code into separate file and `pub use` it from types.rs.
>   - Make from_raw() and into_raw() public.
>   - Remove OwnableMut, and make DerefMut dependent on Unpin instead.
>   - Usage example/doctest for Ownable/Owned.
>   - Fixes to documentation and commit message.
> ]
> 
> Link: https://lore.kernel.org/all/20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net/
> Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
> Co-developed-by: Oliver Mangold <oliver.mangold@pm.me>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
I think this patch was originally sent by Abdiel and Boqun [1]; we should
probably take this into account. :)

[1]
https://lore.kernel.org/rust-for-linux/20241022224832.1505432-2-abdiel.janulgue@gmail.com/
