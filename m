Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE82391184
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 09:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D786EC23;
	Wed, 26 May 2021 07:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94E76EC23
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 07:51:07 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d8ed:c948:a7ff:27e4])
 by albert.telenet-ops.be with bizsmtp
 id 9Kr02500D0QkFpL06Kr0os; Wed, 26 May 2021 09:51:05 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lloJf-009Z6B-Mr; Wed, 26 May 2021 09:50:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lloJf-005No9-7L; Wed, 26 May 2021 09:50:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] drm/bridge: DRM_CROS_EC_ANX7688 should depend on
 I2C_CROS_EC_TUNNEL
Date: Wed, 26 May 2021 09:50:58 +0200
Message-Id: <d107d1840b83607baee8571cc5d88973fc32b519.1622015323.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ChromeOS EC ANX7688 bridge is connected to a ChromeOS Embedded
Controller, and is accessed using I2C tunneling through the Embedded
Controller.  Hence add a dependency on I2C_CROS_EC_TUNNEL, to prevent
asking the user about this driver when configuring a kernel without
support for the ChromeOS EC tunnel I2C bus.

Fixes: 44602b10d7f2a5f7 ("drm/bridge: Add ChromeOS EC ANX7688 bridge driver support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 7e7f28eb954661e2..c96e4b38d1d34ee6 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -53,6 +53,7 @@ config DRM_CHRONTEL_CH7033
 config DRM_CROS_EC_ANX7688
 	tristate "ChromeOS EC ANX7688 bridge"
 	depends on OF
+	depends on I2C_CROS_EC_TUNNEL || COMPILE_TEST
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
-- 
2.25.1

