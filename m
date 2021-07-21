Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573EE3D15B5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5068E6EB49;
	Wed, 21 Jul 2021 17:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0477B6EBF6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:56:12 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id h9so1375832qvs.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ekvo2Bf/cuTyOgoRFGtX8Wm+o3ua6k9s028dsrV8KU=;
 b=enLwojzsrI/f2htz8/oqYpgAN9oo2G77O0maZJIppOEyH2dTHZULTda1ZLc8V16+iC
 utlcxxiygZoYh+I07jRvPvCCcmii9ieYppepVhiCZoWHMfrMjYgBCmuBl46l7h9Kl+lS
 PN6wz0tVA19s7vvG1vHdSFQWy2me2C6fxhwvCX0HjItS5xNbzSwXWGIqnaWibO/y9iDt
 r8eRkRcgrutnZDanGbvjeUKxzY8+CHLBB9iAatXKazpM0Du6ZLvF2F4Uw7clN0fTCxSz
 1rM1pfaS5LUY8SPt5wuVHJgKgmwhJ/i97bYobLiYXx7QbSKrbElqhHm7d/K6vBnIaAaf
 99lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ekvo2Bf/cuTyOgoRFGtX8Wm+o3ua6k9s028dsrV8KU=;
 b=le6dX0axyivVo45q03gYd8HiXjm8foopc4BJeiUOoxwtcfAIHU2IfqYdhrv1seIQtM
 9/O4ksBzIiTeQeYYomavTgLa1ZRIAFR1tC4PYXKNtAaAKeBEdrAx/SrelCWZ+vW+KBjB
 J8Vb5S3DigrbukI9zletyqJIEtgF6kiLmiH8Ezq5n4yP0p5MgcV52QIIs7sI72WNzRW0
 0aIKJxMyl7VnEF+1Tvv5LirLNvh52/5cc3zlnDJIV3nqaxLJhJzsvKQo5Ft6kfQVbuK2
 Y4zbzfURnJaLA8Oz5jW1u9Y5NaUsAV2mNaoQZHlRdPOhUUsScDpF0OKK+bxfwWyXLANO
 Tvdw==
X-Gm-Message-State: AOAM533DQOQRFd4tMcJ5uRIAixG1fpUHehnMs5OCJXqke7YED/Oi0/Rc
 yd/YM3fgrs/Qw9Ndk6AskHVgKwy04K6mlg==
X-Google-Smtp-Source: ABdhPJwHIl4br1M4W8MzQPTqun+ojKgdRBCA5nraDmk/zsLVnij0gEHlzf1w9uIn3y/04T5Wt5Tf5A==
X-Received: by 2002:a05:6214:c63:: with SMTP id
 t3mr36823429qvj.17.1626890171186; 
 Wed, 21 Jul 2021 10:56:11 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id n20sm11921820qkk.102.2021.07.21.10.56.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:56:10 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 09/14] drm/i915: Change infoframe debug checks to
 specify syslog
Date: Wed, 21 Jul 2021 13:55:16 -0400
Message-Id: <20210721175526.22020-10-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210721175526.22020-1-sean@poorly.run>
References: <20210721175526.22020-1-sean@poorly.run>
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Since the logs protected by these checks specifically target syslog,
use the new drm_debug_syslog_enabled() call to avoid triggering
these prints when only trace is enabled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20200608210505.48519-10-sean@poorly.run #v5

Changes in v5:
-Added to the set
Changes in v6:
-None
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 65ddb6ca16e6..048d7335196b 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7494,7 +7494,7 @@ static void
 intel_dump_infoframe(struct drm_i915_private *dev_priv,
 		     const union hdmi_infoframe *frame)
 {
-	if (!drm_debug_enabled(DRM_UT_KMS))
+	if (!drm_debug_syslog_enabled(DRM_UT_KMS))
 		return;
 
 	hdmi_infoframe_log(KERN_DEBUG, dev_priv->drm.dev, frame);
@@ -8215,7 +8215,7 @@ pipe_config_infoframe_mismatch(struct drm_i915_private *dev_priv,
 			       const union hdmi_infoframe *b)
 {
 	if (fastset) {
-		if (!drm_debug_enabled(DRM_UT_KMS))
+		if (!drm_debug_syslog_enabled(DRM_UT_KMS))
 			return;
 
 		drm_dbg_kms(&dev_priv->drm,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

