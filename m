Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AAC53F90E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52A11A70A;
	Tue,  7 Jun 2022 09:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F4D11A70A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:06:24 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id d129so15263586pgc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lndmMwy1Xi5onPK/2gR/uuIgcJtx+Xqka0AqhZOCETk=;
 b=nEwqxsOomZ0VyeLUG6ZdtIT5DHvDyUz42wh0TrdWqyIV7DES04zqZT/xTI4m/jl4wJ
 7spZlLhVnaPE9NGehQBm6p/6cay1FPtBmqiYv//gBqWsA0rsYdzGXBPrKChzufa8M3X8
 yHZDSKUIaIuf8HkJxNNZ8scTGDOI7mvF2sKjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lndmMwy1Xi5onPK/2gR/uuIgcJtx+Xqka0AqhZOCETk=;
 b=6OqZxmYKgtfiDjxI9UPDTMDE7d7wdtIkNlL+UDi6CYvi/U3N+C7GEKwIIC1pt2tddI
 PhcxfGzFvM65HyPHEh4NgjKiX3lF67wYKP5bz8InLYet8zDRZyxTZRcsFCfgjl9lAJcX
 10K7qJhz0Dl5+nLwvcF1kAakv0GrFf6tDy2bg6/Oa6FXLJntsXa8AQFdMdBSGoWCf2K3
 iHqn1Sl8uIcchscgSN1JMgNSwuJP8Cwa1R07AsKCtp5sRRJA7K8odVjZT5jZwuz0fzK4
 G/ae9yhFKmE/VT2XDXvnM+SCc5U+fNT2UQ9ilAgm/ead96Vn9uL4VmRXCrl9VDpqFypq
 kgRw==
X-Gm-Message-State: AOAM533GZGm+zVyvknHDFON3xG3dtY3LVtXPl0p1pIiCl9xR6Eh3gxXL
 PlpHpVV/7k04LPqivn+l7rjibA==
X-Google-Smtp-Source: ABdhPJy9/p/zRGqxgyYDjGPvzOwSsGPu3zYSpJfyIjbAxG5xTl/4JRnWDwLQuIRLjKB4AcijPvphZQ==
X-Received: by 2002:a63:8641:0:b0:3fd:94e8:a650 with SMTP id
 x62-20020a638641000000b003fd94e8a650mr11053873pgd.367.1654592783556; 
 Tue, 07 Jun 2022 02:06:23 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:06:23 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 8/8] drm/mediatek: Config orientation property if panel
 provides it
Date: Tue,  7 Jun 2022 17:05:49 +0800
Message-Id: <20220607090549.2345795-9-hsinyi@chromium.org>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v4->v5:
- use the new function in v5.
- don't use drm_of_find_panel_or_bridge().
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d9f10a33e6fa..998b1237e193 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -185,6 +185,7 @@ struct mtk_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_panel *panel;
 	struct drm_connector *connector;
 	struct phy *phy;
 
@@ -822,6 +823,10 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	/* Read panel orientation */
+	drm_connector_set_orientation_from_panel(dsi->connector, dsi->panel);
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
@@ -836,6 +841,16 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	int ret;
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	struct device_node *panel_node;
+
+	/* Get panel if existed */
+	panel_node = of_graph_get_remote_node(dev->of_node, 0, 0);
+	if (panel_node) {
+		dsi->panel = of_drm_find_panel(panel_node);
+		if (IS_ERR(dsi->panel))
+			dsi->panel = NULL;
+		of_node_put(panel_node);
+	}
 
 	ret = mtk_dsi_encoder_init(drm, dsi);
 	if (ret)
-- 
2.36.1.255.ge46751e96f-goog

