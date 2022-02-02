Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2374A76E7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 18:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2310E2AD;
	Wed,  2 Feb 2022 17:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792FA10E2AD;
 Wed,  2 Feb 2022 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643823206; x=1675359206;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1ZLpAxC0iEhZmcJsrxGtVBI9hXu4lZ6HlAiLywFzm+g=;
 b=bU0pUUrhCAQC36zWTnEWIye0EHN+zm2q3is4JkLmvGN4Je+lfxlVnqx2
 C95wrWjrw2xvAF1/Jk4fHn/46cVcQkszyWG1Y6XrvVcu6rfC/iFjtoMva
 sgG8iPn4RAZlZyUfWgSAT33dclEUw/Zdk7y6GkADhkrpOqkF5xfJDmYSw
 RPz9kFvVGWmEC+I/ZEMtxIxeq6rOWPIy5E3X5wcX2gD4kYtO+vt0YhgBC
 iRsV2m7zWXtUkBlIdSX9on7ZU285QqrN8U5u5YhntCyRkL1KBhaO/6Ode
 K/MS6gtjKfE77gySu7w72skBGDg5bvAWNi6ZUBtulWYfQ4enPGed4vAPL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="247748576"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="247748576"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 09:32:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="769354096"
Received: from msiebert-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.225])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 09:32:47 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: opportunistically apply ALLOC_CONTIGIOUS
Date: Wed,  2 Feb 2022 17:31:54 +0000
Message-Id: <20220202173154.3758970-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like this code was accidentally dropped at some point(in a
slightly different form), so add it back. The gist is that if we know
the allocation will be one single chunk, then we can just annotate the
BO with I915_BO_ALLOC_CONTIGUOUS, even if the user doesn't bother. In
the future this might prove to be potentially useful.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index a4350227e9ae..dd414a2bcb06 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -57,6 +57,9 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 
 	size = round_up(size, default_page_size);
 
+	if (default_page_size == size)
+		flags |= I915_BO_ALLOC_CONTIGUOUS;
+
 	GEM_BUG_ON(!size);
 	GEM_BUG_ON(!IS_ALIGNED(size, I915_GTT_MIN_ALIGNMENT));
 
-- 
2.34.1

