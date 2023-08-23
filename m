Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7423D7862CE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 23:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B68110E480;
	Wed, 23 Aug 2023 21:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFCD10E479;
 Wed, 23 Aug 2023 21:56:15 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-26d1e5f2c35so4199181a91.2; 
 Wed, 23 Aug 2023 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692827774; x=1693432574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U38bdq29Dgw0wCI6R6HBdmbsK4pnEF7143GlmYr1GwQ=;
 b=Mrp6jmUu4GpWFoHogKWjjzeO8Ax1IMjdXWlBJAyGzSAElDqk5H7ZtCmITp4Sqe+vny
 j6iUs/esYyj3bXbRkTT5SbVQoqkrYQZGOpsIQmhySD/rpljYsfMrd3tkYpMNDvMYTAZi
 WACdRZ/DJll+s+LvToCsB45E+xQdGvQvDwb12Q8C1Clo9AHvrlgUgzF1YHeCvhEe2Lom
 jdsyFO7ARX169jOQOcId8oFe7lZthRfWJ+IBIL5H/BA3QmypSNyccRSmpjPsxibGsX2e
 cz+DNLYhO8WlbsPY2NMwrso3/OTGR+Mi4kLoSqMSO3al8DTWJgpU2Ct8I4vLXXQJxLhy
 AqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692827774; x=1693432574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U38bdq29Dgw0wCI6R6HBdmbsK4pnEF7143GlmYr1GwQ=;
 b=iwOXId3dnZz/zt3e80isMNmfbUpkuVsQAW7BTBQxFMg03/nrP/z4puzFDmDP4njtpC
 ZrOd7w4UNy3fu6hfm3L5x4aDIkoEEyep/KIWQtUtCeFqy5PuliwL5XEAXQ/SVyZt/4YY
 iHrPPSlTuuadC37SgNhIAQJi9vJ/HhuDqWuq0fmfQn4fCUu/EJWQh24xOq0NFYHaj8/L
 f64tiEc3ufm9y8ZGrg0/enfTSgnQSROVAK426J2vzPUCzJU0XfumyGkgs7yaP904h3vx
 tizZAoCBVhdsQoDT+UbKGbzJI/Mf2jKc4y67T6vyQNEOD8Rvq3UwZb4//7J1vGDxluGC
 6QAQ==
X-Gm-Message-State: AOJu0Yw4FveTulvnIpsJeUfdMdnP0xghzTEy3GiOEBsAAbnmuqHLfQ8E
 1IBTp/zee+UnUxlNWWeRUVGSOPLh0gY=
X-Google-Smtp-Source: AGHT+IEK9f5kg8gg9H6xaZEI7BweoTyMRpa0VDsD1a1KvfcF409tN8lu1SQutdkpLIAzoxCQZvZB/A==
X-Received: by 2002:a17:90a:bc98:b0:268:b682:23de with SMTP id
 x24-20020a17090abc9800b00268b68223demr13483090pjr.28.1692827774403; 
 Wed, 23 Aug 2023 14:56:14 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 23-20020a17090a1a1700b00263e4dc33aasm271029pjk.11.2023.08.23.14.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 14:56:13 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 3/3] dma-buf/sw_sync: Add fence deadline support
Date: Wed, 23 Aug 2023 14:54:56 -0700
Message-ID: <20230823215458.203366-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823215458.203366-1-robdclark@gmail.com>
References: <20230823215458.203366-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Gustavo Padovan <gustavo@padovan.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
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
v4: Better comments, track the soonest deadline, as a normal fence
    implementation would, return an error if no deadline set.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/dma-buf/sw_sync.c    | 82 ++++++++++++++++++++++++++++++++++++
 drivers/dma-buf/sync_debug.h |  2 +
 2 files changed, 84 insertions(+)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f0a35277fd84..c353029789cf 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -52,12 +52,33 @@ struct sw_sync_create_fence_data {
 	__s32	fence; /* fd of new fence */
 };
 
+/**
+ * struct sw_sync_get_deadline - get the deadline hint of a sw_sync fence
+ * @deadline_ns: absolute time of the deadline
+ * @pad:	must be zero
+ * @fence_fd:	the sw_sync fence fd (in)
+ *
+ * Return the earliest deadline set on the fence.  The timebase for the
+ * deadline is CLOCK_MONOTONIC (same as vblank).  If there is no deadline
+ * set on the fence, this ioctl will return -ENOENT.
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
+
+
+#define SW_SYNC_HAS_DEADLINE_BIT	DMA_FENCE_FLAG_USER_BITS
 
 static const struct dma_fence_ops timeline_fence_ops;
 
@@ -171,6 +192,22 @@ static void timeline_fence_timeline_value_str(struct dma_fence *fence,
 	snprintf(str, size, "%d", parent->value);
 }
 
+static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
+	unsigned long flags;
+
+	spin_lock_irqsave(fence->lock, flags);
+	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
+		if (ktime_before(deadline, pt->deadline))
+			pt->deadline = deadline;
+	} else {
+		pt->deadline = deadline;
+		__set_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags);
+	}
+	spin_unlock_irqrestore(fence->lock, flags);
+}
+
 static const struct dma_fence_ops timeline_fence_ops = {
 	.get_driver_name = timeline_fence_get_driver_name,
 	.get_timeline_name = timeline_fence_get_timeline_name,
@@ -179,6 +216,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
 	.release = timeline_fence_release,
 	.fence_value_str = timeline_fence_value_str,
 	.timeline_value_str = timeline_fence_timeline_value_str,
+	.set_deadline = timeline_fence_set_deadline,
 };
 
 /**
@@ -387,6 +425,47 @@ static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
 	return 0;
 }
 
+static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long arg)
+{
+	struct sw_sync_get_deadline data;
+	struct dma_fence *fence;
+	unsigned long flags;
+	struct sync_pt *pt;
+	int ret = 0;
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
+	spin_lock_irqsave(fence->lock, flags);
+	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
+		data.deadline_ns = ktime_to_ns(pt->deadline);
+	} else {
+		ret = -ENOENT;
+	}
+	spin_unlock_irqrestore(fence->lock, flags);
+
+	dma_fence_put(fence);
+
+	if (ret)
+		return ret;
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
@@ -399,6 +478,9 @@ static long sw_sync_ioctl(struct file *file, unsigned int cmd,
 	case SW_SYNC_IOC_INC:
 		return sw_sync_ioctl_inc(obj, arg);
 
+	case SW_SYNC_GET_DEADLINE:
+		return sw_sync_ioctl_get_deadline(obj, arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
index 6176e52ba2d7..a1bdd62efccd 100644
--- a/drivers/dma-buf/sync_debug.h
+++ b/drivers/dma-buf/sync_debug.h
@@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
  * @base: base fence object
  * @link: link on the sync timeline's list
  * @node: node in the sync timeline's tree
+ * @deadline: the earliest fence deadline hint
  */
 struct sync_pt {
 	struct dma_fence base;
 	struct list_head link;
 	struct rb_node node;
+	ktime_t deadline;
 };
 
 extern const struct file_operations sw_sync_debugfs_fops;
-- 
2.41.0

