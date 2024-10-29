Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAA99B45EC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 10:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F94710E26F;
	Tue, 29 Oct 2024 09:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YcrHjNIQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86BD10E26F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730195212;
 bh=jO/0ofNBaKCWq+EL2FSBDH6ILVmBeRvWwrD8+aFAWuo=;
 h=From:To:Cc:Subject:Date:From;
 b=YcrHjNIQPMjMTbEjP/AoJq5Cbg/N6MHWQAgZPGgahh+wUiszB6wGKYRzpIY/P48Dy
 fiC6D/871Xbac+v+9jKEZ5+do41mwbKunzUQYFYV20tVPRcAQMcaukrRjHKyOBkX4z
 xK9hLfFzYETSCtgoHtdmMTHe655aI8410DoK6U5+VoljmWh0RRj4ZsTv+EJYe96ERc
 jMRyQ82kwdNf6sRoc52Xx2a1rW/tdmgUbF/bLj01VwVKaTQGYPkCSMxDrOo8BjGKHl
 6hFQLtufjyqo6dVNauYqHskxQw4D5vMd0xbnt7563KrM7evi/86grex3t2Gu7Mhl4y
 RigmH+/92kdiQ==
Received: from kusma-desktop.localdomain (ip109-169-110-64.brdy.online
 [109.169.110.64])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kusma)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EF56717E120E;
 Tue, 29 Oct 2024 10:46:51 +0100 (CET)
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, kernel@collabora.com,
 Erik Faye-Lund <erik.faye-lund@collabora.com>
Subject: [PATCH] drm/panthor: use defines for sync flags
Date: Tue, 29 Oct 2024 10:46:29 +0100
Message-ID: <20241029094629.1019295-1-erik.faye-lund@collabora.com>
X-Mailer: git-send-email 2.45.2
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

Enums are always signed, and assigning 1u << 31 to it invokes
implementation defined behavior. It's not a great idea to depend on this
in the UAPI, and it turns out no other UAPI does either.

So let's do what other UAPI does, and use defines instead. This way we
won't get unexpected issues if compiling user-space with a compiler with
a different implementation-defined behavior here.
---
 include/uapi/drm/panthor_drm.h | 44 +++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 87c9cb555dd1d..a2e348f901376 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -209,27 +209,39 @@ struct drm_panthor_obj_array {
 	{ .stride = sizeof((ptr)[0]), .count = (cnt), .array = (__u64)(uintptr_t)(ptr) }
 
 /**
- * enum drm_panthor_sync_op_flags - Synchronization operation flags.
+ * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK
+ *
+ * Synchronization handle type mask.
  */
-enum drm_panthor_sync_op_flags {
-	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK: Synchronization handle type mask. */
-	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK = 0xff,
+#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK              0xff
 
-	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ: Synchronization object type. */
-	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ = 0,
+/**
+ * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ
+ *
+ * Synchronization object type.
+ */
+#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ           0
 
-	/**
-	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ: Timeline synchronization
-	 * object type.
-	 */
-	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ = 1,
+/**
+ * DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ
+ *
+ * Timeline synchronization object type.
+ */
+#define DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ  1
 
-	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
-	DRM_PANTHOR_SYNC_OP_WAIT = 0 << 31,
+/**
+ * DRM_PANTHOR_SYNC_OP_WAIT
+ *
+ * Wait operation.
+ */
+#define DRM_PANTHOR_SYNC_OP_WAIT    (0 << 31)
 
-	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
-	DRM_PANTHOR_SYNC_OP_SIGNAL = (int)(1u << 31),
-};
+/**
+ * DRM_PANTHOR_SYNC_OP_SIGNAL
+ *
+ * Signal operation.
+ */
+#define DRM_PANTHOR_SYNC_OP_SIGNAL  (1u << 31)
 
 /**
  * struct drm_panthor_sync_op - Synchronization operation.
-- 
2.45.2

