Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AA2B948BA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 08:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D0310E0AB;
	Tue, 23 Sep 2025 06:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eysGKJ+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD2410E56A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 06:23:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 308BF44CCC;
 Tue, 23 Sep 2025 06:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07BBBC16AAE;
 Tue, 23 Sep 2025 06:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758608599;
 bh=xyeGddU8HV7f9Dpf8HpwJptt9/1K5HGt8xU0CjdPxEo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=eysGKJ+Dif31eN5di0SzH+oLsEtzZB/QToH+b1p1N87ZED7fAfyLbIfXxSOLi/6Uk
 dx/222siDfJKNgZFpSX5Pj+E02qQrIlLcjuGMWU2e2khysL5N/YVn6Uce1sEwGylAf
 NJWXlgrZUd/3KHmS+fTN0wvBtaevF9AdpIbn51GP55Pm8YXwY0gEBjlg7dZd+9FJ0E
 KGk4dlU6pmhghtIiclJAStLoTZG/koBAN+AyO+tXTcNOpQGH3WkpHMvkS+ilOW+woO
 KB+L8TTJq/n9l07qonwMavHWfP/rRISP43HcS6+33G+2TVOcgn0VBrMvW0vn4I/9Rz
 DtCFHfw8ucXmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id F155ACAC5A7;
 Tue, 23 Sep 2025 06:23:18 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 23 Sep 2025 14:23:43 +0800
Subject: [PATCH v4 3/4] drm/bridge: it6505: modify DP link training work
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-fix-link-training-v4-3-7c18f5d3891e@ite.com.tw>
References: <20250923-fix-link-training-v4-0-7c18f5d3891e@ite.com.tw>
In-Reply-To: <20250923-fix-link-training-v4-0-7c18f5d3891e@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Allen Chen <allen.chen@ite.com.tw>, Hermes Wu <hermes.wu@ite.com.tw>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758608643; l=4440;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=aNgX8ku/g4Npw+XBkXl6a6rbjnMD1KIDhBrcFoowf7Q=;
 b=6iVQ3WRxt+eduB8Aurtfy0iGusCK+mvOmhDQaMiHl/MtO2YAKGgPSj8I1Xfrg0QQIRtYvRosp
 WeeGBqdS13uAbsu1YcQsIhxQNFvqz072WTmbo1PAspPMggcV5L+6+e3
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

The DP link training work start with auto training and after auto
training failed "AUTO_TRAIN_RETRY" times, it switch to step training
mode.

It will more efficiency that finish link tranining without re-schedule
train work when each training fail.

Drop auto_train_retry from it6505 structure, and it6505_dump() is remove
from link trainig work, it takes too much time to read all register area,
and is not necessary.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 40 ++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index f9b99c70789eea6beb3c6513155c9a4ca103d219..bff5f18fb5ae7192242308f034b60af9807c192c 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -467,7 +467,6 @@ struct it6505 {
 	struct delayed_work hdcp_work;
 	struct work_struct hdcp_wait_ksv_list;
 	struct completion extcon_completion;
-	u8 auto_train_retry;
 	bool hdcp_desired;
 	bool is_repeater;
 	u8 hdcp_down_stream_count;
@@ -666,7 +665,7 @@ static int it6505_get_dpcd(struct it6505 *it6505, int offset, u8 *dpcd, int num)
 	return 0;
 }
 
-static void it6505_dump(struct it6505 *it6505)
+static void __maybe_unused it6505_dump(struct it6505 *it6505)
 {
 	unsigned int i, j;
 	u8 regs[16];
@@ -1399,7 +1398,6 @@ static void it6505_variable_config(struct it6505 *it6505)
 	it6505->lane_count = MAX_LANE_COUNT;
 	it6505->link_state = LINK_IDLE;
 	it6505->hdcp_desired = HDCP_DESIRED;
-	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 	it6505->audio.select = AUDIO_SELECT;
 	it6505->audio.sample_rate = AUDIO_SAMPLE_RATE;
 	it6505->audio.channel_count = AUDIO_CHANNEL_COUNT;
@@ -2467,7 +2465,7 @@ static void it6505_link_training_work(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505, link_works);
 	struct device *dev = it6505->dev;
-	int ret;
+	int ret, retry;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count: %d",
 			     it6505->sink_count);
@@ -2475,27 +2473,22 @@ static void it6505_link_training_work(struct work_struct *work)
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
-
-	ret = it6505_link_start_auto_train(it6505);
-	DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
-			     ret ? "pass" : "failed", it6505->auto_train_retry);
+	for (retry = AUTO_TRAIN_RETRY; retry > 0; retry--) {
+		it6505_link_training_setup(it6505);
+		it6505_reset_hdcp(it6505);
+		it6505_aux_reset(it6505);
 
-	if (ret) {
-		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
-		it6505_link_train_ok(it6505);
-	} else {
-		it6505->auto_train_retry--;
-		it6505_dump(it6505);
+		ret = it6505_link_start_auto_train(it6505);
+		DRM_DEV_DEBUG_DRIVER(dev, "auto train %s,",
+				     ret ? "pass" : "failed");
+		if (ret) {
+			it6505_link_train_ok(it6505);
+			return;
+		}
 	}
 
+	/*After HW auto training fail, try link training step by step*/
+	it6505_link_step_train_process(it6505);
 }
 
 static void it6505_plugged_status_to_codec(struct it6505 *it6505)
@@ -2576,7 +2569,6 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
 			     (int)ARRAY_SIZE(link_status), link_status);
 
 	if (!drm_dp_channel_eq_ok(link_status, it6505->lane_count)) {
-		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 		it6505_video_reset(it6505);
 	}
 
@@ -2602,7 +2594,6 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 			it6505_variable_config(it6505);
 			it6505_parse_link_capabilities(it6505);
 		}
-		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 
 		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
 					     DP_SET_POWER_D0);
@@ -2739,7 +2730,6 @@ static void it6505_irq_video_handler(struct it6505 *it6505, const int *int_statu
 			     (unsigned int *)int_status)) ||
 	    (it6505_test_bit(BIT_INT_VID_FIFO_ERROR,
 			     (unsigned int *)int_status))) {
-		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 		flush_work(&it6505->link_works);
 		it6505_stop_hdcp(it6505);
 		it6505_video_reset(it6505);

-- 
2.34.1


