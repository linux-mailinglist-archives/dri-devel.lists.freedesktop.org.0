Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E458A1C8B1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2025 15:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B35A10E380;
	Sun, 26 Jan 2025 14:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1157010E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 20:47:51 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3ebb1652729so1264022b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 12:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737751670; x=1738356470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gW6/DbY3zUZ8GO8ZyBpm0NjrK5wQn0R1+g2eIZtcHRI=;
 b=pukneWpDzwjd3kNa8jqqAADVF+lyFow2QjnX/12Ycy3gCMrAvHLPHzu9109b8kEDem
 f/qV6j6dulIAD7FPVKNLEEREYd9zJvFuKYLvjG/SyNSfLNPPx+Y6QHE1YB3Fh1gUjHYL
 DTPgmYU/DlsPSh+PdxqcdRtFy8+g15DK3LAbvP9+7qHD0mP6l81Lz8oWg7GB2fS0nP5W
 Nq/Wzjtb4WX9uNMOBUCj+VHnB/iy9V0JrDADqAZqgyWlBRZZPXRiLTA2xWCWrR0K0wJp
 AZNfllbDBPWz6j6A/ZuAYmbpmR/iS8dzhiP6Ce2v5WYC+zXnJSf6yQMv6O4uZHSxM+OB
 DcrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNpJsTyle4pjbBEpfX0e1Gs0f8e0l6P0iGbcx3ev3Nqsbcf/cJEwqbE5TPRdTA8hphmlg5KP0s/po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi1RdHsth6FgFxZdKCtGsUwUL5voO0EoawXJkrNDW0hQXosIR3
 vSHAgoeUpxPvSjVgXXYgrst/qcgfxU1IU3ovhe6M9/T+0GQSaALb
X-Gm-Gg: ASbGncsK0JmH4KV6zKsz8XH3dH/YkEFpQTTBdmxnkqCgjJNvmdsjz7ZeuUionWCl7Ww
 2vjb5l0Afa6tYJHvLYnw1EE0oS97S9Zg/ZNOCtDpzfk1TBH8e258b6C2UufFyh9UEZepJOEfo4w
 aSTTEFpAOc0W4aUakSvQ/wnXP4XMmAPEmldQjdVyI6NnPRvN5OMTADnCNyCU8Bywn8J4iwm1TD8
 Llk9DiFQU6I76Bb8Aw7FmShGwhvAVAPxWppwzzDu06SuIbmxSClWllOkAPYlp+mPiDByrROmKkE
 Ldkr0g==
X-Google-Smtp-Source: AGHT+IEZVRyX9JDJ3Lv7Af3Dh/+6/YOEE4ATIxgXGLqbkwyz+/KoMZQAXqjhTuu3Uxk1jYUlLSjQZg==
X-Received: by 2002:a05:6808:4e0e:b0:3eb:8855:efec with SMTP id
 5614622812f47-3f19fd80444mr14549205b6e.38.1737751668766; 
 Fri, 24 Jan 2025 12:47:48 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f1f0981130sm598700b6e.36.2025.01.24.12.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:47:47 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paco Avelar <pacoavelar@hotmail.com>
Subject: [PATCH v2 2/5] drm: panel-orientation-quirks: Add quirks for AYA NEO
 Flip DS and KB
Date: Fri, 24 Jan 2025 20:46:46 +0000
Message-ID: <20250124204648.56989-6-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250124204648.56989-2-uejji@uejji.net>
References: <20250124204648.56989-2-uejji@uejji.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 26 Jan 2025 14:52:19 +0000
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

From: Andrew Wyatt <fewtarius@steamfork.org>

The AYA NEO Flip DS and KB both use a 1080x1920 portrait LCD panel.  The
Flip DS additionally uses a 640x960 portrait LCD panel as a second display.

Add DMI matches to correctly rotate these panels.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Co-developed-by: John Edwards <uejji@uejji.net>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: Paco Avelar <pacoavelar@hotmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f9c975338..c5acf2628 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -93,6 +93,12 @@ static const struct drm_dmi_panel_orientation_data onegx1_pro = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd640x960_leftside_up = {
+	.width = 640,
+	.height = 960,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd720x1280_rightside_up = {
 	.width = 720,
 	.height = 1280,
@@ -202,6 +208,18 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_PRODUCT_NAME, "AIR"),
 		},
 		.driver_data = (void *)&lcd1080x1920_leftside_up,
+	}, {    /* AYA NEO Flip DS Bottom Screen */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "FLIP DS"),
+	},
+		.driver_data = (void *)&lcd640x960_leftside_up,
+	}, {    /* AYA NEO Flip KB/DS Top Screen */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "FLIP"),
+	},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* AYA NEO Founder */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYA NEO"),
-- 
2.43.0

