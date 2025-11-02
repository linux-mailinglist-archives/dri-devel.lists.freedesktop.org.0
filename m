Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EB6C29186
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 17:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7780510E0EA;
	Sun,  2 Nov 2025 16:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dTK+r+PP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A4F10E0EA;
 Sun,  2 Nov 2025 16:08:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0F6B9601F0;
 Sun,  2 Nov 2025 16:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58792C4CEF7;
 Sun,  2 Nov 2025 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762099730;
 bh=R+eQUJqY93nsA0j/rgsWshRJvg4Yt8gRY5QAT1HTwxE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dTK+r+PPtpJ2OivgDQTeE0Om5Loa0FEbqXbx46BzzdjD8Gev69t5NMmO0aZWzN3AG
 yG6jRaxH+z9lkiOzd24I3tS02L10KpiHX2frBzb+EyznE4zsLfx35bjOlpi1yb/29l
 1MKBeA1rumfN7P29p2erk5baqKFo4yvxCmfZBkTRp8XyDIm4D9S0073UkFZCNTU8d7
 pLwFHiQEjQWqa540Z6NagKXqEfiwuLD8ViSGaSSO9c2XqMxQn1tmjhBWLkVrbOZNnl
 1tXqGcuKR9VUN4tlwNoBGDjte8dlPhpyoUOgs4JqfQLjBCGwcoEdQ3hMHvj6sm89/E
 Zx+2pN5SHNL3A==
Message-ID: <eb51b5d5-7f38-41f3-882c-eb87eb2b9f44@kernel.org>
Date: Sun, 2 Nov 2025 17:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] nova-core: Simplify `transmute` and
 `transmute_mut` in fwsec.rs
To: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251023205146.196042-1-delcastillodelarosadaniel@gmail.com>
 <DDXC17HXPXFZ.3TIX7FHUJHAI7@nvidia.com>
 <70210168-ee28-4996-89f0-83f8590cb716@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <70210168-ee28-4996-89f0-83f8590cb716@gmail.com>
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

On 11/2/25 4:09 PM, Daniel del Castillo wrote:
> About this, I was basing myself on nova-next [1]. I will rebase on top
> of drm-rust-next for the next version.
> 
> 
> Link: https://gitlab.freedesktop.org/drm/nova [1]
> Link: https://gitlab.freedesktop.org/drm/rust/kernel/-/tree/drm-rust-next [2]

Yes, the nova tree is the one I started the project with. Meanwhile we have
moved to use a common tree for DRM Rust infrastructure and drivers [3].

For the time being, the "original" nova tree is not in use anymore.

- Danilo

[3] https://lore.kernel.org/r/20250901202850.208116-1-dakr@kernel.org
