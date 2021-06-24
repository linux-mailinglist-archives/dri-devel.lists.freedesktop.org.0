Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 968AD3B2D02
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 12:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04D46EB5A;
	Thu, 24 Jun 2021 10:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F344E6EB5A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 10:55:27 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so5665126pjn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ovqPGUQPtbi9LNkbTpa5Y8dCy9rTdlKhQzy2ogksdJE=;
 b=LZguRud9skgmE05y7DdRbbHenMIcXxUkQGAfGtYIuObeQwsrZBdlKras4snIntfFGW
 UMvilXQaSeu16CBluo5pYm314hKeCeddvQxIFODOQk97WxdR4bJYCnYbc/xbC6619FV5
 5jsAp3Wx33VRGJQ/6MIWYVtEOf/O8w+Ubdx9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovqPGUQPtbi9LNkbTpa5Y8dCy9rTdlKhQzy2ogksdJE=;
 b=rDRks12IjYLUk/tOJ0e72XFcyeM+SoDVoTH6ZgwY+H3AT/PUmiZxbs9X1hBGXfOjks
 HdkKO17vSTSph84KFGx2xko2G65XFRRxNYldzgF1yLrS+I8CiaHtCbGzmpSp5Wms1pai
 t/G5c5bovVlLuRy5PNWot39lNes0Z8eMuuZH6Z07w2PHsgDL02VS440gZv1UfkgaDKfN
 jjYWqvAXKH117hgQv5vSCxVHmMvMqVKpZLm6tP3/U+h51+CmcbNHtPd45Bh+F7D1HNmt
 9UL8Lw8fXFUqWqv+UbRKCpNUyp/n8mtJQjn4pJBLeRgN475kX4u7bxVbHBigWxXAQQTk
 4nCw==
X-Gm-Message-State: AOAM530RV3g+bIt/xEeFS4kHg3MdbQoPfIk6a19GyA/KfwUGzWouVc9A
 nCah9/dlUizXrVzAJhSrKfgJlISlxpCNbw==
X-Google-Smtp-Source: ABdhPJw1VAb8x6usa6X7gmyM/UenV/k+g8Gc96ZuEqGo8DCN70yTuL0TZ9yHRL+gn1ALSzPY8Iuylw==
X-Received: by 2002:a17:90a:66ca:: with SMTP id
 z10mr4765432pjl.78.1624532127367; 
 Thu, 24 Jun 2021 03:55:27 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:368f:686c:969:1f38])
 by smtp.gmail.com with ESMTPSA id t7sm2212536pgh.52.2021.06.24.03.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:55:27 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 RESEND 2/3] drm/mediatek: init panel orientation property
Date: Thu, 24 Jun 2021 18:55:16 +0800
Message-Id: <20210624105517.3886963-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210624105517.3886963-1-hsinyi@chromium.org>
References: <20210624105517.3886963-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd92..9da1fd6491319 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	ret = drm_connector_init_panel_orientation_property(dsi->connector);
+	if (ret) {
+		DRM_ERROR("Unable to init panel orientation\n");
+		goto err_cleanup_encoder;
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.32.0.288.g62a8d224e6-goog

