Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF967959C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A47C10E662;
	Tue, 24 Jan 2023 10:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EFE10E662
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:45:52 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id mg12so37843037ejc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 02:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NiVilnOKfawFy9+Tt2NJvr5xi1QzNJjMypLOR886gcU=;
 b=cS/cDhTo7A1H9I0uEO1a+cz0u3VoBWEaB0WLStolFwfKBeuSqspHr8tt30UPK6zk0E
 q6Mo2gu8ZbMqx/JuN4MnjzXJFgsO32TMk2LME6gAXEjByVrhMfdL33h8bO8eAF1Yck98
 RIeo0/xt1zjHv1feoqhrqnq6zfr3jxpQUFj5oSlKP82A87edYojG9OhjuVMN4qO40yss
 0HgDM0qJVWTffSZ2opcG5UmKW32bUh2ixarN3KTSFBc7ZL+QlxQ6PzDPOVF/1QZ+LQhZ
 ikUNYHMk8uQ1CR5Y742RNuU5MvWH+GBRUWbv2CdFrNk7bXH3HhahzVJI4wYxwqPD/M2Y
 S+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NiVilnOKfawFy9+Tt2NJvr5xi1QzNJjMypLOR886gcU=;
 b=qzopTuOkoUHkguJct6yIWlTzGakk4WaDTPQcJ0VeEGT/uvEPRVJlabMYQ4UZM8GU/2
 u6/52VEUxeQeoaFEogWJkEVtKHOtg5UO88VPtd3VcY/MSt4ASEs6feu8wrs/xB8Fmh2a
 pOwSG2bUVA/lqrKY6K7j2SoEmNV0ujUtyqUNZBRQIDqrZZ/SIvHNytMolPRi0jbkZqtI
 yJmdOZQUEYX1de+ThuSApyu8S+7sQ1Ik6JcXZjqWyLj8otfQEngMqIQJHCjiSSis+A8b
 ViBufpfMUoqHsxR9Pb3byzI8k9V3eXm9XpKBZT7rdRqLjVpr5bDgX5jSWu0ExtkVOZHk
 FmMw==
X-Gm-Message-State: AFqh2kp6Yjdwk7x4yD6YUceLNLVYgOJiNRBQDw8wgr+6eWjGH6G81OfI
 IerHzgbYZopQTxHDCN+5A4+Ytg==
X-Google-Smtp-Source: AMrXdXvGx2RZYV/UTCXTkDm1ad+A2v4LbaZlbIASmHi9zi28XWu18nml0fCTBOK+q/NmPjH7JnuRqg==
X-Received: by 2002:a17:907:9a8c:b0:872:4fc7:fc05 with SMTP id
 km12-20020a1709079a8c00b008724fc7fc05mr32276591ejc.62.1674557151330; 
 Tue, 24 Jan 2023 02:45:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 xa4-20020a170907b9c400b008762e2b7004sm693275ejc.208.2023.01.24.02.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 02:45:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 1/2] drm/probe_helper: extract two helper functions
Date: Tue, 24 Jan 2023 12:45:47 +0200
Message-Id: <20230124104548.3234554-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, intel-gfx@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, freedreno@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extract drm_kms_helper_enable_hpd() and drm_kms_helper_disable_hpd(),
two helpers that enable and disable HPD handling on all device's
connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_probe_helper.c | 68 ++++++++++++++++++------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 95aeeed33cf5..ab787d71fa66 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -222,6 +222,45 @@ drm_connector_mode_valid(struct drm_connector *connector,
 	return ret;
 }
 
+static void drm_kms_helper_disable_hpd(struct drm_device *dev)
+{
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		const struct drm_connector_helper_funcs *funcs =
+			connector->helper_private;
+
+		if (funcs && funcs->disable_hpd)
+			funcs->disable_hpd(connector);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+}
+
+static bool drm_kms_helper_enable_hpd(struct drm_device *dev)
+{
+	bool poll = false;
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		const struct drm_connector_helper_funcs *funcs =
+			connector->helper_private;
+
+		if (funcs && funcs->enable_hpd)
+			funcs->enable_hpd(connector);
+
+		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
+					 DRM_CONNECTOR_POLL_DISCONNECT))
+			poll = true;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return poll;
+}
+
 #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
 /**
  * drm_kms_helper_poll_enable - re-enable output polling.
@@ -241,26 +280,12 @@ drm_connector_mode_valid(struct drm_connector *connector,
 void drm_kms_helper_poll_enable(struct drm_device *dev)
 {
 	bool poll = false;
-	struct drm_connector *connector;
-	struct drm_connector_list_iter conn_iter;
 	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
 
 	if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
 		return;
 
-	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-		const struct drm_connector_helper_funcs *funcs =
-			connector->helper_private;
-
-		if (funcs && funcs->enable_hpd)
-			funcs->enable_hpd(connector);
-
-		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
-					 DRM_CONNECTOR_POLL_DISCONNECT))
-			poll = true;
-	}
-	drm_connector_list_iter_end(&conn_iter);
+	poll = drm_kms_helper_enable_hpd(dev);
 
 	if (dev->mode_config.delayed_event) {
 		/*
@@ -810,24 +835,13 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
 
 static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
 {
-	struct drm_connector *connector;
-	struct drm_connector_list_iter conn_iter;
-
 	if (!dev->mode_config.poll_enabled)
 		return;
 
 	if (fini)
 		dev->mode_config.poll_enabled = false;
 
-	drm_connector_list_iter_begin(dev, &conn_iter);
-	drm_for_each_connector_iter(connector, &conn_iter) {
-		const struct drm_connector_helper_funcs *funcs =
-			connector->helper_private;
-
-		if (funcs && funcs->disable_hpd)
-			funcs->disable_hpd(connector);
-	}
-	drm_connector_list_iter_end(&conn_iter);
+	drm_kms_helper_disable_hpd(dev);
 
 	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
 }
-- 
2.39.0

