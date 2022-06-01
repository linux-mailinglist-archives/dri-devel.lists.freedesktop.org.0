Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B5539F2B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057E810EF2B;
	Wed,  1 Jun 2022 08:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA9E1134DC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:18:59 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so1353032pjt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 01:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tde+IhIAyMS5phfhjLJ/xUjc9TpTeEZ8Vt0Thw0su/Y=;
 b=AvPaiVerLhPA7bu4ah3qZZGvu6x+scDrnj9QwMVpBGEzH3jZ7jjZctDsthGN2X75vw
 +gqQh9EYZiKEDVg457+bSPZMSAva31GxPBAHUAeqWSP4I5zE+e61zJti+EJ+Q8OnrZ/N
 KigOKjCuq65/FJ5z6+Tj+iW5NfPqCgjMotibk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tde+IhIAyMS5phfhjLJ/xUjc9TpTeEZ8Vt0Thw0su/Y=;
 b=iyFKHvG4cyyhNoqNvUICtM/ypt6hO/IKDrNDYhdaASxmLxGDLCAfrHwsFiP5lF7hFb
 ejXaOAIhVHjFCEg9tFkDpcw4oTchPaCeJlxrYXk8kFODdtTvVrhR0L2frKlbr+O1KzLW
 ZOFbnB7h+WW70UldtCP3GM5+TDDrWs4kGvkbPPQJISY/OKNkVA4m7e2SiOg9wMZQrZDO
 J8CKzFPZew0Dz9ScmvODj+7nlPhqMKL/TRjbLpE6qWOLhTjhHGSbV0S4p2Ocj6QTJrNh
 EB+vx1Ed2lmUYsBYQSa+de/86lBLFdQYT4Auu/djDhv30NbBCZS9zuc5JUx5p+ZSjB/N
 qcxQ==
X-Gm-Message-State: AOAM5312HkxreLljhy6uV1AFlPLaUfEPVcOQh4hbmSl5v4NSzSEyMT9o
 hFKkQy7NfLb0gmp9hHO4tv1LuA==
X-Google-Smtp-Source: ABdhPJyJZ9Nd5iUhCD6MyJuY2jjn3E+5iA+mGbWJIcSz/UCeJVMvsyFTNMYYQQ2/CExPe30dQ0kFsA==
X-Received: by 2002:a17:90b:1e44:b0:1e2:e772:5f08 with SMTP id
 pi4-20020a17090b1e4400b001e2e7725f08mr17755299pjb.129.1654071539081; 
 Wed, 01 Jun 2022 01:18:59 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 01:18:58 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 8/8] drm/mediatek: Config orientation property if panel
 provides it
Date: Wed,  1 Jun 2022 16:18:23 +0800
Message-Id: <20220601081823.1038797-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
References: <20220601081823.1038797-1-hsinyi@chromium.org>
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
---
The concept is the same as the previous version.
https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
The only difference is, it now uses the panel API instead of parsing
orientation from the driver.
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index bd3f5b485085..12836a697f56 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -185,6 +185,7 @@ struct mtk_dsi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_panel *panel;
 	struct drm_connector *connector;
 	struct phy *phy;
 
@@ -822,6 +823,16 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	/* Read panel orientation */
+	if (dsi->panel) {
+		enum drm_panel_orientation orientation;
+
+		orientation = drm_panel_get_orientation(dsi->panel);
+		if (orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
+			drm_connector_set_panel_orientation(dsi->connector, orientation);
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
@@ -837,6 +848,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_device *drm = data;
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	/* Get panel if existed */
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
+
 	ret = mtk_dsi_encoder_init(drm, dsi);
 	if (ret)
 		return ret;
-- 
2.36.1.255.ge46751e96f-goog

