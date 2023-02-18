Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5335069BC47
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D9910E583;
	Sat, 18 Feb 2023 21:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B408710E2AD;
 Sat, 18 Feb 2023 21:16:01 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 gt5-20020a17090af2c500b00233d7314c1cso1364439pjb.5; 
 Sat, 18 Feb 2023 13:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BeT3eeje/0prkMD9aTb8VuKmOmOAv3BQtDZq4dQFtV0=;
 b=LEPTgqQXjPBIv6OJo5ZWA1QLhrsJvXEhstgLAJwkloTK4moLEy+vZpTDra5KovBp3D
 L0KwqZIUYKlh0g2SDx0DN78qInGqrFBUIOjD4RtUAKJEp6WlNwrISLW6hUUEcgjlB3fV
 pt4NXzkHvLy41OgQOZcBBdUhgGuZv/LN3fCPivXDlJa4VMsDN9a7QCxoeLlHb4nYYYFZ
 +3HjMDma/RiEUALJ9+B4CBqb1LU0VK23Dy4iGFy03I1qD+uBQR39lWYI/rQ7Zeqvm5sC
 HmAgA4dTY1eTJDNev4BdCTrpqu4onCmHoRJ4huO3/x5OtcRW+TTyVSDEITqqPV4can3w
 5pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BeT3eeje/0prkMD9aTb8VuKmOmOAv3BQtDZq4dQFtV0=;
 b=yz+jgMJ2EKdjA6dAjJ1EW5MH4E7osxJq4wNx4RsCGwwwU8/XwTOf0na/jCkSUt/PRm
 v8ij7EJm7sZzzB4cKHjBRGGMXxz8bEhfUL8420Sp05r57nq98b0XXFZYfeGTBiE3TtCs
 /mdH6IdKRJ9W8rSxQUru3VWBliKf2Unnru7fp1aesvdN8mVjbnn4ZTGRzGtBVi6PtVla
 BDymZVj2lkeEGanbbyIDkTYccTOtgiA3pAT3lzkvLYG821JR5Gw5M3vrzZw6yEPp+pXC
 WrtVaZbwR2ssQO0TZF9+fnhjwUtsgaK5yYaBAyqKrjHxkR4fDPEbvXt3cCCcwVMOlOZT
 lrEQ==
X-Gm-Message-State: AO0yUKVZ2r6NBAwS+uHZUT4qWs2aai7w92PEiqcG7nuIW0E5JvjBDlT5
 ET6oeHvaLiBtyv75oFaXQjxtxIdTEkA=
X-Google-Smtp-Source: AK7set+Yy1Uc97a3bobx2YoP89UqbFIhDUp3mSHn5gt1wMK0bGQgDojMpevhNx0hQiChONZfvm6PqA==
X-Received: by 2002:a17:902:c94a:b0:19a:f556:e389 with SMTP id
 i10-20020a170902c94a00b0019af556e389mr3002294pla.65.1676754960820; 
 Sat, 18 Feb 2023 13:16:00 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 jk6-20020a170903330600b0019a96a6543esm5080546plb.184.2023.02.18.13.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:16:00 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/14] drm/syncobj: Add deadline support for syncobj waits
Date: Sat, 18 Feb 2023 13:15:52 -0800
Message-Id: <20230218211608.1630586-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a new flag to let userspace provide a deadline as a hint for syncobj
and timeline waits.  This gives a hint to the driver signaling the
backing fences about how soon userspace needs it to compete work, so it
can addjust GPU frequency accordingly.  An immediate deadline can be
given to provide something equivalent to i915 "wait boost".

Signed-off-by: Rob Clark <robdclark@chromium.org>
---

I'm a bit on the fence about the addition of the DRM_CAP, but it seems
useful to give userspace a way to probe whether the kernel and driver
supports the new wait flag, especially since we have vk-common code
dealing with syncobjs.  But open to suggestions.

 drivers/gpu/drm/drm_ioctl.c   |  3 ++
 drivers/gpu/drm/drm_syncobj.c | 59 ++++++++++++++++++++++++++++-------
 include/drm/drm_drv.h         |  6 ++++
 include/uapi/drm/drm.h        | 16 ++++++++--
 4 files changed, 71 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 7c9d66ee917d..1c5c942cf0f9 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -254,6 +254,9 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 	case DRM_CAP_SYNCOBJ_TIMELINE:
 		req->value = drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE);
 		return 0;
+	case DRM_CAP_SYNCOBJ_DEADLINE:
+		req->value = drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE);
+		return 0;
 	}
 
 	/* Other caps only work with KMS drivers */
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..61cf97972a60 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -973,7 +973,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  uint32_t count,
 						  uint32_t flags,
 						  signed long timeout,
-						  uint32_t *idx)
+						  uint32_t *idx,
+						  ktime_t *deadline)
 {
 	struct syncobj_wait_entry *entries;
 	struct dma_fence *fence;
@@ -1053,6 +1054,15 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 			drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
 	}
 
+	if (deadline) {
+		for (i = 0; i < count; ++i) {
+			fence = entries[i].fence;
+			if (!fence)
+				continue;
+			dma_fence_set_deadline(fence, *deadline);
+		}
+	}
+
 	do {
 		set_current_state(TASK_INTERRUPTIBLE);
 
@@ -1151,7 +1161,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 				  struct drm_file *file_private,
 				  struct drm_syncobj_wait *wait,
 				  struct drm_syncobj_timeline_wait *timeline_wait,
-				  struct drm_syncobj **syncobjs, bool timeline)
+				  struct drm_syncobj **syncobjs, bool timeline,
+				  ktime_t *deadline)
 {
 	signed long timeout = 0;
 	uint32_t first = ~0;
@@ -1162,7 +1173,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 							 NULL,
 							 wait->count_handles,
 							 wait->flags,
-							 timeout, &first);
+							 timeout, &first,
+							 deadline);
 		if (timeout < 0)
 			return timeout;
 		wait->first_signaled = first;
@@ -1172,7 +1184,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 							 u64_to_user_ptr(timeline_wait->points),
 							 timeline_wait->count_handles,
 							 timeline_wait->flags,
-							 timeout, &first);
+							 timeout, &first,
+							 deadline);
 		if (timeout < 0)
 			return timeout;
 		timeline_wait->first_signaled = first;
@@ -1243,13 +1256,20 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_syncobj_wait *args = data;
 	struct drm_syncobj **syncobjs;
+	unsigned possible_flags;
+	ktime_t t, *tp = NULL;
 	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
 		return -EOPNOTSUPP;
 
-	if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
-			    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))
+	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT;
+
+	if (drm_core_check_feature(dev, DRIVER_SYNCOBJ_DEADLINE))
+		possible_flags |= DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
+
+	if (args->flags & ~possible_flags)
 		return -EINVAL;
 
 	if (args->count_handles == 0)
@@ -1262,8 +1282,13 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
+	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
+		t = ktime_set(args->deadline_sec, args->deadline_nsec);
+		tp = &t;
+	}
+
 	ret = drm_syncobj_array_wait(dev, file_private,
-				     args, NULL, syncobjs, false);
+				     args, NULL, syncobjs, false, tp);
 
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 
@@ -1276,14 +1301,21 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_syncobj_timeline_wait *args = data;
 	struct drm_syncobj **syncobjs;
+	unsigned possible_flags;
+	ktime_t t, *tp = NULL;
 	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
 		return -EOPNOTSUPP;
 
-	if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
-			    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
-			    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
+	possible_flags = DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE;
+
+	if (drm_core_check_feature(dev, DRIVER_SYNCOBJ_DEADLINE))
+		possible_flags |= DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
+
+	if (args->flags & ~possible_flags)
 		return -EINVAL;
 
 	if (args->count_handles == 0)
@@ -1296,8 +1328,13 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
+	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
+		t = ktime_set(args->deadline_sec, args->deadline_nsec);
+		tp = &t;
+	}
+
 	ret = drm_syncobj_array_wait(dev, file_private,
-				     NULL, args, syncobjs, true);
+				     NULL, args, syncobjs, true, tp);
 
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 1d76d0686b03..9aa24f097e22 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -104,6 +104,12 @@ enum drm_driver_feature {
 	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
 	 */
 	DRIVER_COMPUTE_ACCEL            = BIT(7),
+	/**
+	 * @DRIVER_SYNCOBJ_DEADLINE:
+	 *
+	 * Driver supports &dma_fence_ops.set_deadline
+	 */
+	DRIVER_SYNCOBJ_DEADLINE         = BIT(8),
 
 	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
 
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 642808520d92..c6b85bb13810 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -767,6 +767,13 @@ struct drm_gem_open {
  * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
  */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
+/**
+ * DRM_CAP_SYNCOBJ_DEADLINE
+ *
+ * If set to 1, the driver supports DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag
+ * on the SYNCOBJ_TIMELINE_WAIT/SYNCOBJ_WAIT ioctls.
+ */
+#define DRM_CAP_SYNCOBJ_DEADLINE	0x15
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
 struct drm_get_cap {
@@ -887,6 +894,7 @@ struct drm_syncobj_transfer {
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
+#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline based to deadline_nsec/sec */
 struct drm_syncobj_wait {
 	__u64 handles;
 	/* absolute timeout */
@@ -894,7 +902,9 @@ struct drm_syncobj_wait {
 	__u32 count_handles;
 	__u32 flags;
 	__u32 first_signaled; /* only valid when not waiting all */
-	__u32 pad;
+	/* Deadline to set on backing fence(s) in CLOCK_MONOTONIC: */
+	__u32 deadline_nsec;
+	__u64 deadline_sec;
 };
 
 struct drm_syncobj_timeline_wait {
@@ -906,7 +916,9 @@ struct drm_syncobj_timeline_wait {
 	__u32 count_handles;
 	__u32 flags;
 	__u32 first_signaled; /* only valid when not waiting all */
-	__u32 pad;
+	/* Deadline to set on backing fence(s) in CLOCK_MONOTONIC: */
+	__u32 deadline_nsec;
+	__u64 deadline_sec;
 };
 
 
-- 
2.39.1

