Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8E1661401
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E023410E23B;
	Sun,  8 Jan 2023 07:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4594B10E20B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:26:05 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b3so8339531lfv.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 23:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UqXevD+zn0cGW9m9k0kXGrlQ8TzoQsHyNoh291zM7dc=;
 b=sUnuEPXHH6fUG1s9exm7c9Pc0/RHn7HCRH9+vByolQJongJmtjaY0OKDvVdIOJ3AaE
 f80Y2XaALUaZ8zU8gmeXKfpPlRHMAHTDuRaYqDAtOICUbXm/0eltJDMuzxCmH4+12sLx
 Ml55dKG8sI5tpUYMphFKnCQMsEFpSe3G1Q8fS97iOgjSFKrcbNszx9V5W8V7VxoyXDAO
 abdIU29c5igez7JAcHKHvvOR/I8Y+T1dMvdBC1zzPV0dXN/pmUa+A/88y72JwnwaTlyS
 mKmlaJVtGBZVjdJ146spWlzO68xq880u/BX42kt22f2IDOXpc/UO5lGYckE7fM6jtc8F
 CcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UqXevD+zn0cGW9m9k0kXGrlQ8TzoQsHyNoh291zM7dc=;
 b=PNTavJU9Mx7d8BMWlvRjiUBHIPTFEWc/7Nr8bBNE3QRewUqxR6uc8AHAwCqjUwF2H0
 SkJugptiVbTAGo8EURIwlSLx3xGCSrWehM31xhD7/x/TDMaY96Vfu4CKuJ166ngORQl+
 7edp9WhNPmkhQW5sC3Gc/vyTRN2JNeUuaFcbF1pQZKmPoybAZeeQ6yXjPA0KyEjrcN2W
 eRktvcjBp+o9wmWV+7xnIYv4vHz6PhoHkHNM1wB9/HSpgYqbWzipn3W7tdrznPR3/53r
 r0xP2YcIBcqyHa6DYJqGT5d5BclUUnorJuQCfVmZ0ia+dUq4nII7eFpDFbs+920cL0K2
 DyGw==
X-Gm-Message-State: AFqh2kqkrk8MvaLv1YhsKY7ISxrsRtR5130V1z/uNjejFl0uKamLY3oN
 mrVn4S1P6ZM4j+twifwduLRkkA==
X-Google-Smtp-Source: AMrXdXvU9lFIeEcTQXT7xd+gdplEDWKgKjlA32HvtX6wcC3eFNBqxngXu52ZKNxAwgDKo4DEFXwH3w==
X-Received: by 2002:a05:6512:3901:b0:4a4:68b7:e71c with SMTP id
 a1-20020a056512390100b004a468b7e71cmr16493081lfu.6.1673162764842; 
 Sat, 07 Jan 2023 23:26:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:26:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 12/12] drm/bridge: lt9611: stop filtering modes via the table
Date: Sun,  8 Jan 2023 09:25:55 +0200
Message-Id: <20230108072555.2905260-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The lt9611 bridge can support different modes, it makes no sense to list
them in the table. Drop the table and check the number of interfaces
using the fixed value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 41 +++----------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 82af1f954cc6..5acee43f1547 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -84,24 +84,6 @@ static const struct regmap_config lt9611_regmap_config = {
 	.num_ranges = ARRAY_SIZE(lt9611_ranges),
 };
 
-struct lt9611_mode {
-	u16 hdisplay;
-	u16 vdisplay;
-	u8 vrefresh;
-	u8 lanes;
-	u8 intfs;
-};
-
-static struct lt9611_mode lt9611_modes[] = {
-	{ 3840, 2160, 30, 4, 2 }, /* 3840x2160 24bit 30Hz 4Lane 2ports */
-	{ 1920, 1080, 60, 4, 1 }, /* 1080P 24bit 60Hz 4lane 1port */
-	{ 1920, 1080, 30, 3, 1 }, /* 1080P 24bit 30Hz 3lane 1port */
-	{ 1920, 1080, 24, 3, 1 },
-	{ 720, 480, 60, 4, 1 },
-	{ 720, 576, 50, 2, 1 },
-	{ 640, 480, 60, 2, 1 },
-};
-
 static struct lt9611 *bridge_to_lt9611(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct lt9611, bridge);
@@ -603,21 +585,6 @@ static int lt9611_regulator_enable(struct lt9611 *lt9611)
 	return 0;
 }
 
-static struct lt9611_mode *lt9611_find_mode(const struct drm_display_mode *mode)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(lt9611_modes); i++) {
-		if (lt9611_modes[i].hdisplay == mode->hdisplay &&
-		    lt9611_modes[i].vdisplay == mode->vdisplay &&
-		    lt9611_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
-			return &lt9611_modes[i];
-		}
-	}
-
-	return NULL;
-}
-
 static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
@@ -832,12 +799,12 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 						     const struct drm_display_info *info,
 						     const struct drm_display_mode *mode)
 {
-	struct lt9611_mode *lt9611_mode = lt9611_find_mode(mode);
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
-	if (!lt9611_mode)
-		return MODE_BAD;
-	else if (lt9611_mode->intfs > 1 && !lt9611->dsi1)
+	if (mode->hdisplay >= 3840 && drm_mode_vrefresh(mode) >= 31)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->hdisplay > 2000 && !lt9611->dsi1)
 		return MODE_PANEL;
 	else
 		return MODE_OK;
-- 
2.39.0

