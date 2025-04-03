Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B5DA7AE5D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 22:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8D610EB35;
	Thu,  3 Apr 2025 20:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyyYxpzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CBC10EA5A;
 Thu,  3 Apr 2025 20:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743711955; x=1775247955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12plUmyAMQbrqtMr8rbW/3nEIAi2BVyriKWTFI0IVxI=;
 b=gyyYxpzoVIWK4B4fStB/e8+0bF9xN9JhDa5N64Yr9ZP4n7Gcqjqm+6c5
 Z2Ryvt9o18KUrOI9b+TB83gCImUOtej0POCGOvfTljpo/5l0EmikYTtMU
 8eqMauAjHrUlAvDj3oHQD+HCAP/4x/VVV4aohoWC2bzhEvTiuqmlOJ4KD
 PQMDLBAV7XYHjb12ezyIL2YYfwJaMOs3YL5zfCJUtwh6R5zTMqr5gGljU
 Zxec0yK/foxI6jasQCxaRXDChStrukQQOldO7spVVB6j2ip16u64AvxR6
 0Po5T1iPz4TZ8ykMSBqAc1VmoRGGghsAuMMnmzTcV78pAYHi4oe+Hi5GY Q==;
X-CSE-ConnectionGUID: unKtO4VhQhOTZBEBJK8vAQ==
X-CSE-MsgGUID: 9oq4qbpIRBGwxfA7aY0dqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55337819"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="55337819"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:55 -0700
X-CSE-ConnectionGUID: GuNSZSQ/R1KX+mSaqRm7tw==
X-CSE-MsgGUID: 4SO+TzQ6QVaLrxJ9fkcvkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="127972863"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 13:25:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/xe: Abort printing coredump in VM printer output
 if full
Date: Thu,  3 Apr 2025 13:27:05 -0700
Message-Id: <20250403202705.18488-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403202705.18488-1-matthew.brost@intel.com>
References: <20250403202705.18488-1-matthew.brost@intel.com>
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

Abort printing coredump in VM printer output if full. Helps speedup
large coredumps which need to walked multiple times in
xe_devcoredump_read.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 864266e38aa7..164824617a2e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3847,6 +3847,9 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
 		}
 
 		drm_puts(p, "\n");
+
+		if (drm_printer_is_full(p))
+			return;
 	}
 }
 
-- 
2.34.1

