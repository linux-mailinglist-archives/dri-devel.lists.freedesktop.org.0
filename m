Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A519060AF44
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF26210E8A0;
	Mon, 24 Oct 2022 15:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C65110E22A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:31 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s24so2786625ljs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCo7VVHuBZW+OG9SunJbQgq/wFHseiwuFZsFQO3WoK8=;
 b=jbTsuMpSTlZUL62/fo5JZqCwVPNkW3xLmgH/tZ/cNPg5xLCNHLHOpAw9HGT6ESP6s6
 b32vL0kKy1JoM4iPMcFn/MQT29nVDRBq787s6fVwBrKnou05GgLonXZ5lC0SUuDBZdSQ
 VtzoyZx9o5DpyTBUXP7B7OrwnDILVCBlzDoINX3HQ1MMTVVz5yGU4ZkNBode12YN68KL
 aKSTKB0Dj5rFzdXFUuHxAoy1s+T2YZqcgPVW3R9KiBoP32fV5mMGGHUr1BmTFw6J7/z/
 yUgCDhPequlUBxPuedgc7fLYz9ZnKhmjc0dyCPUtPdZFTjNjXsj5YgvSLw2k9sXlI2Yz
 w3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VCo7VVHuBZW+OG9SunJbQgq/wFHseiwuFZsFQO3WoK8=;
 b=enc8Ft0Q3VR2vjINVnE+H6Z2SfZ7spzuysH25FredutOwm36m8kIjPSp11/bhkOSdH
 k6NjMdQiu3oXPRodhJCPUsJYxW4tb3xW+fBwqterW7NIDD1PcZey+t3rOPk7qDPSZ4VH
 PKipRnnIOBlGduWc/pNCVS7uWLJlrVWLC9ObxFNYL3tsDleaB351ShgSZLUQ+Js+JgqT
 tKd/4i/Eb43zW+Au12hxN3dSwYLG9aUbSXPDW/MJ1uE7RqLu6xlcP4ywOVYQms4i2KHJ
 63qYqWA6H9P4IZKtj+dHRRlgKV6VmxLuKz1fpZgJtN5AjDgmi8jeMWVg4giY1h98OcQ6
 oZGQ==
X-Gm-Message-State: ACrzQf20FWUYp0GFqQs+okRPRkNVLQ/PdgX4tiQPZbb1M8BEKrgEaPOT
 5CzTKoQUvGxpkAJwJODgPWUadg==
X-Google-Smtp-Source: AMsMyM5Z9UayHdOtWdD5WFtJKLY7zt7l5GAE6lRLszfxe+uzm9UMm/n1wBg1DFfcJEV5C7u0Arnj/g==
X-Received: by 2002:a2e:a1c9:0:b0:277:101f:e3b2 with SMTP id
 c9-20020a2ea1c9000000b00277101fe3b2mr1018524ljm.129.1666625969488; 
 Mon, 24 Oct 2022 08:39:29 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v2 2/7] drm/probe-helper: enable and disable HPD on connectors
Date: Mon, 24 Oct 2022 18:39:21 +0300
Message-Id: <20221024153926.3222225-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Intruct two drm_connector_helper_funcs: enable_hpd() and disable_hpd().
They are called by drm_kms_helper_poll_enable() and
drm_kms_helper_poll_disable() (and thus drm_kms_helper_poll_init() and
drm_kms_helper_poll_fini()) respectively.

This allows drivers to rely on drm_kms_helper_poll for enabling and
disabling HPD detection rather than doing that manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_probe_helper.c       | 19 +++++++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 22 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index f97fda3b1d34..a7b4590d8ec1 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -251,6 +251,12 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter) {
+		const struct drm_connector_helper_funcs *funcs =
+			connector->helper_private;
+
+		if (funcs && funcs->enable_hpd)
+			funcs->enable_hpd(connector);
+
 		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
 					 DRM_CONNECTOR_POLL_DISCONNECT))
 			poll = true;
@@ -805,12 +811,25 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
 
 static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
 {
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+
 	if (!dev->mode_config.poll_enabled)
 		return;
 
 	if (fini)
 		dev->mode_config.poll_enabled = false;
 
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		const struct drm_connector_helper_funcs *funcs =
+			connector->helper_private;
+
+		if (funcs && funcs->disable_hpd)
+			funcs->disable_hpd(connector);
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
 	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
 }
 
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index fafa70ac1337..7aa1f01223f9 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -1143,6 +1143,28 @@ struct drm_connector_helper_funcs {
 	 */
 	void (*cleanup_writeback_job)(struct drm_writeback_connector *connector,
 				      struct drm_writeback_job *job);
+
+	/**
+	 * @enable_hpd:
+	 *
+	 * Enable hot-plug detection for the connector.
+	 *
+	 * This operation is optional.
+	 *
+	 * This callback is used by the drm_kms_helper_poll_enable() helpers.
+	 */
+	void (*enable_hpd)(struct drm_connector *connector);
+
+	/**
+	 * @disable_hpd:
+	 *
+	 * Disable hot-plug detection for the connector.
+	 *
+	 * This operation is optional.
+	 *
+	 * This callback is used by the drm_kms_helper_poll_disable() helpers.
+	 */
+	void (*disable_hpd)(struct drm_connector *connector);
 };
 
 /**
-- 
2.35.1

