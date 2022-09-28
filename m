Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C45EE9A0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1810110E769;
	Wed, 28 Sep 2022 22:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4776F10E097
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABCBD6DB;
 Thu, 29 Sep 2022 00:47:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405244;
 bh=xY8xaqnOIG3cCR6iAGnBjrw+7G8XLHde7y73yvo9nic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mt78pNfsG8VrudyXwoZOpdggAvLSqN1zF1sWLbZiAFlleD3eowfUlCbS1bJFeSxoo
 f1UkevZWVfBmCxpj2tcybF1xChlEL6+kpop93fvaa85W7I7uF+6GDO8gUsdXrdPJA/
 lBTQdIPOM1tE5LsA6BPU5DOmn+RHcqc5Ai97l6a8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/37] drm: xlnx: zynqmp_dpsub: Switch to atomic encoder
 enable/disable
Date: Thu, 29 Sep 2022 01:46:44 +0300
Message-Id: <20220928224719.3291-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
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
index d14612b34796..10e469c92e73 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1400,7 +1400,8 @@ zynqmp_dp_connector_helper_funcs = {
  * DRM Encoder
  */
 
-static void zynqmp_dp_encoder_enable(struct drm_encoder *encoder)
+static void zynqmp_dp_encoder_atomic_enable(struct drm_encoder *encoder,
+					    struct drm_atomic_state *state)
 {
 	struct zynqmp_dp *dp = encoder_to_dp(encoder);
 	unsigned int i;
@@ -1432,7 +1433,8 @@ static void zynqmp_dp_encoder_enable(struct drm_encoder *encoder)
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
 }
 
-static void zynqmp_dp_encoder_disable(struct drm_encoder *encoder)
+static void zynqmp_dp_encoder_atomic_disable(struct drm_encoder *encoder,
+					     struct drm_atomic_state *state)
 {
 	struct zynqmp_dp *dp = encoder_to_dp(encoder);
 
@@ -1509,8 +1511,8 @@ zynqmp_dp_encoder_atomic_check(struct drm_encoder *encoder,
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

