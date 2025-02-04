Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDAA27F95
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 00:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F3510E03E;
	Tue,  4 Feb 2025 23:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="orCccSLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6205610E03E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 23:30:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 42A2BA412CB;
 Tue,  4 Feb 2025 23:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C1BC4CEDF;
 Tue,  4 Feb 2025 23:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738711800;
 bh=YOlrxkZ8d22LPE81YpV1JzX5Qd2R8B1n0xsY6MbNM/w=;
 h=From:To:Cc:Subject:Date:From;
 b=orCccSLHeL/JnWevwnadrdLjPia3jN/UXkyKZjypID+DtrZhmThL98XDzlk7HcuyF
 MOBe4oyUuYWWVc9LZnf5HF9T8M4TTzRUfdNy4VEn0HGXSqDhHGLU3UILIU/LiwymT6
 hBmjyLbbVw+vkSHOV49kp79I355rI5hoVkky6OZxnAQwFdOJ5vg5laYyrx6HbUrimt
 Q1brzR51m9yKD1q9GOJ93sRypuSHNC+8VIhuUKPcEon4yeReyZV/gsXxZOxafzfI7D
 pmhqoBpZxBIcKkh5qAPhAYeWKSDoOaotCfOI52hBUwYMLJiiDCyEuB4sikY7VuMKwT
 2+kvpi012Thdg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: Beata Michalska <beata.michalska@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: [PATCH] drm/panthor: Convert IOCTL defines to an enum
Date: Tue,  4 Feb 2025 17:28:24 -0600
Message-ID: <20250204232824.3819437-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use an enum instead of #defines for panthor IOCTLs. This allows the
header to be used with Rust code as bindgen can't handle complex
defines.

Cc: Beata Michalska <beata.michalska@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/uapi/drm/panthor_drm.h | 86 +++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 42 deletions(-)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index b99763cbae48..97e2c4510e69 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -129,48 +129,6 @@ enum drm_panthor_ioctl_id {
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
 };
 
-/**
- * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
- * @__access: Access type. Must be R, W or RW.
- * @__id: One of the DRM_PANTHOR_xxx id.
- * @__type: Suffix of the type being passed to the IOCTL.
- *
- * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
- * values instead.
- *
- * Return: An IOCTL number to be passed to ioctl() from userspace.
- */
-#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
-	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
-			   struct drm_panthor_ ## __type)
-
-#define DRM_IOCTL_PANTHOR_DEV_QUERY \
-	DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query)
-#define DRM_IOCTL_PANTHOR_VM_CREATE \
-	DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create)
-#define DRM_IOCTL_PANTHOR_VM_DESTROY \
-	DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy)
-#define DRM_IOCTL_PANTHOR_VM_BIND \
-	DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind)
-#define DRM_IOCTL_PANTHOR_VM_GET_STATE \
-	DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state)
-#define DRM_IOCTL_PANTHOR_BO_CREATE \
-	DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create)
-#define DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET \
-	DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset)
-#define DRM_IOCTL_PANTHOR_GROUP_CREATE \
-	DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create)
-#define DRM_IOCTL_PANTHOR_GROUP_DESTROY \
-	DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy)
-#define DRM_IOCTL_PANTHOR_GROUP_SUBMIT \
-	DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit)
-#define DRM_IOCTL_PANTHOR_GROUP_GET_STATE \
-	DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state)
-#define DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE \
-	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create)
-#define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
-	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy)
-
 /**
  * DOC: IOCTL arguments
  */
@@ -1019,6 +977,50 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
+ * @__access: Access type. Must be R, W or RW.
+ * @__id: One of the DRM_PANTHOR_xxx id.
+ * @__type: Suffix of the type being passed to the IOCTL.
+ *
+ * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
+ * values instead.
+ *
+ * Return: An IOCTL number to be passed to ioctl() from userspace.
+ */
+#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
+	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
+			   struct drm_panthor_ ## __type)
+
+enum {
+	DRM_IOCTL_PANTHOR_DEV_QUERY =
+		DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query),
+	DRM_IOCTL_PANTHOR_VM_CREATE =
+		DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create),
+	DRM_IOCTL_PANTHOR_VM_DESTROY =
+		DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy),
+	DRM_IOCTL_PANTHOR_VM_BIND =
+		DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind),
+	DRM_IOCTL_PANTHOR_VM_GET_STATE =
+		DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state),
+	DRM_IOCTL_PANTHOR_BO_CREATE =
+		DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create),
+	DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET =
+		DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset),
+	DRM_IOCTL_PANTHOR_GROUP_CREATE =
+		DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create),
+	DRM_IOCTL_PANTHOR_GROUP_DESTROY =
+		DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy),
+	DRM_IOCTL_PANTHOR_GROUP_SUBMIT =
+		DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit),
+	DRM_IOCTL_PANTHOR_GROUP_GET_STATE =
+		DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state),
+	DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE =
+		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
+	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
+		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.47.2

