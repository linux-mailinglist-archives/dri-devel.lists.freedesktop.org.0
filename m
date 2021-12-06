Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2906469401
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8D56FE55;
	Mon,  6 Dec 2021 10:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3396FE55
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 10:38:11 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so5766315pjq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 02:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dA76sFQGGLTAjFJFSZG9xT8s2UVoeE3F0mroIofiVWQ=;
 b=jv9fKrsCZQ9kc9faJJQ/x6E0Q1hu/Fps75EzXBQZBpZK/XOhllQIRill3i0hFJZw+3
 ORJvUBYAFvRyWd0zlHgRo+BXLkloI0dLatyd/4N8nKdPv1/zjLE6742rKNTAkJMjrA8s
 YJAjr0knnBTW22egi+tv1Xuy25ZKZvLWn3LieMOqoPzKW7Byxi5Z75sa+f+NS/UVxqL4
 /8QowLTZQ/BBVbLniDKfqizeMoLOF/YHXia6PgDSElumxuZ+Vz/tFiGWxDRUFLAGowqj
 6tj+cNWOU9ovfhsdOdm+A+DFQiYUx8WVIMBzChBKW0D50cS9TUshQV2fP/XFi1FYothO
 YT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dA76sFQGGLTAjFJFSZG9xT8s2UVoeE3F0mroIofiVWQ=;
 b=bsibeXKUT+y0KQWQtE/m+Cqp4rdcZG6am/S2Bnb9ArcUzaPFR32JpAdILlGCKARlum
 IWT9+WKwhfQiDflRm5ywv6MCyqkfHWVNb1PBhmVLq+pq9ULLnTjdtqGr2bi5pVVjwNwA
 JXUEk7ThF6SINbb2NKQoCb2778xxfbNqB3aXgeSjbBczxytiTy/ykfrv4CWg3eFtkgJt
 PO/4LFFyGKfc01Mq0Qzmi/8grRiRwDapljXwYTyk1uhckAY34Ya9pVZlUA3ko4toEwIQ
 QwIyUtJ/ag95677lPSMG+3ZUnCJ1wGJj9+8fqT2ZRvN2OEbQnLjATtadtAua/FZCy8Kw
 1UVg==
X-Gm-Message-State: AOAM533sox02htBxS0K7DCF+nD8DFuvIGT+FaV/0PW7h29bjl6jdURRA
 fdskrRNs7rIgjzmyvYnRiWlCH2ES7pDRmg==
X-Google-Smtp-Source: ABdhPJy90xv28FI0xeA6ITAzJgG/tw1usgBh0biwUB7mvWREte2Wuo8wDrEJyuqfwQ/Z2cx5j5/xmg==
X-Received: by 2002:a17:90b:1d81:: with SMTP id
 pf1mr37159991pjb.79.1638787091419; 
 Mon, 06 Dec 2021 02:38:11 -0800 (PST)
Received: from localhost (221x248x146x74.ap221.ftth.ucom.ne.jp.
 [221.248.146.74])
 by smtp.gmail.com with UTF8SMTPSA id f21sm12741630pfe.69.2021.12.06.02.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 02:38:11 -0800 (PST)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: make drm_syncobj_array_wait() use the range hrtimer
 feature
Date: Mon,  6 Dec 2021 19:37:33 +0900
Message-Id: <20211206103733.5440-1-ishitatsuyuki@gmail.com>
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
+		timeout = ns_to_timespec64(wait->timeout_nsec);
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

