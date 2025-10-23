Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92708C038C4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 23:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A37110E95B;
	Thu, 23 Oct 2025 21:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qvl8UzLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279E510E95B;
 Thu, 23 Oct 2025 21:29:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E4E9341B3C;
 Thu, 23 Oct 2025 21:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB488C4CEE7;
 Thu, 23 Oct 2025 21:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761254984;
 bh=emwRloXZzRmCi7nWJ6HO3oC22fkEU2I9umHmEoh5j/U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Qvl8UzLdv5Vt4s6f2q/7BcWvpQHWw34mv9XKAVHst0B4WWtdg01KOhKtJMkzbCSKt
 2G1LvrnxxEoRV9Fryp/L9stUFd+avmHXkJZE4yhLJdC1i4zZGbwmaTtHZB4VT5jI6E
 1xMHVd/YkOeA7w1AV93xcALBZMO0m7RBiIFx2GvWQLd23P4p5vDg30FWGjvVuC7oaP
 CJbfEaWg1d4ABsujIzKMTmwLds45yyVECmKGjxxryjN+S4+gEidXZIJQm4hiq4/axk
 W2PlkxqlRQvNvAIT3Fk5FaQEBdbwBCWey7WPbMUhxiiAMk83kDNmRXSsYjZgwQOrGR
 vw4y8ntPRtGYg==
Date: Thu, 23 Oct 2025 16:29:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Michael J . Ruhl" <mjruhl@habana.ai>,
 Andi Shyti <andi.shyti@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/11] PCI: Resizable BAR improvements
Message-ID: <20251023212943.GA1323026@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022133331.4357-1-ilpo.jarvinen@linux.intel.com>
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

On Wed, Oct 22, 2025 at 04:33:20PM +0300, Ilpo Järvinen wrote:
> pci.c has been used as catch everything that doesn't fits elsewhere
> within PCI core and thus resizable BAR code has been placed there as
> well. Move Resizable BAR related code to a newly introduced rebar.c to
> reduce size of pci.c. After move, there are no pci_rebar_*() calls from
> pci.c indicating this is indeed well-defined subset of PCI core.
> 
> Endpoint drivers perform Resizable BAR related operations which could
> well be performed by PCI core to simplify driver-side code. This
> series adds a few new API functions to that effect and converts the
> drivers to use the new APIs (in separate patches).
> 
> While at it, also convert BAR sizes bitmask to u64 as PCIe spec already
> specifies more sizes than what will fit u32 to make the API typing more
> future-proof. The extra sizes beyond 128TB are not added at this point.
> 
> Some parts of this are to be used by the resizable BAR changes into the
> resource fitting/assingment logic but these seem to stand on their own
> so sending these out now to reduce the size of the other patch series.
> 
> v3:
> - Rebased to solve minor conflicts
> 
> v2: https://lore.kernel.org/linux-pci/20250915091358.9203-1-ilpo.jarvinen@linux.intel.com/
> - Kerneldoc:
>   - Improve formatting of errno returns
>   - Open "ctrl" -> "control"
>   - Removed mislead "bit" words (when referring to BAR size)
>   - Rewrote pci_rebar_get_possible_sizes() kernel doc to not claim the
>     returned bitmask is defined in PCIe spec as the capability bits now
>     span across two registers in the spec and are not continuous (we
>     don't support the second block of bits yet, but this API is expected
>     to return the bits without the hole so it will not be matching with
>     the spec layout).
> - Dropped superfluous zero check from pci_rebar_size_supported()
> - Small improvement to changelog of patch 7
> 
> Ilpo Järvinen (11):
>   PCI: Move Resizable BAR code into rebar.c
>   PCI: Cleanup pci_rebar_bytes_to_size() and move into rebar.c
>   PCI: Move pci_rebar_size_to_bytes() and export it
>   PCI: Improve Resizable BAR functions kernel doc
>   PCI: Add pci_rebar_size_supported() helper
>   drm/i915/gt: Use pci_rebar_size_supported()
>   drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()
>   PCI: Add pci_rebar_get_max_size()
>   drm/xe/vram: Use pci_rebar_get_max_size()
>   drm/amdgpu: Use pci_rebar_get_max_size()
>   PCI: Convert BAR sizes bitmasks to u64
> 
>  Documentation/driver-api/pci/pci.rst        |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   8 +-
>  drivers/gpu/drm/i915/gt/intel_region_lmem.c |  10 +-
>  drivers/gpu/drm/xe/xe_vram.c                |  32 +-
>  drivers/pci/Makefile                        |   2 +-
>  drivers/pci/iov.c                           |   9 +-
>  drivers/pci/pci-sysfs.c                     |   2 +-
>  drivers/pci/pci.c                           | 145 ---------
>  drivers/pci/pci.h                           |   5 +-
>  drivers/pci/rebar.c                         | 314 ++++++++++++++++++++
>  drivers/pci/setup-res.c                     |  78 -----
>  include/linux/pci.h                         |  15 +-
>  12 files changed, 350 insertions(+), 273 deletions(-)
>  create mode 100644 drivers/pci/rebar.c

Applied to pci/rebar for v6.18, thanks, Ilpo!

If we have follow-on resource assignment changes that depend on these,
maybe I'll rename the branch to be more generic before applying them.

Also applied the drivers/gpu changes based on the acks.  I see the CI
merge failures since this series is based on v6.18-rc1; I assume the
CI applies to current linux-next or similar.  I'll check the conflicts
later and we can defer those changes if needed.
