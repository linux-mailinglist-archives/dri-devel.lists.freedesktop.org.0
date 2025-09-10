Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AFDB51CA2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D347A10E95D;
	Wed, 10 Sep 2025 15:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HEwrG97l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE6810E95D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757519874;
 bh=3f3fTdEx0CvLdoBZ9wVCD1IKQF+p+fgc9v1DuV5Nq3c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HEwrG97ltNTGGhfByXRt96hJtoDGiAIEPl1ZBG/0gxNkoMWUEK57NiUUR8o/3XdEy
 Zizu6wW/RXVlSe/c1T8eEdNUXNfn1vwkVtjoItPq1SbCypubpO2fWCCo7hmMXRQ5eW
 Lp2p3/hQXUQejA4chTaczscAXuof5ALn7PfS2vJujtABuJY8OW5f5UaS/YnskCa9aJ
 IfZopk8vdjiYMRVxuS/CS8iVaAomIuTwnR43kj6dSAUSJvU8WginbaUe2rhkB95mDF
 I3RiqfNYNo2/XqgrtI2VkuKH/kmMNp5TeXv2o/ItlfHtnQSe89fFR/+JCnyCpcSc8+
 g/aKgfzRa/XCw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E225917E0A2B;
 Wed, 10 Sep 2025 17:57:52 +0200 (CEST)
Date: Wed, 10 Sep 2025 17:57:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>, Rob Herring
 <robh@kernel.org>, Beata Michalska <beata.michalska@arm.com>, Carsten
 Haitzler <carsten.haitzler@foss.arm.com>, Ashley Smith
 <ashley.smith@collabora.com>, Steven Price <steven.price@arm.com>, Jeffrey
 Vander Stoep <jeffv@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v3] rust: drm: Introduce the Tyr driver for Arm Mali GPUs
Message-ID: <20250910175740.2d15d0d5@fedora>
In-Reply-To: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
References: <20250910-tyr-v3-1-dba3bc2ae623@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 10 Sep 2025 10:51:18 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

> Add a Rust driver for ARM Mali CSF-based GPUs. It is a port of Panthor
> and therefore exposes Panthor's uAPI and name to userspace, and the
> product of a joint effort between Collabora, Arm and Google engineers.
> 
> The aim is to incrementally develop Tyr with the abstractions that are
> currently available until it is consider to be in parity with Panthor
> feature-wise.
> 
> The development of Tyr itself started in January, after a few failed
> attempts of converting Panthor piecewise through a mix of Rust and C
> code. There is a downstream branch that's much further ahead in terms of
> capabilities than this initial patch.
> 
> The downstream code is capable of booting the MCU, doing sync VM_BINDS
> through the work-in-progress GPUVM abstraction and also doing (trivial)
> submits through Asahi's drm_scheduler and dma_fence abstractions. So
> basically, most of what one would expect a modern GPU driver to do,
> except for power management and some other very important adjacent
> pieces. It is not at the point where submits can correctly deal with
> dependencies, or at the point where it can rotate access to the GPU
> hardware fairly through a software scheduler, but that is simply a
> matter of writing more code.
> 
> This first patch, however, only implements a subset of the current
> features available downstream, as the rest is not implementable without
> pulling in even more abstractions. In particular, a lot of things depend
> on properly mapping memory on a given VA range, which itself depends on
> the GPUVM abstraction that is currently work-in-progress. For this
> reason, we still cannot boot the MCU and thus, cannot do much for the
> moment.
> 
> This constitutes a change in the overall strategy that we have been
> using to develop Tyr so far. By submitting small parts of the driver
> upstream iteratively, we aim to:
> 
> a) evolve together with Nova and rvkms, hopefully reducing regressions
> due to upstream changes (that may break us because we were not there, in
> the first place)
> 
> b) prove any work-in-progress abstractions by having them run on a real
> driver and hardware and,
> 
> c) provide a reason to work on and review said abstractions by providing
> a user, which would be tyr itself.
> 
> Despite its limited feature-set, we offer IGT tests. It is only tested
> on the rk3588, so any other SoC is probably not going to work at all for
> now.
> 
> The skeleton is basically taken from Nova and also
> rust_platform_driver.rs.
> 
> Lastly, the name "Tyr" is inspired by Norse mythology, reflecting ARM's
> tradition of naming their GPUs after Nordic mythological figures and
> places.
> 
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Beata Michalska  <beata.michalska@arm.com>
> Signed-off-by: Beata Michalska  <beata.michalska@arm.com>
> Co-developed-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
> Signed-off-by: Carsten Haitzler <carsten.haitzler@foss.arm.com>
> Co-developed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Link: https://www.collabora.com/news-and-blog/news-and-events/introducing-tyr-a-new-rust-drm-driver.html
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Not that is really matters, but this is

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
