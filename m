Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C21C0ACC1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 16:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753B510E2EA;
	Sun, 26 Oct 2025 15:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U+VQTDqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0029910E03B;
 Sun, 26 Oct 2025 15:40:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B099A401AA;
 Sun, 26 Oct 2025 15:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CACC4CEE7;
 Sun, 26 Oct 2025 15:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761493228;
 bh=Uoe39sFfetOX6jVITj8hHI6x03aa5uDVa6LdEIv4+uU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U+VQTDqkZ3hzOceFaBFu0AwHhUCsIQnvsZn+DSmOXxUCUhy6qZ1P+7DjoD7Kg62ek
 oEQaEyUO3EhLSmcT96kuaP3PWUc94qhoOvs8LV1DwWJGMS8BBoVtokSNRXVoowT0uN
 tvtuuvjyr7N6uRXfsiuxjpHoBjsIsNOjXvOYQqUxztB4J+af1sT/9BO8k669ynyDas
 GTEUeefeqmzyu764mVNdUZIuWP6d3UWlWoEa6W1R0fGQlTbr2t7L5inp40vWOioeFM
 qIzZwydw7s+SmgyYxLS0l8lymycdQcnflZJvZpoJEF+co392rFRFBWRmN2qiEbAkFU
 7R2uVYEZD1dIA==
Message-ID: <cb1026f8-5bf3-418d-bbd5-50c0b63de0db@kernel.org>
Date: Sun, 26 Oct 2025 16:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
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
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
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
> +#[cfg(CONFIG_32BIT)]
> +/// Infallibly converts a `usize` to `u32` on 32-bit platforms.
> +///
> +/// This conversion is always lossless on 32-bit platforms, where a `usize` is the same size as a
> +/// `u32`.
> +///
> +/// Prefer this over the `as` keyword to ensure no lossy conversions are performed.
> +///
> +/// This is for use from a `const` context. For non `const` use, prefer the [`FromAs`] and
> +/// [`IntoAs`] traits.
> +pub(crate) const fn usize_as_u32(value: usize) -> u32 {
> +    kernel::static_assert!(size_of::<u32>() >= size_of::<usize>());
> +
> +    value as u32
> +}

Given that nova-core depends on CONFIG_64BIT, I assume you added this predicting
that we'll move this to the kernel crate.

For core code (and maybe other drivers) I think we also want the same thing for
signed types, but I think it's also fine to add them when moving things into the
kernel crate.


