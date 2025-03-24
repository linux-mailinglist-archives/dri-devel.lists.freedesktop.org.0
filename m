Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA3A6E2DE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 19:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D6910E4B8;
	Mon, 24 Mar 2025 18:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="N/hCGrSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6188610E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 18:59:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742842768; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cD3WUrOIAcXNg8o2fxPX4FwP488rTUSmr9Aibn68YIXoATCrVgqjdvKgFp/UoPRmwFVOgyr6Bq9NH8J8PTubSW2hmygoMPPpgvlxvFNOq5Cq7qXDHERc5QTL1Q5bSRH2l9FCJx1iV+CTEYH3eRaj3C0/dpSExAUB23jB9FWjVOk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742842768;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+0Qpm6G3dM4dW12QfuflWvN7JYPYS0esNhImh/Wdovw=; 
 b=ekbSviQbbytGTSDHn80ZVfPLX/vvOGosbGnzcVWAJGt5pGI2i+c8MlL5g4Bnvwj8pTTiVu6QTR6E2aV7q20R6blcz3ML9RSCTVOhkPc+MHrAiDYoOsLg8Mt1d3FLlAQfNa2juR360iRl1ZH8nktMy/t+BVJ6Dr2GV8B2Hz0lRg0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742842768; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=+0Qpm6G3dM4dW12QfuflWvN7JYPYS0esNhImh/Wdovw=;
 b=N/hCGrSmQ61/H8DLOm5U+0nwLvb3NgJlV2YylG+F8zg2HJysYxJxqSi5xFASS6BY
 Rl9G2tiq/HCVQz2f2a+IbnOy3B0fY+iBlfnc2cFmNnpRXPUXNolp4POEoSoZmDQIXuO
 NN9qExbkTdleRagvUI+MFZVzLBzHuaTNuKdcgET4=
Received: by mx.zohomail.com with SMTPS id 1742842766824425.22107114928986;
 Mon, 24 Mar 2025 11:59:26 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v5 0/6] drm/panfrost: Add support for AARCH64_4K page table
 format
Date: Mon, 24 Mar 2025 15:57:55 -0300
Message-ID: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes in v5:
* Fixed drm_WARN() in panfrost_mmu_cfg_init().

Changes in v4:
* Fixed panfrost_mmu_cfg_init() return value on warning.

Changes in v3:
* Fixed error handling in panfrost_mmu_ctx_create().

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
 drivers/gpu/drm/panfrost/panfrost_mmu.c      | 150 +++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_regs.h     |  36 +++++
 5 files changed, 196 insertions(+), 11 deletions(-)

-- 
2.49.0

