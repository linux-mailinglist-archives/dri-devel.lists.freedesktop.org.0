Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A59A66E45
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:31:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDC610E20A;
	Tue, 18 Mar 2025 08:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g0aaKevn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E92510E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:31:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 35D08A48EAC;
 Tue, 18 Mar 2025 08:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D82BC4CEF1;
 Tue, 18 Mar 2025 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742286695;
 bh=4mDtKJNOvXzo04STzoLEDzk08HuB8UCxRKC60TOOa6c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=g0aaKevndOGgmTPrOCkH6A525jePLzpUn9JUu/XrlcW6XDxWnp1uI4GYaqmJ0djh4
 D+Ct5rg1OvVNkWZ+CY9YTRJrIkd2nbhXdH/0jlnfepLyxQpPve++reY25EKcpzOb/3
 /7cTh81j0rozyFpblAjDPKW2yH9AhWopF/V14nS9CbaZOwI1ibXseewfgExyGnSTui
 7gGDIfqYfwS9VY0mAzoVPECL5Fr2j3ruRANe5IDi22Q1Pum67IrZDqRuciBzzEwXur
 H0ITFyzIZjo0EmM8NVKjLBbp/d/FyXqP4bFXz2W30ib1KsKoDG2g2+a1915HEbC5Rq
 /7nSTT+LK7Y3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 363A0C282EC;
 Tue, 18 Mar 2025 08:31:35 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 18 Mar 2025 16:32:11 +0800
Subject: [PATCH RESEND 3/3] drm/bridge: it6505: skip auto training when
 previous try fail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-link-training-v1-3-19266711142c@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742286741; l=2801;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=JH5TB+6KMos7mGcxiEmqDSjWU1p596CHLwJaILJm+RQ=;
 b=S+EhrMyfHzLB4Mdct6UqU7bM+Y2qISVqUnQwr80nBAMU4i/KCs+97Mi6zRZOUYC2PykGospSR
 d5a4ditZcaCCeIxWaHLnKpvwn7E4Vl3741Wcbed/9EEBtb/QeWh2ph9
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

When connect to device which can only training done by
step training, skip auto training when link training restart,
usually happen when display resolution is changed.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 11231a642bbe185c4f36bf5f2a0b115fa056213b..730481a9446ff00a54ef70e86b4c28ff0a3f417e 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -468,6 +468,7 @@ struct it6505 {
 	struct work_struct hdcp_wait_ksv_list;
 	struct completion extcon_completion;
 	u8 auto_train_retry;
+	u8 step_train_only;
 	bool hdcp_desired;
 	bool is_repeater;
 	u8 hdcp_down_stream_count;
@@ -2459,11 +2460,13 @@ static void it6505_link_step_train_process(struct it6505 *it6505)
 				     ret ? "pass" : "failed", i + 1);
 		if (ret) {
 			it6505_link_train_ok(it6505);
+			it6505->step_train_only = true;
 			return;
 		}
 	}
 
 	DRM_DEV_DEBUG_DRIVER(dev, "training fail");
+	it6505->step_train_only = false;
 	it6505->link_state = LINK_IDLE;
 	it6505_video_reset(it6505);
 }
@@ -2479,21 +2482,23 @@ static void it6505_link_training_work(struct work_struct *work)
 
 	if (!it6505_get_sink_hpd_status(it6505))
 		return;
-
-	retry = it6505->auto_train_retry;
-	do {
-		it6505_link_training_setup(it6505);
-		it6505_reset_hdcp(it6505);
-		it6505_aux_reset(it6505);
-
-		ret = it6505_link_start_auto_train(it6505);
-		DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
-			     ret ? "pass" : "failed", it6505->auto_train_retry);
-		if (ret) {
-			it6505_link_train_ok(it6505);
-			return;
-		}
-	} while (retry--);
+	/* skip auto training if previous auto train is fail*/
+	if (!it6505->step_train_only) {
+		retry = it6505->auto_train_retry;
+		do {
+			it6505_link_training_setup(it6505);
+			it6505_reset_hdcp(it6505);
+			it6505_aux_reset(it6505);
+
+			ret = it6505_link_start_auto_train(it6505);
+			DRM_DEV_DEBUG_DRIVER(dev, "auto train %s, auto_train_retry: %d",
+				ret ? "pass" : "failed", it6505->auto_train_retry);
+			if (ret) {
+				it6505_link_train_ok(it6505);
+				return;
+			}
+		} while (retry--);
+	}
 
 	/*After HW auto training fail, try link training step by step*/
 	it6505_link_step_train_process(it6505);
@@ -2605,6 +2610,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 			it6505_parse_link_capabilities(it6505);
 		}
 		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
+		it6505->step_train_only = false;
 
 		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
 					     DP_SET_POWER_D0);

-- 
2.34.1


