Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16685EE4BA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 21:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB96F10E784;
	Wed, 28 Sep 2022 19:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8742110E77F;
 Wed, 28 Sep 2022 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664391745; x=1695927745;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OR2PqTJR1Ybnt7Rc6hZqrx7SllRq97tVK3nPK6SYtqQ=;
 b=gyqH6l1mffK65t09AJHC2mhCkUwuusMZCetvIymMQwVIVXbyJRcWEmo3
 85+rqVodN/C0ftXR9J4crt4VctpSf0PLs215gSNlanyJ/akC2LYgB2QWr
 v8iKiFsy4232pxKlyPYZQ3NypMi6HAZmTRxi++On6Xtsls7kqNxGjXlPr
 dto6Nr3K65WCqSpwznIdcdFCeu4GxtA9Axlmk5kpFGWG0fZNu0Wux8T+L
 HMzE9nnPqltAFuC9UzgA6V/Yk4uXL74S6nVYaTQnNy9V5qgmOm+M72l0d
 UMSL45q398Ki18A/y0BrEu4JoOtbs48Teb3olz0YEiFobGAHPoSRwplGL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="302603419"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="302603419"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 12:02:25 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="684528196"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="684528196"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 12:02:20 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Perf_limit_reasons are only available for Gen11+
Date: Wed, 28 Sep 2022 12:02:12 -0700
Message-Id: <20220928190212.3200835-1-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register GT0_PERF_LIMIT_REASONS (0x1381a8) is available only for
Gen11+. Therefore ensure perf_limit_reasons sysfs files are created only
for Gen11+. Otherwise on Gen < 5 accessing these files results in the
following oops:

<1> [88.829420] BUG: unable to handle page fault for address: ffffc90000bb81a8
<1> [88.829438] #PF: supervisor read access in kernel mode
<1> [88.829447] #PF: error_code(0x0000) - not-present page

This patch is a backport of the drm-tip commit 0d2d201095e9 to
drm-intel-fixes. The backport is not identical to 0d2d201095e9, it only
includes the sysfs portions of 0d2d201095e9. The debugfs portion of
0d2d201095e9 is not available in drm-intel-fixes so has not been
backported.

Bspec: 20008
Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/6863
Fixes: fa68bff7cf27 ("drm/i915/gt: Add sysfs throttle frequency interfaces")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index 73a8b46e0234..d09a0e845d09 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -545,8 +545,7 @@ static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_ratl, RATL_MASK);
 static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_vr_thermalert, VR_THERMALERT_MASK);
 static INTEL_GT_RPS_BOOL_ATTR_RO(throttle_reason_vr_tdc, VR_TDC_MASK);
 
-static const struct attribute *freq_attrs[] = {
-	&dev_attr_punit_req_freq_mhz.attr,
+static const struct attribute *throttle_reason_attrs[] = {
 	&attr_throttle_reason_status.attr,
 	&attr_throttle_reason_pl1.attr,
 	&attr_throttle_reason_pl2.attr,
@@ -763,12 +762,20 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
 	if (!is_object_gt(kobj))
 		return;
 
-	ret = sysfs_create_files(kobj, freq_attrs);
+	ret = sysfs_create_file(kobj, &dev_attr_punit_req_freq_mhz.attr);
 	if (ret)
 		drm_warn(&gt->i915->drm,
-			 "failed to create gt%u throttle sysfs files (%pe)",
+			 "failed to create gt%u punit_req_freq_mhz sysfs (%pe)",
 			 gt->info.id, ERR_PTR(ret));
 
+	if (GRAPHICS_VER(gt->i915) >= 11) {
+		ret = sysfs_create_files(kobj, throttle_reason_attrs);
+		if (ret)
+			drm_warn(&gt->i915->drm,
+				 "failed to create gt%u throttle sysfs files (%pe)",
+				 gt->info.id, ERR_PTR(ret));
+	}
+
 	if (HAS_MEDIA_RATIO_MODE(gt->i915) && intel_uc_uses_guc_slpc(&gt->uc)) {
 		ret = sysfs_create_files(kobj, media_perf_power_attrs);
 		if (ret)
-- 
2.34.1

