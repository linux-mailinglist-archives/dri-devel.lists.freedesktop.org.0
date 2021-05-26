Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A539164F
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E746ECAA;
	Wed, 26 May 2021 11:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE906ECAC;
 Wed, 26 May 2021 11:33:38 +0000 (UTC)
IronPort-SDR: CzIdZn684NXx8TC/DoKrwhZ/xDLYIV00cwBbieS6Ik8UVSnurB5YFz9EsFT7+SBQj8+CsHOoeF
 mS80hR4dwwvQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="223627319"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223627319"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 04:33:38 -0700
IronPort-SDR: 0jvgJSOmzMYltXKHV0oshgCSdl7o3DmD/EUD0NM/fzastpOgsiBbz9V7oWzlRJUGpAtPi1yNbG
 PMGaxzqT5+Og==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="633457967"
Received: from pegilssx-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.205])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 04:33:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 13/15] drm/i915: Disable mmap ioctl for gen12+
Date: Wed, 26 May 2021 13:32:57 +0200
Message-Id: <20210526113259.1661914-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
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

The paltform should exclusively use mmap_offset, one less path to worry
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

