Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955C854E899
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 19:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AD310E204;
	Thu, 16 Jun 2022 17:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 3.mo550.mail-out.ovh.net (3.mo550.mail-out.ovh.net
 [46.105.60.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA90010E204
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 17:25:38 +0000 (UTC)
Received: from player715.ha.ovh.net (unknown [10.111.172.70])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 2999F24C85
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 17:25:37 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
 (Authenticated sender: steve@sk2.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 6E97C2B80DB35;
 Thu, 16 Jun 2022 17:25:27 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003daa04ea3-487e-4441-a761-bef3e850f424,
 EEA695ED62D0B30D35F9F30395731DD21189161B) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From: Stephen Kitt <steve@sk2.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/3] drm/panel: panel-dsi-cm: Use backlight helpers
Date: Thu, 16 Jun 2022 19:23:14 +0200
Message-Id: <20220616172316.1355133-3-steve@sk2.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7462746059164321499
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeelgeetueejffejfeejvefhtddufeejgfetleegtddukeelieelvddvteduveejtdenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejudehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdfovfetjfhoshhtpehmohehhedt
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Stephen Kitt <steve@sk2.org>,
 David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of retrieving the backlight brightness in struct
backlight_properties manually, and then checking whether the backlight
should be on at all, use backlight_get_brightness() which does all
this and insulates this from future changes.

Instead of setting the power state by manually updating fields in
struct backlight_properties, use backlight_enable() and
backlight_disable(). These also call backlight_update_status() so the
separate call is no longer needed.

Signed-off-by: Stephen Kitt <steve@sk2.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
Changes since v1: removed unnecessary parentheses
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 29 ++++++----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index b58cb064975f..b0213a518f9d 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -85,17 +85,10 @@ static void dsicm_bl_power(struct panel_drv_data *ddata, bool enable)
 	else
 		return;
 
-	if (enable) {
-		backlight->props.fb_blank = FB_BLANK_UNBLANK;
-		backlight->props.state = ~(BL_CORE_FBBLANK | BL_CORE_SUSPENDED);
-		backlight->props.power = FB_BLANK_UNBLANK;
-	} else {
-		backlight->props.fb_blank = FB_BLANK_NORMAL;
-		backlight->props.power = FB_BLANK_POWERDOWN;
-		backlight->props.state |= BL_CORE_FBBLANK | BL_CORE_SUSPENDED;
-	}
-
-	backlight_update_status(backlight);
+	if (enable)
+		backlight_enable(backlight);
+	else
+		backlight_disable(backlight);
 }
 
 static void hw_guard_start(struct panel_drv_data *ddata, int guard_msec)
@@ -196,13 +189,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(&dev->dev);
 	int r = 0;
-	int level;
-
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK)
-		level = dev->props.brightness;
-	else
-		level = 0;
+	int level = backlight_get_brightness(dev);
 
 	dev_dbg(&ddata->dsi->dev, "update brightness to %d\n", level);
 
@@ -219,11 +206,7 @@ static int dsicm_bl_update_status(struct backlight_device *dev)
 
 static int dsicm_bl_get_intensity(struct backlight_device *dev)
 {
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-			dev->props.power == FB_BLANK_UNBLANK)
-		return dev->props.brightness;
-
-	return 0;
+	return backlight_get_brightness(dev);
 }
 
 static const struct backlight_ops dsicm_bl_ops = {
-- 
2.30.2

