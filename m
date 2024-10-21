Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B43809A7173
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 19:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9334410E574;
	Mon, 21 Oct 2024 17:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPYc8vBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A4C10E573;
 Mon, 21 Oct 2024 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729533402; x=1761069402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eABO20KdisM/PVaQcce6fai1+qRPiAxKbPBDQTQgfNQ=;
 b=hPYc8vBxryEVwcc1AmpDycAMCaaiKMUjsClmleenM2OOcrW81kiJqlgF
 Tp2zI+2D20sKGyT1SZSEzuAsgOIxlJjwzh6Qzgz84OMgRW2Bwtck9VlnY
 NMGz5D2G/U9p0VB2BvtltfHs2yoQxt0U/GOKWynIB0ra276VVNYlRXK3S
 8lPGcyzcb0roFGKak0U8OmUIx9ab7FX6QWQY7kTi1/f4m0lpoCrGX/yZh
 6UbnW1hZyZV3eWv5e8Xum7TEZ2SnYQoZC4BEw5+Ic4Dv1ErlouN74UPDz
 LWiu2B0qkMXNeziWUz8Wkgudnz4qlxS2R+SKDhkx3okJV0O4rfX8XAaxZ g==;
X-CSE-ConnectionGUID: 3KzuEpcdQiixQt4EsuiVuw==
X-CSE-MsgGUID: ajzEMk0xRpKX6mg6n50KSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28910181"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="28910181"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:56:40 -0700
X-CSE-ConnectionGUID: 5Zop7EWmRAOjlj6HrIBzog==
X-CSE-MsgGUID: a3iLNbI/TduTmeUfkVz2yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79680269"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:56:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org,
	pstanner@redhat.com
Subject: [PATCH 3/4] drm/xe: Mark G2H work queue with WQ_MEM_RECLAIM
Date: Mon, 21 Oct 2024 10:57:04 -0700
Message-Id: <20241021175705.1584521-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021175705.1584521-1-matthew.brost@intel.com>
References: <20241021175705.1584521-1-matthew.brost@intel.com>
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

G2H work queue can be used to free memory thus we should allow this work
queue to run during reclaim. Mark with G2H work queue with
WQ_MEM_RECLAIM appropriately.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index c260d8840990..1b5d8fb1033a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -213,7 +213,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
 
-	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", 0);
+	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);
 	if (!ct->g2h_wq)
 		return -ENOMEM;
 
-- 
2.34.1

