Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F581CDB9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E0910E81B;
	Fri, 22 Dec 2023 17:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50A810E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33666fb9318so1833340f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266952; x=1703871752; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxV163vg4WaEsUhoUGEXFBcX2Ll0vd6Pc97F0FYEm9Q=;
 b=BwBzUKLL436vn40GsVeDZQjx3RbE5e+3Qayl1rwpOD5iXGhfRqKIsObuKbgFdCv29R
 GWvAtRYE19kLsC+KmhNmdP2OAabhSqiZWEuj5qXwuEkjsdQ94Sqe296ROAnXwjsS08AO
 KPyz6a1fxAVCRj7p74KybWOw5VHaCZYcifEEYoTp+iPmwZlER51paAsTz48+tzVMyV3y
 n1J3BRxP86qx2gbQ2kQOnjkX6nVNjBw4EA75LgWpj1+oCh66UVtxIdUqqoVvBTrI7bGk
 gF9dY2dzz6MYh0NWMhvAiNWMHJM/EjlpZ27ojgyf8Vjrqe4H5sSfkP5KP+7en1UdimeW
 6GSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266952; x=1703871752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxV163vg4WaEsUhoUGEXFBcX2Ll0vd6Pc97F0FYEm9Q=;
 b=VpGfT9vG9yR9ZBDxJotY/cXoSodLhJagqD4AhT7xssWH9H+9jgKhYuXBO2XCq0nhK8
 BnlIXdJ7Zq+63EUHLF4Gk50pjiQ4VbFdRvUJX2eDwzcVJKYE1AQFFRkJ+yOStSe5FO6p
 TqZHjCkYQlXHBpYBOIYJXd5OJkQ4PMdztcrNOh/39ZGGqdVlxxewYWjhmHRYYHR7nD+1
 fObwAyZmn7UoowviDLVPZlohEtKIrAgnvHfjvHPSSW9wU2cggEDwKUXGiPiiTFNXU4GY
 ZuFhQCXqOqVY7L84M0Zr4zVKO3JKeD4f/SJXmGKO3M5297STe6K1cZ9JR+Qq8YDUDCgY
 woWQ==
X-Gm-Message-State: AOJu0YwiLx5xxEz09d/DBXbmtl1g7+07ajvWesFx+nvTjf72ZgbCoz4C
 pAzfUahgwD/FikYrTPV0Iw==
X-Google-Smtp-Source: AGHT+IECszl5yDhXXOpNKzi8n8qsuV7BMf+6/+DcPImMeEO1sJKFSTRO7RRtsvDcoVqGutyEkY+Vcg==
X-Received: by 2002:adf:e4d1:0:b0:336:5fac:d845 with SMTP id
 v17-20020adfe4d1000000b003365facd845mr1065480wrm.34.1703266952323; 
 Fri, 22 Dec 2023 09:42:32 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:32 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 14/29] drm/rockchip: inno_hdmi: Move infoframe disable to
 separate function
Date: Fri, 22 Dec 2023 18:42:05 +0100
Message-ID: <20231222174220.55249-15-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222174220.55249-1-knaerzche@gmail.com>
References: <20231222174220.55249-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <mripard@kernel.org>

The code to upload infoframes to the controller uses a weird construct
which, based on the previous function call return code, will either
disable or enable that infoframe.

In order to get rid of that argument, let's split the function to
disable the infoframe into a separate function and make it obvious what
we are doing in the error path.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - added my SoB

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 46 ++++++++++++++++++----------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 5c9f1325441f..10466c2aa520 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -205,34 +205,44 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
-static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi, int setup_rc,
-				  union hdmi_infoframe *frame, u32 frame_index)
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
 {
 	struct drm_connector *connector = &hdmi->connector;
 
 	if (frame_index != INFOFRAME_AVI) {
 		drm_err(connector->dev,
 			"Unsupported infoframe type: %u\n", frame_index);
-		return 0;
+		return;
 	}
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, frame_index);
+}
 
-	if (setup_rc >= 0) {
-		u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
-		ssize_t rc, i;
-
-		rc = hdmi_infoframe_pack(frame, packed_frame,
-					 sizeof(packed_frame));
-		if (rc < 0)
-			return rc;
+static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
+				  union hdmi_infoframe *frame, u32 frame_index)
+{
+	struct drm_connector *connector = &hdmi->connector;
+	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
+	ssize_t rc, i;
 
-		for (i = 0; i < rc; i++)
-			hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
-				    packed_frame[i]);
+	if (frame_index != INFOFRAME_AVI) {
+		drm_err(connector->dev,
+			"Unsupported infoframe type: %u\n", frame_index);
+		return 0;
 	}
 
-	return setup_rc;
+	inno_hdmi_disable_frame(hdmi, frame_index);
+
+	rc = hdmi_infoframe_pack(frame, packed_frame,
+				 sizeof(packed_frame));
+	if (rc < 0)
+		return rc;
+
+	for (i = 0; i < rc; i++)
+		hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_ADDR + i,
+			    packed_frame[i]);
+
+	return 0;
 }
 
 static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
@@ -244,6 +254,10 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 	rc = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
 						      &hdmi->connector,
 						      mode);
+	if (rc) {
+		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI);
+		return rc;
+	}
 
 	if (hdmi->hdmi_data.enc_out_format == HDMI_COLORSPACE_YUV444)
 		frame.avi.colorspace = HDMI_COLORSPACE_YUV444;
@@ -252,7 +266,7 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 	else
 		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, rc, &frame, INFOFRAME_AVI);
+	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
-- 
2.43.0

