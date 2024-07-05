Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DFB928E06
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 22:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D5A10EBFD;
	Fri,  5 Jul 2024 20:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7869C10E21E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 20:00:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6M-0003VP-Ks; Fri, 05 Jul 2024 22:00:14 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6M-007Ocg-1W; Fri, 05 Jul 2024 22:00:14 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH v2 3/5] drm/etnaviv: unconditionally enable debug registers
Date: Fri,  5 Jul 2024 22:00:11 +0200
Message-Id: <20240705200013.2656275-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705200013.2656275-1-l.stach@pengutronix.de>
References: <20240705200013.2656275-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

A later change will use the FE debug registers to improve GPU
progress monitoring. Instead of having to keep track of the
usage state of the debug registers and lock access to the
VIVS_HI_CLOCK_CONTROL register, statically enable debug
register access during GPU init.

The Vivante downstream driver seems to do the same thing since
a while, so it should be okay to keep access enabled. (See
gckHARDWARE_InitializeHardware in 6.4.11 downstream driver).

Many debug registers contain bogus data if clock gating is
enabled, so even if they are always accessible performance
profiling still needs to manage some prerequisites.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: new patch replacing more complex usage tracking from v1
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 2bd14d3501e2..bf0b13c99a3c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -574,8 +574,8 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 			continue;
 		}
 
-		/* disable debug registers, as they are not normally needed */
-		control |= VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
+		/* enable debug register access */
+		control &= ~VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
 		gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, control);
 
 		failed = false;
@@ -1337,11 +1337,6 @@ static void sync_point_perfmon_sample_pre(struct etnaviv_gpu *gpu,
 	val &= ~VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
 	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
 
-	/* enable debug register */
-	val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
-	val &= ~VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
-	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
-
 	sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_PRE);
 
 	mutex_unlock(&gpu->lock);
@@ -1358,11 +1353,6 @@ static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
 
 	sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_POST);
 
-	/* disable debug register */
-	val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
-	val |= VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
-	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
-
 	/* enable clock gating */
 	val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
 	val |= VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
-- 
2.39.2

