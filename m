Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3880872BDA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 01:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904F1112DBA;
	Wed,  6 Mar 2024 00:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AcSBmxMD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD0D112DB8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 00:43:56 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3c1e992f069so155086b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 16:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709685835; x=1710290635;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hYTrgZgcMnGwzTHQ0raTPV6Zr3av/0t0vLxqDGbq+dE=;
 b=AcSBmxMDaXurmheF3r7JDPq/HzAfjUeXjQy3hn9fZ53xqK66aM9jsdXzpN+vdJJqmp
 82S+hQ4+8ujC3t4AGL+A4DETgkpRyHgk8VPjZZBp1FkY/mzBQXOPlJnBrzL7bwXgCy/K
 Xjib+A1uzoXnfGD0s1ZSn1xxPUT2FNjmcTjwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709685835; x=1710290635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hYTrgZgcMnGwzTHQ0raTPV6Zr3av/0t0vLxqDGbq+dE=;
 b=g1ooX0tJJwqgDEPZv1dkp0SlYGD+UhQWtGB+wDv7YJKt76k0gnqJKgWVXvrMr4u7JQ
 w2PUT8ffiWr++0OahpEn6V+MFAkVptQz8nU9AFIpV+gKkbLteCmBSNo7CRNtuyxmob4g
 qjV6IMFF5Z3w9sUUhd9wVRuTlC6dtaXxuGpJsodcd2A3bAVLYs59NV3ltq3KHpRDpesO
 FILuvQLEJ9tvUAmiVBFGuAdbPb2vIQw0KVkQRqQeOKoiwqnmpwT+ZdsBjaTPDvruUkxn
 FQVWdr7yBZ92WlG7KnA8Z7FZHqnP67TF68Yts0sSoTLwMMF6F1/5IP0i6ZXJi6b7+y0r
 26CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt70v6d11/+Tp7d+oEgVFT7QDUmUmmFHkUi5w7Ag1PFinMpdIskljbpiPIb3v6Ua3QmQuTY3J+/P3B8eKZv7xwg3UCFXdSo/rSpCbF4J3Q
X-Gm-Message-State: AOJu0YyfqUDyZ1HS8PTBH5sTtUWGkIIkS4aR3GCEiNutDbmxCfQ+xn2g
 A6YStnwbYxWWT/H7Y3XktkOVYrCFotAm5zWISc9F/ocVsW0ZZ1JIAMBC2cpAxg==
X-Google-Smtp-Source: AGHT+IEnBwCzfwvZftrY1cUSm8yx44TS6umhWaiFT1TsIPhxo+eKQUM29yFatyjGk7F35NHZ6+gzsQ==
X-Received: by 2002:a05:6808:9b0:b0:3c1:db6b:aa7c with SMTP id
 e16-20020a05680809b000b003c1db6baa7cmr3045373oig.1.1709685835241; 
 Tue, 05 Mar 2024 16:43:55 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:29bc:b3d:1ba8:cf52])
 by smtp.gmail.com with ESMTPSA id
 x37-20020a631725000000b005dc48e56191sm8512885pgl.11.2024.03.05.16.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 16:43:54 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] drm/panel-edp: Fix AUO 0x405c panel naming and add a
 variant
Date: Tue,  5 Mar 2024 16:34:05 -0800
Message-ID: <20240306004347.974304-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240306004347.974304-1-hsinyi@chromium.org>
References: <20240306004347.974304-1-hsinyi@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are 2 different AUO panels using the same panel id. One of the
variants requires using overridden modes to resolve glitching issue as
described in commit 70e0d5550f5c ("drm/panel-edp: Add auo_b116xa3_mode").
Other variants should use the modes parsed from EDID.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v4->v5: no change
---
 drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index fb70e97a2e71..9db04457fb4d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1007,6 +1007,19 @@ static const struct panel_desc auo_b101ean01 = {
 	},
 };
 
+static const struct drm_display_mode auo_b116xa3_mode = {
+	.clock = 70589,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 40,
+	.hsync_end = 1366 + 40 + 40,
+	.htotal = 1366 + 40 + 40 + 32,
+	.vdisplay = 768,
+	.vsync_start = 768 + 10,
+	.vsync_end = 768 + 10 + 12,
+	.vtotal = 768 + 10 + 12 + 6,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
 static const struct drm_display_mode auo_b116xak01_mode = {
 	.clock = 69300,
 	.hdisplay = 1366,
@@ -1966,7 +1979,9 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116XTN02.5"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAN04.0"),
+	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0 ",
+			 &auo_b116xa3_mode),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x435c, &delay_200_500_e50, "Unknown"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
-- 
2.44.0.278.ge034bb2e1d-goog

