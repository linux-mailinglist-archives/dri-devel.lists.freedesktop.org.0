Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2D4E32BD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 23:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A3310E4A6;
	Mon, 21 Mar 2022 22:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EA810E49F;
 Mon, 21 Mar 2022 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647902308; x=1679438308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iy9YArgAbPl2mC3L2YJIlihmkHxoD9W0X1K8+lQjIT8=;
 b=NWsPxLj4WDmqtCQ5lqqO7g7wutrsEk5KTFUj9dK6OK1N/fpv3fOcj1rk
 AYEwMjROWhY63br0Cj+kwwH3T16ru6hs04IuWkB/pYJSki1Yuv1z71hES
 eFOGQM3Eqa2CjopU5sU0T4t4rfotD5WsxaWGw893CrR8HbXGV+k2h8cwt
 jtf19qBzgmSOr8Y/0PzwSsZfmI4GyJVabhNpMt2Q/FtOOFtyxmUE5vJFR
 G4an+lpf1AZ0/2kN67HcILs2BKE9M8/uvVeZvH0VUWIBdPNn3dB/cF5x9
 eZry6WZuk1iKAOAh9w1M98CXReuOsafUxYcyqAiJWNoiHHIh1aNsjS82s Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="256484995"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="256484995"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:38:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="518616779"
Received: from prithika-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.251.16.248])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 15:38:24 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v13 4/5] drm/i915/: Re-work clflush_write32
Date: Mon, 21 Mar 2022 15:38:18 -0700
Message-Id: <20220321223819.72833-5-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321223819.72833-1-michael.cheng@intel.com>
References: <20220321223819.72833-1-michael.cheng@intel.com>
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com, casey.g.bowman@intel.com,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org
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
index 631bc268e7c8..42a49fd2f2ab 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1334,10 +1334,8 @@ static void *reloc_vaddr(struct i915_vma *vma,
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
 
@@ -1349,7 +1347,7 @@ static void clflush_write32(u32 *addr, u32 value, unsigned int flushes)
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

