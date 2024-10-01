Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C2498B4C0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 08:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B0710E5E7;
	Tue,  1 Oct 2024 06:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="W20YDrna";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAC710E5DE
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZKXe6cejtTfwAdkLPishQV6If6We7/xhoRLP0BCApug=;
 b=W20YDrnaPiNDMo8ZxBVJCXMjBmSjG/xh4oATreTfiKmbFatqEc6gGLzd
 LufvD3TasSARBCYQ7FHFlshsYEclN6oTvx864s9tRvq1ji/t5hcP9b7Yl
 5CEfJ3K/mbv2x54XvilVYGDSyB85aHZruFxnFdjjTUISw50ogpbrCTZ/P
 u8eaP8fP0HsGJLtwZPNv9OUZQPLDZEjA7OWOwLbqFMe4Yibefd4Hxkq4i
 AcHCiP6U8NtLPVQIp578Ri8+AOuHSSRxvdQO+TcQzSp1NPsq+OUuLXFxw
 5qjmDrt4nGuIqSTfg0uI1mBWSfjPZdqKzqCvACVR3PYE/t+f5N+nssp0L Q==;
X-CSE-ConnectionGUID: hlniAeixSW6uxjk9P2b96Q==
X-CSE-MsgGUID: DJ3zsK0HSiGABjVWQilnJQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 01 Oct 2024 14:43:43 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 4916hdBV044745;
 Tue, 1 Oct 2024 14:43:39 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 14:43:39 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>,
 Hermes Wu <Hermes.wu@ite.com.tw>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 03/10] drm/bridge: it6505: add AUX operation for HDCP KSV
 list read
Date: Tue, 1 Oct 2024 14:43:02 +0800
Message-ID: <20241001064305.32180-4-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
References: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: CDE6E7CBE5A25FF8EBDF2B2901BE69E59694DFAD01550D3A9EF650F510CBB6442002:8
X-MAIL: mse.ite.com.tw 4916hdBV044745
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

HDCP KSV list readback can choose to use AUX FIFO or general data register.
For some DisplayPort devices, the KSV list must be read in 5 byte boundaries.
The original AUX read command does not support these devices.

The AUX command operation control register "REG_AUX_CMD_REQ" uses b[3:0] as AUX operacion control, and b[7:4] are status bits and read only.
To change KSV read operation uses "CMD_AUX_NATIVE_READ" from using the data registers to using AUX FIFO.
The extended command "CMD_AUX_GET_KSV_LIST" is added as "CMD_AUX_NATIVE_READ" with the 0x10 flag which selects AUX FIFO mode.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 864fab7e388f..9a022c095af4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -126,6 +126,7 @@
 #define REG_AUX_OUT_DATA0 0x27
 
 #define REG_AUX_CMD_REQ 0x2B
+#define M_AUX_REQ_CMD 0x0F
 #define AUX_BUSY BIT(5)
 
 #define REG_AUX_DATA_0_7 0x2C
@@ -324,6 +325,9 @@ enum aux_cmd_type {
 	CMD_AUX_NATIVE_READ = 0x0,
 	CMD_AUX_NATIVE_WRITE = 0x5,
 	CMD_AUX_I2C_EDID_READ = 0xB,
+
+	/* KSV read with AUX FIFO extend from CMD_AUX_NATIVE_READ*/
+	CMD_AUX_GET_KSV_LIST = 0x10,
 };
 
 enum aux_cmd_reply {
@@ -965,7 +969,8 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
 	it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, AUX_USER_MODE);
 
 aux_op_start:
-	if (cmd == CMD_AUX_I2C_EDID_READ) {
+	/* HW AUX FIFO supports only EDID and DCPD KSV FIFO area */
+	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
 		/* AUX EDID FIFO has max length of AUX_FIFO_MAX_SIZE bytes. */
 		size = min_t(size_t, size, AUX_FIFO_MAX_SIZE);
 		/* Enable AUX FIFO read back and clear FIFO */
@@ -996,7 +1001,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
 				  size);
 
 	/* Aux Fire */
-	it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
+	it6505_write(it6505, REG_AUX_CMD_REQ, FIELD_GET(M_AUX_REQ_CMD, cmd));
 
 	ret = it6505_aux_wait(it6505);
 	if (ret < 0)
@@ -1030,7 +1035,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
 		goto aux_op_start;
 	}
 
-	if (cmd == CMD_AUX_I2C_EDID_READ) {
+	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
 		for (i = 0; i < size; i++) {
 			ret = it6505_read(it6505, REG_AUX_DATA_FIFO);
 			if (ret < 0)
@@ -1055,7 +1060,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
 	ret = i;
 
 aux_op_err:
-	if (cmd == CMD_AUX_I2C_EDID_READ) {
+	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
 		/* clear AUX FIFO */
 		it6505_set_bits(it6505, REG_AUX_CTRL,
 				AUX_EN_FIFO_READ | CLR_EDID_FIFO,
@@ -1076,7 +1081,8 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
 				      size_t size, enum aux_cmd_reply *reply)
 {
 	int i, ret_size, ret = 0, request_size;
-	int fifo_max_size = (cmd == CMD_AUX_I2C_EDID_READ) ? AUX_FIFO_MAX_SIZE : 4;
+	int fifo_max_size = (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) ?
+						 AUX_FIFO_MAX_SIZE : 4;
 
 	mutex_lock(&it6505->aux_lock);
 	i = 0;
-- 
2.34.1

