Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79703E3D92
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF35589915;
	Mon,  9 Aug 2021 01:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B512389907
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:05 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F41DE4A1;
 Mon,  9 Aug 2021 03:35:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472904;
 bh=gQCJFzVWn0RLpsvioDInpdPmM9+ptH6IlcC/BMUv1lI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ue1BkophShli9Zk52l6/1cTA2d0QimbCOkyaWZ2xuIqo5CiBk2IYPXHhDECRo8XWr
 fWz/yqYuwvDyuaU+ca11Bo2JrvJfNoc1J1DZpNCD1v9G2gxnnTJICAZ+2h26jUsRu5
 KgLcTet4HAQ9DnRa9VY5Sj0oKKR2mcJqcW8LmYfk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 02/36] drm: xlnx: zynqmp_dpsub: Switch to atomic encoder
 enable/disable
Date: Mon,  9 Aug 2021 04:34:23 +0300
Message-Id: <20210809013457.11266-3-laurent.pinchart@ideasonboard.com>
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

To prepare for the transition to the DRM bridge API, switch the encoder
operations to the atomic versions of .enable() and .disable(). This
doesn't cause any functional change by itself.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 6f588dc09ba6..ace9fc731bfe 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1399,7 +1399,8 @@ zynqmp_dp_connector_helper_funcs = {
  * DRM Encoder
  */
 
-static void zynqmp_dp_encoder_enable(struct drm_encoder *encoder)
+static void zynqmp_dp_encoder_atomic_enable(struct drm_encoder *encoder,
+					    struct drm_atomic_state *state)
 {
 	struct zynqmp_dp *dp = encoder_to_dp(encoder);
 	unsigned int i;
@@ -1431,7 +1432,8 @@ static void zynqmp_dp_encoder_enable(struct drm_encoder *encoder)
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
 }
 
-static void zynqmp_dp_encoder_disable(struct drm_encoder *encoder)
+static void zynqmp_dp_encoder_atomic_disable(struct drm_encoder *encoder,
+					     struct drm_atomic_state *state)
 {
 	struct zynqmp_dp *dp = encoder_to_dp(encoder);
 
@@ -1508,8 +1510,8 @@ zynqmp_dp_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs zynqmp_dp_encoder_helper_funcs = {
-	.enable			= zynqmp_dp_encoder_enable,
-	.disable		= zynqmp_dp_encoder_disable,
+	.atomic_enable		= zynqmp_dp_encoder_atomic_enable,
+	.atomic_disable		= zynqmp_dp_encoder_atomic_disable,
 	.atomic_mode_set	= zynqmp_dp_encoder_atomic_mode_set,
 	.atomic_check		= zynqmp_dp_encoder_atomic_check,
 };
-- 
Regards,

Laurent Pinchart

