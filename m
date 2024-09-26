Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56682986E2A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A930110EAE5;
	Thu, 26 Sep 2024 07:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="Q69UuyHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF69D10EAE2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 07:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/MhsEBOD2/Qogtg45F1mT6RHWB7u2J8P93IBSo1/Tok=;
 b=Q69UuyHnD2IDo8vtQ/OD2Cyq3UJlik3jMuedhrw0MBj1nMpsKL6Ep4ow
 /Lod+W1hT+gpGy329bJcvxfJb8K/xvnNGiSuYhDyHUaogcZfIjLxZgSYY
 gANPfv2Htbho82JzIM7zJxx9L0PycP+/Km1MomQbfJ0iMKq/5qNNcmLWO
 meAfbjd7HluVsxquKCYolXStFSnUvZYWqFSnM+AFHbFWTdAlKRpzSYoQQ
 xULZ3JwMA12FC1QpvMMh7l3ZOyAcIeubUL0xN8TU9nR6PzIMTmYhMGnxs
 DcRAVQC5YW8x9T4SLh9JmWgQvEnrbq+rKwJEzEPoHMeIAGFCo86dFch6c w==;
X-CSE-ConnectionGUID: Nll7VDqNQ7eWttAhJ8buvQ==
X-CSE-MsgGUID: 060e/ZYdRpSraTD221/REw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 26 Sep 2024 15:50:42 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48Q7obPR044815;
 Thu, 26 Sep 2024 15:50:37 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 15:50:37 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: hermes wu <Hermes.wu@ite.com.tw>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hermes Wu <hermes.wu@ite.com.tw>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 05/11] drm/bridge: it6505: increase supports of HDCP
 repeater ksv devices
Date: Thu, 26 Sep 2024 15:50:14 +0800
Message-ID: <20240926075018.22328-1-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: EF65523E155F9F62D73D22204B3A2FFE016E29029054F7626C7FB58BD1C9ECA82002:8
X-MAIL: mse.ite.com.tw 48Q7obPR044815
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

A HDCP source shall support max downstream device to 127.

Change definition of MAX_HDCP_DOWN_STREAM_COUNT to 127

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index d1f5220e04a6..5d5ce12cd054 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -296,7 +296,7 @@
 #define MAX_LANE_COUNT 4
 #define MAX_LINK_RATE HBR
 #define AUTO_TRAIN_RETRY 3
-#define MAX_HDCP_DOWN_STREAM_COUNT 10
+#define MAX_HDCP_DOWN_STREAM_COUNT 127
 #define MAX_CR_LEVEL 0x03
 #define MAX_EQ_LEVEL 0x03
 #define AUX_WAIT_TIMEOUT_MS 15
-- 
2.34.1

