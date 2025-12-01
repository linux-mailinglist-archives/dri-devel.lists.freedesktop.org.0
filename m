Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67EC98BF2
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0A010E46B;
	Mon,  1 Dec 2025 18:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5hC8nRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E0710E457;
 Mon,  1 Dec 2025 18:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764614400; x=1796150400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bcVBQ8kmpZEzuCT82vnR5E5HfDCq6U4kbrIAvZ6uACI=;
 b=W5hC8nRn48VIs7MTa+to9HVLMsTzzdvUBatvIfbeZOaEHq8AGZec3mUB
 YpsiJ09pRP42lAfeSBlytzsXuUaLFJuF1AzyjejyuE5RVsCwTqyI0WA/L
 3kgZ534cSpqIuJAjVEeCQ92TMCtMw63WMOd5XZZ3acm5IjjL8IKl2uecu
 RyCsQ8k+/WDV792hzm0xJETokRkZmwlC5lc1dkPmA4GQHBIUx9W/5M/OP
 0/rbrepVwEd7A6XKPPjrEKPtCymCd1DQ131GdelvxE8BdhPuEEPgj7VeE
 1trxvAlUwNtq1GTZ8Jc37js7Yx8EgXBsM4qO9Q96vynsqaq3lQRpSSv1y A==;
X-CSE-ConnectionGUID: XiXU7p4zSqCu2cBuWgtc+w==
X-CSE-MsgGUID: gWI+SXwzQXOQxWh2dC68rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78031150"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="78031150"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:40:00 -0800
X-CSE-ConnectionGUID: VaQqkMFrQo+dExCxj9Ub3g==
X-CSE-MsgGUID: NZw9KfR9Se6Il2WZxuck1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194359108"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:39:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 8/9] drm/xe: Disable timestamp WA on VFs
Date: Mon,  1 Dec 2025 10:39:53 -0800
Message-Id: <20251201183954.852637-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201183954.852637-1-matthew.brost@intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
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

The timestamp WA does not work on a VF because it requires reading MMIO
registers, which are inaccessible on a VF. This timestamp WA confuses
LRC sampling on a VF during TDR, as the LRC timestamp would always read
as 1 for any active context. Disable the timestamp WA on VFs to avoid
this confusion.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_lrc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index a05060f75e7e..166353455f8f 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1063,6 +1063,9 @@ static ssize_t setup_utilization_wa(struct xe_lrc *lrc,
 {
 	u32 *cmd = batch;
 
+	if (IS_SRIOV_VF(gt_to_xe(lrc->gt)))
+		return 0;
+
 	if (xe_gt_WARN_ON(lrc->gt, max_len < 12))
 		return -ENOSPC;
 
-- 
2.34.1

