Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 139E734DEC4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 04:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2590B6E828;
	Tue, 30 Mar 2021 02:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FFC6E823
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 02:54:15 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id h25so10697310pgm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 19:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H9aZHg1XmzeEuWmP1Y9k5kwByteme6M7NQeVtbNkUCU=;
 b=C/RrhmHfFql2N/xoLubh0lDEHxjw4L7AWTRv0UuWixsW8lQIMBgwB+8VXVga1+vPpx
 tTauyVTEvRbcQpp9YFiGpINDqXOWBUqidzrOyuJk85ZUjFx8jlv8GVRroTOH154PGPGa
 8rKSWGuzQ6BYuBnDPUdGSqpTe/cxZfw84Xumo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H9aZHg1XmzeEuWmP1Y9k5kwByteme6M7NQeVtbNkUCU=;
 b=g3oVh6eV5HMlx9Do2BvKUP9b1g8s3bu0UPKfX4Dg6YH4iaz4h0Pyz3jq5kArFeKnfg
 SURYiCYrbarq15SVRdK5HqrdxIcSSePjIssTpOzoH3PiaRWHCNA0VM7rBaY6AgakZz1R
 YjhoQmsoYrrP57n9wX6lkeB/JXeaRkoiooGLDTPaeshB0Cv2Km/RfreFLBfCxf7PmNse
 kz5tbMHetmLlCyKuLzRj4KEOzMc/+THHV3N6LbozVqODwMviKygNzWGSTym0zJRgR75w
 LVSEw+qr5mcEiNuJfZ7BWiLQhNBus00wXxSD2YqYVifjapmkYGP13ctCEteImCW+PDks
 Aeuw==
X-Gm-Message-State: AOAM532C3ujqLiYaSSChwstUvLObVQB0gyKxkhKhn+1smVgEuYUPTnZe
 /vCmT8b2Fdc1CeZJ9rL3A+zCTA==
X-Google-Smtp-Source: ABdhPJxr8EyEo9d+F9iFHOxEgEe5cO7TbKD9tvtR+Kk8T89iLex2MLCh1rb01WF9K+Rd1+GvPT8R+A==
X-Received: by 2002:aa7:8a4d:0:b029:211:92f2:658c with SMTP id
 n13-20020aa78a4d0000b029021192f2658cmr28475860pfa.29.1617072854696; 
 Mon, 29 Mar 2021 19:54:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f599:1ca7:742d:6b50])
 by smtp.gmail.com with ESMTPSA id t17sm19152706pgk.25.2021.03.29.19.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 19:54:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 08/14] drm/bridge: ti-sn65dsi86: Remove extra call:
 drm_connector_update_edid_property()
Date: Mon, 29 Mar 2021 19:53:39 -0700
Message-Id: <20210329195255.v2.8.Ic14a7ab8035df89e19a25ad4fbf2004f9673f167@changeid>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210330025345.3980086-1-dianders@chromium.org>
References: <20210330025345.3980086-1-dianders@chromium.org>
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
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index a0a00dd1187c..9577ebd58c4c 100644
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
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
