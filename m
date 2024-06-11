Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02B2903B6F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 14:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D3710E607;
	Tue, 11 Jun 2024 12:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjy3ddGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE84910E5F0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 12:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718107489; x=1749643489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=39UH27N6P/p+cROuV2xQd+FvOHjjvlsREzCYAcRwDlE=;
 b=mjy3ddGBfGeHQFT1XwHG4YAeNNQZJsZiOnbPJzMV41cnnkdP+1fnFZwo
 AM/xO3tKLKtNnuBUlTTV2GXlVJAv7irK9mh1gqB1+W3G2nWdKGag59+tI
 DCFZ/0tyWuLDSFxAeXgVNx+NV6arOWUYWTjul/RQUXxUhm5z1fFIBZFqE
 SN6CYA8le/YhGSyh1+Bh3pKpyRViSElmsgxpRLg7JkTlKX788kwn86GkW
 BPWaBoQ/vuWOrQu+PEDG+6l5clZkV6JHQGnwgFs7R75tsBorAhEoRJtUA
 B4xOhv7PSjZN5oUR1CONWjTnwHqd3doPz/jZwQkrYQeeP4oJd9ANWQYgM Q==;
X-CSE-ConnectionGUID: rqSl5YV1Rn6JDL7BWk2Zmw==
X-CSE-MsgGUID: NkTUU6RRQi6qhzrlgqWr/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="32296060"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="32296060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:49 -0700
X-CSE-ConnectionGUID: 8uzqmnFBQXq5gy2O/dHIHQ==
X-CSE-MsgGUID: eXL53BVwTpWADmpHE49TAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39877061"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 05:04:47 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 07/15] accel/ivpu: Make selected params read-only
Date: Tue, 11 Jun 2024 14:04:24 +0200
Message-ID: <20240611120433.1012423-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
References: <20240611120433.1012423-1-jacek.lawrynowicz@linux.intel.com>
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

Make disable_mmu_cont_pages and force_snoop params read-only.
It is unsafe to change these params after driver is loaded.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ce91eafe5746..c59c6f113098 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -58,11 +58,11 @@ module_param_named(sched_mode, ivpu_sched_mode, int, 0444);
 MODULE_PARM_DESC(sched_mode, "Scheduler mode: 0 - Default scheduler, 1 - Force HW scheduler");
 
 bool ivpu_disable_mmu_cont_pages;
-module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0644);
+module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0444);
 MODULE_PARM_DESC(disable_mmu_cont_pages, "Disable MMU contiguous pages optimization");
 
 bool ivpu_force_snoop;
-module_param_named(force_snoop, ivpu_force_snoop, bool, 0644);
+module_param_named(force_snoop, ivpu_force_snoop, bool, 0444);
 MODULE_PARM_DESC(force_snoop, "Force snooping for NPU host memory access");
 
 struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv)
-- 
2.45.1

