Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E39FA13A2E0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629C76E316;
	Tue, 14 Jan 2020 08:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc64.google.com (mail-yw1-xc64.google.com
 [IPv6:2607:f8b0:4864:20::c64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816F46E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 15:37:49 +0000 (UTC)
Received: by mail-yw1-xc64.google.com with SMTP id 192so6343297ywy.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 07:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brkho-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=loDIHBoPYn2n1QOh85N5e2eDCf5hlfrUH2iJe1lXbAU=;
 b=JzTeFNQlIcxcKxsUt4WBb8hrFA5YPZaFijIKGvuDSFMwdwDHmqP+1UYQ5if0ikCuvU
 4KRRfiPXa766MYXZHZoy/FtEVZPfN6Zv/8AKhQ1CW8T7a6GXHxBU9P7XQy6tEJ4hv7mU
 crp2IwkesyxUt7jPDuVUbQvk4Hvh+Fzy0I4b/h3zaVlsfKwmdvZu2Lrdgo1FYocJanIa
 I/r1ukjZxsfTOxX6t6c5FfANAfYcw/ww5qn0rvkLa+SK+RFms70oogsnmTiLnbjdwX4x
 LkQbRq5Em1icHZ6PeY5Yzqzj4Kac72h9zRIafr2DqPBXnQDcJ/T1WVd+xaQVZ4PqWcjd
 BQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=loDIHBoPYn2n1QOh85N5e2eDCf5hlfrUH2iJe1lXbAU=;
 b=U1HwsWWmKDhFk0mk1odBWjV6Ll/ErSZpnlhWc/MaiP4uhSjSwYuemSpA+Se+VC2umG
 21TS6t62zr+3QJtnVi2HXCZ4A4L7YSkDPkmITYk5FH4Qy+dWLXUyS149UAtTGfnoJkzW
 ATzzWyuXKFBFBs6AH1dfpYuIeGXPUZ7/TgtaACtfUEii4BXuYUQjeGlQ/lp81JJKGJO/
 nnD1SW1+DK3qs3aatY9wu7xDjKBruwZFJl/IVNXfUMsP968JQl1k7hKNKjAlVcPhyUsG
 M2/oGACS+BfmOmMGbWICyuQQ5esJaeqgZKUkz3pCFqH5Ed4RlYEMNmbqMU/QTFCfmy4y
 4ODw==
X-Gm-Message-State: APjAAAXDhL6yfnFNYs6LpwedAQABvKQTixiw8R0UzeoWG0rNe+JtUrXB
 tRdKVQCmotJcw2+0MmeoLBAgkO4m67XIrXg+cG/36z5OfHhfBA==
X-Google-Smtp-Source: APXvYqzMjmiQB7wQayg8gcOf8UiLu0z7+b2h25Mhv2JtXmHzedOaKlIp6R+p2rKcfYiuvs/alD7Snejg9ij7
X-Received: by 2002:a25:3883:: with SMTP id
 f125mr14312395yba.271.1578929868538; 
 Mon, 13 Jan 2020 07:37:48 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
 by smtp-relay.gmail.com with ESMTPS id m193sm1672393ywd.0.2020.01.13.07.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 07:37:48 -0800 (PST)
X-Relaying-Domain: brkho.com
From: Brian Ho <brian@brkho.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
Date: Mon, 13 Jan 2020 10:36:05 -0500
Message-Id: <20200113153605.52350-3-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200113153605.52350-1-brian@brkho.com>
References: <20200113153605.52350-1-brian@brkho.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 hoegsberg@chromium.org, Sean Paul <sean@poorly.run>
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
 drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
 include/uapi/drm/msm_drm.h    | 13 ++++++++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c84f0a8b3f2c..dcc46874a5a2 100644
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
@@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
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
+	uint64_t *vaddr;
+	int ret;
+
+	if (args->pad)
+		return -EINVAL;
+
+	if (!gpu)
+		return 0;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	base_vaddr = msm_gem_get_vaddr(obj);
+	if (IS_ERR(base_vaddr)) {
+		ret = PTR_ERR(base_vaddr);
+		goto err_put_gem_object;
+	}
+	if (args->offset + sizeof(*vaddr) > obj->size) {
+		ret = -EINVAL;
+		goto err_put_vaddr;
+	}
+
+	vaddr = base_vaddr + args->offset;
+
+	/* Assumes WC mapping */
+	ret = wait_event_interruptible_timeout(
+			gpu->event, *vaddr >= args->value, remaining_jiffies);
+
+	if (ret == 0) {
+		ret = -ETIMEDOUT;
+		goto err_put_vaddr;
+	} else if (ret == -ERESTARTSYS) {
+		goto err_put_vaddr;
+	}
+
+	msm_gem_put_vaddr(obj);
+	drm_gem_object_put_unlocked(obj);
+	return 0;
+
+err_put_vaddr:
+	msm_gem_put_vaddr(obj);
+err_put_gem_object:
+	drm_gem_object_put_unlocked(obj);
+	return ret;
+}
+
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
@@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova, DRM_RENDER_ALLOW),
 };
 
 static const struct vm_operations_struct vm_ops = {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 0b85ed6a3710..8477f28a4ee1 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {
 	__u32 pad;
 };
 
+/* This ioctl blocks until the u64 value at bo + offset is greater than or
+ * equal to the reference value.
+ */
+struct drm_msm_wait_iova {
+	__u32 handle;          /* in, GEM handle */
+	__u32 pad;
+	struct drm_msm_timespec timeout;   /* in */
+	__u64 offset;          /* offset into bo */
+	__u64 value;           /* reference value */
+};
+
 #define DRM_MSM_GET_PARAM              0x00
 /* placeholder:
 #define DRM_MSM_SET_PARAM              0x01
@@ -315,6 +326,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
+#define DRM_MSM_WAIT_IOVA      0x0D
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
@@ -327,6 +339,7 @@ struct drm_msm_submitqueue_query {
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
