Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AEC1411BD
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFAA6F8E3;
	Fri, 17 Jan 2020 19:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EDA6F8E1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:31:14 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id x18so6383635ybk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bKZcnT+TsVxfMWYRx4pqWKSy//If+wmK7L6G6Yxhy4U=;
 b=baLlv6HB70X15TtezlclweYvNUsdGJsQod8hMsS2IVZnP4SP2FODIE/7rTMegy+VDz
 mVzxNWZZbvfw4sKJJ78bkYt51exgeFqNq3ppa1X1x46mmKAQAxVwaGd9nov6TMzid8Tp
 8LBmMHyVp6+5Rz2sj6kemx12kodeaKdwsft7f4+WzaOnyIRksqobJzkqJ120FIxVfZ34
 k1FNxPUfeLQZBFMdvrp7aYEwSaF9m4MD/o/e7zaHiknAWc4Tg5oPzZzlVJ/hnqDdvi1v
 IU4WHNQ/Jbk2BD3DwB8K0usS8LG+wpoah8pquvFradzh474Es/oGzCRCh0gOw2U/jytr
 GBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKZcnT+TsVxfMWYRx4pqWKSy//If+wmK7L6G6Yxhy4U=;
 b=SydLYoepJuybDnsPHOMSqJsZS2ihBjnNrbuhojCrEj/rt8k+rCUY5CRTyOS7VFnzXW
 NO8l7iL9KWD1J82ATVWWLEUxnr37n+Rfc+SYDAfHCClnbQPVkBWHUiS6brS5BiG2CgI5
 QBZe/ARGH+t4zEMhazRlFqL8FmnXF1TEg86p21mxm4IUb+Uw/4IFCCqqXM1e/O4YDKv5
 M1zWQdt4bi44XF3hGjBKa1ZMC9/QAEXUeAJXkulMfkv+joEB//eC3Ht8eV68Yfp/RbZk
 JOs7+G8y69U6CpNK7Rhi3IY4MXYO/APS9XpEmu6vflKAl3mzN+O/u/r3TMbb+WCZXPgJ
 sRLg==
X-Gm-Message-State: APjAAAVJay2fKkTCUufL/asA/0i+bQ9SOZVMAujJLbgeqW0YuyoIlEPX
 4GdHWRoquBQ92rJkaLxAVsS6OlO6CPs2Dg==
X-Google-Smtp-Source: APXvYqyEFN39EFp9biwYUfMLVVQx9Uf0Ji6ieoA86TzStUPLuGv4ViCXXX3ENkkj/0GExWeb75gGMQ==
X-Received: by 2002:a25:1a55:: with SMTP id a82mr13788404yba.497.1579289472968; 
 Fri, 17 Jan 2020 11:31:12 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id t5sm11907486ywc.3.2020.01.17.11.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:31:12 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 06/12] drm/i915: Factor out hdcp->value assignments
Date: Fri, 17 Jan 2020 14:30:57 -0500
Message-Id: <20200117193103.156821-7-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200117193103.156821-1-sean@poorly.run>
References: <20200117193103.156821-1-sean@poorly.run>
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

Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-7-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-7-sean@poorly.run #v2

Changes in v2:
-None
Changes in v3:
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
