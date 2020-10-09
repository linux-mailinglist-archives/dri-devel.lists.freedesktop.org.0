Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A462883E8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC20789736;
	Fri,  9 Oct 2020 07:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021D489688
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:49:20 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id b193so5636438pga.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=kjOG1q2D+PkzWwGEB+3tuN2uKBLW995luQyqpvNfgTY=;
 b=IY4b7FuC+T7GcveUnRTDkqVn1y3J5Ms9/hZKXSV3UlMGIs9tdKc38wruS94gQNQnMG
 jQuDuNjvYZGYop7IOEZ5h9BAoarNFsFK5l1fml2JQUdVjUEVrv+H76nDXeXDeaRLa+aN
 541u3p1VyR+jhlsXQipxo9rrA9Qk9NluhHzf1Zi41dcHglWI8GfGmq3r59m3sujNQLye
 rtc0O+eIlnOo1S+q+wohmFzq8ckjRCn7cnAy1lr2WIoifvsLhnpJ6shHelXPvXtGLgK8
 a/yzTNvnfA36WUOhxNazASIimSTLfTciqGLB3wpGShZ9kn9iAc43H9llRDXzquU0p9sL
 hrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=kjOG1q2D+PkzWwGEB+3tuN2uKBLW995luQyqpvNfgTY=;
 b=BwaNADUXZ7hS1HVSZRDgNMzeVxJROp+KlVEMBbkKYpxCu7mpl4bs+aJjbtvCKiGclV
 KzcXNjXzqR+WzuGldAzava0sMUxySsP2yWfEWK1Th/nRgarK/lhoqLOm2tG2VoZ2ntUJ
 icLEfsIMRMYglBmOq1kLb43edMkd0tgYcsgxtOhOZ1zLCBfcbNulROxcMyEunc/aSGYE
 xjN+kNxg9Vccq0U7Ul4UdDJBUGhHAh2vLa470V+cLS/PLv85fIsVmJYhgqw7DPz6xR4o
 pIr0T6S5MCxw6TeC5H3+jp8MjouOr61KWlpW1BpN4RTSnww4/a3Lyz4RGX9ew0OiRjqM
 jx0A==
X-Gm-Message-State: AOAM5308t0I2QWC47HQdPLWm5A/JaaeC1wt/oRQfgCPH1W9yEcTFMiZY
 Ng4h830RmRD9y0XFQclKsH+dbr3+cbuarQ==
X-Google-Smtp-Source: ABdhPJwyRUzVH2O05hFoFIB7jmW38mdB8ed1JN4IvJ4GB7VJQ4Fw/Eec4X4S/2q+cY+de7LQU0fMlg==
X-Received: by 2002:a17:90a:d58e:: with SMTP id
 v14mr3268272pju.66.1602229759270; 
 Fri, 09 Oct 2020 00:49:19 -0700 (PDT)
Received: from [192.168.86.30] ([49.207.136.194])
 by smtp.gmail.com with ESMTPSA id bj17sm10109887pjb.15.2020.10.09.00.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 00:49:18 -0700 (PDT)
To: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH v2 3/3] drm/radeon: Expose vddc through hwmon
Message-ID: <60d09aca-3233-d341-33c5-b46b0a386d8a@gmail.com>
Date: Fri, 9 Oct 2020 13:19:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
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

Create hwmon attribute for vddc, that uses previously declared get_current_vddc() callback if there's an implementation available.

Also hides vddc, if there is no implementation for the current chipset (as per Alexander Deucher's suggestion).

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 05c4196a8212..65d172b13e06 100644
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
 
@@ -765,7 +786,13 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 	     attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr ||
 	     attr == &sensor_dev_attr_pwm1_max.dev_attr.attr ||
 	     attr == &sensor_dev_attr_pwm1_min.dev_attr.attr ||
-	     attr == &sensor_dev_attr_freq1_input.dev_attr.attr))
+	     attr == &sensor_dev_attr_freq1_input.dev_attr.attr ||
+	     attr == &sensor_dev_attr_in0_input.dev_attr.attr))
+		return 0;
+
+	/* Skip vddc attribute if get_current_vddc is not implemented */
+	if(attr == &sensor_dev_attr_in0_input.dev_attr.attr &&
+		!rdev->asic->dpm.get_current_vddc)
 		return 0;
 
 	/* Skip fan attributes if fan is not present */
--
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
