Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 243273E9B5D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 01:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE866E20B;
	Wed, 11 Aug 2021 23:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA636E203;
 Wed, 11 Aug 2021 23:51:10 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id u15so2726655ple.2;
 Wed, 11 Aug 2021 16:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Fb0UCEpX2hncAMMM+CVKUm3ptCtK2quo6PKUWz1gmE=;
 b=KoNiW8+Jp1FOFuNjlM7BjA29+/t2rZrZlR5toKTQrNfCrsL5Db/Pc8SOGuRaMceY3F
 lAcabFH8poaSyRbqMK6WI+p2Pj8xbHJanhgbTKfobbpkxtilQqDyY1HvD+S5x5HU97LD
 XapVHT3sA9RJEhHicGmmAXhe8Rn4r4UceqVnb8te9UnvVBVgS/+ASqrvgwjXzglCIia1
 TN4PbTXuUCvmDQpn+JFl+vqKyJrwAN/14JmdIISl0qnbQ80YiKjXHaU8w3CiSOS/qwm4
 qDugD9sss262vQ6IHOavNfXsxpAfu6XnGqb3Yeob5aF/Ujty0Wk4buM/biQv34vjl+27
 h/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Fb0UCEpX2hncAMMM+CVKUm3ptCtK2quo6PKUWz1gmE=;
 b=NNN30CCfnYJzcQ3yDiNunWpbqE7MQ5sppbq19066eDB9zSLcYbl1Fm4GlFXe9i55ye
 c2wA8IxqG727+wyr4KXNtmaHDBK9MFyrT+k7glFtCrCzL480EbZODw7rrHdwwfci/isV
 68fFU4cfZzTfYnzZ3NtZOngAfa7Wf501RQ+y4T7m10fPcdtNV49GLGmywMOR1SgiUju4
 CmQtgvgLPTumdMTzQnn8WTo0B8QvSMjqOFHi6740wgXVn6TzoMi1YDUfPcsFs1kocAUo
 rOS6r6DVn1k5fqvSo99iej6DnLuleuc+aSzfnsnpylkIvsSZFcFQphB97XROD34MBau7
 KQLg==
X-Gm-Message-State: AOAM533pvweweTkXAIoCLyVnIAh6qOamZuKKVmkVAX+Z6ajXqi+MhNh8
 UmnVwTtKEXPWP0yOYO0OsbiUNDuZjhjEAg==
X-Google-Smtp-Source: ABdhPJwO4Bx01d9wfp9gJdAKnj0Rh7KBf/4YtO0bD4U4QnLVZFytwRCFRg7H3VUCEIf+YQJVPDJ9Og==
X-Received: by 2002:a62:78d0:0:b029:3dd:8fc1:2797 with SMTP id
 t199-20020a6278d00000b02903dd8fc12797mr1186803pfc.65.1628725869151; 
 Wed, 11 Aug 2021 16:51:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 r9sm255420pfh.135.2021.08.11.16.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 16:51:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()
Date: Wed, 11 Aug 2021 16:52:49 -0700
Message-Id: <20210811235253.924867-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811235253.924867-1-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

For the brave new world of bridges not creating their own connectors, we
need to implement the max clock limitation via bridge->mode_valid()
instead of connector->mode_valid().

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5d3b30b2f547..38dcc49eccaf 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -595,6 +595,15 @@ static struct auxiliary_driver ti_sn_aux_driver = {
 	.id_table = ti_sn_aux_id_table,
 };
 
+static enum drm_mode_status check_mode(const struct drm_display_mode *mode)
+{
+	/* maximum supported resolution is 4K at 60 fps */
+	if (mode->clock > 594000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 /* -----------------------------------------------------------------------------
  * DRM Connector Operations
  */
@@ -616,11 +625,7 @@ static enum drm_mode_status
 ti_sn_bridge_connector_mode_valid(struct drm_connector *connector,
 				  struct drm_display_mode *mode)
 {
-	/* maximum supported resolution is 4K at 60 fps */
-	if (mode->clock > 594000)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
+	return check_mode(mode);
 }
 
 static struct drm_connector_helper_funcs ti_sn_bridge_connector_helper_funcs = {
@@ -763,6 +768,14 @@ static void ti_sn_bridge_detach(struct drm_bridge *bridge)
 	drm_dp_aux_unregister(&bridge_to_ti_sn65dsi86(bridge)->aux);
 }
 
+static enum drm_mode_status
+ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
+			const struct drm_display_info *info,
+			const struct drm_display_mode *mode)
+{
+	return check_mode(mode);
+}
+
 static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
@@ -1118,6 +1131,7 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
+	.mode_valid = ti_sn_bridge_mode_valid,
 	.pre_enable = ti_sn_bridge_pre_enable,
 	.enable = ti_sn_bridge_enable,
 	.disable = ti_sn_bridge_disable,
-- 
2.31.1

