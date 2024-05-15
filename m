Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A98C6634
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 14:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551B910E429;
	Wed, 15 May 2024 12:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B6910E429
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 12:14:03 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s7DWB-0001fa-6q; Wed, 15 May 2024 14:13:59 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s7DWA-001WzE-Kn; Wed, 15 May 2024 14:13:58 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: [PATCH] drm/etnaviv: don't disable TS on MMUv2 core when moving the
 linear window
Date: Wed, 15 May 2024 14:13:58 +0200
Message-Id: <20240515121358.2027178-1-l.stach@pengutronix.de>
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

On MMUv2 cores the linear window is only relevant when starting the FE,
before the MMU has been activated. Once the MMU is active, all accesses
are translated with no way to bypass the MMU via the linear window. Thus
TS ignoring the linear window offset is not an issue on cores with MMUv2
present and there is no need to disable TS when we need to move the
linear window.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 2db0fb071a57..50a6dc005bf8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -875,12 +875,15 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	 *
 	 * On MC1.0 cores the linear window offset is ignored by the TS engine,
 	 * leading to inconsistent memory views. Avoid using the offset on those
-	 * cores if possible, otherwise disable the TS feature.
+	 * cores if possible, otherwise disable the TS feature. MMUv2 doesn't
+	 * expose this issue, as all TS accesses are MMU translated, so the
+	 * linear window offset won't be used.
 	 */
 	cmdbuf_paddr = ALIGN_DOWN(etnaviv_cmdbuf_get_pa(&gpu->buffer), SZ_128M);
 
 	if (!(gpu->identity.features & chipFeatures_PIPE_3D) ||
-	    (gpu->identity.minor_features0 & chipMinorFeatures0_MC20)) {
+	    (gpu->identity.minor_features0 & chipMinorFeatures0_MC20) ||
+	    (gpu->identity.minor_features1 & chipMinorFeatures1_MMU_VERSION)) {
 		if (cmdbuf_paddr >= SZ_2G)
 			priv->mmu_global->memory_base = SZ_2G;
 		else
-- 
2.39.2

