Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809298FA84D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 04:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA8110E07F;
	Tue,  4 Jun 2024 02:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="GeCo7aEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B233910E07F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 02:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ongMRIDR9OJ67FPX959hIpLFcH5SoR5ACjgPGkxuvD4=;
 b=GeCo7aEQ1VpT4jZAxcyOm1qtfTcaSRkOQb3oIQ6N4/RitTv91zl3v7p2
 3FGdDznDNM1EOv6ggm/o8P58uuUH9jM+0iaQaA4pqsQAeTxDsHgMyo4LU
 2rUzIQFszOSoJDTiExz0AFmd0n/dXA2fIa/lEMNmExebDLunacE2/LRGU
 epMgXb3CfMHRTKKI7mpB79qXpCnBAinbf5cw0dF7mES09w7oLBoMNEjJl
 I3+aujMj8ewG3WBTU0kH3UdyUXpy9/MFAmMFCwraWpRWSGXqD9+5GBmcu
 hGdwL27XEWvVES0OW17plPTFjXprC8+z7Dm/BGAGac0o+HaACJg6NEiLU g==;
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 04 Jun 2024 10:33:34 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 4542XTSn057581;
 Tue, 4 Jun 2024 10:33:29 +0800 (GMT-8)
 (envelope-from kuro.chung@ite.com.tw)
Received: from ite-XPS-13-9360.internal.ite.com.tw (192.168.72.42) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 4 Jun 2024 10:33:28 +0800
From: kuro <kuro.chung@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>, Kenneth Haung
 <kenneth.hung@ite.com.tw>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Kuro Chung <kuro.chung@ite.com.tw>, Hermes Wu <hermes.wu@ite.com.tw>
Subject: [PATCH v1] drm/bridge: it6505: update usleep_range for RC circuit
 charge time
Date: Tue, 4 Jun 2024 10:44:05 +0800
Message-ID: <20240604024405.1122488-1-kuro.chung@ite.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.72.42]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: A32F6B6386882D419C459589941F989605B411FE5A98B4AC4E9B5DC4CAEDA3DC2002:8
X-MAIL: mse.ite.com.tw 4542XTSn057581
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

From: Kuro Chung <kuro.chung@ite.com.tw>

The spec of timing between IVDD/OVDD and SYSRTEN is 10ms, but SYSRSTN RC
circuit need at least 25ms for rising time, update for match spec

Signed-off-by: Kuro Chung <kuro.chung@ite.com.tw>
Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index cd1b5057ddfb4..1e1c06fdf2064 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2615,7 +2615,7 @@ static int it6505_poweron(struct it6505 *it6505)
 		gpiod_set_value_cansleep(pdata->gpiod_reset, 0);
 		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(pdata->gpiod_reset, 1);
-		usleep_range(10000, 20000);
+		usleep_range(25000, 35000);
 	}
 
 	it6505->powered = true;
-- 
2.25.1

