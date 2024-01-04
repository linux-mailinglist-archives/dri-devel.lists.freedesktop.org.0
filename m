Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE7B824118
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 12:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28A910E437;
	Thu,  4 Jan 2024 11:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0341C10E437
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704369446; x=1735905446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UWNLdrcrKTEq+t2GiyY0xLZPjEC7J0rSpLBMMGOEOO0=;
 b=fIUisxbF6JJWTHb2D1K5OH0L1HTxuFk47ZKIi6OLh1phkZZQny5LJ5hI
 GK3Xq3/nPCCIB/AhF1zK2/9LRvY6RbgzyiCTWU1XE0154PrNZMXRa17U1
 VBJJXn0QKb+il0Ajc55m4m3bd/X2iYSOuJD9eOQkaZJug7naw8IeBJW2L
 oHP80O3vfA8dP9F8LOB7hfyavI+hNGNhKAih6jf46PMRRuCX7fkQc5qfz
 WFbx3V925oYMJGgddDkpsDBIGBFKM5FTaRD3ykhppGrAt10iqsexEqKH+
 f6Q7GjrlFHhhD/jZUZkm0XPEHqV6VzdTxKiaaz1AjoYyiNHl1yoNdmh5M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="4584127"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4584127"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="899275712"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899275712"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 03:57:24 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/16] accel/ivpu: Call diagnose failure in
 ivpu_mmu_cmdq_sync()
Date: Thu,  4 Jan 2024 12:56:59 +0100
Message-ID: <20240104115713.8657-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
References: <20240104115713.8657-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, "Wachowski,
 Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Check for possible failure reasons in the buttress.
Some errors (like external abort) should have corresponding buttress errors
registers set indicating the real reason of failure.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 92ef651098d8..1f813625aab3 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -7,6 +7,7 @@
 #include <linux/highmem.h>
 
 #include "ivpu_drv.h"
+#include "ivpu_hw.h"
 #include "ivpu_hw_reg_io.h"
 #include "ivpu_mmu.h"
 #include "ivpu_mmu_context.h"
@@ -518,6 +519,7 @@ static int ivpu_mmu_cmdq_sync(struct ivpu_device *vdev)
 
 		ivpu_err(vdev, "Timed out waiting for MMU consumer: %d, error: %s\n", ret,
 			 ivpu_mmu_cmdq_err_to_str(err));
+		ivpu_hw_diagnose_failure(vdev);
 	}
 
 	return ret;
-- 
2.43.0

