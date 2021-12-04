Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F6E469395
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742FD7A384;
	Mon,  6 Dec 2021 10:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4586FBB7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 17:56:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A347D60EAB;
 Sat,  4 Dec 2021 17:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E73BC341C0;
 Sat,  4 Dec 2021 17:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638640002;
 bh=EAnoLgALrAeOXq5KyVrK2XeFYH3kKIKVMQ7QLvQb2bQ=;
 h=From:To:Cc:Subject:Date:From;
 b=jGyDnhG/s5weEO4MrQD5JIye7fTlFrKmopXpxQgV/4Uuk2TEWjzGg4gx3Oo3uwTgC
 nxS7y+ZbiKqpxSzFTZKyjlPkFBpx220TaD/avr2H7hCZXYF2fvZcWrJi/Tl3iTnOs6
 IsRFvM+zHoa+7zf4Hanzn3ltOiafpDYgQqIvutabAp3u7StBVC/YmIw32JJ46mgE5y
 mZ2f5F+d6vVFLi//83uz5W5v7ar5EQg5DyFqOgfdCTS7lLqhrXgltAD2fv2pV5GbQi
 rA9yNi7X5P3S/O+s0HPOGfsjKTWWo8EEeW30qaqQ0L0ojJ7G3IeHDvUBAtdJ7/vHpL
 +KP1FWG/SrMzA==
From: Arnd Bergmann <arnd@kernel.org>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm: fsl-dcu: select CONFIG_DRM_GEM_CMA_HELPER
Date: Sat,  4 Dec 2021 18:46:22 +0100
Message-Id: <20211204174637.1160725-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The fsl-dcu driver uses the gem_cma_helper code, but does
noto enforce enabling this through Kconfig:

arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:(.rodata+0x32c): undefined reference to `drm_gem_cma_prime_import_sg_table'
arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o:(.rodata+0x334): undefined reference to `drm_gem_cma_dumb_create'
arm-linux-gnueabi-ld: drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.o: in function `fsl_dcu_drm_plane_atomic_update':
fsl_dcu_drm_plane.c:(.text+0x144): undefined reference to `drm_fb_cma_get_gem_obj'

Add the same 'select' that is used in other such drivers.

Fixes: 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/fsl-dcu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/fsl-dcu/Kconfig b/drivers/gpu/drm/fsl-dcu/Kconfig
index 2a13ea5c8539..e95e96c565ba 100644
--- a/drivers/gpu/drm/fsl-dcu/Kconfig
+++ b/drivers/gpu/drm/fsl-dcu/Kconfig
@@ -3,6 +3,7 @@ config DRM_FSL_DCU
 	tristate "DRM Support for Freescale DCU"
 	depends on DRM && OF && ARM && COMMON_CLK
 	select BACKLIGHT_CLASS_DEVICE
+	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select REGMAP_MMIO
-- 
2.29.2

