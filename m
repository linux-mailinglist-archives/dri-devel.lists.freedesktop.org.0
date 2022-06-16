Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DACC54DB6E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A52410E0FE;
	Thu, 16 Jun 2022 07:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 68257 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jun 2022 07:23:47 UTC
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A25B10E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:23:47 +0000 (UTC)
X-QQ-mid: bizesmtp82t1655364220tyuagdlm
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 16 Jun 2022 15:23:33 +0800 (CST)
X-QQ-SSF: 01400000002000D0M000B00A0000000
X-QQ-FEAT: hR9GyqeohSiJBYTk+od0+lv++0Drp2ggk1O87ehDvPVH2JX41fZIZnXCoewT9
 TvOgRgq9lVfPm0SlkOBg/+/dgKmP5Dzt0drUXwhgN8R93L+T0Zp4KSovkT1dPALxMg/IQfL
 RBcW5ySW1hUXBXv/mduoWlWrFI5HvhFqXSH77EulhOr4Ica2nZwXQlFQhuMQlf8stKZLM8P
 TP7X4WgIl5QbsfoimPYgTJ9fRL1JsGn0gwq/w3fpgLasqQ8P1KlYVhziuulIozvFw7Xb07h
 bkPzEW0TqvRHqZmEFVskxWZrIU8nI7SCXjwsnBU/paad1lTQNLDn1JfMkFnMpV858Xicslp
 pikr4+oLT6sVb4zG5jbg51o21kVPA==
X-QQ-GoodBg: 2
From: hongao <hongao@uniontech.com>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Subject: [PATCH] drm/exynos: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Thu, 16 Jun 2022 15:22:33 +0800
Message-Id: <20220616072233.8302-1-hongao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign8
X-QQ-Bgrelay: 1
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
Cc: hongao <hongao@uniontech.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi.

This driver calls drm_detect_hdmi_monitor() to receive the same
information, which is less efficient.

Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
instead.

Signed-off-by: hongao <hongao@uniontech.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 7655142a4651..17e9f5efbcfc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -893,7 +893,7 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return -ENODEV;
 
-	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
+	hdata->dvi_mode = !connector->display_info.is_hdmi;
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
 			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
 			  edid->width_cm, edid->height_cm);
-- 
2.20.1



