Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B6A256C91
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 09:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC146E243;
	Sun, 30 Aug 2020 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B441B6E243
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 07:26:41 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id np15so149755pjb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 00:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=7zgO7MhVx1kNYz7mXYss9RlpB0V1X2M7AmUchC5emvc=;
 b=RKT9SYc0jB/VmaDm110tw22+krLW3TAutBeR5iLUjuow+OCD+9VhdaPDHFZfpfwi3y
 gP5sAtZmRGQYsJBBiCFyp38eq7jmFu6CRAFGLb6z2VXnHx3clCjwIO/IU0qQ1d9AaeBz
 C/6qax/FF9c0uOstqVps7YwEMP8BC2e9gtHyDNlWqgfxkUE98u6F5QUDFF9Tpk3oND0w
 4mFoGH3L15tf/goK/AsKfyMwyX8g+zH+pVUpMZG7ChA+h1RTiHNUJQEGie+oAhT7Nogy
 ZOobec+H2iQHuD8ZRW7+aHmKBOecES1J2oLeLJf+HGQ3xRIGdYpXJeUsIT3cWOaXIcW7
 ZbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=7zgO7MhVx1kNYz7mXYss9RlpB0V1X2M7AmUchC5emvc=;
 b=N0KXiohEmWtjaAt9lkXPOQBtOo/8loRLFDc1hgsJAyKVlJ4OJsOi9Hc/x5PHxA95p0
 FBXB2K60cfJDOoFKP3FO9t+F5qW/DgjoRUiijeYbG7+scbXlHl7zpzzvEvxDetm4vg8/
 dg62ro8dUVXqypgVF/OyulSiVN9zUq205F3jlndkCtTj6jJBg8VibvXPfksEh62t2ukI
 7T/xv9Mx9KRJb2DgjTj5SSeTe14fUtpLkXOIPQOIWCXjRammifANJLJ0WEbaIHNeQor0
 E5sOZS63+AqdsTHWLJCZX3UR6vXRXNOz1h0g8U4wT4H3wLH0/WnObWfWT828BNBUwNzP
 ht5Q==
X-Gm-Message-State: AOAM533W+WmDkjsmbW1F3U8tK2wus4G8EvOCIcUs8T2QK08svwi/wgD3
 JyUr576YRrguYK/dJF5tReQ=
X-Google-Smtp-Source: ABdhPJwc5D9FclZklEz9B6rYGlyTz9evhA1XmeV+BbO67i7r7xSip3yuGNhd60L0zSjCBT8xNGbQxw==
X-Received: by 2002:a17:902:9347:: with SMTP id
 g7mr4755733plp.200.1598772401112; 
 Sun, 30 Aug 2020 00:26:41 -0700 (PDT)
Received: from [192.168.86.30] ([49.207.129.184])
 by smtp.gmail.com with ESMTPSA id w5sm4066634pgk.20.2020.08.30.00.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2020 00:26:40 -0700 (PDT)
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH 2/2] drm/radeon: Add vddc hwmon sensor
Message-ID: <a310a773-b708-e927-b80d-fbcbb97a3b5e@gmail.com>
Date: Sun, 30 Aug 2020 12:56:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
---
 drivers/gpu/drm/radeon/radeon.h      |  1 +
 drivers/gpu/drm/radeon/radeon_asic.c |  1 +
 drivers/gpu/drm/radeon/radeon_asic.h |  1 +
 drivers/gpu/drm/radeon/radeon_pm.c   | 21 +++++++++++++++++++++
 drivers/gpu/drm/radeon/sumo_dpm.c    | 20 ++++++++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 30e32adc1fc6..ec82f22e503a 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -1992,6 +1992,7 @@ struct radeon_asic {
 		int (*get_fan_speed_percent)(struct radeon_device *rdev, u32 *speed);
 		u32 (*get_current_sclk)(struct radeon_device *rdev);
 		u32 (*get_current_mclk)(struct radeon_device *rdev);
+		u16 (*get_current_vddc)(struct radeon_device *rdev);
 	} dpm;
 	/* pageflipping */
 	struct {
diff --git a/drivers/gpu/drm/radeon/radeon_asic.c b/drivers/gpu/drm/radeon/radeon_asic.c
index 495700d16fc9..8becbe09af2f 100644
--- a/drivers/gpu/drm/radeon/radeon_asic.c
+++ b/drivers/gpu/drm/radeon/radeon_asic.c
@@ -1513,6 +1513,7 @@ static struct radeon_asic sumo_asic = {
 		.force_performance_level = &sumo_dpm_force_performance_level,
 		.get_current_sclk = &sumo_dpm_get_current_sclk,
 		.get_current_mclk = &sumo_dpm_get_current_mclk,
+		.get_current_vddc = &sumo_dpm_get_current_vddc,
 	},
 	.pflip = {
 		.page_flip = &evergreen_page_flip,
diff --git a/drivers/gpu/drm/radeon/radeon_asic.h b/drivers/gpu/drm/radeon/radeon_asic.h
index a74fa18cd27b..24644daead53 100644
--- a/drivers/gpu/drm/radeon/radeon_asic.h
+++ b/drivers/gpu/drm/radeon/radeon_asic.h
@@ -596,6 +596,7 @@ int sumo_dpm_force_performance_level(struct radeon_device *rdev,
 				     enum radeon_dpm_forced_level level);
 u32 sumo_dpm_get_current_sclk(struct radeon_device *rdev);
 u32 sumo_dpm_get_current_mclk(struct radeon_device *rdev);
+u16 sumo_dpm_get_current_vddc(struct radeon_device *rdev);
 
 /*
  * cayman
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 05c4196a8212..f02386a0d988 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -737,6 +737,26 @@ static ssize_t radeon_hwmon_show_sclk(struct device *dev,
 static SENSOR_DEVICE_ATTR(freq1_input, S_IRUGO, radeon_hwmon_show_sclk, NULL,
 			  0);
 
+static ssize_t radeon_hwmon_show_vddc(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct radeon_device *rdev = dev_get_drvdata(dev);
+	struct drm_device *ddev = rdev->ddev;
+	u16 vddc = 0;
+	
+	/* Can't get vddc when the card is off */
+	if ((rdev->flags & RADEON_IS_PX) &&
+		(ddev->switch_power_state != DRM_SWITCH_POWER_ON))
+		return -EINVAL;
+	
+	if (rdev->asic->dpm.get_current_vddc)
+		vddc = rdev->asic->dpm.get_current_vddc(rdev);
+	
+	return snprintf(buf, PAGE_SIZE, "%u\n", vddc);
+}
+
+static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, radeon_hwmon_show_vddc, NULL,
+			  0);
 
 static struct attribute *hwmon_attributes[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
@@ -747,6 +767,7 @@ static struct attribute *hwmon_attributes[] = {
 	&sensor_dev_attr_pwm1_min.dev_attr.attr,
 	&sensor_dev_attr_pwm1_max.dev_attr.attr,
 	&sensor_dev_attr_freq1_input.dev_attr.attr,
+	&sensor_dev_attr_in0_input.dev_attr.attr,
 	NULL
 };
 
diff --git a/drivers/gpu/drm/radeon/sumo_dpm.c b/drivers/gpu/drm/radeon/sumo_dpm.c
index b95d5d390caf..f74f381af05f 100644
--- a/drivers/gpu/drm/radeon/sumo_dpm.c
+++ b/drivers/gpu/drm/radeon/sumo_dpm.c
@@ -1865,6 +1865,26 @@ u32 sumo_dpm_get_current_mclk(struct radeon_device *rdev)
 	return pi->sys_info.bootup_uma_clk;
 }
 
+u16 sumo_dpm_get_current_vddc(struct radeon_device *rdev)
+{
+	struct sumo_power_info *pi = sumo_get_pi(rdev);
+	struct radeon_ps *rps = &pi->current_rps;
+	struct sumo_ps *ps = sumo_get_ps(rps);
+	struct sumo_pl *pl;
+	u32 current_index =
+		(RREG32(TARGET_AND_CURRENT_PROFILE_INDEX) & CURR_INDEX_MASK) >>
+		CURR_INDEX_SHIFT;
+
+	if (current_index == BOOST_DPM_LEVEL) {
+		pl = &pi->boost_pl;
+	} else if (current_index >= ps->num_levels) {
+		return 0;
+	} else {
+		pl = &ps->levels[current_index];
+	}
+	return sumo_convert_voltage_index_to_value(rdev, pl->vddc_index);
+}
+
 void sumo_dpm_fini(struct radeon_device *rdev)
 {
 	int i;
--
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
