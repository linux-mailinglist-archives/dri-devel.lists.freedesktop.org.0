Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F45963B9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 22:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0EA10E1E0;
	Tue, 16 Aug 2022 20:28:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D5810E7C9;
 Tue, 16 Aug 2022 20:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660681713; x=1692217713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MMEauDbzL/u6OyAOzLmuIeh2Ax6+FDISFDHgF8thg1Q=;
 b=E9RpufOK1zZSicyXexGUpohDTJ9yY/KM+otEHzbyDj0nq4zFhogDLlv5
 F1mXjqV6ys6+rDE7BPcjLMNOh0z4pq/hCWBpp+0vPuYswyXWWptYug5rl
 5+94OHy+9pGRqNOuv3zZQjNdtxstIKvoflj83F0dYXxsUvXOyAS9c7vSe
 cwJXBRC2V15NVdjndbPBFAnmRs447/5yQtTXPGWtIncr+W/lZy1cgI4EI
 T+jHMjVeHrDfR/Z57xDASqE0WGCfTQVurX9QZyQgEH5kPlRX3eYFZ2dMk
 bHhl6BdSSRRjr6G/cQ4UhmZQBENAV1DvqgZpyLPiNmSpeHxiZFCKKkJpE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="318322856"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="318322856"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 13:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="749440786"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2022 13:28:32 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/uc: Enable version reduced firmware files for
 newest platforms
Date: Tue, 16 Aug 2022 13:28:37 -0700
Message-Id: <20220816202837.1778495-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816202837.1778495-1-John.C.Harrison@Intel.com>
References: <20220816202837.1778495-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Going forwards, the intention is for GuC firmware files to be named
for their major version only and HuC firmware files to have no version
number in the name at all. This patch adds those entries for DG2 and
ADL-P/S.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index eb3a15f0fa479..deb01dddeb3e5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -53,6 +53,8 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
  * firmware as TGL.
  */
 #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
+	fw_def(DG2,          0, guc_maj(dg2,  70, 0)) \
+	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 0)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
 	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
@@ -71,7 +73,9 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
 	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
 
 #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
+	fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
 	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
+	fw_def(ALDERLAKE_S,  0, huc_raw(tgl)) \
 	fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
 	fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
 	fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
-- 
2.37.2

