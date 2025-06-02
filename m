Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C787BACAB88
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 11:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C2A10E4DF;
	Mon,  2 Jun 2025 09:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ODV/5L/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD4710E4D8;
 Mon,  2 Jun 2025 09:39:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4E65AA4FF0D;
 Mon,  2 Jun 2025 09:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A7BC4CEEB;
 Mon,  2 Jun 2025 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748857182;
 bh=EpczvPljsIHCCSerQ8PlUVESAr97xCCeUPVmwWEVuko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ODV/5L/uN51j4TwraKZ3BycfSVRlESswLej+FDW09tuaWtYSdO6nPVR1qDSq0BnVj
 m/zXMgoP3AvYZabDO/9Yzp75n+qMBFO8JjLT8ZaMoLwTGZK2iZngAol/tbpaQZR2NK
 FlzG72XCHoT3DNr9I3f2g5rHrZUPxMBZQ0CFytRtiYBiNM1zhxKEgtYb64G7gL+XcB
 WPv+8YHjq3Qr2RyDfyBr3XZ4rvFCLIMju6+Red0wHTf/Cr5EPi7gx2FqlBASui+Mn3
 +k1lyYd9cBaod5t0GFMU19xY/qkf0zyla2RkR4EUpufwgn+mbEXCrJ7dtHTtuXNiXk
 I0GolDOu0P+7w==
Date: Mon, 2 Jun 2025 11:39:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
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
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
Message-ID: <aD1xVkggDrCvA7ve@pollux>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org>
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

On Thu, May 29, 2025 at 09:27:33AM +0200, Benno Lossin wrote:
> That's also fair, but we lose the constness of `next_multiple_of`, so
> you can't use `align_up` in a const function. That might confuse people
> and then they write their own const helper function... I'd prefer we use
> all functions that are available in the stdlib.

Considering that, what's the suggestion for this trait?

I don't think we should have a trait with align_down() and fls() only and
otherwise use next_multiple_of(), i.e. mix things up.

I think we should either align with the Rust nomenclature - whatever this means
for fls() - or implement the trait with all three methods.
