Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DA248A1B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 17:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F15A89F75;
	Tue, 18 Aug 2020 15:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F55B89F53
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 15:40:08 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p4so18672189qkf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uKRhQTU/J2vI5UvdMPkx+k4mn6hIbmJ+8/ruJ2N39Ps=;
 b=a6T9qDykn0Y+qIZ3iReFFEa2DupXVbGlUE1u+8Hi/nVPIQIeCjuWlTx7vgQZ5ZK8yP
 E/5GXS0cBTVNdBy7bjZ0ccLWrsZsTyzKO8eUbvazgkBQYcuuEgBF0a9e+GxO6IzTfrSC
 Wx1Sms1Fpb3L9ZwYKmOYgG3hFf9l49x0cT3GLEd4RgG5uBcfKFaEb95DX6QBYRLKf98I
 P0xvhleAvw/Rikghvp0583eXYp9N7RHn2U+bDg6hzK8kTkLujZoO/TqrhUiF32cuB6ye
 nALWv/3UxdGrxet3BOdAVXW9jLJZezIgsULxVNafu9qLeO/LFADimaza1GjLfu2hIshQ
 +fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uKRhQTU/J2vI5UvdMPkx+k4mn6hIbmJ+8/ruJ2N39Ps=;
 b=lYGmOICutjEB2eFB1PelhRIfdrAwSgvZ4M7KpWCeF0kuiMNmnk7h8lLc8zVgKwhN3h
 QdYBvmy6ncOn9/kBHU7oEi7H5urm3BGjg/yGDl3Bv7ix0UunzOF92LjoiGnhzpuqeGVV
 JMy432s1xN9+FWAXEaGie+1Gga5cq/Qj62tZ/OKTO8tikq8RqzOsceHzaRoaoVTEfNhh
 FUKIB6NAq91Y/mBgAA8Ix3xE+seI8qbLRP/I98HlNg6Zx0jCJ4uVST2cFnOttMX60gZL
 +APdvPA8lRlgW+dA8D35QYrHZusGVoWNRO6u1mIajPPefZZU8E8xDmH9UASNmdMAqV3g
 coZA==
X-Gm-Message-State: AOAM532+A+s31O1PRlThAk93q6N0J/P2+5uKD/2kvhVul/e3Zl2n2fcf
 XJakopaU5g93UtcoOdOJrdtIYG/aQIu9nQ==
X-Google-Smtp-Source: ABdhPJxQ6vlZBMTYlaXfH6ab7p26HJOa1b/08e3C8+spfsZycRBE5/zdOO5brmPXrfrx3LMb2/hvpw==
X-Received: by 2002:a05:620a:1257:: with SMTP id
 a23mr17481534qkl.207.1597765207532; 
 Tue, 18 Aug 2020 08:40:07 -0700 (PDT)
Received: from localhost (mobile-166-170-57-144.mycingular.net.
 [166.170.57.144])
 by smtp.gmail.com with ESMTPSA id y3sm24970649qtj.55.2020.08.18.08.40.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 08:40:07 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 juston.li@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com
Subject: [PATCH v8 07/17] drm/i915: Protect workers against disappearing
 connectors
Date: Tue, 18 Aug 2020 11:38:55 -0400
Message-Id: <20200818153910.27894-8-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153910.27894-1-sean@poorly.run>
References: <20200818153910.27894-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 Sean Paul <seanpaul@chromium.org>
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
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-8-sean@poorly.run #v6
Link: https://patchwork.freedesktop.org/patch/msgid/20200623155907.22961-8-sean@poorly.run #v7

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
Changes in v7:
-None
Changes in v8:
-None
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 44 ++++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index ab2e2f9d0020..fe9377a6e4d5 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -887,8 +887,10 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
 		return;
 
 	hdcp->value = value;
-	if (update_property)
+	if (update_property) {
+		drm_connector_get(&connector->base);
 		schedule_work(&hdcp->prop_work);
+	}
 }
 
 /* Implements Part 3 of the HDCP authorization procedure */
@@ -980,6 +982,8 @@ static void intel_hdcp_prop_work(struct work_struct *work)
 
 	mutex_unlock(&hdcp->mutex);
 	drm_modeset_unlock(&dev_priv->drm.mode_config.connection_mutex);
+
+	drm_connector_put(&connector->base);
 }
 
 bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port)
@@ -1859,6 +1863,9 @@ static void intel_hdcp_check_work(struct work_struct *work)
 					       check_work);
 	struct intel_connector *connector = intel_hdcp_to_connector(hdcp);
 
+	if (drm_connector_is_unregistered(&connector->base))
+		return;
+
 	if (!intel_hdcp2_check_link(connector))
 		schedule_delayed_work(&hdcp->check_work,
 				      DRM_HDCP2_CHECK_PERIOD_MS);
@@ -2185,12 +2192,39 @@ void intel_hdcp_component_fini(struct drm_i915_private *dev_priv)
 
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
