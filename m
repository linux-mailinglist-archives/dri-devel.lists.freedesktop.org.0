Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA825FBEEA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 03:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5545410E16D;
	Wed, 12 Oct 2022 01:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D77710E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 01:44:08 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2663784E42;
 Wed, 12 Oct 2022 03:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665539046;
 bh=NaIoM4aJLRqS10xxfsDHSvZlHkXRhj1Lc/zNazv2DTs=;
 h=From:To:Cc:Subject:Date:From;
 b=vV30X7J0RsRtW4FCTFyx+yNrrziOHsv97k22ahBmCrUFhtqdPg4zJhvh1m8m1XYTF
 6cdgOT5RTOaf+IMBVmhbR4dNRGxqFPrT2R6xjIuvcNOfqa7t54wzHv5+iU4LquhVDi
 Kn1rRQfYzzH+V+z1y5PdGQttHAa3aLk+2VvPFxaf1wfROgKbfQ6hI7WyxL5SGr70Ww
 sH8f+qzgyneSufGMTG5ukhF0fWSzolHi7X/dtahsq5IyBPlggEB/4qsVIdjckzCwx9
 Wx9tTt6eS18wSzvLTKJBnTjcJoqEBX/5aRUPLFbeOAALK6xYZsicCNtI3a6D+JbvsQ
 KpsGn1dLRN/qA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel/panel-sitronix-st7701: Fix RTNI calculation
Date: Wed, 12 Oct 2022 03:43:58 +0200
Message-Id: <20221012014358.743926-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RTNI field is multiplied by 16 and incremented by 512 before being
used as the minimum number of pixel clock per horizontal line, hence
it is necessary to subtract those 512 bytes from htotal and then divide
the result by 16 before writing the value into the RTNI field. Fix the
calculation.

Fixes: de2b4917843c ("drm/panel/panel-sitronix-st7701: Infer horizontal pixel count from TFT mode")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index c481daa4bbceb..5af600b0742ce 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -244,7 +244,7 @@ static void st7701_init_sequence(struct st7701 *st7701)
 		   DSI_CMD2_BK0_INVSEL_ONES_MASK |
 		   FIELD_PREP(DSI_CMD2_BK0_INVSEL_NLINV_MASK, desc->nlinv),
 		   FIELD_PREP(DSI_CMD2_BK0_INVSEL_RTNI_MASK,
-			      DIV_ROUND_UP(mode->htotal, 16)));
+			      (mode->htotal - 512) / 16));
 
 	/* Command2, BK1 */
 	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-- 
2.35.1

