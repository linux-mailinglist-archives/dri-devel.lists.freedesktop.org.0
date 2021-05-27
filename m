Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B45393164
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 16:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B57F6F3E2;
	Thu, 27 May 2021 14:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DD86F3E2;
 Thu, 27 May 2021 14:47:45 +0000 (UTC)
IronPort-SDR: RP0NgsOjT5iJNEBmg1en8EZYAAV5wPR8wXIqGGLXvZORpnhZjuAl+9cbJ3YUvp/6ocUEh6Li0X
 L2ux1RhUYYtw==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="202515649"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="202515649"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:47:45 -0700
IronPort-SDR: UrtIwD7gqFgmmRaGKoX+xpd6pRwXcSQ4vNloJcEv7pSMNWWypcr2b8OfS6GEd+runLUGBAFALj
 Lt4zl/0AUXgg==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="443598021"
Received: from ibanaga-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 07:47:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 13/15] drm/i915: Disable mmap ioctl for gen12+
Date: Thu, 27 May 2021 16:47:08 +0200
Message-Id: <20210527144710.1975553-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527144710.1975553-1-thomas.hellstrom@linux.intel.com>
References: <20210527144710.1975553-1-thomas.hellstrom@linux.intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

The platform should exclusively use mmap_offset, one less path to worry
about for discrete.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index f6fe5cb01438..fd1c9714f8d8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -56,10 +56,17 @@ int
 i915_gem_mmap_ioctl(struct drm_device *dev, void *data,
 		    struct drm_file *file)
 {
+	struct drm_i915_private *i915 = to_i915(dev);
 	struct drm_i915_gem_mmap *args = data;
 	struct drm_i915_gem_object *obj;
 	unsigned long addr;
 
+	/* mmap ioctl is disallowed for all platforms after TGL-LP.  This also
+	 * covers all platforms with local memory.
+	 */
+	if (INTEL_GEN(i915) >= 12 && !IS_TIGERLAKE(i915))
+		return -EOPNOTSUPP;
+
 	if (args->flags & ~(I915_MMAP_WC))
 		return -EINVAL;
 
-- 
2.31.1

