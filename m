Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF726A8D8D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34EB10E5BA;
	Thu,  2 Mar 2023 23:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000DC10E5BD;
 Thu,  2 Mar 2023 23:54:20 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id y10so521389pfi.8;
 Thu, 02 Mar 2023 15:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677801260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ip3Zm9fB4YGz5nKO4uRGWvdUBo1kk9r+HbO76l3v604=;
 b=NPnuc36DwWV6jfH6r3yVJ4b59Wf35Duqu6e1nD7BgWf2yneUDE6kVoCoE+xb389eMT
 EZ/ikHqIomQkk+RGfyNR+DzhA8rz5MR99SlyiJPrYYe1dkFP8OF1LpL+bjCISYGfsAnW
 eXzV6jM2sM5KOmtQjt29kK+XX2RXrDudysKCCUDXIvydIFPw7ydGZ+GKydpRuA25pQDy
 fsJa+0QwtfU+3uPb5Di9+IJSFSO01jcMmUW1ignhuMUv9igemtSrGFTwGp8BjbkxblaH
 kICCw+tMtNgLFdrlyzQ/tWg6WEXNm2A6NcVFZvv9qnxSnyb2vrlh5z8g294FUtDwh2lu
 04NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677801260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ip3Zm9fB4YGz5nKO4uRGWvdUBo1kk9r+HbO76l3v604=;
 b=a8bEXmNm8jQWYFltHhcHKkAiMSc8wRyupWGqmt2z4m/bnTN5jYRT9tdBGP4DgC7uAm
 bp1LefnQJblsexH0tsaIK6dH43QBh8MndLD0Mk1HsawxGuPJB78N/JTOwFtPra/rv4tk
 gGBPbWwrT47oTxczAeoQ8S2pLKD3GwrTXQEtACVPUQBVU17RjyQmTZk3PLcZSWZuZN2i
 zk9cEXik8JALg1hB/O+OtLEpSytLpDSg6c0N2r9ps44AwqFgLFhB0/PVS3g+IM3u4w2u
 ae3c9/XAck+h4ff401H2sGphjFWoqRXveoIhJ0AHBwQkXqsCxCAF2ZtJnOUXyiu4P2bD
 fukQ==
X-Gm-Message-State: AO0yUKUiLotJwe9eGzzpQJggafp+OLmCVLLZl/vKP/aY9MzcjGRV3ary
 gSOdKj8MdSJ5zEte2VyPoVunndB8oPc=
X-Google-Smtp-Source: AK7set9ewq8g2UINVf25gy6LzGcHT8o0VBZ0takvw3RJyEoTXa7FhIG3EiWkXQhyiXUYSioIGvwevg==
X-Received: by 2002:a62:1741:0:b0:5b9:49a5:5ddc with SMTP id
 62-20020a621741000000b005b949a55ddcmr262457pfx.3.1677801260254; 
 Thu, 02 Mar 2023 15:54:20 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 u4-20020aa78484000000b00575d1ba0ecfsm234624pfn.133.2023.03.02.15.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:54:19 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 10/15] drm/vblank: Add helper to get next vblank time
Date: Thu,  2 Mar 2023 15:53:32 -0800
Message-Id: <20230302235356.3148279-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302235356.3148279-1-robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
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
Reviewed-by: Mario Kleiner <mario.kleiner.de@gmail.com>
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

