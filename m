Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1BE97D2E7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 10:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8338110E2E4;
	Fri, 20 Sep 2024 08:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="raYL+J1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1547810E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bTDzqOS47QQw0H5HnXPUclM1b17EzbnVmqfdMQjEfc0=;
 b=raYL+J1L9EKLvygJla840e85nw3gQXuPKNJDEoQ/BE8CP6bcI+xWy+1C
 mer378T323BCHkJ6ABmc1JGUXMe0smeh+9Jj1pC2x7ZT/iJ4wAsJ5hq+v
 zYobq+cPQM8zpla2Bvmt7Z8mO6GRn8VH3mJ8HzYCslJbffvuy6cIOnsY3
 8x/zumkAF3kyX4uNu59oP9SdXOpqx2FBGqN4R8mDvvltXgfCd3jfZp+ij
 OOie2J2mfdJ5Ts86J3AJKGbiPTX5IQnC6mTSrX9GBwGuNtaLW2mEJRmSE
 CFff654UpA4+hwvKyiHyYJ/mV2YwSUm4EmdwR7yArQfShKu9okZo8cLkO Q==;
X-CSE-ConnectionGUID: YQ6cslkHT8eTX8x/PkZXgA==
X-CSE-MsgGUID: Q3nt34DVSjaUUA5dKNT9xA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 20 Sep 2024 16:25:11 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48K8P5vw024311;
 Fri, 20 Sep 2024 16:25:05 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from LAPTOP-C4GM1L3U.localdomain (192.168.82.6) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 16:25:06 +0800
From: Hermes Wu <Hermes.Wu@ite.com.tw>
To: Pin-yen Lin <treapking@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss
 <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
CC: Kenneth Hung <Kenneth.hung@ite.com.tw>, Hermes Wu <Hermes.wu@ite.com.tw>
Subject: [PATCH v2 2/2] drm/bridge: it6505: Add MCCS support
Date: Fri, 20 Sep 2024 16:24:51 +0800
Message-ID: <20240920082451.9240-7-Hermes.Wu@ite.com.tw>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920082451.9240-1-Hermes.Wu@ite.com.tw>
References: <20240920082451.9240-1-Hermes.Wu@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.82.6]
X-ClientProxiedBy: TPEMAIL1.internal.ite.com.tw (192.168.15.58) To
 TPEMAIL1.internal.ite.com.tw (192.168.15.58)
X-TM-SNTS-SMTP: C6DFD326E296B29C3DA7A0BAB263AE5FE650988372D7E9840CB33A4DF2B581EA2002:8
X-MAIL: mse.ite.com.tw 48K8P5vw024311
X-Mailman-Approved-At: Fri, 20 Sep 2024 08:40:41 +0000
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

add AUX-I2C functionality to support MCCS

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 209 ++++++++++++++++++++++++++--
 1 file changed, 200 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index cef02c8c363e..1a272c67e82b 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -127,6 +127,9 @@
 #define REG_AUX_ADR_16_19 0x26
 #define REG_AUX_OUT_DATA0 0x27
 
+#define REG_AUX_I2C_ADR 0x25
+#define REG_AUX_I2C_OP 0x26
+
 #define REG_AUX_CMD_REQ 0x2B
 #define AUX_BUSY BIT(5)
 
@@ -268,6 +271,19 @@
 #define REG_SSC_CTRL1 0x189
 #define REG_SSC_CTRL2 0x18A
 
+#define REG_AUX_USER_CTRL 0x190
+#define EN_USER_AUX BIT(0)
+#define USER_AUX_DONE BIT(1)
+#define AUX_EVENT BIT(4)
+
+#define REG_AUX_USER_DATA_REC 0x191
+#define M_AUX_IN_REC   0xF0
+#define M_AUX_OUT_REC  0x0F
+
+#define REG_AUX_USER_TXB 0x190
+#define REG_AUX_USER_REPLY 0x19A
+#define REG_AUX_USER_RXB(n) (n + 0x19B)
+
 #define RBR DP_LINK_BW_1_62
 #define HBR DP_LINK_BW_2_7
 #define HBR2 DP_LINK_BW_5_4
@@ -303,6 +319,8 @@
 #define MAX_EQ_LEVEL 0x03
 #define AUX_WAIT_TIMEOUT_MS 15
 #define AUX_FIFO_MAX_SIZE 16
+#define AUX_I2C_MAX_SIZE 4
+#define AUX_I2C_DEFER_RETRY 4
 #define PIXEL_CLK_DELAY 1
 #define PIXEL_CLK_INVERSE 0
 #define ADJUST_PHASE_THRESHOLD 80000
@@ -325,7 +343,12 @@
 enum aux_cmd_type {
 	CMD_AUX_NATIVE_READ = 0x0,
 	CMD_AUX_NATIVE_WRITE = 0x5,
+	CMD_AUX_GI2C_ADR = 0x08,
+	CMD_AUX_GI2C_READ = 0x09,
+	CMD_AUX_GI2C_WRITE = 0x0A,
 	CMD_AUX_I2C_EDID_READ = 0xB,
+	CMD_AUX_I2C_READ = 0x0D,
+	CMD_AUX_I2C_WRITE = 0x0C,
 
 	/*extend read ncommand */
 	CMD_AUX_GET_KSV_LIST = 0x10,
@@ -333,8 +356,11 @@ enum aux_cmd_type {
 
 enum aux_cmd_reply {
 	REPLY_ACK,
-	REPLY_NACK,
-	REPLY_DEFER,
+	REPLY_NACK = 1,
+	REPLY_DEFER = 2,
+
+	REPLY_I2C_NACK = 4,
+	REPLY_I2C_DEFER = 8,
 };
 
 enum link_train_status {
@@ -1087,7 +1113,6 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
 				      size_t size, enum aux_cmd_reply *reply)
 {
 	int i, ret_size, ret = 0, request_size;
-	struct device *dev = &it6505->client->dev;
 
 	mutex_lock(&it6505->aux_lock);
 	for (i = 0; i < size; ) {
@@ -1114,6 +1139,168 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
 	return ret;
 }
 
+
+static int it6505_aux_i2c_wait(struct it6505 *it6505, u8 *reply)
+{
+	int err = 0;
+	unsigned long timeout;
+	struct device *dev = &it6505->client->dev;
+
+	timeout = jiffies + msecs_to_jiffies(AUX_WAIT_TIMEOUT_MS) + 1;
+
+	do {
+		if (it6505_read(it6505, REG_AUX_USER_CTRL) & AUX_EVENT)
+			break;
+		if (time_after(jiffies, timeout)) {
+			dev_err(dev, "Timed out waiting AUX I2C, BUSY = %X\n",
+					it6505_aux_op_finished(it6505));
+			err = -ETIMEDOUT;
+			goto end_aux_i2c_wait;
+		}
+		usleep_range(300, 800);
+
+	} while (!it6505_aux_op_finished(it6505));
+
+	if (reply == NULL)
+		goto end_aux_i2c_wait;
+
+	*reply = it6505_read(it6505, REG_AUX_USER_REPLY) >> 4;
+
+	if (*reply == 0)
+		goto end_aux_i2c_wait;
+
+	if ((*reply == DP_AUX_NATIVE_REPLY_DEFER) ||
+			(*reply == DP_AUX_I2C_REPLY_DEFER))
+		err = -EBUSY;
+	else if ((*reply == DP_AUX_NATIVE_REPLY_NACK) ||
+			(*reply == DP_AUX_I2C_REPLY_NACK))
+		err = -ENXIO;
+
+end_aux_i2c_wait:
+	it6505_set_bits(it6505, REG_AUX_USER_CTRL, USER_AUX_DONE, USER_AUX_DONE);
+	return err;
+}
+
+static int it6505_aux_i2c_readb(struct it6505 *it6505, u8 *buf, size_t size, u8 *reply)
+{
+	int ret, i;
+	int retry = 0;
+
+	for (retry = 0; retry < AUX_I2C_DEFER_RETRY; retry++) {
+
+		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_READ);
+
+		ret = it6505_aux_i2c_wait(it6505, reply);
+
+		if ((*reply == DP_AUX_NATIVE_REPLY_DEFER) ||
+			(*reply == DP_AUX_I2C_REPLY_DEFER))
+			continue;
+
+		if (ret >= 0)
+			break;
+	}
+
+	for (i = 0; i < size; i++)
+		buf[i] =  (u8) it6505_read(it6505, REG_AUX_USER_RXB(0 + i));
+
+	return size;
+}
+
+static int it6505_aux_i2c_writeb(struct it6505 *it6505, u8 *buf, size_t size, u8 *reply)
+{
+	int i, ret;
+	int retry = 0;
+
+	for (i = 0; i < size; i++)
+		it6505_write(it6505, REG_AUX_OUT_DATA0 + i, buf[i]);
+
+	for (retry = 0; retry < AUX_I2C_DEFER_RETRY; retry++) {
+
+		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_WRITE);
+
+		ret = it6505_aux_i2c_wait(it6505, reply);
+
+		if ((*reply == DP_AUX_NATIVE_REPLY_DEFER) ||
+			(*reply == DP_AUX_I2C_REPLY_DEFER))
+			continue;
+
+		if (ret >= 0)
+			break;
+	}
+	return size;
+}
+
+static ssize_t it6505_aux_i2c_operation(struct it6505 *it6505,
+					struct drm_dp_aux_msg *msg)
+{
+	int ret;
+	ssize_t request_size, data_cnt = 0;
+	struct device *dev = &it6505->client->dev;
+	u8 *buffer = msg->buffer;
+
+	/* set AUX user mode */
+	it6505_set_bits(it6505, REG_AUX_CTRL,
+			AUX_USER_MODE | AUX_NO_SEGMENT_WR, AUX_USER_MODE);
+	it6505_set_bits(it6505, REG_AUX_USER_CTRL, EN_USER_AUX, EN_USER_AUX);
+	/* clear AUX FIFO */
+	it6505_set_bits(it6505, REG_AUX_CTRL,
+			AUX_EN_FIFO_READ | CLR_EDID_FIFO,
+			AUX_EN_FIFO_READ | CLR_EDID_FIFO);
+
+	it6505_set_bits(it6505, REG_AUX_CTRL,
+			AUX_EN_FIFO_READ | CLR_EDID_FIFO, 0x00);
+
+	it6505_write(it6505, REG_AUX_ADR_0_7, 0x00);
+	it6505_write(it6505, REG_AUX_I2C_ADR, msg->address << 1);
+
+	if (msg->size == 0) {
+		/* IIC Start/STOP dummy write */
+		it6505_write(it6505, REG_AUX_I2C_OP, msg->request);
+		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_ADR);
+		ret = it6505_aux_i2c_wait(it6505, &msg->reply);
+		goto end_aux_i2c_transfer;
+	}
+
+	/* IIC data transfer */
+	for (data_cnt = 0; data_cnt < msg->size; ) {
+		request_size = min(msg->size - data_cnt, AUX_I2C_MAX_SIZE);
+		it6505_write(it6505, REG_AUX_I2C_OP,
+					(msg->request) | ((request_size - 1) << 4));
+
+		if ((msg->request & DP_AUX_I2C_READ) == DP_AUX_I2C_READ)
+			ret = it6505_aux_i2c_readb(it6505, &buffer[data_cnt],
+							request_size, &msg->reply);
+		else
+			ret = it6505_aux_i2c_writeb(it6505, &buffer[data_cnt],
+							request_size, &msg->reply);
+
+		if (ret < 0)
+			goto end_aux_i2c_transfer;
+
+		data_cnt += request_size;
+	}
+	ret = data_cnt;
+end_aux_i2c_transfer:
+
+	it6505_set_bits(it6505, REG_AUX_USER_CTRL, EN_USER_AUX, 0);
+	it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, 0);
+	return ret;
+}
+
+
+static ssize_t it6505_aux_i2c_transfer(struct drm_dp_aux *aux,
+				   struct drm_dp_aux_msg *msg)
+{
+	struct it6505 *it6505 = container_of(aux, struct it6505, aux);
+	int ret;
+
+	mutex_lock(&it6505->aux_lock);
+	ret = it6505_aux_i2c_operation(it6505, msg);
+	mutex_unlock(&it6505->aux_lock);
+	return ret;
+}
+
+
 static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
 				   struct drm_dp_aux_msg *msg)
 {
@@ -1125,7 +1312,7 @@ static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
 
 	/* IT6505 doesn't support arbitrary I2C read / write. */
 	if (is_i2c)
-		return -EINVAL;
+		return it6505_aux_i2c_transfer(aux, msg);
 
 	switch (msg->request) {
 	case DP_AUX_NATIVE_READ:
@@ -1153,6 +1340,8 @@ static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
 	case REPLY_DEFER:
 		msg->reply = DP_AUX_NATIVE_REPLY_DEFER;
 		break;
+	default:
+		break;
 	}
 
 	return ret;
@@ -1180,7 +1369,7 @@ static int it6505_get_edid_block(void *data, u8 *buf, unsigned int block,
 		switch (reply) {
 		case REPLY_ACK:
 			DRM_DEV_DEBUG_DRIVER(dev, "[0x%02x]: %8ph", offset,
-					     buf + offset);
+								uf + offset);
 			offset += 8;
 			aux_retry = 100;
 			break;
@@ -1190,6 +1379,8 @@ static int it6505_get_edid_block(void *data, u8 *buf, unsigned int block,
 			msleep(20);
 			if (!(--aux_retry))
 				return -EIO;
+		default:
+			break;
 		}
 	}
 
@@ -2031,8 +2222,8 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 
 
 	err =  it6505_get_ksvlist(it6505, sha1_input, down_stream_count * 5);
-	if (err < 0)
-		return err;
+		if (err < 0)
+			return err;
 
 	msg_count += down_stream_count * 5;
 
@@ -2075,7 +2266,7 @@ static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 	for (retry = 0; retry < 3; retry++) {
 
 		err = it6505_get_dpcd(it6505, DP_AUX_HDCP_V_PRIME(0), (u8 *)bv,
-					sizeof(bv));
+			      sizeof(bv));
 
 		if (err < 0) {
 			dev_err(dev, "Read V' value Fail %d", retry);
@@ -2126,7 +2317,7 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
 
 	ksv_list_check = it6505_hdcp_part2_ksvlist_check(it6505);
 	DRM_DEV_DEBUG_DRIVER(dev, "ksv list ready, ksv list check %s",
-				ksv_list_check ? "pass" : "fail");
+			     ksv_list_check ? "pass" : "fail");
 
 	if (ksv_list_check)
 		return;
-- 
2.34.1

