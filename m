Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313DF3FE5A7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 01:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407FE6E3F7;
	Wed,  1 Sep 2021 23:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482C76E3EF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 23:49:14 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8280918F9;
 Thu,  2 Sep 2021 01:49:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1630540152;
 bh=qC2f8x3s8tYxsf6YSEwSgW69e/jJGentOvVXxQGH1oQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BMqBLTxfS+AZavfzp9IaPI0GKDJrC4TrKP9qHuPSMYanS5ev/gCwh/ru+4Y/eLZEs
 I5FbN+N7k/9b0j0b59ouSDA+IExQJwsmxobcnlBy6j42TSU34FJKfqLAXjetMg5yAV
 nX7VMs8zh4JWBVNnnqwEFaEHhlmtcCZZdP1mx5fE=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/5] drm: rcar-du: Fix DIDSR field name
Date: Thu,  2 Sep 2021 00:49:05 +0100
Message-Id: <20210901234907.1608896-4-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
References: <20210901234907.1608896-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The DIDSR fields named LDCS were incorrectly defined as LCDS.
Both the Gen2 and Gen3 documentation refer to the fields as the "LVDS
Dot Clock Select".

Correct the definitions.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v2:
 - New patch

 drivers/gpu/drm/rcar-du/rcar_du_group.c | 4 ++--
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 88a783ceb3e9..a984eef265d2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -122,10 +122,10 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
 	didsr = DIDSR_CODE;
 	for (i = 0; i < num_crtcs; ++i, ++rcrtc) {
 		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
-			didsr |= DIDSR_LCDS_LVDS0(i)
+			didsr |= DIDSR_LDCS_LVDS0(i)
 			      |  DIDSR_PDCS_CLK(i, 0);
 		else
-			didsr |= DIDSR_LCDS_DCLKIN(i)
+			didsr |= DIDSR_LDCS_DCLKIN(i)
 			      |  DIDSR_PDCS_CLK(i, 0);
 	}
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index fb9964949368..fb7c467aa484 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -257,10 +257,10 @@
 
 #define DIDSR			0x20028
 #define DIDSR_CODE		(0x7790 << 16)
-#define DIDSR_LCDS_DCLKIN(n)	(0 << (8 + (n) * 2))
-#define DIDSR_LCDS_LVDS0(n)	(2 << (8 + (n) * 2))
-#define DIDSR_LCDS_LVDS1(n)	(3 << (8 + (n) * 2))
-#define DIDSR_LCDS_MASK(n)	(3 << (8 + (n) * 2))
+#define DIDSR_LDCS_DCLKIN(n)	(0 << (8 + (n) * 2))
+#define DIDSR_LDCS_LVDS0(n)	(2 << (8 + (n) * 2))
+#define DIDSR_LDCS_LVDS1(n)	(3 << (8 + (n) * 2))
+#define DIDSR_LDCS_MASK(n)	(3 << (8 + (n) * 2))
 #define DIDSR_PDCS_CLK(n, clk)	(clk << ((n) * 2))
 #define DIDSR_PDCS_MASK(n)	(3 << ((n) * 2))
 
-- 
2.30.2

