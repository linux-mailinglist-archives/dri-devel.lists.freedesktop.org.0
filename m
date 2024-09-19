Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD797C597
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 10:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62AB10E2A0;
	Thu, 19 Sep 2024 08:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="VATSfTeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 915 seconds by postgrey-1.36 at gabe;
 Thu, 19 Sep 2024 03:13:37 UTC
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711D410E095
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 03:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ehoi8s4/Stw7NaDdZRfk9eWo3epo4qJYjwJjrMen4bk=;
 b=VATSfTeDCRcy1o4dPuu9U+3JJ4BRJR2ado5KKLmud0TEluGVcwZ97qWk
 h16EO+hD73eoidlPwOEbpLHwxtBddbLm0DVRBetR5AAVOO7F21ztED5If
 lp4SPweyav8i01DKj1Atjmcj+ejaWHKvDgOTIDZTZ24KgE3nex4BqbWIf
 jXHaVmbCiuOzSRtiM3mH5DBOk8klXv6MrDnSbSpXc61Ed0jAz+yeO6v+T
 qyMndqRsZnbFqNIbAk9E8g/DnN9HI/EBHEzungZuZ68CUK8YgB1PiX0M7
 hzeMzDeGVU3yo//cgf13Z6B9Sp8A9CR4MeQHqoQ/fRdt/dca/xG8XHvh+ A==;
X-CSE-ConnectionGUID: zeKSpeN5RRKmT5fCMuzrKg==
X-CSE-MsgGUID: UESHdbqLRk+Mj1jD98qGFQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 19 Sep 2024 10:58:19 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48J2wGBk089262;
 Thu, 19 Sep 2024 10:58:16 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 10:58:16 +0800
From: <Hermes.Wu@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss
 <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
CC: Kenneth hung <kenneth.hung@ite.com.tw>, Hermes Wu <Hermes.Wu@ite.com.tw>
Subject: [PATCH v1] drm/bridge:  it6505: HDCP CTS fail on repeater items
Date: Thu, 19 Sep 2024 10:55:52 +0800
Message-ID: <20240919025551.254-1-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: E69BDB43CECD890DF345017636854D7C8DF0EE4AC3C03E7A93D5BBE5425D323E2002:8
X-MAIL: mse.ite.com.tw 48J2wGBk089262
X-Mailman-Approved-At: Thu, 19 Sep 2024 08:10:55 +0000
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

From: Hermes Wu <Hermes.Wu@ite.com.tw>

Fix HDCP CTS items on UNIGRAF DPR-100.

Signed-off-by: Hermes Wu <Hermes.Wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 152 ++++++++++++++++++----------
 1 file changed, 101 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 7a4608844de3..cef02c8c363e 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -298,11 +298,11 @@
 #define MAX_LANE_COUNT 4
 #define MAX_LINK_RATE HBR
 #define AUTO_TRAIN_RETRY 3
-#define MAX_HDCP_DOWN_STREAM_COUNT 10
+#define MAX_HDCP_DOWN_STREAM_COUNT 127
 #define MAX_CR_LEVEL 0x03
 #define MAX_EQ_LEVEL 0x03
 #define AUX_WAIT_TIMEOUT_MS 15
-#define AUX_FIFO_MAX_SIZE 32
+#define AUX_FIFO_MAX_SIZE 16
 #define PIXEL_CLK_DELAY 1
 #define PIXEL_CLK_INVERSE 0
 #define ADJUST_PHASE_THRESHOLD 80000
@@ -326,6 +326,9 @@ enum aux_cmd_type {
 	CMD_AUX_NATIVE_READ = 0x0,
 	CMD_AUX_NATIVE_WRITE = 0x5,
 	CMD_AUX_I2C_EDID_READ = 0xB,
+
+	/*extend read ncommand */
+	CMD_AUX_GET_KSV_LIST = 0x10,
 };
 
 enum aux_cmd_reply {
@@ -973,7 +976,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
 	it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, AUX_USER_MODE);
 
 aux_op_start:
-	if (cmd == CMD_AUX_I2C_EDID_READ) {
+	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
 		/* AUX EDID FIFO has max length of AUX_FIFO_MAX_SIZE bytes. */
 		size = min_t(size_t, size, AUX_FIFO_MAX_SIZE);
 		/* Enable AUX FIFO read back and clear FIFO */
@@ -1004,7 +1007,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
 				  size);
 
 	/* Aux Fire */
-	it6505_write(it6505, REG_AUX_CMD_REQ, cmd);
+	it6505_write(it6505, REG_AUX_CMD_REQ, (cmd & 0x0F));
 
 	ret = it6505_aux_wait(it6505);
 	if (ret < 0)
@@ -1038,7 +1041,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
 		goto aux_op_start;
 	}
 
-	if (cmd == CMD_AUX_I2C_EDID_READ) {
+	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
 		for (i = 0; i < size; i++) {
 			ret = it6505_read(it6505, REG_AUX_DATA_FIFO);
 			if (ret < 0)
@@ -1063,7 +1066,7 @@ static ssize_t it6505_aux_operation(struct it6505 *it6505,
 	ret = i;
 
 aux_op_err:
-	if (cmd == CMD_AUX_I2C_EDID_READ) {
+	if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST) {
 		/* clear AUX FIFO */
 		it6505_set_bits(it6505, REG_AUX_CTRL,
 				AUX_EN_FIFO_READ | CLR_EDID_FIFO,
@@ -1084,18 +1087,25 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
 				      size_t size, enum aux_cmd_reply *reply)
 {
 	int i, ret_size, ret = 0, request_size;
+	struct device *dev = &it6505->client->dev;
 
 	mutex_lock(&it6505->aux_lock);
-	for (i = 0; i < size; i += 4) {
-		request_size = min((int)size - i, 4);
+	for (i = 0; i < size; ) {
+		if (cmd == CMD_AUX_I2C_EDID_READ || cmd == CMD_AUX_GET_KSV_LIST)
+			request_size = min((int)size - i, AUX_FIFO_MAX_SIZE);
+		else
+			request_size = min((int)size - i, 4);
+
 		ret_size = it6505_aux_operation(it6505, cmd, address + i,
 						buffer + i, request_size,
 						reply);
+
 		if (ret_size < 0) {
 			ret = ret_size;
 			goto aux_op_err;
 		}
 
+		i += request_size;
 		ret += ret_size;
 	}
 
@@ -1186,6 +1196,35 @@ static int it6505_get_edid_block(void *data, u8 *buf, unsigned int block,
 	return 0;
 }
 
+static int it6505_get_ksvlist(struct it6505 *it6505, u8 *buf, size_t len)
+{
+	int i, request_size, ret;
+	struct device *dev = &it6505->client->dev;
+	enum aux_cmd_reply reply;
+
+	for (i = 0; i < len; ) {
+		request_size = min((int)len - i, 15);
+
+		ret = it6505_aux_do_transfer(it6505, CMD_AUX_GET_KSV_LIST,
+					     DP_AUX_HDCP_KSV_FIFO,
+					     buf + i, request_size, &reply);
+
+		DRM_DEV_DEBUG_DRIVER(dev, "request_size = %d, ret =%d", request_size, ret);
+		if (ret < 0)
+			return ret;
+
+		i += request_size;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "ksv read cnt = %d down_stream_cnt=%d ", i, i/5);
+
+	for (i = 0 ; i < len; i += 5)
+		DRM_DEV_DEBUG_DRIVER(dev, "ksv[%d] = %02X%02X%02X%02X%02X",
+				i/5, buf[i], buf[i + 1], buf[i + 2], buf[i + 3], buf[i + 4]);
+
+	return len;
+}
+
 static void it6505_variable_config(struct it6505 *it6505)
 {
 	it6505->link_rate_bw_code = HBR;
@@ -1927,6 +1966,7 @@ static void it6505_hdcp_part1_auth(struct it6505 *it6505)
 	it6505_set_bits(it6505, REG_HDCP_TRIGGER, HDCP_TRIGGER_START,
 			HDCP_TRIGGER_START);
 
+	it6505->is_repeater = (hdcp_bcaps & DP_BCAPS_REPEATER_PRESENT);
 	it6505->hdcp_status = HDCP_AUTH_GOING;
 }
 
@@ -1963,7 +2003,7 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 {
 	struct device *dev = &it6505->client->dev;
 	u8 binfo[2];
-	int down_stream_count, i, err, msg_count = 0;
+	int down_stream_count, err, msg_count = 0;
 
 	err = it6505_get_dpcd(it6505, DP_AUX_HDCP_BINFO, binfo,
 			      ARRAY_SIZE(binfo));
@@ -1989,17 +2029,12 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 		return 0;
 	}
 
-	for (i = 0; i < down_stream_count; i++) {
-		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_KSV_FIFO +
-				      (i % 3) * DRM_HDCP_KSV_LEN,
-				      sha1_input + msg_count,
-				      DRM_HDCP_KSV_LEN);
 
-		if (err < 0)
-			return err;
+	err =  it6505_get_ksvlist(it6505, sha1_input, down_stream_count * 5);
+	if (err < 0)
+		return err;
 
-		msg_count += 5;
-	}
+	msg_count += down_stream_count * 5;
 
 	it6505->hdcp_down_stream_count = down_stream_count;
 	sha1_input[msg_count++] = binfo[0];
@@ -2027,7 +2062,7 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 {
 	struct device *dev = &it6505->client->dev;
 	u8 av[5][4], bv[5][4];
-	int i, err;
+	int i, err, retry;
 
 	i = it6505_setup_sha1_input(it6505, it6505->sha1_input);
 	if (i <= 0) {
@@ -2037,21 +2072,28 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 
 	it6505_sha1_digest(it6505, it6505->sha1_input, i, (u8 *)av);
 
-	err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
-			      sizeof(bv));
+	for (retry = 0; retry < 3; retry++) {
 
-	if (err < 0) {
-		dev_err(dev, "Read V' value Fail");
-		return false;
-	}
+		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
+					sizeof(bv));
 
-	for (i = 0; i < 5; i++)
-		if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
-		    bv[i][1] != av[i][2] || bv[i][0] != av[i][3])
-			return false;
+		if (err < 0) {
+			dev_err(dev, "Read V' value Fail %d", retry);
+			continue;
+		}
 
-	DRM_DEV_DEBUG_DRIVER(dev, "V' all match!!");
-	return true;
+		for (i = 0; i < 5; i++) {
+			if (bv[i][3] != av[i][0] || bv[i][2] != av[i][1] ||
+				bv[i][1] != av[i][2] || bv[i][0] != av[i][3])
+				break;
+
+			DRM_DEV_DEBUG_DRIVER(dev, "V' all match!! %d, %d", retry, i);
+			return true;
+		}
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "V' NOT match!! %d", retry);
+	return false;
 }
 
 static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
@@ -2059,7 +2101,7 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
 	struct it6505 *it6505 = container_of(work, struct it6505,
 					     hdcp_wait_ksv_list);
 	struct device *dev = &it6505->client->dev;
-	unsigned int timeout = 5000;
+	unsigned int timeout = 2000;
 	u8 bstatus = 0;
 	bool ksv_list_check;
 
@@ -2079,21 +2121,18 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
 
 	if (timeout == 0) {
 		DRM_DEV_DEBUG_DRIVER(dev, "timeout and ksv list wait failed");
-		goto timeout;
+		goto hdcp_ksvlist_fail;
 	}
 
 	ksv_list_check = it6505_hdcp_part2_ksvlist_check(it6505);
 	DRM_DEV_DEBUG_DRIVER(dev, "ksv list ready, ksv list check %s",
-			     ksv_list_check ? "pass" : "fail");
-	if (ksv_list_check) {
-		it6505_set_bits(it6505, REG_HDCP_TRIGGER,
-				HDCP_TRIGGER_KSV_DONE, HDCP_TRIGGER_KSV_DONE);
+				ksv_list_check ? "pass" : "fail");
+
+	if (ksv_list_check)
 		return;
-	}
-timeout:
-	it6505_set_bits(it6505, REG_HDCP_TRIGGER,
-			HDCP_TRIGGER_KSV_DONE | HDCP_TRIGGER_KSV_FAIL,
-			HDCP_TRIGGER_KSV_DONE | HDCP_TRIGGER_KSV_FAIL);
+
+hdcp_ksvlist_fail:
+	it6505_start_hdcp(it6505);
 }
 
 static void it6505_hdcp_work(struct work_struct *work)
@@ -2139,7 +2178,7 @@ static void it6505_hdcp_work(struct work_struct *work)
 	it6505_hdcp_part1_auth(it6505);
 }
 
-static void it6505_show_hdcp_info(struct it6505 *it6505)
+static void it6505_show_hdcp_info(struct it6505 *it6505, bool repeater_info)
 {
 	struct device *dev = &it6505->client->dev;
 	int i;
@@ -2150,7 +2189,7 @@ static void it6505_show_hdcp_info(struct it6505 *it6505)
 	DRM_DEV_DEBUG_DRIVER(dev, "bksv = 0x%*ph",
 			     (int)ARRAY_SIZE(it6505->bksvs), it6505->bksvs);
 
-	if (it6505->is_repeater) {
+	if ((repeater_info) && (it6505->is_repeater)) {
 		DRM_DEV_DEBUG_DRIVER(dev, "hdcp_down_stream_count: %d",
 				     it6505->hdcp_down_stream_count);
 		DRM_DEV_DEBUG_DRIVER(dev, "sha1_input: 0x%*ph",
@@ -2251,12 +2290,11 @@ static void it6505_link_training_work(struct work_struct *work)
 	if (ret) {
 		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 		it6505_link_train_ok(it6505);
-		return;
 	} else {
 		it6505->auto_train_retry--;
+		it6505_dump(it6505);
 	}
 
-	it6505_dump(it6505);
 }
 
 static void it6505_plugged_status_to_codec(struct it6505 *it6505)
@@ -2311,14 +2349,22 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
 	DRM_DEV_DEBUG_DRIVER(dev, "dp_irq_vector = 0x%02x", dp_irq_vector);
 
 	if (dp_irq_vector & DP_CP_IRQ) {
-		it6505_set_bits(it6505, REG_HDCP_TRIGGER, HDCP_TRIGGER_CPIRQ,
-				HDCP_TRIGGER_CPIRQ);
 
 		bstatus = it6505_dpcd_read(it6505, DP_AUX_HDCP_BSTATUS);
 		if (bstatus < 0)
 			return bstatus;
 
 		DRM_DEV_DEBUG_DRIVER(dev, "Bstatus = 0x%02x", bstatus);
+
+		/*1B-02 ignore when bstatus is 0 */
+		if ((bstatus & DP_BSTATUS_R0_PRIME_READY) &&
+				(it6505->hdcp_status == HDCP_AUTH_GOING))
+			it6505_set_bits(it6505, REG_HDCP_TRIGGER, HDCP_TRIGGER_CPIRQ,
+					HDCP_TRIGGER_CPIRQ);
+		else if ((bstatus & (DP_BSTATUS_REAUTH_REQ | DP_BSTATUS_LINK_FAILURE)) &&
+				(it6505->hdcp_status == HDCP_AUTH_DONE))
+			it6505_start_hdcp(it6505);
+
 	}
 
 	ret = drm_dp_dpcd_read_link_status(&it6505->aux, link_status);
@@ -2431,7 +2477,7 @@ static void it6505_irq_hdcp_done(struct it6505 *it6505)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "hdcp done interrupt");
 	it6505->hdcp_status = HDCP_AUTH_DONE;
-	it6505_show_hdcp_info(it6505);
+	it6505_show_hdcp_info(it6505, false);
 }
 
 static void it6505_irq_hdcp_fail(struct it6505 *it6505)
@@ -2440,7 +2486,7 @@ static void it6505_irq_hdcp_fail(struct it6505 *it6505)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "hdcp fail interrupt");
 	it6505->hdcp_status = HDCP_AUTH_IDLE;
-	it6505_show_hdcp_info(it6505);
+	it6505_show_hdcp_info(it6505, true);
 	it6505_start_hdcp(it6505);
 }
 
@@ -2455,7 +2501,11 @@ static void it6505_irq_hdcp_ksv_check(struct it6505 *it6505)
 {
 	struct device *dev = &it6505->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "HDCP event Interrupt");
+	DRM_DEV_DEBUG_DRIVER(dev, "HDCP repeater R0 event Interrupt");
+
+	it6505_set_bits(it6505, REG_HDCP_TRIGGER,
+			HDCP_TRIGGER_KSV_DONE, HDCP_TRIGGER_KSV_DONE);
+
 	schedule_work(&it6505->hdcp_wait_ksv_list);
 }
 
-- 
2.34.1

