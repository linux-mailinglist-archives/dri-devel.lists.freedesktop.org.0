Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A76A775B2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 09:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EB310E506;
	Tue,  1 Apr 2025 07:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QqLjUpJv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A32310E505
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 07:54:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBCE25C5D7C;
 Tue,  1 Apr 2025 07:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39BBCC4CEF2;
 Tue,  1 Apr 2025 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743494050;
 bh=vT4jRgNOKJGO9pduYqW5rUZpbUZTqMnVAbx3caTHA90=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=QqLjUpJvE5s0SFwg8TJvnHqnkS7TQczHFNxaHuehfPryP9P6J2XuwKHanHvPCCGFU
 ti1r2ELWxvDM8ZFzsIkIN5uRro5U3Sg7e11/EeBtjmrvmDzj0fPPm2k+4HYL9pMwwb
 5bYruitnqBCGpm9eNUxRd++17hFKF+LCVydvHCxvxOY8lZVN/ALc//rtnriEhSN8NX
 aTPyoDdD41I7Mb6IxIcKuJul7mBIPSsJ8KWjPBTzFWOFi5nXl0LjTz1b1SubS7cm9u
 3tn4yZvtXvhpolDAWjcidm47AsfFKFU70APDEeJnY2l4IK9b3vwWr+1NE+akov2Qfi
 SNGkxp9KuY+iA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAE7C3601B;
 Tue,  1 Apr 2025 07:54:10 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 01 Apr 2025 15:54:59 +0800
Subject: [PATCH v3 5/5] drm/bridge: it6505: skip auto training when
 previous try fail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-fix-link-training-v3-5-7f60f2ab7b8c@ite.com.tw>
References: <20250401-fix-link-training-v3-0-7f60f2ab7b8c@ite.com.tw>
In-Reply-To: <20250401-fix-link-training-v3-0-7f60f2ab7b8c@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743494115; l=2181;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=pLytI76dbGjTNwcbsSYeds6mdd5OwXNWVjluMga6s9U=;
 b=/X99IPetbCEwIR1q+Ajr1KcC/09HBieAhusGSzoYAK31L/t1UfHriUum+ulkhUf7gl8LScrJK
 duXPmvUbbQ5B5WfUxot92UU4RgJYr0UhgNFn6YIUffkey4oNQ7261NM
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
 drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index bff5f18fb5ae7192242308f034b60af9807c192c..20eae23cb46a4cb3fc18dd2ed3b764f2265262ca 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -467,6 +467,7 @@ struct it6505 {
 	struct delayed_work hdcp_work;
 	struct work_struct hdcp_wait_ksv_list;
 	struct completion extcon_completion;
+	u8 step_train_only;
 	bool hdcp_desired;
 	bool is_repeater;
 	u8 hdcp_down_stream_count;
@@ -2452,11 +2453,13 @@ static void it6505_link_step_train_process(struct it6505 *it6505)
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
@@ -2473,14 +2476,14 @@ static void it6505_link_training_work(struct work_struct *work)
 	if (!it6505_get_sink_hpd_status(it6505))
 		return;
 
-	for (retry = AUTO_TRAIN_RETRY; retry > 0; retry--) {
+	for (retry = AUTO_TRAIN_RETRY; retry > 0 && !it6505->step_train_only; retry--) {
 		it6505_link_training_setup(it6505);
 		it6505_reset_hdcp(it6505);
 		it6505_aux_reset(it6505);
 
 		ret = it6505_link_start_auto_train(it6505);
 		DRM_DEV_DEBUG_DRIVER(dev, "auto train %s,",
-				     ret ? "pass" : "failed");
+					ret ? "pass" : "failed");
 		if (ret) {
 			it6505_link_train_ok(it6505);
 			return;
@@ -2594,6 +2597,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 			it6505_variable_config(it6505);
 			it6505_parse_link_capabilities(it6505);
 		}
+		it6505->step_train_only = false;
 
 		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
 					     DP_SET_POWER_D0);

-- 
2.34.1


