Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A983C5FF0F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 03:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8EF10EB78;
	Sat, 15 Nov 2025 02:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W/3A2R8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E4E10EB78
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 02:58:39 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2955623e6faso23194665ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 18:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763175519; x=1763780319; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AOThRS7nDmg/X3Ml/NXAcROJCvUeqBDt9QIev12itfU=;
 b=W/3A2R8wgJPbWb5Q3sJAiAdx+UkkvPfPmt8n5EoMkYKIl4BblLYbuWv1FVMBCcflIy
 iFFLzmjLCA3J8sPsUBCQlqkk7hCBc8z7CJE6hycVkEPefpfziqSfQrRLDFh7oOHjWwQe
 oICQ7E/GGDhZQ92+RE7iC+uua3F//r1/JO1XzbV99j6U8PBwBem7t62jQ08KvZRIXpVC
 3qiC7rBcB5zMfF4AZvtS6ai3ZRi3tKfByYzR2c0Ettt7zpir/tzb89kRfFCq30xRXrVe
 Agp2Fdr92vCVBF8EEx5TPJL8z4KlSWDmEgJ/X8ttXYcgbjDUDyNS6xRvgfkCkK7kFX2n
 IzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763175519; x=1763780319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AOThRS7nDmg/X3Ml/NXAcROJCvUeqBDt9QIev12itfU=;
 b=no9Dr7s+TVqUk5Gqp58PocphwWWqZ65BNgGrIudfNOSt0XGV7QV35O4MbvOLRnW4ca
 jDzys+QoMtNxcE1BSUBXeeiq1ntjR0ogBd3802ftGNOqgePm8r44p3AezJzwgbmF3w9/
 v32vaJVMiAgwPJqQETsxOfK52cqOkNPOP3W5R8c1u89CLls3uHNwSb0D2NesdjM8x4Te
 SEHo1tuD6IzZ0ywfK5Ru50k0WiCPeOB0DZWufVpItrlu6J7qLKWdMOKxmHFXmglueWXk
 PxON+bNet+FlFK5yvgCEu5UNnE7wrWz5wjX93EJ3kbdx3UHCKj3oKY8vys3/NunYjXkH
 7B7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQYwNkSCV8LKFXo9yEmr5GMhJq581MKOxHAxW0ZUwJso6qTlSYrMYhtjrUVSEXFYJNpFNcmdUuOjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgXGQBJFB7fRNYmuNO1kIR72Umq94izbXUi/iayoGHwf7tuPYt
 SaGNe+Zbhte2YBMsJMU+BQZZUGZZpGVjk0Xd6sF8onGI0qzHDZnBxueF
X-Gm-Gg: ASbGncsLzoac00VU68kC0zbVpXKsFN/GRRMP8y089toEQZgewiq5OEAMjfA1VyfTEOF
 4k8rx5jXBF6ghF2sZc+4sMs+pSjuUJN+4F6Grz0xn9qp1eUXiKzn3wbygU0qvjzBOQzGNpDyg+P
 E4UccGD0OweYJ7TQn5m9D3R4byDGZzdJuiNeapueWOm5a/FL2FrlSoQcR/m/V+mpSPZZt36zYS8
 77klaIQFfCTgJxCyUruHCITD8TO0/WXuqx4n7azwiur+qMpDDridpCDQSbBZh8tC4VAImp3qGTM
 4BO3PqrFqrlpOEno26TlLUM0amiX+sw652kYgqOURvO9Ku6H/POmJwnf4mfBM3QI2PQV3avM9Lk
 7aP8iODaU4CovDUqEWCma84wLfXVTy4v1m9PpF7wpbBlI/qu968YOMza+fuuR+CohpSh3DQgODi
 jnRmx7v7dHowYRQNbykZu+p26R1RMMwChA8Y0=
X-Google-Smtp-Source: AGHT+IFFyXPe2hbOlJuzSFnfXZ5k15j0K9Bl/h71q3aSIuF4ivVyXXfsblJRf9byE6sfCxRozD/Cog==
X-Received: by 2002:a05:7022:69aa:b0:119:e55a:9c05 with SMTP id
 a92af1059eb24-11b41202e74mr2205840c88.33.1763175518654; 
 Fri, 14 Nov 2025 18:58:38 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:735a:fcf2:fc15:89cd])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b86afe12esm4215227c88.6.2025.11.14.18.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 18:58:38 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] drm/panel: simple: Add Raystar RFF500F-AWH-DNN panel entry
Date: Fri, 14 Nov 2025 23:58:27 -0300
Message-Id: <20251115025827.3113790-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251115025827.3113790-1-festevam@gmail.com>
References: <20251115025827.3113790-1-festevam@gmail.com>
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

Add support for the Raystar RFF500F-AWH-DNN 5.0" TFT 840x480 LVDS panel.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index da6b71b70a46..57c44b016957 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4106,6 +4106,30 @@ static const struct panel_desc qishenglong_gopher2b_lcd = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing raystar_rff500f_awh_dnn_timing = {
+	.pixelclock = { 23000000, 25000000, 27000000 },
+	.hactive = { 800, 800, 800 },
+	.hback_porch = { 4, 8, 48 },
+	.hfront_porch = { 4, 8, 48 },
+	.hsync_len = { 2, 4, 8 },
+	.vactive = { 480, 480, 480 },
+	.vback_porch = { 4, 8, 12 },
+	.vfront_porch = { 4, 8, 12 },
+	.vsync_len = { 2, 4, 8 },
+};
+
+static const struct panel_desc raystar_rff500f_awh_dnn = {
+	.timings = &raystar_rff500f_awh_dnn_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 108,
+		.height = 65,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing rocktech_rk043fn48h_timing = {
 	.pixelclock = { 6000000, 9000000, 12000000 },
 	.hactive = { 480, 480, 480 },
@@ -5378,6 +5402,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "qishenglong,gopher2b-lcd",
 		.data = &qishenglong_gopher2b_lcd,
+	}, {
+		.compatible = "raystar,rff500f-awh-dnn",
+		.data = &raystar_rff500f_awh_dnn,
 	}, {
 		.compatible = "rocktech,rk043fn48h",
 		.data = &rocktech_rk043fn48h,
-- 
2.34.1

