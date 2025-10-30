Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB77C22652
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 22:17:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC0310EA34;
	Thu, 30 Oct 2025 21:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i6CKBQtA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C59A10EA26;
 Thu, 30 Oct 2025 21:17:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3A97440486;
 Thu, 30 Oct 2025 21:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9C3C4CEF1;
 Thu, 30 Oct 2025 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761859033;
 bh=XermN9jQ3wZ4fqlqqOotYOXuBNHynIWoOTfpAp4RGHs=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=i6CKBQtAZlBdtQH0O7unusyS7sO0aEpyqbQLRfXvYDlYSBC1ShdDPzNSNS9wijlik
 mEx4tLoxpKcnpALBY9+5WuJEjuiEUNVi76+KrThmXpWcNE683gNJH3hSB2Ug3qjWXN
 QLXnpalf9B7HkXoZe5Fp6KxEMuKgiKYWeM+6nEYseue1SNT8p9X8hsDAcdCQnt9Wnb
 Q6lmf+LdtEtSk6OQTUPvLGIpTEG9aiquw3B08cvPdvHIXUy/+UcUvTmTtG2t+301am
 kj98w6ag8lOE4msRzrcYL8gXR5PMVsbQrRVr1s6ACdZRPLnkq96n3e82FY6zxW3sgW
 yLGBc9cR/tMiA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 22:17:06 +0100
Message-Id: <DDVYWF5UL3T0.QDZNMBTX582T@kernel.org>
Subject: Re: [PATCH RFC 4/4] samples: rust: Add sample demonstrating DRM
 buddy allocator
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "David Airlie" <airlied@gmail.com>,
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <nouveau@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
 <20251030190613.1224287-5-joelagnelf@nvidia.com>
In-Reply-To: <20251030190613.1224287-5-joelagnelf@nvidia.com>
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

On Thu Oct 30, 2025 at 8:06 PM CET, Joel Fernandes wrote:
> Demonstrates usage of the DRM buddy allocator bindings through
> a simple test module that initializes the allocator, performs
> allocations, and prints information about the allocated blocks.

I don't think this should be a sample module either, the code looks a bit l=
ike
it tries to reinvents kunit tests.
