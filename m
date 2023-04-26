Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0301C6EFA28
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB1010E99D;
	Wed, 26 Apr 2023 18:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4017810E995;
 Wed, 26 Apr 2023 18:41:40 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63b35789313so5403795b3a.3; 
 Wed, 26 Apr 2023 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682534499; x=1685126499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SYpdWPBKF6WtvjS6a95BWqItPJIuC0oKimDsWIUQ4Q8=;
 b=sFN+mXF7tDhvfEqtwRAOVcywLlHnmCxmo3SkqkYCwX+aD6EpwcgaYuTqrCvBQjzDix
 gicnyQ+E1rw4sAtqiFpg2XESPWemVwoSlDVp0kVzEBbSBWozPtvGSpabuqh4UBrrr2Id
 7Frc0QzPt0PMp63P6YvQZFv2VjKlflSnBcPdlLlkr8AQtnMJSVYiJj1+LaKqxu8ADaSG
 /Fj4dR3bedGWQk9Y7x/rWFSpGbdaJI5yN+vFiMza60BIKMJKHhPSGfRElZMVpY/gicDY
 cyCoWaTNHWWhYfk19MFx+riNunmuxEAzBXJJdm5TVB4HMg23FbDaAyYhS8y0EjGshuTn
 n4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682534499; x=1685126499;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SYpdWPBKF6WtvjS6a95BWqItPJIuC0oKimDsWIUQ4Q8=;
 b=KhWGaJKqDg+HrQpffq4tzCjLexe6YdEHmsr1vv9GZkD72GW2dte/KhxmlLVUVu26ik
 52w0Ei7sJqeVQkgoTRDIQ9QCysrsWzZIhCICpbg2CGIHptmHG0rtMz/PAgl2Et+z2n2a
 Jf4b6AojClO7ccxOOZE0LipWRgL0wSePS0Z5b5BxJx+qPwTjTDkfCfslQ8bxRnIkHcx/
 ow7P7PSu4RNSDrz5UZ9lymi8dETSvMXci3oTAYYG57GVOaOFacH1HO2ZB+uu3jn0LApU
 ahYJJK3Ut65TP2biMTjYCSo8l90VB4Rjgd+r4hCm8psxicGvMCIthUcZiPFynUlDEyR+
 +Evw==
X-Gm-Message-State: AAQBX9d9RYjsGwXzYAW+gd2bfhRPZ6o1Ut24I/zNS6ybP+TIHmg/7rPz
 Am0DhvoWaOBneItWbiioOdMMcUUtzBE=
X-Google-Smtp-Source: AKy350Y28ghKhL5CtmgJLuAj4gwRtgOUa1NPg+23FyPvJPmR0DnxUxSzzaMd/0Xi4bzvresYErsnSg==
X-Received: by 2002:a05:6a00:2387:b0:640:dbe4:190c with SMTP id
 f7-20020a056a00238700b00640dbe4190cmr13730052pfc.4.1682534498911; 
 Wed, 26 Apr 2023 11:41:38 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 t6-20020aa79386000000b0063b6bc2be16sm11972570pfe.141.2023.04.26.11.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 11:41:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/syncobj: Add deadline support for syncobj waits
Date: Wed, 26 Apr 2023 11:41:30 -0700
Message-Id: <20230426184131.1173689-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a new flag to let userspace provide a deadline as a hint for syncobj
and timeline waits.  This gives a hint to the driver signaling the
backing fences about how soon userspace needs it to compete work, so it
can addjust GPU frequency accordingly.  An immediate deadline can be
given to provide something equivalent to i915 "wait boost".

v2: Use absolute u64 ns value for deadline hint, drop cap and driver
    feature flag in favor of allowing count_handles==0 as a way for
    userspace to probe kernel for support of new flag
v3: More verbose comments about UAPI
v4: Fix negative zero, s/deadline_ns/deadline_nsec/ for consistency with
    existing ioctl struct fields

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Discussion on mesa MR (https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2197)
seems to have died down.  So resending this as a singlton.  This version
has some minor cosmetic cleanups compared to the previous iteration.

There are some other remaining UABI bits, waiting for someone to have a
chance to implement userspace for, such as sync_file SET_DEADLINE ioctl,
which can be found: https://patchwork.freedesktop.org/series/93035/

 drivers/gpu/drm/drm_syncobj.c | 64 ++++++++++++++++++++++++++++-------
 include/uapi/drm/drm.h        | 17 ++++++++++
 2 files changed, 68 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0c2be8360525..3f86e2b84200 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -126,6 +126,11 @@
  * synchronize between the two.
  * This requirement is inherited from the Vulkan fence API.
  *
+ * If &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE is set, the ioctl will also set
+ * a fence deadline hint on the backing fences before waiting, to provide the
+ * fence signaler with an appropriate sense of urgency.  The deadline is
+ * specified as an absolute &CLOCK_MONOTONIC value in units of ns.
+ *
  * Similarly, &DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT takes an array of syncobj
  * handles as well as an array of u64 points and does a host-side wait on all
  * of syncobj fences at the given points simultaneously.
@@ -973,7 +978,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  uint32_t count,
 						  uint32_t flags,
 						  signed long timeout,
-						  uint32_t *idx)
+						  uint32_t *idx,
+						  ktime_t *deadline)
 {
 	struct syncobj_wait_entry *entries;
 	struct dma_fence *fence;
@@ -1053,6 +1059,15 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
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
 
@@ -1151,7 +1166,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 				  struct drm_file *file_private,
 				  struct drm_syncobj_wait *wait,
 				  struct drm_syncobj_timeline_wait *timeline_wait,
-				  struct drm_syncobj **syncobjs, bool timeline)
+				  struct drm_syncobj **syncobjs, bool timeline,
+				  ktime_t *deadline)
 {
 	signed long timeout = 0;
 	uint32_t first = ~0;
@@ -1162,7 +1178,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 							 NULL,
 							 wait->count_handles,
 							 wait->flags,
-							 timeout, &first);
+							 timeout, &first,
+							 deadline);
 		if (timeout < 0)
 			return timeout;
 		wait->first_signaled = first;
@@ -1172,7 +1189,8 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 							 u64_to_user_ptr(timeline_wait->points),
 							 timeline_wait->count_handles,
 							 timeline_wait->flags,
-							 timeout, &first);
+							 timeout, &first,
+							 deadline);
 		if (timeout < 0)
 			return timeout;
 		timeline_wait->first_signaled = first;
@@ -1243,17 +1261,22 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
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
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
+
+	if (args->flags & ~possible_flags)
 		return -EINVAL;
 
 	if (args->count_handles == 0)
-		return -EINVAL;
+		return 0;
 
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
@@ -1262,8 +1285,13 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
+	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
+		t = ns_to_ktime(args->deadline_nsec);
+		tp = &t;
+	}
+
 	ret = drm_syncobj_array_wait(dev, file_private,
-				     args, NULL, syncobjs, false);
+				     args, NULL, syncobjs, false, tp);
 
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 
@@ -1276,18 +1304,23 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
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
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE |
+			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
+
+	if (args->flags & ~possible_flags)
 		return -EINVAL;
 
 	if (args->count_handles == 0)
-		return -EINVAL;
+		return 0;
 
 	ret = drm_syncobj_array_find(file_private,
 				     u64_to_user_ptr(args->handles),
@@ -1296,8 +1329,13 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
+	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
+		t = ns_to_ktime(args->deadline_nsec);
+		tp = &t;
+	}
+
 	ret = drm_syncobj_array_wait(dev, file_private,
-				     NULL, args, syncobjs, true);
+				     NULL, args, syncobjs, true, tp);
 
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 642808520d92..cd38b0891f25 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -887,6 +887,7 @@ struct drm_syncobj_transfer {
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
 #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time point to become available */
+#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadline based to deadline_ns */
 struct drm_syncobj_wait {
 	__u64 handles;
 	/* absolute timeout */
@@ -895,6 +896,14 @@ struct drm_syncobj_wait {
 	__u32 flags;
 	__u32 first_signaled; /* only valid when not waiting all */
 	__u32 pad;
+	/**
+	 * @deadline_nsec - fence deadline hint
+	 *
+	 * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
+	 * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
+	 * set.
+	 */
+	__u64 deadline_nsec;
 };
 
 struct drm_syncobj_timeline_wait {
@@ -907,6 +916,14 @@ struct drm_syncobj_timeline_wait {
 	__u32 flags;
 	__u32 first_signaled; /* only valid when not waiting all */
 	__u32 pad;
+	/**
+	 * @deadline_nsec - fence deadline hint
+	 *
+	 * Deadline hint, in absolute CLOCK_MONOTONIC, to set on backing
+	 * fence(s) if the DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE flag is
+	 * set.
+	 */
+	__u64 deadline_nsec;
 };
 
 
-- 
2.39.2

