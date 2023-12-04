Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CD803DD3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAFA10E3C8;
	Mon,  4 Dec 2023 18:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C395010E3CC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:29 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6d858670630so2560323a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716249; x=1702321049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqG2snvAFFOieKorYhuNC1Brzfr2ap7NECEbi10aNlw=;
 b=ID22eXXW8DJyWv+gWduTybu6gEJ22bzYSm8TNM1H7Ixb3/ZDH4dlD8GAbtRBHaR7NY
 KttNvsv6x9Ec9/0nYM3Md2ApoKPokJzZc9Xd6Syl1kCrokqcdrtLH4uLGyu2ghtgv18G
 FUZmcYyEhAwXfKcMgOboVR6g9V9XmyEfVG1zz2Q0Y6PcvMj74YOm0MJJORQDghPqas2B
 t+U4+6L5x9NDUvFrykQxKE50uKFCjfZyM6XC6Xpi6ZzNXLzb+rFS6+1LRyy0gAJ0d3IM
 u3rkAwTAdGhjvEWIHGQCj/N20p1V2CnKRkm9o/8WYOl+XdRUgOu2QsTUfNgHIvomaSqh
 xFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716249; x=1702321049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqG2snvAFFOieKorYhuNC1Brzfr2ap7NECEbi10aNlw=;
 b=vOT+0H1L8CacXabvuaD+wCdAAuLUTYReejPGNnttAYh3z0vU9ZM0FvjlVtGQD6LXyk
 ik3k2lHSgFLLp3Ltnpe+wRolNuPWvCjh9Tbz9faLC3aHW8kNVTXYrPjGB/nkocBfm5On
 TYP1RqkCEMNiV9kd02sit7LnJehMvFI/i6UMCBvJvu/neQ2yOPcfLdvYb0g5pSCTGAtd
 acwPRVfyx2DHRJdKCWeXTx1f+o7hfwtHxsSRGILKcNnRBs434uTBEnulBXDLcm9OmwYz
 mw2W11tBdMxKDBVenL9/ig+EViYNWHyK0nLQxYk5XZ1sPsS5qs3buPINICNkigz0+uYw
 vyug==
X-Gm-Message-State: AOJu0YyNRKGGhSPaiGy73AfCQsSQ3SEXZQGrs6AfHaCvXZ5NEjUw3Ne5
 JlEy6lRZu3f8hkVdJV+4dj4=
X-Google-Smtp-Source: AGHT+IFzW6+z7C8Ml2LbohiIxnhnkOFSqVt0Hu8XhACQOMYCMXYHj43Tp5sgAxVYwW+HAwtsrHue1g==
X-Received: by 2002:a05:6830:3b84:b0:6d8:8077:8017 with SMTP id
 dm4-20020a0568303b8400b006d880778017mr4050327otb.4.1701716249072; 
 Mon, 04 Dec 2023 10:57:29 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:28 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 04/10] drm/panel: himax-hx8394: Add Panel Rotation Support
Date: Mon,  4 Dec 2023 12:57:13 -0600
Message-Id: <20231204185719.569021-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for setting the rotation property for the Himax HX8394
panel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index d8e590d5e1da..b68ea09f4725 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -68,6 +68,7 @@ struct hx8394 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
+	enum drm_panel_orientation orientation;
 
 	const struct hx8394_panel_desc *desc;
 };
@@ -324,12 +325,20 @@ static int hx8394_get_modes(struct drm_panel *panel,
 	return 1;
 }
 
+static enum drm_panel_orientation hx8394_get_orientation(struct drm_panel *panel)
+{
+	struct hx8394 *ctx = panel_to_hx8394(panel);
+
+	return ctx->orientation;
+}
+
 static const struct drm_panel_funcs hx8394_drm_funcs = {
 	.disable   = hx8394_disable,
 	.unprepare = hx8394_unprepare,
 	.prepare   = hx8394_prepare,
 	.enable	   = hx8394_enable,
 	.get_modes = hx8394_get_modes,
+	.get_orientation = hx8394_get_orientation,
 };
 
 static int hx8394_probe(struct mipi_dsi_device *dsi)
@@ -347,6 +356,12 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
 				     "Failed to get reset gpio\n");
 
+	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
+	if (ret < 0) {
+		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
+		return ret;
+	}
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dev = dev;
-- 
2.34.1

