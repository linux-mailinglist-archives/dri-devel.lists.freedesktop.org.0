Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F6A14B66
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C6610EA99;
	Fri, 17 Jan 2025 08:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402E710E1B0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:52:51 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5f89aa7a101so405462eaf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042770; x=1737647570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5rj34u5pNHeuLWOUSUYUBNhSS+rZXTTOxAW79CUJE8=;
 b=Oy4SP7OmzjSgYwhshU5J4p7EtEf+Ycw8f6llgbcLpJ2mGRA07s0AwHJdvGMw0MefhN
 h2qfnA4TboTp5l1eSNZeZ5GJe29amMvhHFG8VI2PVRqFF4f3dk3tf5e/pQcM+3CFmign
 5VhCdOIvDFkeqWxNgPmozW81J82Udns9D7pjnH/airmcJTKTUCfN2P6VYuJStWNCPSjK
 z8eZ7EcBnXFpgEf8Myzo3RHYhDuhOu72qUYlnYRf5rxaBPUzQwo+C5sKeAQrahwDaHEB
 lyDHjFJTKvc16OsGX7o9zWhBt5WHTvHfD75JBEmopQu+a9vgG+Uv7wjZyRQ5uGLjmhCA
 KeVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhWsoyg5/vIkuqX8YPBmrFNUPcmgJ0A5CroTFPKb7Vr8eezpGZx7FxnUfjiktwFJ4u8HsAEecFa98=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySS5g8W9DXS40KQSLUeGTvtHMmfp8UDyfjOOXpoXObICxK4ytO
 2asb/pxYETmzsapUMFlCHDEzv/m4q0jmPWvhz7zjNxTs7doUxVbj
X-Gm-Gg: ASbGncu7dMflbSJ5IDsFpzwWNVFUZ15BHpdguMD1/Edf8vyJ4RAfA0+jNTWFWiRPKGR
 fuKBSVIh4yXDnJJjm+qvm0XJYHmkcZBtK9WxbfhdFX9biIlLT5BEhwdqWUTEhJBpgegWmCVVaoM
 6gtCDXoTrg8M2UqghJitLpXWjItynXPooeMZgc0XUpIrMcKMe15dBqUrgop8bED8JzE2UCSrjH8
 Wmbf7q5kQkctlg0LkzKb7rqmd4pIgItovpYeE0uWckpmykwN8eQqEHBKw==
X-Google-Smtp-Source: AGHT+IEwQCMC+rSOF2ebEhyCNYbOVZz2Y0IsspfjwImeO3LQurHuQIDFGTU7pggWAwduYUbGJiaFRA==
X-Received: by 2002:a05:6820:1ad0:b0:5f2:c518:bace with SMTP id
 006d021491bc7-5f730909232mr1482377eaf.3.1737042770555; 
 Thu, 16 Jan 2025 07:52:50 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5fa35f05bbdsm70538eaf.13.2025.01.16.07.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:52:49 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Andrew Wyatt <fewtarius@steamfork.org>, John Edwards <uejji@uejji.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm: panel-orientation-quirks: Add quirks for AYA NEO
 Flip DS and KB
Date: Thu, 16 Jan 2025 15:50:47 +0000
Message-ID: <20250116155049.39647-6-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116155049.39647-2-uejji@uejji.net>
References: <20250116155049.39647-2-uejji@uejji.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 17 Jan 2025 08:46:14 +0000
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

Add DMI matches to properly rotate these panels.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Co-developed-by: John Edwards <uejji@uejji.net>
Signed-off-by: John Edwards <uejji@uejji.net>
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

