Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF635378F
	for <lists+dri-devel@lfdr.de>; Sun,  4 Apr 2021 10:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3976E48D;
	Sun,  4 Apr 2021 08:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with SMTP id DD7FB6E489
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Apr 2021 08:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=G2cUs
 f+10M+0+o9ghzxvUiWetFHccy0hk0bp1FYd8Zk=; b=D7XQKFkv0Z54cdkqJx9S/
 VkuKKxNOvHHQwDqAD7z7QMdF1TtWJvrSUVyuHjYWtLiNGtoMuiTyIdtl/DOaxLZt
 oOKwiS2I2yCsObgUtATMOpe/e6x8JXY8qQvw6O2WHUG68+cC4zKvwp8t4unbe7bk
 yIO52f4SqcGyuFCcU9ajfU=
Received: from localhost.localdomain (unknown [120.229.91.194])
 by smtp12 (Coremail) with SMTP id EMCowAAXHMSle2lgLIHajw--.20565S2;
 Sun, 04 Apr 2021 16:41:12 +0800 (CST)
From: Carlis <llyz108@163.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/i915/sysfs: convert snprintf to sysfs_emit
Date: Sun,  4 Apr 2021 08:41:03 +0000
Message-Id: <20210404084103.528211-1-llyz108@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: EMCowAAXHMSle2lgLIHajw--.20565S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GrW8KF4kKFyrXryfCw48Zwb_yoWxWF18pF
 43J3WYvr48Grn2qa13AF4q9a4av3ZF9a47W3ykGwn5urnrArWDtFyDAayjkrWrGrZ2kr93
 JF1qkFy7uw4jvr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2byZUUUUU=
X-Originating-IP: [120.229.91.194]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/1tbi2AJqhVr7tgSMuAAAsS
X-Mailman-Approved-At: Sun, 04 Apr 2021 08:56:04 +0000
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
Cc: Xuezhi Zhang <zhangxuezhi1@yulong.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Fix the following coccicheck warning:
drivers/gpu/drm/i915//i915_sysfs.c:266:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:285:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:276:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:335:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:390:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:465:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:107:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:75:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:83:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:91:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:99:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm/i915//i915_sysfs.c:326:8-16: 
WARNING: use scnprintf or sprintf

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
 drivers/gpu/drm/i915/i915_sysfs.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 45d32ef42787..4c6b5d52b5ca 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -72,7 +72,7 @@ show_rc6_mask(struct device *kdev, struct device_attribute *attr, char *buf)
 	if (HAS_RC6pp(dev_priv))
 		mask |= BIT(2);
 
-	return snprintf(buf, PAGE_SIZE, "%x\n", mask);
+	return sysfs_emit(buf, "%x\n", mask);
 }
 
 static ssize_t
@@ -80,7 +80,7 @@ show_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	u32 rc6_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6);
-	return snprintf(buf, PAGE_SIZE, "%u\n", rc6_residency);
+	return sysfs_emit(buf, "%u\n", rc6_residency);
 }
 
 static ssize_t
@@ -88,7 +88,7 @@ show_rc6p_ms(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	u32 rc6p_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6p);
-	return snprintf(buf, PAGE_SIZE, "%u\n", rc6p_residency);
+	return sysfs_emit(buf, "%u\n", rc6p_residency);
 }
 
 static ssize_t
@@ -96,7 +96,7 @@ show_rc6pp_ms(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	u32 rc6pp_residency = calc_residency(dev_priv, GEN6_GT_GFX_RC6pp);
-	return snprintf(buf, PAGE_SIZE, "%u\n", rc6pp_residency);
+	return sysfs_emit(buf, "%u\n", rc6pp_residency);
 }
 
 static ssize_t
@@ -104,7 +104,7 @@ show_media_rc6_ms(struct device *kdev, struct device_attribute *attr, char *buf)
 {
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	u32 rc6_residency = calc_residency(dev_priv, VLV_GT_MEDIA_RC6);
-	return snprintf(buf, PAGE_SIZE, "%u\n", rc6_residency);
+	return sysfs_emit(buf, "%u\n", rc6_residency);
 }
 
 static DEVICE_ATTR(rc6_enable, S_IRUGO, show_rc6_mask, NULL);
@@ -263,8 +263,7 @@ static ssize_t gt_act_freq_mhz_show(struct device *kdev,
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &i915->gt.rps;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			intel_rps_read_actual_frequency(rps));
+	return sysfs_emit(buf, "%d\n", intel_rps_read_actual_frequency(rps));
 }
 
 static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
@@ -273,8 +272,7 @@ static ssize_t gt_cur_freq_mhz_show(struct device *kdev,
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &i915->gt.rps;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			intel_gpu_freq(rps, rps->cur_freq));
+	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->cur_freq));
 }
 
 static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
@@ -282,8 +280,7 @@ static ssize_t gt_boost_freq_mhz_show(struct device *kdev, struct device_attribu
 	struct drm_i915_private *i915 = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &i915->gt.rps;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			intel_gpu_freq(rps, rps->boost_freq));
+	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->boost_freq));
 }
 
 static ssize_t gt_boost_freq_mhz_store(struct device *kdev,
@@ -323,8 +320,7 @@ static ssize_t vlv_rpe_freq_mhz_show(struct device *kdev,
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &dev_priv->gt.rps;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			intel_gpu_freq(rps, rps->efficient_freq));
+	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->efficient_freq));
 }
 
 static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute *attr, char *buf)
@@ -332,8 +328,7 @@ static ssize_t gt_max_freq_mhz_show(struct device *kdev, struct device_attribute
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &dev_priv->gt.rps;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			intel_gpu_freq(rps, rps->max_freq_softlimit));
+	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->max_freq_softlimit));
 }
 
 static ssize_t gt_max_freq_mhz_store(struct device *kdev,
@@ -387,8 +382,7 @@ static ssize_t gt_min_freq_mhz_show(struct device *kdev, struct device_attribute
 	struct drm_i915_private *dev_priv = kdev_minor_to_i915(kdev);
 	struct intel_rps *rps = &dev_priv->gt.rps;
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
-			intel_gpu_freq(rps, rps->min_freq_softlimit));
+	return sysfs_emit(buf, "%d\n", intel_gpu_freq(rps, rps->min_freq_softlimit));
 }
 
 static ssize_t gt_min_freq_mhz_store(struct device *kdev,
@@ -462,7 +456,7 @@ static ssize_t gt_rp_mhz_show(struct device *kdev, struct device_attribute *attr
 	else
 		BUG();
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", val);
+	return sysfs_emit(buf, "%d\n", val);
 }
 
 static const struct attribute * const gen6_attrs[] = {
-- 
2.25.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
