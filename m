Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181EF3471D2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 07:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28596EB2F;
	Wed, 24 Mar 2021 06:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8CC6EB2F;
 Wed, 24 Mar 2021 06:47:29 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F4zJP6lFWz92Mr;
 Wed, 24 Mar 2021 14:45:25 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 14:47:20 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/radeon/radeon_pm: Convert sysfs sprintf/snprintf family
 to sysfs_emit
Date: Wed, 24 Mar 2021 14:47:55 +0800
Message-ID: <1616568475-24509-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
drivers/gpu//drm/radeon/radeon_pm.c:521:9-17: WARNING: use scnprintf or
sprintf
drivers/gpu//drm/radeon/radeon_pm.c:475:8-16: WARNING: use scnprintf or
sprintf
drivers/gpu//drm/radeon/radeon_pm.c:418:8-16: WARNING: use scnprintf or
sprintf
drivers/gpu//drm/radeon/radeon_pm.c:363:8-16: WARNING: use scnprintf or
sprintf
drivers/gpu//drm/radeon/radeon_pm.c:734:8-16: WARNING: use scnprintf or
sprintf
drivers/gpu//drm/radeon/radeon_pm.c:688:8-16: WARNING: use scnprintf or
sprintf
drivers/gpu//drm/radeon/radeon_pm.c:704:8-16: WARNING: use scnprintf or
sprintf
drivers/gpu//drm/radeon/radeon_pm.c:755:8-16: WARNING: use scnprintf or
sprintf

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 1995dad..dd56fcd 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -361,11 +361,10 @@ static ssize_t radeon_get_pm_profile(struct device *dev,
 	struct radeon_device *rdev = ddev->dev_private;
 	int cp = rdev->pm.profile;
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			(cp == PM_PROFILE_AUTO) ? "auto" :
-			(cp == PM_PROFILE_LOW) ? "low" :
-			(cp == PM_PROFILE_MID) ? "mid" :
-			(cp == PM_PROFILE_HIGH) ? "high" : "default");
+	return sysfs_emit(buf, "%s\n", (cp == PM_PROFILE_AUTO) ? "auto" :
+			  (cp == PM_PROFILE_LOW) ? "low" :
+			  (cp == PM_PROFILE_MID) ? "mid" :
+			  (cp == PM_PROFILE_HIGH) ? "high" : "default");
 }
 
 static ssize_t radeon_set_pm_profile(struct device *dev,
@@ -416,9 +415,8 @@ static ssize_t radeon_get_pm_method(struct device *dev,
 	struct radeon_device *rdev = ddev->dev_private;
 	int pm = rdev->pm.pm_method;
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			(pm == PM_METHOD_DYNPM) ? "dynpm" :
-			(pm == PM_METHOD_PROFILE) ? "profile" : "dpm");
+	return sysfs_emit(buf, "%s\n", (pm == PM_METHOD_DYNPM) ? "dynpm" :
+			  (pm == PM_METHOD_PROFILE) ? "profile" : "dpm");
 }
 
 static ssize_t radeon_set_pm_method(struct device *dev,
@@ -473,9 +471,9 @@ static ssize_t radeon_get_dpm_state(struct device *dev,
 	struct radeon_device *rdev = ddev->dev_private;
 	enum radeon_pm_state_type pm = rdev->pm.dpm.user_state;
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			(pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
-			(pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
+	return sysfs_emit(buf, "%s\n",
+			  (pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
+			  (pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
 }
 
 static ssize_t radeon_set_dpm_state(struct device *dev,
@@ -519,11 +517,11 @@ static ssize_t radeon_get_dpm_forced_performance_level(struct device *dev,
 
 	if  ((rdev->flags & RADEON_IS_PX) &&
 	     (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
-		return snprintf(buf, PAGE_SIZE, "off\n");
+		return sysfs_emit(buf, "off\n");
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			(level == RADEON_DPM_FORCED_LEVEL_AUTO) ? "auto" :
-			(level == RADEON_DPM_FORCED_LEVEL_LOW) ? "low" : "high");
+	return sysfs_emit(buf, "%s\n",
+			  (level == RADEON_DPM_FORCED_LEVEL_AUTO) ? "auto" :
+			  (level == RADEON_DPM_FORCED_LEVEL_LOW) ? "low" : "high");
 }
 
 static ssize_t radeon_set_dpm_forced_performance_level(struct device *dev,
@@ -686,7 +684,7 @@ static ssize_t radeon_hwmon_show_temp(struct device *dev,
 	else
 		temp = 0;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp);
+	return sysfs_emit(buf, "%d\n", temp);
 }
 
 static ssize_t radeon_hwmon_show_temp_thresh(struct device *dev,
@@ -702,7 +700,7 @@ static ssize_t radeon_hwmon_show_temp_thresh(struct device *dev,
 	else
 		temp = rdev->pm.dpm.thermal.max_temp;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp);
+	return sysfs_emit(buf, "%d\n", temp);
 }
 
 static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, radeon_hwmon_show_temp, NULL, 0);
@@ -732,7 +730,7 @@ static ssize_t radeon_hwmon_show_sclk(struct device *dev,
 	   for hwmon */
 	sclk *= 10000;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", sclk);
+	return sysfs_emit(buf, "%u\n", sclk);
 }
 
 static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, radeon_hwmon_show_sclk, NULL,
@@ -753,7 +751,7 @@ static ssize_t radeon_hwmon_show_vddc(struct device *dev,
 	if (rdev->asic->dpm.get_current_vddc)
 		vddc = rdev->asic->dpm.get_current_vddc(rdev);
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", vddc);
+	return sysfs_emit(buf, "%u\n", vddc);
 }
 
 static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, radeon_hwmon_show_vddc, NULL,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
