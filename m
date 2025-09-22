Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B9AB92234
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 18:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F213C10E1D2;
	Mon, 22 Sep 2025 16:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PT7yPVcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA4710E09C;
 Mon, 22 Sep 2025 16:08:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9A18D44F99;
 Mon, 22 Sep 2025 16:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D53FC4CEF0;
 Mon, 22 Sep 2025 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758557297;
 bh=z1dSIFPf3uKVgcTrmtn/W/j/YsVPru6sP0KVWsUJ/3I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PT7yPVcOsskmD/uItoqsNP3xpqYF08qg+D40grJL/t2gu1wbLevwIQF+xVWX1oLD9
 c7kN78wXHE4UbW+u9ybDnIu5Bh2uQagDzHo8ireHT/x1QRbq2YACmMoZCXELlajIgc
 Oqk14Yq7KcBPhinAXIP72U77Yb2KuHUxEFs12NxZzBeKCbidAzHTpni+F0Up8D2NdH
 wMNFalkPMbliXeAHHJXw8WCIhwH1XhNH4E7CaOfiR9lDT7KwwbAa3rnFhItdoja73Z
 h85Ib/Hj6F7VAKh/IrNkjM+rjL2XAMUICDEFLn86PnOJuf1mLYJ37/Np3KunIFaYfN
 MEEDw37B1ZlOA==
Message-ID: <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
Date: Mon, 22 Sep 2025 18:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250922113026.3083103-2-apopple@nvidia.com>
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

On 9/22/25 1:30 PM, Alistair Popple wrote:
> +        // SAFETY: No DMA allocations have been made yet

It's not really about DMA allocations that have been made previously, there is
no unsafe behavior in that.

It's about the method must not be called concurrently with any DMA allocation or
mapping primitives.

Can you please adjust the comment correspondingly?

> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };

As Boqun mentioned, we shouldn't have a magic number for this. I don't know if
it will change for future chips, but maybe we should move this to gpu::Spec to
be safe.

At least, create a constant for it (also in gpu::Spec?); in Nouveau I named this
NOUVEAU_VA_SPACE_BITS back then. Not a great name, if you have a better idea,
please go for it. :)
