Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EA6937643
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 11:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7C810EB92;
	Fri, 19 Jul 2024 09:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XqPDRjLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4E310EB92
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 09:59:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10CF061C39;
 Fri, 19 Jul 2024 09:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4542C32782;
 Fri, 19 Jul 2024 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721383188;
 bh=TUdgSg3QBebjxaujxPZAKNFcg3Ix1nF0LzW3aXVc0M4=;
 h=From:To:Cc:Subject:Date:From;
 b=XqPDRjLywdWgl9pdXaTwVN0aaDpTXqSg8yra0WAAtz4x5o5zzmiZKVCIp+0y+gIDZ
 3ZUAKXF3H1CLBlsKplYrQ7DTCB2KuAicmafwds67KsHaguYKiNYHDq35Nf6WuY5t+r
 ZGfIIiHw3u73EAPiP8bqUiJO0WlSrohhRbgkQwpWTYUfzRVNTSxNvAYfPV660owk7h
 D/eIm6DruVumgQHPkIVHeuL+5GrU1dbErJgiv+0HCB3TEBEchhbD7p3IqPuSOxHG8e
 hKLjwEm10acQtz1nCN9AVq4Ko8v5cKch8f7VcujpIFslMruCi5/GtapqL9nEBBsTqL
 oy8bXfNpEmpcw==
From: Arnd Bergmann <arnd@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/omap: add CONFIG_MMU dependency
Date: Fri, 19 Jul 2024 11:59:31 +0200
Message-Id: <20240719095942.3841009-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Compile-testing with CONFIG_MMU disabled causes a link error in omapdrm:

arm-linux-gnueabi-ld: drivers/gpu/drm/omapdrm/omap_gem.o: in function `omap_gem_fault_2d':
omap_gem.c:(.text+0x36e): undefined reference to `vmf_insert_mixed'
arm-linux-gnueabi-ld: drivers/gpu/drm/omapdrm/omap_gem.o: in function `omap_gem_fault':
omap_gem.c:(.text+0x74a): undefined reference to `vmf_insert_mixed'

Avoid this by adding a Kconfig dependency.

Fixes: dc6fcaaba5a5 ("drm/omap: Allow build with COMPILE_TEST=y")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/omapdrm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 3f7139e211d2..64e440a2649b 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_OMAP
 	tristate "OMAP DRM"
+	depends on MMU
 	depends on DRM && OF
 	depends on ARCH_OMAP2PLUS || (COMPILE_TEST && PAGE_SIZE_LESS_THAN_64KB)
 	select DRM_KMS_HELPER
-- 
2.39.2

