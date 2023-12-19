Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F2818D34
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7752110E49B;
	Tue, 19 Dec 2023 17:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E39210E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33662243274so1561585f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005281; x=1703610081; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=61BEi2enFRPw/8EyUZ5EsB7jHaGAUQBqgpyqmRd+nco=;
 b=DOP2xjYdFcBCzBhr108DdJHXiz56aRIE9qGsDMVVMpDwrzUoO6cZK22uFk0AIbXQtO
 FnV6Q5QQwlBIxJLptk7L/lWQnMuC4I0LSVCVufDLKxaMppq/Ve8BJ668Z/a7HvCgpvJI
 TS417LrKufbPyTCE3KnbXbN/8WgdLruLgRDkOAnxX8XvyVTykMGpEokRyFqJUuECeI4G
 Vrru/ro06rPB38gfyUyl/8/tLW3JjEl6hhKGhR3+58ZNIt2CDd68QqheQ96z97UaQMyE
 ss8IYkBcxKddSBRSV/wumXD9MmrnuEVG8VYVVNEq2Wu46S0G8tobvnQ0j3xgiv1wfAY0
 Bg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005281; x=1703610081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=61BEi2enFRPw/8EyUZ5EsB7jHaGAUQBqgpyqmRd+nco=;
 b=lm2G8rvSoUsHcAebANBmQI1fzue2NT7iGuNE9conDjwIE9rQ9UVlu5oEvND5h+JOX3
 OnmYKOXIzlSF1Xs2dCU5yLaYMRsb+7aBr7A36mOyg6unjv9NxLJnqXCdMooZBV8H8wWF
 +H1npBWzsvQ9S3wMS61MUDqEtwr1g3lWCPmfOXywRsbioBAldaOhvYMFHs2qpQP4ZP4V
 IfNkChK2lpP93GVbcotgReUIRhVkNvnBV1H2CnYFJw86bnD+Lnkf151DwopbRauzv9Pj
 bhNtACRG3x7lffybonqjLtgDfUciU9WvamPcxKOORa1jpXlgNQ2DW7m2lgyJgghED39e
 ta8A==
X-Gm-Message-State: AOJu0YxQfTLw4Sv2kBFgBTE/yNe6G4bQG0YB4MjJmAeRXi5s3PscquoF
 CWiMdL+mHQSPNMB8dWZjtQ==
X-Google-Smtp-Source: AGHT+IFvZaeGlrEwLMNNw21eXmXhkFIQZ/fJCEgjVKuGgxweCAiX31aApdPOXaMkdZasYRNKTPgA7w==
X-Received: by 2002:a05:600c:3115:b0:40d:177b:c3b3 with SMTP id
 g21-20020a05600c311500b0040d177bc3b3mr847099wmo.18.1703005280608; 
 Tue, 19 Dec 2023 09:01:20 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:20 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 15/29] drm/rockchip: inno_hdmi: Switch to infoframe type
Date: Tue, 19 Dec 2023 18:00:45 +0100
Message-ID: <20231219170100.188800-16-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231219170100.188800-1-knaerzche@gmail.com>
References: <20231219170100.188800-1-knaerzche@gmail.com>
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

