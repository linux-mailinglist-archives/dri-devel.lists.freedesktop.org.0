Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81011A04225
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F5410EABE;
	Tue,  7 Jan 2025 14:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5Pa6HpR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F8D10EAC7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736259763; x=1767795763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SkMdvjIWu78uAx/5XaEfIot2OY4QlhppHKKuETt5wvg=;
 b=d5Pa6HpR5r2eUxO8F+5UW0vPk+W3NfAmcXEkhOfPB3tDg71uays+lX9n
 oLQ9EB7tCAkGXNXEb9n0xNyabflVUFkBmbltWPhEPZsTytn04Fry6Dv0E
 2QNGvHc7xXUvXrENHs6pwFBI8fvcayOb9a11mIEoVY3SRwEbLPTSw3Sou
 VtUTLa46UNFbrTDlB7h0KTtpeaz3yYMPhYPI7fk+pCrlvK33GZgIhAu8i
 oTAxtq80aTkpUM+Bar5enJ3bxtzjlgPBTYWZ+Jh9n2hlfJK3vUnj0q/dT
 GXwlYaTVGLeX0doA3C4EUa1zYVvnz0UXJMrqnwD/3qLCzvOySKYUNM26H Q==;
X-CSE-ConnectionGUID: 73g4RJpAR86ox3miF+aOBw==
X-CSE-MsgGUID: xfS7FTncSQ2kvFVxgwjytw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36324448"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36324448"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:43 -0800
X-CSE-ConnectionGUID: 2HvIMn0iRlCptsB9Q4rs5g==
X-CSE-MsgGUID: aV/HXyovSDq5PZPiUYerWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103635465"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:22:42 -0800
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 jacek.lawrynowicz@linux.intel.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH 08/14] accel/ivpu: Fix missing MMU events from reserved SSID
Date: Tue,  7 Jan 2025 18:32:31 +0100
Message-ID: <20250107173238.381120-9-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Generate recovery when fault from reserved context is detected.
Add Abort (A) bit to reserved (1) SSID to ensure NPU also receives a fault.

There is no way to create a file_priv with reserved SSID
but it is still possible to receive MMU faults from that SSID
as it is a default NPU HW setting. Such situation will occur if
FW freed context related resources but still performed access to DRAM.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index ae1dcd04051c..b80bdded9fd7 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -725,8 +725,8 @@ static int ivpu_mmu_cdtab_entry_set(struct ivpu_device *vdev, u32 ssid, u64 cd_d
 	cd[2] = 0;
 	cd[3] = 0x0000000000007444;
 
-	/* For global context generate memory fault on VPU */
-	if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID)
+	/* For global and reserved contexts generate memory fault on VPU */
+	if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID || ssid == IVPU_RESERVED_CONTEXT_MMU_SSID)
 		cd[0] |= IVPU_MMU_CD_0_A;
 
 	if (valid)
@@ -945,7 +945,8 @@ void ivpu_mmu_irq_evtq_handler(struct ivpu_device *vdev)
 
 	while ((event = ivpu_mmu_get_event(vdev))) {
 		ssid = FIELD_GET(IVPU_MMU_EVT_SSID_MASK, *event);
-		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID) {
+		if (ssid == IVPU_GLOBAL_CONTEXT_MMU_SSID ||
+		    ssid == IVPU_RESERVED_CONTEXT_MMU_SSID) {
 			ivpu_mmu_dump_event(vdev, event);
 			ivpu_pm_trigger_recovery(vdev, "MMU event");
 			return;
-- 
2.43.0

