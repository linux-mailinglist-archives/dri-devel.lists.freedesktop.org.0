Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE61818D35
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC3410E4C2;
	Tue, 19 Dec 2023 17:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDFA10E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d2e5e8d1dso4629335e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005277; x=1703610077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vfw1A5kPCqeEpvkS0qSDCc84V56+/woGo5pclCQd9uw=;
 b=EwPnlcX+u2OXlAgEGzseXDmUwEjgaOHjfi4JpfnuPD4csmUw9zUc0aO7kMjtCxPWzL
 rIl0eIIqaeORfEhPYEL8BzkogBX1Z30Fpz7X6OPDU9vRBiVm4st6RMmaKYl/9VT1DdDZ
 A+vrVFsSIvhOPfpEqCZmHPYkS6dd4rtM3ZmP/cHSkCyxB/xLTwxJCrDi76A0T8qvwOX+
 Bc1KwWx3DX4316vnPmETMT06ALXpBBxSehK9EUnDbLteo1Tg+5gpptaoPmwYNBDGKpyb
 MtMdQLYkP6MyMroItSIfL7CXjS0vVQhujSLaSXljl2t4+cQJ9W32k9RYGKKlqI2wnXJn
 Zv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005277; x=1703610077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vfw1A5kPCqeEpvkS0qSDCc84V56+/woGo5pclCQd9uw=;
 b=S2AOVx6DlKUgQv4wORaQ7MtLmRNC9xILZRarEWJXunHjhpBW66XZSh00eYv/iYDrAy
 Bjtz2CGrBRax9oXmpxLF4cojqyLSYs9ACCDLXjZgqXO3R8TzkHYL8nUePcL05MBhSB5Y
 KBM/qX3gFJsnCj6WTKYXp2yJsvMgLXDiTu5qmzrgLCrQHTc0alnJ40Rru4BGCEIgnk5J
 ZRDnYMdyGumLu0eumXfEj/NpjU4CvItvWtVM+612rtYmGOY3RhLFTQR/NUrGcnnAsF6L
 2czY49zHNZNdjFsVbg8o4nKiACLPPAsyNNmD+EJNRnDIOFXQU8uhSG+fQEr1BdYw17xm
 TnpQ==
X-Gm-Message-State: AOJu0Yy6KNUoS6lF45nV+NUAsXwU2ap0xOU7ImXRytrGlrEY+P34uTDO
 pWp0MgNTowCHv8l9LXZGuw==
X-Google-Smtp-Source: AGHT+IEoAr6dXqLAHpqmd1Dg8MViO9ibFuLzxT2b+W8ygqu4NI2IAAxTliP/CtM0Lm8338Mg9O8/2g==
X-Received: by 2002:a05:600c:5115:b0:40c:6924:5172 with SMTP id
 o21-20020a05600c511500b0040c69245172mr3185004wms.92.1703005277195; 
 Tue, 19 Dec 2023 09:01:17 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.16
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
Subject: [PATCH v3 11/29] drm/rockchip: inno_hdmi: Remove YUV-based csc
 coefficents
Date: Tue, 19 Dec 2023 18:00:41 +0100
Message-ID: <20231219170100.188800-12-knaerzche@gmail.com>
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

Now that the unneeded support for YUV based input formats is gone, the csc
coefficients for those formats can be dropped as well.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - new patch

changes in v3:
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

