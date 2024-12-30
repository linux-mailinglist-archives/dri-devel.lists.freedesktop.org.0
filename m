Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763D39FE575
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 11:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E9110E49D;
	Mon, 30 Dec 2024 10:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZKJYEvJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E43310E100
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:51:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B9ECDA40C26;
 Mon, 30 Dec 2024 10:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3C78C4CEED;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735555861;
 bh=NJj0K2gdXXAJLf7drNqE5H8SvCozOqHpTpJbbKTSkmI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ZKJYEvJwE6a+WWV8KwPOnH7ivLgkvnA1w0u3lAAhNelUif/nx5lMOgiuPqUhR/O5z
 7SrR7ygzxcU/t1Gr3HHHCiQn5XemeokjURnIP3qeh6rfvJDrvzPlzw67535w9W5tzX
 yh1IRWDuSj9jDjeVlFPj6h4lFePV6A8fuDwqPYEdbX2kmWTrgjuS5dPJJ/WWdI5pkw
 zPwJRuTq1zZ7Ujv6yzy833IKuKVVyipv9gQKC3yx5sDpokrqMW2kUuhDG4fXaTwTsN
 7iKS33FZORgybT39arBWYdqpvqtTu/ZitTcsFXeeFDjYoCTU/nCtx3n/I7I6LiPLwK
 itm43etbzjJBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id D791BE7718F;
 Mon, 30 Dec 2024 10:51:01 +0000 (UTC)
From: Hermes Wu via B4 Relay
 <devnull+Hermes.wu.ite.corp-partner.google.com@kernel.org>
Date: Mon, 30 Dec 2024 18:51:28 +0800
Subject: [PATCH RESEND v7 10/10] drm/bridge: it6505: add I2C functionality
 on AUX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-v7-upstream-v7-10-e0fdd4844703@ite.corp-partner.google.com>
References: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
In-Reply-To: <20241230-v7-upstream-v7-0-e0fdd4844703@ite.corp-partner.google.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Pin-yen Lin <treapking@chromium.org>, 
 Kenneth Hung <Kenneth.Hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>, 
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735555881; l=6930;
 i=Hermes.wu@ite.corp-partner.google.com; s=20241230;
 h=from:subject:message-id;
 bh=J4rvU2IuQU84l+7pDQWlWwKvnpve8QmHuGwdiA2w++k=;
 b=13nnuAtHANeIYaqLqLdCoZ+uhUqJIi1vPl1TMkKiwucDyZgbUPaUeixhxzt3amqM2P+pVVeMq
 wm8y8ZPGuR6CSnUP7dVE1ge9tlH0Ga/lXOjTivkJH8RCHmAecwc2FK+
X-Developer-Key: i=Hermes.wu@ite.corp-partner.google.com; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for
 Hermes.wu@ite.corp-partner.google.com/20241230 with auth_id=307
X-Original-From: Hermes Wu <Hermes.wu@ite.corp-partner.google.com>
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
Reply-To: Hermes.wu@ite.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

DisplayPort AUX protocol supports I2C transport which is capable of
reading EDID or supports MCCS.

In drm_dp_helper, drm_dp_i2c_xfer() packs I2C requests into a
sequence of AUX requests.
it6505_aux_i2c_operation() is implemented to match drm_dp_i2c_xfer()
operactions.
it6505_aux_i2c_transfer() adds I2C functionality
for it6505_aux_transfer().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Hermes Wu <hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 177 +++++++++++++++++++++++++++++++++++-
 1 file changed, 175 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 83e2df618c97f8fe3e59789ffb810ce8639f96bb..c2a846f5d8d9b7251913c82d21f7957401e35e5e 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -268,6 +268,18 @@
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
+#define REG_AUX_USER_REPLY 0x19A
+#define REG_AUX_USER_RXB(n) (n + 0x19B)
+
 #define RBR DP_LINK_BW_1_62
 #define HBR DP_LINK_BW_2_7
 #define HBR2 DP_LINK_BW_5_4
@@ -303,6 +315,8 @@
 #define MAX_EQ_LEVEL 0x03
 #define AUX_WAIT_TIMEOUT_MS 15
 #define AUX_FIFO_MAX_SIZE 16
+#define AUX_I2C_MAX_SIZE 4
+#define AUX_I2C_DEFER_RETRY 4
 #define PIXEL_CLK_DELAY 1
 #define PIXEL_CLK_INVERSE 0
 #define ADJUST_PHASE_THRESHOLD 80000
@@ -325,7 +339,12 @@
 enum aux_cmd_type {
 	CMD_AUX_NATIVE_READ = 0x0,
 	CMD_AUX_NATIVE_WRITE = 0x5,
+	CMD_AUX_GI2C_ADR = 0x08,
+	CMD_AUX_GI2C_READ = 0x09,
+	CMD_AUX_GI2C_WRITE = 0x0A,
 	CMD_AUX_I2C_EDID_READ = 0xB,
+	CMD_AUX_I2C_READ = 0x0D,
+	CMD_AUX_I2C_WRITE = 0x0C,
 
 	/* KSV read with AUX FIFO extend from CMD_AUX_NATIVE_READ*/
 	CMD_AUX_GET_KSV_LIST = 0x10,
@@ -1107,6 +1126,161 @@ static ssize_t it6505_aux_do_transfer(struct it6505 *it6505,
 	return ret;
 }
 
+static bool it6505_aux_i2c_reply_defer(u8 reply)
+{
+	if (reply == DP_AUX_NATIVE_REPLY_DEFER || reply == DP_AUX_I2C_REPLY_DEFER)
+		return true;
+	return false;
+}
+
+static bool it6505_aux_i2c_reply_nack(u8 reply)
+{
+	if (reply == DP_AUX_NATIVE_REPLY_NACK || reply == DP_AUX_I2C_REPLY_NACK)
+		return true;
+	return false;
+}
+
+static int it6505_aux_i2c_wait(struct it6505 *it6505, u8 *reply)
+{
+	int err = 0;
+	unsigned long timeout;
+	struct device *dev = it6505->dev;
+
+	timeout = jiffies + msecs_to_jiffies(AUX_WAIT_TIMEOUT_MS) + 1;
+
+	do {
+		if (it6505_read(it6505, REG_AUX_USER_CTRL) & AUX_EVENT)
+			break;
+		if (time_after(jiffies, timeout)) {
+			dev_err(dev, "Timed out waiting AUX I2C, BUSY = %X\n",
+				it6505_aux_op_finished(it6505));
+			err = -ETIMEDOUT;
+			goto end_aux_i2c_wait;
+		}
+		usleep_range(300, 800);
+	} while (!it6505_aux_op_finished(it6505));
+
+	*reply = it6505_read(it6505, REG_AUX_USER_REPLY) >> 4;
+
+	if (*reply == 0)
+		goto end_aux_i2c_wait;
+
+	if (it6505_aux_i2c_reply_defer(*reply))
+		err = -EBUSY;
+	else if (it6505_aux_i2c_reply_nack(*reply))
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
+	int retry;
+
+	for (retry = 0; retry < AUX_I2C_DEFER_RETRY; retry++) {
+		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_READ);
+
+		ret = it6505_aux_i2c_wait(it6505, reply);
+		if (it6505_aux_i2c_reply_defer(*reply))
+			continue;
+		if (ret >= 0)
+			break;
+	}
+
+	for (i = 0; i < size; i++)
+		buf[i] = it6505_read(it6505, REG_AUX_USER_RXB(0 + i));
+
+	return size;
+}
+
+static int it6505_aux_i2c_writeb(struct it6505 *it6505, u8 *buf, size_t size, u8 *reply)
+{
+	int i, ret;
+	int retry;
+
+	for (i = 0; i < size; i++)
+		it6505_write(it6505, REG_AUX_OUT_DATA0 + i, buf[i]);
+
+	for (retry = 0; retry < AUX_I2C_DEFER_RETRY; retry++) {
+		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_WRITE);
+
+		ret = it6505_aux_i2c_wait(it6505, reply);
+		if (it6505_aux_i2c_reply_defer(*reply))
+			continue;
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
+	it6505_write(it6505, REG_AUX_ADR_8_15, msg->address << 1);
+
+	if (msg->size == 0) {
+		/* IIC Start/STOP dummy write */
+		it6505_write(it6505, REG_AUX_ADR_16_19, msg->request);
+		it6505_write(it6505, REG_AUX_CMD_REQ, CMD_AUX_GI2C_ADR);
+		ret = it6505_aux_i2c_wait(it6505, &msg->reply);
+		goto end_aux_i2c_transfer;
+	}
+
+	/* IIC data transfer */
+	data_cnt = 0;
+	do {
+		request_size = min_t(ssize_t, msg->size - data_cnt, AUX_I2C_MAX_SIZE);
+		it6505_write(it6505, REG_AUX_ADR_16_19,
+			     msg->request | ((request_size - 1) << 4));
+		if ((msg->request & DP_AUX_I2C_READ) == DP_AUX_I2C_READ)
+			ret = it6505_aux_i2c_readb(it6505, &buffer[data_cnt],
+						   request_size, &msg->reply);
+		else
+			ret = it6505_aux_i2c_writeb(it6505, &buffer[data_cnt],
+						    request_size, &msg->reply);
+
+		if (ret < 0)
+			goto end_aux_i2c_transfer;
+
+		data_cnt += request_size;
+	} while (data_cnt < msg->size);
+	ret = data_cnt;
+end_aux_i2c_transfer:
+
+	it6505_set_bits(it6505, REG_AUX_USER_CTRL, EN_USER_AUX, 0);
+	it6505_set_bits(it6505, REG_AUX_CTRL, AUX_USER_MODE, 0);
+	return ret;
+}
+
+static ssize_t it6505_aux_i2c_transfer(struct drm_dp_aux *aux,
+				       struct drm_dp_aux_msg *msg)
+{
+	struct it6505 *it6505 = container_of(aux, struct it6505, aux);
+
+	guard(mutex)(&it6505->aux_lock);
+	return it6505_aux_i2c_operation(it6505, msg);
+}
+
 static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
 				   struct drm_dp_aux_msg *msg)
 {
@@ -1116,9 +1290,8 @@ static ssize_t it6505_aux_transfer(struct drm_dp_aux *aux,
 	int ret;
 	enum aux_cmd_reply reply;
 
-	/* IT6505 doesn't support arbitrary I2C read / write. */
 	if (is_i2c)
-		return -EINVAL;
+		return it6505_aux_i2c_transfer(aux, msg);
 
 	switch (msg->request) {
 	case DP_AUX_NATIVE_READ:

-- 
2.34.1


