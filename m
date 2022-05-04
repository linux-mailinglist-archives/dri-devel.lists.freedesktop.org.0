Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B34D519E3B
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7C010FACA;
	Wed,  4 May 2022 11:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C33410F8E5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:41:40 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id g8so926804pfh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TNPlXaEmj37H/XyiSN7nG521CkkUGoBXiE5YF2Z5qG0=;
 b=W23KQ0WeqFlxnCOSps5cLVcwcVh6Qz7tOewfKpjXBCM1gl66u4IkUsizjNQPEQqM0G
 UjvbGS7X/Q9oX+pIbxOYHYKFv1ZLiFqIp3zqdWXdA+xbHzdok+95ls72XhCuLDcgE/6z
 gkB7Oe6btsHzmhLRMJvOqqjrFs+SOvydFmDxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TNPlXaEmj37H/XyiSN7nG521CkkUGoBXiE5YF2Z5qG0=;
 b=tZhYe89RY1Qiw5wQIXrGeFHBX7hXwdtWTnQksAoxe6lnw8MUY50NW24RQTt+FxIrai
 5aBgmMBhanzyspkDMijUwoE8oBJTpKyDLWu0z2LhhbWFICb1DM3R2iynyWcfHphP9hxQ
 3W9cumIT+VG3O4cZ66OVxP1XlwUns9lf0u4bMXBYypdiHLhJ9YibjaVKkBz1+F5qjS4p
 LWwfZfdO10ZuVNxWpmcqOBiGGaevDWc/mXZLldD9HM5FeSj/PS8jM4zZyteq76Qj/3BS
 5bfMYDYhQxrt5bAsU/NkkeVDWqss2SnkYxpSKU6loe+EVwL7EI3nY8559uYS54Dsx8us
 Xvpw==
X-Gm-Message-State: AOAM530p7c3MwEE4XFkWnz/5m0r3cJDtLNGSzkrtKUTEgzPxLPdOeyb0
 c2dNo0XQyChX/seIuqKfAqHTAQ==
X-Google-Smtp-Source: ABdhPJyv8VNO7htE1aPmEI9LyKFPxkk/Vzl4wCatKzMnHMX6jp0KFeZzw20uWNgMty33rcJA2rSp4w==
X-Received: by 2002:a63:8a43:0:b0:3c2:2b52:848a with SMTP id
 y64-20020a638a43000000b003c22b52848amr11078595pgd.1.1651664499987; 
 Wed, 04 May 2022 04:41:39 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:41:39 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
Date: Wed,  4 May 2022 17:10:17 +0530
Message-Id: <20220504114021.33265-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixing up the mode flags is required in order to correlate the
correct sync flags of the surrounding components in the chain
to make sure the whole pipeline can work properly.

So, handle the mode flags via bridge, atomic_check.

v2:
* none

v1:
* fix mode flags in atomic_check instead of mode_fixup

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b618e52d0ee3..bd78cef890e4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+
+	return 0;
+}
+
 static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 				  const struct drm_display_mode *mode,
 				  const struct drm_display_mode *adjusted_mode)
@@ -1361,6 +1374,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
-- 
2.25.1

