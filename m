Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F457BA306C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4F210E22E;
	Fri, 26 Sep 2025 08:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="i0m3M4JP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA7E10E062
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:55:33 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D8C4B3FBC1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1758876931;
 bh=tYbCmz6DRcivudFtizhBKVDUP6a4VtRsDibIRlblbac=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
 b=i0m3M4JPqJ4zZhGAHzrWfTf2qPPzzgz459hTHD2jnkHL6ypKJU7YDCbuBSuerQqYL
 6cEkC6Gslx43LEQmoBNCSpfoE5U5ACsNZ0grplbpqKWupLr3YJgIDT7eNs/84PIVAO
 0rXELlovXChVFvH8uu8LnsfY1ldgThtEbt7rjGAchi3kwC98UQU5veUKU+LMpHKOxr
 MFPdS0VFNJ7oZYQVDodSR6mghQ3tUWs5ko0ZYxcR0UpA3joNx1jQbe0P5dSSRmWBoK
 nSho6vo359rHvpePP61KwX9/l9eqFqLCXQmptBgVAfDDjnAOgr1uj+Hru8QOuugGHn
 qxcwk5SnUswsQ==
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-634b661347bso821174a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 01:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758876931; x=1759481731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tYbCmz6DRcivudFtizhBKVDUP6a4VtRsDibIRlblbac=;
 b=LW3SoXXGfrReynZIfpU3HvCMKj5aaBkRhOxnIxT99EotOOQ33pFKUZMT/HFLbvYtJ/
 FvISDt4itCMj5zmXNzZH1Tmp1ZdcCVKbAsXQbgnPNevtLw5wR7X3+8oE4EO973Bu+J7A
 5Zizic61eDEsVVRx3osCXEEr1Q46b/XDmx/n8bJz/1oJD82QOvBx+brkcGlklyuHsxy/
 e3HT8c/NJN5hWxI+tqp0AFl5hwDzC7+ViN51LxXCx0VPT829Y+BQ/vuyTHiQzwjipaaQ
 GeMGA12XzCIPi+ardCh7onOYH405Jpcl/GKJkDZARN6LfjYioNLGSMNB6evM+ktEf87o
 DdEQ==
X-Gm-Message-State: AOJu0Yxjwr1S7ZCXzortHRG0x7taB8GPvlhTwCG9792F2wGP89+cUNw5
 SRa/0AWp0WIwviytyUYfzzJDA7m+e2uJoyqMhk7RctOxWTySkWEIs6ov6sbzAzXv+ziirUG197S
 NQOQPUHXAXaZUePsU/3d806I3GG1DIyQmTXaixMPhhp1UB/h7ZBHuBJVLOXbKchaneocA56DM+d
 sIOqrCz75FBit3TOJ0lE1f
X-Gm-Gg: ASbGncuFGo9Drf221R8YzG++IqejtqcmrOlL7xi4XgnKcbdNeToiYdUtxkoMLY7H5gM
 rO6/wCWMdctK9vPIrtbSTRmDX8kGfxu6QeiK4fWJbsxTkcMhLtkNSxdX+wPvrKQoFx9OK/tLfXs
 WMcZyF6KDlphJGGKPpNneKufRbDTjky8A8XVS8OHiHU2NEDNNrvsl+wjKh3kaQOFLuK+mEINk63
 8YHu3oZ6dbeLFq/bb/fZZY2cuQ8XB/SNep+cwjMlhJkFv6HIY6TLZrz65i0hYJ2Naro7tI6aQ3Y
 JDlUvGSxSk1oizkX4VRElhF32+jJCWu8DHystCcTy6TCXVxMXq1AhwPf
X-Received: by 2002:a17:906:c145:b0:b34:103b:484c with SMTP id
 a640c23a62f3a-b34b9d64ae1mr775382666b.16.1758876931115; 
 Fri, 26 Sep 2025 01:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJnUsWRMqCnVW0L6UsqhW6GfmZPqDaS51X9cSqZ4/iz2tBwZKu7NnpsYjonEaYorYV4TOxHg==
X-Received: by 2002:a17:906:c145:b0:b34:103b:484c with SMTP id
 a640c23a62f3a-b34b9d64ae1mr775379766b.16.1758876930707; 
 Fri, 26 Sep 2025 01:55:30 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.15])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b35446f7746sm328087966b.59.2025.09.26.01.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 01:55:30 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, suraj.kandpal@intel.com, imre.deak@intel.com,
 joonas.lahtinen@linux.intel.com, aaron.ma@canonical.com
Subject: [PATCH 1/2] drm/dp: Add drm_edp_backlight_get_level
Date: Fri, 26 Sep 2025 16:54:00 +0800
Message-ID: <20250926085401.2808634-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement drm_edp_backlight_get_level() to read the current
backlight brightness level from eDP DPCD registers via AUX channel.

Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 52 +++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e3167..0cfb357ebd9e2 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3945,6 +3945,58 @@ int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc)
 }
 EXPORT_SYMBOL(drm_dp_pcon_convert_rgb_to_ycbcr);
 
+/**
+ * drm_edp_backlight_get_level - Get the backlight level of eDP DPCD via AUX
+ * @aux: The DP aux device
+ * @bl: Backlight capability info from the panel
+ *
+ * Reads the current backlight brightness level from luminance mode
+ * (24-bit value in nits) or DPCD AUX mode(16-bit and 8-bit modes).
+ *
+ * Returns: Current backlight level.
+ */
+u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl)
+{
+	int ret;
+	u8 buf[3] = { 0 };
+	u32 level = 0;
+
+	if (!(bl->aux_set || bl->luminance_set))
+		return 0;
+
+	if (bl->luminance_set) {
+		ret = drm_dp_dpcd_read(aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf, sizeof(buf));
+		if (ret < 0) {
+			DRM_DEV_ERROR(aux->drm_dev->dev,
+				      "%s: Failed to read luminance value: %d\n",
+				      aux->name, ret);
+			return 0;
+		}
+		level = (buf[2] << 16 | buf[1] << 8 | buf[0]) / 1000;
+	} else if (bl->lsb_reg_used) {
+		ret = drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 2);
+		if (ret < 0) {
+			DRM_DEV_ERROR(aux->drm_dev->dev,
+				      "%s: Failed to read backlight level: %d\n",
+				      aux->name, ret);
+			return 0;
+		}
+		level = buf[0] << 8 | buf[1];
+	} else {
+		ret = drm_dp_dpcd_read(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, buf, 1);
+		if (ret < 0) {
+			DRM_DEV_ERROR(aux->drm_dev->dev,
+				      "%s: Failed to read backlight level: %d\n",
+				      aux->name, ret);
+			return 0;
+		}
+		level = buf[0];
+	}
+
+	return level;
+}
+EXPORT_SYMBOL(drm_edp_backlight_get_level);
+
 /**
  * drm_edp_backlight_set_level() - Set the backlight level of an eDP panel via AUX
  * @aux: The DP AUX channel to use
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 87caa4f1fdb86..0b045a47ae573 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -864,6 +864,7 @@ drm_edp_backlight_init(struct drm_dp_aux *aux, struct drm_edp_backlight_info *bl
 		       u32 max_luminance,
 		       u16 driver_pwm_freq_hz, const u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE],
 		       u32 *current_level, u8 *current_mode, bool need_luminance);
+u32 drm_edp_backlight_get_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl);
 int drm_edp_backlight_set_level(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
 				u32 level);
 int drm_edp_backlight_enable(struct drm_dp_aux *aux, const struct drm_edp_backlight_info *bl,
-- 
2.43.0

