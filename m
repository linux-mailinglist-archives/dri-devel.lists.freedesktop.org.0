Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000C44FA1E2
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 05:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C3310E262;
	Sat,  9 Apr 2022 03:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C464410E18B
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 03:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zj+6qY9oD0Jri3Uj9KIZMW6MqyKShipi14GhcbjvaE8=; b=o2/XIYlk3asS/ckD2dNmjhUPND
 3xNzThDxnWPEFAkJRvgi636lpHD8HMjlokS4wWxZWx5vREQDgA9Bm2C64Zm1CCHjDkani/p6W5qDn
 22r2PmQnAPJ53emP5Ydnug/209GDoMO4d1wa41erdZ+vLKLX8OObtUYbcFPAbRLhxmNaeuyQujfqW
 I++0pTk1h5ZUbqtm/gpdqgyVInPrc7eVpxNGeWtUdeVWTC34iHGEnC3obMWe7ak9/4EcHA0GGSGdC
 DIvn3BI2fArB4ZJHvE2hfOqqkd6OrN9Qk5E4DPQ7Ur59DfeB2TjFbAp6wv9WAaZbCkULcDfXQ874T
 ZnZ4VxlA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd1PN-001nKr-Il; Sat, 09 Apr 2022 03:05:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/hisilicon/hibmc: add back depends on MMU
Date: Fri,  8 Apr 2022 20:05:04 -0700
Message-Id: <20220409030504.16089-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>, Randy Dunlap <rdunlap@infradead.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ARM64 always has CONFIG_MMU=y but adding a dependency on
COMPILE_TEST allows an arch with MMU optional (riscv in this case)
to build the hibmc driver, leading to a kconfig warning and
build errors, so restore the MMU dependency.

WARNING: unmet direct dependencies detected for DRM_TTM
  Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
  Selected by [y]:
  - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
  - DRM_HISI_HIBMC [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (ARM64 || COMPILE_TEST [=y])

riscv64-linux-ld: drivers/gpu/drm/ttm/ttm_bo_vm.o: in function `.L97':
ttm_bo_vm.c:(.text+0x814): undefined reference to `vmf_insert_pfn_prot'
riscv64-linux-ld: drivers/gpu/drm/ttm/ttm_bo_vm.o: in function `.L0 ':
ttm_bo_vm.c:(.text+0x9d0): undefined reference to `vmf_insert_pfn_prot'

Fixes: a0f25a6bb319 ("drm/hisilicon/hibmc: Allow to be built if COMPILE_TEST is enabled")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao  <tiantao6@hisilicon.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/hisilicon/hibmc/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
+++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_HISI_HIBMC
 	tristate "DRM Support for Hisilicon Hibmc"
-	depends on DRM && PCI && (ARM64 || COMPILE_TEST)
+	depends on DRM && PCI && MMU && (ARM64 || COMPILE_TEST)
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
 	select DRM_TTM
