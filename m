Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEB353A122
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8DB10EB5F;
	Wed,  1 Jun 2022 09:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBFE810EB5F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:47:11 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so5679922pju.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kFnswbSxGwrRy/NQADQjmmMBaytsFgRzRtZUq2P5fVw=;
 b=ErjYVzHSMtL2UomTsVi7tibDCfhMwLbxBslThaP44wqh4DHChnKrN++NI5RhSZPYfC
 Gm3RRstEdhV4L3kxlolN40Nsg9TYKbIF6sbCjvLhWMacNHii7EhOCl8zF8PssLNTP/fS
 YGFNj0OxIkbV3RMUocdQHadyiWO87CoS4BxS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kFnswbSxGwrRy/NQADQjmmMBaytsFgRzRtZUq2P5fVw=;
 b=CrRm06xqT8ZZN6poPKgj59zzT9Eh1wO/G6Uq6b0NvayPtF/qyQ18fsEe+/wc+69DMK
 33emhwvSUE2k9iRVh533DnwtrDpGJHfK/1fNrA1AROsLToA4af2uK+7rasXta1ziuk1Z
 ckwhgZJi7I2NwvEK5pqP1JcwvVXFOySfQKkpoiAvd3xXz5nOHkkMdOP2TAXn0jR+e2fX
 m1ZoptHo7RkkUiz4imn8FfBEALlBzsXyPbP8tCQzPhvVg76LvRl2Vy0PwDo72zhMMvxg
 BX4RGaYyED+AT2KYGkD2kgrrNiOnn7+eRCWSrICr3v5635SpQW7r59ddEg+T6hAjn58U
 ggtA==
X-Gm-Message-State: AOAM531U3XQ/GGSQSvlnbLoo70/xz8u9KQmme+K4mJJjD6t5IBBRJKPZ
 o5KffXPvG08YztFim70/h9kUUw==
X-Google-Smtp-Source: ABdhPJxrRTUbKi5bPBa/fX0MOFI2Wb3mwKyCfpA3888E4QDVRu2YuRIzrg8baKhCW1q9srQYrEq3/w==
X-Received: by 2002:a17:902:aa04:b0:163:c204:f41 with SMTP id
 be4-20020a170902aa0400b00163c2040f41mr17751950plb.172.1654076831401; 
 Wed, 01 Jun 2022 02:47:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:47:11 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 8/8] drm/mediatek: Config orientation property if panel
 provides it
Date: Wed,  1 Jun 2022 17:46:37 +0800
Message-Id: <20220601094637.1200634-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
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
v1->v2: remove unused checks.
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

