Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKSGOGySqWmoAAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:25:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B002134DB
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E97210E285;
	Thu,  5 Mar 2026 14:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWDhC8TB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312D910EB0E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 14:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772720745; x=1804256745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k94pl0Y58mcmOT3y1rCFfoYXYUd+RELa+zk5+N8kzio=;
 b=WWDhC8TBleP0z0zVjjDGX+2705VHv+1fJ1fkQBJxc9rcDqg/JLrJh4yE
 CKxOl8m+50MiQ00Qckpe4nHwoO3iw4Fz7VaCSpXze2sd2rOEdyVxb3Eaw
 YQuqnlp920e8TLt4Qc+wuDJdcBIqAjkWJgsavK3hMqMvOujHHxytTl89V
 sa7f7leM0/LxNSADTkyrDm8JIYXyUs/jx9CgBVAOZg9eThSpQDPQxQHCK
 akixF92UXi4Esk8z2EoFGDsUIOWMWLSSxNpHYs77vpIH/6TaY/MG+G87u
 GLEq2pAclXXzIKA9UEe5sjAykRSVKZIAspmJdhIqFN26Yx0rmEKyf6pI3 w==;
X-CSE-ConnectionGUID: ZB5cXraaTjiSxGGIwNqIYQ==
X-CSE-MsgGUID: DJgi5xlkQu6VP63szDAGlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="61379902"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="61379902"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:25:44 -0800
X-CSE-ConnectionGUID: 6rDS98tVRS2VZbf9CeIxYQ==
X-CSE-MsgGUID: V7A+yHFwRXSbkRI7HjVJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="215923994"
Received: from akacprow-dev3.igk.intel.com ([10.91.220.47])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:25:42 -0800
From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 maciej.falkowski@linux.intel.com,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Remove boot params address setting via MMIO
 register
Date: Thu,  5 Mar 2026 15:22:26 +0100
Message-Id: <20260305142226.194995-1-andrzej.kacprowski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
X-Rspamd-Queue-Id: 59B002134DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,linux.intel.com,amd.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andrzej.kacprowski@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The NPU 60XX uses the default boot params location specified
in the firmware image header, consistent with earlier generations.
Remove the unnecessary MMIO register write, freeing the AON register
for future use.

Fixes: 44e4c88951fa ("accel/ivpu: Implement warm boot flow for NPU6 and unify boot handling")
Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h | 6 ------
 drivers/accel/ivpu/ivpu_hw_ip.c       | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
index 421242acb184..fc0ee8d637f9 100644
--- a/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
+++ b/drivers/accel/ivpu/ivpu_hw_40xx_reg.h
@@ -121,12 +121,6 @@
 #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_STATUS_DLY			0x0003006cu
 #define VPU_50XX_HOST_SS_AON_PWR_ISLAND_STATUS_DLY_STATUS_DLY_MASK	GENMASK(7, 0)
 
-#define VPU_40XX_HOST_SS_AON_RETENTION0                                 0x0003000cu
-#define VPU_40XX_HOST_SS_AON_RETENTION1                                 0x00030010u
-#define VPU_40XX_HOST_SS_AON_RETENTION2                                 0x00030014u
-#define VPU_40XX_HOST_SS_AON_RETENTION3                                 0x00030018u
-#define VPU_40XX_HOST_SS_AON_RETENTION4                                 0x0003001cu
-
 #define VPU_40XX_HOST_SS_AON_IDLE_GEN					0x00030200u
 #define VPU_40XX_HOST_SS_AON_IDLE_GEN_EN_MASK				BIT_MASK(0)
 #define VPU_40XX_HOST_SS_AON_IDLE_GEN_HW_PG_EN_MASK			BIT_MASK(1)
diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
index 959984c54341..37f95a0551ed 100644
--- a/drivers/accel/ivpu/ivpu_hw_ip.c
+++ b/drivers/accel/ivpu/ivpu_hw_ip.c
@@ -931,7 +931,6 @@ static int soc_cpu_boot_40xx(struct ivpu_device *vdev)
 
 static int soc_cpu_boot_60xx(struct ivpu_device *vdev)
 {
-	REGV_WR64(VPU_40XX_HOST_SS_AON_RETENTION1, vdev->fw->mem_bp->vpu_addr);
 	soc_cpu_set_entry_point_40xx(vdev, vdev->fw->cold_boot_entry_point);
 
 	return 0;
-- 
2.34.1

