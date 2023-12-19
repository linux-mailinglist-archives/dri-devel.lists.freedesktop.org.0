Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E499818D37
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:01:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B29F10E4C7;
	Tue, 19 Dec 2023 17:01:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DCB10E1D0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:01:16 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d12b56a38so39141525e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005275; x=1703610075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VvJhWTUaZ1kAS2FjYOCcewK/+2L6xqjKsMInEMuEacc=;
 b=GP1u7eaGdFaFsNYrQjm5DhzBN8oQjIx/tLhwqXUg9mgw39mL3I5ToyW1eWnDTGxrH0
 kzp9VFHiqDdwjDxhmL9buzWledvbwXAIt7R5VpHMh1dXeXmHKrkH1Vb9CE6Tj386w0FV
 Dn0qUoOFPdrvh7Fa0JvnRxgoMO0YkEB/jKTDlQJNQXVCCwz2U9rhvxodVzEUXJ21UKlp
 rdPL+xRkA5bMWfYSPR4+l+BulVlmAFc01yhPvShM8+94dtbtP4BKLxSnB4jUl0bK118l
 2VtiIdOaR3A+SKyQxGVrKJfrefZ+8qDUyMrK5zP27k2riAhQXpAIATs+ZArBYu7tfQnS
 GkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005275; x=1703610075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VvJhWTUaZ1kAS2FjYOCcewK/+2L6xqjKsMInEMuEacc=;
 b=IQaoyh/gmlWFcUrU1kafJWofluzeRM0RBjk+S7u3d35Bic+CZYbfQBs/djnO3kZuLK
 jYIYqAU/pnzqiBqWKD0Q6l929F3JOa/EmfPI3scQ1zfDMP6MP6iEkDzGZZBCfjeQnnun
 0z+I2efTSWosipgTY63v/1VZCDGn727LqmjpRKTSg7aa6PoOywdsBv7omEnpHwXlAGpR
 ue8/QpD/lm32NEdJkY9JIWsTu8kNgOM/pb06b+1DAZFpdva+vLvRlBCFgyTV4t+orsUN
 zeYtjKl5miSOTmhiy3X0yTuxwqq5qbKv6xHATtrsdwZRTGM/N4GJ3/BJmGsCNmqqndzu
 Pz3g==
X-Gm-Message-State: AOJu0Yxt9Iz0ajlXI0FWdOGnT6ma8LH902t9o9y0TB8/Iov/ZPH5qqMb
 QpGIHhhmgrmmQyRCwj/bxQ==
X-Google-Smtp-Source: AGHT+IGSTG2bZEzpSu8nSWJckWftmgfOLD5ECMR1O8HR3EFeEhnatTb8aS+6tL1yBM93D+staL9K0w==
X-Received: by 2002:a7b:ce8f:0:b0:40c:2205:e5f6 with SMTP id
 q15-20020a7bce8f000000b0040c2205e5f6mr5185131wmj.293.1703005274526; 
 Tue, 19 Dec 2023 09:01:14 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:7ae5:3e:d1c6:a138])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a05600c354700b0040d2805d158sm3225878wmq.48.2023.12.19.09.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:01:14 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 08/29] drm/rockchip: inno_hdmi: no need to store vic
Date: Tue, 19 Dec 2023 18:00:38 +0100
Message-ID: <20231219170100.188800-9-knaerzche@gmail.com>
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

The mode's VIC is only ever used in the inno_hdmi_setup() function so
there's no need to store it in the main structure.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Alex Bee <knaerzche@gmail.com>
[made checkpatch happy]
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
changes in v2:
 - imported patch

changes in v3:
 - none

 drivers/gpu/drm/rockchip/inno_hdmi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 299770e481b7..d99896f1a73a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -28,7 +28,6 @@
 #include "inno_hdmi.h"
 
 struct hdmi_data_info {
-	int vic;
 	bool sink_has_audio;
 	unsigned int enc_in_format;
 	unsigned int enc_out_format;
@@ -443,16 +442,15 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 			   struct drm_display_mode *mode)
 {
 	struct drm_display_info *display = &hdmi->connector.display_info;
-
-	hdmi->hdmi_data.vic = drm_match_cea_mode(mode);
+	u8 vic = drm_match_cea_mode(mode);
 
 	hdmi->hdmi_data.enc_in_format = HDMI_COLORSPACE_RGB;
 	hdmi->hdmi_data.enc_out_format = HDMI_COLORSPACE_RGB;
 
-	if ((hdmi->hdmi_data.vic == 6) || (hdmi->hdmi_data.vic == 7) ||
-	    (hdmi->hdmi_data.vic == 21) || (hdmi->hdmi_data.vic == 22) ||
-	    (hdmi->hdmi_data.vic == 2) || (hdmi->hdmi_data.vic == 3) ||
-	    (hdmi->hdmi_data.vic == 17) || (hdmi->hdmi_data.vic == 18))
+	if (vic == 6 || vic == 7 ||
+	    vic == 21 || vic == 22 ||
+	    vic == 2 || vic == 3 ||
+	    vic == 17 || vic == 18)
 		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_601;
 	else
 		hdmi->hdmi_data.colorimetry = HDMI_COLORIMETRY_ITU_709;
-- 
2.43.0

