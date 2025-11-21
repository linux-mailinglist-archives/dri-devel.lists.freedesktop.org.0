Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BE0C79FB4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E53E10E8BF;
	Fri, 21 Nov 2025 14:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F1eqwuVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE1010E8A7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:08:57 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-37b983fbd45so16579051fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 06:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763734136; x=1764338936; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=43izIePpDRF9tBY8hZbcyu8muBvEa9BgL6xgRlQw6+k=;
 b=F1eqwuVs5yiGpNaPsmPCcDQX7paM1Be5SXvs2MzHQ+PFGMhg3HG1pf0X4XYbk64Wnk
 M6voGxkHeBOHC8XNoe2H2lFLDjYVFmfk6pnq2lzLDhHQM6XcqasI6wljaBQ3e3dV0t4s
 WvDuIhZAxPqYy2kvmjg9E4MrmVmkxO8r4u/W1LgxBP4obcgMtaww5DQQMz/GLtDz7Gsj
 ACxTq87YzuD7VMJ1XRGgq9cjDY313vEpEYyPkZcGzZfFJF0lADUMJqDjpc5DYYoY6rvm
 fXyaja9B2KzwyTxIn4pKNvUMpwEsUw8KVIQ76D8IWZPkQNCmrUvup/E8OEi1N0Bn/Zrk
 L/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763734136; x=1764338936;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=43izIePpDRF9tBY8hZbcyu8muBvEa9BgL6xgRlQw6+k=;
 b=SQkLoMCIUb7I5czhu9K7DKmzf2qGjhwise30r8pnvaSvO9HJfW7Z+p2fZDp1nIFiOD
 zs6QbAXz1kZqM91P2cC6v0ykDR1Cs3cAlBKowVRyk08Ioz63Kjg7emPAdOjHlaSOm9If
 q6KeWRlFHRWrUo7cm8vtSHueRFx2HA9jdoFlWQoWutJpi4/KZ+E7ckimEJQhjlPLlX+q
 bOR3k6XEX2bJ8LEpFF0GSKTnppDoTdKHh9fukqYT1PBtWLPkH61hteSnld9qBmzQoMtj
 S7l1tCwroYTTobum7e13ev/uOCoyA0UHwNFyg0Z7kq23DnsBiRkYHPoA53pLxjkHyfhE
 V7vw==
X-Gm-Message-State: AOJu0YxDTqYZn3OhyycC+1YqCxwvCk+VX/FNVtznov6I19m1XEpbZmkK
 uvwg3G2zPuWyafxFc+UVGwVGQzVyPpvcwoEmDwqzsV0G5A7t1T+wZDiBj12na8Nda3c=
X-Gm-Gg: ASbGncv6LtA5oiT0wslI/SNztoYWR6Yx4hLNxImQejvcKTZmp1jiEpcY38FgE1slWau
 QfASHuYuGxYCRu3gPjaahjRktnG+YoCyVIVjrs9nu522XBYNcrraV8MRYWCZe6RDTht90ucWaGA
 VLYwyNDApj9jFYfIB2/dCAxC2HioMP6DmMAiubgRQH7w8MUGh8nUd4Xl/zdBzX7fjPglYDsL3mn
 /5Tz+aGWTlpeHmmy1+DEMLigT6LaOb+sCTg+pkubPGAbsuxvqplY2yhJ0pIpOqNZBuExxDNSpYC
 MCl765Lkim6cJ9TMYcjB7/H7yF+/iK7entv4OBvTwufmBPKRQNRe/aKcEpfEqXvTzhukBwu4rNm
 6uSD/dJ2q0UFV1Hw2zI1mU7ktFSiYXiXXHj6toL5iPuP8NvW0uzaqMt8YCVOQZsvT/x+EZBiK+i
 k6LO8FRnRNkaj3x+x+h3ZeNXMp+pknO7+Ru/ZlC12khZq32uNNkXlGvWk=
X-Google-Smtp-Source: AGHT+IF2UxVhyVMW3AX/hoiGonlkOfpep4umI8fQpuWGyYEaK09IyOu8Yp1elYTOBgohXU5wXynToA==
X-Received: by 2002:a05:6512:b1c:b0:595:81e5:7570 with SMTP id
 2adb3069b0e04-596a3ed98c0mr1009880e87.23.1763734135916; 
 Fri, 21 Nov 2025 06:08:55 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db8718csm1668421e87.30.2025.11.21.06.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 06:08:50 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Nov 2025 15:08:31 +0100
Subject: [PATCH v4 1/3] drm/atomic-helper: Export and namespace some functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-mcde-drm-regression-thirdfix-v4-1-d89bf8c17f85@linaro.org>
References: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
In-Reply-To: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
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

