Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9555BC0EC9A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C418910E4CB;
	Mon, 27 Oct 2025 15:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58D6010E4CB;
 Mon, 27 Oct 2025 15:05:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18DB4169E;
 Mon, 27 Oct 2025 08:05:09 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31C583F673;
 Mon, 27 Oct 2025 08:05:11 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:05:11 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
Message-ID: <aP-KJ0bGAWO7AVO_@arm.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
 <aPklNydcTdOeXtdU@arm.com>
 <ACAA327A-AE2B-4D21-B8C5-C66BB5E09B7C@nvidia.com>
 <aPozw8TGp85YdmNU@arm.com>
 <47d6ab72-1526-457d-990a-928088ba7022@nvidia.com>
 <aP82DHvLC7zAEojN@arm.com> <DDT0JTP91GO3.1EHF6L8MX4I3T@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDT0JTP91GO3.1EHF6L8MX4I3T@kernel.org>
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

On Mon, Oct 27, 2025 at 10:56:41AM +0100, Danilo Krummrich wrote:
> On Mon Oct 27, 2025 at 10:06 AM CET, Beata Michalska wrote:
> > It's more theoretical at this point, but there are drivers that do rely on
> > information from either DT or ACPI tables for the base address and size of the
> > MMIO region: anything that uses devm_platform_ioremap_resource() or
> > devm_platform_ioremap_resource_byname() I guess.
> 
> Don't get confused, those are two different things: The size of the MMIO region
> (or a PCI BAR) and the const SIZE generic in Io<SIZE> are two different things.
> 
> The former is the actual size of an MMIO region, whereas the latter is the
> minimum size requested by a driver for proper operation.
> 
> For instance, let's assume your driver requests ten contiguous 32-bit registers
> starting at offset zero of an MMIO region.
> 
> In this case you can call req.iomap_sized<0x28>(), because you know that your
> driver is not able to properly work without an MMIO region with at least a width
> of 0x28 bytes.
> 
> The actual size of the MMIO region returned by req.iomap_sized<0x28>() may
> indeed be smaller or larger than that, depending on what is defined in the DT,
> ACPI or PCI BAR.
> 
> If smaller than the const SIZE generic, the call to req.iomap_sized<0x28>() will
> fail, otherwise it will be successful. The actual size of the MMIO region is not
> influenced by the const SIZE generic.
I appreciate the explanation.
I think my confusion here comes from the fact that I was assuming there is an
intent to accommodate different MMIO regions sizes for various device revisions,
and not expecting all drivers to explicitly call the iomap_sized in all cases.
My bad then.
Again, thanks for clarifying that.


---
Best Regards
Beata


