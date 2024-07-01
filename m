Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056E91E65B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 19:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0253C10E4AF;
	Mon,  1 Jul 2024 17:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE3810E4A8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 17:14:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOKc5-0002pB-2r; Mon, 01 Jul 2024 19:14:49 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOKc4-006Q8D-6O; Mon, 01 Jul 2024 19:14:48 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 4/4] drm/etnaviv: export client GPU usage statistics via fdinfo
Date: Mon,  1 Jul 2024 19:14:47 +0200
Message-Id: <20240701171447.3823888-4-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240701171447.3823888-1-l.stach@pengutronix.de>
References: <20240701171447.3823888-1-l.stach@pengutronix.de>
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

This exposes a accumulated GPU active time per client via the
fdinfo infrastructure.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2:
- new patch
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 32 ++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 6500f3999c5f..f42b982f9a16 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -24,6 +24,7 @@
 #include "etnaviv_gem.h"
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
+#include "common.xml.h"
 
 /*
  * DRM operations:
@@ -488,7 +489,36 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
 	ETNA_IOCTL(PM_QUERY_SIG, pm_query_sig, DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(fops);
+static void etnaviv_fop_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct drm_file *file = f->private_data;
+	struct drm_device *dev = file->minor->dev;
+	struct etnaviv_drm_private *priv = dev->dev_private;
+	struct etnaviv_file_private *ctx = file->driver_priv;
+
+	/*
+	 * For a description of the text output format used here, see
+	 * Documentation/gpu/drm-usage-stats.rst.
+	 */
+	seq_printf(m, "drm-driver:\t%s\n", dev->driver->name);
+	seq_printf(m, "drm-client-id:\t%u\n", ctx->id);
+
+	for (int i = 0; i < ETNA_MAX_PIPES; i++) {
+		struct etnaviv_gpu *gpu = priv->gpu[i];
+
+		if (!gpu)
+			continue;
+
+		seq_printf(m, "drm-engine-pipe%d:\t%llu ns\n", i,
+			drm_sched_entity_time_spent(&ctx->sched_entity[i]));
+	}
+}
+
+static const struct file_operations fops = {
+	.owner = THIS_MODULE,
+	DRM_GEM_FOPS,
+	.show_fdinfo = etnaviv_fop_show_fdinfo,
+};
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
-- 
2.39.2

