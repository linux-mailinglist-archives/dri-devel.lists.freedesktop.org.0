Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E801A21D61
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C7610E7EB;
	Wed, 29 Jan 2025 12:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtkePpMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E6E10E7ED
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738155597; x=1769691597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+wsYi3VWsNb/svrBD49XbrdqbSzOLk09O73qruFnamo=;
 b=QtkePpMOc3yWQldTRQrmvzJrpsZAqFlt5qu7IobdQvgg5ynZF73itacq
 uYGr9wH83yJAnD3xA8EshtPWst+IoI2BrMrjhT1BQu5eVCProM2qq0e6E
 KbSzicBAfRrfVeQb+hlOTNLNQisx74IrQCHBfp0GaNuc8oOmA/V5mwbFn
 tgK2fOd+57lbFmPjZdXwj2k/GcrbL8McySswUS09XG3WVDma+yT8BQs/8
 35a6i9ckN3CTSnlxKbMEKJ0zMBkAX8A5GXAS6ydf4556wBtKPaTwlu/u6
 2yAvpl8kVm5olVOCS1QrmK05Fv5HpCxvmnUA4Ko4MG5ios+WMxgeFat7b w==;
X-CSE-ConnectionGUID: oyMcFTrOQXCXbMTI71svwg==
X-CSE-MsgGUID: R8/p+202S56+XrKzyMEeVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50080744"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50080744"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:59:57 -0800
X-CSE-ConnectionGUID: Rnq9qk/LSTakzDveEWwTFA==
X-CSE-MsgGUID: BsmbCyxgRzyaVKILRoJm9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109937347"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 04:56:42 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Karol Wachowski <karol.wachowski@intel.com>
Subject: [PATCH 2/6] accel/ivpu: Update last_busy in IRQ handler
Date: Wed, 29 Jan 2025 13:56:32 +0100
Message-ID: <20250129125636.1047413-3-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
References: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
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

Call pm_runtime_mark_last_busy() in top half of IRQ handler to prevent
device from being runtime suspended before bottom half is executed on
a workqueue.

Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_hw.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw.c b/drivers/accel/ivpu/ivpu_hw.c
index 8099ab047bfe6..4199f0bbb435b 100644
--- a/drivers/accel/ivpu/ivpu_hw.c
+++ b/drivers/accel/ivpu/ivpu_hw.c
@@ -10,6 +10,7 @@
 
 #include <linux/dmi.h>
 #include <linux/fault-inject.h>
+#include <linux/pm_runtime.h>
 
 #ifdef CONFIG_FAULT_INJECTION
 DECLARE_FAULT_ATTR(ivpu_hw_failure);
@@ -331,7 +332,9 @@ irqreturn_t ivpu_hw_irq_handler(int irq, void *ptr)
 	/* Re-enable global interrupts to re-trigger MSI for pending interrupts */
 	ivpu_hw_btrs_global_int_enable(vdev);
 
-	if (ip_handled || btrs_handled)
-		return IRQ_HANDLED;
-	return IRQ_NONE;
+	if (!ip_handled && !btrs_handled)
+		return IRQ_NONE;
+
+	pm_runtime_mark_last_busy(vdev->drm.dev);
+	return IRQ_HANDLED;
 }
-- 
2.45.1

