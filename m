Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A22653E569
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30AC11236E;
	Mon,  6 Jun 2022 15:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8D611235B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:24:58 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so12824241pjb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YL/lrHRCDaMsktsmCvu5YRB9LM1inDC2pOHgWJCndXw=;
 b=D1Z5KQS2HSLEvMtB2j3LAhR5NcmnjnaRakAOctNY/fTtjy6NJh9M/naWqqKJFMw1aD
 ftJxyHyWX2BaMF+GgrZvKktG7a0W4ygHBP4JLSRdjeUYzuH55ulRLZwJWhNBOqXdleCC
 u4gEGUizOSUZZfXcgjF2AXmGtp2hBT5JWMOXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YL/lrHRCDaMsktsmCvu5YRB9LM1inDC2pOHgWJCndXw=;
 b=uOP5zITZvkF3tIW3Nrcr6VtDWxJGfWRtl31kV6a2yTkzatAbVAv+1n8nVPMFZeuE0I
 tJCzgPI7PQ1m9qcjuZUgdJu+446J4kRZMPP17gozXLiV3Mlin4wo1gq8ItKqZbC4Bsas
 oLJPRQDOPr4+rJF7QyOD4/OtIY7b4hhLxM0ebVEXWqoBoHVhKXMGJ57W/mKb0RH13G8s
 Sq44v3BE2IdxlUhb1ptAD5lc8fgrFKZp9rBRgMbwqX0Sun6Nq9LmJzATbyJUQcwZbxG4
 G1bs9DYnN5ygCuyDkUBh4CYky0gxkaW7GdG0JZvMdRAsoVNPu+p5p1LBRYWDOuUnMvAW
 WElg==
X-Gm-Message-State: AOAM532ZhS2LKTAurIY76DHKy/M+w0mxaM2OcbaTv0LEghX+pqi4l1rm
 wP4cQf0IpClnvvSruMiZ2HTslSLTO7LonA==
X-Google-Smtp-Source: ABdhPJxjbZpEemJMQlqSYXCJpgXeUA7eJzzobDUSHMTnQ1O4rJ9DQ16x3dGz7G127Y3Adt9gtA60bQ==
X-Received: by 2002:a17:90a:930b:b0:1d5:684b:8e13 with SMTP id
 p11-20020a17090a930b00b001d5684b8e13mr27078340pjo.153.1654529098014; 
 Mon, 06 Jun 2022 08:24:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0a:5e4:e24:c8c4]) by smtp.gmail.com with ESMTPSA id
 h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 08:24:57 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v4 6/8] drm/panel: ili9881c: Implement .get_orientation
 callback
Date: Mon,  6 Jun 2022 23:24:29 +0800
Message-Id: <20220606152431.1889185-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606152431.1889185-1-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
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
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index ba30d11547ad..c098a0ed6be7 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -853,17 +853,31 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 
+	/*
+	 * drm drivers are expected to call drm_panel_get_orientation() to get
+	 * panel's orientation then drm_connector_set_panel_orientation() to
+	 * set the property before drm_dev_register(). Otherwise there will be
+	 * a WARN_ON if orientation is set after drm is registered.
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

