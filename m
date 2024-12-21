Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B19F9DCF
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2024 02:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF6D10E2EE;
	Sat, 21 Dec 2024 01:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iptv1g8e";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F26910E2EE;
 Sat, 21 Dec 2024 01:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734745413; x=1766281413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vu0HV4Z4erHfTjzNm7b2gKZEZNetghdVzp06IY/tx3A=;
 b=iptv1g8elmfJgiF7PClTbzAxpiyubAoEbNvKasl2JSZYldJiKrQAZDs+
 XQKXSMYKgUxzo3+RjSEh6ox50e9xy08x9ML5UWtzk1pAEKq7CO0CycilY
 IVNFj9nsSGjLJ6i9bNwyySvS/u3E58veyjfpXjZhtkFOtmgAy7uPchTkH
 xH6nMKBTHah6nS5AVTc5eggdVLf/yKx4nRypcfFIh7AN3ouiTqDKiZJME
 NmwIj3BAZi3m8bBzW68Kr5tLrodSSp0TyYQSuxzayUd1ko4Ucjgga0wY4
 TOdhsP2f3v4eqFYJBsjRHsHUH3H+h6HBKZFeZx0GHyAEUyaQu8PkPzKGc w==;
X-CSE-ConnectionGUID: pIw4xdQuTCmVMGFk4iPgzw==
X-CSE-MsgGUID: pEOfe44YTk+nt99U8g6tTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46722396"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="46722396"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 17:43:32 -0800
X-CSE-ConnectionGUID: /0UMH2QXSeiNrFwWvutspQ==
X-CSE-MsgGUID: jmrgxnsJSBenGwjHvVflow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="103731623"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa003.jf.intel.com with ESMTP; 20 Dec 2024 17:43:29 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/i915/uc: Include requested frequency in slow firmware
 load messages
Date: Fri, 20 Dec 2024 17:43:29 -0800
Message-ID: <20241221014329.4048408-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

To aid debug of sporadic issues, include the requested frequency in
the debug message as well as the actual frequency. That way we know
for certain that the clamping is not because the driver forgot to ask.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 11 ++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 12 +++++++-----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index fe53e8eccf4b1..e7ccfa520df3a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -259,13 +259,14 @@ static int guc_wait_ucode(struct intel_guc *guc)
 	} else if (delta_ms > 200) {
 		guc_warn(guc, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
 			 delta_ms, status, count, ret);
-		guc_warn(guc, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
-			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
+		guc_warn(guc, "excessive init time: [freq = %dMHz -> %dMHz vs %dMHz, perf_limit_reasons = 0x%08X]\n",
+			 before_freq, intel_rps_read_actual_frequency(&gt->rps),
+			 intel_rps_get_requested_frequency(&gt->rps),
 			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
 	} else {
-		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
-			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
-			before_freq, status, count, ret);
+		guc_dbg(guc, "init took %lldms, freq = %dMHz -> %dMHz vs %dMHz, status = 0x%08X, count = %d, ret = %d\n",
+			delta_ms, before_freq, intel_rps_read_actual_frequency(&gt->rps),
+			intel_rps_get_requested_frequency(&gt->rps), status, count, ret);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index d7ac31c3254cf..6fdbe1108ce59 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -502,13 +502,15 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
 	if (delta_ms > 50) {
 		huc_warn(huc, "excessive auth time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
 			 delta_ms, huc->status[type].reg.reg, count, ret);
-		huc_warn(huc, "excessive auth time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
-			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
+		huc_warn(huc, "excessive auth time: [freq = %dMHz -> %dMHz vs %dMHz, perf_limit_reasons = 0x%08X]\n",
+			 before_freq, intel_rps_read_actual_frequency(&gt->rps),
+			 intel_rps_get_requested_frequency(&gt->rps),
 			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
 	} else {
-		huc_dbg(huc, "auth took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
-			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
-			before_freq, huc->status[type].reg.reg, count, ret);
+		huc_dbg(huc, "auth took %lldms, freq = %dMHz -> %dMHz vs %dMHz, status = 0x%08X, count = %d, ret = %d\n",
+			delta_ms, before_freq, intel_rps_read_actual_frequency(&gt->rps),
+			intel_rps_get_requested_frequency(&gt->rps),
+			huc->status[type].reg.reg, count, ret);
 	}
 
 	/* mark the load process as complete even if the wait failed */
-- 
2.47.0

