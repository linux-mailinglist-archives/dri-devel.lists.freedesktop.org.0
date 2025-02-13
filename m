Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA4A35131
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8287F10E153;
	Thu, 13 Feb 2025 22:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9DD10E153
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:25:11 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3f3dede60b1so400661b6e.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739485510; x=1740090310;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wOf+oTFhezeZp7A7S6xFlFzN9A3TZcxPi96KVYSkQNw=;
 b=T4wVq834iL/QwhvIUdUd1VHERq84gV4ds9rKvzVxeD6K33RyErHs2V+Kkcm/3DC7k8
 SDFTMZLFqcbCgPtRHXro9wIzwt8/e1L7gBmSQSweRxcqdFqTod9NHxa+76Y3wfEbCbJj
 szOMFgOz+Cs3XQRYdBHi/f5vKKlB0SJL5/pJgiABztXdaU/vLrdCkPW+jxyBw/RnbhSv
 grj405GsSDn2Npk7GPfNPP7JoMYrHt+RUbe2vmEodwrduUyXmINXoxoUnuxulmm2VLyo
 IDuo2wWPVMhEe9dHXL5VMNeBnMm+dqSw27dV1fT0aFpDJtBc0sjMpc3att3J9xgYcoYy
 yzlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3C0Y23HtoQ3PUPTTKAZmj6WoSMOWgyvadqRU+SwLPA/SS146OH2MW493G/NV5F7PduaGS1qsjTM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZDWaYx2wg0koGEqMinZPzwvXXRHQvrBUffY2zaeATmsREi8HA
 6T7gSll5PUs+afM9qv4BVXigjg7Kl3EJGVl59e5b9oBsz45lO9uv
X-Gm-Gg: ASbGncsGAHzYEh5rQ4hrQ6Erd5WGe6lGVMz2Cx1/hZU2w3putUWypw1op2xGRuIiA62
 z4mhoSQUnFto/Qq/j1IVz3hvPXsfcOp7LVuixI1Aydrv0IvQuT/+EpJpQV9NG1mIMit9376SbsM
 Oz6KwGrmkrVuoHmo6Qq/avMzm9sjDX/dBDYxhY2EUwbGGTA26FRT4ygV3A2D9ykn1r9WLDZI1Qd
 YJnfYaPOH4iwt3ESV7nfPw2XYUyMN2kOgRBhL/HgMSIPk6W/ik8FzaJMMEjRpb+pFB0JbOj8nzu
 O8HlNq8+PEXHyAYb
X-Google-Smtp-Source: AGHT+IHY462naqcxbU+WmujVb19V1k7ZxzD9YMysyY+tEALiFHOLwX8wFNZvcbO20X2XQT1X+YV8mQ==
X-Received: by 2002:a05:6808:3c88:b0:3f3:ca45:4315 with SMTP id
 5614622812f47-3f3d8dcbdabmr3557346b6e.9.1739485510556; 
 Thu, 13 Feb 2025 14:25:10 -0800 (PST)
Received: from muster.uejji.net ([47.188.205.107])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-727001cde00sm984184a34.5.2025.02.13.14.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 14:25:10 -0800 (PST)
From: John Edwards <uejji@uejji.net>
To: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: John Edwards <uejji@uejji.net>, Andrew Wyatt <fewtarius@steamfork.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paco Avelar <pacoavelar@hotmail.com>
Subject: [PATCH v3 2/5] drm: panel-orientation-quirks: Add quirks for AYA NEO
 Flip DS and KB
Date: Thu, 13 Feb 2025 22:24:50 +0000
Message-ID: <20250213222455.93533-3-uejji@uejji.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213222455.93533-1-uejji@uejji.net>
References: <20250213222455.93533-1-uejji@uejji.net>
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

From: Andrew Wyatt <fewtarius@steamfork.org>

The AYA NEO Flip DS and KB both use a 1080x1920 portrait LCD panel.  The
Flip DS additionally uses a 640x960 portrait LCD panel as a second display.

Add DMI matches to correctly rotate these panels.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Co-developed-by: John Edwards <uejji@uejji.net>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: Paco Avelar <pacoavelar@hotmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
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
+		},
+		.driver_data = (void *)&lcd640x960_leftside_up,
+	}, {    /* AYA NEO Flip KB/DS Top Screen */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "FLIP"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* AYA NEO Founder */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYA NEO"),
-- 
2.43.0

