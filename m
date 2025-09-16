Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18FB58CF5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 06:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2C110E0F4;
	Tue, 16 Sep 2025 04:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h+mmapbN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5376F10E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:47:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8B31444D3;
 Tue, 16 Sep 2025 04:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFE75C4CEF7;
 Tue, 16 Sep 2025 04:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757998063;
 bh=zEgF7zl+qaVDn5TiUTBaHD0fanWnAVJNnO4sgNc2+7E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=h+mmapbNiV0c6avSZsCWxHHzQglVJcd8Un5UG9q1kIXggnsYq+CpA0c7q4WrXy6CY
 +EKjnXdn9Q525Fgu/vpPXAWQHeQvbQSV5uFN5+rp6hfebTlCVCMowjXGno43FYRTZE
 6r4lTSSfMTMm6AfIHkNWG0B0jNwXuYjdgq6N8ydRN3UWQTT+3+9wlxppBbnQ5vjXs9
 JFAeuxWSUSyjXRGVJ44D8AMhcZI17HB5kUOE50pNgai3fDdLyRuqbtc0zzKJYW+gYL
 qNzFnd2Cf8nLkKE6zTjU9mtH0wKRzmbXYkuGKDsWrgoncQHqMQDVGmaQ7Q5s2CFSF8
 hG6Q4+7IHYx1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B0E0CCAC592;
 Tue, 16 Sep 2025 04:47:43 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 16 Sep 2025 12:47:41 +0800
Subject: [PATCH RESEND v3 1/5] drm/bridge: it6505: fix link training state
 HW register reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-fix-link-training-v3-1-0f55bfdb272a@ite.com.tw>
References: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
In-Reply-To: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757998107; l=1768;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=L0iJ7cK8igir/+LkaX0VG1u/Z4JkZspdyQ1kUW040to=;
 b=qiDOEQ6FjWuN8gXvTTOIszAJR4zUYvTqBqa/Xyxjd2g2r8MStb5O8B50VGA64jiyuABeZpYil
 /XJvzLR8TFyD/Db5cwHhe4L/F2nmvnRyMYmyvf1R6aODzv8Wk0xX88P
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

When connect to a DP-to-HDMI device which does not connect
to HDMI sink, it will report DPCD 00200h with SINK_COUNT = "0",
and issue HPD_IRQ when SINK_COUNT change to "1".

IT6505 can not recive HPD_IRQ before training done and driver will
force HW enter training done state when connect to such devices.

When HW is force to training done state and restart link training,
bits FORCE_RETRAIN and MANUAL_TRAIN at REG_TRAIN_CTRL1 must be set
at the same time to reset HW state.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..b47042dc06bb1e1dfd92bc0dc6d69dc918a140ba 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -1806,7 +1806,9 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
 	mutex_lock(&it6505->aux_lock);
 	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
 			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
-	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
+	/* reset link state machine and re start training*/
+	it6505_write(it6505, REG_TRAIN_CTRL1,
+		     FORCE_RETRAIN | MANUAL_TRAIN);
 	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
 
 	while (timeout > 0) {
@@ -2377,7 +2379,7 @@ static void it6505_stop_link_train(struct it6505 *it6505)
 {
 	it6505->link_state = LINK_IDLE;
 	cancel_work_sync(&it6505->link_works);
-	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
+	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN | MANUAL_TRAIN);
 }
 
 static void it6505_link_train_ok(struct it6505 *it6505)

-- 
2.34.1


