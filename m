Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4675F5F8
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 14:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332E210E2E5;
	Mon, 24 Jul 2023 12:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4965510E2E5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 12:17:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A53B861127;
 Mon, 24 Jul 2023 12:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6F9C433C9;
 Mon, 24 Jul 2023 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690201075;
 bh=6Wv579trwS5Cciu3iVXhCndFsSYSuaaRiNeiqPnZ2h4=;
 h=From:To:Cc:Subject:Date:From;
 b=k2iu8GNEY+ZXAxiDKfFIUekNEw7/Ij2qXiSCU9PxBQ+dd63AZop4EVo0iqP04CkXP
 Q9MM57FzoPiLkhFMdI1qy2ePfLLbvVY9m8va8a+lmERmOVOw2EZNn+12U3al4IgTPC
 cM6NfVD0pqnfj/NqZko1NIAOlO/SEbkn+vPxAHfXPX/qel5ArKxKAHldxyiaOsAb5R
 5hcopEk0F7keqchPOsjOeOnV21Ie+R6yDmOl2Fn6qqYg3joNtNrY/bOo+JgI1IPRyB
 Plv6HHp16HgWwJ6uP34btPY01z5mmYd5Q79vZp9EokbP5vtdkd4CN+bSMznfwtju7+
 FXeC8sfVsm2Qw==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] drm/panel: ld9040: add backlight Kconfig dependency
Date: Mon, 24 Jul 2023 14:17:05 +0200
Message-Id: <20230724121736.1293270-1-arnd@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The driver now uses the backlight interface, which breaks when that
is disabled:

ld.lld: error: undefined symbol: devm_backlight_device_register

Enforce the necessary Kconfig dependency to avoid this.

Fixes: c2268daa65fb4 ("drm/panel: ld9040: Register a backlight device")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index e8c9f4613a4b4..b097b2507ac5b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -300,6 +300,7 @@ config DRM_PANEL_LEADTEK_LTK500HD1829
 config DRM_PANEL_SAMSUNG_LD9040
 	tristate "Samsung LD9040 RGB/SPI panel"
 	depends on OF && SPI
+	depends on BACKLIGHT_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 
 config DRM_PANEL_LG_LB035Q02
-- 
2.39.2

