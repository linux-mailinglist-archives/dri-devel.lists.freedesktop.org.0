Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9700582514C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 10:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F8810E5AE;
	Fri,  5 Jan 2024 09:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21B310E5A7;
 Fri,  5 Jan 2024 09:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704448550; x=1735984550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0fyJjtE39MtRw0n6dAI1gox+tD6l+yO4YrmdEtcCbLM=;
 b=HZFuHYxaRQzMzhZT7Dqq9onBIUtLaH3+DC99s0vana4blPXguLfQURIF
 lxIa6FneZsvl7SNhvgPvSD4fqgPGCKW3AjKamByXpavgnKEnru7w4cdVa
 5xTSjdNQ0Dck8EYb5VP7XQPBcrgm7fOX/vHp6VJmQaB70a2A8dLm/boNf
 X+u/TAGSGVbQQJDu2kEer8J+Yl1AwPpTYCtstWxHKyJBtHk7Sgfkx/1E2
 1EtnVb7f3hxiPC9BK8f6u8/agbeFtmCCq58ojsPuQNqgEiUKO0BqeGRoG
 X18KhB34UATITgxD+VIP4vO5gC8L4zPrREk0vF+948z1i8hxBo5nvbNHC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="10844364"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="10844364"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="22795935"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 01:55:48 -0800
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Fix assignment of integer to fixed point
 pbn_div
Date: Fri,  5 Jan 2024 11:55:59 +0200
Message-Id: <20240105095559.1136737-1-imre.deak@intel.com>
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
Cc: Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org,
 Wayne Lin <wayne.lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the merge conflict resolution in

commit 13feae00ee99e0fc8b6f1748fc4c70281a7d6939
Merge: eb284f4b37817 3c064aea46d07
Author: Dave Airlie <airlied@redhat.com>
Date:   Fri Jan 5 13:19:40 2024 +1000

    Merge remote-tracking branch 'drm/drm-next' into drm-tip

    # Conflicts:
    #       drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
    #       drivers/gpu/drm/i915/display/intel_dmc.c

@@@ -6916,7 -7007,8 +7009,7 @@@ static int dm_encoder_helper_atomic_che
        if (IS_ERR(mst_state))
                return PTR_ERR(mst_state);

 -      if (!mst_state->pbn_div.full)
 -              mst_state->pbn_div.full = dfixed_const(dm_mst_get_pbn_divider(aconnector->mst_root->dc_link));
 +      mst_state->pbn_div = dm_mst_get_pbn_divider(aconnector->mst_root->dc_link);

resulting from the following two changes:

commit 191dc43935d1ece82bc6c9653463b3b1cd8198fb
Author: Imre Deak <imre.deak@intel.com>
Date:   Thu Nov 16 15:18:31 2023 +0200

    drm/dp_mst: Store the MST PBN divider value in fixed point format

commit 9cdef4f720376ef0fb0febce1ed2377c19e531f9
Author: Wayne Lin <wayne.lin@amd.com>
Date:   Mon Dec 4 10:09:33 2023 +0800

    drm/amd/display: pbn_div need be updated for hotplug event

Cc: Wayne Lin <wayne.lin@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5d82bac1a51ab..f9714dd6fe8ed 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7009,7 +7009,7 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 	if (IS_ERR(mst_state))
 		return PTR_ERR(mst_state);
 
-	mst_state->pbn_div = dm_mst_get_pbn_divider(aconnector->mst_root->dc_link);
+	mst_state->pbn_div.full = dfixed_const(dm_mst_get_pbn_divider(aconnector->mst_root->dc_link));
 
 	if (!state->duplicated) {
 		int max_bpc = conn_state->max_requested_bpc;
-- 
2.39.2

