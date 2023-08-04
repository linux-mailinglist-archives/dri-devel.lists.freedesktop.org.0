Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D878770419
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA2610E722;
	Fri,  4 Aug 2023 15:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A8110E721
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:10:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E82DE1C0003;
 Fri,  4 Aug 2023 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691161818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nwlqseqskDNjzuWWUqN4ODDJjpTVWn6NU0l72pzeoK8=;
 b=VJ3+2Iipwpe+7bbRgZ3Mo67/svscBp1VM/IOxmXTYkyXxPjyEmtxd/Hky19XhZ5oL9fCLu
 t7Gq3LmgnoAGGBYDZE9M3hH23wH+aOCjMPBUgv3+Ceq5jjReDtthR2I/f5P6wu+1k8YcrD
 eZ9tLWMUSvkUu/drZksipTTqowzEM0Wxi9T2Aooi0ZQR7mizfrLpEDL4AJgSsZcxWo6z2c
 00cmITNpOfY5J9uq636y8vBF4H0oAJfzR5835PRXjsyD00P+HmktpLX2TnRq2FSPMrH7X+
 fTu9WGVlYoa55oHc/feQRnvujlYU8yA+RnLwOOi/61mcDBMEVvT7Ecrxf2Fx3g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock
Date: Fri,  4 Aug 2023 17:10:10 +0200
Message-Id: <20230804151010.834990-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel has been implemented in commit 225213f24c79 ("drm/panel-simple:
Add Innolux G156HCE-L01 panel entry") with a higher clock than the typical
one mentioned on the documentation to avoid flickering on the unit
tested. Testing on a different unit shows that the panel actually works
with the intended 70.93 MHz clock and even lower frequencies so the
flickering is likely caused either by a defective unit or by other
different components such as the bridge.

Fixes: 225213f24c79 ("drm/panel-simple: Add Innolux G156HCE-L01 panel entry")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 56854f78441e..ec3a73bbfe30 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2379,7 +2379,7 @@ static const struct panel_desc innolux_g121x1_l03 = {
 };
 
 static const struct display_timing innolux_g156hce_l01_timings = {
-	.pixelclock = { 120000000, 144000000, 150000000 },
+	.pixelclock = { 120000000, 141860000, 150000000 },
 	.hactive = { 1920, 1920, 1920 },
 	.hfront_porch = { 80, 90, 100 },
 	.hback_porch = { 80, 90, 100 },
-- 
2.34.1

