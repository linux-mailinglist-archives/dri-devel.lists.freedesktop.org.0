Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE735310F
	for <lists+dri-devel@lfdr.de>; Sat,  3 Apr 2021 00:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428956F39F;
	Fri,  2 Apr 2021 22:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B512D6F39D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 22:29:34 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id q5so4354903pfh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Apr 2021 15:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LM7RMNcQZM8p5h41F/TtPYKzf6ZXd9Mgd1LpZEG6inw=;
 b=PlyqJUC50sx5zn0/47YDciZkbiyJ8LRzKp3zJwBVfKGSe+VkeZYyiodikasjHz8fsh
 M0mBw/L2StCjYLMNqS4c/zI1Ft92EESt5SGVyWw8A17Ctf1b8SwaTEuWZyPL91cniBKF
 WL2GOJnfjKAQYgR5Dq+tSNuWcyZvd8NjSb6ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LM7RMNcQZM8p5h41F/TtPYKzf6ZXd9Mgd1LpZEG6inw=;
 b=PzJdiqvibdNEHDFdBhzTCtqM3ckrI3S/M8MG/hz7wEpdGxAC5fd+UffuxOdKtGsp37
 Tptql7c6z3LqZtIuvdfpiMWxrqNyvprYEvpRq137rqhMj7n9edPjxXVlsr8IIiP2olaz
 m8wnsz5uf01GSyzr4rwjq7gDbe3+yG23fXiOzrvsibnvUT8rf4jMyt1ve+UJ+uRP/c+O
 8FwWTd7CrtVKy0hZ0BAUcQoaQESP/8ignCxxYWVFbaa9W1xOP3G0JTZM9IVME3gW6ylM
 SeRrSZZwkG5o5Pk69GcWExjVMUQoqr3ZJTPaS92FRY5cnILUAsLYLS8cuznGMK6/Rneg
 H7iA==
X-Gm-Message-State: AOAM533gvBTSWFz4DGLp5GZDODK8xoqz28ZOvB1lGhlrMUIETH0gp2M0
 CZfcyzTZJLd3h1a+AlYiNHQprQ==
X-Google-Smtp-Source: ABdhPJxWGKyCxGLU83T7rVZlMq20Szif/yIsu/zpitphqaDLhG+i5KKTABmUjLOvxO8CvTXttJ+ZAg==
X-Received: by 2002:a62:7b0b:0:b029:1ef:1999:1d57 with SMTP id
 w11-20020a627b0b0000b02901ef19991d57mr13977185pfc.19.1617402574407; 
 Fri, 02 Apr 2021 15:29:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6c58:fab2:c5e2:f2d7])
 by smtp.gmail.com with ESMTPSA id t16sm9233094pfc.204.2021.04.02.15.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 15:29:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 07/12] drm/bridge: ti-sn65dsi86: Remove extra call:
 drm_connector_update_edid_property()
Date: Fri,  2 Apr 2021 15:28:41 -0700
Message-Id: <20210402152701.v3.7.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402222846.2461042-1-dianders@chromium.org>
References: <20210402222846.2461042-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit 5186421cbfe2 ("drm: Introduce epoch counter to
drm_connector") the drm_get_edid() function calls
drm_connector_update_edid_property() for us. There's no reason for us
to call it again.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 51db30d573c1..6390bc58f29a 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -270,7 +270,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn_bridge *pdata = connector_to_ti_sn_bridge(connector);
 	struct edid *edid = pdata->edid;
-	int num, ret;
+	int num;
 
 	if (!edid) {
 		pm_runtime_get_sync(pdata->dev);
@@ -279,12 +279,9 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	}
 
 	if (edid && drm_edid_is_valid(edid)) {
-		ret = drm_connector_update_edid_property(connector, edid);
-		if (!ret) {
-			num = drm_add_edid_modes(connector, edid);
-			if (num)
-				return num;
-		}
+		num = drm_add_edid_modes(connector, edid);
+		if (num)
+			return num;
 	}
 
 	return drm_panel_get_modes(pdata->panel, connector);
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
