Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E0553F90B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D7411A6A2;
	Tue,  7 Jun 2022 09:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6DC112DF1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:06:17 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id p8so14988627pfh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1HCnyXhOafzmcP69v2HLalUicns4RO/ZQ4qvjS6XyGk=;
 b=ge9Jny+hYIej3cj9ag/91xWa81svwEBV3N/ogFXUBgG8rjD7S/momLJGj/7KfP47Wy
 LYvdSpbngfwMYyTZAwYAiJC5uxG+viVuvfdtirnB7O0giwIJnl+IUWu8X0LiYKRKC6/z
 Lb0aWIcnWIDHNQ4GOq+bVdZ8jjlqGU35La27o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1HCnyXhOafzmcP69v2HLalUicns4RO/ZQ4qvjS6XyGk=;
 b=G0QjipumzNJWS6sZBxVJJTpV3KRt0bmvuqUfOqNV9Ger3xjF1Ku65YJJCRDnbPui/F
 db8/yzs6WrwoV514ZfGNQM/OKw47cYLp5WzcP6DVmPHqjGvPhTF0tE8YL8Qgc7JKBfxq
 Pxmcs1kDlZNIohWEoPu3EBBkK0U7ziM2EeW+exNX0uiYwgd66UyaB8gw42206NMftp+u
 WDEbPDfhGwMiva0beWndxcdY8RC9PBFB/DNjgoOBz5OIcC9xJ2eC3mst3Y6vpnJ1k/3D
 Sjtgf59gtO2wC6gwW2Mh8TriLhMYZ8S6l3UWBL1G1IuECW/vjewN9dwVm84z9pC8JzJ9
 gBbg==
X-Gm-Message-State: AOAM530I97Mmf4MdeS2Q80kvLNfTdFfJ2TK5wVAhIf/HW+NZNhjvswYm
 bkQJXByLme916LJcv7Tu4V3i/g==
X-Google-Smtp-Source: ABdhPJxKZGd/WWz8p/7xzdQeoeP8D9dga0Yr240VSGPMjirb2qQdTmq6Ah77nkDx9vsM0hVp0VQ0UA==
X-Received: by 2002:a05:6a00:1a49:b0:51b:8e5d:424b with SMTP id
 h9-20020a056a001a4900b0051b8e5d424bmr28485080pfv.66.1654592776372; 
 Tue, 07 Jun 2022 02:06:16 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:06:15 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 6/8] drm/panel: ili9881c: Implement .get_orientation
 callback
Date: Tue,  7 Jun 2022 17:05:47 +0800
Message-Id: <20220607090549.2345795-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607090549.2345795-1-hsinyi@chromium.org>
References: <20220607090549.2345795-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ad..58d6798c25ed 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -853,17 +853,29 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
 
+static enum drm_panel_orientation ili9881c_get_orientation(struct drm_panel *panel)
+{
+       struct ili9881c *ctx = panel_to_ili9881c(panel);
+
+       return ctx->orientation;
+}
+
 static const struct drm_panel_funcs ili9881c_funcs = {
 	.prepare	= ili9881c_prepare,
 	.unprepare	= ili9881c_unprepare,
 	.enable		= ili9881c_enable,
 	.disable	= ili9881c_disable,
 	.get_modes	= ili9881c_get_modes,
+	.get_orientation = ili9881c_get_orientation,
 };
 
 static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
-- 
2.36.1.255.ge46751e96f-goog

