Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562EC6EA0E6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 03:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C11710ED72;
	Fri, 21 Apr 2023 01:15:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCA610E12F;
 Fri, 21 Apr 2023 01:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682039732; x=1713575732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iTOCIJh8xOMcFcx3QwMEkF3KAA1MhumGZ1hg2579bb8=;
 b=GhOasBan+gs3HscpEcVPbl5IG6NGzF1xDY/Pg5QHG9AXen27gXpWRGSa
 UIHftEPSQNV4H8683Im7JG2mNiETUqTlMBO9cOxtZkMSOca9iSOylUX1Z
 ZpgGlij9OW6+aflYruJcwA+F0vuzVwDkR735pqBGh0YzkY5nTCtVdV9VM
 8YhRgtkBrATenu0NLZdyOfgHlN4p9P9ZOwib30vrdDZ4i/gUvTfMpb1RM
 QEn39osTxJcZkcOKYqU8ivRfXwjN6FEnuzOrgl9h0TyQV/tiHuDPlmK4j
 It4uOPoPwoV90K55mfoHqbwCFnDijbOx03fsj4UC6YUSA5fmgYMPKrtWX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="343380937"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="343380937"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 18:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692114483"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="692114483"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 18:15:30 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/6] drm/i915/guc: Print status register when waiting for GuC
 to load
Date: Thu, 20 Apr 2023 18:15:21 -0700
Message-Id: <20230421011525.3282664-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

If the GuC load is taking an excessively long time, the wait loop
currently prints the GT frequency. Extend that to include the GuC
status as well so we can see if the GuC is actually making progress or
not.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
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

