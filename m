Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CC73F0BE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 04:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EEC88E26;
	Tue, 27 Jun 2023 02:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC83C88E26;
 Tue, 27 Jun 2023 02:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687832010; x=1719368010;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1XCeFA5MmGpVCymJ5gXTLicGu5J96lw/hfhngFkb6aE=;
 b=nhWn+hULabeWs3L/W/jjwUEcqn2iR9SL3moKxUSLGVh6BFCV6cAY5p6m
 ASMAi0os6UbmqiskhXvvOkhGg0slGc3fmR3g4unVX2CSPx2mPNAW1hofX
 jUIvx/MI3QbXnDcKGlklQqwij/5nx6kFTY1Z0ZyEA/efrfm4mpCQaNtpJ
 Q9ZLwlQsQEzoj4fcwJ0pZ7Q2elcmzpJL3lPZwebU9eGNNcHUfQWbb2CA1
 agBtvVR3YcjpA4hNWixGRE5BiU4KyDUw29bueMswmMDV0Wv/dXm8dHQBl
 +Cse+EChEBc6iw9c8mkOxjEgc+pe/m0XFB4gaHtMAgijAzyDPUREBWktv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="391893541"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="391893541"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 19:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="962983337"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="962983337"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga006.fm.intel.com with ESMTP; 26 Jun 2023 19:13:28 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Dump perf_limit_reasons for debug
Date: Mon, 26 Jun 2023 19:12:18 -0700
Message-Id: <20230627021218.123999-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

GuC load takes longer sometimes due to GT frequency not ramping up.
Add perf_limit_reasons to the existing warn print to see if frequency
is being throttled.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 364d0d546ec8..73911536a8e7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -254,6 +254,8 @@ static int guc_wait_ucode(struct intel_guc *guc)
 		guc_warn(guc, "excessive init time: %lldms! [freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d]\n",
 			 delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
 			 before_freq, status, count, ret);
+		guc_warn(guc, "perf limit reasons = 0x%08X\n",
+			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
 	} else {
 		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
 			delta_ms, intel_rps_read_actual_frequency(&uncore->gt->rps),
-- 
2.38.1

