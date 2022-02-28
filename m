Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1564C603A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 01:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E0210E24F;
	Mon, 28 Feb 2022 00:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B393D10E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 00:46:45 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1822D83BD9;
 Mon, 28 Feb 2022 01:46:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646009204;
 bh=GbZitkwwV4gg2dbtlotZDq9UYHgGcHW/Te/2YlotWO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fJ38m1bj58kfMKlZvJ0ptBzrqRtljao6ZopBuTQZ75KtKgQ6UVU95nPQCMbWIMuzy
 jV9kUV3tPgOv/TPUtzpksvG/87/Mo0j95q86WKZCTaqNGlYqzPH8qqu56aHKoWHSvz
 VhTYe/TkqVxGiiT5VUAb89vUiW3T5sKA1Fx9ytT8P0sk56u9XEiPS9OXB/Ue9g8cXr
 ckpPc8RZ8WctzQfeUwnvTVuxsd3UvXI09M0b732k4Yj0CKHkptFWOho3PUoBeFvI6D
 EQ6I5rZfh570BlmR96A893jEJHjcfkhHP1hTrR4KBrUyqeRgCi5O9kcHeE7XKU/d3L
 LetcFoCLVKfkg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm: mxsfb: Reorder mxsfb_crtc_mode_set_nofb()
Date: Mon, 28 Feb 2022 01:46:03 +0100
Message-Id: <20220228004605.367040-7-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228004605.367040-1-marex@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reorder mxsfb_crtc_mode_set_nofb() such that all functions which perform
register IO are called from one single location in this function. This is
a clean up. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 14f5cc590a51b..497603964add8 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -289,13 +289,6 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
 	int err;
 
-	/* Mandatory eLCDIF reset as per the Reference Manual */
-	err = mxsfb_reset_block(mxsfb);
-	if (err)
-		return;
-
-	mxsfb_set_formats(mxsfb, bus_format);
-
 	if (mxsfb->bridge && mxsfb->bridge->timings)
 		bus_flags = mxsfb->bridge->timings->input_bus_flags;
 
@@ -306,6 +299,13 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 			     bus_flags);
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
 
+	/* Mandatory eLCDIF reset as per the Reference Manual */
+	err = mxsfb_reset_block(mxsfb);
+	if (err)
+		return;
+
+	mxsfb_set_formats(mxsfb, bus_format);
+
 	mxsfb_set_mode(mxsfb, bus_flags);
 }
 
-- 
2.34.1

