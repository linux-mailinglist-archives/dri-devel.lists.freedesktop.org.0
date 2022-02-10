Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00614B0D56
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 13:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB2010E849;
	Thu, 10 Feb 2022 12:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B8210E840;
 Thu, 10 Feb 2022 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644495404; x=1676031404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yxvutEt29jYT09qXItd3kZbee+tbdK5JyMuhu+MJJjk=;
 b=f8erdgi7cQUrKR9Aw0fzvzERYT2gZvizZ8oxlZOMobLQLDxPg168ipkS
 RdtUKk2KSm8VvsusxU3MRldK0RpPLZNGiI+oR6DkR3qo+I0jDAGG6+ExP
 HkhuMZciqgy5N7pM6abanZZHIcxJtGkmd4F24SNtWp4FH7fJl2Cxclevw
 SCJMgF2BKbIZgWhrJWGVS9R+nufzkYqthmtcVCcY3WcAM1LhD/C7H7Hfq
 P1qjVJ3tszvlCIK/ZRRNkc+S3zJY3AcW6AIivyxYzUvLpd75Rcnu4Scg9
 PRhZMo4b4KxEnp+dRZrOghTD72tL8HjDLp3Cg60N5IEmfZ1NNigJlPI6q g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="247060963"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="247060963"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:16:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="485664959"
Received: from paulbarr-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.11.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:16:43 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/15] drm/i915/buddy: tweak 2big check
Date: Thu, 10 Feb 2022 12:13:04 +0000
Message-Id: <20220210121313.701004-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210121313.701004-1-matthew.auld@intel.com>
References: <20220210121313.701004-1-matthew.auld@intel.com>
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

Otherwise we get -EINVAL, instead of the more useful -E2BIG if the
allocation doesn't fit within the pfn range, like with mappable lmem.
The hugepages selftest, for example, needs this to know if a smaller
size is needed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 0ac6b2463fd5..92d49a3c378c 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -82,7 +82,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 			lpfn = pages;
 	}
 
-	if (size > mm->size) {
+	if (size > lpfn << PAGE_SHIFT) {
 		err = -E2BIG;
 		goto err_free_res;
 	}
-- 
2.34.1

