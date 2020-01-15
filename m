Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF2D13D5D5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764416EC22;
	Thu, 16 Jan 2020 08:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe63.google.com (mail-vs1-xe63.google.com
 [IPv6:2607:f8b0:4864:20::e63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73256EA9E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 20:57:37 +0000 (UTC)
Received: by mail-vs1-xe63.google.com with SMTP id x18so11331318vsq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MoaLqRsXbsF8WWfj7JkWTIfWhuB0czfd/jbk7/+hexM=;
 b=ksKqKO6Uhobvq/K9pBY4ix3j3Vkphyaa/mEZ535OVhGl9gLs0a7c8MJ5OmR87Vf+10
 5mEsnaytE8agpwaKvl+1JEpKFyCVqGXGk86ZEtZDhZl64V1b7FlM27TjWUdL+TViZxBr
 roDScgykIksCyMPlsZf2jsPV2NY9Y3e/rhuaNaqSrYV1O65LVpJ2eBs1boUQZfSdB88/
 FS2am7QPK8rOs/bSwXlNR0jhR4M4myAQGPv8450qrCSUmpsW6VzDcm5oAIwLOsYH31rw
 Cuu/fvR7S3p40ad5eRyeky7sPs/tRlm3g9z2FKx2uIfPngHMJLMwqXmStnxes1H731++
 kwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MoaLqRsXbsF8WWfj7JkWTIfWhuB0czfd/jbk7/+hexM=;
 b=DBc1TPGmsk4nQcYHBf3jN/o9GuWa0jIWum8RiIedQGVMJ/yRJYFYz7nBdDu0CuLrko
 WFBHDhr2GHiaMM2vM9vd+1h13DeMLprwsxnmsMlAI3GAnJWQHhg3fGsq5AAXv9AHnNWD
 0OYqnZXT5bCYnyLc1xFnje9c6ti6nv8lw4XsE+TAda9WBjn2gERvKSc0k3vahm8MPD2B
 Sk64HFc3nIsExtVrbvygUw/2zXjeQJgkBpAPz2txyFjGtYef9hy+JqnDJgIf6McmRMdm
 4xPcLdqsWqnJQwN97SQgd0kkrE6miUztlkXJ6SHNfQg9cngza5X1bzKpZuTzBmvcb+o2
 KyOw==
X-Gm-Message-State: APjAAAWoobYhBfvIl5LeWLVhUGMViQ/1P6p3PVoCtUFOpk8vuq+y2TOr
 nTxJmQcBOrG3eLPbewjCEsYYuu2kSS2hJ3pqM01xU44CAt+j3w==
X-Google-Smtp-Source: APXvYqx5I5VrFSVu9xq8Xm4JtWThqjJdeqMg8fv8mfJ+xc7a8lZAi7mI+C25Nup37fai/gBlYNHBcUaY6hQs
X-Received: by 2002:a67:6746:: with SMTP id b67mr5544300vsc.193.1579121856991; 
 Wed, 15 Jan 2020 12:57:36 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id j26sm1472756uak.1.2020.01.15.12.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 12:57:36 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
Date: Wed, 15 Jan 2020 15:56:49 -0500
Message-Id: <20200115205649.12971-3-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200115205649.12971-1-brian@brkho.com>
References: <20200115205649.12971-1-brian@brkho.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Jan 2020 08:21:03 +0000
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
Cc: robdclark@chromium.org, Brian Ho <brian@brkho.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, hoegsberg@chromium.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implements an ioctl to wait until a value at a given iova is greater
than or equal to a supplied value.

This will initially be used by turnip (open-source Vulkan driver for
QC in mesa) for occlusion queries where the userspace driver can
block on a query becoming available before continuing via
vkGetQueryPoolResults.

Signed-off-by: Brian Ho <brian@brkho.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
 include/uapi/drm/msm_drm.h    | 14 ++++++++
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c84f0a8b3f2c..92853c795c5c 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -36,10 +36,11 @@
  *           MSM_GEM_INFO ioctl.
  * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
  *           GEM object's debug name
- * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
+ * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
+ * - 1.6.0 - Add WAIT_IOVA ioctl
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	5
+#define MSM_VERSION_MINOR	6
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
@@ -952,6 +953,61 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 	return msm_submitqueue_remove(file->driver_priv, id);
 }
 
+static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_gem_object *obj;
+	struct drm_msm_wait_iova *args = data;
+	ktime_t timeout = to_ktime(args->timeout);
+	unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
+	struct msm_gpu *gpu = priv->gpu;
+	void *base_vaddr;
+	uint64_t ref_value = args->value & args->mask;
+	uint64_t *vaddr;
+	int ret;
+
+	if (args->pad)
+		return -EINVAL;
+
+	if (!gpu)
+		return -ENODEV;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	if (args->offset + sizeof(*vaddr) < args->offset ||
+		args->offset + sizeof(*vaddr) > obj->size) {
+		ret = -EINVAL;
+		goto err_put_gem_object;
+	}
+
+	base_vaddr = msm_gem_get_vaddr(obj);
+	if (IS_ERR(base_vaddr)) {
+		ret = PTR_ERR(base_vaddr);
+		goto err_put_gem_object;
+	}
+
+	vaddr = base_vaddr + args->offset;
+
+	/* TODO: Support 64 bit reference values with a flag. */
+	ret = wait_event_interruptible_timeout(gpu->event,
+			(int32_t)((uint32_t)*vaddr - (uint32_t)ref_value) >= 0,
+			remaining_jiffies);
+
+	if (ret == 0)
+		ret = -ETIMEDOUT;
+	else if (ret > 0)
+		ret = 0;
+
+    msm_gem_put_vaddr(obj);
+
+err_put_gem_object:
+	drm_gem_object_put_unlocked(obj);
+	return ret;
+}
+
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
@@ -964,6 +1020,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova, DRM_RENDER_ALLOW),
 };
 
 static const struct vm_operations_struct vm_ops = {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 0b85ed6a3710..d4eac312f56e 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -298,6 +298,18 @@ struct drm_msm_submitqueue_query {
 	__u32 pad;
 };
 
+/* This ioctl blocks until the value at bo + offset is greater than or equal
+ * to the reference value.
+ */
+struct drm_msm_wait_iova {
+	__u32 handle;          /* in, GEM handle */
+	__u32 pad;
+	struct drm_msm_timespec timeout;   /* in */
+	__u64 offset;          /* in, offset into bo */
+	__u64 mask;            /* in, mask of the value at bo + offset */
+	__u64 value;           /* in, reference value, 32 bits */
+};
+
 #define DRM_MSM_GET_PARAM              0x00
 /* placeholder:
 #define DRM_MSM_SET_PARAM              0x01
@@ -315,6 +327,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
+#define DRM_MSM_WAIT_IOVA      0x0D
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
@@ -327,6 +340,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
+#define DRM_IOCTL_MSM_WAIT_IOVA        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)
 
 #if defined(__cplusplus)
 }
-- 
2.25.0.rc1.283.g88dfdc4193-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
