Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE3818D4A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C902110E502;
	Tue, 19 Dec 2023 17:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F82410E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:18 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c517d0de5so51733585e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005276; x=1703610076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iFJnc/mxwT7AOuXgJJftqh12jwZWWgTZW7pO4s+kLaU=;
 b=CvPPDz6HScoQNTPnvRdSg2jhL2tcODYQXnOYpe7BFxjyn2EDFewKw0V9QVaL1Qceft
 xze/QuerahXcb9aPvmYewZKdhoEGL2vSUhh06dUQ+C7tLZh1qbt7o88gFrkOre1OvPHh
 KPDmZnE5nbzFwTvDifomowvOfIPWAP80fIZH1gqln6rVnhhMsLaYTxyZoS1Dn0dXtQo+
 FaAp7Eh6aGJ7kBqSI6d2t92aLEWCsVJdqOMQ+wJ8icimywzlYvh2EQqSxTAysPuw6kLx
 04ckhAAsOE5t/PpaQmubixZt4iUEniJHAhsMcJdWH1ZeU4tAlBlFDXwsS9ANuphYwBvV
 o6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005276; x=1703610076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iFJnc/mxwT7AOuXgJJftqh12jwZWWgTZW7pO4s+kLaU=;
 b=i7Ir6Qx+VEiEUEkkXOiueLYS1XM7/Eqz1bSNaFgwozDL/ocynmnMX+4bC1UVhOykjX
 JURhQ+ToFfHlqbASgA/KDLf5pkE0fw03tay+A5mZXPxZM3/r2nnzWyqSuWVtA08wtKrt
 mDCxjW8DzYB1iEx6WepwrPgaJ50un3hH6Xu/5Uxsyv+hZixyUhEB3f1G/itj3XuxcKn/
 JApstIbGbxMoTCKR4MnHJWpFUTS/sIked3Wc4TCqu3nP9bfJHCEjbwhpvZ3gwqpRv4Dm
 TRV0AAaHIESQfkC4UL1DDBKGM8V6Dmojo5rjXlZHd8D49niH1ieOSnboh9KL3X47QRLr
 dVAw==
X-Gm-Message-State: AOJu0YwnJWn2gQn+ABDRc1yBmhiZgAvA3rBJdGF75bva7G76b4dFBsNF
 jJI6uMG51MIaC/CyqCLrhw==
X-Google-Smtp-Source: AGHT+IEbPw77YvJcAXZpRTG+THyzCBpu8TjojgDNiNM8LfkQxoe6a5lRkYeVjQYnPtzFk5poHXDo2w==
X-Received: by 2002:a7b:cbd1:0:b0:40c:32b6:866c with SMTP id
 n17-20020a7bcbd1000000b0040c32b6866cmr10082301wmi.68.1703005276391; 
 Tue, 19 Dec 2023 09:01:16 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:16 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 10/29] drm/rockchip: inno_hdmi: Remove useless input format
Date: Tue, 19 Dec 2023 18:00:40 +0100
Message-ID: <20231219170100.188800-11-knaerzche@gmail.com>
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

The driver has a lot of logic to deal with multiple input formats, but
hardcodes it to RGB. This means that most of that code has been dead
code, so let's get rid of it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
[made checkpatch happy]
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 41 ++++++++--------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 58aff7a9c09a..7c75feedacad 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -28,7 +28,6 @@
 #include "inno_hdmi.h"
 
 struct hdmi_data_info {
-	unsigned int enc_in_format;
 	unsigned int enc_out_format;
 	unsigned int colorimetry;
 };
@@ -328,47 +327,30 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 		v_VIDEO_INPUT_CSP(0);
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
 
-	if (data->enc_in_format == data->enc_out_format) {
-		if ((data->enc_in_format == HDMI_COLORSPACE_RGB) ||
-		    (data->enc_in_format >= HDMI_COLORSPACE_YUV444)) {
-			value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
-			hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
-
-			hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
-				  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
-				  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
-				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
-			return 0;
-		}
+	if (data->enc_out_format == HDMI_COLORSPACE_RGB) {
+		value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
+		hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
+
+		hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
+			  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
+			  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
+			  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
+		return 0;
 	}
 
 	if (data->colorimetry == HDMI_COLORIMETRY_ITU_601) {
-		if ((data->enc_in_format == HDMI_COLORSPACE_RGB) &&
-		    (data->enc_out_format == HDMI_COLORSPACE_YUV444)) {
+		if (data->enc_out_format == HDMI_COLORSPACE_YUV444) {
 			csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
 			auto_csc = AUTO_CSC_DISABLE;
 			c0_c2_change = C0_C2_CHANGE_DISABLE;
 			csc_enable = v_CSC_ENABLE;
-		} else if ((data->enc_in_format == HDMI_COLORSPACE_YUV444) &&
-			   (data->enc_out_format == HDMI_COLORSPACE_RGB)) {
-			csc_mode = CSC_ITU601_16_235_TO_RGB_0_255_8BIT;
-			auto_csc = AUTO_CSC_ENABLE;
-			c0_c2_change = C0_C2_CHANGE_DISABLE;
-			csc_enable = v_CSC_DISABLE;
 		}
 	} else {
-		if ((data->enc_in_format == HDMI_COLORSPACE_RGB) &&
-		    (data->enc_out_format == HDMI_COLORSPACE_YUV444)) {
+		if (data->enc_out_format == HDMI_COLORSPACE_YUV444) {
 			csc_mode = CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
 			auto_csc = AUTO_CSC_DISABLE;
 			c0_c2_change = C0_C2_CHANGE_DISABLE;
 			csc_enable = v_CSC_ENABLE;
-		} else if ((data->enc_in_format == HDMI_COLORSPACE_YUV444) &&
-			   (data->enc_out_format == HDMI_COLORSPACE_RGB)) {
-			csc_mode = CSC_ITU709_16_235_TO_RGB_0_255_8BIT;
-			auto_csc = AUTO_CSC_ENABLE;
-			c0_c2_change = C0_C2_CHANGE_DISABLE;
-			csc_enable = v_CSC_DISABLE;
 		}
 	}
 
@@ -443,7 +425,6 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	struct drm_display_info *display = &hdmi->connector.display_info;
 	u8 vic = drm_match_cea_mode(mode);
 
-	hdmi->hdmi_data.enc_in_format = HDMI_COLORSPACE_RGB;
 	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
 
 	if (vic == 6 || vic == 7 ||
-- 
2.43.0

