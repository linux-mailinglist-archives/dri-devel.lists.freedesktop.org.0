Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB4E6BA5CF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 04:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9C810E8F1;
	Wed, 15 Mar 2023 03:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509DD10E8FE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 03:55:19 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so551992pjz.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 20:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678852519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UR5Snc3M6kE4bbPG5fLurLAjOBbquSwKDwwKT7rp0HU=;
 b=hOFv5NxgdftfiStX4TRWv884J/ivID9MdwbTZgkw7Y+3r4Yg1Iw5QpaSeSENO+8Dnw
 BLja3KBei0oVpkyX0rLlRHAiVEn+9cWTjpcrmvtDepEtZDDeZdex+boj3fwO7e2iJ2h8
 Z8ZsnCO5i86z/6QfbvDCOVzVZNcztUaAfRt1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678852519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UR5Snc3M6kE4bbPG5fLurLAjOBbquSwKDwwKT7rp0HU=;
 b=2zhGt7F97Y1LSG7A3DACTrUFM83NOgVMYNySerDSrPUMIhK3zNoGvBYQRCWcbr4tYI
 BUrb0lAptEubpY04nA/JrHsArv419hJW01uZ9q91qr8MiNt2oeZLE+s8YKr5YmlX1IIG
 xvpmNP2tKLimTpt8yyQEQ66NmJj9/l2A0suGhjGihZGYXUbwcUR8ETn0irOi3sBgakdI
 CsZjuv9EfH2vpWR7fjbebze+qEP5qVCu1A6DFIVxJKZUp7s2WfaAhP5xQazIOi35Q1MM
 YRAkPGBM2y8DJFXdazhFutyUqDZ3TBEbMLBYCt9ek2KV7rJNgkNd9V4YPJwP5ESuitiv
 ck4g==
X-Gm-Message-State: AO0yUKWvKx063OEBDXBXNPuh+PdhrMZrfg/FoEzd73dSpDc+RrUAqTYW
 o1UFRZiCT3N+50tT85zursGnSg==
X-Google-Smtp-Source: AK7set+eyLkMyOObG/kj3l6Dhx1fJbEltApMhR8KbXej+L5VZL0UnhT5fjyoZmLOLlwZS8u20A3v6w==
X-Received: by 2002:a17:90b:3b90:b0:233:ebd4:301c with SMTP id
 pc16-20020a17090b3b9000b00233ebd4301cmr18867349pjb.1.1678852518901; 
 Tue, 14 Mar 2023 20:55:18 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:3a77:bf68:24f0:1c75])
 by smtp.gmail.com with ESMTPSA id
 z31-20020a17090a6d2200b001fde655225fsm3208372pjj.2.2023.03.14.20.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 20:55:18 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/2] drm/bridge: ps8640: Add a cache for EDID
Date: Wed, 15 Mar 2023 11:55:08 +0800
Message-Id: <20230315035508.2874915-2-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230315035508.2874915-1-treapking@chromium.org>
References: <20230315035508.2874915-1-treapking@chromium.org>
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When there are multiple EDID reads, the bridge will be repeatedly
enabled and disabled. Add a cache for EDID to speed this up.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Remove the NULL assignment in ps8640_remove

 drivers/gpu/drm/bridge/parade-ps8640.c | 60 +++++++++++++++-----------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 08de501c436e..cddbfe91f75e 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -105,6 +105,7 @@ struct ps8640 {
 	struct gpio_desc *gpio_reset;
 	struct gpio_desc *gpio_powerdown;
 	struct device_link *link;
+	struct edid *edid;
 	bool pre_enabled;
 	bool need_post_hpd_delay;
 };
@@ -543,34 +544,37 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	bool poweroff = !ps_bridge->pre_enabled;
-	struct edid *edid;
 
-	/*
-	 * When we end calling get_edid() triggered by an ioctl, i.e
-	 *
-	 *   drm_mode_getconnector (ioctl)
-	 *     -> drm_helper_probe_single_connector_modes
-	 *        -> drm_bridge_connector_get_modes
-	 *           -> ps8640_bridge_get_edid
-	 *
-	 * We need to make sure that what we need is enabled before reading
-	 * EDID, for this chip, we need to do a full poweron, otherwise it will
-	 * fail.
-	 */
-	if (poweroff)
-		drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
+	if (!ps_bridge->edid) {
+		/*
+		 * When we end calling get_edid() triggered by an ioctl, i.e
+		 *
+		 *   drm_mode_getconnector (ioctl)
+		 *     -> drm_helper_probe_single_connector_modes
+		 *        -> drm_bridge_connector_get_modes
+		 *           -> ps8640_bridge_get_edid
+		 *
+		 * We need to make sure that what we need is enabled before
+		 * reading EDID, for this chip, we need to do a full poweron,
+		 * otherwise it will fail.
+		 */
+		if (poweroff)
+			drm_atomic_bridge_chain_pre_enable(bridge,
+							   connector->state->state);
 
-	edid = drm_get_edid(connector,
-			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
+		ps_bridge->edid = drm_get_edid(connector,
+					       ps_bridge->page[PAGE0_DP_CNTL]->adapter);
 
-	/*
-	 * If we call the get_edid() function without having enabled the chip
-	 * before, return the chip to its original power state.
-	 */
-	if (poweroff)
-		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
+		/*
+		 * If we call the get_edid() function without having enabled the
+		 * chip before, return the chip to its original power state.
+		 */
+		if (poweroff)
+			drm_atomic_bridge_chain_post_disable(bridge,
+							     connector->state->state);
+	}
 
-	return edid;
+	return drm_edid_duplicate(ps_bridge->edid);
 }
 
 static void ps8640_runtime_disable(void *data)
@@ -767,6 +771,13 @@ static int ps8640_probe(struct i2c_client *client)
 	return ret;
 }
 
+static void ps8640_remove(struct i2c_client *client)
+{
+	struct ps8640 *ps_bridge = i2c_get_clientdata(client);
+
+	kfree(ps_bridge->edid);
+}
+
 static const struct of_device_id ps8640_match[] = {
 	{ .compatible = "parade,ps8640" },
 	{ }
@@ -775,6 +786,7 @@ MODULE_DEVICE_TABLE(of, ps8640_match);
 
 static struct i2c_driver ps8640_driver = {
 	.probe_new = ps8640_probe,
+	.remove = ps8640_remove,
 	.driver = {
 		.name = "ps8640",
 		.of_match_table = ps8640_match,
-- 
2.40.0.rc1.284.g88254d51c5-goog

