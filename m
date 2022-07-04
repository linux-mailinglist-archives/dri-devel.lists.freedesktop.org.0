Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F6565BEB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F8A10F8C7;
	Mon,  4 Jul 2022 16:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965D010E14A;
 Mon,  4 Jul 2022 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656942804; x=1688478804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gi+steff+c6wtID9tUVp9+ZOlW7suAdBL8AT0jTG1sY=;
 b=mGfbNx5F8Ocx13KerJMtbCiQXhqoTrH1lfRx+s48+NeRmq1kDnhDKuBX
 qrim/q+3d90Xy/ndGhhFKa0r3y1xuHwlQSytExfk0Cg0pqeJ2/oWNlQQ4
 8fVCNQq4J1PkfxMMWVPE5kd1v0FnDgqHBL90DdSfdGtEaM9jZBGBthncB
 mmz3QZ5aRKmz45TsIY3wm9EYNyzZMwyZ6n3ltArWaIMSiyAAL4gM0zbdk
 irLso6c+qAWdPKuhscSf8vU/BwsSAlaay4lH2gy0StT7IV1mP/ObMN44K
 w5VpR9Tu6rpovJcbswtSqhSfvYq31uBkEZJCjXtL0P9WQ/FuVpvg1EvYt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="347112573"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="347112573"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 06:53:24 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="542595777"
Received: from acagidia-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.34])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 06:53:24 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: Take the object lock when destroying vmas from
 vm destruction
Date: Mon,  4 Jul 2022 15:52:48 +0200
Message-Id: <20220704135249.8241-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704135249.8241-1-thomas.hellstrom@linux.intel.com>
References: <20220704135249.8241-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we guarantee that vmas stay alive when the object lock is held
only if we also hold a private vm reference. In order to relax the latter
requirement, take the object lock also when destroying vmas from the
vm destruction path.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gtt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
index b67831833c9a..92e22f727f88 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
@@ -112,7 +112,10 @@ int map_pt_dma_locked(struct i915_address_space *vm, struct drm_i915_gem_object
 static void clear_vm_list(struct list_head *list)
 {
 	struct i915_vma *vma, *vn;
+	bool unlocked;
 
+restart:
+	unlocked = false;
 	list_for_each_entry_safe(vma, vn, list, vm_link) {
 		struct drm_i915_gem_object *obj = vma->obj;
 
@@ -138,8 +141,22 @@ static void clear_vm_list(struct list_head *list)
 			i915_vm_resv_get(vma->vm);
 			vma->vm_ddestroy = true;
 		} else {
+			if (!i915_gem_object_trylock(obj, NULL)) {
+				unlocked = true;
+				mutex_unlock(&vma->vm->mutex);
+				i915_gem_object_lock(obj, NULL);
+				mutex_lock(&vma->vm->mutex);
+				/*
+				 * The vma may now be on a different list,
+				 * but not destroyed. We don't care.
+				 * destroy it.
+				 */
+			}
 			i915_vma_destroy_locked(vma);
+			i915_gem_object_unlock(obj);
 			i915_gem_object_put(obj);
+			if (unlocked)
+				goto restart;
 		}
 
 	}
-- 
2.36.1

