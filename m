Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921E88076C
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 23:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4CF10F7F7;
	Tue, 19 Mar 2024 22:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="seV259zX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AD810F6CF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 22:51:46 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710888704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22MOrFn6Jv82M2hVwDO7x3NptrRxbkjYXXxqCJWSeQI=;
 b=seV259zXIx8RJKOwI0MDotOAEjzP+juNH/bWlbGRbh6ap4CtCnQrsUaDJ0ZK1LsqzBNAjV
 6R1oP+eSNpNZLP01oqbjLCeskK14c85TKt04yQs3Ty35D1obgsbYQjK5Kf7tzGpZDZXMIB
 NJlDPtthqS4EwUN/yPCjp9AFNyIC8WU=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 4/8] drm: zynqmp_dp: Rearrange zynqmp_dp for better padding
Date: Tue, 19 Mar 2024 18:51:17 -0400
Message-Id: <20240319225122.3048400-5-sean.anderson@linux.dev>
In-Reply-To: <20240319225122.3048400-1-sean.anderson@linux.dev>
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
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

Sort the members of struct zynqmp_dp to reduce padding necessary for
alignment.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 8635b5673386..f1834c8e3c02 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -255,10 +255,10 @@ struct zynqmp_dp_link_config {
  * @fmt: format identifier string
  */
 struct zynqmp_dp_mode {
-	u8 bw_code;
-	u8 lane_cnt;
-	int pclock;
 	const char *fmt;
+	int pclock;
+	u8 bw_code;
+	u8 lane_cnt;
 };
 
 /**
@@ -295,27 +295,27 @@ struct zynqmp_dp_config {
  * @train_set: set of training data
  */
 struct zynqmp_dp {
+	struct drm_dp_aux aux;
+	struct drm_bridge bridge;
+	struct delayed_work hpd_work;
+
+	struct drm_bridge *next_bridge;
 	struct device *dev;
 	struct zynqmp_dpsub *dpsub;
 	void __iomem *iomem;
 	struct reset_control *reset;
-	int irq;
-
-	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
-
-	struct zynqmp_dp_config config;
-	struct drm_dp_aux aux;
 	struct phy *phy[ZYNQMP_DP_MAX_LANES];
-	u8 num_lanes;
-	struct delayed_work hpd_work;
+
 	enum drm_connector_status status;
+	int irq;
 	bool enabled;
 
-	u8 dpcd[DP_RECEIVER_CAP_SIZE];
-	struct zynqmp_dp_link_config link_config;
 	struct zynqmp_dp_mode mode;
+	struct zynqmp_dp_link_config link_config;
+	struct zynqmp_dp_config config;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	u8 train_set[ZYNQMP_DP_MAX_LANES];
+	u8 num_lanes;
 };
 
 static inline struct zynqmp_dp *bridge_to_dp(struct drm_bridge *bridge)
-- 
2.35.1.1320.gc452695387.dirty

