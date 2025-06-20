Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB440AE2324
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 21:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D3210E134;
	Fri, 20 Jun 2025 19:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAD910E134
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 19:57:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uShrp-0007mH-SQ; Fri, 20 Jun 2025 21:57:41 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <l.stach@pengutronix.de>) id 1uShrp-004VlK-26;
 Fri, 20 Jun 2025 21:57:41 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-slt@pengutronix.de
Subject: [PATCH] drm/etnaviv: disable pulse eater on cores with 3D pipe and
 revision > 0x5420
Date: Fri, 20 Jun 2025 21:57:41 +0200
Message-Id: <20250620195741.2770474-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.5
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

The downstream driver switched from only disabling internal DFS on those
cores to clearing bit 16 and setting bit 17 in commit "MGS-3448: gpu-viv:
fix 6.2.4 remaning issues". This, as far as is known, completely disables
the pulse eater.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a1e84deba6c0..a2b3785e49b3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -747,9 +747,10 @@ static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
 	if ((gpu->identity.revision > 0x5420) &&
 	    (gpu->identity.features & chipFeatures_PIPE_3D))
 	{
-		/* Performance fix: disable internal DFS */
+		/* Performance fix: disable internal DFS and pulse-eater */
 		pulse_eater = gpu_read_power(gpu, VIVS_PM_PULSE_EATER);
-		pulse_eater |= BIT(18);
+		pulse_eater &= ~BIT(16);
+		pulse_eater |= BIT(18) | BIT(17);
 	}
 
 	gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
-- 
2.39.5

