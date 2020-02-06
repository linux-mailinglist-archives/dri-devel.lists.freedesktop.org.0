Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E21153FF7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3D56FA0E;
	Thu,  6 Feb 2020 08:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09926F9DB;
 Thu,  6 Feb 2020 08:00:36 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u6so5961887wrt.0;
 Thu, 06 Feb 2020 00:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V9TXvvAIv1ktc+lOadfyH5nxwAQLabCXMU6OIGPJWpw=;
 b=c+MtMhp5ZKhGl6B/gzNdkWwofaDl7lu6dQxLnOxh//RXZQ48/WJQyFxxvZHmw4/cRM
 hvA4lKv/P7BxiwtDry6R48mpcRLgQmexuU7O95vajdmRfHNHOA7rkrXK+QBl9h46LNm8
 4rMVwjgDU8yFSQBFykU9BP1xMhLGbd8xCfeLRXZPF+SP33dv+seAqnuTVh/a6kib7BW/
 Co+WrChHzDLwnFJi9UTp9Y9DtAl/SJKvcNHXlpZ2Rm+qGPcU5H7+7yfQBR+QetinZrhX
 Wjvs+iGH9H38QQo80qU1ffruUbvSNPuQa5zVltXIazzZULlLm7XnqlSpalRhIhYXZWUv
 TNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9TXvvAIv1ktc+lOadfyH5nxwAQLabCXMU6OIGPJWpw=;
 b=hV2DVYgI6xf23C62uNuFR36tVLHmyTlShS/Ebe05uf43dWcH4LNw5RYXYudmnmUrnR
 gjIisGAp5lI5o1QGGRRIQlTq4+jSH7RE3Gx50tcJAtKbW4ADV1fSpYkMGjp8wDbm5uer
 7q3y4DZZjivNNvlHetLXGdmGJOteHUPOiVRLqdslyiL1Ttg3qW77iK1T6FdT0g/Z3Fyo
 y+JlCiqBso9M2pZxdty8hqVuH9pKrXnmwWcY3XWm4gRa5dYmKRqsoDWuw/tJ+n6glR2P
 KFIRiD4SDaPfjKD3oBz6vyi+AtACuuSkLiZkl9b1ERT9Pew1q+xyN/WuRXfxoDxbR1h7
 CJ3A==
X-Gm-Message-State: APjAAAWYiQ0DhFYQEcsm6jDm9SmF1ENkPoTeUgCHmiai4/uH0/M0txWb
 rEURO1xYtiSFrOTsfbN+IVU=
X-Google-Smtp-Source: APXvYqwjMe2XeMZHYpE496JlFECUDB7RuG3298/fC33PX2NY+dNAw9YhF34ToPQVv6iXKS+gxV2Agg==
X-Received: by 2002:adf:81c2:: with SMTP id 60mr2320668wra.8.1580976035462;
 Thu, 06 Feb 2020 00:00:35 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:00:34 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 03/12] drm/i915/atomic: conversion to drm_device based
 logging macros.
Date: Thu,  6 Feb 2020 11:00:04 +0300
Message-Id: <20200206080014.13759-4-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200206080014.13759-1-wambui.karugax@gmail.com>
References: <20200206080014.13759-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conversion of the printk based drm logging macros to the struct
drm_device based logging macros in i915/display/intel_atomic.c
This change was achieved using the following coccinelle script that
matches based on the existence of a drm_i915_private device pointer:
@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were fixed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c | 23 ++++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 379c12f3b1d4..d043057d2fa0 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -66,8 +66,9 @@ int intel_digital_connector_atomic_get_property(struct drm_connector *connector,
 	else if (property == dev_priv->broadcast_rgb_property)
 		*val = intel_conn_state->broadcast_rgb;
 	else {
-		DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
-				 property->base.id, property->name);
+		drm_dbg_atomic(&dev_priv->drm,
+			       "Unknown property [PROP:%d:%s]\n",
+			       property->base.id, property->name);
 		return -EINVAL;
 	}
 
@@ -103,8 +104,8 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 		return 0;
 	}
 
-	DRM_DEBUG_ATOMIC("Unknown property [PROP:%d:%s]\n",
-			 property->base.id, property->name);
+	drm_dbg_atomic(&dev_priv->drm, "Unknown property [PROP:%d:%s]\n",
+		       property->base.id, property->name);
 	return -EINVAL;
 }
 
@@ -362,8 +363,8 @@ static void intel_atomic_setup_scaler(struct intel_crtc_scaler_state *scaler_sta
 		mode = SKL_PS_SCALER_MODE_DYN;
 	}
 
-	DRM_DEBUG_KMS("Attached scaler id %u.%u to %s:%d\n",
-		      intel_crtc->pipe, *scaler_id, name, idx);
+	drm_dbg_kms(&dev_priv->drm, "Attached scaler id %u.%u to %s:%d\n",
+		    intel_crtc->pipe, *scaler_id, name, idx);
 	scaler_state->scalers[*scaler_id].mode = mode;
 }
 
@@ -414,8 +415,9 @@ int intel_atomic_setup_scalers(struct drm_i915_private *dev_priv,
 
 	/* fail if required scalers > available scalers */
 	if (num_scalers_need > intel_crtc->num_scalers){
-		DRM_DEBUG_KMS("Too many scaling requests %d > %d\n",
-			num_scalers_need, intel_crtc->num_scalers);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Too many scaling requests %d > %d\n",
+			    num_scalers_need, intel_crtc->num_scalers);
 		return -EINVAL;
 	}
 
@@ -460,8 +462,9 @@ int intel_atomic_setup_scalers(struct drm_i915_private *dev_priv,
 				plane = drm_plane_from_index(&dev_priv->drm, i);
 				state = drm_atomic_get_plane_state(drm_state, plane);
 				if (IS_ERR(state)) {
-					DRM_DEBUG_KMS("Failed to add [PLANE:%d] to drm_state\n",
-						plane->base.id);
+					drm_dbg_kms(&dev_priv->drm,
+						    "Failed to add [PLANE:%d] to drm_state\n",
+						    plane->base.id);
 					return PTR_ERR(state);
 				}
 			}
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
