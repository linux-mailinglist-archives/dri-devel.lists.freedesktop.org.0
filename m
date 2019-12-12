Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F67B11D6AF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 20:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE056E143;
	Thu, 12 Dec 2019 19:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6F66E139
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 19:02:43 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id 192so16797ywy.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 11:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+l0scCQc9gsQrZuIGMsghjmMiTJidwuTYmFDJHHyGIE=;
 b=BnI4YlvC6hHRngF/u+XoXmCqwTQbeXcKLgHPjmsxxtoUJPkhI4Mp7q4YhPdSW9s7bD
 wMfM0yVXw0Qv/vKhr/r8q7krwswf//Mq1YkdNo/kDTlkdlMNFg/sqfmX8G1zl3HhKUpN
 bwKK4bW9HGiogZW01CUY0WCKRL3t26+wxg9oq4x4fKuhkgkASTmZUnjnZLBLRnBylZC7
 Ekb+gt8x1mhs0ZC12dWrQRM4FzApxb0vM8xXo46irEBMBP8ZL7cxzH1f7xGXHImwxPun
 Hy/CWIcoPEJDi4Xtm74yV/EO3QW4azgN5bWxIh3xIppfv1+WXEt2IhIUY4c939y7y/GF
 lM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+l0scCQc9gsQrZuIGMsghjmMiTJidwuTYmFDJHHyGIE=;
 b=eXb3JS5bcq6SxZrbCMaIHsPrOJmv4kxabYPdFm6VuiuYi1lgrR/XMJcv2r/cS8Neo/
 IBXiCZq0HF88Bvwwr5el8wAnSCgNVeHiXkBB3HpV0hdyccZfVt42mD+NiUFa6r5Q52Xj
 kra4T2wQX2bgdwMS/Vc6vcIP4EXhoowatJT1Zko/7y2DqdbUYqdYLTR7G4GtKrfOblUg
 tTMhYWazN8DI5Yu3dvgJ2zj15eHDTyUIg3DeSyCbiwxfSs8IM5MlR/8xDR/LnJb0IAv7
 2X6cT4S7FfItglqkROA+rELIP0MXC6eYKWr5ew6gMel2x49dAS5jbcQDpgPemh6egL80
 R4MQ==
X-Gm-Message-State: APjAAAUdHJGJDxb1R6KWB0popXIW3nzYOea6AzEdhWd4kcWHlGq917P3
 1G7qbDWHNjB8yR6RwSeT/sQfaDNR/iVbhQ==
X-Google-Smtp-Source: APXvYqx1Yp9sMCARdGPwnaktKp7INv6ky//39Ws4Ca3eqA8iey4TDPvVJtehnSJabTbPFUeSqNMoEA==
X-Received: by 2002:a0d:cc55:: with SMTP id o82mr5630092ywd.426.1576177362046; 
 Thu, 12 Dec 2019 11:02:42 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id r64sm3017834ywg.84.2019.12.12.11.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 11:02:41 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/12] drm/i915: Factor out hdcp->value assignments
Date: Thu, 12 Dec 2019 14:02:24 -0500
Message-Id: <20191212190230.188505-7-sean@poorly.run>
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

This is a bit of housecleaning for a future patch. Instead of sprinkling
hdcp->value assignments and prop_work scheduling everywhere, introduce a
function to do it for us.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-7-sean@poorly.run #v1

Changes in v2:
-None
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 67 ++++++++++++++++-------
 1 file changed, 46 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f8d56d3b2ddb..798e7e1a19fc 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -852,6 +852,21 @@ struct intel_connector *intel_hdcp_to_connector(struct intel_hdcp *hdcp)
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
@@ -878,15 +893,16 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 			  I915_READ(HDCP_STATUS(dev_priv, cpu_transcoder,
 						port)));
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
@@ -897,16 +913,18 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 	ret = _intel_hdcp_disable(connector);
 	if (ret) {
 		DRM_ERROR("Failed to disable hdcp (%d)\n", ret);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
 		goto out;
 	}
 
 	ret = _intel_hdcp_enable(connector);
 	if (ret) {
 		DRM_ERROR("Failed to enable hdcp (%d)\n", ret);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
 		goto out;
 	}
 
@@ -1716,16 +1734,18 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 			  I915_READ(HDCP2_STATUS(dev_priv, cpu_transcoder,
 						 port)));
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
@@ -1737,8 +1757,9 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 		DRM_DEBUG_KMS("HDCP2.2 Downstream topology change\n");
 		ret = hdcp2_authenticate_repeater_topology(connector);
 		if (!ret) {
-			hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
-			schedule_work(&hdcp->prop_work);
+			intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_ENABLED,
+					true);
 			goto out;
 		}
 		DRM_DEBUG_KMS("[%s:%d] Repeater topology auth failed.(%d)\n",
@@ -1753,8 +1774,8 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 	if (ret) {
 		DRM_ERROR("[%s:%d] Failed to disable hdcp2.2 (%d)\n",
 			  connector->base.name, connector->base.base.id, ret);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+				DRM_MODE_CONTENT_PROTECTION_DESIRED, true);
 		goto out;
 	}
 
@@ -1763,8 +1784,9 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 		DRM_DEBUG_KMS("[%s:%d] Failed to enable hdcp2.2 (%d)\n",
 			      connector->base.name, connector->base.base.id,
 			      ret);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_DESIRED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_DESIRED,
+					true);
 		goto out;
 	}
 
@@ -2004,8 +2026,9 @@ int intel_hdcp_enable(struct intel_connector *connector,
 
 	if (!ret) {
 		schedule_delayed_work(&hdcp->check_work, check_link_interval);
-		hdcp->value = DRM_MODE_CONTENT_PROTECTION_ENABLED;
-		schedule_work(&hdcp->prop_work);
+		intel_hdcp_update_value(connector,
+					DRM_MODE_CONTENT_PROTECTION_ENABLED,
+					true);
 	}
 
 	mutex_unlock(&hdcp->mutex);
@@ -2023,7 +2046,9 @@ int intel_hdcp_disable(struct intel_connector *connector)
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
