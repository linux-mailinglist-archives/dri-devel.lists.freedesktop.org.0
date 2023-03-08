Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912B26B0DAC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075E310E67F;
	Wed,  8 Mar 2023 15:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A01F10E642;
 Wed,  8 Mar 2023 15:53:50 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id kb15so16928924pjb.1;
 Wed, 08 Mar 2023 07:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678290829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChTxF1xZ7r/XF73WateEMBpOfC5AHxM3Gq5YCewKpj4=;
 b=e3I1R7/ClAatO5T4ZAA9WHkjtifskKqF5LQQ1WxX61e0hbfxRlzytPAme5lTUmF0BM
 R0EsYAXPoJp6b5Ha/pq2tG7J+gFb3i0bFEfYSmE7c4R5puJnwrv8ZlI42mULk+sKQ21Q
 Fjq1WzpbEGLHMfRxGKP0EY3l4TnmXTSwbXzU3RBoWhDkNOSm2D6WC8z6DulILbl9TLq9
 Pd4BMlkvcQqJvnAHaAZeLbm9kvhbC/OJbU3P6AaO99A75uVpQHi/JOox2mlbyahk8VMH
 2CnNpymWoWDjWw+2/y3FHuFtDBOJ2Z3ESccekUjOHyVWMXfo8eCwI+fvcC9ts4D5eQQc
 Fl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678290829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ChTxF1xZ7r/XF73WateEMBpOfC5AHxM3Gq5YCewKpj4=;
 b=XPEApqlFqE3fq6muvq0KzSnbmvf9gYvPGwi2gizZv/IfZHuoqzG1dLx3Lclg8Ru6xn
 0EFdfg99HF+uVxAU36JkWZLGynd6iLlzmGytTZ7xgGpovI/aPvM6Yl0yhJagmhsBYtay
 1Z2Xpfd6cwDBbRI7vxMcOpImR1nJqla+aj20SikD1hH0DqBr2uFTVFKRBFsgPop/1oOq
 BnwZAYW7ikkcuZj6ZEsy+JUPagDGKfyIHpcyrcNb9U/w8pooEY6wbUdakmEe9yFgKWiX
 dW+MimqDWKgvX08i6KD0053QEXaYfVdxWyRUx90BVS+v7zWAV8S+dslgjTj2R5eV+Ygr
 +ITQ==
X-Gm-Message-State: AO0yUKVh6ygQlaVB7k+8Q6bU0xi9LT+cQLHN3xkHVd6XajRuOdXs1eov
 4RyWqff2sLd5tSEH3nsA/7t0jU5Wf4w=
X-Google-Smtp-Source: AK7set/GK9hZA2YgCMBTsCwSHWSk1ANtJFD0Aywy5njpPOrjJisO7kigvdw/lvaR7HR8dHif1FpR0w==
X-Received: by 2002:a05:6a20:a121:b0:cd:87ef:3f1a with SMTP id
 q33-20020a056a20a12100b000cd87ef3f1amr22640317pzk.3.1678290829586; 
 Wed, 08 Mar 2023 07:53:49 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a62ab10000000b0059261bd5bacsm9462925pff.202.2023.03.08.07.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:53:49 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v10 10/15] drm/vblank: Add helper to get next vblank time
Date: Wed,  8 Mar 2023 07:53:01 -0800
Message-Id: <20230308155322.344664-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Turner <mattst88@gmail.com>,
 freedreno@lists.freedesktop.org
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
2.39.2

