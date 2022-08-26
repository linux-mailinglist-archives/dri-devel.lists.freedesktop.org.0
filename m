Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 312195A3508
	for <lists+dri-devel@lfdr.de>; Sat, 27 Aug 2022 08:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3661310EC49;
	Sat, 27 Aug 2022 06:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 405 seconds by postgrey-1.36 at gabe;
 Fri, 26 Aug 2022 16:57:39 UTC
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E3010E63C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 16:57:39 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14c:485:4b69:a2ca:7d66:f918:ecae])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4025E848DC;
 Fri, 26 Aug 2022 18:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1661532650;
 bh=eT6DTEyQca7JSk80KtwsRSMKIJtIUGrzesIwKd1R6Qg=;
 h=From:To:Cc:Subject:Date:From;
 b=VO8uxZ8G3s8ZsOPLLAntwnkoSuXVv2fyfSn3DxwTYTp2NiLxQiEsSKLPgrPwVlyLF
 Im0ImLtfp3rRUxzAzQ2e/s3chvkkIoZ34JCjeTWQLecIEGKQO/ae0OprbxRTyGrdNF
 fYdaqbeXIvTTfe426TlnlrJ7+yt71aZlPVSA8QiTyFZrbzL449sKpl9pp1QaYMPVaO
 NGfCMZ4FXGONWAC1WtwnasJSCjdM5N8VU7aGgkDR8qO8TDmXap52Eet/wVc/Mh0l63
 mpPIcIku3K7MyYWhLb6B/tRCrEYZwVcGRIfzweNTn4t2eTaFgOo+WjUJD/ctkjbRG4
 5QyCiDxxamUtA==
From: Fabio Estevam <festevam@denx.de>
To: sam@ravnborg.org
Subject: [PATCH] drm/panel: simple: Fix innolux_g121i1_l01 bus_format
Date: Fri, 26 Aug 2022 13:50:21 -0300
Message-Id: <20220826165021.1592532-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Sat, 27 Aug 2022 06:27:16 +0000
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
Cc: marex@denx.de, hs@denx.de, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@denx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Schocher <hs@denx.de>

innolux_g121i1_l01 sets bpc to 6, so use the corresponding bus format:
MEDIA_BUS_FMT_RGB666_1X7X3_SPWG.

Fixes: 4ae13e486866 ("drm/panel: simple: Add more properties to Innolux G121I1-L01")
Signed-off-by: Heiko Schocher <hs@denx.de>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index edd5a0c35437..0cb3be26e2e6 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2255,7 +2255,7 @@ static const struct panel_desc innolux_g121i1_l01 = {
 		.enable = 200,
 		.disable = 20,
 	},
-	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-- 
2.25.1

