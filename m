Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6729365A06
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 15:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41636E828;
	Tue, 20 Apr 2021 13:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 22E6B6E81E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 13:26:46 +0000 (UTC)
X-UUID: 14eedb80464c4e94a60d4d3755ee0d11-20210420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QRFvcRSzDacuRP/Rwmj28XFP20juDpAYqgUzkpxAhQw=; 
 b=bVPoYDlJnu4V6bKP6mbt71gvkbw9VveTWYMGoBFZHtYGWdWc55etAOqNdyujddf+9RvEZ8fUvIV1nr+v/36HMFZCOYDH0ZoaP/CRx+KbwoX9uFIc9RBzU+c/QzyZLSUKo4lQ6TW9pa8Ds8Jm0nsKEYRXlBg3Aba8RpoWYNWDNy0=;
X-UUID: 14eedb80464c4e94a60d4d3755ee0d11-20210420
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1991307290; Tue, 20 Apr 2021 21:26:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Apr 2021 21:26:17 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Apr 2021 21:26:16 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] drm/panel: seperate panel power control from panel
 prepare/unprepare
Date: Tue, 20 Apr 2021 21:26:10 +0800
Message-ID: <20210420132614.150242-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 16A2BD5518165BF9873764FF788E4A99C5B0F7B7B0771DF8C7B7BBDDAE541BAA2000:8
X-MTK: N
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some dsi panels require the dsi lanes keeping low before panel power
on. So seperate the panel power control and the communication with panel.

And put the power control in drm_panel_prepare_power and
drm_panel_unprepare_power. Put the communication with panel in
drm_panel_prepare and drm_panel_unprepare.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/bridge/panel.c | 17 +++++++++++++++
 drivers/gpu/drm/drm_panel.c    | 38 ++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h       |  2 ++
 include/drm/drm_panel.h        | 17 +++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 0ddc37551194..a19c96e710fc 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -125,6 +125,23 @@ static int panel_bridge_get_modes(struct drm_bridge *bridge,
 	return drm_panel_get_modes(panel_bridge->panel, connector);
 }
 
+int panel_bridge_prepare_power(struct drm_bridge *bridge)
+{
+	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+
+	return drm_panel_prepare_power(panel_bridge->panel);
+}
+EXPORT_SYMBOL(panel_bridge_prepare_power);
+
+int panel_bridge_unprepare_power(struct drm_bridge *bridge)
+{
+        struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
+
+        return drm_panel_unprepare_power(panel_bridge->panel);
+}
+EXPORT_SYMBOL(panel_bridge_unprepare_power);
+
+
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..7bb5185db17d 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -115,6 +115,24 @@ int drm_panel_prepare(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_prepare);
 
+/**
+ * drm_panel_prepare_power - power on a panel's power
+ * @panel: DRM panel
+ *
+ * Calling this function will enable power and deassert any reset signals to
+ * the panel.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_prepare_power(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->prepare_power)
+		return panel->funcs->prepare_power(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+EXPORT_SYMBOL(drm_panel_prepare_power);
+
 /**
  * drm_panel_unprepare - power off a panel
  * @panel: DRM panel
@@ -138,6 +156,26 @@ int drm_panel_unprepare(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_unprepare);
 
+/**
+ * drm_panel_unprepare_power - power off a panel
+ * @panel: DRM panel
+ *
+ * Calling this function will completely power off a panel (assert the panel's
+ * reset, turn off power supplies, ...). After this function has completed, it
+ * is usually no longer possible to communicate with the panel until another
+ * call to drm_panel_prepare_power and drm_panel_prepare().
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_panel_unprepare_power(struct drm_panel *panel)
+{
+	if (panel && panel->funcs && panel->funcs->unprepare_power)
+		return panel->funcs->unprepare_power(panel);
+
+	return panel ? -ENOSYS : -EINVAL;
+}
+EXPORT_SYMBOL(drm_panel_unprepare_power);
+
 /**
  * drm_panel_enable - enable a panel
  * @panel: DRM panel
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 2195daa289d2..cc94c9da47d8 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -892,6 +892,8 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 						   struct drm_panel *panel,
 						   u32 connector_type);
 struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
+int panel_bridge_prepare_power(struct drm_bridge *bridge);
+int panel_bridge_unprepare_power(struct drm_bridge *bridge);
 #endif
 
 #endif
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 33605c3f0eba..48e83712ad44 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -68,6 +68,13 @@ enum drm_panel_orientation;
  * functionality to enable/disable backlight.
  */
 struct drm_panel_funcs {
+	/**
+	 * @prepare_power:
+	 *
+	 * Turn on panel power.
+	 */
+	int (*prepare_power)(struct drm_panel *panel);
+
 	/**
 	 * @prepare:
 	 *
@@ -115,6 +122,13 @@ struct drm_panel_funcs {
 	int (*get_modes)(struct drm_panel *panel,
 			 struct drm_connector *connector);
 
+	/**
+	 * @unprepare_power:
+	 *
+	 * Turn off panel_power.
+	 */
+	int (*unprepare_power)(struct drm_panel *panel);
+
 	/**
 	 * @get_timings:
 	 *
@@ -180,6 +194,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 
+int drm_panel_prepare_power(struct drm_panel *panel);
+int drm_panel_unprepare_power(struct drm_panel *panel);
+
 int drm_panel_prepare(struct drm_panel *panel);
 int drm_panel_unprepare(struct drm_panel *panel);
 
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
