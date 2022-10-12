Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 557825FCE38
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 00:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EA010E062;
	Wed, 12 Oct 2022 22:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BF510E062
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 22:12:09 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 65EDE84E44;
 Thu, 13 Oct 2022 00:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1665612727;
 bh=vVJsVm9BWLe/Eis+SEZxIdVnhP7Eq0P+dM/IljrN09c=;
 h=From:To:Cc:Subject:Date:From;
 b=b/p6I2tdEFgpI1H0Dj4QEE/A2H7H2H7BPhvKH9soxZWOiAbug1U8MvaQjxpEFPZZf
 fWgSoNkfyXqKn0WmCrr90gCamzsJ1W3ZotOGr8zBa1A8bvvHXiQCXaNQpYA9sY5bCh
 BD0X1/AZxF8St2I4gBwQLl2rPvvebRFJLlZdCQW8AG8tr2DbmPorYZbrquHYperMwt
 jr2nQE8Dk4kzGrh+KhQz/Eg3kJ3zYxlvwAkguuRjyZCJ4Ha5AyrI1LXap/am1Fonkb
 n8Q6qmgyFgqRzGwlXax4Jd2I8AwZXx/jRivS2VyRWXf99WXsmcBW4+23VgJIjR9TUc
 s4FJ4NRQucUiw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel/panel-sitronix-st7701: Fix RTNI calculation
Date: Thu, 13 Oct 2022 00:11:59 +0200
Message-Id: <20221012221159.88397-1-marex@denx.de>
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
V2: Clamp the htotal to range 512...1008, so RTNI always fits the bitfield
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index c481daa4bbceb..9578f461f5e48 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -244,7 +244,7 @@ static void st7701_init_sequence(struct st7701 *st7701)
 		   DSI_CMD2_BK0_INVSEL_ONES_MASK |
 		   FIELD_PREP(DSI_CMD2_BK0_INVSEL_NLINV_MASK, desc->nlinv),
 		   FIELD_PREP(DSI_CMD2_BK0_INVSEL_RTNI_MASK,
-			      DIV_ROUND_UP(mode->htotal, 16)));
+			      (clamp((u32)mode->htotal, 512U, 1008U) - 512) / 16));
 
 	/* Command2, BK1 */
 	ST7701_DSI(st7701, DSI_CMD2BKX_SEL,
-- 
2.35.1

