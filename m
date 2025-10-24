Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67AC07E47
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 21:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BCB10EB30;
	Fri, 24 Oct 2025 19:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="mbJ0Rthd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Fri, 24 Oct 2025 19:22:48 UTC
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558ED10E224
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 19:22:48 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1761333450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/WrJTDCbjNqXN4i/GaEE8YS8TrIdiKbp038ohCvnOc=;
 b=mbJ0Rthd8AZmKwRv4lef9+aiFolHMxkakI/npPVUBOcdu5mv3ZdxWpri4dgUt8bypW4ZmE
 /3Mf/6SQexFCGTYD14HR6yvlhqn346ZxnpBUN2yvc0B69L2ZLiJietvjeVu8kd+VHSyHNO
 xT/I56yWliOPzOhsz48RpLTziZGHHJQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/3] drm: zynqmp_dp: Use smp_load/store for status
Date: Fri, 24 Oct 2025 15:17:06 -0400
Message-Id: <20251024191707.2310589-3-sean.anderson@linux.dev>
In-Reply-To: <20251024191707.2310589-1-sean.anderson@linux.dev>
References: <20251024191707.2310589-1-sean.anderson@linux.dev>
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

dp->status is read asynchronously by the AUX bus. Therefore, all reads
outside of dp->lock must be atomic. Similarly, writes must be atomic as
well. Reads with dp->lock held do not need to be atomic.

Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index f39c78b08e6a..caf2e0ce3644 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1111,7 +1111,7 @@ zynqmp_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *msg)
 			return msg->size;
 		}
 
-		if (dp->status == connector_status_disconnected) {
+		if (READ_ONCE(dp->status) == connector_status_disconnected) {
 			dev_dbg(dp->dev, "no connected aux device\n");
 			if (dp->ignore_aux_errors)
 				goto fake_response;
@@ -1697,7 +1697,7 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 	}
 
 	if (state & ZYNQMP_DP_INTERRUPT_SIGNAL_STATE_HPD) {
-		dp->status = connector_status_connected;
+		WRITE_ONCE(dp->status, connector_status_connected);
 		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
 				       sizeof(dp->dpcd));
 		if (ret < 0) {
@@ -1716,7 +1716,7 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 	}
 
 disconnected:
-	dp->status = connector_status_disconnected;
+	WRITE_ONCE(dp->status, connector_status_disconnected);
 	return connector_status_disconnected;
 }
 
-- 
2.35.1.1320.gc452695387.dirty

