Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E23E3D9A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA738991E;
	Mon,  9 Aug 2021 01:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B1A898FD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:07 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 465BFE51;
 Mon,  9 Aug 2021 03:35:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472905;
 bh=t9DyjkYc0yDdW0keUqMrGrkVfbgzyaFIDCmqOELwgDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YHrfjCx8LC1fmvf4uzWyLuMa1EDWvfr6Nkwejmn3da69e92ilZAYaBsIZlMGiCkjQ
 ToZ62TKOZ1ZsQth3dRqJHda8eZvmR6rJPbMqVam8zGzWeZRq+tWt/75AM+9Saw3ygq
 2XoitnW6iGJ9VVVhvr/mK8UjNrCwfCuKFcm5OdTs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 05/36] drm: xlnx: zynqmp_dpsub: Don't access connector in
 zynqmp_dp_set_format()
Date: Mon,  9 Aug 2021 04:34:26 +0300
Message-Id: <20210809013457.11266-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

To prepare for the removal of the connector from the DP encoder, pass
the display info pointer to the zynqmp_dp_set_format() function instead
of accessing the connector internally. The display info is NULL when the
function is called at initialization time, as we have no display info at
that point. This doesn't change the existing behaviour, given that the
zynqmp_dp_set_format() was already handling this as a special case (the
display info isn't initialized at init time and is all zeroes).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 2c82a5fbd43a..689ac157381b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1108,6 +1108,7 @@ static void zynqmp_dp_update_misc(struct zynqmp_dp *dp)
 /**
  * zynqmp_dp_set_format - Set the input format
  * @dp: DisplayPort IP core structure
+ * @info: Display info
  * @format: input format
  * @bpc: bits per component
  *
@@ -1116,10 +1117,10 @@ static void zynqmp_dp_update_misc(struct zynqmp_dp *dp)
  * Return: 0 on success, or -EINVAL.
  */
 static int zynqmp_dp_set_format(struct zynqmp_dp *dp,
+				const struct drm_display_info *info,
 				enum zynqmp_dpsub_format format,
 				unsigned int bpc)
 {
-	static const struct drm_display_info *display;
 	struct zynqmp_dp_config *config = &dp->config;
 	unsigned int num_colors;
 
@@ -1152,12 +1153,11 @@ static int zynqmp_dp_set_format(struct zynqmp_dp *dp,
 		return -EINVAL;
 	}
 
-	display = &dp->connector.display_info;
-	if (display->bpc && bpc > display->bpc) {
+	if (info && info->bpc && bpc > info->bpc) {
 		dev_warn(dp->dev,
 			 "downgrading requested %ubpc to display limit %ubpc\n",
-			 bpc, display->bpc);
-		bpc = display->bpc;
+			 bpc, info->bpc);
+		bpc = info->bpc;
 	}
 
 	config->misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_BPC_MASK;
@@ -1352,7 +1352,8 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	adjusted_mode = &crtc_state->adjusted_mode;
 	mode = &crtc_state->mode;
 
-	zynqmp_dp_set_format(dp, ZYNQMP_DPSUB_FORMAT_RGB, 8);
+	zynqmp_dp_set_format(dp, &connector->display_info,
+			     ZYNQMP_DPSUB_FORMAT_RGB, 8);
 
 	/* Check again as bpp or format might have been changed */
 	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
@@ -1713,7 +1714,7 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 	int ret;
 
 	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
-	zynqmp_dp_set_format(dp, ZYNQMP_DPSUB_FORMAT_RGB, 8);
+	zynqmp_dp_set_format(dp, NULL, ZYNQMP_DPSUB_FORMAT_RGB, 8);
 
 	/*
 	 * Initialize the bridge. Setting the device and encoder manually is a
-- 
Regards,

Laurent Pinchart

