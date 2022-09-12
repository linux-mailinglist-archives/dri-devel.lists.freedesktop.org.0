Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F65B5A10
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 14:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEE410E3D1;
	Mon, 12 Sep 2022 12:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA7410E3D1;
 Mon, 12 Sep 2022 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662985246; x=1694521246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KttXSOvJ/UTfxWhkLjYBs0kkM1u477JlsIay7MkVh+w=;
 b=LIs+BaBRuyc5KgoeoXmPWUpwQ3gEmIBQWJtanAmzadARlSjM53fN2qBq
 lB/E0tAEgpFjhSqJhmnqPzj+anmGbT9yoAQNo0oXTvBfGuJvckx4PJV8r
 63YLbMm+Jga3ACQvsZYuoIwhMll2jhPqR7xfbAooP9+B8Nm5FiyW3M/Cr
 zWTCkPxCSYIEuOJfPa9WONmvk1cSmA6esGRlQ3357ZDQz9TJT3NEuxG8j
 LwcYJmv7QM4QkFkLq5zNQJxXM0+ayuL/moX7eA2OTuAw7OPEeqw/4ZL94
 GL6wqOKtB9dnIp9SIPWQOGQdWz7kburauxRaaVQlgk3GhqhGGrOfHwPo8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="296585353"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="296585353"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:20:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="593473552"
Received: from sfhansen-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:20:44 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Fix display problems after resume
Date: Mon, 12 Sep 2022 14:19:57 +0200
Message-Id: <20220912121957.31310-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.37.3
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

Commit 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt
binding / unbinding") introduced a regression that due to the vma resource
tracking of the binding state, dpt ptes were not correctly repopulated.
Fix this by clearing the vma resource state before repopulating.
The state will subsequently be restored by the bind_vma operation.

Fixes: 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt binding / unbinding")
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 30cf5c3369d9..2049a00417af 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1275,10 +1275,16 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
 			atomic_read(&vma->flags) & I915_VMA_BIND_MASK;
 
 		GEM_BUG_ON(!was_bound);
-		if (!retained_ptes)
+		if (!retained_ptes) {
+			/*
+			 * Clear the bound flags of the vma resource to allow
+			 * ptes to be repopulated.
+			 */
+			vma->resource->bound_flags = 0;
 			vma->ops->bind_vma(vm, NULL, vma->resource,
 					   obj ? obj->cache_level : 0,
 					   was_bound);
+		}
 		if (obj) { /* only used during resume => exclusive access */
 			write_domain_objs |= fetch_and_zero(&obj->write_domain);
 			obj->read_domains |= I915_GEM_DOMAIN_GTT;
-- 
2.34.1

