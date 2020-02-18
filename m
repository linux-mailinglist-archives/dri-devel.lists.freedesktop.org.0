Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D61635B3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 23:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6756EAA0;
	Tue, 18 Feb 2020 22:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA626EAA8
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 22:03:37 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id b186so10168468ywc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 14:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uwK0zioUNffzqb1aGtEapNZw0WWcKt69QujW42tpynI=;
 b=HKR0B0av1rVQnVCMGwmC4y+G4xOkAV8b7sA0dEhbDNI4Cw6Z6RujLV4FpJem+a1WAj
 FB2moymtFJllg1qMGuIPg9r6Dja7PH4v6GgUHGOHaAoGdfQ8S2W11sUHU6IJeMYFcmZX
 AMsC8Ann7eb4diwtiI3IOBJl3DQi6iW8DMw08Ok0nGxxt3jpohVOjGjbgQX6F0/h2oYo
 L5LHKVlvCZcnUK2JFBPalUKM33VQtqJTO0mGymGX9IPIp/AzEe/GQsm1X8OwTTbicieN
 Dk2HzqAU6eoowsR0+gfVnczGGSF9wcPluz/XJcBPlGVKP7ewRwcuQskuZYWR3J+mdv9i
 XdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uwK0zioUNffzqb1aGtEapNZw0WWcKt69QujW42tpynI=;
 b=RsC7L8I9bD5UuD5LcmfWkP5EAbOvbn9085XCHGfBgTH29aFJN+YgjWKgY84oSQn6tu
 UqCepB8AwXFJnrHY0p/BkUAzQ2MOkWVxyV6ZqvdAJhDYexxzbImz2THJqeiIhI4F7osY
 /y2Ain+ibVZwg35wUvHDnjtjmuc0TQrEnwOsDVgHgxpmT7wErrxmG/4HZwF7Q2is7FCF
 t0YWBr+NBuUjb9CfF3Cb9B57Pujnow6jzMRqzBp5zqQZcHHskQqDCq+OWOVsrrb0bB0S
 ULCCWjbd6iB16MAbX+d4xPExiV5+dEC3k8Lc7Mkg84fsdgeKCo8/ZSSyAz45MvJxKdQB
 LTTA==
X-Gm-Message-State: APjAAAXtQH76f0UD9+2ByUZbYkh4jBKLixZv4uT+idcE82CSXD4ixrgA
 U4l+MjOymg19O7UHFTCuuEF7FIO3ZpI=
X-Google-Smtp-Source: APXvYqwqkvwjTTL4Bk+ckyQQeZRadAiESW2KWnMcTDQkkQs15FNzS7Jk2btZraCTaIWA9Ji8nEoF2Q==
X-Received: by 2002:a81:138f:: with SMTP id 137mr19475297ywt.364.1582063416332; 
 Tue, 18 Feb 2020 14:03:36 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id c84sm41614ywa.1.2020.02.18.14.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 14:03:35 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 06/14] drm/i915: Factor out hdcp->value assignments
Date: Tue, 18 Feb 2020 17:02:34 -0500
Message-Id: <20200218220242.107265-7-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200218220242.107265-1-sean@poorly.run>
References: <20200218220242.107265-1-sean@poorly.run>
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

This is a bit of housecleaning for a future patch. Instead of sprinkling
hdcp->value assignments and prop_work scheduling everywhere, introduce a
function to do it for us.

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-7-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-7-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-7-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-Rebased on top of drm_* logging changes
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 67 ++++++++++++++++-------
 1 file changed, 46 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 680d88566d992..c61ade8aa15e6 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -873,6 +873,21 @@ struct intel_connector *intel_hdcp_to_connector(struct intel_hdcp *hdcp)
 	return container_of(hdcp, struct intel_connector, hdcp);
 }
 
+static void intel_hdcp_update_value(struct intel_connector *connector,
+				    u64 value, bool update_property)
+{
+	struct intel_hdcp *hdcp = &connector->hdcp;
+
+	WARN_ON(!mutex_is_locked(&hdcp->mutex));
+
+	if (hdcp->value == value)
+		return;
+
+	hdcp->value = value;
+	if (update_property)
+		schedule_work(&hdcp->prop_work);
+}
+
 /* Implements Part 3 of the HDCP authorization procedure */
 static int intel_hdcp_check_link(struct intel_connector *connector)
 {
@@ -899,15 +914,16 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 			connector->base.name, connector->base.base.id,
 			intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)));
 		ret = -ENXIO;
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
 		goto out;
 	}
 
 	if (hdcp->shim->check_link(intel_dig_port)) {
 		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-			hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
-			schedule_work(&hdcp->prop_work);
+			intel_hdcp_update_value(connector,
+				DRM_MODE_CONTENT_PROTECTION_ENABLED, true);
 		}
 		goto out;
 	}
@@ -919,16 +935,18 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 	ret = _intel_hdcp_disable(connector);
 	if (ret) {
 		drm_err(&dev_priv->drm, "Failed to disable hdcp (%d)\n", ret);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
 		goto out;
 	}
 
 	ret = _intel_hdcp_enable(connector);
 	if (ret) {
 		drm_err(&dev_priv->drm, "Failed to enable hdcp (%d)\n", ret);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
 		goto out;
 	}
 
@@ -1748,16 +1766,18 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 			"HDCP2.2 link stopped the encryption, %x\n",
 			intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder, port)));
 		ret = -ENXIO;
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
 		goto out;
 	}
 
 	ret = hdcp->shim->check_2_2_link(intel_dig_port);
 	if (ret == HDCP_LINK_PROTECTED) {
 		if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-			hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
-			schedule_work(&hdcp->prop_work);
+			intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_ENABLED,
+					true);
 		}
 		goto out;
 	}
@@ -1770,8 +1790,9 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 			    "HDCP2.2 Downstream topology change\n");
 		ret = hdcp2_authenticate_repeater_topology(connector);
 		if (!ret) {
-			hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
-			schedule_work(&hdcp->prop_work);
+			intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_ENABLED,
+					true);
 			goto out;
 		}
 		drm_dbg_kms(&dev_priv->drm,
@@ -1789,8 +1810,8 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 		drm_err(&dev_priv->drm,
 			"[%s:%d] Failed to disable hdcp2.2 (%d)\n",
 			connector->base.name, connector->base.base.id, ret);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+				DRM_MODE_CONTENT_PROTECTION_DESIRED, true);
 		goto out;
 	}
 
@@ -1800,8 +1821,9 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 			    "[%s:%d] Failed to enable hdcp2.2 (%d)\n",
 			    connector->base.name, connector->base.base.id,
 			    ret);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
 		goto out;
 	}
 
@@ -2042,8 +2064,9 @@ int intel_hdcp_enable(struct intel_connector *connector,
 
 	if (!ret) {
 		schedule_delayed_work(&hdcp->check_work, check_link_interval);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_ENABLED,
+					true);
 	}
 
 	mutex_unlock(&hdcp->mutex);
@@ -2061,7 +2084,9 @@ int intel_hdcp_disable(struct intel_connector *connector)
 	mutex_lock(&hdcp->mutex);
 
 	if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_UNDESIRED,
+					false);
 		if (hdcp->hdcp2_encrypted)
 			ret = _intel_hdcp2_disable(connector);
 		else if (hdcp->hdcp_encrypted)
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
