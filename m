Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F54C27FA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 10:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608CC10F417;
	Thu, 24 Feb 2022 09:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664DD10F40F;
 Thu, 24 Feb 2022 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645694436; x=1677230436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9CrzIdJ/rsQPm7IKvpE9S1MFXtvqjWab6oVIYHdX6Qc=;
 b=Z7k5xVqf876JrNq66cCQIxiyHjr3L/Y/8X/510OHn4PJNolSqJd6f4C+
 PFwdLFxY9VLSOeeGo4qX6flcaLa81f2TgcOosDW32WNAOlWbsyXzXlyVt
 OffDftaSU0WwKBbIaEC+foRcQDgYodtVcLn91SIimpLLUZATIi/hX08ri
 KzBSdZH4sloSKIQRWEJoxzIs+4PORS9Yfq3HLUvs42eutn8SpOIwUkcG/
 tHhI92qCVsFZGlZU1XPQSkIVaIu+mV9AD/y+3X5NvyQBoMAOwcDmMA3Aj
 wS2sJrG9uiDZcZDG5sPHZQR68v9atfSPj2B7dZVtNSPADAfYxLfqdSUYi w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="232163008"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="232163008"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 01:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="491537836"
Received: from pallavim-desk.iind.intel.com ([10.145.162.180])
 by orsmga003.jf.intel.com with ESMTP; 24 Feb 2022 01:20:31 -0800
From: Pallavi Mishra <pallavi.mishra@intel.com>
To: gfx-internal-devel@eclists.intel.com
Subject: [PATCH 4/6] drm/i915/gem: hide new uAPI behind CONFIG_BROKEN
Date: Thu, 24 Feb 2022 14:52:30 +0530
Message-Id: <20220224092232.780075-5-pallavi.mishra@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224092232.780075-1-pallavi.mishra@intel.com>
References: <20220224092232.780075-1-pallavi.mishra@intel.com>
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
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>, matthew.auld@intel.com,
 Jason Ekstrand <jason@jlekstrand.net>, mesa-dev@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Auld <matthew.auld@intel.com>

Treat it the same as the fake local-memory stuff, where it is disabled
for normal kernels, in case some random UMD is tempted to use this. Once
we have all the other bits and pieces in place, like the TTM conversion,
we can turn this on for real.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: mesa-dev@lists.freedesktop.org
Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210429103056.407067-9-matthew.auld@intel.com
(cherry picked from commit 0a46be95c282956a9d3229a46e33ba701c26594c)
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 3 +++
 drivers/gpu/drm/i915/i915_query.c          | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index f6729feae582..548ddf39d853 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -335,6 +335,9 @@ static int ext_set_placements(struct i915_user_extension __user *base,
 {
 	struct drm_i915_gem_create_ext_memory_regions ext;
 
+	if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
+		return -ENODEV;
+
 	if (copy_from_user(&ext, base, sizeof(ext)))
 		return -EFAULT;
 
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 51b368be0fc4..8a72923fbdba 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -434,6 +434,9 @@ static int query_memregion_info(struct drm_i915_private *i915,
 	u32 total_length;
 	int ret, id, i;
 
+	if (!IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM))
+		return -ENODEV;
+
 	if (query_item->flags != 0)
 		return -EINVAL;
 
