Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649E681CDC2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 18:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696210E84A;
	Fri, 22 Dec 2023 17:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC92F10E81B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 17:42:31 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3333b46f26aso1812347f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 09:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703266950; x=1703871750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvwlyAlnXeNL9AzDIrE6gEzR9A8598VoqwlyqljJPww=;
 b=BV+13ssiObTuH55lCqtEErQBfZEHDH4uRMSv8at3AiOXQCvRo13D4sp48OeD61ObZ8
 L2Cu+1tdRq/j9ME2bdHn7utdz8QcAZjfM20UDi3m0BLnMI7MuV8Ofw7yjuRtwD0FIc+2
 BcKdrMjavE7eeGDfNUW9vdiRv1poOF+6LhwxvcZUtF8Utu9LapFkV+w6ESoYnQjVSolI
 c+x5m5euZXcHItPFZAm92fUTAc+VKNEsP0bm/WyuPtewtt9DJwv7n2ZctVx+RY3E1/MJ
 me8k3GYblASnOOEaUToSmLCwX5omhtH7WZ5/Acko58F9DZHfM/iHC577vdeADPQ40SPe
 zAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703266950; x=1703871750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvwlyAlnXeNL9AzDIrE6gEzR9A8598VoqwlyqljJPww=;
 b=V22FQqjOB48BCEhSgEN2ymn2KqppN4YsdC8c6hRhN4V4hBbtLak7LkE09wUWW0H3ql
 6xiADqfYlQqwuhUIVnrPOP57STMEyjqOrEie/aGM2+a46S9twA54B5JebXpKjWoiAbNu
 /xRe3kTsDGLsNjqa9b3f1gwkTm1S+tROnoY7v9AsyavF1C+fdnrX8ZHZowO+2TZ88RBJ
 7vAAoE7eP20UjAZ/nZZKDD6aiYJVp6rLUNaLcqn/gZXEYnHKSfHni7F1a+2sPjeEnyl4
 Z9JMLauo/Z60UQNJkMgOvk+10tiUaW7a/bLAxlhtLDxadCkPnEXY1jsdzT6SkuXVhdTK
 wV/w==
X-Gm-Message-State: AOJu0YwpoqD1fZtuoM/i+C/k+/YAWz1yr3+au13fIMhHlChqaATT970M
 9te/BvLJovT2r2ExEMDrwA==
X-Google-Smtp-Source: AGHT+IFlH1FXt4AEcnW4RXoWxNep1h0V1fV019/19FThEs51/7Aby/yM7fFwgKONy2ZfswfDCXMW+w==
X-Received: by 2002:adf:cd89:0:b0:334:b2bb:6d1e with SMTP id
 q9-20020adfcd89000000b00334b2bb6d1emr1133231wrj.17.1703266950277; 
 Fri, 22 Dec 2023 09:42:30 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:f3ae:2788:7e03:f44])
 by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b00336670abdcasm4777116wrn.40.2023.12.22.09.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 09:42:29 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 11/29] drm/rockchip: inno_hdmi: Remove YUV-based csc
 coefficents
Date: Fri, 22 Dec 2023 18:42:02 +0100
Message-ID: <20231222174220.55249-12-knaerzche@gmail.com>
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

Now that the unneeded support for YUV based input formats is gone, the csc
coefficients for those formats can be dropped as well.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - new patch

changes in v3:
 - none

changes in v4:
 - none
	
 drivers/gpu/drm/rockchip/inno_hdmi.c | 37 ----------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 7c75feedacad..04344ee1265d 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -74,49 +74,12 @@ static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
 }
 
 enum {
-	CSC_ITU601_16_235_TO_RGB_0_255_8BIT,
-	CSC_ITU601_0_255_TO_RGB_0_255_8BIT,
-	CSC_ITU709_16_235_TO_RGB_0_255_8BIT,
 	CSC_RGB_0_255_TO_ITU601_16_235_8BIT,
 	CSC_RGB_0_255_TO_ITU709_16_235_8BIT,
 	CSC_RGB_0_255_TO_RGB_16_235_8BIT,
 };
 
 static const char coeff_csc[][24] = {
-	/*
-	 * YUV2RGB:601 SD mode(Y[16:235], UV[16:240], RGB[0:255]):
-	 *   R = 1.164*Y + 1.596*V - 204
-	 *   G = 1.164*Y - 0.391*U - 0.813*V + 154
-	 *   B = 1.164*Y + 2.018*U - 258
-	 */
-	{
-		0x04, 0xa7, 0x00, 0x00, 0x06, 0x62, 0x02, 0xcc,
-		0x04, 0xa7, 0x11, 0x90, 0x13, 0x40, 0x00, 0x9a,
-		0x04, 0xa7, 0x08, 0x12, 0x00, 0x00, 0x03, 0x02
-	},
-	/*
-	 * YUV2RGB:601 SD mode(YUV[0:255],RGB[0:255]):
-	 *   R = Y + 1.402*V - 248
-	 *   G = Y - 0.344*U - 0.714*V + 135
-	 *   B = Y + 1.772*U - 227
-	 */
-	{
-		0x04, 0x00, 0x00, 0x00, 0x05, 0x9b, 0x02, 0xf8,
-		0x04, 0x00, 0x11, 0x60, 0x12, 0xdb, 0x00, 0x87,
-		0x04, 0x00, 0x07, 0x16, 0x00, 0x00, 0x02, 0xe3
-	},
-	/*
-	 * YUV2RGB:709 HD mode(Y[16:235],UV[16:240],RGB[0:255]):
-	 *   R = 1.164*Y + 1.793*V - 248
-	 *   G = 1.164*Y - 0.213*U - 0.534*V + 77
-	 *   B = 1.164*Y + 2.115*U - 289
-	 */
-	{
-		0x04, 0xa7, 0x00, 0x00, 0x07, 0x2c, 0x02, 0xf8,
-		0x04, 0xa7, 0x10, 0xda, 0x12, 0x22, 0x00, 0x4d,
-		0x04, 0xa7, 0x08, 0x74, 0x00, 0x00, 0x03, 0x21
-	},
-
 	/*
 	 * RGB2YUV:601 SD mode:
 	 *   Cb = -0.291G - 0.148R + 0.439B + 128
-- 
2.43.0

