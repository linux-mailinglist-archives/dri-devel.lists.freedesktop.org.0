Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08863BC3B4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 23:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C728994A;
	Mon,  5 Jul 2021 21:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241BC8994A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 21:37:33 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.97]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MekvV-1lSHrL2VXR-00aqBa; Mon, 05 Jul 2021 23:37:30 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH RFC] drm/vc4: hdmi: Fix connector detect logic
Date: Mon,  5 Jul 2021 23:36:34 +0200
Message-Id: <1625520994-11065-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:zOWGIZXJs4lPcr9lBX6vFHLTVYYcLaejnFTfBuQhh72etju8RGP
 +1O5nWk9fblhAE9fTL1lgQxdQ6cVDnEWXhupgxmQOdTD2HNQ6b5Ds2+VMzVmeodenTSfctg
 p5+LxHl3s+e6YCyhlHqAQYQU3Lm1/zZALlNhxlIDZEQ4U5eOT7c1ncilCP1EUvL4TL8x4vE
 HDxBDlL1rqSVEE0LkQpmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pGl3idlKNtA=:eO4JddFOF7TA3TEl4lamYx
 oArpyH85BH6TOPQ8F57Tu2OjDvZhvRgOm3GthSltf+mcNjVBgwFgVnG6QJ8w+FLBkiPtQ/zvV
 31/57mZ4eEPYP0kCorjtNaJ6N2lJAT92Mnu/zNnWS7r3HTdrP99DgyDkA//KgUZl+5Yt8jIWC
 fpZGgP48XV5fEsLjQfGpWheAhJmzW6AJ6qqwGDiZNctBtxTd5sxaWm4j2rt9yyInEC1rELcyT
 0fwiOOlLXS5iFZ+2gd5UiSdz8I+B6xP8jJ4adjOSdD7EV5TuilhdfPXKhSemaRdnT0Lwm924i
 C4Eusr8MXAeFpdSzqoV+HeyqxCY3OICDpKykzPgP6IFbu1RFsEY7j6I9SY1t6YWG7yW73QdrZ
 57OdeP3qc5t76BHHEc3/p1p4Yv8HKdn1QojNeHxCbBnkEI89fsu8Kh5JyCJAAhGQmFv/d0T+c
 hc5rFl3ptQiJW10IYFMcLsVU/KeitYb5h00LVzFcZNzn3U/0g254A0Y6QlcVqem5Iy6pSwles
 m1EcFUg1+SCWk7+8U9RCJWQIKLck6wXUPtbPj1ft6DoSksDgfatnuLWGEyiDyQWZCVEanRHhW
 UzScrb6HsKrZNP1V/1AEvkqy/eIjBS5OUymnmGNjc7F1iDgR9y9fCYWViU8YLu5zERP158XJD
 gamAjS/s3Fh5nnStyl8Nmrtvq7h37dRC4HA0gIqi/kYEgEwreWm6PI8TQtV9gycrHHZGYKvfq
 ekhGwrmZ3Td9kIxwMjH3QUOqGlsSChjT1CBIhB5U9c2Zybtk/DC+JErpTuWizeVX/0/nO3k19
 VWToVKwrr8EsOtrBW89bp+wo9MfhROBgoxba8rmGBwtl6fkgf0xMTE4sgPFc+rX6BZCwmAP
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit "drm/vc4: hdmi: Convert to gpiod" changes the behavior of
vc4_hdmi_connector_detect() which results into CPU hangs in case there
is no HDMI connected. Let's restore the old behavior.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Ojaswin Mujoo <ojaswin98@gmail.com>
Fixes: 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index aab1b36..cf8339c 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -168,9 +168,9 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
 
-	if (vc4_hdmi->hpd_gpio &&
-	    gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio)) {
-		connected = true;
+	if (vc4_hdmi->hpd_gpio) {
+		if (gpiod_get_value_cansleep(vc4_hdmi->hpd_gpio))
+			connected = true;
 	} else if (drm_probe_ddc(vc4_hdmi->ddc)) {
 		connected = true;
 	} else if (HDMI_READ(HDMI_HOTPLUG) & VC4_HDMI_HOTPLUG_CONNECTED) {
-- 
2.7.4

