Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDBEA5A43B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 21:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8795410E05A;
	Mon, 10 Mar 2025 20:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="eJbETDYH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2677B10E05A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 20:00:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741636789; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mTWhI5ljOxaH+MZDEieAyDNSUiszcmKsQaV0GCeb1LuLbcokr8+lKYjtkfVgPmYvC9ngOt4G1EmnqXbVbrg2Na5nF651Ang7Rmgxxd3BMuF3oHd4j2s/IocV22Te1XjfvaSCDcTZm2ozP3fCZarMe9KAg+OgwU0M8xCPdhyUa7A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741636789;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XnPLtUq7gfXI+7/0APvhFGaW+4ilm1CeUoTlvhHmsDI=; 
 b=CowNFAKRa1rulQAjGp406e5k3Ji8XogVwTmLpPw4E0cGkKvj7/9GlVP1Sm/AE/zmHVMMPjl0nQmW/icflW7iQZD8UtgR8qDwfByHjjZ8wFCxsBbYALIUTWTvs9ZAhW4CypE1baiIS8m95pXqHr5z+4qfrA5KpKTaB0A5RTTjahU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741636789; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=XnPLtUq7gfXI+7/0APvhFGaW+4ilm1CeUoTlvhHmsDI=;
 b=eJbETDYHzZaq0ZHObtlo93olKYwZ24KkPAakpeCc9NHqep4SkdkWi6ouJRfo9sHC
 WgN/SnIxyLCx0XXgHW2+ZiWwZRAIaVe8wEhu6YqMMDddyfxB/TBgqtaP9bpCE93vrsu
 OHRLcz40aLLG0DMuq4NTPBcOtBNIVCb50wwFGXvE=
Received: by mx.zohomail.com with SMTPS id 1741636786814304.76226844373525;
 Mon, 10 Mar 2025 12:59:46 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v1 0/6] drm/panfrost: Add support for AARCH64_4K page table
 format
Date: Mon, 10 Mar 2025 16:59:15 -0300
Message-ID: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
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

Following the previous RFC [0], this is the first iteration on Panfrost
support for AARCH64_4K page table format.

Currently, Panfrost only supports MMU configuration in LEGACY mode, as
named by Bifrost. This is a (modified) version of LPAE "Large Physical
Address Extension", which in Linux we've called ARM_MALI_LPAE.

This commit adds support for conditionally enabling AARCH64_4K page
table format in Panfrost, based on the newly added GPU_CONFIG_AARCH64_4K
flag. This way, we can progressively move away from the legacy format
once enough testing has been done on each target.

The patchset only enables the new format on Mediatek MT8188, which has
been tested on a Mediatek Genio 700 EVK (MT8390) board, with an
integrated Mali-G57 MC3 GPU. No regressions were reported in Mesa CI [1]
for the rest of the currently supported platforms.

[0] https://lore.kernel.org/all/20250226183043.140773-1-ariel.dalessandro@collabora.com/
[1] https://gitlab.freedesktop.org/mesa/mesa/

Thanks!

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
  drm/panfrost: Unify panfrost_mmu_enable/disable common code
  drm/panfrost: Add support for AARCH64_4K page table format
  drm/panfrost: Enable AARCH64_4K page table format on mediatek_mt8188
  drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag on Bifrost
    models

 drivers/gpu/drm/panfrost/panfrost_device.h   |  16 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c      |   1 +
 drivers/gpu/drm/panfrost/panfrost_features.h |   3 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c      | 159 ++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_regs.h     |  36 +++++
 5 files changed, 189 insertions(+), 26 deletions(-)

-- 
2.47.2

