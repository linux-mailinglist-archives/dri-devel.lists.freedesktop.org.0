Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0D5045FD
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 04:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD34210E663;
	Sun, 17 Apr 2022 02:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396AB10E657
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 02:08:23 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 816F883DF2;
 Sun, 17 Apr 2022 04:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650161301;
 bh=RUVVRdMzZOISAj9DVEwUUux5WxlzTBd+JuFsbp7wah0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZcIMwx5L9m/cnukV7E74AjHNYCRsSc1tWtguhtMmGRNtFaoy1evuCIWOlSgslT+80
 9aMQv16MuHz8z6tRSxb5stR11X+YOUAiK3VPTd3wMFojstxwrdnkedhDwEjABAR2Uz
 rk7z+SeA7D8XcKMdcO3e73N3ytHNTkU/P/7X3fgHg5aWpZykLFvosp3TdYUc4y5juY
 VNASGDilqLrBuT/MeOHgdyqc3/DLMRPbxl73eAV+g1TeUGYmVFOzqM+srn/iG5s8WW
 7q1K17DvRVfpQwjK3kfSq0vlunDh67BNKm9gwpyty+JqwHMk6zLjeChYmVFzRVurOg
 bnDzb/WdDFrYg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm: mxsfb: Reorder mxsfb_crtc_mode_set_nofb()
Date: Sun, 17 Apr 2022 04:08:00 +0200
Message-Id: <20220417020800.336675-4-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220417020800.336675-1-marex@denx.de>
References: <20220417020800.336675-1-marex@denx.de>
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

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: Add RB from Lucas
V3: Rebase on latest next and discarded clock and irq cleanups
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 1f0f08eab8e74..b7c70d269d2cb 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -282,15 +282,6 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
 	int err;
 
-	/* Mandatory eLCDIF reset as per the Reference Manual */
-	err = mxsfb_reset_block(mxsfb);
-	if (err)
-		return;
-
-	mxsfb_set_formats(mxsfb, bus_format);
-
-	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
-
 	if (mxsfb->bridge && mxsfb->bridge->timings)
 		bus_flags = mxsfb->bridge->timings->input_bus_flags;
 
@@ -301,6 +292,15 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 			     bus_flags);
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
 
+	/* Mandatory eLCDIF reset as per the Reference Manual */
+	err = mxsfb_reset_block(mxsfb);
+	if (err)
+		return;
+
+	mxsfb_set_formats(mxsfb, bus_format);
+
+	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
+
 	mxsfb_set_mode(mxsfb, bus_flags);
 }
 
-- 
2.35.1

