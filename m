Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A1633096
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 00:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71ED10E351;
	Mon, 21 Nov 2022 23:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497DF10E344;
 Mon, 21 Nov 2022 23:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669072383; x=1700608383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gn++71tQCL+3A1Hdhvkcs9XUG05731u2NKTcvsPUyM4=;
 b=j5lJ9uRwl7+7+bSr2EC75OzIMlKEuf7RTJRgPcPJQhhI1JROpX2l8l4d
 BlLdYKDbpgpHdoihs5Uq8FFsLpVZVP5OhoAvdAHDf+HCAmz0llAPne+09
 SExJOLKhWDacPrSzmknIOxr12kzplxN5wB+zG9nlxEmW5LeBKq+2ts2Os
 u4StWQEpF1rhC0nRZzaVDz+QGj6WhtR+9bsZKejd9dEARvqfduRPM6rs/
 hCSx0zuQ18NRXpGtlhu/L6gFoDAR12gpTImNx65R5yosUzfAdO5a5H4xw
 m8JeSK0A11ACixZ5qeVduVkqnQ0LGYscQz65KoVoszr12SbmTHHkCxfof A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="315503483"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="315503483"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:12:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="618993351"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="618993351"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:12:51 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915/gsc: Skip the version check when fetching the
 GSC FW
Date: Mon, 21 Nov 2022 15:16:13 -0800
Message-Id: <20221121231617.1110329-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
References: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current exectation from the FW side is that the driver will query
the GSC FW version after the FW is loaded, similarly to what the mei
driver does on DG2. However, we're discussing with the FW team if there
is a way to extract the version from the bin file before loading, so we
can keep the code the same as for older FWs.

Since the GSC FW version is not currently required for functionality and
is only needed for debug purposes, we can skip the FW version for now at
fetch time and add it later on when we've agreed on the approach.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 29 +++++++++++++++++++-----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 5b2e4503aee7..3df52fd59edc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -564,6 +564,26 @@ static int check_ccs_header(struct intel_gt *gt,
 	return 0;
 }
 
+static int check_fw_header(struct intel_gt *gt,
+			   const struct firmware *fw,
+			   struct intel_uc_fw *uc_fw)
+{
+	int err = 0;
+
+	/* GSC FW version is queried after the FW is loaded */
+	if (uc_fw->type == INTEL_UC_FW_TYPE_GSC)
+		return 0;
+
+	if (uc_fw->loaded_via_gsc)
+		err = check_gsc_manifest(fw, uc_fw);
+	else
+		err = check_ccs_header(gt, fw, uc_fw);
+	if (err)
+		return err;
+
+	return 0;
+}
+
 /**
  * intel_uc_fw_fetch - fetch uC firmware
  * @uc_fw: uC firmware
@@ -633,14 +653,11 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	if (uc_fw->loaded_via_gsc)
-		err = check_gsc_manifest(fw, uc_fw);
-	else
-		err = check_ccs_header(gt, fw, uc_fw);
+	err = check_fw_header(gt, fw, uc_fw);
 	if (err)
 		goto fail;
 
-	if (uc_fw->file_wanted.major_ver) {
+	if (uc_fw->file_wanted.major_ver && uc_fw->file_selected.major_ver) {
 		/* Check the file's major version was as it claimed */
 		if (uc_fw->file_selected.major_ver != uc_fw->file_wanted.major_ver) {
 			drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
@@ -657,7 +674,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		}
 	}
 
-	if (old_ver) {
+	if (old_ver && uc_fw->file_selected.major_ver) {
 		/* Preserve the version that was really wanted */
 		memcpy(&uc_fw->file_wanted, &file_ideal, sizeof(uc_fw->file_wanted));
 
-- 
2.37.3

