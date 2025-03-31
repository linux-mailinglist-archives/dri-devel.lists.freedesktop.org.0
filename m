Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFFBA764D8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 13:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F31510E3D5;
	Mon, 31 Mar 2025 11:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B6AA10E3D5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 11:16:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCC741F02;
 Mon, 31 Mar 2025 04:16:06 -0700 (PDT)
Received: from [10.57.15.213] (unknown [10.57.15.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C152A3F694;
 Mon, 31 Mar 2025 04:16:00 -0700 (PDT)
Message-ID: <867cca4f-7180-42e6-bb2a-9f73ad09e5e4@arm.com>
Date: Mon, 31 Mar 2025 12:15:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
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

On 24/03/2025 18:57, Ariel D'Alessandro wrote:
> Hi all,
> 
> This is a new iteration on Panfrost support for AARCH64_4K page table
> format. The main reason behind this patchset is that MediaTek MT8188 SoC
> (ARM Mali-G57 MC3 GPU) constantly faults due to the actual Panfrost cache
> configuration.
> 
> Currently, Panfrost only supports MMU configuration in "LEGACY" (as Bifrost
> calls it) mode, a (modified) version of LPAE "Large Physical Address
> Extension", which in Linux we've called "mali_lpae".
> 
> This patchset adds support for conditionally enabling AARCH64_4K page table
> format. To achieve that, a "GPU optional quirks" field was added to
> `struct panfrost_features` with the related flag.
> 
> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
> the HW_FEATURE_AARCH64_MMU feature flag present.
> 
> The patchset only enables the new format on Mediatek MT8188 and MT8192,
> which have been tested on a Mediatek Genio 700 EVK (MT8390) and Mediatek
> Genio 1200 EVK (MT8395) boards respectively.
> 
> Thanks!
> 
> Changes in v5:
> * Fixed drm_WARN() in panfrost_mmu_cfg_init().
> 
> Changes in v4:
> * Fixed panfrost_mmu_cfg_init() return value on warning.
> 
> Changes in v3:
> * Fixed error handling in panfrost_mmu_ctx_create().
> 
> Changes in v2:
> * Dropped panfrost_mmu_enable/disable unification.
> * Rename gpu_configs as gpu_quirks.
> * Added error handling on page table not properly aligned.
> * Enabled AARCH64_4K format on MediaTek MT8192 as well.
> * Minor fixes.
> 
> Changes in v1:
> * Added "Set IOMMU_CACHE flag" patch.
> * Replaced `panfrost_mmu->enable()` function pointer by `cfg` struct
> prepared during init time.
> * Made mali_lpae/aarch64_4k name more clear.
> * Added GPU_CONFIG_AARCH64_4K flag to enable AARCH64_4K page table
>   format.
> * Enabled AARCH64_4K mode only on mediatek-mt8188.
> 
> Ariel D'Alessandro (6):
>   drm/panfrost: Set IOMMU_CACHE flag
>   drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
>   drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost
>     models
>   drm/panfrost: Add support for AARCH64_4K page table format
>   drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8188
>   drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192
> 
>  drivers/gpu/drm/panfrost/panfrost_device.h   |  16 ++
>  drivers/gpu/drm/panfrost/panfrost_drv.c      |   2 +
>  drivers/gpu/drm/panfrost/panfrost_features.h |   3 +
>  drivers/gpu/drm/panfrost/panfrost_mmu.c      | 150 +++++++++++++++++--
>  drivers/gpu/drm/panfrost/panfrost_regs.h     |  36 +++++
>  5 files changed, 196 insertions(+), 11 deletions(-)
> 

This looks in good shape now, so unless anyone shouts I'll merge this to
drm-misc-next later today.

Thanks,
Steve

