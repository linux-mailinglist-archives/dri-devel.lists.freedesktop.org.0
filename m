Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C161350A695
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 19:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11A410E6B8;
	Thu, 21 Apr 2022 17:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE2410E6CD
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 17:07:46 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id p18so7593897wru.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLb9n6Vqs4Ih6Tde/WV0zahdLSPBAQf9NPHM6Jy9hzo=;
 b=LAevyX/ERqtxF65hYRvst71jOVYt9rxNi2LfjZ3L4IvPvF3WP6C6foYJwdUqmgc9Uz
 3DIsXUyUOQFeHRz3NsIo4oChjNW1OCy6txnH8L4BbdXswQosN4TMfCACw1LMm3EUoGcW
 w/YN9U3gZRYMLrDoUzse9t2+NaarYg2H3R4Qb5AEHrQDoBbfX/Umx/8r2KqHv4WnSlDg
 xGZ0YsuUYnS5tu4PO/M9Ff3iq+eFrJ/BfqjRx59gzmbdDqIj8mpYMkD+euQeJa7DJuOO
 RGO2VuwabF3TTZDyScm1NSbxJEaTFG8bAbkFTFv3WpVPXJFWGINMOtgCQ5/U2SuQXeLp
 4d4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLb9n6Vqs4Ih6Tde/WV0zahdLSPBAQf9NPHM6Jy9hzo=;
 b=6NsjqX/P9qs6cFGqYblse60hi8Zc72Z2DMLMINBUOB67AQlsypKThCcIhTLk5f5x/d
 iRTlJVqFvPJ/Oda4eaXr8RfSKJNypYVaHRDHbsTASTWlhgnDLrxDXOKVGbkEXoZzCajs
 yJueBQaU/Kppb2Uc812y1v9kfGmyXP8onAoxtO7DgeDS27AimgjcZ4mLeYuGP8YvlD14
 cl0PbPU0r4cOE+CSKyz6Qv1iWWIoBYJsABybrSZ0njAYFJhmt7g3TdhsKwhtoA4BF1iv
 DmFRH6ekqpIY3NL7Ex9mu3KUI5LF0RFLJ96lNbiQAxv6N01cn2/WDESZrGsy8le8N0dn
 csgQ==
X-Gm-Message-State: AOAM533ZxQ8XtxUZ2nut0c2PrEsFQduA90jM8v608Yyeuq+V3kEKaw06
 kDizGsqRv6s7NUb4qF2Gnek=
X-Google-Smtp-Source: ABdhPJx/kFGrmr6cOw1E9qfYzW98wPDX3Gw0oBcObPlkQWqdzFcmeXcXxIP+Db0E7MqTjK84xMOdHQ==
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id
 o8-20020a5d6488000000b00203b62870d2mr522020wri.83.1650560864504; 
 Thu, 21 Apr 2022 10:07:44 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm2963849wrf.10.2022.04.21.10.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:07:44 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: inki.dae@samsung.com
Subject: [PATCH 3/5] drm/rockchip: rk3066_hdmi: Replace
 drm_detect_hdmi_monitor() with is_hdmi
Date: Thu, 21 Apr 2022 19:07:23 +0200
Message-Id: <20220421170725.903361-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421170725.903361-1-jose.exposito89@gmail.com>
References: <20220421170725.903361-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 jernej.skrabec@gmail.com, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 samuel@sholland.org, krzk@kernel.org, linux-rockchip@lists.infradead.org,
 wens@csie.org, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 sw0312.kim@samsung.com, hjc@rock-chips.com, linux-kernel@vger.kernel.org,
 kyungmin.park@samsung.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi.

This driver calls drm_detect_hdmi_monitor() to receive the same
information and stores its own cached value, which is less efficient.

Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
instead and also remove hdmi_data_info.sink_is_hdmi as it is no longer
necessary.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 1c546c3a8998..a09dbb7d446a 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -22,7 +22,6 @@
 
 struct hdmi_data_info {
 	int vic; /* The CEA Video ID (VIC) of the current drm display mode. */
-	bool sink_is_hdmi;
 	unsigned int enc_out_format;
 	unsigned int colorimetry;
 };
@@ -317,6 +316,8 @@ static void rk3066_hdmi_config_phy(struct rk3066_hdmi *hdmi)
 static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 			     struct drm_display_mode *mode)
 {
+	struct drm_display_info *display = &hdmi->connector.display_info;
+
 	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
 	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
 
@@ -349,7 +350,7 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 
 	rk3066_hdmi_config_video_timing(hdmi, mode);
 
-	if (hdmi->hdmi_data.sink_is_hdmi) {
+	if (display->is_hdmi) {
 		hdmi_modb(hdmi, HDMI_HDCP_CTRL, HDMI_VIDEO_MODE_MASK,
 			  HDMI_VIDEO_MODE_HDMI);
 		rk3066_hdmi_config_avi(hdmi, mode);
@@ -472,7 +473,6 @@ static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	edid = drm_get_edid(connector, hdmi->ddc);
 	if (edid) {
-		hdmi->hdmi_data.sink_is_hdmi = drm_detect_hdmi_monitor(edid);
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
-- 
2.25.1

