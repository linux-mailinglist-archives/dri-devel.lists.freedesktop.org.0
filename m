Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C4843A8F9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 02:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081B26E415;
	Tue, 26 Oct 2021 00:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5526E203
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 00:01:15 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so704020pji.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 17:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yjH6JfZy633Mdr6nuYTumgUfiknsiduwzml/anz47ME=;
 b=GS7o1pHAw3tTsWH7XdqZKIN7bPOPZszkuj6EpYu8zwcOKoGqYqlV9JovaA1E4nJE3j
 vIbk8YSciBMFPuTDVsOdwKcEqX5M75LpFNJWu+hSDoHPUc/RKACkpvNf5H6XzDoYU3ZB
 MEgTebOBNPg2Pq0O36DpeosHugWzwzWZvKzS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yjH6JfZy633Mdr6nuYTumgUfiknsiduwzml/anz47ME=;
 b=a61FqnSkMkut8npxJxtUAVeVddHxNcyL2sqgVCne+QnStf1q40wwIP/cllW/NlRl77
 gtp5YSgb/K3HsjPf9IQHOJofUWcxAGsInpVag3zWYskK4bGUZ33nwQSw/J3gq2QuW3LA
 5fANKQK32lLZDNAINaVlbDhdJmnBRjaY+KrmrGUj1yVE3H/rOe1bYrt/02lBE2nNs2u3
 qYDrVHXiCjvolY9Q/Mb03upaAiQFLRXRSOYwQtqe+nxbniEx8tIjYyogcz/g0jGdF3CW
 BdGtICbcM+OF/W67uSjt8JhmWmNLsjpgN4Uci/H2ZoQ9DQxE/QVh2tZghrZKzoQigO6j
 hQyw==
X-Gm-Message-State: AOAM531IzCiBnp1Kqx73HqRKmy7HRSYLzesvfD1HaoeYcfdlemEEnyjG
 WJpm8p0Q/2gobX82mMimAszMWQ==
X-Google-Smtp-Source: ABdhPJxqYbeQUqqTBAzMFcnsZfHJVsAf9NX9bB2x8AMm19LNpq0/ho/ozMVRh4r/A3bcIfhe7Rvanw==
X-Received: by 2002:a17:902:c214:b0:13f:1b2a:8011 with SMTP id
 20-20020a170902c21400b0013f1b2a8011mr19334289pll.3.1635206475063; 
 Mon, 25 Oct 2021 17:01:15 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
 by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:01:14 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 33/34] component: Get rid of drm_of_component_probe()
Date: Mon, 25 Oct 2021 17:00:43 -0700
Message-Id: <20211026000044.885195-34-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There aren't any users anymore so drop it.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/drm_of.c | 85 +++++++++-------------------------------
 include/drm/drm_of.h     | 12 ------
 2 files changed, 19 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index dc4b507c809d..5131e3dbe3a7 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -99,18 +99,30 @@ void drm_of_component_match_add(struct device *master,
 }
 EXPORT_SYMBOL_GPL(drm_of_component_match_add);
 
-static int _drm_of_component_probe(struct device *dev,
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
 			   int (*compare_of)(struct device *, void *),
-			   struct component_match **matchptr)
+			   struct aggregate_driver *adrv)
 {
 	struct device_node *ep, *port, *remote;
+	struct component_match *match = NULL;
 	int i;
 
 	if (!dev->of_node)
 		return -EINVAL;
 
-	*matchptr = NULL;
-
 	/*
 	 * Bind the crtc's ports first, so that drm_of_find_possible_crtcs()
 	 * called from encoder's .bind callbacks works as expected
@@ -121,7 +133,7 @@ static int _drm_of_component_probe(struct device *dev,
 			break;
 
 		if (of_device_is_available(port->parent))
-			drm_of_component_match_add(dev, matchptr, compare_of,
+			drm_of_component_match_add(dev, &match, compare_of,
 						   port);
 
 		of_node_put(port);
@@ -132,7 +144,7 @@ static int _drm_of_component_probe(struct device *dev,
 		return -ENODEV;
 	}
 
-	if (!*matchptr) {
+	if (!match) {
 		dev_err(dev, "no available port\n");
 		return -ENODEV;
 	}
@@ -162,72 +174,13 @@ static int _drm_of_component_probe(struct device *dev,
 				continue;
 			}
 
-			drm_of_component_match_add(dev, matchptr, compare_of,
+			drm_of_component_match_add(dev, &match, compare_of,
 						   remote);
 			of_node_put(remote);
 		}
 		of_node_put(port);
 	}
 
-	return 0;
-}
-
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
- * Deprecated: Use drm_of_aggregate_probe() instead.
- *
- * Returns zero if successful, or one of the standard error codes if it fails.
- */
-int drm_of_component_probe(struct device *dev,
-			   int (*compare_of)(struct device *, void *),
-			   const struct component_master_ops *m_ops)
-{
-
-	struct component_match *match;
-	int ret;
-
-	ret = _drm_of_component_probe(dev, compare_of, &match);
-	if (ret)
-		return ret;
-
-	return component_master_add_with_match(dev, m_ops, match);
-}
-EXPORT_SYMBOL(drm_of_component_probe);
-
-
-/**
- * drm_of_aggregate_probe - Generic probe function for a component based aggregate host
- * @dev: device containing the OF node
- * @compare_of: compare function used for matching components
- * @adrv: aggregate driver to be used
- *
- * Parse the platform device OF node and bind all the components associated
- * with the aggregate device. Interface ports are added before the encoders in
- * order to satisfy their .bind_component requirements
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
- *
- * Returns zero if successful, or one of the standard error codes if it fails.
- */
-int drm_of_aggregate_probe(struct device *dev,
-			   int (*compare_of)(struct device *, void *),
-			   struct aggregate_driver *adrv)
-{
-	struct component_match *match;
-	int ret;
-
-	ret = _drm_of_component_probe(dev, compare_of, &match);
-	if (ret)
-		return ret;
-
 	return component_aggregate_register(dev, adrv, match);
 }
 EXPORT_SYMBOL(drm_of_aggregate_probe);
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 9d35a141f888..33fba4f8e304 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -8,7 +8,6 @@
 #endif
 
 struct aggregate_driver;
-struct component_master_ops;
 struct component_match;
 struct device;
 struct drm_device;
@@ -38,9 +37,6 @@ void drm_of_component_match_add(struct device *master,
 				struct component_match **matchptr,
 				int (*compare)(struct device *, void *),
 				struct device_node *node);
-int drm_of_component_probe(struct device *dev,
-			   int (*compare_of)(struct device *, void *),
-			   const struct component_master_ops *m_ops);
 int drm_of_aggregate_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
 			   struct aggregate_driver *adrv);
@@ -74,14 +70,6 @@ drm_of_component_match_add(struct device *master,
 {
 }
 
-static inline int
-drm_of_component_probe(struct device *dev,
-		       int (*compare_of)(struct device *, void *),
-		       const struct component_master_ops *m_ops)
-{
-	return -EINVAL;
-}
-
 static inline int
 drm_of_aggregate_probe(struct device *dev,
 		       int (*compare_of)(struct device *, void *),
-- 
https://chromeos.dev

