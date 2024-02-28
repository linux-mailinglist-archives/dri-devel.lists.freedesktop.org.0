Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAA86A4C4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 02:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A495710E4FC;
	Wed, 28 Feb 2024 01:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lMT3k01O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9F210E4FC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 01:11:41 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1d911c2103aso29477265ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 17:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709082701; x=1709687501;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUDXeYcrvidwDBcA1WOXXMMQ4eSI9QRabZdiDLCy8AY=;
 b=lMT3k01OYTrkmftH/RP2VU9k5yE3h/8HMd1HHabR8NQgBhjr8Z1alCxn+1+UhfhSN5
 RRNDnjEmT0PHsGcvTYHuDRYJcgVA4tN+/F0CbuCJ0i3z2PGBV9wYeU8slyGUfac27tvS
 u1kf2aYQmIyd6eFGPVYiR3QVkEbxL5tM9YSM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709082701; x=1709687501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUDXeYcrvidwDBcA1WOXXMMQ4eSI9QRabZdiDLCy8AY=;
 b=fivDN1XdpGEIttrCdSyKs4Q9F7neLsqQISNoPrQwuO2u+CV9y65u3Vf8KV1cyNog3C
 ORSn54UD/6a/LhQrux93hlxX3WPyEVI4goXAYYo1dC/9atUuDWEVQcoD+whdy1yCUtUC
 Wx0QC9U0xzi5tMKjiemVlf17pdxui9KzdhfNuPNaDymh5r/TCnKkfl/zYlYTtQ6PY89Z
 4N6UfgyLHst4OQ3wP8r3rUfMditdQpdOMo0/3IFJLADRdJS+IgTt4gKS/SPS/JGX9/WC
 GXKfxLi9rliVYxZ85JMmf/pDx0ZUnvn6UMiJ3IzYMEm9LC/vfK+7Y7zJNlBUOByOuGmB
 GVPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr80KkYnJbjPUlVGNcGcq1oIUtQdSipRl4xMUpkEv15A1wWKj3r4NcKJALnyzPP4u62NzABHvyVG5K3jhcbx7Ime6jWBsdA2bkoBvvQtmk
X-Gm-Message-State: AOJu0YydIF8uzYmx7SbqErIEmfJ4NHXeHn8yAVyMtoZSYdHjLIgaMzwE
 H4jvewd00VI57RqwyAW0IZMh0ieB3He33CoVczo2vk3/WwpfDwKvwf3sMRHMnA==
X-Google-Smtp-Source: AGHT+IE0Z6fIVeriFN1uMUOqrW9/ukSipbQ+YPExtZ1nyKsCKZYK1PuQscgD1Vwgs+5BAfFvhvuBsg==
X-Received: by 2002:a17:903:985:b0:1db:c6ff:6648 with SMTP id
 mb5-20020a170903098500b001dbc6ff6648mr13245620plb.10.1709082700718; 
 Tue, 27 Feb 2024 17:11:40 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:87d1:e95d:b670:4783])
 by smtp.gmail.com with ESMTPSA id
 kl14-20020a170903074e00b001db4b3769f6sm2131529plb.280.2024.02.27.17.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 17:11:40 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/panel: panel-edp: Fix AUO 0x405c panel naming and
 add a variant
Date: Tue, 27 Feb 2024 17:06:00 -0800
Message-ID: <20240228011133.1238439-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
In-Reply-To: <20240228011133.1238439-1-hsinyi@chromium.org>
References: <20240228011133.1238439-1-hsinyi@chromium.org>
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
v2: new
---
 drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 72ad552bff24..e39af92342e8 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1013,6 +1013,19 @@ static const struct panel_desc auo_b101ean01 = {
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
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAN04.0 "),
+	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0 ",
+			 &auo_b116xa3_mode),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x435c, &delay_200_500_e50, "Unknown"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
-- 
2.44.0.rc1.240.g4c46232300-goog

