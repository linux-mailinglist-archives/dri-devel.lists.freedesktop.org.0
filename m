Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A834C3C63
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 04:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6807910E844;
	Fri, 25 Feb 2022 03:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF50710E742;
 Fri, 25 Feb 2022 03:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645759486; x=1677295486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZGGKF90LmvsWYDLVJRwUsAXZp1v93VwC/mjN5XKbaus=;
 b=DoOE1mJAvXaYeM7UuX4NlmI8NLeQVRr28ThmRVKg/0FtY+iM8Ai0qYwQ
 UJqYfb1L70A9aNBI8vXnBKpCKU53WWHyknaLzzloCS2+FLbtQ8jJdmve5
 IlNI7kluA99BZtA+aP08cGbIH6mGo4X5dgg/4Z6QPkxWaBA8muw02U1Lk
 WKaaqPLUJKacLv6XUFd30WJ0sSkuDgBOzkRaSK4OIX3nxHbJs8GpQD87Z
 Ym4NwjYW5nn9/Wq+FXTFYTcZAmrbs4/kzPLMVhu4NlJDu3UMUX92AMeyU
 xZPFJVyPglbjZTkm3JKupspWdqMHbn+J2nfqWrRS5bVPUb/bnb4oUOcas Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="277044513"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="277044513"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 19:24:45 -0800
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="638087462"
Received: from slwinche-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.212.150.224])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 19:24:43 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 5/6] drm/i915/: Re-work clflush_write32
Date: Thu, 24 Feb 2022 19:24:35 -0800
Message-Id: <20220225032436.904942-6-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225032436.904942-1-michael.cheng@intel.com>
References: <20220225032436.904942-1-michael.cheng@intel.com>
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
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_clflush_virt_range instead of clflushopt and remove the memory
barrier, since drm_clflush_virt_range takes care of that.

v2(Michael Cheng): Use sizeof(*addr) instead of sizeof(addr) to get the
		   actual size of the page. Thanks to Matt Roper for
		   pointing this out.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 89aa0557ade1..0ca6c3d810da 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1333,10 +1333,8 @@ static void *reloc_vaddr(struct i915_vma *vma,
 static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
 {
 	if (unlikely(flushes & (CLFLUSH_BEFORE | CLFLUSH_AFTER))) {
-		if (flushes & CLFLUSH_BEFORE) {
-			clflushopt(addr);
-			mb();
-		}
+		if (flushes & CLFLUSH_BEFORE)
+			drm_clflush_virt_range(addr, sizeof(*addr));
 
 		*addr = value;
 
@@ -1348,7 +1346,7 @@ static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
 		 * to ensure ordering of clflush wrt to the system.
 		 */
 		if (flushes & CLFLUSH_AFTER)
-			clflushopt(addr);
+			drm_clflush_virt_range(addr, sizeof(*addr));
 	} else
 		*addr = value;
 }
-- 
2.25.1

