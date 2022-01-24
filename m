Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E30497AF1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 10:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEFE10EDAA;
	Mon, 24 Jan 2022 09:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 839E210EDA9;
 Mon, 24 Jan 2022 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643015052; x=1674551052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uihijiEqKyBj5j8bBRv+t2EXae9PPZWXlfEE9dkQAJw=;
 b=fNQpjCecsEzGBy790xM+HO5YgBrGemZnaZh3tkUE9gjcwN1wPJZCptql
 wQ4nSjunIakZjgwL6E4ooEh3Cg8kiPfcr6KR2VUZufJqO7XDpZfrK7uLx
 C56cq31ypyrTy92b0AwltccrO8fwm28l/CVXbe5+vW4sRMNOFrfTYERku
 HD3+i1ePFY/LkTij0rdXJyIEAgd8uF9Ume0jyXUYpxppMos+6T0th71ZZ
 0y4f238FxlzI9AOStSUisjBn8UORp/fIwm0c7FXUiPLSzxjvURvcvOIf3
 MYLmDA8exFITrVbXqpV0QGBWJf4LOpuwQiv6l+BKLzZTXIhW0EEHE/weQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="245782013"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="245782013"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 01:04:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="479001891"
Received: from olegmak-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.51.85])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 01:04:07 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2] drm/i915: fix header file inclusion for might_alloc()
Date: Mon, 24 Jan 2022 11:03:44 +0200
Message-Id: <20220124090344.1791-1-andi.shyti@linux.intel.com>
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

Fixes: 2f6b90da9192 ("drm/i915: Use vma resources for async unbinding")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
Hi,

in V2 I just added the Fixes tag (I think I got the right commit)
and added Thomas r-b.

Andi

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

