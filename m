Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A01717AF81
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 21:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A536EC23;
	Thu,  5 Mar 2020 20:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1023F6EC1D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 20:12:47 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id y62so6852993ywd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 12:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+Fub9X48DBkOVMmN41thr1TsQCekRVfUSS0YxwyrO0=;
 b=VcvLTlpnPx2BnGfSpZFTnEXI3CAHJQ8Veh8tmqC9bdCCFofi9m2D5I7icPvSPQG+Rc
 XPWm2wxoHNQ2RkgB43yucdQ9nSzx/ur9aR7OWG5tvF2lN1LXqeHTHL3Uj1AWEyyb1cfW
 SAqSJUVwq+f7oTDe9HhXuznQ44XJDsm2B3+mXV1lu0gZm0fyhrrGEMevnKoZ9XG5jpHi
 QoTJsC44YXzjVR9nKc9dMTRMe0qgPOd9a6Uf0fcv0sqN0HtxcAfI7rlK/m6iBk2848o+
 sf6BRdICPN9+Te4qkaVdXNFfUERRzgt9eesg7DpqdNHigHS2m+0BOK06f89q9dsSlLF3
 XcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7+Fub9X48DBkOVMmN41thr1TsQCekRVfUSS0YxwyrO0=;
 b=iYQqEaoC4A3Px2VwMQTWGPMbQ8Gzsvjii3qr4Uq6lY/khuLrdohvFeu+E48Bn/2jgD
 uS3IKEutrPwRpwRQeCdoycPzl+ki7DzWrArbqZ+vjDGF6lV1CzkWiWGysg8T3vaBHtCf
 e0BAOekZEsiKC0OVPkXyRMjQfp2JRITKdbExkd6ksz6EhkwzMPT1HeDY3/9PtNwD/Nu/
 Czi7xZ4McuWMDpcW+BIU2JSVbr6h/eE1g9EiWpT48W0TdDPk3du1cJxL6+Z00uR+SIo+
 HtuKJB0zlSdfbV7ixNCx451XXGi7ng98b1gPNMITu1ZiKfiNkthkoG9+89QWkibjLPRw
 zngA==
X-Gm-Message-State: ANhLgQ3xD8qRcELydhRBuG9SriwiMZ1n+XqfG11CBh7TEaEep8N3FpiP
 QJbGieZIeqCrH6sgCA3W98r8EHeeftk=
X-Google-Smtp-Source: ADFU+vv66J58/BA1m4gryIv+mtxDEDrv40Bc1JwWE9UirCz9y4rjYg2GxLwU/+cJIMZ1DfKoTtHDsQ==
X-Received: by 2002:a0d:cb95:: with SMTP id n143mr121127ywd.386.1583439165981; 
 Thu, 05 Mar 2020 12:12:45 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id g65sm12300449ywd.109.2020.03.05.12.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:12:45 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 07/16] drm/i915: Protect workers against disappearing
 connectors
Date: Thu,  5 Mar 2020 15:12:27 -0500
Message-Id: <20200305201236.152307-8-sean@poorly.run>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200305201236.152307-1-sean@poorly.run>
References: <20200305201236.152307-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
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

Changes in v2:
-Added to the set
Changes in v3:
-Change the WARN_ON condition in intel_hdcp_cleanup to allow for
 initializing connectors as well
Changes in v4:
-None
Changes in v5:
-Change WARN_ON to drm_WARN_ON
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 44 ++++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index dfa792ee90ecd..9523ab6c65e0d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -891,8 +891,10 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
 		return;
 
 	hdcp->value = value;
-	if (update_property)
+	if (update_property) {
+		drm_connector_get(&connector->base);
 		schedule_work(&hdcp->prop_work);
+	}
 }
 
 /* Implements Part 3 of the HDCP authorization procedure */
@@ -984,6 +986,8 @@ static void intel_hdcp_prop_work(struct work_struct *work)
 
 	mutex_unlock(&hdcp->mutex);
 	drm_modeset_unlock(&dev_priv->drm.mode_config.connection_mutex);
+
+	drm_connector_put(&connector->base);
 }
 
 bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port)
@@ -1862,6 +1866,9 @@ static void intel_hdcp_check_work(struct work_struct *work)
 					       check_work);
 	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
 
+	if (drm_connector_is_unregistered(&connector->base))
+		return;
+
 	if (!intel_hdcp2_check_link(connector))
 		schedule_delayed_work(&hdcp->check_work,
 				      DRM_HDCP2_CHECK_PERIOD_MS);
@@ -2178,12 +2185,39 @@ void intel_hdcp_component_fini(struct drm_i915_private *dev_priv)
 
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
