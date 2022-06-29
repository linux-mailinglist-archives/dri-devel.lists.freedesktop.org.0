Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C1355FF68
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B2211ADD7;
	Wed, 29 Jun 2022 12:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B16D113B81;
 Wed, 29 Jun 2022 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656504909; x=1688040909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4vysPk/SQ7bmb1NTBqUBiaQrh65tJm03hScgjL/W50I=;
 b=exNI9evHBqUEN7U7rP1Q/wr2uEUNf112wfR6lnmHqamvdmqLgPnL2dpB
 oUrz3jH1DUI6IOM/H0FS+ZhoRTsb717Y/5zJnTi5sQYjoYk6zhW+mQmYz
 IyTOzwtCrQTn5PaqbeXe2FmmfdKCOd2Z46ei6ntKs+xckAl1f3dyc8GCx
 KELmfwF7P0C8JnUK9kQaePKHM+18uZhR11LHMNCGm0u8/OTsNA3xvMlu+
 ZaioZLyDsLqSgdEmZmcWgFNzBVP5JHwEW3lBMEv5vjjygw5B5HvjSePsh
 c2kIuS4uIzfu8QMLamC1a2tDXPUl+hyeELsjt3UljVJo8kdUjhaD0KBlq w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="262421448"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="262421448"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:15:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="595215127"
Received: from nwalsh-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.202.136])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 05:15:07 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 09/13] drm/i915/selftests: skip the mman tests for stolen
Date: Wed, 29 Jun 2022 13:14:23 +0100
Message-Id: <20220629121427.353800-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629121427.353800-1-matthew.auld@intel.com>
References: <20220629121427.353800-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not supported, and just skips later anyway. With small-BAR things
get more complicated since all of stolen is likely not even CPU
accessible, hence not passing I915_BO_ALLOC_GPU_ONLY just results in the
object create failing.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 5bc93a1ce3e3..388c85b0f764 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -979,6 +979,9 @@ static int igt_mmap(void *arg)
 		};
 		int i;
 
+		if (mr->private)
+			continue;
+
 		for (i = 0; i < ARRAY_SIZE(sizes); i++) {
 			struct drm_i915_gem_object *obj;
 			int err;
@@ -1435,6 +1438,9 @@ static int igt_mmap_access(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
+		if (mr->private)
+			continue;
+
 		obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
@@ -1580,6 +1586,9 @@ static int igt_mmap_gpu(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
+		if (mr->private)
+			continue;
+
 		obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
@@ -1727,6 +1736,9 @@ static int igt_mmap_revoke(void *arg)
 		struct drm_i915_gem_object *obj;
 		int err;
 
+		if (mr->private)
+			continue;
+
 		obj = __i915_gem_object_create_user(i915, PAGE_SIZE, &mr, 1);
 		if (obj == ERR_PTR(-ENODEV))
 			continue;
-- 
2.36.1

