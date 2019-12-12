Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B86111D6B1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 20:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 654C16E147;
	Thu, 12 Dec 2019 19:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B436E145
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 19:02:44 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id d34so877906yba.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 11:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZvNOwIquqfbZ0FAAW1cz7dSaGmgCWbz+A+JZNBEPfFw=;
 b=dEA4zMNnIdCOQm/3smOJFgbJYds9Pme/1ju+ffKdcuzVwbH5iyXXsGdASFzhpFobN6
 0PKA3OGm4qQvRfx37HFZDv8IFNpFBpAp1EZv4A2BFelv/F2Q2V28ce40GN5k0U5vPh+q
 y+6WZE/iMpd6dCrByXCwHSjNJTSlpmPKdp/HMG5XL58plpzZ+wxptglap5q7i1rch3eX
 o6uABe9MGTLjdVyGNIOhH8hwPj1f0kvPCll2zf6lbZwWBAjaUYPMbTs78pCK3XWNeVmc
 70ppLsIGrRyclT+j9b8oerRxTG1sX9JHYrFHM9ZwR3MdK1G2NyhZp+tzEnDp39CEjW8F
 /9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZvNOwIquqfbZ0FAAW1cz7dSaGmgCWbz+A+JZNBEPfFw=;
 b=BZTLk0UuJUodtHm+DPTRjC0REO7baHqjVu8OUhoZ2eDn/aMEklZ2dLiu47OALIqqvt
 X1LgltbIy1i5mnEOm9FEHHpaxAWKAH9Vsq1+kWJN8hoCLyRMLpBl9PnSg//2hmEyyO1A
 K9S2A40lCOBfab7azAS+7Pr0kqxj1kczf/JTdmf+NdodQPKPKPrIrIkyGeAGOZ/A/E6t
 6VyiveANGwVNL7RSDZJG4QLoYu/1n0NOl2RVKCtKDIaY1oWKKwg+zyyhUwkAjEy/HBKa
 K4+YKeC41betttRa10nW0xaHbiu+tX5FfTeDbCFsrTKs608+Msez/yMyxTln3joyW4aa
 v4Gg==
X-Gm-Message-State: APjAAAWfqwZsCc06gWSc8HN8YVyOg0q4oSuIQzBtHexnUFMeedVjcgPT
 f+j4BjEaabxXlvjiCoGvj1oDGvrHeJ4urw==
X-Google-Smtp-Source: APXvYqzkDw2iZkzhPBPwvabFRqvsTLh92aBkO6Oc/SrmkPPiWIfhCvtzXoP4yEuMfsW9OJOCAt6eXQ==
X-Received: by 2002:a25:cf55:: with SMTP id f82mr5744881ybg.253.1576177363389; 
 Thu, 12 Dec 2019 11:02:43 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id b135sm2734323ywb.50.2019.12.12.11.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 11:02:42 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/12] drm/i915: Protect workers against disappearing
 connectors
Date: Thu, 12 Dec 2019 14:02:25 -0500
Message-Id: <20191212190230.188505-8-sean@poorly.run>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20191212190230.188505-1-sean@poorly.run>
References: <20191212190230.188505-1-sean@poorly.run>
MIME-Version: 1.0
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
Cc: daniel.vetter@ffwll.ch, rodrigo.vivi@intel.com,
 Sean Paul <seanpaul@chromium.org>
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

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v2:
- Added to the set
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 38 ++++++++++++++++++++---
 1 file changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 798e7e1a19fc..c79dca2c74d1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -863,8 +863,10 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
 		return;
 
 	hdcp->value = value;
-	if (update_property)
+	if (update_property) {
+		drm_connector_get(&connector->base);
 		schedule_work(&hdcp->prop_work);
+	}
 }
 
 /* Implements Part 3 of the HDCP authorization procedure */
@@ -954,6 +956,8 @@ static void intel_hdcp_prop_work(struct work_struct *work)
 
 	mutex_unlock(&hdcp->mutex);
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
+
+	drm_connector_put(&connector->base);
 }
 
 bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port)
@@ -1802,6 +1806,9 @@ static void intel_hdcp_check_work(struct work_struct *work)
 					       check_work);
 	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
 
+	if (drm_connector_is_unregistered(&connector->base))
+		return;
+
 	if (!intel_hdcp2_check_link(connector))
 		schedule_delayed_work(&hdcp->check_work,
 				      DRM_HDCP2_CHECK_PERIOD_MS);
@@ -2076,12 +2083,33 @@ void intel_hdcp_component_fini(struct drm_i915_private *dev_priv)
 
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
+	WARN_ON(!drm_connector_is_unregistered(&connector->base));
+
+	/*
+	 * Now that the connector is unregistered, check_work won't be run, but
+	 * cancel any outstanding instances of it
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
+	WARN_ON(work_pending(&hdcp->prop_work));
+
+	mutex_lock(&hdcp->mutex);
+	kfree(hdcp->port_data.streams);
+	mutex_unlock(&hdcp->mutex);
 }
 
 void intel_hdcp_atomic_check(struct drm_connector *connector,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
