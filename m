Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0525C66E427
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C1410E2E9;
	Tue, 17 Jan 2023 16:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A9210E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:55:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D8273B8190F;
 Tue, 17 Jan 2023 16:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C21C433EF;
 Tue, 17 Jan 2023 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673974527;
 bh=6AZjoVdg/RLS8USVfO6rTfrFMGXn8onUGZ+IA9c39cg=;
 h=From:To:Cc:Subject:Date:From;
 b=NePJga1609jzDZ+MX9wc3d/G0f1ZOfXmM5j9r2mDOhwYelJtAIveIM03M+JxzZrlA
 RD4ZI0xi6zNFxNrQkIUY5/VqzRVRMfgXlbXSe6R/R2Gtk01sGDCgaeDYTgpfGfneJN
 n8k5T4aDQ5OSqlE4gJWVVs4lHc0ZQBAWY/bmu/S+84dlBXge5VVXJ6mUImEv5KLS3g
 sHlludGAQNL4Ssxu3yy2evw17OAqyuznNlqpA8HgsERSkI+YT1ODBS9JOuCJcw6mwy
 8pWDo1QXZ5YTV8tyQOOVs99Pu/cI4pvmTu0cA7lxvkMJyPj9w0QscVClrzEScxM3V0
 YuyNBRVfxcykw==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm: panel: visionox: add backlight dependency
Date: Tue, 17 Jan 2023 17:54:50 +0100
Message-Id: <20230117165522.2104380-1-arnd@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ondrej Jirman <megi@xff.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver uses the backlight subsystem but is missing the
corresponding Kconfig dependency:

arm-linux-gnueabi-ld: drivers/gpu/drm/panel/panel-visionox-vtdr6130.o: in function `visionox_vtdr6130_probe':
panel-visionox-vtdr6130.c:(.text+0xdee): undefined reference to `devm_backlight_device_register'

Fixes: 65dc9360f741 ("drm: panel: Add Himax HX8394 panel controller driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index dd79928f5482..8f2046caaa6b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -742,6 +742,7 @@ config DRM_PANEL_VISIONOX_VTDR6130
 	tristate "Visionox VTDR6130"
 	depends on OF
 	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to enable support for Visionox
 	  VTDR6130 1080x2400 AMOLED DSI panel.
-- 
2.39.0

