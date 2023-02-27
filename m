Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504FA6A4B1C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C238610E4B9;
	Mon, 27 Feb 2023 19:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338CF10E3BC;
 Mon, 27 Feb 2023 19:36:14 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id c23so7320365pjo.4;
 Mon, 27 Feb 2023 11:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ne6dVN4Zfxf+59QfH2SamsGK9HgLZPOuQHN0vkbKBY=;
 b=kel3Zs7ltk82d+Xs/mXGPdD1ShGUqktkKeblsOYWMuCBatx/PytYevWJiBkbAWTJKm
 K3iuwX5ID9LbkcdjykXm4cvp4dDuLMqbXLPVuWc/WTqcoSk+4wSVmBchorXlNUQDRuTc
 6dAsfgsgZNq846nVHt690E0AVm1teVFG4TfwmaenDYXYVAO/B9GrRKTtUVsT78xJWAnl
 hiiUkMUnW9Tbfe6bbGLo4NZ/bun27aJZEABuaAi8C930MvQqXpVrfAmEaH0SujceNYE+
 xhP8p7AQeswIK5AWKSAoFMb7YZhUV9xr/+u1mftPU7zVWEhB1UMiMgCKvG3EZme5NZa4
 7ZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Ne6dVN4Zfxf+59QfH2SamsGK9HgLZPOuQHN0vkbKBY=;
 b=WGXYfWMCYMzEOCnB09xkY9dIeHpwYiuUOhD65cSyItHlY5Wv3X6qII8nmLNq3eXt2d
 9HjqBjZrXHee6e0WNxu8ONU32uQIKZk8LMrvAAdMCyz1dWDgS5+DebVTAgdQob2fg3mw
 jokg6giWQouKDfRxeZc3gn0fTzAskOnnktYbPOco51hMV3eE/ZRpCjMgzJluy560hVzO
 NeGrqkR5zRLk4Kifm8ebxBx1v9FIOxKusjXs9qQbPbUjBhY1JTPgN7yKTxUGa8GH6JXJ
 Pj+BSNaC8Ke5NuBMxyc9Cm/AVS81h0I7XOtEQjBvW/316KB0zVglXWN8Yv5FpiUwAaYi
 2u0g==
X-Gm-Message-State: AO0yUKX1g+946p0AqdreC75okmyAISY6VUxYAKjtZx8cVbj/c6pE9Six
 h/4d+7usJ1oxnvxLe69OI/X9RZ8w63w=
X-Google-Smtp-Source: AK7set+M36P134DXimqNpzZOvj3mRaLhgIVGFWOk67CdrWkGuJMWBWoLKkB3fq7IGQ2nZMioMqJdzg==
X-Received: by 2002:a17:902:700b:b0:19a:e96a:58b3 with SMTP id
 y11-20020a170902700b00b0019ae96a58b3mr40339plk.22.1677526573431; 
 Mon, 27 Feb 2023 11:36:13 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 bj2-20020a170902850200b0018099c9618esm4945729plb.231.2023.02.27.11.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:36:13 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 10/15] drm/vblank: Add helper to get next vblank time
Date: Mon, 27 Feb 2023 11:35:16 -0800
Message-Id: <20230227193535.2822389-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227193535.2822389-1-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Will be used in the next commit to set a deadline on fences that an
atomic update is waiting on.

v2: Calculate time at *start* of vblank period, not end
v3: Fix kbuild complaints

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_vblank.c | 53 ++++++++++++++++++++++++++++++------
 include/drm/drm_vblank.h     |  1 +
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 2ff31717a3de..299fa2a19a90 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -844,10 +844,9 @@ bool drm_crtc_vblank_helper_get_vblank_timestamp(struct drm_crtc *crtc,
 EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp);
 
 /**
- * drm_get_last_vbltimestamp - retrieve raw timestamp for the most recent
- *                             vblank interval
- * @dev: DRM device
- * @pipe: index of CRTC whose vblank timestamp to retrieve
+ * drm_crtc_get_last_vbltimestamp - retrieve raw timestamp for the most
+ *                                  recent vblank interval
+ * @crtc: CRTC whose vblank timestamp to retrieve
  * @tvblank: Pointer to target time which should receive the timestamp
  * @in_vblank_irq:
  *     True when called from drm_crtc_handle_vblank().  Some drivers
@@ -865,10 +864,9 @@ EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp);
  * True if timestamp is considered to be very precise, false otherwise.
  */
 static bool
-drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
-			  ktime_t *tvblank, bool in_vblank_irq)
+drm_crtc_get_last_vbltimestamp(struct drm_crtc *crtc, ktime_t *tvblank,
+			       bool in_vblank_irq)
 {
-	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
 	bool ret = false;
 
 	/* Define requested maximum error on timestamps (nanoseconds). */
@@ -876,8 +874,6 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
 
 	/* Query driver if possible and precision timestamping enabled. */
 	if (crtc && crtc->funcs->get_vblank_timestamp && max_error > 0) {
-		struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
-
 		ret = crtc->funcs->get_vblank_timestamp(crtc, &max_error,
 							tvblank, in_vblank_irq);
 	}
@@ -891,6 +887,15 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
 	return ret;
 }
 
+static bool
+drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
+			  ktime_t *tvblank, bool in_vblank_irq)
+{
+	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
+
+	return drm_crtc_get_last_vbltimestamp(crtc, tvblank, in_vblank_irq);
+}
+
 /**
  * drm_crtc_vblank_count - retrieve "cooked" vblank counter value
  * @crtc: which counter to retrieve
@@ -980,6 +985,36 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
 
+/**
+ * drm_crtc_next_vblank_start - calculate the time of the next vblank
+ * @crtc: the crtc for which to calculate next vblank time
+ * @vblanktime: pointer to time to receive the next vblank timestamp.
+ *
+ * Calculate the expected time of the start of the next vblank period,
+ * based on time of previous vblank and frame duration
+ */
+int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
+{
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
+	struct drm_display_mode *mode = &vblank->hwmode;
+	u64 vblank_start;
+
+	if (!vblank->framedur_ns || !vblank->linedur_ns)
+		return -EINVAL;
+
+	if (!drm_crtc_get_last_vbltimestamp(crtc, vblanktime, false))
+		return -EINVAL;
+
+	vblank_start = DIV_ROUND_DOWN_ULL(
+			(u64)vblank->framedur_ns * mode->crtc_vblank_start,
+			mode->crtc_vtotal);
+	*vblanktime  = ktime_add(*vblanktime, ns_to_ktime(vblank_start));
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_next_vblank_start);
+
 static void send_vblank_event(struct drm_device *dev,
 		struct drm_pending_vblank_event *e,
 		u64 seq, ktime_t now)
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 733a3e2d1d10..7f3957943dd1 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime);
+int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e);
 void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
-- 
2.39.1

