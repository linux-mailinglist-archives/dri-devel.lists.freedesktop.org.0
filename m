Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC7ACDBE4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD86010E02E;
	Wed,  4 Jun 2025 10:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LZs6XMtk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2B810E02E;
 Wed,  4 Jun 2025 10:23:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E078D44EEC;
 Wed,  4 Jun 2025 10:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180C4C4CEF0;
 Wed,  4 Jun 2025 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749032592;
 bh=IsZt5w6RNpSLAPXJ4G5EuYXatQFaY7xih6awDDId0ns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LZs6XMtkTpWknLrbNMU2qVWSTB1LLd2aXLOfCV25H+8gfPhhVMl9OxupmmvlwR4ZW
 saXtJxodZpnDExgUfzyHpo70AnH9xZ0V4XLkcR5ahWWBP+3hEc6ew5Pdok1Tyfu8L2
 nrKV8/NhBwDCnZ+FoLUQSlZK/uhkzCufVFO4SjlBe0pcdbfX0A2UQX9oHpkNHypb9V
 UetIRQqyXSd0rtz79LUkxXFM5gCcobA+45lxNOAjRl57+XRZ7BYyZcppcbIDv8dWui
 D3jkB/cNP8Cqc8Yc4SjB4n9Vzc2Jz3Iwwt+6qHWJ3Ml3znlDwS5Uo55ldzP7NGp9Lr
 qGoEQCEilSS6Q==
Date: Wed, 4 Jun 2025 12:23:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 17/20] gpu: nova-core: compute layout of the FRTS region
Message-ID: <aEAeibsMAdlmIfch@cassiopeiae>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-17-05dfd4f39479@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-17-05dfd4f39479@nvidia.com>
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

On Wed, May 21, 2025 at 03:45:12PM +0900, Alexandre Courbot wrote:
> +impl Chipset {
> +    /// Returns the HAL corresponding to this chipset.
> +    pub(super) fn get_fb_fal(self) -> &'static dyn FbHal {

Please don't use the 'get' prefix here.

Also, I feel like it's a bit random to have this on Chipset. I think the
standalone function to create a HAL was fine. (Same for falcon/hal.rs, where I
missed this.)
