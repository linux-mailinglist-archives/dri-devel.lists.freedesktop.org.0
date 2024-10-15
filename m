Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048E99F1AF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 17:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E395C10E0C8;
	Tue, 15 Oct 2024 15:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lsRKFXeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E0610E0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 15:44:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4008D5C54D8;
 Tue, 15 Oct 2024 15:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10576C4CECF;
 Tue, 15 Oct 2024 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729007056;
 bh=VFhgk/njsHyjd8aB6tafElwHW+m/T48wZYuky3XTUMI=;
 h=From:To:Cc:Subject:Date:From;
 b=lsRKFXeOTuNDnd3VUbBC72V86Nc6o9WpbC5TyTl9YT6NcJPKnmIFYvbrNdm7fQi/7
 tLRXBxUjWLKk1MOtU1F5azvz8teZ1IIOb8/nQ+JeON6ToYeHdr3b70xoQmcVXTXydO
 tjB3lbRUCB9C4GzbtaGwt2jYLaD8bT3Xs4wUUE5QzzB40WdwGH/zgNF/s/kgFEOyKV
 8+4HFLwkIIvQpmvaMmyNbeHqKQgXadmE7imimYuRaUckbFAx4h4sGCM/iFZZ7HjCLm
 ue6NRdM6hevEagOj64SDJMRvRr8YRWNAly6eNIbc33iUDW3c4G6AWpggJl5lG8BHbu
 sZ11rxEaoAXdw==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
Date: Tue, 15 Oct 2024 15:34:38 +0000
Message-Id: <20241015153442.3757061-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

The new driver needs the dsc helper code to be available:

x86_64-linux-ld: vmlinux.o: in function `s6e3ha8_amb577px01_wqhd_prepare':
panel-samsung-s6e3ha8.c:(.text+0x16b1e65): undefined reference to `drm_dsc_pps_payload_pack'

Select it from Kconfig as we do for other similar drivers.

Fixes: 779679d3c164 ("drm/panel: Add support for S6E3HA8 panel driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: add dependency to the correct driver
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ddfaa99ea9dd..128c12e8b84f 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -703,6 +703,7 @@ config DRM_PANEL_SAMSUNG_S6E3HA8
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
 	select VIDEOMODE_HELPERS
 
 config DRM_PANEL_SAMSUNG_S6E63J0X03
-- 
2.39.5

