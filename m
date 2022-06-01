Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2099539BBF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 05:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CF6112B1E;
	Wed,  1 Jun 2022 03:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178DC112B1C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 03:40:09 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id x12so687673pgj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5mfO6LDCxvPgKYka8jk5OyHXRXc0q1t4jWcU47/N1fE=;
 b=ZmjqddQ3/TmHRhoFCiYRGDBVmexjqsYn/xpzktYFjtQbhCliZhc2Fo2Kem/7VqXdet
 wx8ZN9pcaCrJxBj1ICSqf3hm2Cha9vh+PIIqXQW2OT6+hpSYeQMEyBbj1abdvp7DP1Uv
 yKuIprZ6YV1f1nI+39tAs0URrBpNXauRUL+iDRG5idR/R0qx2BuRQqWl9VlJdp8Owv6r
 zgesTyoa4BjdC03XSI8eIyz5MVoJQzWPoQjc/So+mLQYHV2OzND0AYd+7x1YGPB3GwBD
 bT2QosR2IrQjlurZrVmpVWpicmDeb8q3UuSrAbzp2KdHFcTwPPrpbYwZL8FiYG25fu3n
 +53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5mfO6LDCxvPgKYka8jk5OyHXRXc0q1t4jWcU47/N1fE=;
 b=yxGj8KTM2qpAUOpsjkg2Xa4gKES7nZN9T6I2KYCZTs8AL4NyHwE2KChY73Z379WVfH
 Lf8XLtTreFganCnXix4sxgEANXyjaF9PpEoLFIG1JP8y4ErvFJ4sa15t7MGYw2oTsXBF
 CLdWMFIIgdcyG8B1NEcSnJbr440o9J4RGt6HCV+vKqLp0NbJDf2uKYOStedAe/VJ2nia
 pYQoekoXOAUbBKAXN5ICBc2wK4IFkMxkzUjexCR3dn9jaydD6FTIJY/0zsk1EzxUGTwe
 bVjgBZfN0F8AjXDqbf+4HA4VUemvYm6CmYMKSRPtU/YZw2B13HZw/C6SoGS9JXHCxlIL
 u+Sw==
X-Gm-Message-State: AOAM5314VMdAq5TZtOFwyLhB1KO7jinac/o+nvT8dPI3/yS/UBV0XV2D
 vJIYeBy6qckBiQDujd88DHU=
X-Google-Smtp-Source: ABdhPJycr/phEanwFwmpfw4hc6pHiRMgRyg56Yj4FnBPh+sXAB7aZxKJJxZAr5MysBkhTPDTMd6V+w==
X-Received: by 2002:a63:6901:0:b0:3f9:caa5:cffc with SMTP id
 e1-20020a636901000000b003f9caa5cffcmr47846682pgc.324.1654054808681; 
 Tue, 31 May 2022 20:40:08 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 dw15-20020a17090b094f00b001e0b971196csm2732415pjb.57.2022.05.31.20.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 20:40:08 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/meson: encoder_hdmi: Fix refcount leak in
 meson_encoder_hdmi_init
Date: Wed,  1 Jun 2022 07:39:27 +0400
Message-Id: <20220601033927.47814-3-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601033927.47814-1-linmq006@gmail.com>
References: <20220601033927.47814-1-linmq006@gmail.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_graph_get_remote_node() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: e67f6037ae1b ("drm/meson: split out encoder from meson_dw_hdmi")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- call of_node_put() after of_find_device_by_node() and error paths
before of_find_device_by_node();
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5e306de6f485..0d532e8e8cca 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -365,7 +365,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
 	if (!meson_encoder_hdmi->next_bridge) {
 		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
-		return -EPROBE_DEFER;
+		ret = -EPROBE_DEFER;
+		goto err_put_node;
 	}
 
 	/* HDMI Encoder Bridge */
@@ -383,7 +384,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
 		dev_err(priv->dev, "Failed to init HDMI encoder: %d\n", ret);
-		return ret;
+		goto err_put_node;
 	}
 
 	meson_encoder_hdmi->encoder.possible_crtcs = BIT(0);
@@ -393,7 +394,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
-		return ret;
+		goto err_put_node;
 	}
 
 	/* Initialize & attach Bridge Connector */
@@ -401,7 +402,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 							&meson_encoder_hdmi->encoder);
 	if (IS_ERR(meson_encoder_hdmi->connector)) {
 		dev_err(priv->dev, "Unable to create HDMI bridge connector\n");
-		return PTR_ERR(meson_encoder_hdmi->connector);
+		ret = PTR_ERR(meson_encoder_hdmi->connector);
+		goto err_put_node;
 	}
 	drm_connector_attach_encoder(meson_encoder_hdmi->connector,
 				     &meson_encoder_hdmi->encoder);
@@ -428,6 +430,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	meson_encoder_hdmi->connector->ycbcr_420_allowed = true;
 
 	pdev = of_find_device_by_node(remote);
+	of_node_put(remote);
 	if (pdev) {
 		struct cec_connector_info conn_info;
 		struct cec_notifier *notifier;
@@ -444,4 +447,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	dev_dbg(priv->dev, "HDMI encoder initialized\n");
 
 	return 0;
+
+err_put_node:
+	of_node_put(remote);
+	return ret;
 }
-- 
2.25.1

