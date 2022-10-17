Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A47602487
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A9F10EE92;
	Tue, 18 Oct 2022 06:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EDC10ED0F;
 Mon, 17 Oct 2022 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665999176; x=1697535176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Ch/gzI1CiEltsWtZiZ1vnI7GDsumr0SEFm747ErScU=;
 b=jgCItgeC1R/Zp94KyKUhQnOWheZ9NvWIOckwNkWRHkjNznPwLqAZsUb6
 MEZtEmJhJNDS2ooI4yuMy3552pwR2w0zCOKFAGQF3Tgba+HmIP943UcIp
 pRsLLJsbPNNuwFAlO4blrePUBbUS4WaVAG4gCs2BiIL3Ks44SMPMXVxoO
 An5oaMC49vxjX+zh3Kk1BQPdJn+WJvOeoxG/y5elWau+SnSCGBJTy/6vn
 Dv3jZTT3ENkzf62GaMbrZAC9qbQkD1fla//f6X7HfJ9CRNtilZw/dduyz
 gAyQSxCLx7Fkf9IxoW7wi2hpRBK8KgYDXKpNdNBQsi/2hjEnQWwpXRS6r w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="286142697"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="286142697"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="717431333"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="717431333"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.132])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2022 02:32:52 -0700
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] drm/i915: Use kmap_local_page() in i915_cmd_parser.c
Date: Mon, 17 Oct 2022 17:37:24 +0800
Message-Id: <20221017093726.2070674-9-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
References: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Oct 2022 06:35:11 +0000
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dave Hansen <dave.hansen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhao Liu <zhao1.liu@intel.com>

The use of kmap_atomic() is being deprecated in favor of
kmap_local_page()[1].

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption.

There're 2 reasons why function copy_batch() doesn't need to disable
pagefaults and preemption for mapping:

1. The flush operation is safe for CPU hotplug when preemption is not
disabled. In i915_cmd_parser.c, the function copy_batch() calls
drm_clflush_virt_range() to use CLFLUSHOPT or WBINVD to flush.
Since CLFLUSHOPT is global on x86 and WBINVD is called on each cpu
in drm_clflush_virt_range(), the flush operation is global and any
issue with cpu's being added or removed can be handled safely.

2. Any context switch caused by preemption or sleep (pagefault may
cause sleep) doesn't affect the validity of local mapping.

Therefore, copy_batch() is a function where the use of
kmap_local_page() in place of kmap_atomic() is correctly suited.

Convert the calls of kmap_atomic() / kunmap_atomic() to
kmap_local_page() / kunmap_local().

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com

Suggested-by: Dave Hansen <dave.hansen@intel.com>
Suggested-by: Ira Weiny <ira.weiny@intel.com>
Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credits:
  Dave: Referred to his explanation about cache flush.
  Ira: Referred to his task document, review comments and explanation about
       cache flush.
  Fabio: Referred to his boiler plate commit message.
---
 drivers/gpu/drm/i915/i915_cmd_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index f93e6122f247..1a56000d7476 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -1211,11 +1211,11 @@ static u32 *copy_batch(struct drm_i915_gem_object *dst_obj,
 		for (n = offset >> PAGE_SHIFT; remain; n++) {
 			int len = min(remain, PAGE_SIZE - x);
 
-			src = kmap_atomic(i915_gem_object_get_page(src_obj, n));
+			src = kmap_local_page(i915_gem_object_get_page(src_obj, n));
 			if (src_needs_clflush)
 				drm_clflush_virt_range(src + x, len);
 			memcpy(ptr, src + x, len);
-			kunmap_atomic(src);
+			kunmap_local(src);
 
 			ptr += len;
 			remain -= len;
-- 
2.34.1

