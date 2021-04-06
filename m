Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31635562E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 16:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AC26E231;
	Tue,  6 Apr 2021 14:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817236E231
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 14:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=m2nfz
 GngWUdtI0fKdY+zBrxIBakMqqwRi5IVDBG0FaA=; b=X69TbNVZDr3IRkl3swkti
 kWq2F/SYUSRBgmIHEqUfHzJd5IH0bWiz18jLyxtOIfOjjfVif3Rd4xyo8IZsz9ZH
 GSMELz3AsWvA3ORj8PAGN0ToUK47xIvagQWfNvp6aTo5zuh1VUSv39SdvW1d22VR
 74QLsvQSoagGJah+X2InIU=
Received: from localhost.localdomain (unknown [113.98.63.214])
 by smtp14 (Coremail) with SMTP id EsCowABnbeUlbGxgJw07cg--.2713S2;
 Tue, 06 Apr 2021 22:11:50 +0800 (CST)
From: Carlis <llyz108@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: convert sysfs snprintf to sysfs_emit
Date: Tue,  6 Apr 2021 14:11:48 +0000
Message-Id: <20210406141148.64795-1-llyz108@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: EsCowABnbeUlbGxgJw07cg--.2713S2
X-Coremail-Antispam: 1Uf129KBjvJXoWfJrWUCFyUCF1fur1UCFW7urg_yoWkurWDpF
 WfJFy5Zr48ArnrJryrKF1vv3Z0vr1IqayxJ3ykGw1v9w15trWDGFyDCay29r1rWrWxCrWx
 Jryqkay5ua1IvrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jha93UUUUU=
X-Originating-IP: [113.98.63.214]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/1tbiWwZshVSIpkYmxgAAso
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
Cc: Xiaojian.Du@amd.com, kevin1.wang@amd.com, nirmoy.das@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org, Xuezhi Zhang <zhangxuezhi1@yulong.com>,
 evan.quan@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Fix the following coccicheck warning:
drivers/gpu/drm/amd/pm//amdgpu_pm.c:1940:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:1978:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2022:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:294:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:154:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:496:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:512:9-17: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:1740:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:1667:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2074:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2047:9-17: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2768:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2738:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2442:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:3246:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:3253:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2458:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:3047:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:3133:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:3209:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:3216:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2410:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2496:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2470:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2426:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2965:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:2972:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:3006:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/amd/pm//amdgpu_pm.c:3013:8-16: 
WARNING: use scnprintf or sprintf

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 58 +++++++++++++++---------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 5fa65f191a37..2777966ec1ca 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -151,7 +151,7 @@ static ssize_t amdgpu_get_power_dpm_state(struct device *dev,
 	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			(pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
 			(pm == POWER_STATE_TYPE_BALANCED) ? "balanced" : "performance");
 }
@@ -291,7 +291,7 @@ static ssize_t amdgpu_get_power_dpm_force_performance_level(struct device *dev,
 	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			(level == AMD_DPM_FORCED_LEVEL_AUTO) ? "auto" :
 			(level == AMD_DPM_FORCED_LEVEL_LOW) ? "low" :
 			(level == AMD_DPM_FORCED_LEVEL_HIGH) ? "high" :
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
@@ -2019,7 +2019,7 @@ static ssize_t amdgpu_get_pcie_bw(struct device *dev,
 	pm_runtime_mark_last_busy(ddev->dev);
 	pm_runtime_put_autosuspend(ddev->dev);
 
-	return snprintf(buf, PAGE_SIZE,	"%llu %llu %i\n",
+	return sysfs_emit(buf,	"%llu %llu %i\n",
 			count0, count1, pcie_get_mps(adev->pdev));
 }
 
@@ -2044,7 +2044,7 @@ static ssize_t amdgpu_get_unique_id(struct device *dev,
 		return -EPERM;
 
 	if (adev->unique_id)
-		return snprintf(buf, PAGE_SIZE, "%016llx\n", adev->unique_id);
+		return sysfs_emit(buf, "%016llx\n", adev->unique_id);
 
 	return 0;
 }
@@ -2071,7 +2071,7 @@ static ssize_t amdgpu_get_thermal_throttling_logging(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
 
-	return snprintf(buf, PAGE_SIZE, "%s: thermal throttling logging %s, with interval %d seconds\n",
+	return sysfs_emit(buf, "%s: thermal throttling logging %s, with interval %d seconds\n",
 			adev_to_drm(adev)->unique,
 			atomic_read(&adev->throttling_logging_enabled) ? "enabled" : "disabled",
 			adev->throttling_logging_rs.interval / HZ + 1);
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
2.25.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
