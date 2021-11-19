Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21563457138
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 15:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD5E6E9FA;
	Fri, 19 Nov 2021 14:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552676EA01
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 14:53:45 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id b68so9545858pfg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=arsVDpo4dPzPIVSn/FusO2EnJGazLue6DTu5xtQ1Wc4=;
 b=lNkIkhaudWzoVTvDSAd7hYU1vYlVCXfJBOEpw8KSbYIHHpWWgIuLKLUe5OZ+usaeh1
 YLkjocXTH6IKtx2Zc729zsYoXlPgQJRF1ZdtJt1ibWtruAlEXsc7FUvhcxr+JE9GgG++
 q7WNkwkirAUZsPcP3d4ECdrWwvY/xw7ewdXWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=arsVDpo4dPzPIVSn/FusO2EnJGazLue6DTu5xtQ1Wc4=;
 b=SpGnigiw8gGpRp1qK5/ClmwolXt75USL9SHDuy5ZPjAGz84rc72d0TzkNzcLELGIWy
 UJw7HsHLsYdndFfyROrxjzxKShL4b/+9uZwsG6CgWg6cURe5wc35VX7yPbDSEiIWolkj
 PEuSMNhx5bLgkzu/lEBD6SaiX44Nk34qnEMNO54axbqs8FeZG6+JXVIk+JWNssxZMKvG
 jElxYRWfTfJbO3SGiOeM0r1kcElus7iRm/KSDL3mkWiYVsXc4KWD2+cfXFNIRxu2cDXD
 8GFr6I42qXq9plbyKFIUDd95XvNfgRW+yJb92zMYbzXcfyme8ONB+AnR/y3uduBfAj2E
 kQUw==
X-Gm-Message-State: AOAM532rkWjo6popayEkAX0qc6L5zefXr5I7PnrgzAAgU/V5DO3exy4s
 Bpbm5u4brwl8In0XFcecG6JO6w==
X-Google-Smtp-Source: ABdhPJzwwtqVfze6WdgU2WemIHw5txyx31AsLH10HrwpykM4M4h1k0i5TNtgBHIxbBwe5O+7JyHrCw==
X-Received: by 2002:a63:1b22:: with SMTP id b34mr2609225pgb.331.1637333624888; 
 Fri, 19 Nov 2021 06:53:44 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:35da:1c92:84b8:d096])
 by smtp.gmail.com with ESMTPSA id q11sm3368033pfk.192.2021.11.19.06.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:53:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/2] drm/bridge: chipone-icn6211: Switch to atomic operations
Date: Fri, 19 Nov 2021 20:23:24 +0530
Message-Id: <20211119145325.1775046-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace atomic version of the pre_enable/enable/post_disable
operations to continue the transition to the atomic API.

Also added default drm atomic operations for duplicate, destroy
and reset state API's in order to have smooth transition on
atomic API's.

Tested on Allwinner R16/R40 DSI.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index a6151db95586..77b3e2c29461 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -4,6 +4,7 @@
  * Author: Jagan Teki <jagan@amarulasolutions.com>
  */
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_mipi_dsi.h>
@@ -61,7 +62,8 @@ static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
 		chipone_dsi_write(icn, d, ARRAY_SIZE(d));	\
 	}
 
-static void chipone_enable(struct drm_bridge *bridge)
+static void chipone_atomic_enable(struct drm_bridge *bridge,
+				  struct drm_bridge_state *old_bridge_state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 	struct drm_display_mode *mode = bridge_to_mode(bridge);
@@ -114,7 +116,8 @@ static void chipone_enable(struct drm_bridge *bridge)
 	usleep_range(10000, 11000);
 }
 
-static void chipone_pre_enable(struct drm_bridge *bridge)
+static void chipone_atomic_pre_enable(struct drm_bridge *bridge,
+				      struct drm_bridge_state *old_bridge_state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 	int ret;
@@ -145,7 +148,8 @@ static void chipone_pre_enable(struct drm_bridge *bridge)
 	usleep_range(10000, 11000);
 }
 
-static void chipone_post_disable(struct drm_bridge *bridge)
+static void chipone_atomic_post_disable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 
@@ -169,10 +173,13 @@ static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flag
 }
 
 static const struct drm_bridge_funcs chipone_bridge_funcs = {
-	.attach = chipone_attach,
-	.post_disable = chipone_post_disable,
-	.pre_enable = chipone_pre_enable,
-	.enable = chipone_enable,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable	= chipone_atomic_pre_enable,
+	.atomic_enable		= chipone_atomic_enable,
+	.atomic_post_disable	= chipone_atomic_post_disable,
+	.attach			= chipone_attach,
 };
 
 static int chipone_parse_dt(struct chipone *icn)
-- 
2.25.1

