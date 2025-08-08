Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AF1B1E6FD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 13:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C501510E4E6;
	Fri,  8 Aug 2025 11:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1NEiWQc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A76410E4E6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 11:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754651484; x=1786187484;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=purJkrY6cjSNtJ1exYHy5qtfoWVMg/9NNlLuGBLP1Po=;
 b=P1NEiWQcifn0mKdx9AMYSrgeX+KDIA+ZivJTp07UTixKSa9U8vycZbSx
 e9AC/rBaviziqsjjD/7xo5ZUJ0DR5BKzRSxBADyP90K3yjfafAANB05o2
 BTKqevsd5X8iKdrQrsGca8wB67ZcD9fUz6s4Gsvts43fPpWH1ed9FVXM8
 PyQMtSw8kLO71E7WAoYsaWQw4P+aiNIu7SGC/RekLm4EML8lQJ1g0bAI8
 PQb0y6nR2z2Bvsn42jmbh19uBUtdB6l7vMDVwQIri8nlayPXw5zoKr5+5
 clVzQ+yTecK92aUtK0xEp6Y0Cbg+5FUNIPMVHQEOGMkicSX1o0ukANu6H g==;
X-CSE-ConnectionGUID: N+0pazg2QBmzEm2WivsD5w==
X-CSE-MsgGUID: +qGQo/AwQa27qFMbGcsmFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60623303"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="60623303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:11:24 -0700
X-CSE-ConnectionGUID: CVoyPoFfRNeUaFQjyN2uRg==
X-CSE-MsgGUID: mswnhxYUR86BhJsAwjTeAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169764961"
Received: from unknown (HELO jlawryno.igk.intel.com) ([10.91.220.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 04:11:22 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] accel/ivpu: Fix potential Spectre issue in debugfs
Date: Fri,  8 Aug 2025 13:11:20 +0200
Message-ID: <20250808111120.329022-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Fix potential Spectre vulnerability in repoted by smatch:
warn: potential spectre issue 'vdev->hw->hws.grace_period' [w] (local cap)
warn: potential spectre issue 'vdev->hw->hws.process_grace_period' [w] (local cap)
warn: potential spectre issue 'vdev->hw->hws.process_quantum' [w] (local cap)

The priority_bands_fops_write() function in ivpu_debugfs.c uses an
index 'band' derived from user input. This index is used to write to
the vdev->hw->hws.grace_period, vdev->hw->hws.process_grace_period,
and vdev->hw->hws.process_quantum arrays.

This pattern presented a potential Spectre Variant 1 (Bounds Check
Bypass) vulnerability. An attacker-controlled 'band' value could
theoretically lead to speculative out-of-bounds array writes if the
CPU speculatively executed these assignments before the bounds check
on 'band' was fully resolved.

This commit mitigates this potential vulnerability by sanitizing the
'band' index using array_index_nospec() before it is used in the
array assignments. The array_index_nospec() function ensures that
'band' is constrained to the valid range
[0, VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT - 1], even during
speculative execution.

Fixes: 320323d2e545 ("accel/ivpu: Add debugfs interface for setting HWS priority bands")
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index cd24ccd20ba6c..2ffe5bf8f1fab 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -5,6 +5,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/fault-inject.h>
+#include <linux/nospec.h>
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
@@ -464,6 +465,7 @@ priority_bands_fops_write(struct file *file, const char __user *user_buf, size_t
 	if (band >= VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT)
 		return -EINVAL;
 
+	band = array_index_nospec(band, VPU_JOB_SCHEDULING_PRIORITY_BAND_COUNT);
 	vdev->hw->hws.grace_period[band] = grace_period;
 	vdev->hw->hws.process_grace_period[band] = process_grace_period;
 	vdev->hw->hws.process_quantum[band] = process_quantum;
-- 
2.45.1

