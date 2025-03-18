Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7814A66A8C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 07:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1993610E065;
	Tue, 18 Mar 2025 06:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="jrVtI4od";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2634810E065
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 06:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=i6T2F
 0eCFThv3okYLkbuNB4j1ShIXzAcksGCUbz1o6U=; b=jrVtI4odp1oVxAZOXMstF
 n7ndha7qW9yoELihPWOo/V5QqJ0x1wmq+J5sz4AMsVoNPHxsFp4S2JxFBOtVmPNK
 cQ6Q3IwcWlodhLAta6MatmeAf/SBGhNQeHp6Hudm8emUAVS4Z3ySz0yaQJyUyQ2d
 nAhwxUIlthgDnLVasPQSwM=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id
 _____wDnnuYSFNlnP+WyAA--.9231S6; 
 Tue, 18 Mar 2025 14:35:05 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 5/5] drm/bridge: it6505: Switch to common helpers to power
 up/down dp link
Date: Tue, 18 Mar 2025 14:34:39 +0800
Message-ID: <20250318063452.4983-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250318063452.4983-1-andyshrk@163.com>
References: <20250318063452.4983-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnnuYSFNlnP+WyAA--.9231S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw18JF47GFy3AFyDWFWxJFb_yoW5urWfpr
 43X345JwsYqrW7Xw1vyr1xZFsxA3ZrJrZ5JrW7Gw40v3WUX398CayjvwnxGFyUAFyUGr1Y
 vrnF9F1xGF1Ikr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4ksDUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAQUXmfZDcXVzgAAsL
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

From: Andy Yan <andy.yan@rock-chips.com>

Use the common dp link power up/down helpers to avoid duplicating code.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ite-it6505.c | 46 +++--------------------------
 1 file changed, 4 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 8a607558ac89..b05fc82bb667 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -771,40 +771,6 @@ static void it6505_calc_video_info(struct it6505 *it6505)
 			     DRM_MODE_ARG(&it6505->video_info));
 }
 
-static int it6505_drm_dp_link_set_power(struct drm_dp_aux *aux,
-					struct it6505_drm_dp_link *link,
-					u8 mode)
-{
-	u8 value;
-	int err;
-
-	/* DP_SET_POWER register is only available on DPCD v1.1 and later */
-	if (link->revision < DPCD_V_1_1)
-		return 0;
-
-	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
-	if (err < 0)
-		return err;
-
-	value &= ~DP_SET_POWER_MASK;
-	value |= mode;
-
-	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
-	if (err < 0)
-		return err;
-
-	if (mode == DP_SET_POWER_D0) {
-		/*
-		 * According to the DP 1.1 specification, a "Sink Device must
-		 * exit the power saving state within 1 ms" (Section 2.5.3.1,
-		 * Table 5-52, "Sink Control Field" (register 0x600).
-		 */
-		usleep_range(1000, 2000);
-	}
-
-	return 0;
-}
-
 static void it6505_clear_int(struct it6505 *it6505)
 {
 	it6505_write(it6505, INT_STATUS_01, 0xFF);
@@ -2578,8 +2544,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 		}
 		it6505->auto_train_retry = AUTO_TRAIN_RETRY;
 
-		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-					     DP_SET_POWER_D0);
+		drm_dp_link_power_up(&it6505->aux, it6505->link.revision);
 		dp_sink_count = it6505_dpcd_read(it6505, DP_SINK_COUNT);
 		it6505->sink_count = DP_GET_SINK_COUNT(dp_sink_count);
 
@@ -2910,8 +2875,7 @@ static enum drm_connector_status it6505_detect(struct it6505 *it6505)
 	}
 
 	if (it6505->hpd_state) {
-		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-					     DP_SET_POWER_D0);
+		drm_dp_link_power_up(&it6505->aux, it6505->link.revision);
 		dp_sink_count = it6505_dpcd_read(it6505, DP_SINK_COUNT);
 		it6505->sink_count = DP_GET_SINK_COUNT(dp_sink_count);
 		DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count:%d branch:%d",
@@ -3233,8 +3197,7 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 	it6505_int_mask_enable(it6505);
 	it6505_video_reset(it6505);
 
-	it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-				     DP_SET_POWER_D0);
+	drm_dp_link_power_up(&it6505->aux, it6505->link.revision);
 }
 
 static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -3246,8 +3209,7 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
 	if (it6505->powered) {
-		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-					     DP_SET_POWER_D3);
+		drm_dp_link_power_down(&it6505->aux, it6505->link.revision);
 		it6505_video_disable(it6505);
 	}
 }
-- 
2.43.0

