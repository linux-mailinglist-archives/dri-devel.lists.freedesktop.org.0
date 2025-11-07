Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8DCC3FA29
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF6A10EA90;
	Fri,  7 Nov 2025 11:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iYRsj9oY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AD010EA9B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762513515;
 bh=ODcL8SYb76gPGjPes1ZBf9PDcCYTi757gqJ3YtFG4OA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iYRsj9oYBywQlKcO0CzXLtxljnmCgh//zajN6afaUsbHIHpK0E0scsMrx/dl2jxD9
 /frEXcivxX6gTPtuxThXgqWzPbNgj2fUVEHgcdEQJGI2KxllHrK+rYgG2NyPsfq03F
 oWzoSFLb6PcZQur+7Z0W7kliEA+lUHYvJhnGU63SccIkDVYAmd5lTAEZJqu223YIkZ
 BteoygNI+lb2NNr9Jub6dDBSXOpKHk0/xgtaASndXdFw1Hz3vCcld/woFdTezrmZ5g
 FwpCNySIO2EEfnJBffLZLl36c1oUR9IcfB42nUjkYVivPDm6nr/Us3K+/HTXs16+Kd
 DGiYf+hxCb7iw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E8C617E04D6;
 Fri,  7 Nov 2025 12:05:15 +0100 (CET)
Date: Fri, 7 Nov 2025 12:05:10 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] drm/panthor: Add support for Mali-G1 GPUs
Message-ID: <20251107120510.1ad142f9@fedora>
In-Reply-To: <20251027161334.854650-1-karunika.choo@arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Mon, 27 Oct 2025 16:13:26 +0000
Karunika Choo <karunika.choo@arm.com> wrote:

> This patch series extends the Panthor driver with basic support for
> Mali-G1 GPUs.
> 
> The v14 architecture introduces several hardware and register-level
> changes compared to prior GPUs. This series adds the necessary
> architecture-specific support infrastructure, power control and reset
> handling for Mali-G1 GPUs.
> 
> Patch Breakdown:
> [Patch 1-2]:  Refactor panthor_hw to introduce architecture-specific
>               hooks and abstractions to support the v14 architecture.
>               These patches introduce architecture-specific HW binding
>               for function pointers.
> [Patch 3-5]:  Adds basic L2 power on/off and soft reset support for the
>               PWR_CONTROL block introduced in v14.
> [Patch 6]:    Update MCU halt and warm boot operations to reflect the
>               GLB_REQ.STATE changes in v14. This ensures that the MCU is
>               properly halted and the correct operations are performed
>               on warm boot depending on the FW version.
> [Patch 7]:    Align endpoint_req with changes introduced in v14, where
>               the register is widened to 64-bit and shifed down by
>               4-bytes. This patch adds the necessary infrastructure to
>               discern the correct endpoint_req register to use.
> [Patch 8]:    Enables Mali-G1 support on Panthor by adding HW bindings
>               for v14 architecture, product names and path to FW binary.
> 
> v3:
>  * Updated include logic to enable static inline functions in
>    panthor_hw.h for function pointers and feature checks.
>  * Fixed missed replacement of CSF_IFACE_VERSION check with
>    panthor_fw_has_glb_state() check.
>  * Link to v2: https://lore.kernel.org/all/20251024202117.3241292-1-karunika.choo@arm.com/

Didn't thoroughly review the patchset, but I'm happy with the feature
checking changes, and I see that Steve has reviewed the whole thing, so
feel free to stick my

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> v2:
>  * Merged GPU_ID refactoring patch with the arch-specific panthor_hw
>    binding patch (formerly PATCH 01/10 and PATCH 02/10).
>  * Dropped panthor_hw feature bitmap patch in favor of functions that
>    performs the relevant architecture version checks.
>  * Fixed kernel test bot warnings.
>  * Replaced function pointer accessor MACROs with static inline
>    functions.
>  * Refined power control logic, removed unnecessary checks and redundant
>    stubs.
>  * Replaced explicit CSG_IFACE_VERSION checks with functions describing
>    the feature being checked for.
>  * General readability improvements, more consistent error handling,
>    behaviour clarifications, and formatting fixes.
>  * Link to v1: https://lore.kernel.org/all/20251014094337.1009601-1-karunika.choo@arm.com/
> 
> Karunika Choo (8):
>   drm/panthor: Add arch-specific panthor_hw binding
>   drm/panthor: Add architecture-specific function operations
>   drm/panthor: Introduce panthor_pwr API and power control framework
>   drm/panthor: Implement L2 power on/off via PWR_CONTROL
>   drm/panthor: Implement soft reset via PWR_CONTROL
>   drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
>   drm/panthor: Support 64-bit endpoint_req register for Mali-G1
>   drm/panthor: Add support for Mali-G1 GPUs
> 
>  drivers/gpu/drm/panthor/Makefile         |   1 +
>  drivers/gpu/drm/panthor/panthor_device.c |  18 +-
>  drivers/gpu/drm/panthor/panthor_device.h |   7 +
>  drivers/gpu/drm/panthor/panthor_fw.c     | 131 +++++-
>  drivers/gpu/drm/panthor/panthor_fw.h     |  32 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  12 +-
>  drivers/gpu/drm/panthor/panthor_gpu.h    |   1 +
>  drivers/gpu/drm/panthor/panthor_hw.c     | 108 ++++-
>  drivers/gpu/drm/panthor/panthor_hw.h     |  47 +-
>  drivers/gpu/drm/panthor/panthor_pwr.c    | 548 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_pwr.h    |  23 +
>  drivers/gpu/drm/panthor/panthor_regs.h   |  79 ++++
>  drivers/gpu/drm/panthor/panthor_sched.c  |  21 +-
>  13 files changed, 987 insertions(+), 41 deletions(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h
> 
> --
> 2.49.0
> 

