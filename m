Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2BA1AE8C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 03:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A237510E819;
	Fri, 24 Jan 2025 02:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GyRfj3Md";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6909710E05C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 02:29:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E1935A41670;
 Fri, 24 Jan 2025 02:27:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA7AEC4CEDF;
 Fri, 24 Jan 2025 02:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737685764;
 bh=XjpJATAQwVIRHRXGlMiNdqzLMiErwOFwlEhNbhbQjwo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=GyRfj3Md0gpTxYWswN+fkyzY++ZBWi5yqvhmPQherIu5MouSaIEela0X3C0PcsTiR
 6yUiQ+xjh7ejMe4aZsXJH/wi7Laz8d13j2tf/SdV/Kj+jPcA8LvhUqxa1NvADzWj5P
 Ii270V7fYr+bnjg3GLwm3HJu/TXNz2lM6B4hQoR7W4ENyKz8c6F4FXpIkoyqJXK0Yz
 E/xKjmmW83Cu7YsPAqHR8Tk7IDrCvcatUEQJWZf6mri4tMuMMm0qq83q1W4jdFlA9c
 SlrnJCX8kDUHIBGGWJVfq8UQmiP5SFEzlxXNCPRu/b3may/K4rJA7MA6Ax4MeqMa1l
 3JhQG31xYP1Mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE86C02182;
 Fri, 24 Jan 2025 02:29:24 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Fri, 24 Jan 2025 10:29:51 +0800
Subject: [PATCH 2/3] drm/bridge: it6505: modify DP link training work
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-fix-link-training-v1-2-09511050bb2c@ite.com.tw>
References: <20250124-fix-link-training-v1-0-09511050bb2c@ite.com.tw>
In-Reply-To: <20250124-fix-link-training-v1-0-09511050bb2c@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737685792; l=2681;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=llpaVHPsyMc2Qs3dtoETLe0MUHFLEKcOWtYQxLf0olo=;
 b=iamjb+1HL6+R3IgsZnzUNIm69ju78BBQPKPnYPhakuDe2N42U4MP2ML4bbyw9+xJ8PiqvX9nG
 ghR273mWvJuCsjGHrxsoabjbgyMkaiL/L/WHzxh7dmAMKptOIbQT9/4
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

The DP link training work include auto training and after
auto training failed "auto_train_retry" times, it switch to
step training mode.

It will more efficiency that finish link auto training,
include retry, and step training in a work, rather than
re-schedule train work when each training fail.

it6505_dump() is remove from link trainig work, it takes too much
time to read all register area, and is not necessary.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index dc1179c8338e27866f6adda4ef8fb2950336221b..11231a642bbe185c4f36bf5f2a0b115fa056213b 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -666,7 +666,7 @@ static int it6505_get_dpcd(struct it6505 *it6505, int offset, u8 *dpcd, int num)
 	return 0;
 }
 
-static void it6505_dump(struct it6505 *it6505)
+static void __maybe_unused it6505_dump(struct it6505 *it6505)
 {
 	unsigned int i, j;
 	u8 regs[16];
@@ -2472,7 +2472,7 @@ static void it6505_link_training_work(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505, link_works);
 	struct device *dev = it6505->dev;
-	int ret;
+	int ret, retry;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count: %d",
 			     it6505->sink_count);
@@ -2480,26 +2480,23 @@ static void it6505_link_training_work(struct work_struct *work)
 	if (!it6505_get_sink_hpd_status(it6505))
 		return;
 
-	it6505_link_training_setup(it6505);
-	it6505_reset_hdcp(it6505);
-	it6505_aux_reset(it6505);
-
-	if (it6505->auto_train_retry < 1) {
-		it6505_link_step_train_process(it6505);
-		return;
-	}
+	retry = it6505->auto_train_retry;
+	do {
+		it6505_link_training_setup(it6505);
+		it6505_reset_hdcp(it6505);
+		it6505_aux_reset(it6505);
 
-	ret = it6505_link_start_auto_train(it6505);
-	DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
+		ret = it6505_link_start_auto_train(it6505);
+		DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
 			     ret ? "pass" : "failed", it6505->auto_train_retry);
+		if (ret) {
+			it6505_link_train_ok(it6505);
+			return;
+		}
+	} while (retry--);
 
-	if (ret) {
-		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-		it6505_link_train_ok(it6505);
-	} else {
-		it6505->auto_train_retry--;
-		it6505_dump(it6505);
-	}
+	/*After HW auto training fail, try link training step by step*/
+	it6505_link_step_train_process(it6505);
 
 }
 

-- 
2.34.1


