Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA362BAD139
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE4B10E5D3;
	Tue, 30 Sep 2025 13:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EVg3YPvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B8D10E5D3;
 Tue, 30 Sep 2025 13:33:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0940E6057B;
 Tue, 30 Sep 2025 13:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6581FC4CEF0;
 Tue, 30 Sep 2025 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759239199;
 bh=NY2y7Jz5GgASnYRyJboqRCOUSD4T65Ns4wrXLNI5n+o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EVg3YPvJCc2gS1ugHk6BS2W/KEICBXpEe1SI6JQtpLRH+ZuKL7FW8Yu/lPFS/aQc4
 5YKn6t4ac5QdR3F4pGwY6oCk2gs/3c6jE4FoxW+BQsqZbTiZ7zpJwheP4vgNx7od/Z
 ZAUTQJD11urfAHI7QyQ6MtCHtRv6sJ6YjJPO1I/7JhAeeTDhn3PNm+Q3zHeTSZW1Xm
 KHEIQ/c9uyuKEoAw2v/ucxn7hwE1NTiFbTwQxkcj7cqIS2gGU9Y4LnPDJqMtLJl6ZV
 Ese7mMZBAPa1tg6yqBC3tGJuwVahzGVHoOLQSG1EE0ZVUYT2bh62fmg+m8PrBX1yLc
 xmgOqFAyOu0TA==
Message-ID: <5bd04709-55ff-4d4d-9559-3ae55fb42c9a@kernel.org>
Date: Tue, 30 Sep 2025 15:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/13] gpu: nova-core: Add GSP command queue bindings
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
References: <20250930131648.411720-1-apopple@nvidia.com>
 <20250930131648.411720-6-apopple@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250930131648.411720-6-apopple@nvidia.com>
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

On 9/30/25 3:16 PM, Alistair Popple wrote:
> +impl GspRpcHeader {
> +    pub(crate) fn new(cmd_size: u32, function: u32) -> Self {
> +        Self(bindings::rpc_message_header_v {
> +            // TODO: magic number
> +            header_version: 0x03000000,
> +            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
> +            function,
> +            // We don't ever expect to send a command large enough to overflow.
> +            length: (size_of::<Self>() as u32).checked_add(cmd_size).unwrap(),

This is pretty much equivalent to "we never expect to make any mistakes, hence
just crash the kernel". Please handle errors gracefully.
