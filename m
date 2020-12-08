Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C94052D2617
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7A56E9BD;
	Tue,  8 Dec 2020 08:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0219C8972C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 04:44:48 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id f16so14759263otl.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 20:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S839lFMHy0MANqMX7LWPsNoTjUegKOQvqUVMPavlC6U=;
 b=cPp45lFN7EuWl0/lks1tVaMwk5uWFdxivYWhaGF4067O3UY2TYPjybuRmrsoFtp181
 jyFkty98xB+dpDH/Zp5SKoBL3wi8wGd0kGbMVsZhtxnf0137Ty1SPv9l09C1H5VPQwp9
 HRiG7CAvk+PSumHqbQbwSCBlSFG8ubvb4arPsbJvxl2JESREVz14KEqYdpolVA64eHFH
 1FPJZ1ZiDhom6U4BDoehZBcOfU9UYbmqB/93NBcpYMGXD4TCxISBD9h6SOjDxKV8+RYP
 +wB9YGUsEaQ0lwqvvJTniFX0s2sEo176ugxVzL9gG51AsKz1nxAHyJm3LJzR1W1eWBmH
 8Kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S839lFMHy0MANqMX7LWPsNoTjUegKOQvqUVMPavlC6U=;
 b=tqKNUV2ZedctaxFyYRSpwkdbrnYve5b4aNcTKrDQA+ApJbJRi6JeflDeZNBMKSDdTu
 kqoOUFwe3p6ZBr5hKfXa2FYRsHoN2DrQRFJvWHLBW67nDfG3RZ9JU4bJcjHxamCyWD61
 ff4Zo+mUkDk015MVNusw/in5vfYnvDQJBFZqBkqLdVo2JYmRQRtDB1rzQ9PaX8X1KbCr
 BpdiPY2HiyP/rba/WoVNRUxef04h7tlM5yHdH8UZKRfu3gaGKLdkGhPCtl3LxceoeG0D
 lkfkT5fkJiQRX9zdEOnM2dLjx9/BHIDfvyili+I43lxytHorZGZ258lyen+BRjZhCE5c
 A85A==
X-Gm-Message-State: AOAM532Cow3eDC3xSBlMRIFV8Fe5jWg/W+U9MJU8Q1aUocNOvQszdgFM
 VfZWllo893VUvhvCdYB66T+86Q==
X-Google-Smtp-Source: ABdhPJyQpX+x8CsyAIpk0UarS+sOy31K736OMAOfCChjfjOwQ4qoP3bt78faRAsycAlt5uSGYTG+vg==
X-Received: by 2002:a05:6830:11cc:: with SMTP id
 v12mr16250268otq.363.1607402688364; 
 Mon, 07 Dec 2020 20:44:48 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id c19sm3171921otn.59.2020.12.07.20.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 20:44:47 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH] drm/panel: Make backlight attachment lazy
Date: Mon,  7 Dec 2020 22:44:46 -0600
Message-Id: <20201208044446.973238-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some bridge chips, such as the TI SN65DSI86 DSI/eDP bridge, provides
means of generating a PWM signal for backlight control of the attached
panel. The provided PWM chip is typically controlled by the
pwm-backlight driver, which if tied to the panel will provide DPMS.

But with the current implementation the panel will refuse to probe
because the bridge driver has yet to probe and register the PWM chip,
and the bridge driver will refuse to probe because it's unable to find
the panel.

Mitigate this catch-22 situation by allowing the panel driver to probe
and retry the attachment of the backlight as the panel is turned on or
off.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/drm_panel.c | 47 +++++++++++++++++++++++++++----------
 include/drm/drm_panel.h     |  8 +++++++
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..7487329bd22d 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -43,6 +43,34 @@ static LIST_HEAD(panel_list);
  * take look at drm_panel_bridge_add() and devm_drm_panel_bridge_add().
  */
 
+#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
+static int drm_panel_of_backlight_lazy(struct drm_panel *panel)
+{
+	struct backlight_device *backlight;
+
+	if (!panel || !panel->dev)
+		return -EINVAL;
+
+	backlight = devm_of_find_backlight(panel->dev);
+
+	if (IS_ERR(backlight)) {
+		if (PTR_ERR(backlight) == -EPROBE_DEFER) {
+			panel->backlight_init_pending = true;
+			return 0;
+		}
+
+		return PTR_ERR(backlight);
+	}
+
+	panel->backlight = backlight;
+	panel->backlight_init_pending = false;
+
+	return 0;
+}
+#else
+static int drm_panel_of_backlight_lazy(struct drm_panel *panel) { return 0; }
+#endif
+
 /**
  * drm_panel_init - initialize a panel
  * @panel: DRM panel
@@ -161,6 +189,9 @@ int drm_panel_enable(struct drm_panel *panel)
 			return ret;
 	}
 
+	if (panel->backlight_init_pending)
+		drm_panel_of_backlight_lazy(panel);
+
 	ret = backlight_enable(panel->backlight);
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
@@ -187,6 +218,9 @@ int drm_panel_disable(struct drm_panel *panel)
 	if (!panel)
 		return -EINVAL;
 
+	if (panel->backlight_init_pending)
+		drm_panel_of_backlight_lazy(panel);
+
 	ret = backlight_disable(panel->backlight);
 	if (ret < 0)
 		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
@@ -328,18 +362,7 @@ EXPORT_SYMBOL(of_drm_get_panel_orientation);
  */
 int drm_panel_of_backlight(struct drm_panel *panel)
 {
-	struct backlight_device *backlight;
-
-	if (!panel || !panel->dev)
-		return -EINVAL;
-
-	backlight = devm_of_find_backlight(panel->dev);
-
-	if (IS_ERR(backlight))
-		return PTR_ERR(backlight);
-
-	panel->backlight = backlight;
-	return 0;
+	return drm_panel_of_backlight_lazy(panel);
 }
 EXPORT_SYMBOL(drm_panel_of_backlight);
 #endif
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 33605c3f0eba..b126abebb2f3 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -149,6 +149,14 @@ struct drm_panel {
 	 */
 	struct backlight_device *backlight;
 
+	/**
+	 * @backlight_init_pending
+	 *
+	 * Backlight driver is not yet available so further attempts to
+	 * initialize @backlight is necessary.
+	 */
+	bool backlight_init_pending;
+
 	/**
 	 * @funcs:
 	 *
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
