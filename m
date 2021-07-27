Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 701723D8422
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 01:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AC96E063;
	Tue, 27 Jul 2021 23:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8216E063
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 23:37:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE69C60F6B;
 Tue, 27 Jul 2021 23:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627429024;
 bh=7/A1ynyuGJxC2V55onFtTcT0S30N0yPSiFAcLSZd8cM=;
 h=From:To:Cc:Subject:Date:From;
 b=FibbjNdxtH5GDjWtsw/d7V7QPB0BQDBhsE1DjoVAsqbv+omdSiPX4vf5tbeuM7Bpl
 mHGMOYOM172j+aQbEYSQDwtZW2FnakYXO+YKWDKipaq5xN5QiPgPQ+fL0g5v/jDRKC
 xHmQpRY1ktas0Jz3/a4q28t9fzbYR+Z7hkVne7xtWwexehtohv8rqyn8+Pp0CJFZLa
 i8lB0TlbNUhpKVSDsODne7RWccG4jH64JUhEGuFr6c14jvQddsrW+bOmK5H7OPOTJQ
 i1B6hnarD9gYqcbLJoMTwS0MBEO8VQxcDtRDieC+k+0I8vuD06+Znp/+7PwwGdT5iT
 BPM9irdiQBVlw==
From: Nathan Chancellor <nathan@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH] drm/exynos: Always initialize mapping in
 exynos_drm_register_dma()
Date: Tue, 27 Jul 2021 16:36:56 -0700
Message-Id: <20210727233656.753002-1-nathan@kernel.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: linux-samsung-soc@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In certain randconfigs, clang warns:

drivers/gpu/drm/exynos/exynos_drm_dma.c:121:19: warning: variable
'mapping' is uninitialized when used here [-Wuninitialized]
                priv->mapping = mapping;
                                ^~~~~~~
drivers/gpu/drm/exynos/exynos_drm_dma.c:111:16: note: initialize the
variable 'mapping' to silence this warning
                void *mapping;
                             ^
                              = NULL
1 warning generated.

This occurs when CONFIG_EXYNOS_IOMMU is enabled and both
CONFIG_ARM_DMA_USE_IOMMU and CONFIG_IOMMU_DMA are disabled, which makes
the code look like

  void *mapping;

  if (0)
    mapping = arm_iommu_create_mapping()
  else if (0)
    mapping = iommu_get_domain_for_dev()

  ...
  priv->mapping = mapping;

Add an else branch that initializes mapping to the -ENODEV error pointer
so that there is no more warning and the driver does not change during
runtime.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 0644936afee2..bf33c3084cb4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -115,6 +115,8 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
 		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 			mapping = iommu_get_domain_for_dev(priv->dma_dev);
+		else
+			mapping = ERR_PTR(-ENODEV);
 
 		if (IS_ERR(mapping))
 			return PTR_ERR(mapping);

base-commit: 7d549995d4e0d99b68e8a7793a0d23da6fc40fe8
-- 
2.32.0.264.g75ae10bc75

