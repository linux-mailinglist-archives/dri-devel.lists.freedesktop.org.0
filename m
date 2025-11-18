Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A87EC6A04B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EA410E4D2;
	Tue, 18 Nov 2025 14:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DFEHKLYW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1026F10E4D2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:36:39 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-37b99da107cso50202891fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763476597; x=1764081397; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xpriEPRIqUaaYe29NxJfEOiaFF5obd11Irf91BzDQtA=;
 b=DFEHKLYWioTh5nr/UQXphstK3EeuPdcl7gN20jyAzHn3V3asuurM9h6LAUJMQ805F4
 qNVXK/xprVEy3YdrBDud9ocyp/PwMoC2L4DGSorRcyORemNGdEfOprkz5fim1ylUAQS9
 d6ix9l7pYRNt07wBR2Bi+F4RcQANfUBttlxkS1FjePc36KHrqumrKGC0L8d1iQHZrWbM
 3wbmJqFnyTUdqL7yFAnLI4Zz/PSYoQRw9t6a0sCmi5Ts8EMzXouYSDWVKW8x5QOcCvkk
 zhHz9VAMFU6e5q6syPHFSJRYTRhYhIH220WYSwKlkOZag2DLHUq/IcW7ImxA/RIjjDf6
 vzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476597; x=1764081397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xpriEPRIqUaaYe29NxJfEOiaFF5obd11Irf91BzDQtA=;
 b=mXzxESreGbcPXx1IcQXgWuFpM7+Ifd7OO09flHVFSmR5mon36y7ZQIQMjwBP8zg791
 UzfWs0Go+OUHj57Y1vxfVzu708juRGsibe9JJfJm+f+RIcxPQBHlfOw1mi8M/3eynVyP
 STxVz5ycmrr/6A4bZ3U6MQu7BovcT5TBYnpLLANiMQ8D1H2xiUA07KcO1cumyc0qgjmW
 iOUKXBiOjewzyW1iOkH9XFitKEOJ+3R5/NbtGmFpdWV5MH9hzQxEIxAnbwoZpX7frdFL
 ZTUX5Eb5YKf0WY8l0+x1TZ1l26bmuYXAAOso2zjbyWGGZPeceTTujT2uZompfcWYg2HY
 /wkg==
X-Gm-Message-State: AOJu0Ywz1fzT+golkog0Sj5p7a14w3fCFSUNc3EaxFJszlkfmm1WuLYk
 sruSGOq3UZ8X6+arM0oC821usOAl6uOiu9k3JHh00ojrsgdKOnYPLJGip8tW0Po8CLo=
X-Gm-Gg: ASbGncvGZA4xIpaH+nK/aeoaAcqHbG+3lGBjSMP+JmoM9p9sr9Dc+Ae3wqtY5z/CY6G
 2kWk4BQpOwE3dV8p/7nkZJp8aN0INi61EwYmyFxt8qpW/049jZpWcSDVn8c7c7XeXtDKcQiMp8w
 eK5cCQuG/LUaZ9Lzd6PtKnpULEqJ6d3WfNj4XzDarGc/gsGCJ/gR0Ws78AD+4p/ojSQyGSXuWdy
 GLmFAiYtxVH/TbC+8qOliFRFYJSWKhjP6oBTL0n9DKiGwKTTvmeexmlrwjvYZvt5OotOT0ajGFd
 8wVEb72iD+EB3dCnP/mEFVCpQBEurcwPrjAuucOp+qyeYxlct0K0S/pzE2WJPScxKOy1EgOZi2T
 VZftzvZEP7WEK6+LDw+PFPNM+kyGdBff3T5RDyHjsvi4ABiRTliRNI6vM6xhQfQgoyobk/TCjgA
 182YpUsIkqSw6gFNrYUvZn7bTKLbFsxBRGtug+H4EXQHs3/kadkJdpv88l60wGGaEKSsTelwFrf
 4T5
X-Google-Smtp-Source: AGHT+IHUYN0gIKBgoNcp/XIDcRJ3B1pwzXqhuUZD6AOz918aJmBQapxGNJskh5sXazOT6XAQc28WwA==
X-Received: by 2002:a05:6512:3f18:b0:592:ed29:9dde with SMTP id
 2adb3069b0e04-5958425aa01mr5240229e87.44.1763476597193; 
 Tue, 18 Nov 2025 06:36:37 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595803b80dcsm3955909e87.44.2025.11.18.06.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:36:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 15:36:04 +0100
Subject: [PATCH v2 2/3] drm/atomic-helper: Add disable CRTC late variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-mcde-drm-regression-v2-2-4fedf10b18f6@linaro.org>
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
In-Reply-To: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
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

This augments the previous patch that provide an alternate semantic
to enable the CRTC early adding a function to also disable the CRTC
late, essentially restoring the entire old sequencing if you
use both these helpers.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 39 ++++++++++++++++++++++++++++++++-----
 include/drm/drm_atomic_helper.h     |  2 ++
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f03b93c72b8f..eb47883be153 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1337,13 +1337,17 @@ encoder_bridge_post_disable(struct drm_device *dev, struct drm_atomic_state *sta
 }
 
 static void
-disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
+disable_outputs(struct drm_device *dev, struct drm_atomic_state *state, bool late_crtc)
 {
 	encoder_bridge_disable(dev, state);
 
-	crtc_disable(dev, state);
-
-	encoder_bridge_post_disable(dev, state);
+	if (!late_crtc) {
+		crtc_disable(dev, state);
+		encoder_bridge_post_disable(dev, state);
+	} else {
+		encoder_bridge_post_disable(dev, state);
+		crtc_disable(dev, state);
+	}
 }
 
 /**
@@ -1526,7 +1530,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *state)
 void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state)
 {
-	disable_outputs(dev, state);
+	disable_outputs(dev, state, false);
 
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 	drm_atomic_helper_calc_timestamping_constants(state);
@@ -1535,6 +1539,31 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
 
+/**
+ * drm_atomic_helper_commit_modeset_disables_crtc_late - modeset disable outputs
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This function shuts down all the outputs that need to be shut down with
+ * CRTC last in the disablement chain and prepares them (if required) with the
+ * new mode.
+ *
+ * This is a version of @drm_atomic_helper_commit_modeset_disables() that disables
+ * the CRTC last in the chain of disablement calls instead of the intuitive
+ * order to disable the bridges before the CRTC.
+ */
+void drm_atomic_helper_commit_modeset_disables_crtc_late(struct drm_device *dev,
+							 struct drm_atomic_state *state)
+{
+	disable_outputs(dev, state, true);
+
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
+
+	crtc_set_mode(dev, state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables_crtc_late);
+
 static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 						struct drm_atomic_state *state)
 {
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index d7fb473db343..d479afcd1637 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -91,6 +91,8 @@ drm_atomic_helper_calc_timestamping_constants(struct drm_atomic_state *state);
 
 void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state);
+void drm_atomic_helper_commit_modeset_disables_crtc_late(struct drm_device *dev,
+							 struct drm_atomic_state *state);
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					  struct drm_atomic_state *old_state);
 void drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,

-- 
2.51.1

