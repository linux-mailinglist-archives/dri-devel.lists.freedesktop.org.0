Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B35E4693C3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443B87ACC9;
	Mon,  6 Dec 2021 10:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 576 seconds by postgrey-1.36 at gabe;
 Sat, 04 Dec 2021 17:56:19 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A067C6FBB6
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 17:56:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97E4360ED7;
 Sat,  4 Dec 2021 17:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC333C341C2;
 Sat,  4 Dec 2021 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638640012;
 bh=m53DYrzONUqXySnuyI8Iv8xHXEMmcTWjOknPMtQWpbU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rC7Zy9oKyV5tet0TB29vkn49q0Ijv3HDdkSoK40B0JTRJvQO1WfXJgismeFAJGFRD
 wKn32hfbg+EMbHeOgQ7V3FgZA1aiGIkS2sGYzDlOE6NPJenvuASa5VD7Y8E85+Gp3x
 k4p2Eru1hUBJkF3YD1MOwhSYjJKFqNad0GDEjjlZQIQJ4+gwRPJ6MO3oc+zcWiqPGp
 6YzacJ9jFjVb2s/W0R+wdcaymfnflDIyEu9Kn41L5y7SEVX0+GsHZi8a0vE+Tl4f/0
 9UlQ+KHAOi0XeAWAWX8O209zBA6Si2l9X+RFsnf/mi81NbgeFYbOP+HDcVChZuvGir
 dAv1HFpi7txug==
From: Arnd Bergmann <arnd@kernel.org>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm: aspeed: select CONFIG_DRM_GEM_CMA_HELPER
Date: Sat,  4 Dec 2021 18:46:23 +0100
Message-Id: <20211204174637.1160725-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211204174637.1160725-1-arnd@kernel.org>
References: <20211204174637.1160725-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The aspeed driver uses the gem_cma_helper code, but does
noto enforce enabling this through Kconfig:

x86_64-linux-ld: drivers/gpu/drm/aspeed/aspeed_gfx_drv.o:(.rodata+0x2c8): undefined reference to `drm_gem_cma_prime_import_sg_table'
x86_64-linux-ld: drivers/gpu/drm/aspeed/aspeed_gfx_drv.o:(.rodata+0x2d8): undefined reference to `drm_gem_cma_dumb_create'
x86_64-linux-ld: drivers/gpu/drm/aspeed/aspeed_gfx_crtc.o: in function `aspeed_gfx_pipe_update':
aspeed_gfx_crtc.c:(.text+0xe5): undefined reference to `drm_fb_cma_get_gem_obj'

Add the same 'select' that is used in other such drivers.

Fixes: 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/aspeed/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/aspeed/Kconfig b/drivers/gpu/drm/aspeed/Kconfig
index 36c4a7e86981..024ccab14f88 100644
--- a/drivers/gpu/drm/aspeed/Kconfig
+++ b/drivers/gpu/drm/aspeed/Kconfig
@@ -5,6 +5,7 @@ config DRM_ASPEED_GFX
 	depends on (COMPILE_TEST || ARCH_ASPEED)
 	depends on MMU
 	select DRM_KMS_HELPER
+	select DRM_GEM_CMA_HELPER
 	select DMA_CMA if HAVE_DMA_CONTIGUOUS
 	select CMA if HAVE_DMA_CONTIGUOUS
 	select MFD_SYSCON
-- 
2.29.2

