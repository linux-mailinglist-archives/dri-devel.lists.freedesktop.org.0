Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1CEA5E615
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D481510E7B7;
	Wed, 12 Mar 2025 21:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kKeHVLny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FEA10E7C3;
 Wed, 12 Mar 2025 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813521; x=1773349521;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YZ9ca+bUR5Q6o0YEDPY1nL7lmVrteJT6rkEB/OoxAWQ=;
 b=kKeHVLnyy0GAUe8RP9oQa5iiX9z6jBWefpAINz+CBYI9cTNuAdR9I8AE
 4bOmkaIvMYJQIRGoyh2j7g07sYpZnoKsmglEvP8zAeOYZ7j/GJe5GuxK4
 eOXAiYj27dBnMzuxqmIEWRmUofaVcOVQZnspL/KQY8sXxIKEn2tZ0mBPj
 TbhK6vp9RcVStxb28GXsnA+xzAoLfx3RlFzQv/ChQfcoE//lsR8yjLl4x
 5nG6dwp+yRa3wvFzURpONa9gAH5oV77hmJ4rszD60vtyg5Jr+raLEpQnw
 YdSV29jvRqMn8kXcR7klAPGJ1hvopGrnyzeZm/9gUdW4x6YOEPkMGVR6K A==;
X-CSE-ConnectionGUID: qsG2UchAT7+ZMCOgisTA1A==
X-CSE-MsgGUID: AEURFIbESzKy6O2g8ZnGEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562204"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562204"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:21 -0700
X-CSE-ConnectionGUID: 3OPBxlLCQ+2wPD1o03Tz/Q==
X-CSE-MsgGUID: 3KFD2v0VShSu9TntxxNQIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791131"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:17 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 09/19] drm/pagemap_util: Add a utility to assign an owner
 to a set of interconnected gpus
Date: Wed, 12 Mar 2025 22:04:06 +0100
Message-ID: <20250312210416.3120-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

The hmm_range_fault() and the migration helpers currently need a common
"owner" to identify pagemaps and clients with fast interconnect.
Add a drm_pagemap utility to setup such owners by registering
drm_pagemaps, in a registry, and for each new drm_pagemap,
query which existing drm_pagemaps have fast interconnects with the new
drm_pagemap.

The "owner" scheme is limited in that it is static at drm_pagemap creation.
Ideally one would want the owner to be adjusted at run-time, but that
requires changes to hmm. If the proposed scheme becomes too limited,
we need to revisit.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Makefile           |   3 +-
 drivers/gpu/drm/drm_pagemap_util.c | 125 +++++++++++++++++++++++++++++
 include/drm/drm_pagemap_util.h     |  55 +++++++++++++
 3 files changed, 182 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
 create mode 100644 include/drm/drm_pagemap_util.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6e3520bff769..bd7bdf973897 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -107,7 +107,8 @@ obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
 
 drm_gpusvm_helper-y := \
 	drm_gpusvm.o\
-	drm_pagemap.o
+	drm_pagemap.o\
+	drm_pagemap_util.o
 obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
new file mode 100644
index 000000000000..ae8f78cde4a7
--- /dev/null
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/slab.h>
+
+#include <drm/drm_pagemap.h>
+#include <drm/drm_pagemap_util.h>
+
+/**
+ * struct drm_pagemap_owner - Device interconnect group
+ * @kref: Reference count.
+ *
+ * A struct drm_pagemap_owner identifies a device interconnect group.
+ */
+struct drm_pagemap_owner {
+	struct kref kref;
+};
+
+static void drm_pagemap_owner_release(struct kref *kref)
+{
+	kfree(container_of(kref, struct drm_pagemap_owner, kref));
+}
+
+/**
+ * drm_pagemap_release_owner() - Stop participating in an interconnect group
+ * @peer: Pointer to the struct drm_pagemap_peer used when joining the group
+ *
+ * Stop participating in an interconnect group. This function is typically
+ * called when a pagemap is removed to indicate that it doesn't need to
+ * be taken into account.
+ */
+void drm_pagemap_release_owner(struct drm_pagemap_peer *peer)
+{
+	struct drm_pagemap_owner_list *owner_list = peer->list;
+
+	if (!owner_list)
+		return;
+
+	mutex_lock(&owner_list->lock);
+	list_del(&peer->link);
+	kref_put(&peer->owner->kref, drm_pagemap_owner_release);
+	peer->owner = NULL;
+	mutex_unlock(&owner_list->lock);
+}
+EXPORT_SYMBOL(drm_pagemap_release_owner);
+
+/**
+ * typedef interconnect_fn - Callback function to identify fast interconnects
+ * @peer1: First endpoint.
+ * @peer2: Second endpont.
+ *
+ * The function returns %true iff @peer1 and @peer2 have a fast interconnect.
+ * Note that this is symmetrical. The function has no notion of client and provider,
+ * which may not be sufficient in some cases. However, since the callback is intended
+ * to guide in providing common pagemap owners, the notion of a common owner to
+ * indicate fast interconnects would then have to change as well.
+ *
+ * Return: %true iff @peer1 and @peer2 have a fast interconnect. Otherwise @false.
+ */
+typedef bool (*interconnect_fn)(struct drm_pagemap_peer *peer1, struct drm_pagemap_peer *peer2);
+
+/**
+ * drm_pagemap_acquire_owner() - Join an interconnect group
+ * @peer: A struct drm_pagemap_peer keeping track of the device interconnect
+ * @owner_list: Pointer to the owner_list, keeping track of all interconnects
+ * @has_interconnect: Callback function to determine whether two peers have a
+ * fast local interconnect.
+ *
+ * Repeatedly calls @has_interconnect for @peer and other peers on @owner_list to
+ * determine a set of peers for which @peer has a fast interconnect. That set will
+ * have common &struct drm_pagemap_owner, and upon successful return, @peer::owner
+ * will point to that struct, holding a reference, and @peer will be registered in
+ * @owner_list. If @peer doesn't have any fast interconnects to other @peers, a
+ * new unique &struct drm_pagemap_owner will be allocated for it, and that
+ * may be shared with other peers that, at a later point, are determined to have
+ * a fast interconnect with @peer.
+ *
+ * When @peer no longer participates in an interconnect group,
+ * drm_pagemap_release_owner() should be called to drop the reference on the
+ * struct drm_pagemap_owner.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
+			      struct drm_pagemap_owner_list *owner_list,
+			      interconnect_fn has_interconnect)
+{
+	struct drm_pagemap_peer *cur_peer;
+	struct drm_pagemap_owner *owner = NULL;
+	bool interconnect = false;
+
+	mutex_lock(&owner_list->lock);
+	might_alloc(GFP_KERNEL);
+	list_for_each_entry(cur_peer, &owner_list->peers, link) {
+		if (cur_peer->owner != owner) {
+			if (owner && interconnect)
+				break;
+			owner = cur_peer->owner;
+			interconnect = true;
+		}
+		if (interconnect && !has_interconnect(peer, cur_peer))
+			interconnect = false;
+	}
+
+	if (!interconnect) {
+		owner = kmalloc(sizeof(*owner), GFP_KERNEL);
+		if (!owner) {
+			mutex_unlock(&owner_list->lock);
+			return -ENOMEM;
+		}
+		kref_init(&owner->kref);
+		list_add_tail(&peer->link, &owner_list->peers);
+	} else {
+		kref_get(&owner->kref);
+		list_add_tail(&peer->link, &cur_peer->link);
+	}
+	peer->owner = owner;
+	peer->list = owner_list;
+	mutex_unlock(&owner_list->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_pagemap_acquire_owner);
diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
new file mode 100644
index 000000000000..03731c79493f
--- /dev/null
+++ b/include/drm/drm_pagemap_util.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+#ifndef _DRM_PAGEMAP_UTIL_H_
+#define _DRM_PAGEMAP_UTIL_H_
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+
+struct drm_pagemap;
+struct drm_pagemap_owner;
+
+/**
+ * struct drm_pagemap_peer - Structure representing a fast interconnect peer
+ * @list: Pointer to a &struct drm_pagemap_owner_list used to keep track of peers
+ * @link: List link for @list's list of peers.
+ * @owner: Pointer to a &struct drm_pagemap_owner, common for a set of peers having
+ * fast interconnects.
+ */
+struct drm_pagemap_peer {
+	struct drm_pagemap_owner_list *list;
+	struct list_head link;
+	struct drm_pagemap_owner *owner;
+};
+
+/**
+ * struct drm_pagemap_owner_list - Keeping track of peers and owners
+ * @lock: Mutex protecting the @peers list.
+ * @peer: List of peers.
+ *
+ * The owner list defines the scope where we identify peers having fast interconnects
+ * and a common owner. Typically a driver has a single global owner list to
+ * keep track of common owners for the driver's pagemaps.
+ */
+struct drm_pagemap_owner_list {
+	struct mutex lock;
+	struct list_head peers;
+};
+
+/*
+ * Convenience macro to define an owner list.
+ */
+#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
+	struct drm_pagemap_owner_list _name = {	\
+	.lock = __MUTEX_INITIALIZER(_name.lock), \
+	.peers = LIST_HEAD_INIT(_name.peers) }
+
+void drm_pagemap_release_owner(struct drm_pagemap_peer *peer);
+
+int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
+			      struct drm_pagemap_owner_list *owner_list,
+			      bool (*has_interconnect)(struct drm_pagemap_peer *peer1,
+						       struct drm_pagemap_peer *peer2));
+#endif
-- 
2.48.1

