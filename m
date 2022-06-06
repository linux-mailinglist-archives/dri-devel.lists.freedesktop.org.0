Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE953E093
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 06:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBDC11238E;
	Mon,  6 Jun 2022 04:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3721B11238E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 04:47:55 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id p8so11811336pfh.8
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Jun 2022 21:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rFqpHuECGLqoarwvqRrQML/2d/T3XwkU1fNzjkmrThY=;
 b=nG1yyOS5j92wx36wFLjCQZuqCI8wBnye/wbubTHe2BewKZzQ9yMf1UIW4GqUrEowLO
 oNioyR4aXi/4ny+ODAKcr8PzVpr6DIY/BPv7GvZ70ptVaGPylbVMca7uastiacbDBQ4f
 ILJTMDta6UTJD0Pb6Sx2xdZNL3cnUMePfPSak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFqpHuECGLqoarwvqRrQML/2d/T3XwkU1fNzjkmrThY=;
 b=hhfKHeXpd8gimuzumv/LAVB5CQWoZskTj3RYXv8bH7DvNVo8lDIz3SciFbay40vILZ
 2GyKeb6BhmIwdy0BZje134/0pn00X+SbF27zo9fPhlPIqSJ6hd99TerALjsjMp9+La/m
 tG0yqB2ZqQ2eBtF53sphREpQ5EQv6q/m8anf2sKxighvbY8VNn/b1P5wumJ1pWQR99a4
 JN/rJxEL81KvQt0DxkXrsPi2HJ6CTL0ocgbRnkXVtV0nXJjuTXX3CoL/C+nWcUiVwYR7
 VM7CP1wHcQK9fUL6OqG9V+BubJKTUeoO+/3QkWwno577TFjjTSfxIKph+aEh7uvlphHb
 WUdg==
X-Gm-Message-State: AOAM531Wld4R2Z0MoCK8/+bg8SDuf/6liDA1KE/rkKYIvl3KdJ3xWWVo
 +yyuCttwpSQJ1vtVsVfHlR9DnQ==
X-Google-Smtp-Source: ABdhPJzMQinIyRVXtoVcfR4sTm2R3u3+0i2fuXPqOVvQzKi6bI2cScBSpS72MoNigiZHZpLbI2uKdA==
X-Received: by 2002:a05:6a00:23c4:b0:51c:5e8:e8a9 with SMTP id
 g4-20020a056a0023c400b0051c05e8e8a9mr7064626pfc.62.1654490874687; 
 Sun, 05 Jun 2022 21:47:54 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ced3:b110:401b:b32c])
 by smtp.gmail.com with ESMTPSA id
 t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 21:47:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3 8/8] drm/mediatek: Config orientation property if panel
 provides it
Date: Mon,  6 Jun 2022 12:47:20 +0800
Message-Id: <20220606044720.945964-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220606044720.945964-1-hsinyi@chromium.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
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

Panel orientation property should be set before drm_dev_register().
Mediatek drm driver calls drm_dev_register() in .bind(). However, most
panels sets orientation property relatively late, mostly in .get_modes()
callback, since this is when they are able to get the connector and
binds the orientation property to it, though the value should be known
when the panel is probed.

Let the drm driver check if the remote end point is a panel and if it
contains the orientation property. If it does, set it before
drm_dev_register() is called.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v2->v3: no change.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index bd3f5b485085..86613360d2d9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -185,6 +185,7 @@ struct mtk_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_panel *panel;
 	struct drm_connector *connector;
 	struct phy *phy;
 
@@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	/* Read panel orientation */
+	if (dsi->panel)
+		drm_connector_set_panel_orientation(dsi->connector,
+				drm_panel_get_orientation(dsi->panel));
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
@@ -837,6 +844,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	/* Get panel if existed */
+	drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
+
 	ret = mtk_dsi_encoder_init(drm, dsi);
 	if (ret)
 		return ret;
-- 
2.36.1.255.ge46751e96f-goog

