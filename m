Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD6A61836
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 18:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D3510E164;
	Fri, 14 Mar 2025 17:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="GwW191Fk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4271E10E164
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 17:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741973991; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=STn2tLoFAdxKHSniACbfPt88Ezw71Kcqv5Cn28jOMxbLErTGx0ec0YFqqSZbTMiGVkV8e9qgqOY8MOF+p0lL79vBZ0+jbLFs8Q9VSthG2CjXOQeo45LfR5TyvXjaHFPRIy9f8u8ayx0xe+dOX+DNAEZOrHUXHm7ZCRso8wx1qcU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741973991;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sQDIjMkW0zXePkXBZSAjC5u5Y+90v6jS96tmTnVEAJ8=; 
 b=IioC4ycvst7nqIW3iD3Q8ec/vur57V8l+baRxNtoDQFVs2FRZ1QLxmd6CJcipe9pT1BrotaFVVlDt8N1sGfmzCK3+Sxioz/hCbAayMDRPUnKKmwP3rIbejysNqCUmMOBICbSLf9gQnPkD1xTXXskQVOKSQa1JbqW9ExTKAsT4F4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741973991; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=sQDIjMkW0zXePkXBZSAjC5u5Y+90v6jS96tmTnVEAJ8=;
 b=GwW191FkLl0RTBQBdFngMyoWExCYnpTyigYl7VPQyBSKciqWmX08BEiU4ZQ7Ggmn
 utAxfcs6UtYu64NIUS1ds7pkTZxFigl/igbWmvZ+6s+xnw+txI6+2FBzvZYtY5+WXlG
 Zkt4VhObOfq9CV/kCMZJzODwhsAk2ByCrFTITgds=
Received: by mx.zohomail.com with SMTPS id 1741973988175634.4562131256724;
 Fri, 14 Mar 2025 10:39:48 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v2 0/6] drm/panfrost: Add support for AARCH64_4K page table
 format
Date: Fri, 14 Mar 2025 14:38:52 -0300
Message-ID: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Hi all,

This is a new iteration on Panfrost support for AARCH64_4K page table
format. The main reason behind this patchset is that MediaTek MT8188 SoC
(ARM Mali-G57 MC3 GPU) constantly faults due to the actual Panfrost cache
configuration.

Currently, Panfrost only supports MMU configuration in "LEGACY" (as Bifrost
calls it) mode, a (modified) version of LPAE "Large Physical Address
Extension", which in Linux we've called "mali_lpae".

This patchset adds support for conditionally enabling AARCH64_4K page table
format. To achieve that, a "GPU optional quirks" field was added to
`struct panfrost_features` with the related flag.

Note that, in order to enable AARCH64_4K mode, the GPU variant must have
the HW_FEATURE_AARCH64_MMU feature flag present.

The patchset only enables the new format on Mediatek MT8188 and MT8192,
which have been tested on a Mediatek Genio 700 EVK (MT8390) and Mediatek
Genio 1200 EVK (MT8395) boards respectively.

Thanks!

Changes in v2:
* Dropped panfrost_mmu_enable/disable unification.
* Rename gpu_configs as gpu_quirks.
* Added error handling on page table not properly aligned.
* Enabled AARCH64_4K format on MediaTek MT8192 as well.
* Minor fixes.

Changes in v1:
* Added "Set IOMMU_CACHE flag" patch.
* Replaced `panfrost_mmu->enable()` function pointer by `cfg` struct
prepared during init time.
* Made mali_lpae/aarch64_4k name more clear.
* Added GPU_CONFIG_AARCH64_4K flag to enable AARCH64_4K page table
  format.
* Enabled AARCH64_4K mode only on mediatek-mt8188.

Ariel D'Alessandro (6):
  drm/panfrost: Set IOMMU_CACHE flag
  drm/panfrost: Use GPU_MMU_FEATURES_VA_BITS/PA_BITS macros
  drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost
    models
  drm/panfrost: Add support for AARCH64_4K page table format
  drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8188
  drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8192

 drivers/gpu/drm/panfrost/panfrost_device.h   |  16 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c      |   2 +
 drivers/gpu/drm/panfrost/panfrost_features.h |   3 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c      | 146 +++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_regs.h     |  36 +++++
 5 files changed, 190 insertions(+), 13 deletions(-)

-- 
2.47.2

