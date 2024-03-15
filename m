Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD4887D72B
	for <lists+dri-devel@lfdr.de>; Sat, 16 Mar 2024 00:09:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591E4112697;
	Fri, 15 Mar 2024 23:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="KsbOkTNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CC7112697
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 23:09:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710544167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2Qeb73E854SLNNqpfgzZuZinTfxWG3SchDvt92uTCI=;
 b=KsbOkTNZiQeegFXVQDpqlUx8jkW8Z7Ir6x2ewKOI/CqJl/7WHHXmvqtOD63M5XhdZ1wOIl
 DZgfnKLuJS9QqhFmPbDKc6x874/8ClrrkRYiYl3uor0Hsyq+9vuNWNA8mq/V+LNmLZUgdh
 yPixMKOSoUVqdH8WGoTZ/mY3F1Gx1MQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/6] drm: zynqmp_dp: Adjust training values per-lane
Date: Fri, 15 Mar 2024 19:09:12 -0400
Message-Id: <20240315230916.1759060-3-sean.anderson@linux.dev>
In-Reply-To: <20240315230916.1759060-1-sean.anderson@linux.dev>
References: <20240315230916.1759060-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The feedback we get from the DPRX is per-lane. Make changes using this
information, instead of picking the maximum values from all lanes. This
results in more-consistent training on marginal links.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 98a32e6a0459..8635b5673386 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -605,28 +605,21 @@ static void zynqmp_dp_adjust_train(struct zynqmp_dp *dp,
 				   u8 link_status[DP_LINK_STATUS_SIZE])
 {
 	u8 *train_set = dp->train_set;
-	u8 voltage = 0, preemphasis = 0;
 	u8 i;
 
 	for (i = 0; i < dp->mode.lane_cnt; i++) {
-		u8 v = drm_dp_get_adjust_request_voltage(link_status, i);
-		u8 p = drm_dp_get_adjust_request_pre_emphasis(link_status, i);
+		u8 voltage = drm_dp_get_adjust_request_voltage(link_status, i);
+		u8 preemphasis =
+			drm_dp_get_adjust_request_pre_emphasis(link_status, i);
 
-		if (v > voltage)
-			voltage = v;
+		if (voltage >= DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
+			voltage |= DP_TRAIN_MAX_SWING_REACHED;
 
-		if (p > preemphasis)
-			preemphasis = p;
-	}
+		if (preemphasis >= DP_TRAIN_PRE_EMPH_LEVEL_2)
+			preemphasis |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
 
-	if (voltage >= DP_TRAIN_VOLTAGE_SWING_LEVEL_3)
-		voltage |= DP_TRAIN_MAX_SWING_REACHED;
-
-	if (preemphasis >= DP_TRAIN_PRE_EMPH_LEVEL_2)
-		preemphasis |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
-
-	for (i = 0; i < dp->mode.lane_cnt; i++)
 		train_set[i] = voltage | preemphasis;
+	}
 }
 
 /**
-- 
2.35.1.1320.gc452695387.dirty

