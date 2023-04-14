Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A706E2C89
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 00:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B768C10E247;
	Fri, 14 Apr 2023 22:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE28410E221;
 Fri, 14 Apr 2023 22:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681512184; x=1713048184;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wuq+IPj1vfq8zA2DHw9ThHwn0V9278qwnLWCY71S/aM=;
 b=ieVJ70TBW3qOn7LMCXW8AIVVA54OjjSEiITGP/DGxVDx+TV1ZdcB6HVO
 s3Mw0OdxgDNbJmiecCeTJp6cszVBPLL1MAi4m4w6cYXLniZd/yVjNidv/
 NluVEmrxEL4jv8tcdgqedDNmk4f0dwdvqW3ZP0/GqHsAab18VolmGvMiW
 ixIgu19CIchOyO85VUuJ614vms0Jf4WjevTAesIO+Tt/BTq+kwvwhLt9z
 hrBrAze7oDt683YXJwaPv5pFb7gKjk4OQRAuqwuLixE6vf/CQKMRWP6Cb
 TPuWliBaZhk7DiwOucnj977opnIT/NTJ80y/UmfvMzM9sSkksWQaUlVIh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="407471973"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="407471973"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 15:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="754607509"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="754607509"
Received: from nofferma-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.231])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 15:43:00 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Fix memory leaks in i915 selftests
Date: Sat, 15 Apr 2023 00:41:09 +0200
Message-Id: <20230414224109.1051922-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Cong Liu <liucong2@kylinos.cn>,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Cong Liu <liucong2@kylinos.cn>

This patch fixes memory leaks on error escapes in function fake_get_pages

Fixes: c3bfba9a2225 ("drm/i915: Check for integer truncation on scatterlist creation")
Signed-off-by: Cong Liu <liucong2@kylinos.cn>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Hi,

just resending this patch as I don't see it in our patchwork.

Andi

Changelong
==========
v1 -> v2
 - Add r-b tags

 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 5361ce70d3f29..154801f1c4685 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -69,8 +69,10 @@ static int fake_get_pages(struct drm_i915_gem_object *obj)
 
 	rem = round_up(obj->base.size, BIT(31)) >> 31;
 	/* restricted by sg_alloc_table */
-	if (overflows_type(rem, unsigned int))
+	if (overflows_type(rem, unsigned int)) {
+		kfree(pages);
 		return -E2BIG;
+	}
 
 	if (sg_alloc_table(pages, rem, GFP)) {
 		kfree(pages);
-- 
2.39.2

