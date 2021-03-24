Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF73347455
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 10:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5876E992;
	Wed, 24 Mar 2021 09:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C9F6E992;
 Wed, 24 Mar 2021 09:17:14 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F52cb6QQZzPljX;
 Wed, 24 Mar 2021 17:14:39 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 17:17:08 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH drm/amdgpu 2/2] drm/amd/pm: Convert sysfs sprintf/snprintf
 family to sysfs_emit
Date: Wed, 24 Mar 2021 17:17:41 +0800
Message-ID: <1616577461-18556-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616577461-18556-1-git-send-email-tiantao6@hisilicon.com>
References: <1616577461-18556-1-git-send-email-tiantao6@hisilicon.com>
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
drivers/gpu/drm/amd/pm/amdgpu_pm.c:1940:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:1978:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2022:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:294:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:154:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:496:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:512:9-17: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:1740:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:1667:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2074:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2047:9-17: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2768:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2738:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2442:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:3246:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:3253:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2458:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:3047:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:3133:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:3209:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:3216:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2410:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2496:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2470:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2426:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2965:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:2972:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:3006:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/amd/pm/amdgpu_pm.c:3013:8-16: WARNING:
use scnprintf or sprintf

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 88 +++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 5fa65f1..0ee3e55 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -151,9 +151,9 @@ static ssize_t amdgpu_get_power_dpm_state(struct device *dev,
 	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			(pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
-			(pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
+	return sysfs_emit(buf, "%s\n",
+			  (pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
+			  (pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
 }
 
 static ssize_t amdgpu_set_power_dpm_state(struct device *dev,
@@ -291,16 +291,16 @@ static ssize_t amdgpu_get_power_dpm_force_performance_level(struct device *dev,
 	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
-			(level == AMD_DPM_FORCED_LEVEL_AUTO) ? "auto" :
-			(level == AMD_DPM_FORCED_LEVEL_LOW) ? "low" :
-			(level == AMD_DPM_FORCED_LEVEL_HIGH) ? "high" :
-			(level == AMD_DPM_FORCED_LEVEL_MANUAL) ? "manual" :
-			(level == AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD) ? "profile_standard" :
-			(level == AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK) ? "profile_min_sclk" :
-			(level == AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK) ? "profile_min_mclk" :
-			(level == AMD_DPM_FORCED_LEVEL_PROFILE_PEAK) ? "profile_peak" :
-			"unknown");
+	return sysfs_emit(buf, "%s\n",
+			  (level == AMD_DPM_FORCED_LEVEL_AUTO) ? "auto" :
+			  (level == AMD_DPM_FORCED_LEVEL_LOW) ? "low" :
+			  (level == AMD_DPM_FORCED_LEVEL_HIGH) ? "high" :
+			  (level == AMD_DPM_FORCED_LEVEL_MANUAL) ? "manual" :
+			  (level == AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD) ? "profile_standard" :
+			  (level == AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK) ? "profile_min_sclk" :
+			  (level == AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK) ? "profile_min_mclk" :
+			  (level == AMD_DPM_FORCED_LEVEL_PROFILE_PEAK) ? "profile_peak" :
+			  "unknown");
 }
 
 static ssize_t amdgpu_set_power_dpm_force_performance_level(struct device *dev,
@@ -493,7 +493,7 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
 	if (i == data.nums)
 		i = -EINVAL;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", i);
+	return sysfs_emit(buf, "%d\n", i);
 }
 
 static ssize_t amdgpu_get_pp_force_state(struct device *dev,
@@ -509,7 +509,7 @@ static ssize_t amdgpu_get_pp_force_state(struct device *dev,
 	if (adev->pp_force_state_enabled)
 		return amdgpu_get_pp_cur_state(dev, attr, buf);
 	else
-		return snprintf(buf, PAGE_SIZE, "\n");
+		return sysfs_emit(buf, "\n");
 }
 
 static ssize_t amdgpu_set_pp_force_state(struct device *dev,
@@ -1664,7 +1664,7 @@ static ssize_t amdgpu_get_pp_sclk_od(struct device *dev,
 	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static ssize_t amdgpu_set_pp_sclk_od(struct device *dev,
@@ -1737,7 +1737,7 @@ static ssize_t amdgpu_get_pp_mclk_od(struct device *dev,
 	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 static ssize_t amdgpu_set_pp_mclk_od(struct device *dev,
@@ -1937,7 +1937,7 @@ static ssize_t amdgpu_get_gpu_busy_percent(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 /**
@@ -1975,7 +1975,7 @@ static ssize_t amdgpu_get_mem_busy_percent(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", value);
+	return sysfs_emit(buf, "%d\n", value);
 }
 
 /**
@@ -2019,8 +2019,8 @@ static ssize_t amdgpu_get_pcie_bw(struct device *dev,
 	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
-	return snprintf(buf, PAGE_SIZE,	"%llu %llu %i\n",
-			count0, count1, pcie_get_mps(adev->pdev));
+	return sysfs_emit(buf, "%llu %llu %i\n",
+			  count0, count1, pcie_get_mps(adev->pdev));
 }
 
 /**
@@ -2044,7 +2044,7 @@ static ssize_t amdgpu_get_unique_id(struct device *dev,
 		return -EPERM;
 
 	if (adev->unique_id)
-		return snprintf(buf, PAGE_SIZE, "%016llx\n", adev->unique_id);
+		return sysfs_emit(buf, "%016llx\n", adev->unique_id);
 
 	return 0;
 }
@@ -2071,10 +2071,10 @@ static ssize_t amdgpu_get_thermal_throttling_logging(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
-	return snprintf(buf, PAGE_SIZE, "%s: thermal throttling logging %s, with interval %d seconds\n",
-			adev_to_drm(adev)->unique,
-			atomic_read(&adev->throttling_logging_enabled) ? "enabled" : "disabled",
-			adev->throttling_logging_rs.interval / HZ + 1);
+	return sysfs_emit(buf, "%s: thermal throttling logging %s, with interval %d seconds\n",
+			  adev_to_drm(adev)->unique,
+			  atomic_read(&adev->throttling_logging_enabled) ? "enabled" : "disabled",
+			  adev->throttling_logging_rs.interval / HZ + 1);
 }
 
 static ssize_t amdgpu_set_thermal_throttling_logging(struct device *dev,
@@ -2407,7 +2407,7 @@ static ssize_t amdgpu_hwmon_show_temp(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp);
+	return sysfs_emit(buf, "%d\n", temp);
 }
 
 static ssize_t amdgpu_hwmon_show_temp_thresh(struct device *dev,
@@ -2423,7 +2423,7 @@ static ssize_t amdgpu_hwmon_show_temp_thresh(struct device *dev,
 	else
 		temp = adev->pm.dpm.thermal.max_temp;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp);
+	return sysfs_emit(buf, "%d\n", temp);
 }
 
 static ssize_t amdgpu_hwmon_show_hotspot_temp_thresh(struct device *dev,
@@ -2439,7 +2439,7 @@ static ssize_t amdgpu_hwmon_show_hotspot_temp_thresh(struct device *dev,
 	else
 		temp = adev->pm.dpm.thermal.max_hotspot_crit_temp;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp);
+	return sysfs_emit(buf, "%d\n", temp);
 }
 
 static ssize_t amdgpu_hwmon_show_mem_temp_thresh(struct device *dev,
@@ -2455,7 +2455,7 @@ static ssize_t amdgpu_hwmon_show_mem_temp_thresh(struct device *dev,
 	else
 		temp = adev->pm.dpm.thermal.max_mem_crit_temp;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp);
+	return sysfs_emit(buf, "%d\n", temp);
 }
 
 static ssize_t amdgpu_hwmon_show_temp_label(struct device *dev,
@@ -2467,7 +2467,7 @@ static ssize_t amdgpu_hwmon_show_temp_label(struct device *dev,
 	if (channel >= PP_TEMP_MAX)
 		return -EINVAL;
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", temp_label[channel].label);
+	return sysfs_emit(buf, "%s\n", temp_label[channel].label);
 }
 
 static ssize_t amdgpu_hwmon_show_temp_emergency(struct device *dev,
@@ -2493,7 +2493,7 @@ static ssize_t amdgpu_hwmon_show_temp_emergency(struct device *dev,
 		break;
 	}
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", temp);
+	return sysfs_emit(buf, "%d\n", temp);
 }
 
 static ssize_t amdgpu_hwmon_get_pwm1_enable(struct device *dev,
@@ -2735,7 +2735,7 @@ static ssize_t amdgpu_hwmon_get_fan1_min(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", min_rpm);
+	return sysfs_emit(buf, "%d\n", min_rpm);
 }
 
 static ssize_t amdgpu_hwmon_get_fan1_max(struct device *dev,
@@ -2765,7 +2765,7 @@ static ssize_t amdgpu_hwmon_get_fan1_max(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", max_rpm);
+	return sysfs_emit(buf, "%d\n", max_rpm);
 }
 
 static ssize_t amdgpu_hwmon_get_fan1_target(struct device *dev,
@@ -2962,14 +2962,14 @@ static ssize_t amdgpu_hwmon_show_vddgfx(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", vddgfx);
+	return sysfs_emit(buf, "%d\n", vddgfx);
 }
 
 static ssize_t amdgpu_hwmon_show_vddgfx_label(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "vddgfx\n");
+	return sysfs_emit(buf, "vddgfx\n");
 }
 
 static ssize_t amdgpu_hwmon_show_vddnb(struct device *dev,
@@ -3003,14 +3003,14 @@ static ssize_t amdgpu_hwmon_show_vddnb(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", vddnb);
+	return sysfs_emit(buf, "%d\n", vddnb);
 }
 
 static ssize_t amdgpu_hwmon_show_vddnb_label(struct device *dev,
 					      struct device_attribute *attr,
 					      char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "vddnb\n");
+	return sysfs_emit(buf, "vddnb\n");
 }
 
 static ssize_t amdgpu_hwmon_show_power_avg(struct device *dev,
@@ -3044,7 +3044,7 @@ static ssize_t amdgpu_hwmon_show_power_avg(struct device *dev,
 	/* convert to microwatts */
 	uw = (query >> 8) * 1000000 + (query & 0xff) * 1000;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", uw);
+	return sysfs_emit(buf, "%u\n", uw);
 }
 
 static ssize_t amdgpu_hwmon_show_power_cap_min(struct device *dev,
@@ -3130,7 +3130,7 @@ static ssize_t amdgpu_hwmon_show_power_label(struct device *dev,
 {
 	int limit_type = to_sensor_dev_attr(attr)->index;
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 		limit_type == SMU_FAST_PPT_LIMIT ? "fastPPT" : "slowPPT");
 }
 
@@ -3206,14 +3206,14 @@ static ssize_t amdgpu_hwmon_show_sclk(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", sclk * 10 * 1000);
+	return sysfs_emit(buf, "%u\n", sclk * 10 * 1000);
 }
 
 static ssize_t amdgpu_hwmon_show_sclk_label(struct device *dev,
 					    struct device_attribute *attr,
 					    char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "sclk\n");
+	return sysfs_emit(buf, "sclk\n");
 }
 
 static ssize_t amdgpu_hwmon_show_mclk(struct device *dev,
@@ -3243,14 +3243,14 @@ static ssize_t amdgpu_hwmon_show_mclk(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", mclk * 10 * 1000);
+	return sysfs_emit(buf, "%u\n", mclk * 10 * 1000);
 }
 
 static ssize_t amdgpu_hwmon_show_mclk_label(struct device *dev,
 					    struct device_attribute *attr,
 					    char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "mclk\n");
+	return sysfs_emit(buf, "mclk\n");
 }
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
