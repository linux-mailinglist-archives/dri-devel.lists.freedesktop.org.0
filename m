Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207666E3EA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8AD10E1B0;
	Tue, 17 Jan 2023 16:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1532D10E1B0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:45:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5842B81912;
 Tue, 17 Jan 2023 16:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21058C433D2;
 Tue, 17 Jan 2023 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673973901;
 bh=bN84BwulQd7J/cSL9fjKHbk92ofxnmZM1yokAwmvOeM=;
 h=From:To:Cc:Subject:Date:From;
 b=CzPQyu6uGFutKkNd4z+04BqPekY23R63k2+EHdeuYETSHW9WA9T0mhKB58OybHBjT
 RtDg6uvzCa+DhzcNR9cVob42ngNZ5MFdhpU0XJENZpn/IlO5xrTjNIEs+cWHDEXOS2
 z1mdUQlWWKk5dyBwE3ZgFSzkuH/RPPw1udHofPC96UAFnwe8WCtSqHrF3Eq08gRvHt
 e5juZImuizAGvAKefAUMwa4aRWXW7gU50BcHe8B2smD8/t4i+dUXoZbyRYQAzgdk4I
 GlJclVHqIzTSIQGMQzE0SJzEzDioCOan2zBdo6xLpGsagad+r+xCc3amaPovTlepGA
 5ura4c08IpXEw==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: fix GENERIC_ATOMIC64 dependency
Date: Tue, 17 Jan 2023 17:44:43 +0100
Message-Id: <20230117164456.1591901-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

On ARMv5 and earlier, a randconfig build can still run into

WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
  Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
  Selected by [y]:
  - DRM_PANFROST [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y]) && MMU [=y]

Rework the dependencies to always require a working cmpxchg64.

Fixes: db594ba3fcf9 ("drm/panfrost: depend on !GENERIC_ATOMIC64 when using COMPILE_TEST")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panfrost/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/Kconfig
index 079600328be1..e6403a9d66ad 100644
--- a/drivers/gpu/drm/panfrost/Kconfig
+++ b/drivers/gpu/drm/panfrost/Kconfig
@@ -3,7 +3,8 @@
 config DRM_PANFROST
 	tristate "Panfrost (DRM support for ARM Mali Midgard/Bifrost GPUs)"
 	depends on DRM
-	depends on ARM || ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)
+	depends on ARM || ARM64 || COMPILE_TEST
+	depends on !GENERIC_ATOMIC64    # for IOMMU_IO_PGTABLE_LPAE
 	depends on MMU
 	select DRM_SCHED
 	select IOMMU_SUPPORT
-- 
2.39.0

