Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04997879004
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EDD112525;
	Tue, 12 Mar 2024 08:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UrKSoBLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA69112525
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:51:58 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 886C4593;
 Tue, 12 Mar 2024 09:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710233495;
 bh=RfrIGaUBPnbxtPJtTaj/4+KTrkxzufzY4u5uqIdEyU8=;
 h=From:Date:Subject:To:Cc:From;
 b=UrKSoBLkxrE3FL9dpcS1/wHgC4DMquLE+rPATQL4ge5BOqKV2hNh8smPFer0IFw8I
 oMwI5pAwt/1UhUTSDFvHTXS2Rkqne8Z6I7vjXyrELiO8rxVZzArKnReOQJwYT0n4K5
 8naEIg2TA1BVItx70DEVlYfbsU0nGnCpqeI5tapI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 12 Mar 2024 10:51:15 +0200
Subject: [PATCH] drm: xlnx: zynqmp_dpsub: Fix missing drm_bridge_add() call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-xilinx-dp-lock-fix-v1-1-1698f9f03bac@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAIIX8GUC/x2MWwqAIBAArxL73UI+qOgq0YfaWkuhoRBCdPekz
 xmYeSBTYsowNQ8kujlzDBVE24DbTdgIea0MspO6U0Ji4ZNDwfXCM7oDPRd0vh+9VmawxkINr0R
 V/9N5ed8Pcj6vNGQAAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=RfrIGaUBPnbxtPJtTaj/4+KTrkxzufzY4u5uqIdEyU8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBl8BerpDiidFHriMiQ8qBqGpJ/sDPilBS3NJYJG
 asciSzP70WJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZfAXqwAKCRD6PaqMvJYe
 9XhqD/4t9ODyal7897NogGZr9Qx6/BNvtuh6yDE22u9RP2D5IXxBkS+ZV2g2WrXcA1rbmBMMbhu
 AOoG7h9mMHSN/DpJA0pp4CWfIDKjjab12seg+YE8WeDWGLsQ/k2xHyvT2fGAIibAhDbrk86DbAd
 alu8NqJjZPjwR3GF1icpdIrlfgzony8SsFHMTFrEtDzJ1EQLH0bjJQCFOaOKpXJxNsgXXaJqwuq
 YZOHZ7XJjEORV5NOALJHtfqbex6Lybin0GpHcE+Yh87H01klt3NxLbSj+506N5l4q79eBZJljXP
 QKSmhMHr/U+ogKiGA+P9Xl4pKemmwyeobrj34Am3dS4V/DCqL6wWUjVfjbboEvv3H8mJ7myj9Gc
 aTVfmfXGPbP1FC+HLHLsDIwNc2VKncRJndl7CSQvlBfnqO3Md1wV1JmtJ5xpQ1JgOUlrgJGtIkx
 cJ6olat6TUBucN9Rr+Z07vwLzsuVz+0pjI5LuyjAfbV0/VT8SKJnBqFxFlzblp0vHtU8qZS8EOi
 zMT7kigXgLs+qa40HxcjnLoGV2Mhg5v8zlXy/DhMhBydBHcv5IZgVJx4ePbkoRR4aTbtRoRdhe5
 vVy0pbk1nx72atH/1BSaAARPKfUzZucy59HAGOevojuuWpqdSsduRGQcWA7tK9pXtjrdYYPiOWs
 xCIh9aNdVo6+3lA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

The driver creates a bridge, but never calls drm_bridge_add() when
non-live input is used. This leaves the bridge's hpd_mutex
uninitialized, leading to:

WARNING: CPU: 0 PID: 9 at kernel/locking/mutex.c:582 __mutex_lock+0x708/0x840

Add the bridge add & remove calls so that the bridge gets managed
correctly.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 561671612394 ("drm: xlnx: zynqmp_dpsub: Add support for live video input")
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c    | 4 ++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a0606fab0e22..9f750740dfb8 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1761,6 +1761,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 
 	dpsub->dp = dp;
 
+	drm_bridge_add(dpsub->bridge);
+
 	dev_dbg(dp->dev, "ZynqMP DisplayPort Tx probed with %u lanes\n",
 		dp->num_lanes);
 
@@ -1789,4 +1791,6 @@ void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub)
 
 	zynqmp_dp_phy_exit(dp);
 	zynqmp_dp_reset(dp, true);
+
+	drm_bridge_remove(dpsub->bridge);
 }
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 88eb33acd5f0..3933c4f1a44f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -260,8 +260,6 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 		ret = zynqmp_dpsub_drm_init(dpsub);
 		if (ret)
 			goto err_disp;
-	} else {
-		drm_bridge_add(dpsub->bridge);
 	}
 
 	dev_info(&pdev->dev, "ZynqMP DisplayPort Subsystem driver probed");
@@ -288,8 +286,6 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
 
 	if (dpsub->drm)
 		zynqmp_dpsub_drm_cleanup(dpsub);
-	else
-		drm_bridge_remove(dpsub->bridge);
 
 	zynqmp_disp_remove(dpsub);
 	zynqmp_dp_remove(dpsub);

---
base-commit: e8f897f4afef0031fe618a8e94127a0934896aba
change-id: 20240312-xilinx-dp-lock-fix-cf68f43a7bab

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

