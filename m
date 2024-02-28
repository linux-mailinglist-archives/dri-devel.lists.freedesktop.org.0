Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DFB86AC37
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 11:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DA210E19D;
	Wed, 28 Feb 2024 10:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410DF10E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:31:44 +0000 (UTC)
Received: from i53875b6c.versanet.de ([83.135.91.108] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rfHDx-0000MV-78; Wed, 28 Feb 2024 11:31:41 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>,
 =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v5 00/14] drm: Add a driver for CSF-based Mali GPUs
Date: Wed, 28 Feb 2024 11:31:39 +0100
Message-ID: <28020837.gRfpFWEtPU@diego>
In-Reply-To: <20240218214131.3035480-1-boris.brezillon@collabora.com>
References: <20240218214131.3035480-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Sonntag, 18. Februar 2024, 22:41:14 CET schrieb Boris Brezillon:
> Hello,
> 
> This is the 5th version of the kernel driver for Mali CSF-based GPUs,
> and, unless someone has good reasons to block the merging of this
> driver, I expect it to be the last one (the gallium driver is now
> in a decent state, and is mostly waiting for the kernel driver to
> be accepted).
> 
> A branch based on drm-misc-next is available here[1], and here is
> another one [2] containing extra patches to have things working on
> rk3588. The CSF firmware binary is now merged in linux-firmware [3].
> 
> The mesa MR adding v10 support on top of panthor is available here [4].
> 
> Here is a non-exhaustive changelog, check each commit for a detailed
> changelog.
> 
> v5:
> - No fundamental changes in this v5
> - Various bug fixes (see the per-commit changelogs)
> - Various docs/typos fixes
> 
> v4:
> - Fix various bugs in the VM logic
> - Address comments from Steven, Liviu, Ketil and Chris
> - Move tiler OOM handling out of the scheduler interrupt handling path
>   so we can properly recover when the system runs out of memory, and
>   panthor is blocked trying to allocate heap chunks
> - Rework the heap locking to support concurrent chunk allocation. Not
>   sure if this is supposed to happen, but we need to be robust against
>   userspace passing the same heap context to two scheduling groups.
>   Wasn't needed before the tiler_oom rework, because heap allocation
>   base serialized by the scheduler lock.
> - Make kernel BO destruction robust to NULL/ERR pointers
> 
> v3;
> - Quite a few changes at the MMU/sched level to make the fix some
>   race conditions and deadlocks
> - Addition of the a sync-only VM_BIND operation (to support
>   vkQueueSparseBind with zero commands).
> - Addition of a VM_GET_STATE ioctl
> 
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v5
> [2]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v5+rk3588
> [3]https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/arm/mali/arch10.8
> [4]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26358
> 
> Boris Brezillon (13):
>   drm/panthor: Add uAPI
>   drm/panthor: Add GPU register definitions
>   drm/panthor: Add the device logical block
>   drm/panthor: Add the GPU logical block
>   drm/panthor: Add GEM logical block
>   drm/panthor: Add the devfreq logical block
>   drm/panthor: Add the MMU/VM logical block
>   drm/panthor: Add the FW logical block
>   drm/panthor: Add the heap logical block
>   drm/panthor: Add the scheduler logical block
>   drm/panthor: Add the driver frontend block
>   drm/panthor: Allow driver compilation
>   drm/panthor: Add an entry to MAINTAINERS

on a rk3588-jaguar with pending hdmi patches
Tested-by: Heiko Stuebner <heiko@sntech.de>

Also the series looks nice to my cursory glance, so
Acked-by: Heiko Stuebner <heiko@sntech.de>


