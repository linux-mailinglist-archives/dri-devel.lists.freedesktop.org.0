Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E578A66E48
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB2010E2DA;
	Tue, 18 Mar 2025 08:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KyR4boKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FADB10E1EC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:31:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 888EC5C584A;
 Tue, 18 Mar 2025 08:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D8B0C4CEEE;
 Tue, 18 Mar 2025 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742286695;
 bh=B1sdhsClRyrIWFlB2n2+GfiC/tMmbaroZFCL7NTvbC8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=KyR4boKnkikPkvH8jZE229AM5RAUb7c0PvB25zU3f/f1u3j8vk182Bz3axCW+tBD/
 IVeHeCNQ9Kz7KOYM09yFglJsR34CkEIBxZwLN+GkR92sjBECPyBcNTUXx73/PwrGYe
 R+TjzLSEIV09oTDbfClT525qS9+Ps9a74plE5nYNFVe/+UquvqnsTcubl2fxAwZSH7
 oBDs4Br683iz/TVeR6aof/Kh/6/iJRacIJA22w8YSUmapRW9I/rLE45R1VXuqEdhWJ
 fX6f6jf1ZC6UXfKy9Oxb/VyqIVX5IAl2iTg/KaFqqRgQ50JeoXkJjwIiR5OWBK95Sk
 jqDKBNIehS6eQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE1C28B28;
 Tue, 18 Mar 2025 08:31:35 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 18 Mar 2025 16:32:09 +0800
Subject: [PATCH RESEND 1/3] drm/bridge: it6505: modify DP link auto
 training
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-link-training-v1-1-19266711142c@ite.com.tw>
References: <20250318-fix-link-training-v1-0-19266711142c@ite.com.tw>
In-Reply-To: <20250318-fix-link-training-v1-0-19266711142c@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742286741; l=4987;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=54tlhkHj+pxYl9kznBsAM5796RL+l7b8tF/1hdi0qzs=;
 b=6Ufi3sY4ux/fi3DNJlhY4fWeqkVvrZyh04ZFIexYl1/oAEyLSsZ1Mq0F6R3vp3G07oSu6Ilzx
 QbcvAHm5QFUDlXxyFWbwBhAv3gw3NNgyBISHSaCc7PNDTwKKR2hkvqH
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

IT6505 supports HW link training which will write DPCD and check
training status automatically.

In the case that driver set link rate at 2.7G and HW fail to training,
it will change link configuration and try 1.65G. And this will cause
INT_VID_FIFO_ERROR triggered when link clock is changed.

When video error occurs, video logic is reset and link training restart,
this will cause endless auto link training.

Modify link auto training with disable INT_VID_FIFO_ERROR to avoid loop
and check INT_LINK_TRAIN_FAIL event to abort wait training done.

Since INT_LINK_TRAIN_FAIL is checked when auto training, it is remove
from  it6505_int_threaded_handler()

In order to reset HW link auto training state,
bits FORCE_RETRAIN and MANUAL_TRAIN at REG_TRAIN_CTRL1 must be set
at the same time.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 61 +++++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..dc1179c8338e27866f6adda4ef8fb2950336221b 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -821,7 +821,7 @@ static void it6505_int_mask_enable(struct it6505 *it6505)
 	it6505_write(it6505, INT_MASK_02, BIT(INT_AUX_CMD_FAIL) |
 		     BIT(INT_HDCP_KSV_CHECK) | BIT(INT_AUDIO_FIFO_ERROR));
 
-	it6505_write(it6505, INT_MASK_03, BIT(INT_LINK_TRAIN_FAIL) |
+	it6505_write(it6505, INT_MASK_03,
 		     BIT(INT_VID_FIFO_ERROR) | BIT(INT_IO_LATCH_FIFO_OVERFLOW));
 }
 
@@ -1800,30 +1800,62 @@ static void it6505_link_training_setup(struct it6505 *it6505)
 
 static bool it6505_link_start_auto_train(struct it6505 *it6505)
 {
-	int timeout = 500, link_training_state;
+	int link_training_state;
 	bool state = false;
+	struct device *dev = it6505->dev;
+	int int03;
+	unsigned long timeout;
+
+	guard(mutex)(&it6505->aux_lock);
+	/* Disable FIFO error interrupt trigger  */
+	/* to prevent training fail loop issue   */
+	it6505_set_bits(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR), 0);
+
+	it6505_write(it6505, INT_STATUS_03,
+		     BIT(INT_LINK_TRAIN_FAIL) | BIT(INT_VID_FIFO_ERROR));
+	int03 = it6505_read(it6505, INT_STATUS_03);
 
-	mutex_lock(&it6505->aux_lock);
 	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
 			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
-	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
+
+	/* reset link state machine and re start training*/
+	it6505_write(it6505, REG_TRAIN_CTRL1,
+		     FORCE_RETRAIN | MANUAL_TRAIN);
 	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
 
-	while (timeout > 0) {
+	timeout = jiffies + msecs_to_jiffies(100) + 1;
+	for (;;) {
 		usleep_range(1000, 2000);
 		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
+		int03 = it6505_read(it6505, INT_STATUS_03);
+		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
+			/* Ignore INT_VID_FIFO_ERROR when auto training fail*/
+			it6505_write(it6505, INT_STATUS_03,
+				     BIT(INT_LINK_TRAIN_FAIL) |
+				     BIT(INT_VID_FIFO_ERROR));
+
+			if (int03 & BIT(INT_VID_FIFO_ERROR)) {
+				DRM_DEV_DEBUG_DRIVER(dev,
+				"video fifo error when training fail (%x)!",
+				int03);
+			}
+
+			break;
+		}
 
 		if (link_training_state > 0 &&
 		    (link_training_state & LINK_STATE_NORP)) {
 			state = true;
-			goto unlock;
+			break;
 		}
 
-		timeout--;
+		if (time_after(jiffies, timeout))
+			break;
 	}
-unlock:
-	mutex_unlock(&it6505->aux_lock);
 
+	/* recover interrupt trigger*/
+	it6505_set_bits(it6505, INT_MASK_03,
+			BIT(INT_VID_FIFO_ERROR), BIT(INT_VID_FIFO_ERROR));
 	return state;
 }
 
@@ -2377,7 +2409,7 @@ static void it6505_stop_link_train(struct it6505 *it6505)
 {
 	it6505->link_state = LINK_IDLE;
 	cancel_work_sync(&it6505->link_works);
-	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
+	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN | MANUAL_TRAIN);
 }
 
 static void it6505_link_train_ok(struct it6505 *it6505)
@@ -2691,14 +2723,6 @@ static void it6505_irq_audio_fifo_error(struct it6505 *it6505)
 		it6505_enable_audio(it6505);
 }
 
-static void it6505_irq_link_train_fail(struct it6505 *it6505)
-{
-	struct device *dev = it6505->dev;
-
-	DRM_DEV_DEBUG_DRIVER(dev, "link training fail interrupt");
-	schedule_work(&it6505->link_works);
-}
-
 static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
 {
 	return 1 & (addr[bit / BITS_PER_BYTE] >> (bit % BITS_PER_BYTE));
@@ -2763,7 +2787,6 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 		{ BIT_INT_AUX_CMD_FAIL, it6505_irq_aux_cmd_fail },
 		{ BIT_INT_HDCP_KSV_CHECK, it6505_irq_hdcp_ksv_check },
 		{ BIT_INT_AUDIO_FIFO_ERROR, it6505_irq_audio_fifo_error },
-		{ BIT_INT_LINK_TRAIN_FAIL, it6505_irq_link_train_fail },
 	};
 	int int_status[3], i;
 

-- 
2.34.1


