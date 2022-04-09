Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE614FAA71
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 20:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E51C10E21B;
	Sat,  9 Apr 2022 18:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BAB10E219
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 18:57:19 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D741482;
 Sat,  9 Apr 2022 20:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649530637;
 bh=RLZShEp9c6dVQcHexGi511NyGFd4MZ3TflsXFQ8hCos=;
 h=From:To:Cc:Subject:Date:From;
 b=u1OpjeuSSuZGovHkJslNpMKsSGrWSUEbcCBCEUieYhFNhb2M58XytTtdwrCKy4o5n
 TZg2kDuhelKsOyMHax1ufh4t1Oxb9154tokWMj2CsLtg8ziPB+1+on1GQJMIssP9Hb
 hsfmno1sPlHJCGmGOwDVElz7XJTOU2eO8yQwLil0=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Extend CMM HDSE documentation
Date: Sat,  9 Apr 2022 19:57:06 +0100
Message-Id: <20220409185706.505319-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
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
Cc: David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the CMM is enabled, the HDSE offset is further adjusted to
compensate for consumed pixels.

Explain this further, with an extra comment at the point the offset is
adjusted.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index f361a604337f..23e1aedf8dc0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -300,6 +300,11 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	     | DSMR_DIPM_DISP | DSMR_CSPM;
 	rcar_du_crtc_write(rcrtc, DSMR, dsmr);
 
+	/*
+	 * When the CMM is enabled, an additional offset of 25 pixels must be
+	 * subtracted from the HDS (horizontal display start) and HDE
+	 * (horizontal display end) registers.
+	 */
 	hdse_offset = 19;
 	if (rcrtc->group->cmms_mask & BIT(rcrtc->index % 2))
 		hdse_offset += 25;
-- 
2.32.0

