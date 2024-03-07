Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF559875AD8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 00:07:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CE310F243;
	Thu,  7 Mar 2024 23:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JNktelNy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8072A10F243
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 23:07:02 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1dd6412da28so3978695ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 15:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709852822; x=1710457622;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XiUQw1ZTVNc5PMf1jcXsUl5pNMmYncCeRdBmheYnxcM=;
 b=JNktelNynh1SxTw7m5IKoUTisvgNIU0XNK7tySNGyHVrDV30k3oZNXKecFX/NXyzhs
 EM4SQXPiWwbpKzb8HF6ITW9so/VO7+KckoTzUVtaRzdh/9ZYdOFzbUJeaS16Ky95WxDX
 r3nI9Kixx6yfq+4PJRaanR8eMgwbNjaTucLJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709852822; x=1710457622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XiUQw1ZTVNc5PMf1jcXsUl5pNMmYncCeRdBmheYnxcM=;
 b=KVJv/EIwOjZfFMLb7AEAnxhNCWnd1fY5aa6gaZ43/Mkjvn4fwzkCPftjJtTZRNePRS
 EXFE/pLevoytkp9sCZze3RapApexIlDOP9CiZ+fPsqDFH9KHkwwtqdgf0CFoxVrOi3YX
 FnSgaroRiYoV7DAeUp7BO0usqfhe87ZiKsX5VRgNz9h+9h3ZrreFBYEz+4VGzLIGIhEI
 KyawZh6m++yMcdhG0tALfJRNzKN6VRNrK0ltSmYQjPlVFtxE0Q+5Dq5P28DF4akKdjy2
 T3I7jexiAjk9qOo1eqrMi7FluSCOXWg67DbMU/ICoEiTf4eDtOAXMn2KpaiTGXDmYFoW
 jveg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrXpAsFQpySb3We7ZkDVZgKT7vO/a7OMph44DGqn1q/uTuHlr0rBamNpLt3abbNWPeUO4oc8CGP260nmL60UO5wjoU5/ZiS/ZoG/Wp4oI9
X-Gm-Message-State: AOJu0Yy9mzppdScpnCdblJVsErVJkxBmV5hrFgHw34weqiQYvmpKJyHE
 ViVS4TnyvHG6eGtcTcgKRADhTurukD30SG2rC8GtTOj3mYOeuXpRm3yzaKnNqg==
X-Google-Smtp-Source: AGHT+IHoYt0E9CsIcSAwhLVXdVdiYr8vP/Y4N6g58/0g0X9YeIdqoKrM/CVpefcc0EVSlKAUOt/Mmg==
X-Received: by 2002:a17:902:f690:b0:1dd:46ca:be1 with SMTP id
 l16-20020a170902f69000b001dd46ca0be1mr4634856plg.55.1709852821963; 
 Thu, 07 Mar 2024 15:07:01 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:bf8f:10d4:f877:bee3])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b001db63cfe07dsm15196654plc.283.2024.03.07.15.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 15:07:01 -0800 (PST)
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
Subject: [PATCH v6 5/5] drm/panel-edp: Fix AUO 0x405c panel naming and add a
 variant
Date: Thu,  7 Mar 2024 14:57:45 -0800
Message-ID: <20240307230653.1807557-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240307230653.1807557-1-hsinyi@chromium.org>
References: <20240307230653.1807557-1-hsinyi@chromium.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v5->v6: remove trailing white space.
---
 drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 7f749b17df85..c7f81dd9023f 100644
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
+	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0",
+			 &auo_b116xa3_mode),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x435c, &delay_200_500_e50, "Unknown"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
-- 
2.44.0.278.ge034bb2e1d-goog

