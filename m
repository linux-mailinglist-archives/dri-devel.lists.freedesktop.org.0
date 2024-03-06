Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304A874109
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:04:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06CD113502;
	Wed,  6 Mar 2024 20:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ba9TPtTg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32005113502
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:04:02 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6e57a3bf411so95680b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 12:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709755441; x=1710360241;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5q7RSLprSn1rt1j4rdHGaFDAMNSTGJDra0FF/HsNmOM=;
 b=ba9TPtTgLIP5WHC62n5Wf7yyK9mnWVjsEmHm6xMFgrNj8ytK6tbX9Qy0EPNqqNBdHZ
 zntMQGIdCoq7KjDxBng6i2XWAr/uKj8HnGELTibKoPgyzsfzQHZDOBT+n3itWgVkX1kJ
 OKgYv6ni2JMWv9pKLxc94whnyXUaHnVRehFAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709755441; x=1710360241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5q7RSLprSn1rt1j4rdHGaFDAMNSTGJDra0FF/HsNmOM=;
 b=iUzaqlzyGpGyMfRyQYjxDKC9HskPZhjbfR5GNxJtkwkMIzJ60uB4WuEZB+Rl2MdoNR
 X/hh3Oz8w4hPzxj+VnKFmZQhqWHkWwkYwTTx0g+UvJR1W9l0mwcgKdua10jqOL3wr2+h
 TkvDGycAf9UMLSqyIVhjMqap7hDhlIvG1WrT5V7T4caRHvg6lJOW2ak+tQeG2QVYdUCM
 MxirSehZ+k2UENlipP9dgvWlWnH/MQgAsQgzeuUKrqjjfxfF1/yJ1zqUtEhjIZ22jMr6
 r9XOuVA2ISS0xUNPvs0IzipHr4mrTzHwJuY3GQBJADv1w3Ph57Shzdag6gNHlYp2oyNh
 oFzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoTuwTtoUAuVX8GPzoEGST/DotLaT9MX9J9jKZ33+vvsgoEsMGMJYZIZw5udybl5dVGItSPDsBtmEwkbrK4jtbjJxxv75Mo7v4SOHIp306
X-Gm-Message-State: AOJu0YxM5PiQpULZKNO0wMSt9TtV85krLAPdVqFaIaktMXOnfmAQ1Bw6
 qW1+jVZK+pVigP2ocifrn8pufKI85tSRReI3mirntmDLop8lN3yzkpgpuwd0Eg==
X-Google-Smtp-Source: AGHT+IEvpr4QV5mPBpt2sxAyZS+vMLVhwGwjJwhB/E1OupG/ADEUdABJiDL7NbFUKKyTsEDER6dy8A==
X-Received: by 2002:a05:6a20:8e09:b0:1a1:4e68:30db with SMTP id
 y9-20020a056a208e0900b001a14e6830dbmr7188437pzj.12.1709755441698; 
 Wed, 06 Mar 2024 12:04:01 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:a215:f6c0:3224:5460])
 by smtp.gmail.com with ESMTPSA id
 e3-20020aa79803000000b006e5667793d4sm11124241pfl.66.2024.03.06.12.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 12:04:01 -0800 (PST)
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
Subject: [PATCH v5 6/6] drm/panel-edp: Fix AUO 0x405c panel naming and add a
 variant
Date: Wed,  6 Mar 2024 11:55:56 -0800
Message-ID: <20240306200353.1436198-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240306200353.1436198-1-hsinyi@chromium.org>
References: <20240306200353.1436198-1-hsinyi@chromium.org>
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
v5: no change
---
 drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 772bf6011d79..e3de55314bda 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1009,6 +1009,19 @@ static const struct panel_desc auo_b101ean01 = {
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
@@ -1990,7 +2003,9 @@ static const struct edp_panel_entry edp_panels[] = {
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

