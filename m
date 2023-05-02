Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E5E6F4DBC
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 01:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A859910E149;
	Tue,  2 May 2023 23:40:00 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0CA10E127;
 Tue,  2 May 2023 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683070798; x=1714606798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iTOCIJh8xOMcFcx3QwMEkF3KAA1MhumGZ1hg2579bb8=;
 b=AcGDYnaH7l+3qKrinIZOat6PCgh6fg6BrzXA5UZxeJpvJhdMfFjdUfi9
 fFMGZAr9lzjz6a0HYP6LKv+xh0Thl9WpMj+1f2EtD/98DpNUJVor1udaD
 TH4KmVxmsJCbyftqDEb0J9r+In6axiAJeFrKYbWWen6+pR6akALHavoGW
 61GiSxoUo1Nk5ZIf/G2KOQqaMjV7vyDXGEv9nqDaCYQLa6WatC3FR8jFf
 VkZTd3cRzta5oXmEfQERobTIlUjUW1A/G77fwTZu1f8yZCEipkZhee9T0
 KRV5MzwRsVWD9pveWyXR0epjzDQa8ot5TVIOdGN3KQymKwyZluhblFAFU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350601511"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="350601511"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 16:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="673865813"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; d="scan'208";a="673865813"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2023 16:39:56 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 2/6] drm/i915/guc: Print status register when waiting for
 GuC to load
Date: Tue,  2 May 2023 16:40:03 -0700
Message-Id: <20230502234007.1762014-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
References: <20230502234007.1762014-1-John.C.Harrison@Intel.com>
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

