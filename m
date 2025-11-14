Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A2C5E40E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 17:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DC210E24B;
	Fri, 14 Nov 2025 16:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1753210E24B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 16:33:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F0401063;
 Fri, 14 Nov 2025 08:33:46 -0800 (PST)
Received: from [10.1.39.17] (e122027.cambridge.arm.com [10.1.39.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 756113F5A1;
 Fri, 14 Nov 2025 08:33:51 -0800 (PST)
Message-ID: <b28a4dfd-035e-429d-848c-dd67adfb8fa7@arm.com>
Date: Fri, 14 Nov 2025 16:33:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] drm/panthor: Add support for Mali-G1 GPUs
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251107142440.1134528-1-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251107142440.1134528-1-karunika.choo@arm.com>
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

Hi Karunika,

This series doesn't seem to cleanly apply on drm-misc-next (and I can't
figure out what base you used). Would you mind doing a rebase and resend?

Thanks,
Steve

On 07/11/2025 14:24, Karunika Choo wrote:
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
> v4:
>  * Fixed include and forward declaration issues.
>  * Addressed code format issues.
>  * Picked up R-bs from Steve.
>  * Link to v3: https://lore.kernel.org/all/20251027161334.854650-1-karunika.choo@arm.com/
> v3:
>  * Updated include logic to enable static inline functions in
>    panthor_hw.h for function pointers and feature checks.
>  * Fixed missed replacement of CSF_IFACE_VERSION check with
>    panthor_fw_has_glb_state() check.
>  * Link to v2: https://lore.kernel.org/all/20251024202117.3241292-1-karunika.choo@arm.com/
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
>  drivers/gpu/drm/panthor/panthor_device.h |   8 +
>  drivers/gpu/drm/panthor/panthor_fw.c     | 131 +++++-
>  drivers/gpu/drm/panthor/panthor_fw.h     |  32 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c    |  12 +-
>  drivers/gpu/drm/panthor/panthor_gpu.h    |   1 +
>  drivers/gpu/drm/panthor/panthor_hw.c     | 107 ++++-
>  drivers/gpu/drm/panthor/panthor_hw.h     |  47 +-
>  drivers/gpu/drm/panthor/panthor_pwr.c    | 549 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_pwr.h    |  23 +
>  drivers/gpu/drm/panthor/panthor_regs.h   |  79 ++++
>  drivers/gpu/drm/panthor/panthor_sched.c  |  21 +-
>  13 files changed, 989 insertions(+), 40 deletions(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h
> 
> --
> 2.49.0
> 

