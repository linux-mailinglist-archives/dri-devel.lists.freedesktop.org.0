Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907A33E16B4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 16:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B636EA89;
	Thu,  5 Aug 2021 14:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6626EA8C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628172481;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=rPNTJrLe19MJRB8ku5y1SEic4/RUeQD5hNIQa1PLh1Y=;
 b=aILFzPK7rF1aoLOA01Hw+nkODO9T+yCvYPaE1BP179oEUNV/v8s0rJoJmHGviArHIv
 /nXXgM4kbPyoBabrmiPfrgN7mXYwuPrWMmwlaEh2+EVhg42OkDLihCgcOtEf2caV5fkx
 7LtS91lpuAr8oXvRJt8GdOTESPsfFDJmK9Y1zPZGQwbmkKrVvvuXUNWQ2BYiIRrKAjiM
 ceIwd2+SpJzsy/KmKvl2nkHboHVXE9Mm7DMdW03Ye51OJ7Gi46jNyrfiP0prZviH3YLq
 kcUgciBB8RJS3spujLB9XWtmERVYG3+HATPpHNKHeUG4D3ClLTDAvauHddiFlL35iKJP
 7ndA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdbLzk="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x75E80781
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 5 Aug 2021 16:08:00 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/bridge: synopsis: Add mode_fixup and bridge
 timings support
Date: Thu,  5 Aug 2021 16:07:50 +0200
Message-Id: <15187eccabf39561de226acd8be40b93503cac49.1628172477.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628172477.git.hns@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

The platform-specific configuration structure is augmented with
mode_fixup and timings members so that specialisations of the
Synopsys driver can introduce mode flags and bus flags.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 16 ++++++++++++++++
 include/drm/bridge/dw_hdmi.h              |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index e7c7c9b9c646f..e8499eb11328c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2810,6 +2810,19 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	return mode_status;
 }
 
+static bool
+dw_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+			  const struct drm_display_mode *mode,
+			  struct drm_display_mode *adjusted_mode)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	if (hdmi->plat_data->mode_fixup)
+		return hdmi->plat_data->mode_fixup(bridge, mode, adjusted_mode);
+
+	return true;
+}
+
 static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 				    const struct drm_display_mode *orig_mode,
 				    const struct drm_display_mode *mode)
@@ -2883,6 +2896,7 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_disable = dw_hdmi_bridge_atomic_disable,
 	.mode_set = dw_hdmi_bridge_mode_set,
 	.mode_valid = dw_hdmi_bridge_mode_valid,
+	.mode_fixup = dw_hdmi_bridge_mode_fixup,
 	.detect = dw_hdmi_bridge_detect,
 	.get_edid = dw_hdmi_bridge_get_edid,
 };
@@ -3364,6 +3378,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
+	if (plat_data->timings)
+		hdmi->bridge.timings = plat_data->timings;
 
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 6a5716655619b..677137445d534 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -8,6 +8,7 @@
 
 #include <sound/hdmi-codec.h>
 
+struct drm_bridge;
 struct drm_display_info;
 struct drm_display_mode;
 struct drm_encoder;
@@ -140,6 +141,10 @@ struct dw_hdmi_plat_data {
 	enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
 					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
+	bool (*mode_fixup)(struct drm_bridge *bridge,
+			   const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+	const struct drm_bridge_timings *timings;
 
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
-- 
2.31.1

