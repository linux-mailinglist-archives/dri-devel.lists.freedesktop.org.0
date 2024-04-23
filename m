Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919078AFBAC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 00:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA1010ED29;
	Tue, 23 Apr 2024 22:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OeE1Eicm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18981136CB
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 20:55:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-41a0979b9aeso24619205e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713905719; x=1714510519; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TbfLpkC6sUOo8U9culftXF70TNu8J3c2HXxMlG6vGno=;
 b=OeE1EicmPlLbUoHRo6VbXL/aocOYV71Y5V/ZFYeU4qGRkwT6jjN/ASoTZLzG1C0HP6
 d+Oar6tBoPYgB5GDo87TbvOEZq+FFSvJF4Qn+uOT8VXeXFyhCpNvoOxBAc24qtxSUb6r
 F2DO3d5qs8cS8U4tVwZJmBD9LeWck9X93hm3w4SgUkjFF/mzePyUdtT8fF02Hqkf/6+p
 wdK9/D5Dao+zzONRw/CdLT84upiMCiCdilzftuK1UHLoZe4D9phm1Ri6d8N13OyOfMvN
 zZ+qM5l80TX6KPyBkevuSkY4b2PulDfpaZfBOT2hc4OnqGhKUZqiDMLokAby0+QcI63S
 yuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713905719; x=1714510519;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbfLpkC6sUOo8U9culftXF70TNu8J3c2HXxMlG6vGno=;
 b=VE+ZFrFapH/TF2IdmObsnIpTAv370yNFoyPZkVcapX3baBYW9QLYs+trQhlk2lXGU0
 w0ZAd+JkG1MPNgj5r19igROpqvp8tGsUp8C0sbTke+9g8FiJ+nCBrlD5zWjte1FNmbda
 CXr1C/gl9UweDIyQ+nAuWUZLQ5+JFF7JpSqm7uzC/c8nLSqlXwvDlFrZiLdA1mEwPWq5
 kJWwYVkKEzmRkwiyZ2Slx25C2VQXgzHA94qKVVzYYdcmPO9CFfjxgcBcoNnXJRl+pbnS
 TEFTO++MgaU+xzxNW/RK+E9uCXZQNGRKIfnkL3hTJ2yGEQOYGEQg9Aih3W9BrRkGXfkh
 7HRQ==
X-Gm-Message-State: AOJu0Yw3U9+rebhEUF1p0aJktM60SV65ZTUnQ9Y5iYIgnsE85dMbUlna
 yLDz6mEzjL9rxwzUZL6Qfbx8eQ5SC7ZE47HSfEJ27YyjT6znbNRg
X-Google-Smtp-Source: AGHT+IEbJO5sd+0HnvGDWDkavS9ctSks7YgX/fPrRil0nJ1UKoMxDRyYkerrE1jAXCQAZZdWz6LmdQ==
X-Received: by 2002:a05:600c:4ec9:b0:41a:bf5d:c30a with SMTP id
 g9-20020a05600c4ec900b0041abf5dc30amr441241wmq.18.1713905718653; 
 Tue, 23 Apr 2024 13:55:18 -0700 (PDT)
Received: from [192.168.1.130] (BC249051.unconfigured.pool.telekom.hu.
 [188.36.144.81]) by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b0041ac5f19213sm2960332wmb.8.2024.04.23.13.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 13:55:18 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Tue, 23 Apr 2024 22:54:33 +0200
Subject: [PATCH] drm/panel: jdi-fhd-r63452: make use of prepare_prev_first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-jdi-fix-v1-1-808970662b40@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAggKGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEyNj3ayUTN20zApdSwuzRHNLs0RjQwNDJaDqgqJUoDDYpOjY2loAgWt
 gkFkAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 y.oudjana@protonmail.com, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0
X-Mailman-Approved-At: Tue, 23 Apr 2024 22:22:29 +0000
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

The DSI host must be enabled for the panel to be initialized in
prepare(). Set the prepare_prev_first flag to guarantee this.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index 3e0a8e0d58a0..483dc88d16d8 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -247,6 +247,7 @@ static int jdi_fhd_r63452_probe(struct mipi_dsi_device *dsi)
 
 	drm_panel_init(&ctx->panel, dev, &jdi_fhd_r63452_panel_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
+	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)

---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240423-jdi-fix-986a796a3101

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>

