Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB3787422
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1163510E59B;
	Thu, 24 Aug 2023 15:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC8010E58F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:26:57 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3a88ef9444bso560542b6e.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692890816; x=1693495616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7q+LPo8wQuO9waVaIWLhDfmh6Cdz2EIXcP8cExW2KaQ=;
 b=m8zDdFTLklxWkFTPCxaeSJW7tjCEi6PIfbeC9T4nU+8P2qZF9CKv0r4ERXglOY8PTj
 Jdgn7vlaiVXSvnDZMIKi0iAMFlMLNR2PAD0ya3xzQmv5l1xReIKeRGiGF+jQhGZ1mGeH
 6Px/mCB983eX2gdbups4X76L6Xjq4BX4scO5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692890816; x=1693495616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7q+LPo8wQuO9waVaIWLhDfmh6Cdz2EIXcP8cExW2KaQ=;
 b=UcksEzrxidhV964FSVL2+uv+OJmS2YRC5yGxl7JVrBXvjXU7NF9j10ikhYKV0PetJh
 c9bSFtgfGwBKsrU70Ju8j4+KiXZbvhK9h5W6j/jGg6TZ/KqYk9WIz7XZBc6Yef+6cnm4
 5AnP4t/L0I+I7C68B3IXFUyaUrIIUbHXmmWhpV0KX6dpjn2r63t4miUwGKvUr+SJzMsr
 BJp+qfjl0boizLrYdcDg2UHoBnXfKlktZteLzuDoZxO/eZdIXkgmGsdmee7Y+JgQwzh8
 nUV+O2lueLuSmA4ybzwfPU6+AY3PSwqBB8AVT2blfNZjxTiL+cSRw2MHazeT9+XBnAzu
 rM0g==
X-Gm-Message-State: AOJu0Yy3vJ9eRzmD5Q1yAX5errSTH1LATf3SzxF26tbZZtTIlbCG/SXP
 G0Rn029eKna+3w+46YpP1d80fQ==
X-Google-Smtp-Source: AGHT+IHk6MdYUWn1Jn9JiUjWBApcQu6PTR5pHH7Nb5YjgBZIR1JeY0+Vy1k8oA+tBC3qsMa2Z85Q/w==
X-Received: by 2002:a05:6358:5283:b0:13a:a85b:c373 with SMTP id
 g3-20020a056358528300b0013aa85bc373mr17352191rwa.18.1692890816558; 
 Thu, 24 Aug 2023 08:26:56 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 v10-20020ac83d8a000000b0041079ba4f6bsm4423014qtf.12.2023.08.24.08.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 08:26:56 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/6] drm/i915: Move DP modeset_retry_work into intel_dp
Date: Thu, 24 Aug 2023 11:25:20 -0400
Message-ID: <20230824152631.401621-5-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824152631.401621-1-gildekel@chromium.org>
References: <20230824152631.401621-1-gildekel@chromium.org>
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
Cc: seanpaul@chromium.org, Gil Dekel <gildekel@chromium.org>,
 navaremanasi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, link-training fallback is only implemented for SST, so having
modeset_retry_work in intel_connector makes sense. However, we hope to
implement link training fallback for MST in a follow-up patchset, so
moving modeset_retry_work to indel_dp will make handling both SST and
MST connectors simpler. This patch does exactly that, and updates all
modeset_retry_work dependencies to use an intel_dp instead.

Credit: this patch is a rebase of Lyude Pual's original patch:
https://patchwork.freedesktop.org/patch/216627/?series=41576&rev=3

Change-Id: I3d80d58b05efe7b07450fb800c438c6e2a34f30c
Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_display.c       | 14 +++++++++++---
 drivers/gpu/drm/i915/display/intel_display_types.h |  6 +++---
 drivers/gpu/drm/i915/display/intel_dp.c            | 11 ++++-------
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  3 +--
 4 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f387215f713af..8e3c7abda3193 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8937,20 +8937,28 @@ void intel_display_resume(struct drm_device *dev)

 static void intel_hpd_poll_fini(struct drm_i915_private *i915)
 {
-	struct intel_connector *connector;
 	struct drm_connector_list_iter conn_iter;
+	struct intel_connector *connector;
+	struct intel_dp *intel_dp;
+	struct intel_encoder *encoder;

 	/* Kill all the work that may have been queued by hpd. */
 	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
 	for_each_intel_connector_iter(connector, &conn_iter) {
-		if (connector->modeset_retry_work.func)
-			cancel_work_sync(&connector->modeset_retry_work);
 		if (connector->hdcp.shim) {
 			cancel_delayed_work_sync(&connector->hdcp.check_work);
 			cancel_work_sync(&connector->hdcp.prop_work);
 		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
+
+	for_each_intel_dp(&i915->drm, encoder) {
+		if (encoder->type == DRM_MODE_CONNECTOR_eDP ||
+		    encoder->type == DRM_MODE_CONNECTOR_DisplayPort) {
+			intel_dp = enc_to_intel_dp(encoder);
+			cancel_work_sync(&intel_dp->modeset_retry_work);
+		}
+	}
 }

 /* part #1: call before irq uninstall */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 4b88f4d60a81f..9181a2fef81e0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -608,9 +608,6 @@ struct intel_connector {

 	struct intel_dp *mst_port;

-	/* Work struct to schedule a uevent on link train failure */
-	struct work_struct modeset_retry_work;
-
 	struct intel_hdcp hdcp;
 };

@@ -1724,6 +1721,9 @@ struct intel_dp {
 	/* Displayport compliance testing */
 	struct intel_dp_compliance compliance;

+	/* Work struct to schedule a uevent on link train failure */
+	struct work_struct modeset_retry_work;
+
 	/* Downstream facing port caps */
 	struct {
 		int min_tmds_clock, max_tmds_clock;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9a5bcd630068e..2e562e09c704e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5323,12 +5323,9 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,

 static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 {
-	struct intel_connector *intel_connector;
-	struct drm_connector *connector;
-
-	intel_connector = container_of(work, typeof(*intel_connector),
-				       modeset_retry_work);
-	connector = &intel_connector->base;
+	struct intel_dp *intel_dp =
+		container_of(work, typeof(*intel_dp), modeset_retry_work);
+	struct drm_connector *connector = &intel_dp->attached_connector->base;
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
 		    connector->name);

@@ -5358,7 +5355,7 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	int type;

 	/* Initialize the work for modeset in case of link train failure */
-	INIT_WORK(&intel_connector->modeset_retry_work,
+	INIT_WORK(&intel_dp->modeset_retry_work,
 		  intel_dp_modeset_retry_work_fn);

 	if (drm_WARN(dev, dig_port->max_lanes < 1,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 720af16a654c9..6f16609a0820b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1107,7 +1107,6 @@ intel_dp_link_train_phy(struct intel_dp *intel_dp,
 static void intel_dp_schedule_fallback_link_training(struct intel_dp *intel_dp,
 						     const struct intel_crtc_state *crtc_state)
 {
-	struct intel_connector *intel_connector = intel_dp->attached_connector;
 	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;

 	if (intel_dp->hobl_active) {
@@ -1123,7 +1122,7 @@ static void intel_dp_schedule_fallback_link_training(struct intel_dp *intel_dp,
 	}

 	/* Schedule a Hotplug Uevent to userspace to start modeset */
-	schedule_work(&intel_connector->modeset_retry_work);
+	schedule_work(&intel_dp->modeset_retry_work);
 }

 /* Perform the link training on all LTTPRs and the DPRX on a link. */
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
