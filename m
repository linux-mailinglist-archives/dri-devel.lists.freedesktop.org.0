Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B022957319B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFFE98858;
	Wed, 13 Jul 2022 08:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F2C98856
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657702509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcVRbXz26cc5X8XJxCtVsg7MRei/k/v/fZBuSA3XpBc=;
 b=A/i7d2xg6I+guo1Th0TGloy6J0NWl8oKGcTF55zXXNCc/Spnsu41y+UV1w8S+yB415YbPz
 I/5OGlfwdrJcQe/TEpRstQVwzHG4XnCPgSYxUbzjsZL9vTkZojc7PvDf82n0xHABsBvaNP
 ne7scohIhjR3rohETpocjCudbaQawKw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-6Vbi36RbOsme2Bn2elrnAA-1; Wed, 13 Jul 2022 04:55:08 -0400
X-MC-Unique: 6Vbi36RbOsme2Bn2elrnAA-1
Received: by mail-ed1-f70.google.com with SMTP id
 j6-20020a05640211c600b0043a8ea2c138so7879416edw.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 01:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fcVRbXz26cc5X8XJxCtVsg7MRei/k/v/fZBuSA3XpBc=;
 b=dXxy1fC4EDK4qdVnjoWepoRlXjeBpY0j24VBigxfrn8TYa9IanXS7DWz1KfWki7Pcn
 o4eNusipXxaIq8Puhmo81Iang5tChSmZ17UsB743Ez+eUS1nRToWAGXsBhQvW+JP3GDm
 HKBL9RdocvDv0F1SRE7AokJgZKV1f5J9nGJgJK/TL79y7EUAkcpW0dRn0Lhplx66MHFF
 NBMKBolurZYDmZ5HY3mSRr7mK8Sheo8z0CPfPVNmhf+HuIJpKKaYT2r+UmEKnA2ZHBWh
 cyjlLw7caynWQAfaJA9VST7uCOQ0h07VZPW6xl0bkzE4+lsGGjP96JdTrg1vzXxMFu4L
 otzQ==
X-Gm-Message-State: AJIora+Y+sc1VW6tGR6PBpSSKOhhfQqst+czNpryQ1ez5R8q3oUxAw4L
 CGYwy6PrXJt3RbyEmCxAkpeYj//bX1LwghCWL2W9mxBUIt73HklN8ZR3mjTG6nrjzbuZ9acXrMJ
 FsrDaG1w8IRPgnB9px7v6gzikZB3A
X-Received: by 2002:a17:907:72d2:b0:72b:d238:4e81 with SMTP id
 du18-20020a17090772d200b0072bd2384e81mr1153070ejc.104.1657702506759; 
 Wed, 13 Jul 2022 01:55:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoCj1NHIejTvVs44x4SYoVeNxil/sudDW06Xq1k+Q+zM7RVtGQZQIK/xwAFNGifNgvc+vypQ==
X-Received: by 2002:a17:907:72d2:b0:72b:d238:4e81 with SMTP id
 du18-20020a17090772d200b0072bd2384e81mr1153057ejc.104.1657702506523; 
 Wed, 13 Jul 2022 01:55:06 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a056402088200b0042dcbc3f302sm7547655edy.36.2022.07.13.01.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:55:06 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: emma@anholt.net,
	mripard@kernel.org,
	daniel@ffwll.ch,
	airlied@linux.ie
Subject: [PATCH 3/3] drm/vc4: encoder: use drm managed resources
Date: Wed, 13 Jul 2022 10:55:00 +0200
Message-Id: <20220713085500.1970589-4-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713085500.1970589-1-dakr@redhat.com>
References: <20220713085500.1970589-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allocate the encoder objects with drmm_simple_encoder_alloc() in order to
tie the release action to the underlying struct drm_device, where all the
userspace visible stuff is attached to, rather than to struct device.

This can prevent potential use-after free issues on driver unload or
EPROBE_DEFERRED backoff.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_dpi.c  | 11 ++++++-----
 drivers/gpu/drm/vc4/vc4_dsi.c  | 10 +++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 ++++++----
 drivers/gpu/drm/vc4/vc4_vec.c  | 11 ++++++-----
 4 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c180eb60bee8..7f1703a42060 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -258,10 +258,12 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (!dpi)
 		return -ENOMEM;
 
-	vc4_dpi_encoder = devm_kzalloc(dev, sizeof(*vc4_dpi_encoder),
-				       GFP_KERNEL);
-	if (!vc4_dpi_encoder)
-		return -ENOMEM;
+	vc4_dpi_encoder = drmm_simple_encoder_alloc(drm, struct vc4_dpi_encoder,
+						    base.base,
+						    DRM_MODE_ENCODER_DPI);
+	if (IS_ERR(vc4_dpi_encoder))
+		return PTR_ERR(vc4_dpi_encoder);
+
 	vc4_dpi_encoder->base.type = VC4_ENCODER_TYPE_DPI;
 	vc4_dpi_encoder->dpi = dpi;
 	dpi->encoder = &vc4_dpi_encoder->base.base;
@@ -299,7 +301,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
 
-	drm_simple_encoder_init(drm, dpi->encoder, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(dpi->encoder, &vc4_dpi_encoder_helper_funcs);
 
 	ret = vc4_dpi_init_bridge(dpi);
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 98308a17e4ed..8ca3b73e26dc 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1498,10 +1498,11 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	dsi->variant = of_device_get_match_data(dev);
 
-	vc4_dsi_encoder = devm_kzalloc(dev, sizeof(*vc4_dsi_encoder),
-				       GFP_KERNEL);
-	if (!vc4_dsi_encoder)
-		return -ENOMEM;
+	vc4_dsi_encoder = drmm_simple_encoder_alloc(drm, struct vc4_dsi_encoder,
+						    base.base,
+						    DRM_MODE_ENCODER_DSI);
+	if (IS_ERR(vc4_dsi_encoder))
+		return PTR_ERR(vc4_dsi_encoder);
 
 	INIT_LIST_HEAD(&dsi->bridge_chain);
 	vc4_dsi_encoder->base.type = VC4_ENCODER_TYPE_DSI1;
@@ -1614,7 +1615,6 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, dsi->encoder, DRM_MODE_ENCODER_DSI);
 	drm_encoder_helper_add(dsi->encoder, &vc4_dsi_encoder_helper_funcs);
 
 	ret = drm_bridge_attach(dsi->encoder, dsi->bridge, NULL, 0);
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index ce9d16666d91..4657b09649f7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2834,9 +2834,12 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct device_node *ddc_node;
 	int ret;
 
-	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
-	if (!vc4_hdmi)
-		return -ENOMEM;
+	vc4_hdmi = drmm_simple_encoder_alloc(drm, struct vc4_hdmi,
+					     encoder.base,
+					     DRM_MODE_ENCODER_DSI);
+	if (IS_ERR(vc4_hdmi))
+		return PTR_ERR(vc4_hdmi);
+
 	mutex_init(&vc4_hdmi->mutex);
 	spin_lock_init(&vc4_hdmi->hw_lock);
 	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
@@ -2921,7 +2924,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 		clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
 	}
 
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
 	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
 
 	ret = vc4_hdmi_connector_init(drm, vc4_hdmi);
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 11fc3d6f66b1..d6466f1ef490 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -546,10 +546,12 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 	if (!vec)
 		return -ENOMEM;
 
-	vc4_vec_encoder = devm_kzalloc(dev, sizeof(*vc4_vec_encoder),
-				       GFP_KERNEL);
-	if (!vc4_vec_encoder)
-		return -ENOMEM;
+	vc4_vec_encoder = drmm_simple_encoder_alloc(drm, struct vc4_vec_encoder,
+						    base.base,
+						    DRM_MODE_ENCODER_TVDAC);
+	if (IS_ERR(vc4_vec_encoder))
+		return PTR_ERR(vc4_vec_encoder);
+
 	vc4_vec_encoder->base.type = VC4_ENCODER_TYPE_VEC;
 	vc4_vec_encoder->vec = vec;
 	vec->encoder = &vc4_vec_encoder->base.base;
@@ -574,7 +576,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_enable(dev);
 
-	drm_simple_encoder_init(drm, vec->encoder, DRM_MODE_ENCODER_TVDAC);
 	drm_encoder_helper_add(vec->encoder, &vc4_vec_encoder_helper_funcs);
 
 	vec->connector = vc4_vec_connector_init(drm, vec);
-- 
2.36.1

