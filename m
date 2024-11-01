Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6E49B8EFB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 11:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FA610E98F;
	Fri,  1 Nov 2024 10:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PnQVsbPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68910E98F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 10:19:29 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539e13375d3so2016033e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730456367; x=1731061167; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SSyJnhqtzNGB7l1kz5uHZfxocs7V67foS6FdivcD7DM=;
 b=PnQVsbPOsYRff3CIsFy+OIoYTjndc5k4hwbR5hNhRXwj614Ply+kw2wJwU3L3vhsA7
 agtRicwSrF9YJ4TB7YlEicnQ171HiXl3RPW1xNeCCmpKjVZ3R3oRGiu1ZVQowJlReQrC
 SHgauAFMWClphAO/XV14/Al3lAhv/+6jvzW1t1dHYkD03Z6vjv0QwVcbCQnN7x9tGbNn
 8YqhRvOicuJA/kxBE5AYsj/vnOQdtKC+TTQjRu2RvIWgoPP8JRWHbiEwKBZDbaOwcskX
 9lOFVx52T4y3Fm+qqu5lPK/3ZZX6Dm4g3dawwVs0xxsFHyHDHtdOp5yYPWtEYGKxWAs3
 02DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730456367; x=1731061167;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SSyJnhqtzNGB7l1kz5uHZfxocs7V67foS6FdivcD7DM=;
 b=pe7sl8dUL0rLLZGjBASPLWnZ9OsgREiTDXBCtxj7m2ncHEuaXZubJ/C0HpvZPewgMY
 19Gsb493lh2M+oxgiVEUsN5lVAxyyUQAsGw68s1hJFZd3Kh1Yp/bHu2KjJN+KDeNRcOc
 CvkMnjJoAN8gnmFWGYR1f9InbZalH9qFg5iSnHGwBl6BXG+g05R3IvwMTN+Poy2pju4O
 a3ELFcGZAvsVnXkmDbxLavLJz3yL1JHr0U6ufqxRFasp/U62nuYa0wRFZekqcok+2i5U
 J7++Uqi9j3WXi5lXmpzSiCzyk+y8Vb/7aCiVwi88fSVCVSoqmk11PfGa8y46N5TM13FE
 nhVA==
X-Gm-Message-State: AOJu0YyMMuR586kFqxthgbFYPNcDFrGmL5pCnlzdAV0z1isqMaPp27qn
 8vBMMaJIndGsM6GZ04RO4lfAykF9CdvRyZTCEFpHlLMb1kHy7QfliDBfAkW0yWg=
X-Google-Smtp-Source: AGHT+IGhSWfH6euhYW2znlkFK+r3govgY1LuFIe7fOuMV+C37e3QgH0MbPED7GtFqocAeau78Vvz7w==
X-Received: by 2002:a2e:4c12:0:b0:2f6:6074:db71 with SMTP id
 38308e7fff4ca-2fdec5f831amr26624951fa.17.1730456367449; 
 Fri, 01 Nov 2024 03:19:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 03:19:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 12:19:08 +0200
Subject: [PATCH RFC v2 7/7] drm/bridge_connector: hook
 __drm_atomic_helper_connector_hdmi_update_edid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-7-739ef9addf9e@linaro.org>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4075;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pbf6ekV+i45DFn0vAhN81yq5JTl3TzjpRpOOR4scnrw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsZAyyzFUbIF1GNuLd1ZpLZ1B2KWEi1m5jD4
 rBI+bHjpFKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGQAKCRCLPIo+Aiko
 1bv9B/9aAzBx6TyAdD0HiTY84ACPnO30AoIMqz4lY2qeZr1j/AXgrWjWY+hZqDi6N6X6s8F7ArV
 QOhiCSvJ/wBqX2oIw4oG6kn/StwLHzUzjvdq5q4vVKjwGKIh6cc8LzyoJi5L1/eI7L59vUDpn0U
 qHPk1TWzpjbuGNKpe/rT/Ds0c7458AmhADW48RgNU0NAjvbZYvcLT1IKTfs0ZTNtJlqnZnGSnA4
 KD+5OOhfX5lF5o9KH9K9DnZFeaL7wehWOzHLWlqjaWakWwIgCQzluX4lK5NCstgZnkT9XyOHW0q
 YWrQ6YVSm+zTkO8F578PtuXJBzB9WY50mHLRzLH1cDQL1qdN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 65 ++++++++++++++++++++------
 1 file changed, 51 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..4069e0f972d5fcabf7e07238583fc9ea89ab113f 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -175,17 +176,53 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector,
+			       enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	const struct drm_edid *drm_edid;
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	if (status != connector_status_connected)
+		return NULL;
+
+	drm_edid = drm_bridge_edid_read(bridge, connector);
+	if (!drm_edid_valid(drm_edid)) {
+		drm_edid_free(drm_edid);
+		return NULL;
+	}
+
+	return drm_edid;
+}
+
 static enum drm_connector_status
 drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi) {
+			const struct drm_edid *drm_edid = drm_bridge_connector_read_edid(connector,
+											 status);
+			int ret;
+
+			ret = __drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+			if (ret)
+				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
+		}
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -246,29 +283,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 	const struct drm_edid *drm_edid;
-	int n;
 
 	status = drm_bridge_connector_detect(connector, false);
 	if (status != connector_status_connected)
-		goto no_edid;
+		return 0;
 
-	drm_edid = drm_bridge_edid_read(bridge, connector);
-	if (!drm_edid_valid(drm_edid)) {
+	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
+	if (!hdmi) {
+		drm_edid = drm_bridge_connector_read_edid(connector, status);
+		if (!drm_edid) {
+			drm_edid_connector_update(connector, NULL);
+			return 0;
+		}
+
+		drm_edid_connector_update(connector, drm_edid);
 		drm_edid_free(drm_edid);
-		goto no_edid;
 	}
 
-	drm_edid_connector_update(connector, drm_edid);
-	n = drm_edid_connector_add_modes(connector);
-
-	drm_edid_free(drm_edid);
-	return n;
-
-no_edid:
-	drm_edid_connector_update(connector, NULL);
-	return 0;
+	return drm_edid_connector_add_modes(connector);
 }
 
 static int drm_bridge_connector_get_modes(struct drm_connector *connector)

-- 
2.39.5

