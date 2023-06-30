Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B60744342
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBDB10E4F0;
	Fri, 30 Jun 2023 20:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A6810E4E5;
 Fri, 30 Jun 2023 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688157332; x=1719693332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B2l7vaBr92b0fDwNo+60RgYqu+bSkrcypRt6KBcxEUY=;
 b=FzlIav/aVAQ4soew3pqJCytTJX0ryxSUzh10sYDheQXNcnJEtiqYPeTq
 QDQGx9FkGtaObDfnZFAHPUKXdvvD7vHZpPX4sBfrHKdFU8lrCf3p2r6xI
 2/YZEBQhcd4wFindQOBuDyMkxCVUUDZLtZQg//LMhHQAUbnU8FTNxWsdb
 wXwp192xzRu44IlEHbvLjv5BS8x5Yy85/B34haQJqX8mjJyTN/PtvI8Ar
 MCwnen1FQojCFPrf/mmBZTKlXFCTiVZ0mVm3wSEvfPL4FS7bStIJYm8YU
 PyuYKpZ+1OPCQYIl5zgqSXEXo6+EXv8SO8LIcJZoGoY4vQa8pf2pBrFpW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="393213921"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="393213921"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="807904267"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="807904267"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 13:35:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/i915/gt: Also check set bits in clr_set()
Date: Fri, 30 Jun 2023 13:35:09 -0700
Message-Id: <20230630203509.1635216-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630203509.1635216-1-lucas.demarchi@intel.com>
References: <20230630203509.1635216-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Matt Roper <matthew.d.roper@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When checking if the workarounds were applied succesfully, the read-back
mask should also contain the bits being set: it's possible that in a
call to wa_write_clr_set(), the cleared bits are not a superset of the
set bits.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index a6f3f160ebe2..b177c588698b 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -241,13 +241,13 @@ static void wa_mcr_add(struct i915_wa_list *wal, i915_mcr_reg_t reg,
 static void
 wa_write_clr_set(struct i915_wa_list *wal, i915_reg_t reg, u32 clear, u32 set)
 {
-	wa_add(wal, reg, clear, set, clear, false);
+	wa_add(wal, reg, clear, set, clear | set, false);
 }
 
 static void
 wa_mcr_write_clr_set(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 clear, u32 set)
 {
-	wa_mcr_add(wal, reg, clear, set, clear, false);
+	wa_mcr_add(wal, reg, clear, set, clear | set, false);
 }
 
 static void
-- 
2.40.1

