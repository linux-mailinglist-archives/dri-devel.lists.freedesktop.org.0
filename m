Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D86E2E12
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 02:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B133610EEF5;
	Sat, 15 Apr 2023 00:57:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779C810EEE5;
 Sat, 15 Apr 2023 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681520241; x=1713056241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SsEs8FdjFtkCXqLJT8dh3rIIha0g1MjeMGetbeIswlM=;
 b=PbSW1hg/Fb0Bf7eM4Vh/fdlx7S4PtH18YqEEiD5Vrbg1aE9AfQ9jYm4X
 gkKWzCIDkRhnYnYhyGowLbrjWDvWT30d5d+hWMwwlJ/3NmdCYO3EBTV8d
 QPowNoJhItY5MWjkM+QQjC95ifp3xFfYUlUfsnbFGM4m3yc33AEXfevEo
 x6AIXN9nKSRawybu9bDtKXA0A2MtKNzurmd3LAAaG2bDzb6dEltGE9LZV
 XgxVfuYSCBpa2nUk8nqTRjWOzrI6pZMLdAd2Rl3qLEaOoJ+KM2ZsE0mDP
 xLvciTn2DnB2NAs4veO7QXD8vABAOIGH1WrbEtM42rilU8hTsVKeyO/QL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372471781"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="372471781"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 17:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722643204"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="722643204"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 17:57:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/5] drm/i915/guc: Print status register when waiting for GuC
 to load
Date: Fri, 14 Apr 2023 17:57:03 -0700
Message-Id: <20230415005706.4135485-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
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

If the GuC load is taking an excessively long time, the wait loop
currently prints the GT frequency. Extend that to include the GuC
status as well so we can see if the GuC is actually making progress or
not.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 0ff088a5e51a8..364d0d546ec82 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -191,8 +191,10 @@ static int guc_wait_ucode(struct intel_guc *guc)
 		if (!ret || !success)
 			break;
 
-		guc_dbg(guc, "load still in progress, count = %d, freq = %dMHz\n",
-			count, intel_rps_read_actual_frequency(&uncore->gt->rps));
+		guc_dbg(guc, "load still in progress, count = %d, freq = %dMHz, status = 0x%08X [0x%02X/%02X]\n",
+			count, intel_rps_read_actual_frequency(&uncore->gt->rps), status,
+			REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			REG_FIELD_GET(GS_UKERNEL_MASK, status));
 	}
 	after = ktime_get();
 	delta = ktime_sub(after, before);
-- 
2.39.1

