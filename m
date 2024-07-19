Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE1937497
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 09:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94210E937;
	Fri, 19 Jul 2024 07:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cuAaoJgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C5E10E937
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 07:55:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id ACE2ECE1AF2;
 Fri, 19 Jul 2024 07:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A34C32782;
 Fri, 19 Jul 2024 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721375701;
 bh=W8wSaMuFu+gkCLCSzJa/gXpVw17QnJMqwKbE6WN4SoY=;
 h=From:To:Cc:Subject:Date:From;
 b=cuAaoJgcFF7G7yMkmbxqhagURXqIBNBcHzGWT66VKHJQWmeQ3vMSX8E1vKcT0DhTf
 DiIQb7Kxf75yxPi7oU3rbtqiBD5OIORapwQYl8X+VxT7NyglWrUhTMGpNG/ljvKBKg
 ztlt80iaOjIoo1pAgnT0PhMKF1riF34/gmkZ6gAEcnX97K4gHpvOYPk/GMFgY5vhMP
 mAXUWpi6k9AAqfPFVjG3CjGO69OMA7+Pad3m/P8KS1MbllsDijmyxWItjC/BI8aj3V
 TtHWcwxVQWyTnGw3nb2CTjo4/IlosQSv2nTYmpfAL1DVrOpLIEHZ2FmsU8N3e1d3Bj
 NxOys413qGOeQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/stm: add COMMON_CLK dependency
Date: Fri, 19 Jul 2024 09:54:41 +0200
Message-Id: <20240719075454.3595358-1-arnd@kernel.org>
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

The added lvds driver and a change in the dsi driver resulted in failed
builds when COMMON_CLK is disabled:

x86_64-linux-ld: drivers/gpu/drm/stm/dw_mipi_dsi-stm.o: in function `dw_mipi_dsi_stm_remove':
dw_mipi_dsi-stm.c:(.text+0x51e): undefined reference to `clk_hw_unregister'

x86_64-linux-ld: drivers/gpu/drm/stm/lvds.o: in function `lvds_remove':
lvds.c:(.text+0xe3): undefined reference to `of_clk_del_provider'
x86_64-linux-ld: lvds.c:(.text+0xec): undefined reference to `clk_hw_unregister'
x86_64-linux-ld: drivers/gpu/drm/stm/lvds.o: in function `lvds_pll_config':
lvds.c:(.text+0xb5d): undefined reference to `clk_hw_get_rate'
x86_64-linux-ld: drivers/gpu/drm/stm/lvds.o: in function `lvds_probe':
lvds.c:(.text+0x1476): undefined reference to `clk_hw_register'
x86_64-linux-ld: lvds.c:(.text+0x148b): undefined reference to `of_clk_hw_simple_get'
x86_64-linux-ld: lvds.c:(.text+0x1493): undefined reference to `of_clk_add_hw_provider'
x86_64-linux-ld: lvds.c:(.text+0x1535): undefined reference to `clk_hw_unregister'

Add this as a dependency for the stm driver itself, since it will be
required in practice anyway.

Fixes: 185f99b61442 ("drm/stm: dsi: expose DSI PHY internal clock")
Fixes: aca1cbc1c986 ("drm/stm: lvds: add new STM32 LVDS Display Interface Transmitter driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/stm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/stm/Kconfig b/drivers/gpu/drm/stm/Kconfig
index 1cc6b6cbdfa9..d7f41a87808e 100644
--- a/drivers/gpu/drm/stm/Kconfig
+++ b/drivers/gpu/drm/stm/Kconfig
@@ -2,6 +2,7 @@
 config DRM_STM
 	tristate "DRM Support for STMicroelectronics SoC Series"
 	depends on DRM && (ARCH_STM32 || COMPILE_TEST)
+	depends on COMMON_CLK
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
 	select DRM_PANEL_BRIDGE
-- 
2.39.2

