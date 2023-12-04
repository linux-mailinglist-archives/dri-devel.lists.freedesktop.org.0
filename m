Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F160B802C08
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 08:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABCC10E165;
	Mon,  4 Dec 2023 07:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2146810E165
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 07:28:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1F97860F13;
 Mon,  4 Dec 2023 07:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71705C433C8;
 Mon,  4 Dec 2023 07:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701674903;
 bh=eJKSep2QD7gJ/0nBUBeTc1a4h97UkN6mjcyAE28MOmA=;
 h=From:To:Cc:Subject:Date:From;
 b=BiBzutVln1VIvwewH6Q8mLGqsvH33r9JMIlab6krzKGBBQ4gnZ9oo05jlAzeeV6zF
 U6/lHP2lHnrolkNWLf0U/ss+OipChnH2ptuIZL1IH56UtIs5uRlb7HI4Pbpmfx2B3U
 bmd56H7qNkkBlArbReoJmXnkWkVAojR4i4/vPceHbxnx58/sTHgvERdVx+rM54wTsK
 /UFPIqF8zm6ysCpXga2EGhcHZ5Tw0UAheTt+iB9AgUVRGvftgjqPVY502sKV50J6m2
 A/4yewRX/ZbfgUGLmoEbKwF0fo3fQgKYdicgaMzrDzJJtaq+pBjo2Ys2j4FB2eece+
 GchdxQbbrQ0IQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] drm/bridge: tc358768: select CONFIG_VIDEOMODE_HELPERS
Date: Mon,  4 Dec 2023 08:27:36 +0100
Message-Id: <20231204072814.968816-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

A dependency on this feature was recently introduced:

x86_64-linux-ld: vmlinux.o: in function `tc358768_bridge_pre_enable':
tc358768.c:(.text+0xbe3dae): undefined reference to `drm_display_mode_to_videomode'

Make sure this is always enabled.

Fixes: e5fb21678136 ("drm/bridge: tc358768: Use struct videomode")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index ba82a1142adf..3e6a4e2044c0 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -313,6 +313,7 @@ config DRM_TOSHIBA_TC358768
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
+	select VIDEOMODE_HELPERS
 	help
 	  Toshiba TC358768AXBG/TC358778XBG DSI bridge chip driver.
 
-- 
2.39.2

