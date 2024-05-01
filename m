Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D475F8B8FE0
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 20:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0F410E418;
	Wed,  1 May 2024 18:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XQmRb5Dw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D44110E6D1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 18:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714589454;
 bh=fmR6Y2iZ0ul/zqlZu3wJj92Mn58/IbpPaqkgp5e3wv8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XQmRb5DwY/6A+Hdy0xsYDTItkKHOV0yc7BERY054zF/pfTy9fOL0fVVSSUxzFnqbh
 ywkVJWhBgdSjwUc0DUWjQV4BJxKSN0unimawA8BsY+MMzSDehl+AZVzxeJyuk4iqoK
 YSpsCtag4JH2h7vSpjMcZc2Me/wqi8IOymL9+Dh7t/DLoP0mjF4u08Oqqi3LPkL/5i
 I4sLhk3u3d9Hn6bWgGIVke/UIRwYxx5982DfJyJl1w9ANqw09KyV3BeyXJsb8+xoeS
 r7Koi8K3ip5d5apQrP80ZoDc2WwKDtTrTVxvt2nbY46plHSli5/m1drZ8j6h4MVv6/
 OUJZBi0EB2QPA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5F4CF37820A4;
 Wed,  1 May 2024 18:50:54 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, Adrian Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v2 1/1] drm: Add ioctl for querying a DRM device's list of
 open client PIDs
Date: Wed,  1 May 2024 19:50:43 +0100
Message-ID: <20240501185047.3126832-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240501185047.3126832-1-adrian.larumbe@collabora.com>
References: <20240501185047.3126832-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Up to this day, all fdinfo-based GPU profilers must traverse the entire
/proc directory structure to find open DRM clients with fdinfo file
descriptors. This is inefficient and time-consuming.

This patch adds a new DRM ioctl that allows users to obtain a list of PIDs
for clients who have opened the DRM device. Output from the ioctl isn't
human-readable, and it's meant to be retrieved only by GPU profilers like
gputop and nvtop.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_internal.h |  1 +
 drivers/gpu/drm/drm_ioctl.c    | 89 ++++++++++++++++++++++++++++++++++
 include/uapi/drm/drm.h         |  7 +++
 3 files changed, 97 insertions(+)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 690505a1f7a5..6f78954cae16 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -243,6 +243,7 @@ static inline void drm_debugfs_encoder_remove(struct drm_encoder *encoder)
 drm_ioctl_t drm_version;
 drm_ioctl_t drm_getunique;
 drm_ioctl_t drm_getclient;
+drm_ioctl_t drm_getclients;
 
 /* drm_syncobj.c */
 void drm_syncobj_open(struct drm_file *file_private);
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index e368fc084c77..da7057376581 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -207,6 +207,93 @@ int drm_getclient(struct drm_device *dev, void *data,
 	}
 }
 
+/*
+ * Get list of client PIDs who have opened a DRM file
+ *
+ * \param dev DRM device we are querying
+ * \param data IOCTL command input.
+ * \param file_priv DRM file private.
+ *
+ * \return zero on success or a negative number on failure.
+ *
+ * Traverses list of open clients for the given DRM device, and
+ * copies them into userpace as an array of PIDs
+ */
+int drm_getclients(struct drm_device *dev, void *data,
+		   struct drm_file *file_priv)
+
+{
+	struct drm_get_clients *get_clients = data;
+	ssize_t size = get_clients->len;
+	char __user *pid_buf;
+	ssize_t offset = 0;
+	int ret = 0;
+
+	/*
+	 * We do not want to show clients of display only devices so
+	 * as to avoid confusing UM GPU profilers
+	 */
+	if (!dev->render) {
+		get_clients->len = 0;
+		return 0;
+	}
+
+	/*
+	 * An input size of zero means UM wants to know the size of the PID buffer
+	 * We round it up to the nearest multiple of the page size so that we can have
+	 * some spare headroom in case more clients came in between successive calls
+	 * of this ioctl, and also to simplify parsing of the PIDs buffer, because
+	 * sizeof(pid_t) will hopefully always divide PAGE_SIZE
+	 */
+	if (size == 0) {
+		get_clients->len =
+			roundup(atomic_read(&dev->open_count) * sizeof(pid_t), PAGE_SIZE);
+		return 0;
+	}
+
+	pid_buf = (char *)(void *)get_clients->user_data;
+
+	if (!pid_buf)
+		return -EINVAL;
+
+	mutex_lock(&dev->filelist_mutex);
+	list_for_each_entry_reverse(file_priv, &dev->filelist, lhead) {
+		pid_t pid_num;
+
+		if ((size - offset) < sizeof(pid_t))
+			break;
+
+		rcu_read_lock();
+		pid_num = pid_vnr(rcu_dereference(file_priv->pid));
+		rcu_read_unlock();
+
+		/* We do not want to return the profiler's PID */
+		if (pid_vnr(task_tgid(current)) == pid_num)
+			continue;
+
+		ret = copy_to_user(pid_buf + offset, &pid_num, sizeof(pid_t));
+		if (ret)
+			break;
+
+		offset += sizeof(pid_t);
+	}
+	mutex_unlock(&dev->filelist_mutex);
+
+	if (ret)
+		return -EFAULT;
+
+	if ((size - offset) >= sizeof(pid_t)) {
+		pid_t pid_zero = 0;
+
+		ret = copy_to_user(pid_buf + offset,
+				   &pid_zero, sizeof(pid_t));
+		if (ret)
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
 /*
  * Get statistics information.
  *
@@ -672,6 +759,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
+
+	DRM_IOCTL_DEF(DRM_IOCTL_GET_CLIENTS, drm_getclients, DRM_RENDER_ALLOW),
 };
 
 #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE(drm_ioctls)
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 16122819edfe..c47aa9de51ab 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1024,6 +1024,11 @@ struct drm_crtc_queue_sequence {
 	__u64 user_data;	/* user data passed to event */
 };
 
+struct drm_get_clients {
+	__u64 user_data;
+	__kernel_size_t len;
+};
+
 #if defined(__cplusplus)
 }
 #endif
@@ -1236,6 +1241,8 @@ extern "C" {
 #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_transfer)
 #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_syncobj_timeline_array)
 
+#define DRM_IOCTL_GET_CLIENTS		DRM_IOWR(0xD1, struct drm_get_clients)
+
 /**
  * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.
  *
-- 
2.44.0

