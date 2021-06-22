Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8983B1086
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 01:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0572E6E3AA;
	Tue, 22 Jun 2021 23:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A697E6E2EF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 23:20:31 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0D85A66;
 Wed, 23 Jun 2021 01:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624404030;
 bh=RUKRmqgyqz9U5gi8RB6Mid2ZJhoOlmXP7P4o2uLEwDc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=coJj0FCoteLsF2XFemV7SB+OtayQYRtpyjy8wzrGRmSHYIZJZmkLAytgWiLgknJMp
 F7f0MB+3/AOjc4TBrXAPYGPEkRHyh1jbN9uodfnfPVpiV4R9OKEQ7qCKt6AvEY0Slh
 u666184vPnJzeFio7YTRlKB0LHj/sio/Y2VCSVH0=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/3] drm: rcar-du: Only initialise TVM_TVSYNC mode when
 supported
Date: Wed, 23 Jun 2021 00:20:23 +0100
Message-Id: <20210622232024.3215248-3-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The R-Car DU as found on the D3, E3, and V3U do not have support
for an external synchronisation method.

In these cases, the dsysr cached register should not be initialised
in DSYSR_TVM_TVSYNC, but instead should be left clear to configure as
DSYSR_TVM_MASTER by default.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index ea7e39d03545..cff0d82b9491 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1243,7 +1243,10 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	rcrtc->group = rgrp;
 	rcrtc->mmio_offset = mmio_offsets[hwindex];
 	rcrtc->index = hwindex;
-	rcrtc->dsysr = (rcrtc->index % 2 ? 0 : DSYSR_DRES) | DSYSR_TVM_TVSYNC;
+	rcrtc->dsysr = (rcrtc->index % 2 ? 0 : DSYSR_DRES);
+
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_TVM_SYNC))
+		rcrtc->dsysr |= DSYSR_TVM_TVSYNC;
 
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
-- 
2.30.2

