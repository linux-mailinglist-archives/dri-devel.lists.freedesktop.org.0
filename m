Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C7AC768E4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 23:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D1710E7D0;
	Thu, 20 Nov 2025 22:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bM/ku0lr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F3210E7D0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 22:55:48 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5959da48139so1432571e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763679346; x=1764284146; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=43izIePpDRF9tBY8hZbcyu8muBvEa9BgL6xgRlQw6+k=;
 b=bM/ku0lrkxUUGk/tNCQflBbaRyawXaQjXD6ibOlstcXoH49994sl3TlG1SywFIZH+8
 5MQZE5Of9Np60RFuf+ZqTQg8dAkLF3kxpL0FFuCp+wvSB0A/B83eWBlUOAcNp6Dig9Ow
 0MWLi8CjFDGdMEsvQjXOwpK+MVG1Fq5Cgj137tn/lDVgNyjbZjcCZEGWyD1593Bf+eng
 OnMEbFvzeKyh3Vmel4K14e95+kbU7EoJPp02/8fMtVZL5sw9LcQgFxaKTu0unSxpHDFC
 5zJm47zIEOt19BwREUUfyaaVIexVLzHTD5elTC5PyFxuwQITsYrf1BHp5ulArCqY2JqN
 /R8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763679346; x=1764284146;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=43izIePpDRF9tBY8hZbcyu8muBvEa9BgL6xgRlQw6+k=;
 b=bm6c65UipV71GVMlt+6P/8IE7Q54uSe8ja2YmnLQt/CmGzjg8iJSNzY8ImA1phtGum
 FCcw/AT3djRlMGRfKui4aR5wEtNWCrotqrcMCWjfytfAibTp3bmA1BMZCdgnPts1kZG3
 ehmZnin6ZjlLLMvaubDHhdCkiFH2ygrBQ9dIiXMQTechsyZmvFAd+QIz/y3436x5GD0W
 3AV11eVLIMmHPd/TJARRLxSZbBMkk/cY/LgD39N+Iq0H85e3nqc1BqBbWYFbLkDZKov2
 /82AxT2yUqNaDNPNuw+QO2Zu/MONT7YvUqrn68AC4BZhX7t6voDVQ2ZKgrrvKcgebaEC
 Q8Uw==
X-Gm-Message-State: AOJu0YykNUgGJMM+dL+C+mycfg47xmrxQY72agGgNV//VCjnEG0DWi1c
 82z9yIdQXtrHwwxv3ZFK9iNSIDISDjN1XwKUyXRNVX6hNiC7Y7Wlfr+r2aV+47S2UCY=
X-Gm-Gg: ASbGncuOqlPYXmiJeYsX9fE1LU+Eforfvmrwuj2/txG6Hl9D+7qcjbJ5JvHNKfvYr4d
 Olabq1/1nmliyfAHSUK/FPxPfSf3BB4YT9YqJDd4+GK/uFcWDVVD+SEWkBdDbMz2AMpBoiLVGfr
 LkCsVrAPGBCtAbwCjkQUYmDFz0TwjPji5hqIRsHZHmOPNAz+2LPGtxneutj4qPeDiI+Z+ak5eM2
 igW6wSBiY5I/W27Okv1rVyzBu59J5RLWDobdWqyXiQhoBfTljBNS9KQulmurxpRYBtqgMBBzbeS
 A62efgiVpsN+7wRfB9wz46r03D1ORgUvKdOTJnUvY0R+oj0TsfXk6RUQRlKexpieIEzXZaWI/S5
 YFUquTcAxYA7ZilfxnfxnQUJrcZXLOcuu13wDmeGYtdp6mqq4vqvNjSy0U9Y1YQYe+w+TbCFLjX
 389SbXt4p910tjOxu34tFo1OZ9hqD+L4rZVX3Q8B8WZTg9VFIRjU45HJs=
X-Google-Smtp-Source: AGHT+IHLRrOzhC7ObQ8MKBVPSFy/UQwfEh66CdUz8udFR249vfAwDFDWn4Pi6Z2qjNghgsWN8ERXYw==
X-Received: by 2002:a05:6512:3ca8:b0:595:7bc3:133d with SMTP id
 2adb3069b0e04-5969e2bd0a5mr1785651e87.11.1763679346441; 
 Thu, 20 Nov 2025 14:55:46 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db75705sm1066877e87.15.2025.11.20.14.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 14:55:38 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Nov 2025 23:55:32 +0100
Subject: [PATCH v3 1/3] drm/atomic-helper: Export and namespace some functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-mcde-drm-regression-thirdfix-v3-1-24b1e9886bbf@linaro.org>
References: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
In-Reply-To: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export and namespace those not prefixed with drm_* so
it becomes possible to write custom commit tail functions
in individual drivers using the helper infrastructure.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 54 +++++++++++++++++++++----------------
 include/drm/drm_atomic_helper.h     | 19 +++++++++++++
 2 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d5ebe6ea0acb..906eb4b0852c 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1162,8 +1162,8 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 	       new_state->self_refresh_active;
 }
 
-static void
-encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
@@ -1229,9 +1229,10 @@ encoder_bridge_disable(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 }
+EXPORT_SYMBOL(drm_encoder_bridge_disable);
 
-static void
-crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
@@ -1282,9 +1283,10 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
 			drm_crtc_vblank_put(crtc);
 	}
 }
+EXPORT_SYMBOL(drm_crtc_disable);
 
-static void
-encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
@@ -1335,15 +1337,16 @@ encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *sta
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_encoder_bridge_post_disable);
 
 static void
 disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 {
-	encoder_bridge_disable(dev, state);
+	drm_encoder_bridge_disable(dev, state);
 
-	crtc_disable(dev, state);
+	drm_crtc_disable(dev, state);
 
-	encoder_bridge_post_disable(dev, state);
+	drm_encoder_bridge_post_disable(dev, state);
 }
 
 /**
@@ -1446,8 +1449,8 @@ void drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *stat
 }
 EXPORT_SYMBOL(drm_atomic_helper_calc_timestamping_constants);
 
-static void
-crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
@@ -1508,6 +1511,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_crtc_set_mode);
 
 /**
  * drm_atomic_helper_commit_modeset_disables - modeset commit to disable outputs
@@ -1531,12 +1535,12 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 	drm_atomic_helper_calc_timestamping_constants(state);
 
-	crtc_set_mode(dev, state);
+	drm_crtc_set_mode(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
 
-static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
-						struct drm_atomic_state *state)
+void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
+					 struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1555,9 +1559,10 @@ static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 		}
 	}
 }
+EXPORT_SYMBOL(drm_atomic_helper_commit_writebacks);
 
-static void
-encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1588,9 +1593,10 @@ encoder_bridge_pre_enable(struct drm_device *dev, struct drm_atomic_state *state
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_encoder_bridge_pre_enable);
 
-static void
-crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
@@ -1619,9 +1625,10 @@ crtc_enable(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 }
+EXPORT_SYMBOL(drm_crtc_enable);
 
-static void
-encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
+void
+drm_encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
@@ -1664,6 +1671,7 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 		drm_bridge_put(bridge);
 	}
 }
+EXPORT_SYMBOL(drm_encoder_bridge_enable);
 
 /**
  * drm_atomic_helper_commit_modeset_enables - modeset commit to enable outputs
@@ -1682,11 +1690,11 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					      struct drm_atomic_state *state)
 {
-	encoder_bridge_pre_enable(dev, state);
+	drm_encoder_bridge_pre_enable(dev, state);
 
-	crtc_enable(dev, state);
+	drm_crtc_enable(dev, state);
 
-	encoder_bridge_enable(dev, state);
+	drm_encoder_bridge_enable(dev, state);
 
 	drm_atomic_helper_commit_writebacks(dev, state);
 }
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 53382fe93537..39878aa485c3 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -60,6 +60,11 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 int drm_atomic_helper_check_planes(struct drm_device *dev,
 			       struct drm_atomic_state *state);
 int drm_atomic_helper_check_crtc_primary_plane(struct drm_crtc_state *crtc_state);
+void drm_encoder_bridge_disable(struct drm_device *dev,
+				struct drm_atomic_state *state);
+void drm_crtc_disable(struct drm_device *dev, struct drm_atomic_state *state);
+void drm_encoder_bridge_post_disable(struct drm_device *dev,
+				     struct drm_atomic_state *state);
 int drm_atomic_helper_check(struct drm_device *dev,
 			    struct drm_atomic_state *state);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *state);
@@ -89,8 +94,22 @@ drm_atomic_helper_update_legacy_modeset_state(struct drm_device *dev,
 void
 drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *state);
 
+void drm_crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state);
+
 void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state);
+
+void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
+					 struct drm_atomic_state *state);
+
+void drm_encoder_bridge_pre_enable(struct drm_device *dev,
+				   struct drm_atomic_state *state);
+
+void drm_crtc_enable(struct drm_device *dev, struct drm_atomic_state *state);
+
+void drm_encoder_bridge_enable(struct drm_device *dev,
+			       struct drm_atomic_state *state);
+
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					  struct drm_atomic_state *old_state);
 

-- 
2.51.1

