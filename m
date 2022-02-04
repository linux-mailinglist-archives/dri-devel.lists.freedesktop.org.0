Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E94A9D0B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 17:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A22810E2DB;
	Fri,  4 Feb 2022 16:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FBC10E2DB;
 Fri,  4 Feb 2022 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643992640; x=1675528640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o6HuYlnP32PX1lqgHE1fsvZCwjUKZXMxGSqa7+v9E8k=;
 b=TXmC59JP9RHyStWsQ57+ufNBkdioFv7qs2UoElcR6S3Ac4XoW8SW0q2H
 uYKuQYLrLvjN/VpCBvrTmosObk5nsF0msLdjh9ruA+uqonZr1QnajA46H
 IRXeOBX1PChbfvyseFQ8Q46ZS9OvijmSSCZ4bq+zhiS1yz5QQBsD0jMJU
 AxyLRaqDWBV0GgWRmvvhhskQwSEIEG53LTRSLrsMnf5FaRH4tTHHud+UI
 WFzhu64t9yxWS4CPBLWI5VhbKf+LUliS7JEWXtnNvFoUtXgH5PuHNPffY
 Qh1iRfbyPIBz1DyV7cafw6gc2+QZ04WPybOHm/WjhjHxi7RrTUYOcZLtR Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="228368856"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="228368856"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="699724240"
Received: from pwaterl-mobl1.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.197.34])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:19 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 4/5] drm/i915/: Re-work clflush_write32
Date: Fri,  4 Feb 2022 08:37:10 -0800
Message-Id: <20220204163711.439403-5-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204163711.439403-1-michael.cheng@intel.com>
References: <20220204163711.439403-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_clflush_virt_range instead of clflushopt and remove the memory
barrier, since drm_clflush_virt_range takes care of that.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 498b458fd784..0854276ff7ba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1332,10 +1332,8 @@ static void *reloc_vaddr(struct i915_vma *vma,
 static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
 {
 	if (unlikely(flushes & (CLFLUSH_BEFORE | CLFLUSH_AFTER))) {
-		if (flushes & CLFLUSH_BEFORE) {
-			clflushopt(addr);
-			mb();
-		}
+		if (flushes & CLFLUSH_BEFORE)
+			drm_clflush_virt_range(addr, sizeof(addr));
 
 		*addr = value;
 
@@ -1347,7 +1345,7 @@ static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
 		 * to ensure ordering of clflush wrt to the system.
 		 */
 		if (flushes & CLFLUSH_AFTER)
-			clflushopt(addr);
+			drm_clflush_virt_range(addr, sizeof(addr));
 	} else
 		*addr = value;
 }
-- 
2.25.1

