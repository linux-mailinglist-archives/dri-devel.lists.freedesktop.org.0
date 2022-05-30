Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2422C5379E5
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 13:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B6410E581;
	Mon, 30 May 2022 11:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6780610E581
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 11:30:40 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id cx11so2396620pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1LR1Tu5dH4Zqx/bEdD15yjr+iCH9O5A3630Rxdr7ufM=;
 b=iq8hfF07jpOTw9vnza7dhu2R3VgXuYuWFbQJXvXUywAg2a7FwiOA9DZqik/AY+Iw9c
 dc/xqzKTnSpkG4Gh/1+wb2Uql6MKGJ0DAAuxrH9DZ4Da2i1MSSRBR+OHp1JrCV9OcEq4
 Ow/85pl2hxvu+EJ2Ie5FMtST8Go1YBa+6Npvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1LR1Tu5dH4Zqx/bEdD15yjr+iCH9O5A3630Rxdr7ufM=;
 b=5m1ls2Ktc2S6qAxew6ZSt+V4tDgh91/tDjUmQ/vOUvm56fT5FVRwXIlH7U+pxd/jLX
 30eyWInvpeaQHtimSLZ7c8XlvhhZIckx63NvmR7JY0lwWHzw9fKTL7GzGodLaSLuPG0p
 4pRRmiVRo/11HpZVEQSbBQxVquMcn72IsQj96mZ30TBZsoU0R4dsCkQ+rQNmA2UQv7VE
 CxYVtd41QDHFu0wxKybT7PUckHiTjXGgPAXx7jFtQgeTA03mjx7FTGaCjdvr9R0c6hoH
 ul84F/1/u8xPsbn4RcKwLIgrDv+avwri1P9zqN5RDpEH2SeZqmJ3HkGjVLz5uwAREz9F
 CK9Q==
X-Gm-Message-State: AOAM533N2oyVqQEaKD9pgVRLCQ1Ra/R+cEAQxbalk2EgJtewdoEqqGK1
 7EHTJVjvEpyXlKIPR0qiIMvSGQ==
X-Google-Smtp-Source: ABdhPJyNeD8LmDCsvC/XVQPkRq4HOHV0lgFLmaOFAz25EFxhZMA8/4iMeqygIHLdjPqRtFlwHfwzuQ==
X-Received: by 2002:a17:902:b688:b0:162:3124:cde2 with SMTP id
 c8-20020a170902b68800b001623124cde2mr36157868pls.166.1653910239861; 
 Mon, 30 May 2022 04:30:39 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ae1c:3d63:abec:1097])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a654583000000b003fa5b550303sm8384222pgq.68.2022.05.30.04.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 04:30:39 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 1/2] drm/mediatek: Config orientation property if panel
 provides it
Date: Mon, 30 May 2022 19:30:32 +0800
Message-Id: <20220530113033.124072-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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
---
This patch is to solve the same problem as [1]
[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d9f10a33e6fa..091107f97ccc 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -198,6 +198,7 @@ struct mtk_dsi {
 
 	unsigned long mode_flags;
 	enum mipi_dsi_pixel_format format;
+	enum drm_panel_orientation orientation;
 	unsigned int lanes;
 	struct videomode vm;
 	struct mtk_phy_timing phy_timing;
@@ -822,6 +823,10 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	if (dsi->orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
+		drm_connector_set_panel_orientation(dsi->connector, dsi->orientation);
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
@@ -836,6 +841,14 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	struct drm_panel *panel;
+
+	/* Read panel orientation if existed */
+	dsi->orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
+	if (!ret && panel && panel->dev) {
+		of_drm_get_panel_orientation(panel->dev->of_node, &dsi->orientation);
+	}
 
 	ret = mtk_dsi_encoder_init(drm, dsi);
 	if (ret)
-- 
2.36.1.124.g0e6072fb45-goog

