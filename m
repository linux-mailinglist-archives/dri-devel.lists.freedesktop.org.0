Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A48F479B49
	for <lists+dri-devel@lfdr.de>; Sat, 18 Dec 2021 15:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD94B113C3F;
	Sat, 18 Dec 2021 14:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06877113C3D
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 14:18:43 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso5610827pjl.3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Dec 2021 06:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h7o2My22C4zEs8u5sBzEXLVi9XzZfbfVpC3ps4NrMVs=;
 b=RgX4jka/ugHbiCQn03lTS5paJxnS+97s6nscQJ5NB4+mGWgnGQWH5M7EHFxcXDmkq+
 8WGZwB8htDvXzL3kD22RwQq6zS8usweuQHvvHo3wZHtTp2udZs89uk7auMZzqEh4vGYw
 TfL7IJ6Fp6jUlNMfec4DK3KNBE6l3749ysSNm+q7pe7WaoxuOvLiI7SPQkNbt+mKgeDr
 cNPQZktt6Rch2rXnjZ17xEBqQfveSpTW4r7+Tm9UTQ2sn+E1iJXmVIPF1ycdaX0RAX5i
 Ft2xnY94UPKpSVcD7vS5LvoGOuuVj9iyI4/rhI0dJ/vbpQyssamvfsGaneiNlqL4hZvI
 fGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h7o2My22C4zEs8u5sBzEXLVi9XzZfbfVpC3ps4NrMVs=;
 b=P4+tRsddHnreotmjy0crgTw4rVuBVBmMDJsqbTykG7pys0/mzRdjkyUGp3TEm+udAJ
 SetpUYLhpCXcnrfIIpVeolqGgrWE7OBU5y7537cBWSKOHQOjqb8YznyYLZxC9xnJejON
 DRx2U8ZGKEHt9WQZG+eORKD9WiPNrdTkiXoj8lrhTe6OVC8rX+HIVkVf9/yKifnMq6SC
 4jkH83VqZ3xv7bgsvWez1w4kmjt4N80IsOanfD3aUOZeFLe1Wxxa7uKwTf1o6DL/lHTE
 j9Ne4r8xiZ4KsRcZ3s4RS4LUqFEWEKFLHgN4ED057ws7EGEGib3E+cXxnNW5IbrvJGeS
 mDJg==
X-Gm-Message-State: AOAM532g+Fp+H8t9OGFa23HHWzjDcNGDz0Tqn07x1gIz/g11mm/i/GLN
 hGFQVrviexfLcch58Hgi6L1ep5hIHCeNOQ==
X-Google-Smtp-Source: ABdhPJwA1qSZlFxfbvANKvWT1BwsoUOvsFr7LjrZbtiu6OX+EFpBbcbKUoM/iJIzzsgP+CWiRx09eA==
X-Received: by 2002:a17:90b:3848:: with SMTP id
 nl8mr17606011pjb.221.1639837123434; 
 Sat, 18 Dec 2021 06:18:43 -0800 (PST)
Received: from localhost ([91.193.7.28])
 by smtp.gmail.com with UTF8SMTPSA id l22sm6441400pfc.167.2021.12.18.06.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Dec 2021 06:18:43 -0800 (PST)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm: make drm_syncobj_array_wait() use the range hrtimer
 feature
Date: Sat, 18 Dec 2021 23:18:39 +0900
Message-Id: <20211218141839.25078-1-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

select(), poll() and epoll_wait() all already supports high-precision
timeout handling. This patch makes drm_syncobj_array_wait() to handle
the timeout in high precision using the same heuristics and functions
implemented for select().

v2: Fix a name error resulting in NULL dereference.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/drm_syncobj.c | 75 ++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index c9a9d74f338c..b2f1631e7dc2 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -949,17 +949,30 @@ static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 	list_del_init(&wait->node);
 }
 
-static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
-						  void __user *user_points,
-						  uint32_t count,
-						  uint32_t flags,
-						  signed long timeout,
-						  uint32_t *idx)
+static int drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
+					  void __user *user_points,
+					  uint32_t count, uint32_t flags,
+					  struct timespec64 *timeout,
+					  uint32_t *idx)
 {
 	struct syncobj_wait_entry *entries;
 	struct dma_fence *fence;
 	uint64_t *points;
 	uint32_t signaled_count, i;
+	u64 slack = 0;
+	ktime_t expires, *to = NULL;
+	int ret = 0, timed_out = 0;
+
+	if (timeout->tv_sec | timeout->tv_nsec) {
+		slack = select_estimate_accuracy(timeout);
+		to = &expires;
+		*to = timespec64_to_ktime(*timeout);
+	} else {
+		/*
+		 * Avoid scheduling a hrtimer wait if timeout is zero.
+		 */
+		timed_out = 1;
+	}
 
 	if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT)
 		lockdep_assert_none_held_once();
@@ -973,13 +986,13 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 
 	} else if (copy_from_user(points, user_points,
 				  sizeof(uint64_t) * count)) {
-		timeout = -EFAULT;
+		ret = -EFAULT;
 		goto err_free_points;
 	}
 
 	entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
 	if (!entries) {
-		timeout = -ENOMEM;
+		ret = -ENOMEM;
 		goto err_free_points;
 	}
 	/* Walk the list of sync objects and initialize entries.  We do
@@ -999,7 +1012,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 			if (flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT) {
 				continue;
 			} else {
-				timeout = -EINVAL;
+				ret = -EINVAL;
 				goto cleanup_entries;
 			}
 		}
@@ -1063,17 +1076,18 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		if (signaled_count == count)
 			goto done_waiting;
 
-		if (timeout == 0) {
-			timeout = -ETIME;
+		if (timed_out) {
+			ret = -ETIME;
 			goto done_waiting;
 		}
 
 		if (signal_pending(current)) {
-			timeout = -ERESTARTSYS;
+			ret = -ERESTARTSYS;
 			goto done_waiting;
 		}
 
-		timeout = schedule_timeout(timeout);
+		timed_out =
+			!schedule_hrtimeout_range(to, slack, HRTIMER_MODE_ABS);
 	} while (1);
 
 done_waiting:
@@ -1092,7 +1106,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 err_free_points:
 	kfree(points);
 
-	return timeout;
+	return ret;
 }
 
 /**
@@ -1134,28 +1148,27 @@ static int drm_syncobj_array_wait(struct drm_device *dev,
 				  struct drm_syncobj_timeline_wait *timeline_wait,
 				  struct drm_syncobj **syncobjs, bool timeline)
 {
-	signed long timeout = 0;
+	int ret = 0;
+	struct timespec64 timeout;
 	uint32_t first = ~0;
 
 	if (!timeline) {
-		timeout = drm_timeout_abs_to_jiffies(wait->timeout_nsec);
-		timeout = drm_syncobj_array_wait_timeout(syncobjs,
-							 NULL,
-							 wait->count_handles,
-							 wait->flags,
-							 timeout, &first);
-		if (timeout < 0)
-			return timeout;
+		timeout = ns_to_timespec64(wait->timeout_nsec);
+		ret = drm_syncobj_array_wait_timeout(syncobjs, NULL,
+						     wait->count_handles,
+						     wait->flags, &timeout,
+						     &first);
+		if (ret < 0)
+			return ret;
 		wait->first_signaled = first;
 	} else {
-		timeout = drm_timeout_abs_to_jiffies(timeline_wait->timeout_nsec);
-		timeout = drm_syncobj_array_wait_timeout(syncobjs,
-							 u64_to_user_ptr(timeline_wait->points),
-							 timeline_wait->count_handles,
-							 timeline_wait->flags,
-							 timeout, &first);
-		if (timeout < 0)
-			return timeout;
+		timeout = ns_to_timespec64(timeline_wait->timeout_nsec);
+		ret = drm_syncobj_array_wait_timeout(
+			syncobjs, u64_to_user_ptr(timeline_wait->points),
+			timeline_wait->count_handles, timeline_wait->flags,
+			&timeout, &first);
+		if (ret < 0)
+			return ret;
 		timeline_wait->first_signaled = first;
 	}
 	return 0;
-- 
2.34.1

