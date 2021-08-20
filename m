Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD97D3F3517
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 22:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFF26EB24;
	Fri, 20 Aug 2021 20:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F066EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 20:18:35 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mHAyH-000258-5R; Fri, 20 Aug 2021 22:18:33 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 5/8] drm/etnaviv: exec and MMU state is lost when resetting
 the GPU
Date: Fri, 20 Aug 2021 22:18:27 +0200
Message-Id: <20210820201830.2005563-5-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820201830.2005563-1-l.stach@pengutronix.de>
References: <20210820201830.2005563-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the GPU is reset both the current exec state, as well as all MMU
state is lost. Move the driver side state tracking into the reset function
to keep hardware and software state from diverging.

Cc: stable@vger.kernel.org # 5.4
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 973843c35fca..9c710924df6b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -570,6 +570,8 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 	etnaviv_gpu_update_clock(gpu);
 
 	gpu->fe_running = false;
+	gpu->exec_state = -1;
+	gpu->mmu_context = NULL;
 
 	return 0;
 }
@@ -830,7 +832,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	/* Now program the hardware */
 	mutex_lock(&gpu->lock);
 	etnaviv_gpu_hw_init(gpu);
-	gpu->exec_state = -1;
 	mutex_unlock(&gpu->lock);
 
 	pm_runtime_mark_last_busy(gpu->dev);
@@ -1055,8 +1056,6 @@ void etnaviv_gpu_recover_hang(struct etnaviv_gpu *gpu)
 	spin_unlock(&gpu->event_spinlock);
 
 	etnaviv_gpu_hw_init(gpu);
-	gpu->exec_state = -1;
-	gpu->mmu_context = NULL;
 
 	mutex_unlock(&gpu->lock);
 	pm_runtime_mark_last_busy(gpu->dev);
-- 
2.30.2

