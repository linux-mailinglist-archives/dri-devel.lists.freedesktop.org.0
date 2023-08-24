Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374B67866C0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 06:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A5710E4DE;
	Thu, 24 Aug 2023 04:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D102D10E4DE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 04:34:12 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-76de9c23e5cso101386585a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 21:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692851652; x=1693456452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wc66pRU9OKWitHlEhM03zOV4Qkog3n79jFNT7eNt/cw=;
 b=Iip2MFQdvXDnIh6TWANg5yzaokHjvWLX7aZUAyZEYpi/ihyfKR2MdqecXTNTktMnOW
 we8UhLOg1qPFgi8k3+Ilq/HbFpAtqQumjorCmJUWZI+LxgsUip8AWfv2v/QjeKwE+JDs
 V4MMzzJM2hlR7Matg4vVRZ47wB1zrYkNjqNC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692851652; x=1693456452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wc66pRU9OKWitHlEhM03zOV4Qkog3n79jFNT7eNt/cw=;
 b=WM6BFQfBLfBXxs9t8X9LLGezinhbpnQGN9gKaS7sSPUBmj74gi5djMofRmI29LYzwd
 M8xIvmxIQ5gm29nP8Y5HjQ1CTMVcWhA/68U6SEz1NTBIw7cBacKUZkEJmp7uCtclBOtO
 WSBhMl+KwxjtAK1LTVwz2iAyQBF3izIm4tEjNd9rHyXO7t4ulfPvvkWLorJD5wuQm8M3
 DoYB0bH9NMeGtsbNflpgcvqgRsvEoR2ZvqB6K5p2xOp6n3RNTvfNGDHWw+ItenVCVQ/r
 BTrWf/lCJuhv/zzJUIhLsuUgoVc+nTw48tTXNyXU1TbVTFGr4DC6tSwPxBxdiyA8AckZ
 UUeA==
X-Gm-Message-State: AOJu0YwaSRqlMNr+bC6WNrpUNWq8qtpHKJWX7vMPyiYaEp1CBUw0fN5A
 YSjLE3+33U5AFLFtE2JTBNdQ7Q==
X-Google-Smtp-Source: AGHT+IHrIKTujiUZmD2nRu3t97smnjijI6G2CNiLig7BlxzHUnv7dcLJ20w6QgApLETLAVBEY5XfEw==
X-Received: by 2002:a0c:f3c5:0:b0:64f:5cb1:3e93 with SMTP id
 f5-20020a0cf3c5000000b0064f5cb13e93mr3823568qvm.41.1692851652020; 
 Wed, 23 Aug 2023 21:34:12 -0700 (PDT)
Received: from gildekel.nyc.corp.google.com
 ([2620:0:1003:314:321d:e6f5:6dbd:3e5])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a0cca83000000b0064910f273aesm4913632qvk.146.2023.08.23.21.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 21:34:11 -0700 (PDT)
From: Gil Dekel <gildekel@chromium.org>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/i915/dp_link_training: Set all downstream MST
 ports to BAD before retrying
Date: Thu, 24 Aug 2023 00:31:08 -0400
Message-ID: <20230824043240.323564-6-gildekel@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824043240.323564-1-gildekel@chromium.org>
References: <20230818170156.2194015-1-gildekel@chromium.org>
 <20230824043240.323564-1-gildekel@chromium.org>
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

Before sending a uevent to userspace in order to trigger a corrective
modeset, we change the failing connector's link-status to BAD. However,
the downstream MST branch ports are left in their original GOOD state.

This patch utilizes the drm helper function
drm_dp_set_mst_topology_link_status() to rectify this and set all
downstream MST connectors' link-status to BAD before emitting the uevent
to userspace.

Signed-off-by: Gil Dekel <gildekel@chromium.org>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 42353b1ac487..e8b10f59e141 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5995,16 +5995,20 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 	struct intel_dp *intel_dp =
 		container_of(work, typeof(*intel_dp), modeset_retry_work);
 	struct drm_connector *connector = &intel_dp->attached_connector->base;
-	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
-		    connector->name);

-	/* Grab the locks before changing connector property*/
-	mutex_lock(&connector->dev->mode_config.mutex);
-	/* Set connector link status to BAD and send a Uevent to notify
-	 * userspace to do a modeset.
+	/* Set the connector's (and possibly all its downstream MST ports') link
+	 * status to BAD.
 	 */
+	mutex_lock(&connector->dev->mode_config.mutex);
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] link status %d -> %d\n",
+		    connector->base.id, connector->name,
+		    connector->state->link_status, DRM_MODE_LINK_STATUS_BAD);
 	drm_connector_set_link_status_property(connector,
 					       DRM_MODE_LINK_STATUS_BAD);
+	if (intel_dp->is_mst) {
+		drm_dp_set_mst_topology_link_status(&intel_dp->mst_mgr,
+						    DRM_MODE_LINK_STATUS_BAD);
+	}
 	mutex_unlock(&connector->dev->mode_config.mutex);
 	/* Send Hotplug uevent so userspace can reprobe */
 	drm_kms_helper_connector_hotplug_event(connector);
--
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
