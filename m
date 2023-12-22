Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4684B81CDBB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7252A10E82B;
	Fri, 22 Dec 2023 17:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7986B10E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3333b46f26aso1812392f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266953; x=1703871753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sgl1aYbfeN4t6iirxrjmyWdX/BacrfEEhrH3G2xuU9s=;
 b=O1vwzewSXcanWqWt4MAsB1EC4QUAirl/69nMuTWRgLNqg2GckDs8vHGQUYfugxspA7
 UyEXvbDwr285baX0FP9aBDknc6MuxPINR1RO7JDStxvNGRyfImPrlls/2TZ0MKHkHMk4
 SakB6AERie+XeyxXTfIbvwbDLYO0/k0vtGy/Qw/LND4a0SnV7tHd+o0iPRqWU69TcQGb
 GftZfjxQSveMli+ieomxEjMd8nmxKMmSgDRIdM6lkR51ZoQhI1X3mDYfUmm2ZY9jNyEB
 mJLfzfBukGrJFTjsd/01Rf6c1yFPhTDbvnEfkXNxeioyUmwM7Biq5K/Me9anYanMlbyv
 8xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266953; x=1703871753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sgl1aYbfeN4t6iirxrjmyWdX/BacrfEEhrH3G2xuU9s=;
 b=eUpuDKyE26e7iAM97qnKPFjlL0XhzEahqRe7OsPPovZN0I53TZv6Yo/4c9KUcgvvHB
 kSIhpHqMxRO+GivWba+q33tKjcQfqoj26hys8gq/Us47noRpDzG2gS2Q5kUJFyZSXpMs
 msl1yB7VeqgjiiAWPi8rQH+GyPd754hK8LFkbXpVCoAjsK+Ap62GC6nPaDS9aq4TIagM
 Vk4J7QjsWvs03sJA+cJ38BGKJ6hPqKNEUClnyPh0b7njFrAmlYvwp+7LETWEiyhfkml3
 u7EClVv0mElpYI1k5Y93G9tEU14W9uLgqfs8nDleRse4AK9wYE9IALbTlGXCVRdH8Z8L
 tbLw==
X-Gm-Message-State: AOJu0YwNjYbN8rJMv1iRbnjrZOWjXn2s+3iWAc3r0TbnS07dnqNWew0B
 eSlbea96MPbjEHSsXhPxzw==
X-Google-Smtp-Source: AGHT+IHWWQ7yvErxF9OIA7H6637gH3kNjMNDPqZnBLODlsTBGOFq4IWWwm5YOObU5TbJYQmMyuwAkA==
X-Received: by 2002:a05:6000:230:b0:336:774c:d0f5 with SMTP id
 l16-20020a056000023000b00336774cd0f5mr1070493wrz.10.1703266952968; 
 Fri, 22 Dec 2023 09:42:32 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.32
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
Subject: [PATCH v4 15/29] drm/rockchip: inno_hdmi: Switch to infoframe type
Date: Fri, 22 Dec 2023 18:42:06 +0100
Message-ID: <20231222174220.55249-16-knaerzche@gmail.com>
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

The inno_hdmi driver relies on its own internal infoframe type matching
the hardware.

This works fine, but in order to make further reworks easier, let's
switch to the HDMI spec definition of those types.

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
 
 drivers/gpu/drm/rockchip/inno_hdmi.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 10466c2aa520..49367ca24125 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -205,33 +205,34 @@ static void inno_hdmi_reset(struct inno_hdmi *hdmi)
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
-static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi, u32 frame_index)
+static void inno_hdmi_disable_frame(struct inno_hdmi *hdmi,
+				    enum hdmi_infoframe_type type)
 {
 	struct drm_connector *connector = &hdmi->connector;
 
-	if (frame_index != INFOFRAME_AVI) {
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", frame_index);
+			"Unsupported infoframe type: %u\n", type);
 		return;
 	}
 
-	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, frame_index);
+	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
 }
 
 static int inno_hdmi_upload_frame(struct inno_hdmi *hdmi,
-				  union hdmi_infoframe *frame, u32 frame_index)
+				  union hdmi_infoframe *frame, enum hdmi_infoframe_type type)
 {
 	struct drm_connector *connector = &hdmi->connector;
 	u8 packed_frame[HDMI_MAXIMUM_INFO_FRAME_SIZE];
 	ssize_t rc, i;
 
-	if (frame_index != INFOFRAME_AVI) {
+	if (type != HDMI_INFOFRAME_TYPE_AVI) {
 		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", frame_index);
+			"Unsupported infoframe type: %u\n", type);
 		return 0;
 	}
 
-	inno_hdmi_disable_frame(hdmi, frame_index);
+	inno_hdmi_disable_frame(hdmi, type);
 
 	rc = hdmi_infoframe_pack(frame, packed_frame,
 				 sizeof(packed_frame));
@@ -255,7 +256,7 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 						      &hdmi->connector,
 						      mode);
 	if (rc) {
-		inno_hdmi_disable_frame(hdmi, INFOFRAME_AVI);
+		inno_hdmi_disable_frame(hdmi, HDMI_INFOFRAME_TYPE_AVI);
 		return rc;
 	}
 
@@ -266,7 +267,7 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 	else
 		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
-	return inno_hdmi_upload_frame(hdmi, &frame, INFOFRAME_AVI);
+	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
 }
 
 static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
-- 
2.43.0

