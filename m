Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D16168E5B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 12:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846F56E838;
	Sat, 22 Feb 2020 11:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49836E838
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 11:07:48 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 746EB33E;
 Sat, 22 Feb 2020 12:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582369666;
 bh=dr2QStqC6FGYz+Dt695k2NnYbqdCC/x/BmVHUA4inTc=;
 h=From:To:Cc:Subject:Date:From;
 b=WFYwtXxIIX43bS7HBy4E32gVPk2GtztDM8alQV1Y9QppmQKhmSGDr/qDQMfUq1vnx
 tL7sWrSlr9xM7UQtODEPtzkQuFjv3vi+rqhNvhiQtwWPjuFU++CVkrZmIglI/uQcL0
 q30BFjLZ4DysB+XP/PwztewfzZMe200NLCDfGgFs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tidss: Use drm_for_each_bridge_in_chain()
Date: Sat, 22 Feb 2020 13:07:18 +0200
Message-Id: <20200222110718.26272-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the manual encoder->bridge_chain walk with the
drm_for_each_bridge_in_chain() macro. Drivers should not touch the
bridge_chain field directly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index f7fe3a43ead0..83785b0a66a9 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -32,7 +32,7 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
 	 * bridge timings, or from the connector's display_info if no
 	 * bridge defines the timings.
 	 */
-	list_for_each_entry(bridge, &encoder->bridge_chain, chain_node) {
+	drm_for_each_bridge_in_chain(encoder, bridge) {
 		if (!bridge->timings)
 			continue;
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
