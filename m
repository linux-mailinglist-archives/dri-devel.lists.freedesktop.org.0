Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFA450A694
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 19:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C61010E603;
	Thu, 21 Apr 2022 17:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C67C10E6B8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 17:07:43 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s25so2706778wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eKm3qfCfRTvpAFA5EAH6ryNQ7rOqn4mcVqOVEQ3yBg4=;
 b=Ni5qBNH54L+lErFbripcTI35F+F8JtthLEbq0Z0UUJSc163DjScfnStCqt9bEBOvOK
 hctqtlIoahTUOylzbbJ4kWGEMRVfn6zntL6xxtDiWk2uQSpwhsYwuLELDawTzVgiexkD
 rGi8mJrxMu88sIQgnK5khi5vuZkh+co9PLdJmPTb1WLaKrmWDuy2Se2gR8Mh1Oc+j5YU
 2ym+G7p8V5ZgmMzGmPxeE1CDk6apDaEHSgrOf0duRZ+Q2MLICnFa+O9qvASKeWIuwbvR
 Hj7i3iyl0pnsPjjSMttEQyMlkMbmJA8JJmPHcQ2Ut12rtDOq9U/mhylL8DmhUnwPy5VL
 YWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eKm3qfCfRTvpAFA5EAH6ryNQ7rOqn4mcVqOVEQ3yBg4=;
 b=ujVRWBXLtmCwz3u+tEw8MR8ca9EGnxP6qYwwcGfrQBAvNFybuQdPkMUDq3Qg9g/dVS
 /Bc7ePPnMTabTrwy6/lEycPWLr6h9dBeuI1EAqBkcy4EFyqqoiJFrSRT02VEw1flXqLm
 zkGkNCwTVOpEN5liq6neB9zDITjYsmIznIM0pTJeCFyf0uCi/t2PkNxSNEgi0sn6MTwl
 hIAGJQkwO0ZvBSNRiwRag8vKDyNFMAjYQh5tnF2Tnt5JOOHIB1/7K774ENgsE2n8V7bG
 4JGMMmaF1MXyma0XMkmGZfRkaS4QiqF6t0OeedAgNxr2v/687/5VHDiVKTx3ip0+GBDw
 oxuQ==
X-Gm-Message-State: AOAM533axfEBNhRBynX7hxoZzJ07v42oboVnNSjkZv0MHW3c37KS1MhH
 41VducBeMKjCokpFH6Dz0qY=
X-Google-Smtp-Source: ABdhPJxlCcy8zYc1BDrHUPlz44VMsFdU0skH0FV3nalzzrkpovFXfzLqOTI6phAIdGGYdymHKVzVjw==
X-Received: by 2002:a5d:5953:0:b0:206:b5c:dfe8 with SMTP id
 e19-20020a5d5953000000b002060b5cdfe8mr527391wri.35.1650560861569; 
 Thu, 21 Apr 2022 10:07:41 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.128])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020a8d859e5fsm2963849wrf.10.2022.04.21.10.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:07:41 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: inki.dae@samsung.com
Subject: [PATCH 2/5] drm/rockchip: inno_hdmi: Replace
 drm_detect_hdmi_monitor() with is_hdmi
Date: Thu, 21 Apr 2022 19:07:22 +0200
Message-Id: <20220421170725.903361-3-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/rockchip/inno_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 046e8ec2a71c..aa8b704d44a2 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -30,7 +30,6 @@
 
 struct hdmi_data_info {
 	int vic;
-	bool sink_is_hdmi;
 	bool sink_has_audio;
 	unsigned int enc_in_format;
 	unsigned int enc_out_format;
@@ -433,6 +432,8 @@ static int inno_hdmi_config_video_timing(struct inno_hdmi *hdmi,
 static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 			   struct drm_display_mode *mode)
 {
+	struct drm_display_info *display = &hdmi->connector.display_info;
+
 	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
 
 	hdmi->hdmi_data.enc_in_format = HDMI_COLORSPACE_RGB;
@@ -452,13 +453,13 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 
 	/* Set HDMI Mode */
 	hdmi_writeb(hdmi, HDMI_HDCP_CTRL,
-		    v_HDMI_DVI(hdmi->hdmi_data.sink_is_hdmi));
+		    v_HDMI_DVI(display->is_hdmi));
 
 	inno_hdmi_config_video_timing(hdmi, mode);
 
 	inno_hdmi_config_video_csc(hdmi);
 
-	if (hdmi->hdmi_data.sink_is_hdmi) {
+	if (display->is_hdmi) {
 		inno_hdmi_config_video_avi(hdmi, mode);
 		inno_hdmi_config_video_vsi(hdmi, mode);
 	}
@@ -553,7 +554,6 @@ static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	edid = drm_get_edid(connector, hdmi->ddc);
 	if (edid) {
-		hdmi->hdmi_data.sink_is_hdmi = drm_detect_hdmi_monitor(edid);
 		hdmi->hdmi_data.sink_has_audio = drm_detect_monitor_audio(edid);
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
-- 
2.25.1

