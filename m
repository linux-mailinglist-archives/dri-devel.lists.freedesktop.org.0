Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460164E67AF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 18:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B1010E8E7;
	Thu, 24 Mar 2022 17:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B524510E8D4;
 Thu, 24 Mar 2022 17:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648142529; x=1679678529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZEwlbMbyU5BSIhyG6yFv+mG9vNoVsHNGlE4SPcME1vk=;
 b=eMza8W85Cke8OB4l5ZpcNCNfdeMr/BrZWiV/Yb3PjyAjw4ITJG77QYq4
 yIGPkepU4GAuxBpxACW8GQ8c9wZCBqpODSB6lKgXSfjuUF0UNisLIcZZa
 GGmrm1LQzsPHpEYMWuRjkXgz37fXST7Vqkp5YW76TjO4kR6CDyJy0HYN2
 tELAtRcUyeCX4Od0X/xBaHq4nJfcxw1dCzWpr2AbqMXfvDYzPASlQaZ7u
 3h89nP9hCZ8MfzCUbmRscdG2/iaK87HtM0TFnAZqJn47qUvuytINq4LsL
 BbEuDQlNVLSSUghl2L+zLML742e0pq7ohRoJmjP2TS02oENHmFhDVkb1P g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="239043293"
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; d="scan'208";a="239043293"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 10:22:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,208,1643702400"; d="scan'208";a="637924730"
Received: from smurkank-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.102])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 10:22:08 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/migrate: move the sanity check
Date: Thu, 24 Mar 2022 17:21:43 +0000
Message-Id: <20220324172143.377104-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220324172143.377104-1-matthew.auld@intel.com>
References: <20220324172143.377104-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the sanity check that both src and dst are never both system
memory, which should never happen on discrete, and likely means we have
a bug. The only exception is on integrated where we trigger this path in
the selftests.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 20444d6ceb3c..950fd6da146c 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -530,6 +530,7 @@ intel_context_migrate_copy(struct intel_context *ce,
 	int err;
 
 	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
+	GEM_BUG_ON(IS_DGFX(ce->engine->i915) && (!src_is_lmem && !dst_is_lmem));
 	*out = NULL;
 
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
@@ -566,8 +567,6 @@ intel_context_migrate_copy(struct intel_context *ce,
 		src_offset = 0;
 		dst_offset = CHUNK_SZ;
 		if (HAS_64K_PAGES(ce->engine->i915)) {
-			GEM_BUG_ON(!src_is_lmem && !dst_is_lmem);
-
 			src_offset = 0;
 			dst_offset = 0;
 			if (src_is_lmem)
-- 
2.34.1

