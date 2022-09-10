Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7845B4AC0
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 01:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D610D10E2A0;
	Sat, 10 Sep 2022 23:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 871 seconds by postgrey-1.36 at gabe;
 Sat, 10 Sep 2022 23:03:28 UTC
Received: from h7.fbrelay.privateemail.com (h7.fbrelay.privateemail.com
 [162.0.218.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B409610E2A0
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 23:03:28 +0000 (UTC)
Received: from MTA-10-4.privateemail.com (mta-10-1.privateemail.com
 [68.65.122.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h7.fbrelay.privateemail.com (Postfix) with ESMTPS id 61EAA61357
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Sep 2022 22:48:54 +0000 (UTC)
Received: from mta-10.privateemail.com (localhost [127.0.0.1])
 by mta-10.privateemail.com (Postfix) with ESMTP id 1819218000A1;
 Sat, 10 Sep 2022 18:48:52 -0400 (EDT)
Received: from hal-station..
 (bras-base-toroon4321w-grc-49-76-69-77-8.dsl.bell.ca [76.69.77.8])
 by mta-10.privateemail.com (Postfix) with ESMTPA id 756A618000A2;
 Sat, 10 Sep 2022 18:48:37 -0400 (EDT)
From: Hamza Mahfooz <someguy@effective-light.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: use drm_debug_enabled() in
 it6505_debug_print()
Date: Sat, 10 Sep 2022 18:48:16 -0400
Message-Id: <20220910224816.15058-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Hamza Mahfooz <someguy@effective-light.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Allen Chen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Hermes Wu <hermes.wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As made mention of in commit 9f0ac028410f ("drm/print: rename drm_debug
to __drm_debug to discourage use"), we shouldn't explicitly refer to
__drm_debug in this context. So, use drm_debug_enabled() instead.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 4b673c4792d7..875f87c576cb 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -554,7 +554,7 @@ static void it6505_debug_print(struct it6505 *it6505, unsigned int reg,
 	struct device *dev = &it6505->client->dev;
 	int val;
 
-	if (likely(!(__drm_debug & DRM_UT_DRIVER)))
+	if (!drm_debug_enabled(DRM_UT_DRIVER))
 		return;
 
 	val = it6505_read(it6505, reg);
-- 
2.37.3

