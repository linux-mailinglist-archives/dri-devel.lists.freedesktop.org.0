Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0FF51CFCF
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 05:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2E710E5A6;
	Fri,  6 May 2022 03:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1063 seconds by postgrey-1.36 at gabe;
 Fri, 06 May 2022 03:44:56 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B747010E5A6;
 Fri,  6 May 2022 03:44:56 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KvbXB3GMQzGpWx;
 Fri,  6 May 2022 11:24:26 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 6 May
 2022 11:27:10 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <andi.shyti@linux.intel.com>,
 <matthew.auld@intel.com>, <andrzej.hajda@intel.com>, <yuehaibing@huawei.com>, 
 <lucas.demarchi@intel.com>
Subject: [PATCH -next] drm/i915/gt: Fix build error without CONFIG_PM
Date: Fri, 6 May 2022 11:26:52 +0800
Message-ID: <20220506032652.1856-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c: In function ‘act_freq_mhz_show’:
drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c:276:20: error: implicit declaration of function ‘sysfs_gt_attribute_r_max_func’ [-Werror=implicit-function-declaration]
  276 |  u32 actual_freq = sysfs_gt_attribute_r_max_func(dev, attr,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Move sysfs_gt_attribute_* macros out of #ifdef block to fix this.

Fixes: 56a709cf7746 ("drm/i915/gt: Create per-tile RPS sysfs interfaces")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
index 26cbfa6477d1..e92990d514b2 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
@@ -17,7 +17,6 @@
 #include "intel_rc6.h"
 #include "intel_rps.h"
 
-#ifdef CONFIG_PM
 enum intel_gt_sysfs_op {
 	INTEL_GT_SYSFS_MIN = 0,
 	INTEL_GT_SYSFS_MAX,
@@ -92,6 +91,7 @@ sysfs_gt_attribute_r_func(struct device *dev, struct device_attribute *attr,
 #define sysfs_gt_attribute_r_max_func(d, a, f) \
 		sysfs_gt_attribute_r_func(d, a, f, INTEL_GT_SYSFS_MAX)
 
+#ifdef CONFIG_PM
 static u32 get_residency(struct intel_gt *gt, i915_reg_t reg)
 {
 	intel_wakeref_t wakeref;
-- 
2.17.1

