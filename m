Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0905F2DA464
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 00:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52EA89F2A;
	Mon, 14 Dec 2020 23:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D95B89EB4;
 Mon, 14 Dec 2020 23:50:30 +0000 (UTC)
Date: Mon, 14 Dec 2020 23:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607989830;
 bh=SJV+58ZVFlykR+8LRz85SA+mdMX5Zhf60lyRr0nr08Q=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=noYICguQ2NPaSUjL8UbaTSj/fY6r5/rKVdP3h/Al4d6IRimcNzEwCphdZ7W0hnMVJ
 JbYUASrm8lG1k2c0p4w3Euoye4WedxrhjF6Mo7oS36wKTu49cqe50Eju+YVToOJsPD
 8JPpfKkmvyYeWnrhvNegQ4GBFpPdivp24+r9MhUiY2ogVuA30uL47yVMYeDwvqqgTd
 szMVAuBqHFKc7f0ng+7AAVaSfC7qD4l1oA7Ewf/bdXDVapj9BzmlxjWZy1jctH0425
 Ro/lNuCmbpco19I2MJbL4M2QigLTTX6sngbKyaLBLHe/HtxPlLfvwLl5UVJBa6SYoi
 duhngK04mmI2Q==
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] drm/amd/display: Revert "add DCN support for aarch64"
Message-ID: <20201214235024.GB14575@willie-the-truck>
References: <20201214175225.38975-1-ardb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214175225.38975-1-ardb@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Leo Li <sunpeng.li@amd.com>, Catalin Marinas <catalin.marinas@arm.com>,
 amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Kolesa <daniel@octaforge.org>, Alex Deucher <alexander.deucher@amd.com>,
 Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 06:52:25PM +0100, Ard Biesheuvel wrote:
> This reverts commit c38d444e44badc557cf29fdfdfb823604890ccfa.
> =

> Simply disabling -mgeneral-regs-only left and right is risky, given that
> the standard AArch64 ABI permits the use of FP/SIMD registers anywhere,
> and GCC is known to use SIMD registers for spilling, and may invent
> other uses of the FP/SIMD register file that have nothing to do with the
> floating point code in question. Note that putting kernel_neon_begin()
> and kernel_neon_end() around the code that does use FP is not sufficient
> here, the problem is in all the other code that may be emitted with
> references to SIMD registers in it.
> =

> So the only way to do this properly is to put all floating point code in
> a separate compilation unit, and only compile that unit with
> -mgeneral-regs-only. But perhaps the use of floating point here is
> something that should be reconsidered entirely.
> =

> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Dave Martin <dave.martin@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Kolesa <daniel@octaforge.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/gpu/drm/amd/display/Kconfig                   |  2 +-
>  drivers/gpu/drm/amd/display/dc/calcs/Makefile         |  7 --
>  drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile       |  7 --
>  drivers/gpu/drm/amd/display/dc/dcn10/Makefile         |  7 --
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c | 81 ++++++++-----=
-------
>  drivers/gpu/drm/amd/display/dc/dcn20/Makefile         |  4 -
>  drivers/gpu/drm/amd/display/dc/dcn21/Makefile         |  4 -
>  drivers/gpu/drm/amd/display/dc/dml/Makefile           | 13 ----
>  drivers/gpu/drm/amd/display/dc/dsc/Makefile           |  5 --
>  drivers/gpu/drm/amd/display/dc/os_types.h             |  4 -
>  10 files changed, 32 insertions(+), 102 deletions(-)

I didn't notice we'd enabled this for arm64, but I agree with the reasoning
in the commit message, so:

Acked-by: Will Deacon <will@kernel.org>

The long and short of it is that it is not safe to compile kernel C code
without -mgeneral-regs-only on arm64.

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
