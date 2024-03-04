Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DDA870B07
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 20:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29683112523;
	Mon,  4 Mar 2024 19:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eX5QO3TJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F324F112521
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 19:52:21 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6e46dcd8feaso2752701b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 11:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709581941; x=1710186741;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EMSlD4D61SNUMtl55lAIMxqBblJYN3jwwZ/l0KMGCh0=;
 b=eX5QO3TJdw6gpu1TdP6LP4ZHELkjCCR9TZ2zf4CNLZhTaiW2mknSXq1vKrZqb6B8Ik
 MOonxAmoqz/7t4b4RlfvYRBwAoU5dVxFVOXg1NtYozevhsrel7u8cFe/+RVjPleLDR3m
 3wat+GzHRXvfAIuQCh58n7f7Za/CoG9yuWKYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709581941; x=1710186741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EMSlD4D61SNUMtl55lAIMxqBblJYN3jwwZ/l0KMGCh0=;
 b=XA1CwadmooYO60ZqQD8wo5+5HwGD30p+2pO50StvygKHIJECIHIrXCu9aOyn/q3I8L
 rMxIs1NhJjVnnUezJ/g67lbX8p5405jxX5TfzkPnYntFdAar2aVdTjY7VVUvhGFipooz
 7zuuI8b5AUicxhF3tEs+nPJLoSnGoGV6zrYjEjg3dvxwaeYhrIkXF5mxoByrm8OcVKo4
 i0a+IWvKZK0qefxIi5Q4YDJYv5izs+B2hqqPB8/UoGQHGg74KkCFLsvkdoHOFQxbdlDd
 mRpdaBjy3Wqii8wiNaU7UV5mPvsuhAYmP7ZUVDN2l4SKckmt44oef69l4IjkcSBpPup6
 Qx2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ6fV53jIxFcH6KvftOMcm80mEVTeSPVBJ+j8GLGbYQMn/+ii/Umidnlvdqo7W47KkPmDyg/vpKo+d5/rFQa7HQ9cexCywJRFrVRlRdA+7
X-Gm-Message-State: AOJu0YwPS5TR1odJjG/Ovq4/06OpZRg45I1QKhJSRtxsaQoFAbto2YmM
 Y1Tk1dRp4nt93x2wFKuvuBRHDSjMukeaLlFG4qDUv0ZL8sijOk1+Mz5hrDN6ww==
X-Google-Smtp-Source: AGHT+IHPtFpxTAyxqYpM+QvUFmcFVeN7dHU0wEyqkEdqd7zuA4ef1jTJ4eEAL4kK24nK/EHKqXAQdw==
X-Received: by 2002:a05:6a20:e11a:b0:1a1:4d8b:8cf9 with SMTP id
 kr26-20020a056a20e11a00b001a14d8b8cf9mr1728648pzb.11.1709581941402; 
 Mon, 04 Mar 2024 11:52:21 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bcf3:25da:25cd:199])
 by smtp.gmail.com with ESMTPSA id
 r27-20020aa7845b000000b006e04d2be954sm7600820pfn.187.2024.03.04.11.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 11:52:21 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] drm/panel: panel-edp: Fix AUO 0x405c panel naming and
 add a variant
Date: Mon,  4 Mar 2024 11:44:59 -0800
Message-ID: <20240304195214.14563-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
In-Reply-To: <20240304195214.14563-1-hsinyi@chromium.org>
References: <20240304195214.14563-1-hsinyi@chromium.org>
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
v2->v3: no change.
---
 drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index e3044e34c5f8..d2e181efff98 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1011,6 +1011,19 @@ static const struct panel_desc auo_b101ean01 = {
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
2.44.0.rc1.240.g4c46232300-goog

