Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3564C1BE7DA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 21:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4C76F3AD;
	Wed, 29 Apr 2020 19:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069B96F3A5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 19:55:17 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id v18so1804978qvx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8DL1V+c1zNd71OczQbjHH+HTNp0MlbJDTYCWV8gx6f8=;
 b=W6delN3xz7wckKexhqtNAVDc9m/F7L0JkDPad39D4IMH77u0GeMtevt8hSPedF7k8C
 ICDl5wZ4jjRQdanXv9ewVNcP4h2j+zgjGDev15dwPJifZkL+AdPQYOeCl/Km41SULNQH
 +A8tJWi+os8IcvAHRg4E0oKLDLTVtlvw/7ydJ5RDMQZ/3t4Wk1Ssf+9U6gD4d2vltZ2d
 zG8AkhZWA5SBpImQtdr4ZLsX5k03Q+CYyAfphUPyOJJdzVUNrjyJ3U1eL8bUp+oui8qM
 N4ij37QL/Z8KRu5/njfQ8pxBxWU8hhUPqxYuCUHTxJ35XzN5GOXezZwIOsNKKpvSXmRu
 OKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8DL1V+c1zNd71OczQbjHH+HTNp0MlbJDTYCWV8gx6f8=;
 b=PTsjk3SQs8edBlo4ssitsr6AnMreulA69flWdZ6sHZSiQKIKhApDh1eu5dWnjiRJ5u
 rUYpyJ/KpBgo0/jJUth7M7M3NukZtxMh2mpSslGxeSCrW59OkBa8mWLFtrbO7sR+aTMD
 umdeyMLLGjcjlNSawoGAhpt7UL4GuU7dFZhsfn3e8+9K+QtfXKcAXaEhyWfdfOzojS+u
 gZeV0sdVnVYz1xAmk2RI0adfy54DjNuaV2840nj/o5PA4sjvtIJ61aiGW/iDHF/NY/Ky
 SEJ6uQDa96ZL7+xY5dy96AOc5qkWg/oPSIZZJs3emVUqjW/9bCcHMoTdvAxZJsaIhgmP
 m7Vg==
X-Gm-Message-State: AGi0PuYCgBS4jqe4dgc2pwapGP9VIlxoZJQtG5G6CXnwsVohefYBVQQO
 8GLeQ3ks72qidE5yp8mPtiL8paHM4jw=
X-Google-Smtp-Source: APiQypLsW4ax7FZNokdUa7CyV4Lcz2hj1xR+aag/ZQ9gn9xN2aqblwL5Z8gdGE2sbG6tA3yBbqe55w==
X-Received: by 2002:a0c:9e6d:: with SMTP id z45mr34994852qve.206.1588190116910; 
 Wed, 29 Apr 2020 12:55:16 -0700 (PDT)
Received: from localhost (mobile-166-170-55-34.mycingular.net. [166.170.55.34])
 by smtp.gmail.com with ESMTPSA id 10sm242204qtp.4.2020.04.29.12.55.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 12:55:16 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 07/16] drm/i915: Protect workers against disappearing
 connectors
Date: Wed, 29 Apr 2020 15:54:53 -0400
Message-Id: <20200429195502.39919-8-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429195502.39919-1-sean@poorly.run>
References: <20200429195502.39919-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org, juston.li@intel.com,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds some protection against connectors being destroyed
before the HDCP workers are finished.

For check_work, we do a synchronous cancel after the connector is
unregistered which will ensure that it is finished before destruction.

In the case of prop_work, we can't do a synchronous wait since it needs
to take connection_mutex which could cause deadlock. Instead, we'll take
a reference on the connector when scheduling prop_work and give it up
once we're done.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-8-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-8-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-8-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-8-sean@poorly.run #v5

Changes in v2:
-Added to the set
Changes in v3:
-Change the WARN_ON condition in intel_hdcp_cleanup to allow for
 initializing connectors as well
Changes in v4:
-None
Changes in v5:
-Change WARN_ON to drm_WARN_ON
Changes in v6:
-None
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 44 ++++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index ec02eaa43d39..a4446d47ef27 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -888,8 +888,10 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
 		return;
 
 	hdcp->value = value;
-	if (update_property)
+	if (update_property) {
+		drm_connector_get(&connector->base);
 		schedule_work(&hdcp->prop_work);
+	}
 }
 
 /* Implements Part 3 of the HDCP authorization procedure */
@@ -981,6 +983,8 @@ static void intel_hdcp_prop_work(struct work_struct *work)
 
 	mutex_unlock(&hdcp->mutex);
 	drm_modeset_unlock(&dev_priv->drm.mode_config.connection_mutex);
+
+	drm_connector_put(&connector->base);
 }
 
 bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port)
@@ -1860,6 +1864,9 @@ static void intel_hdcp_check_work(struct work_struct *work)
 					       check_work);
 	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
 
+	if (drm_connector_is_unregistered(&connector->base))
+		return;
+
 	if (!intel_hdcp2_check_link(connector))
 		schedule_delayed_work(&hdcp->check_work,
 				      DRM_HDCP2_CHECK_PERIOD_MS);
@@ -2175,12 +2182,39 @@ void intel_hdcp_component_fini(struct drm_i915_private *dev_priv)
 
 void intel_hdcp_cleanup(struct intel_connector *connector)
 {
-	if (!connector->hdcp.shim)
+	struct intel_hdcp *hdcp = &connector->hdcp;
+
+	if (!hdcp->shim)
 		return;
 
-	mutex_lock(&connector->hdcp.mutex);
-	kfree(connector->hdcp.port_data.streams);
-	mutex_unlock(&connector->hdcp.mutex);
+	/*
+	 * If the connector is registered, it's possible userspace could kick
+	 * off another HDCP enable, which would re-spawn the workers.
+	 */
+	drm_WARN_ON(connector->base.dev,
+		connector->base.registration_state == DRM_CONNECTOR_REGISTERED);
+
+	/*
+	 * Now that the connector is not registered, check_work won't be run,
+	 * but cancel any outstanding instances of it
+	 */
+	cancel_delayed_work_sync(&hdcp->check_work);
+
+	/*
+	 * We don't cancel prop_work in the same way as check_work since it
+	 * requires connection_mutex which could be held while calling this
+	 * function. Instead, we rely on the connector references grabbed before
+	 * scheduling prop_work to ensure the connector is alive when prop_work
+	 * is run. So if we're in the destroy path (which is where this
+	 * function should be called), we're "guaranteed" that prop_work is not
+	 * active (tl;dr This Should Never Happen).
+	 */
+	drm_WARN_ON(connector->base.dev, work_pending(&hdcp->prop_work));
+
+	mutex_lock(&hdcp->mutex);
+	kfree(hdcp->port_data.streams);
+	hdcp->shim = NULL;
+	mutex_unlock(&hdcp->mutex);
 }
 
 void intel_hdcp_atomic_check(struct drm_connector *connector,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
