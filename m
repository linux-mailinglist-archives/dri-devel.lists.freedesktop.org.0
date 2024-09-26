Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791AE986E10
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C1D10EADC;
	Thu, 26 Sep 2024 07:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="BMkQSlN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8754210EADC
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ijDiBw7pXE/kYeGlF5Zmeunc5r3macGsFd6fqhWC56Q=;
 b=BMkQSlN26YwhkthgXEqqIBa9Y6GRPB737NHQ0919IdcFB6hudmjNja3u
 FpXAFSxZh20XgDr+4domwGYkJrzgbINDxU3rafiMXxjceDnRtlbFdGp//
 DLBnFfXeec+ZzMFDD9f9+wg4IfLoqIfMuC763aUtiT8CzqMpHAK5X9DkW
 LicJvP95od3xHvAmbOFV8ZphA5Xb3Sua8E0t0H+JyYx76xwTk7JfcIpjT
 BdjLrEjv36aVzmauLbquEdfaaUmCU2JbcECSGxsirW0057T4irV2+ocfl
 XItlZLLXyKptuWyznG8NGheSSLa5U7Vdw34Cr/yI5mC8xachVQH39++LZ Q==;
X-CSE-ConnectionGUID: dmXKpNvIQF6+pbVwgppX0g==
X-CSE-MsgGUID: lMeR4MaZRK6/wufTFTGGNQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 26 Sep 2024 15:48:21 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48Q7mG0I042933;
 Thu, 26 Sep 2024 15:48:16 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 15:48:15 +0800
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
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 04/11] drm/bridge: it6505: fix aux command write to aux
 operaction register
Date: Thu, 26 Sep 2024 15:47:54 +0800
Message-ID: <20240926074755.22176-5-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
References: <20240926074755.22176-1-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: 1BF483AF16F2451C787FAEA0B2DF3355A1826589CCA7A56C5E09E5698954C10E2002:8
X-MAIL: mse.ite.com.tw 48Q7mG0I042933
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

The aux control register command is 4 bits LSB only, adding a MACRO to get
correct operaction command.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 0583abdca75f..d1f5220e04a6 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -329,6 +329,8 @@ enum aux_cmd_type {
 	CMD_AUX_GET_KSV_LIST = 0x10,
 };
 
+#define GET_AUX_CONTROL_CODE(cmd) ((cmd) & 0x0F)
+
 enum aux_cmd_reply {
 	REPLY_ACK,
 	REPLY_NACK,
@@ -1000,7 +1002,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
 				  size);
 
 	/* Aux Fire */
-	it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
+	it6505_write(it6505, REG_AUX_CMD_REQ, GET_AUX_CONTROL_CODE(cmd));
 
 	ret = it6505_aux_wait(it6505);
 	if (ret < 0)
-- 
2.34.1

