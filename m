Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A6598B4BF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 08:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01F310E5E3;
	Tue,  1 Oct 2024 06:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="KSbM+m86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494DF10E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U4GaxJkwGXmvDnQAw3XxW8Th1ipHzWdX1WJyveeRbO4=;
 b=KSbM+m86MSEhzovDJBVR0XgRa9t71jiRx2YKTGRJLsJ/TXaJy+BkGXyd
 hy8iMoEUdpuWRKbzFmhygsYmrekTzZSON++YlwOrBkqyIbtDPRYxORYwC
 faA0LDaMJziqX1wgx+5dSle3neYF8D3y+hBji+sWutpGyohRc3aMNObbj
 I1KV5Oatk5JuA0SrZFqo9oPym9XdpXZO9naaI2topEaoyuWUA27AAIAc8
 bcaoorwhYynZUGriIEP8lLQ5XBAASBnQX1d9pRGNXIPN/ap2CaMU+mNtU
 gwOC2oZvznNFgyzac/7DNzAOOD9/l6RCREOBHoCOUMWe3+uX3giI+UdjS w==;
X-CSE-ConnectionGUID: aht/0++cSzi5xisY2jlWlQ==
X-CSE-MsgGUID: zZKhHuDoRASG/e7XnFRePQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 01 Oct 2024 14:43:44 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 4916hdSL044739;
 Tue, 1 Oct 2024 14:43:39 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 14:43:38 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Hermes Wu
 <hermes.wu@ite.com.tw>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Allen Chen
 <allen.chen@ite.com.tw>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 01/10] drm/bridge: it6505: Change definition of
 AUX_FIFO_MAX_SIZE
Date: Tue, 1 Oct 2024 14:43:00 +0800
Message-ID: <20241001064305.32180-2-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
References: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: BAB9C0F91AF68659C02FC92D04E49AF60055E75FE2A9C17FDA28D8A4B90B33202002:8
X-MAIL: mse.ite.com.tw 4916hdSL044739
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

From: Hermes Wu <Hermes.wu@ite.com.tw>

The hardware AUX FIFO is 16 bytes
Change definition of AUX_FIFO_MAX_SIZE to 16

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index f372c05360f2..28a8043229d3 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -300,7 +300,7 @@
 #define MAX_CR_LEVEL 0x03
 #define MAX_EQ_LEVEL 0x03
 #define AUX_WAIT_TIMEOUT_MS 15
-#define AUX_FIFO_MAX_SIZE 32
+#define AUX_FIFO_MAX_SIZE 16
 #define PIXEL_CLK_DELAY 1
 #define PIXEL_CLK_INVERSE 0
 #define ADJUST_PHASE_THRESHOLD 80000
-- 
2.34.1

