Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D791BCD0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B116D10EC14;
	Fri, 28 Jun 2024 10:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E309E10EC14
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:47:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sN98s-0004kw-DS; Fri, 28 Jun 2024 12:47:46 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sN98s-005aMe-0R; Fri, 28 Jun 2024 12:47:46 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 1/3] drm/etnaviv: move debug register en-/disable into own
 function
Date: Fri, 28 Jun 2024 12:47:43 +0200
Message-Id: <20240628104745.2602036-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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

The next changes will introduce another place where the debug registers
need to be en-/disabled. Split into separate functions, so we don't need
to replicate the code there. Also allow those calls to nest, keeping
the debug registers enabled until all callers don't need them any longer.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 33 ++++++++++++++++++++-------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  3 +++
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 7c7f97793ddd..ade6f7554706 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -471,6 +471,29 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 
 	etnaviv_hw_specs(gpu);
 }
+void etnaviv_gpu_enable_debug_regs(struct etnaviv_gpu *gpu)
+{
+	u32 val;
+
+	if (atomic_inc_return(&gpu->dbg_ref) > 1)
+		return;
+
+	val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
+	val &= ~VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
+	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
+}
+
+void etnaviv_gpu_disable_debug_regs(struct etnaviv_gpu *gpu)
+{
+	u32 val;
+
+	if (atomic_dec_return(&gpu->dbg_ref) != 0)
+		return;
+
+	val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
+	val |= VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
+	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
+}
 
 static void etnaviv_gpu_load_clock(struct etnaviv_gpu *gpu, u32 clock)
 {
@@ -1335,10 +1358,7 @@ static void sync_point_perfmon_sample_pre(struct etnaviv_gpu *gpu,
 	val &= ~VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
 	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
 
-	/* enable debug register */
-	val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
-	val &= ~VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
-	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
+	etnaviv_gpu_enable_debug_regs(gpu);
 
 	sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_PRE);
 }
@@ -1358,10 +1378,7 @@ static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
 		*pmr->bo_vma = pmr->sequence;
 	}
 
-	/* disable debug register */
-	val = gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
-	val |= VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
-	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
+	etnaviv_gpu_disable_debug_regs(gpu);
 
 	/* enable clock gating */
 	val = gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 31322195b9e4..07a6c66e0005 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -116,6 +116,7 @@ struct etnaviv_gpu {
 	struct mutex sched_lock;
 	struct drm_gpu_scheduler sched;
 	enum etnaviv_gpu_state state;
+	atomic_t dbg_ref;
 
 	/* 'ring'-buffer: */
 	struct etnaviv_cmdbuf buffer;
@@ -222,6 +223,8 @@ int etnaviv_gpu_pm_get_sync(struct etnaviv_gpu *gpu);
 void etnaviv_gpu_pm_put(struct etnaviv_gpu *gpu);
 int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms);
 void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
+void etnaviv_gpu_enable_debug_regs(struct etnaviv_gpu *gpu);
+void etnaviv_gpu_disable_debug_regs(struct etnaviv_gpu *gpu);
 
 extern struct platform_driver etnaviv_gpu_driver;
 
-- 
2.39.2

