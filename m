Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB90C08FDE
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F3010E26A;
	Sat, 25 Oct 2025 12:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+t72wei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D31E10E26F;
 Sat, 25 Oct 2025 12:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393897; x=1792929897;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tm6Cy1UsLxV9gnUTSuDXu23U51rDD9KWfnw33zAmpvI=;
 b=H+t72weiap7OlpYqKxgZKcQs0PSEf+xX17ifkLLWeZrYlKwMIO8Sx0nG
 uEPJAkvgxmlCtwM5AOzuTfB8AmtfQKUevYsRZFFknLIk96awbC2NR7ReA
 n1uyode+v0BtmJ2U3dQlPRdZtjDUV27NAyAehGdZqea480xSs1QktbVPc
 jqbLGlRMJvgeLYNvplqBMPblPy0vFnNccGJbcCB9zIj9UEk3A3mXEhIyM
 M9HlTfaxjQ9W68FvE/kEl39Y614uoCdoNM/JMJOrlIXOyfM7yd2KmHtwU
 6H71+6Xsw++SjXM4n3RUxRgMPyG6EM1xs7w1tRJCA2zKiJarebjWJH5U1 g==;
X-CSE-ConnectionGUID: 0rtBD/7QQMyoqFZocGlhVQ==
X-CSE-MsgGUID: 9OSMPcT9R12SMm6HjdmYtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590380"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590380"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:57 -0700
X-CSE-ConnectionGUID: kdGFTkp6T8+8/7vvAmjvyA==
X-CSE-MsgGUID: QFPj8INRSBmAUS2OBqBN5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023733"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 07/15] drm/pagemap_util: Add a utility to assign an owner to a
 set of interconnected gpus
Date: Sat, 25 Oct 2025 14:04:04 +0200
Message-ID: <20251025120412.12262-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
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
 drivers/gpu/drm/drm_pagemap_util.c | 118 +++++++++++++++++++++++++++++
 include/drm/drm_pagemap_util.h     |  53 +++++++++++++
 2 files changed, 171 insertions(+)

diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
index e1a1d6bf25f4..dd573b620157 100644
--- a/drivers/gpu/drm/drm_pagemap_util.c
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/slab.h>
+
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_pagemap.h>
@@ -424,3 +426,119 @@ struct drm_pagemap_shrinker *drm_pagemap_shrinker_create_devm(struct drm_device
 	return shrinker;
 }
 EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
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
index 292244d429ee..1889630b8950 100644
--- a/include/drm/drm_pagemap_util.h
+++ b/include/drm/drm_pagemap_util.h
@@ -1,12 +1,58 @@
 /* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
 #ifndef _DRM_PAGEMAP_UTIL_H_
 #define _DRM_PAGEMAP_UTIL_H_
 
+#include <linux/list.h>
+#include <linux/mutex.h>
+
 struct drm_device;
 struct drm_pagemap;
 struct drm_pagemap_cache;
+struct drm_pagemap_owner;
 struct drm_pagemap_shrinker;
 
+/**
+ * struct drm_pagemap_peer - Structure representing a fast interconnect peer
+ * @list: Pointer to a &struct drm_pagemap_owner_list used to keep track of peers
+ * @link: List link for @list's list of peers.
+ * @owner: Pointer to a &struct drm_pagemap_owner, common for a set of peers having
+ * fast interconnects.
+ * @private: Pointer private to the struct embedding this struct.
+ */
+struct drm_pagemap_peer {
+	struct drm_pagemap_owner_list *list;
+	struct list_head link;
+	struct drm_pagemap_owner *owner;
+	void *private;
+};
+
+/**
+ * struct drm_pagemap_owner_list - Keeping track of peers and owners
+ * @peer: List of peers.
+ *
+ * The owner list defines the scope where we identify peers having fast interconnects
+ * and a common owner. Typically a driver has a single global owner list to
+ * keep track of common owners for the driver's pagemaps.
+ */
+struct drm_pagemap_owner_list {
+	/** @lock: Mutex protecting the @peers list. */
+	struct mutex lock;
+	/** @peers: List of peers. */
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
 void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
 
 int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache *cache);
@@ -22,4 +68,11 @@ struct drm_pagemap *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache);
 void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache *cache, struct drm_pagemap *dpagemap);
 
 struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct drm_pagemap_cache *cache);
+
+void drm_pagemap_release_owner(struct drm_pagemap_peer *peer);
+
+int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
+			      struct drm_pagemap_owner_list *owner_list,
+			      bool (*has_interconnect)(struct drm_pagemap_peer *peer1,
+						       struct drm_pagemap_peer *peer2));
 #endif
-- 
2.51.0

