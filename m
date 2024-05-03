Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10F8BB3FF
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 21:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F90E1131F5;
	Fri,  3 May 2024 19:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="d2SJ6rWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318E1131F5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 19:29:43 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714764581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8P24ppU8bQXf2ANSu1fjPc/dmWggy8kCrFAAgzwdOZA=;
 b=d2SJ6rWtB/AkRm8XP0h0EnEPy7AoRAg56jCh2HdZ6cprXxwPCmhP6sOUNLm3taXUG5Mpy+
 MJ2uZLJB4WaZZISf7g6UDPzlm/LzIayz43f0d5euB3yaTerVnexDIwYMBpDkVch/Znfxlu
 fNYUIenR7+nABcIgvD4DiDk1vam/uoQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v5 06/10] drm: zynqmp_dp: Convert to a hard IRQ
Date: Fri,  3 May 2024 15:29:18 -0400
Message-Id: <20240503192922.2172314-7-sean.anderson@linux.dev>
In-Reply-To: <20240503192922.2172314-1-sean.anderson@linux.dev>
References: <20240503192922.2172314-1-sean.anderson@linux.dev>
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
convert it to a hard IRQ.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

(no changes since v3)

Changes in v3:
- New

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index cec5711c7026..c9cdfb56f23e 100644
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
 
-- 
2.35.1.1320.gc452695387.dirty

