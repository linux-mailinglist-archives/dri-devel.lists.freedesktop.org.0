Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D06E5A2FA5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 21:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F05B10E096;
	Fri, 26 Aug 2022 19:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98AD10E082
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 19:07:33 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oRefy-0005kg-4z; Fri, 26 Aug 2022 21:07:30 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 2/2] drm/etnaviv: disable tx clock gating for GC7000 rev6203
Date: Fri, 26 Aug 2022 21:07:28 +0200
Message-Id: <20220826190728.3213793-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826190728.3213793-1-l.stach@pengutronix.de>
References: <20220826190728.3213793-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>,
 Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marco Felsch <m.felsch@pengutronix.de>

The i.MX8MN SoC errata sheet mentions ERR050226: "GPU: Texture L2 Cache
idle signal may incorrectly clock gate the texture engine in GPU".

The workaround is to disable the corresponding clock gatings.

While on it move the clock gating check for rev6202 into the same check
to bundle them.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..430fcc11d668 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -616,14 +616,15 @@ static void etnaviv_gpu_enable_mlcg(struct etnaviv_gpu *gpu)
 
 	/* Disable TX clock gating on affected core revisions. */
 	if (etnaviv_is_model_rev(gpu, GC4000, 0x5222) ||
-	    etnaviv_is_model_rev(gpu, GC2000, 0x5108))
+	    etnaviv_is_model_rev(gpu, GC2000, 0x5108) ||
+	    etnaviv_is_model_rev(gpu, GC2000, 0x6202) ||
+	    etnaviv_is_model_rev(gpu, GC2000, 0x6203))
 		pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
 
-	/* Disable SE, RA and TX clock gating on affected core revisions. */
+	/* Disable SE and RA clock gating on affected core revisions. */
 	if (etnaviv_is_model_rev(gpu, GC7000, 0x6202))
 		pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_SE |
-		       VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA |
-		       VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_TX;
+		       VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA;
 
 	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_HZ;
 	pmc |= VIVS_PM_MODULE_CONTROLS_DISABLE_MODULE_CLOCK_GATING_RA_EZ;
-- 
2.30.2

