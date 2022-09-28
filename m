Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345465EE3EB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1246710E582;
	Wed, 28 Sep 2022 18:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5B410E56C;
 Wed, 28 Sep 2022 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664388511; x=1695924511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fd18GPv2iyvMz6yTGEKCDJGyQ2K0y0p60cJxR8q/Wzo=;
 b=FexRMT4f70Kgf2QbK/JU+3aKHAAhqjy2XEFI6YfU/PklFZGqAe7B+/TZ
 GpiXdpypKXZrxhMdLXO3vjMH2uviA5bUX1FTZKkly1DtN50uHxbmRYP+a
 284CL0r+T7WNyjiTQjfuKeXjs3WBTMUii+MruxSu8YWJGxRQzVuZ8xo8e
 9/1etdblgAATEq4Ypul7gy11qP7eSg/jUIrSooi3Moj/0RKebpyVO7LWI
 akJd+0isRCnT19df8ElG1jhIP7C0DCdwTC+p/bJ6DUPkIaDsQXVSzXIk0
 0hf7WqTqwW7g5rQKELAZHk8yiHzTCie5vfgnjLeDLuJmgwLUl/6dSOqnV g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="328046922"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="328046922"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 11:08:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="747525663"
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; d="scan'208";a="747525663"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 11:08:30 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH drm-intel-fixes] drm/i915/gt: Perf_limit_reasons are only
 available for Gen11+
Date: Wed, 28 Sep 2022 11:08:26 -0700
Message-Id: <20220928180826.3182079-1-ashutosh.dixit@intel.com>
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

