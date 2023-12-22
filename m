Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED21881CDCC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6579410E85D;
	Fri, 22 Dec 2023 17:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306C410E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d4a222818so3419655e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266956; x=1703871756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzkYbwlGueFkeXw8MQWVExgytplkJ2Nf/UnR4OES2p8=;
 b=jws0tdBzzcmXbZmol+eV0/92NKJkHlANBs3H5pBiwtCBd3+5oDrfKKAocRELgTcp/Y
 2mlEfDoDfx9cRlffYNCpo8VpeYqbF02rThzxiYUM+5exjOwifPldKz/fNpCpqnd+u/uG
 oIRzqDO6SEylcdeaR0T+s7dO65TeMndOalbnDpu0rW806/V3NeNz9kH9Vc9OVHG03MzK
 ZQPmsowKogNc6miLn8g7qd9myIB2QVhcCzzYtnns3XTQ3LLmErfJiJTrcfNIvQKYVTPb
 dYvtRHY9Le7gq6uBYMlfU/DiiySXhGuDEcRNvgyNu4gaOyML0cTYnjHYffX+hpr1Njoa
 MA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266956; x=1703871756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzkYbwlGueFkeXw8MQWVExgytplkJ2Nf/UnR4OES2p8=;
 b=MXhbAqynnB5uB2/s9rTqaEO22TySfdgqlDmkdn9DCcJP1fu3Rw/doZaH415XmFyNUe
 osXYhnyimnleObTgZHjdjBujyjn/3OqdlC39c6J3ysnlRz6b8HNHwtxppCopF9lZZ0ka
 zA/OGeClSLH0ZFmYYhu1Hd0jqPjgpqaZyvQhpEoV/JIpqbP9ZHyj5MgDKv+NOTjAUUUg
 cwDx8PPeFaI9FbclzhxO/FIB83Ip1tVDu+a58sTCJo1cByGLFGn/JjRj3u0vRU0Z8bW4
 u7iB1UPB9QjNUyqGUUr3W0m38uwnc2dnccwqfTp29tXTO7B0edMKx0FBXZL+pftJ7qlB
 kL+g==
X-Gm-Message-State: AOJu0YxqJIBMVfmpNWisa6YmydZxhrG9j9q0CoqdvPyJbbQ7NvzJuSmx
 k/TpYPEoX5NHxglMbk8oEQ==
X-Google-Smtp-Source: AGHT+IGjw9eaTW3bYuJzaeJRxodZiDLkX0kYbSh2SunwyP2K37rlC164b3cp2fGSEgNHWdq2zTdZoQ==
X-Received: by 2002:a05:600c:4e87:b0:40b:4808:5d0a with SMTP id
 f7-20020a05600c4e8700b0040b48085d0amr983939wmq.17.1703266956443; 
 Fri, 22 Dec 2023 09:42:36 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:36 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 20/29] drm/rockchip: inno_hdmi: Correctly setup HDMI
 quantization range
Date: Fri, 22 Dec 2023 18:42:11 +0100
Message-ID: <20231222174220.55249-21-knaerzche@gmail.com>
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

The display controller will always give full range RGB regardless of the
mode set, but HDMI requires certain modes to be transmitted in limited
range RGB. This is especially required for HDMI sinks which do not support
non-standard quantization ranges.

This enables color space conversion for those modes and sets the
quantization range accordingly in the AVI infoframe.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - made rgb_limited_range part of the new custom connector state

changes in v3:
 - moved assignment of rgb_limited_range to atomic check

changes in v4:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 60 +++++++++++++++++++---------
 1 file changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index e43fce968310..f3b90b479ab9 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -53,6 +53,7 @@ struct inno_hdmi_connector_state {
 	struct drm_connector_state	base;
 	unsigned int			enc_out_format;
 	unsigned int			colorimetry;
+	bool				rgb_limited_range;
 };
 
 static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
@@ -270,6 +271,18 @@ static int inno_hdmi_config_video_avi(struct inno_hdmi *hdmi,
 	else
 		frame.avi.colorspace = HDMI_COLORSPACE_RGB;
 
+	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
+		drm_hdmi_avi_infoframe_quant_range(&frame.avi,
+						   connector, mode,
+						   inno_conn_state->rgb_limited_range ?
+						   HDMI_QUANTIZATION_RANGE_LIMITED :
+						   HDMI_QUANTIZATION_RANGE_FULL);
+	} else {
+		frame.avi.quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+		frame.avi.ycc_quantization_range =
+			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
+	}
+
 	return inno_hdmi_upload_frame(hdmi, &frame, HDMI_INFOFRAME_TYPE_AVI);
 }
 
@@ -297,29 +310,37 @@ static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
 
 	if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_RGB) {
-		value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
-		hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
-
-		hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
-			  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
-			  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
-			  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
-		return 0;
-	}
-
-	if (inno_conn_state->colorimetry == HDMI_COLORIMETRY_ITU_601) {
-		if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
-			csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
+		if (inno_conn_state->rgb_limited_range) {
+			csc_mode = CSC_RGB_0_255_TO_RGB_16_235_8BIT;
 			auto_csc = AUTO_CSC_DISABLE;
 			c0_c2_change = C0_C2_CHANGE_DISABLE;
 			csc_enable = v_CSC_ENABLE;
+
+		} else {
+			value = v_SOF_DISABLE | v_COLOR_DEPTH_NOT_INDICATED(1);
+			hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL3, value);
+
+			hdmi_modb(hdmi, HDMI_VIDEO_CONTRL,
+				  m_VIDEO_AUTO_CSC | m_VIDEO_C0_C2_SWAP,
+				  v_VIDEO_AUTO_CSC(AUTO_CSC_DISABLE) |
+				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
+			return 0;
 		}
 	} else {
-		if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
-			csc_mode = CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
-			auto_csc = AUTO_CSC_DISABLE;
-			c0_c2_change = C0_C2_CHANGE_DISABLE;
-			csc_enable = v_CSC_ENABLE;
+		if (inno_conn_state->colorimetry == HDMI_COLORIMETRY_ITU_601) {
+			if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
+				csc_mode = CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
+				auto_csc = AUTO_CSC_DISABLE;
+				c0_c2_change = C0_C2_CHANGE_DISABLE;
+				csc_enable = v_CSC_ENABLE;
+			}
+		} else {
+			if (inno_conn_state->enc_out_format == HDMI_COLORSPACE_YUV444) {
+				csc_mode = CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
+				auto_csc = AUTO_CSC_DISABLE;
+				c0_c2_change = C0_C2_CHANGE_DISABLE;
+				csc_enable = v_CSC_ENABLE;
+			}
 		}
 	}
 
@@ -473,6 +494,8 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 		inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
 
 	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
+	inno_conn_state->rgb_limited_range =
+		drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_LIMITED;
 
 	return 0;
 }
@@ -559,6 +582,7 @@ static void inno_hdmi_connector_reset(struct drm_connector *connector)
 
 	inno_conn_state->colorimetry = HDMI_COLORIMETRY_ITU_709;
 	inno_conn_state->enc_out_format = HDMI_COLORSPACE_RGB;
+	inno_conn_state->rgb_limited_range = false;
 }
 
 static struct drm_connector_state *
-- 
2.43.0

