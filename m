Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C883DF5A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 17:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2529810FC2A;
	Fri, 26 Jan 2024 16:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B5510FC36
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 16:58:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rTPXc-0002Mc-TW; Fri, 26 Jan 2024 17:58:56 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1rTPXc-002YBh-8w; Fri, 26 Jan 2024 17:58:56 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: fix DMA direction handling for cached read/write
 buffers
Date: Fri, 26 Jan 2024 17:58:56 +0100
Message-Id: <20240126165856.1199387-1-l.stach@pengutronix.de>
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
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dma sync operation needs to be done with DMA_BIDIRECTIONAL when
the BO is prepared for both read and write operations. With the
current inverted if ladder it would only be synced for DMA_FROM_DEVICE.

Fixes: a8c21a5451d8 ("drm/etnaviv: add initial etnaviv DRM driver")
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b5f73502e3dd..d788a27aacb8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -356,12 +356,14 @@ static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
 
 static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
 {
-	if (op & ETNA_PREP_READ)
+	if (op & (ETNA_PREP_READ | ETNA_PREP_WRITE))
+		return DMA_BIDIRECTIONAL;
+	else if (op & ETNA_PREP_READ)
 		return DMA_FROM_DEVICE;
 	else if (op & ETNA_PREP_WRITE)
 		return DMA_TO_DEVICE;
-	else
-		return DMA_BIDIRECTIONAL;
+
+	return DMA_NONE;
 }
 
 int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
-- 
2.39.2

