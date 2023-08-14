Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB6277BA4D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8367910E142;
	Mon, 14 Aug 2023 13:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4B510E142
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:40:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A427DE0004;
 Mon, 14 Aug 2023 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692020443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iv1cYDOnIeoz6q9otJ3llit4PPG5QkApkUhlm5iTdLU=;
 b=Yfd2WnGT7XC+FqcmMhS6v6/TfT8NX4n1+qLXsfId1dABFmMSRmyp86j4Lj1itHHXLVmbGP
 nsttf1o+GSqs/YzLjLDqXZri534GHfZCxWRdRdxA9F4Ns1243k24CjhVSyrRxOTccl9Wz7
 48XVdLo23AIwJg05jD1bvv0Y5P574UadmzqaCqQTJ9EqwIczLeb2loPsZ3FpCNUuzY2KSj
 JJr/hYC3LJVMqgg2/jScUUTwMraYqzaVHfZE4zQvlnfbwz0RG7dWm9Biet5ryf0GfuBa75
 icH0XL9Kgth2LSer7f489VS2P9U0ADPWf8SdkD+20fGyvmcmcj8rG0kke46frQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel: simple: Fix Innolux G156HCE-L01 LVDS clock
Date: Mon, 14 Aug 2023 15:40:24 +0200
Message-Id: <20230814134024.397739-1-luca.ceresoli@bootlin.com>
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

Fixes: eae7488814b5 ("drm/panel-simple: Add Innolux G156HCE-L01 panel entry")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Vasut <marex@denx.de> # MX8MM with LT9211
Reviewed-by: Marek Vasut <marex@denx.de>

---

Changed in v2:
 - fix commit hash in "Fixes:" line
 - add tested/reviewed by Marek
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 701013b3ad13..a1bbc7f11e83 100644
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

