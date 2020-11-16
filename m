Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4397A2B4E78
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49E66E04A;
	Mon, 16 Nov 2020 17:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CDD6E043
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:53:11 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F8C620B80;
 Mon, 16 Nov 2020 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605549191;
 bh=gXkAVVfhKlBRZeGN1vo60mFg/83uv/RSUw/Yb5OPKmY=;
 h=From:To:Cc:Subject:Date:From;
 b=zS+S3MTAc9DFNrksaWP1zBb5BRJE13H9luLS1j5ItIX2MKb+QZ5+gwqiNjgftgjPK
 7tr0KIBrS4UwRykX5AHx/Z5phP3NsFKwGNkpd4CBdWxKwNeq37Z8vAqOlxH1u0EzAG
 Uw9+pl86xWkAIKHhn4rasoIZqm7vt01SwD5Tu4RA=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/exynos: depend on COMMON_CLK to fix compile tests
Date: Mon, 16 Nov 2020 18:53:00 +0100
Message-Id: <20201116175301.402787-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Exynos DRM uses Common Clock Framework thus it cannot be built on
platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: drivers/gpu/drm/exynos/exynos_mixer.o: in function `mixer_bind':
    exynos_mixer.c:(.text+0x958): undefined reference to `clk_set_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/exynos/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 6417f374b923..951d5f708e92 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_EXYNOS
 	tristate "DRM Support for Samsung SoC Exynos Series"
-	depends on OF && DRM && (ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM || COMPILE_TEST)
+	depends on OF && DRM && COMMON_CLK
+	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || ARCH_MULTIPLATFORM || COMPILE_TEST
 	depends on MMU
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
