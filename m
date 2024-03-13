Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C2A87B206
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 20:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B7510E5A1;
	Wed, 13 Mar 2024 19:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="el2pJEeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AC610E5A1;
 Wed, 13 Mar 2024 19:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710358783; x=1741894783;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hP51Mm0AciQDP+IQLyCe+K1HU+tgmUtTsBVz5z5MNlE=;
 b=el2pJEeGKLikrc6kpTFtUwJY6plCnojaTn79OffdA3+t3AwNoLtw0K1Z
 kEyJh4sEQJjCN8UwnNUkU8xo4LYQ6gFn6iRBhK/x2zcq/22iw3icokOF/
 GvbP309ZuaORo4CHF6sj3ser5bxvXWCQatG450nl5/LZLGEc44MsruxJq
 Psbc0cuFOuNOTLnSrGbMdUGI24g03jaD1MG1zjN2auY73ryGH6pCSxS34
 irKi/Uo9uRwwYijfVTkNXkwM9VnWLZY3FSRBhJWH3s2/JKwLvCDwrI4gG
 DQUV/ItoNkrSAqp7sndXgsoxf8IIoRgf7cO6ou/pT0jcH+5BFhKAGY1a7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="4996557"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="4996557"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="16633361"
Received: from unknown (HELO intel.com) ([10.247.118.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:39:36 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Report full vm address range
Date: Wed, 13 Mar 2024 20:39:06 +0100
Message-ID: <20240313193907.95205-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 9bb66c179f50 ("drm/i915: Reserve some kernel space per
vm") has reserved an object for kernel space usage.

Userspace, though, needs to know the full address range.

Fixes: 9bb66c179f50 ("drm/i915: Reserve some kernel space per vm")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index fa46d2308b0e..d76831f50106 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -982,8 +982,9 @@ static int gen8_init_rsvd(struct i915_address_space *vm)
 
 	vm->rsvd.vma = i915_vma_make_unshrinkable(vma);
 	vm->rsvd.obj = obj;
-	vm->total -= vma->node.size;
+
 	return 0;
+
 unref:
 	i915_gem_object_put(obj);
 	return ret;
-- 
2.43.0

