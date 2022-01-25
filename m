Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8697449BE07
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 22:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A0989ECD;
	Tue, 25 Jan 2022 21:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3830189E8C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 21:54:46 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id j10so7258412pgc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 13:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNxeFPmBtV0nU1VBJ9IaThwJBrT6bBJPSlaX6q3YHjo=;
 b=PwoPwBJ8ayNdLuEzGamBoy4ylPVdvw31+F5KzmlGaEgDzDqgSSC4A5kstr5nZlKGKj
 QMqNFsg7IRvAiguF8JfU9BT2/f+Xmirhv9h+B4jTGimss0YklotHPbnOsE5QNU/cJBA3
 6BHqhDg+ptnsYGUtloS0XkQMs5M7LeCFapXHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNxeFPmBtV0nU1VBJ9IaThwJBrT6bBJPSlaX6q3YHjo=;
 b=mviyytxkYi8ejZiuwhFdNBWkamCjAumg7Ewwj/bwXxM+mqeJMX233CjsRV2G8Y9v1T
 GQ+Awu/UfnMLjN2Ylr8z43Nc/YIe8q1M7DyQ2fkWZGFHF1IIOax3F4vTqal657fInbIJ
 jrfUvko+yo646RK/QyMNlrtARBaiMtVlUFa7YBH250/oIEV/U7DzfmAacVTT2HgeFaXP
 oFgMyYV0QZfn1lFo6uOG6puvn9w4cq5wmqb5PkxCLaEDZBf4+1U+fk++DIazl1ddEKVs
 1MK3UwgNvaJHx0iccpIPm5Ft9U3b9m9fgfy4l65CQsJcMTb7DWjG+eUNhGujs6rCGrGV
 ZbWA==
X-Gm-Message-State: AOAM532BvdJxYzChpLDT1W8eVdIS0Vv/Xk/d3z49psBHGpQWWMqmW+GG
 1q1ikd5FE6Mm4p7RJB/6/y8hRt9wlVTijg==
X-Google-Smtp-Source: ABdhPJw5U6oW/scKNg8xtgVAv6dXvqTxYa5dhg3K6y0xe0gyhH8Y/wW04K2bjOLygk491pB2W6HWnw==
X-Received: by 2002:a62:798d:0:b0:4c7:3766:e938 with SMTP id
 u135-20020a62798d000000b004c73766e938mr20354648pfc.64.1643147682258; 
 Tue, 25 Jan 2022 13:54:42 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f313:ff03:9fc5:6152])
 by smtp.gmail.com with ESMTPSA id f10sm6385pfe.29.2022.01.25.13.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 13:54:41 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel-edp: Allow querying the detected panel via sysfs
Date: Tue, 25 Jan 2022 13:54:09 -0800
Message-Id: <20220125135406.1.I62322abf81dbc1a1b72392a093be0c767da9bf51@changeid>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, Douglas Anderson <dianders@chromium.org>,
 robert.foss@linaro.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, jjsu@chromium.org,
 lschyi@chromium.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently we added generic "edp-panel"s probed by EDID. To support
panels in this way we look at the panel ID in the EDID and look up the
panel in a table that has power sequence timings. If we find a panel
that's not in the table we will still attempt to use it but we'll use
conservative timings. While it's likely that these conservative
timings will work for most nearly all panels, the performance of
turning the panel off and on suffers.

We'd like to be able to reliably detect the case that we're using the
hardcoded timings without relying on parsing dmesg. This allows us to
implement tests that ensure that no devices get shipped that are
relying on the conservative timings.

Let's add a new sysfs entry to panel devices. It will have one of:
* UNKNOWN - We tried to detect a panel but it wasn't in our table.
* HARDCODED - We're not using generic "edp-panel" probed by EDID.
* A panel name - This is the name of the panel from our table.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 39 +++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 99ca1bd0091c..719c1bb6c45c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -222,6 +222,8 @@ struct panel_edp {
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *hpd_gpio;
 
+	const struct edp_panel_entry *detected_panel;
+
 	struct edid *edid;
 
 	struct drm_display_mode override_mode;
@@ -666,7 +668,6 @@ static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
 
 static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 {
-	const struct edp_panel_entry *edp_panel;
 	struct panel_desc *desc;
 	u32 panel_id;
 	char vend[4];
@@ -705,14 +706,14 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	}
 	drm_edid_decode_panel_id(panel_id, vend, &product_id);
 
-	edp_panel = find_edp_panel(panel_id);
+	panel->detected_panel = find_edp_panel(panel_id);
 
 	/*
 	 * We're using non-optimized timings and want it really obvious that
 	 * someone needs to add an entry to the table, so we'll do a WARN_ON
 	 * splat.
 	 */
-	if (WARN_ON(!edp_panel)) {
+	if (WARN_ON(!panel->detected_panel)) {
 		dev_warn(dev,
 			 "Unknown panel %s %#06x, using conservative timings\n",
 			 vend, product_id);
@@ -734,12 +735,14 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 		 */
 		desc->delay.unprepare = 2000;
 		desc->delay.enable = 200;
+
+		panel->detected_panel = ERR_PTR(-EINVAL);
 	} else {
 		dev_info(dev, "Detected %s %s (%#06x)\n",
-			 vend, edp_panel->name, product_id);
+			 vend, panel->detected_panel->name, product_id);
 
 		/* Update the delay; everything else comes from EDID */
-		desc->delay = *edp_panel->delay;
+		desc->delay = *panel->detected_panel->delay;
 	}
 
 	ret = 0;
@@ -750,6 +753,28 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 	return ret;
 }
 
+static ssize_t detected_panel_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct panel_edp *p = dev_get_drvdata(dev);
+
+	if (IS_ERR(p->detected_panel))
+		return sysfs_emit(buf, "UNKNOWN\n");
+	else if (!p->detected_panel)
+		return sysfs_emit(buf, "HARDCODED\n");
+	else
+		return sysfs_emit(buf, "%s\n", p->detected_panel->name);
+}
+
+static const DEVICE_ATTR_RO(detected_panel);
+
+static void edp_panel_remove_detected_panel(void *data)
+{
+	struct panel_edp *p = data;
+
+	device_remove_file(p->base.dev, &dev_attr_detected_panel);
+}
+
 static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 			   struct drm_dp_aux *aux)
 {
@@ -849,6 +874,10 @@ static int panel_edp_probe(struct device *dev, const struct panel_desc *desc,
 
 	drm_panel_add(&panel->base);
 
+	err = device_create_file(dev, &dev_attr_detected_panel);
+	if (!err)
+		devm_add_action_or_reset(dev, edp_panel_remove_detected_panel, panel);
+
 	return 0;
 
 err_finished_pm_runtime:
-- 
2.35.0.rc0.227.g00780c9af4-goog

