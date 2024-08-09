Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CA894D75F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 21:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B8810E9F1;
	Fri,  9 Aug 2024 19:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="uWKfHF9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477C910E9F1
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 19:36:29 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1723232187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikxIScfUv2b8NNW6uDWKv1jhmd4Ojs4CUAXyBEP9cr8=;
 b=uWKfHF9mVEROSGlYuIMLMnFyS6kri9nglPKCWfrbBwWpFSwEM7iYXO4wMBRQcHqbUt/0cR
 UJpVlHY3xm542SqnzkYKUqs54yK+wBiHOdqCOXmBivciW9YX+8tzhFJvsx+oBb7/kt7fRj
 xFCnCUQXZPA/ntcwW2I20Q4BG1f8oWI=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v6 4/8] drm: zynqmp_dp: Convert to a hard IRQ
Date: Fri,  9 Aug 2024 15:35:56 -0400
Message-Id: <20240809193600.3360015-5-sean.anderson@linux.dev>
In-Reply-To: <20240809193600.3360015-1-sean.anderson@linux.dev>
References: <20240809193600.3360015-1-sean.anderson@linux.dev>
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

Now that all of the sleeping work is done outside of the IRQ, we can
convert it to a hard IRQ. Shared IRQs may be triggered even after
calling disable_irq, so use free_irq instead which removes our callback
altogether.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v6:
- Fix hang upon driver removal

Changes in v3:
- New

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index cec5711c7026..532e103713b3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1831,9 +1831,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	 * Now that the hardware is initialized and won't generate spurious
 	 * interrupts, request the IRQ.
 	 */
-	ret = devm_request_threaded_irq(dp->dev, dp->irq, NULL,
-					zynqmp_dp_irq_handler, IRQF_ONESHOT,
-					dev_name(dp->dev), dp);
+	ret = devm_request_irq(dp->dev, dp->irq, zynqmp_dp_irq_handler,
+			       IRQF_SHARED, dev_name(dp->dev), dp);
 	if (ret < 0)
 		goto err_phy_exit;
 
@@ -1858,7 +1857,7 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 	struct zynqmp_dp *dp = dpsub->dp;
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_DS, ZYNQMP_DP_INT_ALL);
-	disable_irq(dp->irq);
+	devm_free_irq(dp->dev, dp->irq, dp);
 
 	cancel_work_sync(&dp->hpd_irq_work);
 	cancel_work_sync(&dp->hpd_work);
-- 
2.35.1.1320.gc452695387.dirty

