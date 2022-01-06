Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4110486C41
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 22:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1596510EE97;
	Thu,  6 Jan 2022 21:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A3810EE54
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 21:46:06 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 200so3742027pgg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 13:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pT87OQ3egRwLpYLDnQ//DolOVTqHrwpGRKkmvVo/d+g=;
 b=ZY+Nh2Jaf/gEt7FazNbuSiJJOpmRXaMrnwnXMY++Gzp8bEiutUOA/xuGgWKH0w3FNj
 OvuDFllSXCjoLNf40OxYW+uizrfamdf3bQ+OYVFx0fzfZrEfHW/TAxdJRkypJSwOilex
 jGG6Y4vrFV0UEo7xUu1iVTyCivDxwO9Qeze5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pT87OQ3egRwLpYLDnQ//DolOVTqHrwpGRKkmvVo/d+g=;
 b=N6IDKZexlkRIhocpglHJWuxrsZg225Ib67azwzeEdWO/wwm9jepRDPG56ee6Tp3dAg
 ZtPnelyzik0UUqjy2/v/j4bGoFazPqyfoQhsw7offb5BtXGObBegE/DK0G/oEoVQ9vaI
 ESHvG3FAR1P7ky69+R1koe3mHbzXG8+Bl8e8sUBoScZAc1ao3goMUQkFEYjen6ctTZrZ
 APWBjAOzeTXEVzQJGqLicRmhmGbya22jYysCyHqLgteBkQEXHCo3oC5vo5WslCBVwwHV
 Y9Z7VcU7jFmMiK2v2JP+RyO/quZ7iLe7RLEd0lXhecXHPC8CZIOJ31U1rVprPNb/Kmqj
 jQig==
X-Gm-Message-State: AOAM533dJTHHFtEJWApGtmcEfjdMzq0D057CZQDxE2zJ7P7iqAH5ODlk
 TLbkFtM5BfzpzyRxhE5OETpiOg==
X-Google-Smtp-Source: ABdhPJw5gtA5umryoXrWlTZ0DfdJiTAJSoZT5EbxDy0C+cY+TwaU7Ljz9BCSoRQeGO2Yx2fucyE3cg==
X-Received: by 2002:a05:6a00:2304:b0:4ba:4cbb:8289 with SMTP id
 h4-20020a056a00230400b004ba4cbb8289mr61476292pfh.79.1641505566182; 
 Thu, 06 Jan 2022 13:46:06 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
 by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 13:46:05 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 05/32] drm/of: Add a drm_of_aggregate_probe() API
Date: Thu,  6 Jan 2022 13:45:28 -0800
Message-Id: <20220106214556.2461363-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20220106214556.2461363-1-swboyd@chromium.org>
References: <20220106214556.2461363-1-swboyd@chromium.org>
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
Cc: Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-msm@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to drm_of_component_probe() but using the new API that registers
a driver instead of an ops struct. This allows us to migrate the users
of drm_of_component_probe() to the new way of doing things.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/drm_of.c | 85 +++++++++++++++++++++++++++++++---------
 include/drm/drm_of.h     | 12 ++++++
 2 files changed, 78 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 37c34146eea8..008d6b7d2283 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -99,30 +99,18 @@ void drm_of_component_match_add(struct device *master,
 }
 EXPORT_SYMBOL_GPL(drm_of_component_match_add);
 
-/**
- * drm_of_component_probe - Generic probe function for a component based master
- * @dev: master device containing the OF node
- * @compare_of: compare function used for matching components
- * @m_ops: component master ops to be used
- *
- * Parse the platform device OF node and bind all the components associated
- * with the master. Interface ports are added before the encoders in order to
- * satisfy their .bind requirements
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
- *
- * Returns zero if successful, or one of the standard error codes if it fails.
- */
-int drm_of_component_probe(struct device *dev,
+static int _drm_of_component_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
-			   const struct component_master_ops *m_ops)
+			   struct component_match **matchptr)
 {
 	struct device_node *ep, *port, *remote;
-	struct component_match *match = NULL;
 	int i;
 
 	if (!dev->of_node)
 		return -EINVAL;
 
+	*matchptr = NULL;
+
 	/*
 	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
 	 * called from encoder's .bind callbacks works as expected
@@ -133,7 +121,7 @@ int drm_of_component_probe(struct device *dev,
 			break;
 
 		if (of_device_is_available(port->parent))
-			drm_of_component_match_add(dev, &match, compare_of,
+			drm_of_component_match_add(dev, matchptr, compare_of,
 						   port);
 
 		of_node_put(port);
@@ -144,7 +132,7 @@ int drm_of_component_probe(struct device *dev,
 		return -ENODEV;
 	}
 
-	if (!match) {
+	if (!*matchptr) {
 		dev_err(dev, "no available port\n");
 		return -ENODEV;
 	}
@@ -174,17 +162,76 @@ int drm_of_component_probe(struct device *dev,
 				continue;
 			}
 
-			drm_of_component_match_add(dev, &match, compare_of,
+			drm_of_component_match_add(dev, matchptr, compare_of,
 						   remote);
 			of_node_put(remote);
 		}
 		of_node_put(port);
 	}
 
+	return 0;
+}
+
+/**
+ * drm_of_component_probe - Generic probe function for a component based master
+ * @dev: master device containing the OF node
+ * @compare_of: compare function used for matching components
+ * @m_ops: component master ops to be used
+ *
+ * Parse the platform device OF node and bind all the components associated
+ * with the master. Interface ports are added before the encoders in order to
+ * satisfy their .bind requirements
+ * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * Deprecated: Use drm_of_aggregate_probe() instead.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+int drm_of_component_probe(struct device *dev,
+			   int (*compare_of)(struct device *, void *),
+			   const struct component_master_ops *m_ops)
+{
+
+	struct component_match *match;
+	int ret;
+
+	ret = _drm_of_component_probe(dev, compare_of, &match);
+	if (ret)
+		return ret;
+
 	return component_master_add_with_match(dev, m_ops, match);
 }
 EXPORT_SYMBOL(drm_of_component_probe);
 
+
+/**
+ * drm_of_aggregate_probe - Generic probe function for a component based aggregate host
+ * @dev: device containing the OF node
+ * @compare_of: compare function used for matching components
+ * @adrv: aggregate driver to be used
+ *
+ * Parse the platform device OF node and bind all the components associated
+ * with the aggregate device. Interface ports are added before the encoders in
+ * order to satisfy their .bind_component requirements
+ * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+int drm_of_aggregate_probe(struct device *dev,
+			   int (*compare_of)(struct device *, void *),
+			   struct aggregate_driver *adrv)
+{
+	struct component_match *match;
+	int ret;
+
+	ret = _drm_of_component_probe(dev, compare_of, &match);
+	if (ret)
+		return ret;
+
+	return component_aggregate_register(dev, adrv, match);
+}
+EXPORT_SYMBOL(drm_of_aggregate_probe);
+
 /*
  * drm_of_encoder_active_endpoint - return the active encoder endpoint
  * @node: device tree node containing encoder input ports
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index b9b093add92e..9d35a141f888 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -7,6 +7,7 @@
 #include <drm/drm_bridge.h>
 #endif
 
+struct aggregate_driver;
 struct component_master_ops;
 struct component_match;
 struct device;
@@ -40,6 +41,9 @@ void drm_of_component_match_add(struct device *master,
 int drm_of_component_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
 			   const struct component_master_ops *m_ops);
+int drm_of_aggregate_probe(struct device *dev,
+			   int (*compare_of)(struct device *, void *),
+			   struct aggregate_driver *adrv);
 int drm_of_encoder_active_endpoint(struct device_node *node,
 				   struct drm_encoder *encoder,
 				   struct of_endpoint *endpoint);
@@ -78,6 +82,14 @@ drm_of_component_probe(struct device *dev,
 	return -EINVAL;
 }
 
+static inline int
+drm_of_aggregate_probe(struct device *dev,
+		       int (*compare_of)(struct device *, void *),
+		       struct aggregate_driver *adrv)
+{
+	return -EINVAL;
+}
+
 static inline int drm_of_encoder_active_endpoint(struct device_node *node,
 						 struct drm_encoder *encoder,
 						 struct of_endpoint *endpoint)
-- 
https://chromeos.dev

