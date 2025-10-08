Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1038BC45CA
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 12:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575D410E7C9;
	Wed,  8 Oct 2025 10:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AJkWGDP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FC210E7B7;
 Wed,  8 Oct 2025 10:38:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 318E161F53;
 Wed,  8 Oct 2025 10:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9953EC4CEF4;
 Wed,  8 Oct 2025 10:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759919915;
 bh=8PAxUp2DZdH2TSqIsiP6A2jShMUr6FjTKJktfSZKqP8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AJkWGDP9M9cVW5EYTToUzi+sV7Wq4oxJXEDmUb/x4ntaEKP7dS4Txm9Hf/xf2GJTw
 d0wSuu9CwO0KDgqpxG+gzp+3Nb5ur5GVNHznvbhsutYKimwLX5RbCksNxNS7jK5ZGF
 zaAuvbdN3+oq18Zm4j7oblEB88vTX3aOYFXYmOi42w6Xnc/peQYWZdaEFEQjDprbhK
 pzrnnJ+XOBEnEDdr/TXZfqm6IJ33DQrFGbXmimCEnbwV41nZeL/46fGaUJEHeKH8Ni
 UT11AmAMsSwhwmAqNU+GoSHjKVDqvyCKX6zxsRoTa9U642F7gYQvCbFU9ZbLkvehMf
 0UnjuhhbIYpVA==
Message-ID: <17dd5928-f06f-4747-b36c-195be4ac5082@kernel.org>
Date: Wed, 8 Oct 2025 12:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] gpu: nova-core: Boot GSP to RISC-V active
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
References: <20251008001253.437911-1-apopple@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
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

On 10/8/25 2:12 AM, Alistair Popple wrote:
> A full tree including the prerequisites for this patch series is available
> at https://github.com/apopple-nvidia/linux/tree/nova-core-for-upstream.

The prerequisites in this branch seem to be upstream. When submitting patch
series, please base your changes on the corresponding upstream branch (i.e.
drm-rust-next, on Linus' tree in this case) and make sure to include the base
revision (git format-patch --base). If it depends on other pending patch series,
b4 can help to track those dependencies.
