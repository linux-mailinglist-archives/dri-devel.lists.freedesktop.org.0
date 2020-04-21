Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7421B269D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9156E93E;
	Tue, 21 Apr 2020 12:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23286E93E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:46:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03LCkgta126600;
 Tue, 21 Apr 2020 07:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587473202;
 bh=km8GOuXtSK2uVaZ02Woyvmud19wDYpD0cpRiTMtbJDM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=rrjVtWtXRPXSmi3zX6MwVnDEH05p5WAfU0ExKmxw3k2MuwDINWHZ66/sKKIzznzAQ
 qenrpfSdzx9CxIoqWyLeCEp2jRAt25YqYWp9PvJyU7jmVMAACUvX6RWIM/PaqGGNAl
 4RkP6Gmw1c97ccdoq6TUrQ5UjVhqgeB23hcJcVUU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03LCkgHS027546
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Apr 2020 07:46:42 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 07:46:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 07:46:41 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03LCkVx7037462;
 Tue, 21 Apr 2020 07:46:40 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Lee Jones <lee.jones@linaro.org>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Bartlomiej
 Zolnierkiewicz <b.zolnierkie@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: [PATCHv2 4/4] backlight: led_bl: fix led -> backlight brightness
 mapping
Date: Tue, 21 Apr 2020 15:46:29 +0300
Message-ID: <20200421124629.20977-5-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421124629.20977-1-tomi.valkeinen@ti.com>
References: <20200421124629.20977-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code that maps the LED default brightness to backlight levels has
two issues: 1) if the default brightness is the first backlight level
(usually 0), the code fails to find it, and 2) when the code fails to
find a backlight level, it ends up using max_brightness + 1 as the
default brightness.

Fix these two issues.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/video/backlight/led_bl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 63693c4f0883..43a5302f163a 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -159,10 +159,11 @@ static int led_bl_parse_levels(struct device *dev,
 		 */
 		db = priv->default_brightness;
 		for (i = 0 ; i < num_levels; i++) {
-			if ((i && db > levels[i - 1]) && db <= levels[i])
+			if ((i == 0 || db > levels[i - 1]) && db <= levels[i])
 				break;
 		}
-		priv->default_brightness = i;
+
+		priv->default_brightness = min(i, num_levels - 1);
 		priv->max_brightness = num_levels - 1;
 		priv->levels = levels;
 	} else if (num_levels >= 0) {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
