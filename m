Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54614976DB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 02:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67AD10E376;
	Mon, 24 Jan 2022 01:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E53910E376;
 Mon, 24 Jan 2022 01:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642986499; x=1674522499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vQ+URCpH58amyJwZvD+WKZHycEjAGteBUXjGdjO6MEc=;
 b=RVh/fTtgf2PKEckKG9WPyZbz02yZxs7CuPKaruXg07YB14iTYmBbFjXO
 HKe5DSXXowYdfJVM5a/xJKLDVODpoOBbJE6jTsIoDNHXNTtD9VheM6217
 /oEeqNOOO8+P5eEPcohmxAAJuOVdxFfoHE6eH4f0tCjYEG/A1jLeG93E7
 zHPMgZLqI2Bu5Q3RxQgpc1ORlvSAX2XdExwetJw1BfiJ3kNASRpAxpP/u
 /wuukIQ5p0A948Wc18TCGz7/oqPnSU0Pw/M5kwAKaE/69RWTsIUlUVa5k
 0OfcGCD5X/sy8+cQxpFxg81Yl6z+/mfgcnoA7xyp+T5Qyxm4qQ1srmhhU A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="332292925"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="332292925"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:08:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="534009923"
Received: from ivanovbx-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.32.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:08:16 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: fix header file inclusion for might_alloc()
Date: Mon, 24 Jan 2022 03:08:11 +0200
Message-Id: <20220124010811.1640-1-andi.shyti@linux.intel.com>
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
 Andi Shyti <andi@etezian.org>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace "linux/slab.h" with "linux/sched/mm.h" header inclusion
as the first is not required, while the second, if not included,
prdouces the following error:

drivers/gpu/drm/i915/i915_vma_resource.c: In function ‘i915_vma_resource_bind_dep_await’:
drivers/gpu/drm/i915/i915_vma_resource.c:381:9: error: implicit declaration of function ‘might_alloc’; did you mean ‘might_lock’? [-Werror=implicit-function-declaration]
  381 |         might_alloc(gfp);
      |         ^~~~~~~~~~~
      |         might_lock

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_vma_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma_resource.c b/drivers/gpu/drm/i915/i915_vma_resource.c
index 1f41c0c699eb..bbb0ff14272f 100644
--- a/drivers/gpu/drm/i915/i915_vma_resource.c
+++ b/drivers/gpu/drm/i915/i915_vma_resource.c
@@ -4,7 +4,7 @@
  */
 
 #include <linux/interval_tree_generic.h>
-#include <linux/slab.h>
+#include <linux/sched/mm.h>
 
 #include "i915_sw_fence.h"
 #include "i915_vma_resource.h"
-- 
2.34.1

