Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE513AE231E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 21:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51F610E24C;
	Fri, 20 Jun 2025 19:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F5410E24C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 19:56:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uShqy-0005Nh-Hz; Fri, 20 Jun 2025 21:56:48 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <l.stach@pengutronix.de>) id 1uShqx-004Vkz-2V;
 Fri, 20 Jun 2025 21:56:47 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-slt@pengutronix.de
Subject: [PATCH 2/2] drm/etnaviv: don't touch clock gating register during
 reset
Date: Fri, 20 Jun 2025 21:56:47 +0200
Message-Id: <20250620195647.2770349-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620195647.2770349-1-l.stach@pengutronix.de>
References: <20250620195647.2770349-1-l.stach@pengutronix.de>
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

While the Vivante driver also claims to disable clock gating during reset
(in reality it doesn't because it clears the wrong register and *enables*
clock gating for all modules), it has been shown that switching the clock
gating enable state in the reset sequence has made the GPU reset less
reliable and often leaves parts of the GPU in indeterminate state.

Fixes: b0da08559c74 ("drm/etnaviv: disable MLCG and pulse eater on GPU reset")
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index bf59f4ee0e72..a1e84deba6c0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -542,9 +542,6 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 		unsigned int fscale = 1 << (6 - gpu->freq_scale);
 		u32 pulse_eater = 0x01590880;
 
-		/* disable clock gating */
-		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
-
 		/* disable pulse eater */
 		pulse_eater |= BIT(17);
 		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
-- 
2.39.5

