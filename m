Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E26A4B0F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:36:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1276B10E479;
	Mon, 27 Feb 2023 19:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4201F10E45F;
 Mon, 27 Feb 2023 19:36:05 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id kb15so7357193pjb.1;
 Mon, 27 Feb 2023 11:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LNxsKWr79zliY+Ix7FyHLBv/jvOdd98Ee5355EN3fy4=;
 b=kPUcQyxxpm05goWDvLo1dDZedNX9BX61/F/oPQD/rogzHNKcrjBRHyp5HfUkm0jIMb
 oo4wwdgJQ3AOiWnQ/iqcejiRkYWP4xX2P+0yhJVSlqdITvFns0WnAe8h115A589YL0FS
 VmAPZq2WL/fFgPPhOQNxKo/84nIIo/FqP7rIHr7NlMaCbClO07d7yZATpDUzWZwROngN
 izR+1KnKVH+ixXnnAiAnYbvUXkbWMHpnLbhk4m5kDyedPbFEIM5fmgsREW6G66V8npSE
 lBpKO+3yZVWelSP1GxLN+4Z20eaMZ6Sxt2RT44EGp7FU7uYdG9WG0CMt4DYg3IH9N9LG
 2xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LNxsKWr79zliY+Ix7FyHLBv/jvOdd98Ee5355EN3fy4=;
 b=ayQMMcC6eUkR5CofuSS8ZjUH+rbxVsQfFffM5pe3/KuIUxLQdICrcAGs/WaCBeEw6n
 gCgbIeTsw3zNjl8ktTTPX1ivk28lkrEHzYruTGGGMFQ0bBm2qbX9NDWjrRvr9BEt48hK
 TlYrgebbf9cJoKekYZo4m2YgE8GYvstY1KPJYhdPPbNFuWGkMWrpwIVrlp7kebmdVnSs
 Iw5bGxwlbAKE5rsFe2R9dGmhQkM7uKZIC3ua9WB33abUV46Ac+WXEy3DhuNi2mn8wqJv
 LrVk7j3Ffu7yQSYUHo2J2PD49jCd/lutRlPD6aK9+wfr/rFL2fG8zByL6zr2+9zmoo9O
 7UDQ==
X-Gm-Message-State: AO0yUKUVHKkCDCeYwxP678vpugLVNCpi1vbAWlY6Pm3KfnSuZWbGNybI
 vI8NxC3TqE7nVb0N2U518aFSv7yT3HM=
X-Google-Smtp-Source: AK7set8aFROWB3JM7O+EwRDn3uJ6BxDpdV0bVN++OBmQjDQK2wy3/MuU7bDrxaniAacd9fi2QaT+ZA==
X-Received: by 2002:a17:902:ea0b:b0:19c:fc7b:69a4 with SMTP id
 s11-20020a170902ea0b00b0019cfc7b69a4mr8993303plg.65.1677526564596; 
 Mon, 27 Feb 2023 11:36:04 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001943d58268csm4965963plj.55.2023.02.27.11.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:36:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 07/15] dma-buf/sw_sync: Add fence deadline support
Date: Mon, 27 Feb 2023 11:35:13 -0800
Message-Id: <20230227193535.2822389-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227193535.2822389-1-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This consists of simply storing the most recent deadline, and adding an
ioctl to retrieve the deadline.  This can be used in conjunction with
the SET_DEADLINE ioctl on a fence fd for testing.  Ie. create various
sw_sync fences, merge them into a fence-array, set deadline on the
fence-array and confirm that it is propagated properly to each fence.

v2: Switch UABI to express deadline as u64
v3: More verbose UAPI docs, show how to convert from timespec

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sw_sync.c      | 58 ++++++++++++++++++++++++++++++++++
 drivers/dma-buf/sync_debug.h   |  2 ++
 include/uapi/linux/sync_file.h |  6 +++-
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 348b3a9170fa..3e2315ee955b 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -52,12 +52,28 @@ struct sw_sync_create_fence_data {
 	__s32	fence; /* fd of new fence */
 };
 
+/**
+ * struct sw_sync_get_deadline - get the deadline hint of a sw_sync fence
+ * @deadline_ns: absolute time of the deadline
+ * @pad:	must be zero
+ * @fence_fd:	the sw_sync fence fd (in)
+ *
+ * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
+ */
+struct sw_sync_get_deadline {
+	__u64	deadline_ns;
+	__u32	pad;
+	__s32	fence_fd;
+};
+
 #define SW_SYNC_IOC_MAGIC	'W'
 
 #define SW_SYNC_IOC_CREATE_FENCE	_IOWR(SW_SYNC_IOC_MAGIC, 0,\
 		struct sw_sync_create_fence_data)
 
 #define SW_SYNC_IOC_INC			_IOW(SW_SYNC_IOC_MAGIC, 1, __u32)
+#define SW_SYNC_GET_DEADLINE		_IOWR(SW_SYNC_IOC_MAGIC, 2, \
+		struct sw_sync_get_deadline)
 
 static const struct dma_fence_ops timeline_fence_ops;
 
@@ -171,6 +187,13 @@ static void timeline_fence_timeline_value_str(struct dma_fence *fence,
 	snprintf(str, size, "%d", parent->value);
 }
 
+static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
+
+	pt->deadline = deadline;
+}
+
 static const struct dma_fence_ops timeline_fence_ops = {
 	.get_driver_name = timeline_fence_get_driver_name,
 	.get_timeline_name = timeline_fence_get_timeline_name,
@@ -179,6 +202,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
 	.release = timeline_fence_release,
 	.fence_value_str = timeline_fence_value_str,
 	.timeline_value_str = timeline_fence_timeline_value_str,
+	.set_deadline = timeline_fence_set_deadline,
 };
 
 /**
@@ -387,6 +411,37 @@ static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
 	return 0;
 }
 
+static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long arg)
+{
+	struct sw_sync_get_deadline data;
+	struct dma_fence *fence;
+	struct sync_pt *pt;
+
+	if (copy_from_user(&data, (void __user *)arg, sizeof(data)))
+		return -EFAULT;
+
+	if (data.deadline_ns || data.pad)
+		return -EINVAL;
+
+	fence = sync_file_get_fence(data.fence_fd);
+	if (!fence)
+		return -EINVAL;
+
+	pt = dma_fence_to_sync_pt(fence);
+	if (!pt)
+		return -EINVAL;
+
+
+	data.deadline_ns = ktime_to_ns(pt->deadline);
+
+	dma_fence_put(fence);
+
+	if (copy_to_user((void __user *)arg, &data, sizeof(data)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,
 			  unsigned long arg)
 {
@@ -399,6 +454,9 @@ static long sw_sync_ioctl(struct file *file, unsigned int cmd,
 	case SW_SYNC_IOC_INC:
 		return sw_sync_ioctl_inc(obj, arg);
 
+	case SW_SYNC_GET_DEADLINE:
+		return sw_sync_ioctl_get_deadline(obj, arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 6176e52ba2d7..2e0146d0bdbb 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
  * @base: base fence object
  * @link: link on the sync timeline's list
  * @node: node in the sync timeline's tree
+ * @deadline: the most recently set fence deadline
  */
 struct sync_pt {
 	struct dma_fence base;
 	struct list_head link;
 	struct rb_node node;
+	ktime_t deadline;
 };
 
 extern const struct file_operations sw_sync_debugfs_fops;
diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_file.h
index 49325cf6749b..dc6645b2598b 100644
--- a/include/uapi/linux/sync_file.h
+++ b/include/uapi/linux/sync_file.h
@@ -72,7 +72,11 @@ struct sync_file_info {
  * @deadline_ns: absolute time of the deadline
  * @pad:	must be zero
  *
- * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
+ * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank).  For
+ * example:
+ *
+ *     clock_gettime(CLOCK_MONOTONIC, &t);
+ *     deadline_ns = (t.tv_sec * 1000000000L) + t.tv_nsec + duration_ns
  */
 struct sync_set_deadline {
 	__u64	deadline_ns;
-- 
2.39.1

