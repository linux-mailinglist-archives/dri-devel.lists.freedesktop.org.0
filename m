Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C294A8CE6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 21:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBC010E515;
	Thu,  3 Feb 2022 20:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C49A10E226;
 Thu,  3 Feb 2022 20:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643918650; x=1675454650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o6HuYlnP32PX1lqgHE1fsvZCwjUKZXMxGSqa7+v9E8k=;
 b=BY+156zUzRqjEh1ztTskosFalzruNuToHkt7pFoDWzty01mnP4ch+OAG
 eTOgRKC14TcGov39auLssKTOQp3l0q/FhKTleyB4anHf8UZtwj50W7za/
 LpPtO5/rydrOmoXAOQPEXp1QJDzo1bUEub5cZSdrAPoVCVWWZ8N4XyaUe
 1GRsGwbmQpIBUZhZug6lR6lmERqEfroAvGctGcxoryiYTb9PX+mA4MBb1
 xLUAJtTJW04gWHv04nrBKvXoaiIDoPxdalSZoiKDXvAvxjYgRonLV6dJR
 xMqU0iwtd8v19mp2UpQqXbGILSlIhDHW0GXbywkQV8lcdg5aR5d88OljG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="311545998"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="311545998"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 12:04:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="538894395"
Received: from gearygra-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.lan)
 ([10.212.225.194])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 12:04:09 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm/i915/: Re-work clflush_write32
Date: Thu,  3 Feb 2022 12:04:03 -0800
Message-Id: <20220203200403.378958-5-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203200403.378958-1-michael.cheng@intel.com>
References: <20220203200403.378958-1-michael.cheng@intel.com>
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

