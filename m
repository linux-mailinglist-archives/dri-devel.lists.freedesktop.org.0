Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14142511C71
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 18:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C63C10F697;
	Wed, 27 Apr 2022 16:55:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666A910F697;
 Wed, 27 Apr 2022 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651078551; x=1682614551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DmljEI6E94UXA/VYOIrFha99X/lxbRzNReQc/Kow9MA=;
 b=TAI1u7+bPwnXyD8JnCgLdY2NzVByF+IoWgJkJr5ozuUKnd2GKLZDixWM
 fXmrodl6arDgPTfItvVsiWlr9VAOXVYpIVWQQ2Y0bRKknj2DN5G7RKkVS
 5qpppdb1lj+ofxbH1oIDr3eZ+DYd1zChm36pBL3i9M/Z4H5Dxx4YCa8oZ
 bRsRYfwD5Drcg26fbN5hJzFkog+x5d8Z7faZvGOhWSTMTr37f9twhzcUI
 WjSPRJS2dGVheJFprKQI0BhZvdrpwW+88QN6Co5btulzL7Nrfyj/huB1G
 vEOx96xz7CapVHH1GapZV3B6twfomS0E+TbIrWhmD5CQlzOtydxuBcFyN g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265812198"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="265812198"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 09:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="540186180"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 27 Apr 2022 09:55:50 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/2] Revert "drm/i915/dg2: Define GuC firmware version for DG2"
Date: Wed, 27 Apr 2022 09:55:49 -0700
Message-Id: <20220427165550.3636686-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427165550.3636686-1-John.C.Harrison@Intel.com>
References: <20220427165550.3636686-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

This reverts commit 55c7f980e48e56861496526e02ed5bbfdac49ede.

The CI topic branch within drm-top contains an old patch for
supporting GuC on DG2. That needs to be dropped and an updated patch
merged to drm-gt-next. Hence this patch reverts it so the new patch
can be sent in it's correct form for CI testing.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index cb5dd16421d0..a876d39e6bcf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -53,7 +53,6 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * firmware as TGL.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
-	fw_def(DG2,          0, guc_def(dg2,  70, 1, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 1, 1)) \
 	fw_def(DG1,          0, guc_def(dg1,  70, 1, 1)) \
-- 
2.25.1

