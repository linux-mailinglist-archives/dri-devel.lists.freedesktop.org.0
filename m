Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5FD287B7B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 20:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AAE6EABB;
	Thu,  8 Oct 2020 18:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E9E6EABC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 18:16:22 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 7so4985339pgm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 11:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N7w6/srfHgHC4St5mG41kfk7Ep5jOdOqt2CxJ+oK4Vs=;
 b=rnZt9IAdrbXHeZkOiuE4cgknX+DA6SwRS/qHqju1RIsWnSJAtaIRdPgqrOJ6s3/WLx
 OVrycwtLOrJgTmNpuDMxIAtIV9gZaNTZ9wa1IEw/7e3J7MyPEbj0hqEEQPTOZ3Qm2cdN
 WY1K1LOFIUTpOC5205z2RZFJ3L47lDd7Zokd5Egdx62LffjdVjjfiQ5IOV+wTKQTCsLy
 GTBx4kysPNkdsnHI95tnmgAFbJrX7UN7Ffetq8kJwXDbaS9x2Nh5zOJCb7tIvd56OXSN
 2qNh6nlq6Ss1UEOl0b4ySYGb4OwI4FDaOHzZF/6DZmV0gLIODU1UkUbLI219RCv1Sa/r
 XJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N7w6/srfHgHC4St5mG41kfk7Ep5jOdOqt2CxJ+oK4Vs=;
 b=cFosY95nZoPrVCnHgwMJo/QprDzGSbhjmoJ/QbpKBiJEntrRDvyN0qfmst2GfeGlV+
 /ZS1gNBpXOEZ+c4zZrch9S+8svlrerLcP3bmTDctsnRys/0oB0D1tvmNk81i4L5jnxNG
 juKabswy88ySvpVS0eOxiiGgJaFYk8YEc7n82oEOBLtggsrLFQkSKVRb1Fk+2Eh4/Zai
 f5GqN5Lc4cuQmploqQlCGnuMRBbMfyM3D+ELSwjE/ppDa8w8NGBrr3+DMbxtBMpHM2Al
 0UAH0v+aDvk6gCJ67Z30CaFq2Ir61v1fXQ0iX6v+xmuwtIt/Ovb1fy9L5y7/4rBT7sd+
 X5LA==
X-Gm-Message-State: AOAM5304MhN/lAo3+/6OBbpRVUHBhBV06nI+aMh32yr8wGsjN6flsxT9
 WdCfDyHtqD4a9Cxe42dwThc=
X-Google-Smtp-Source: ABdhPJyE74qYM/TnwiI3HEm//WCrW5AHMk4gRi8KPak+mUC1ODan9bgs/7Inn8ABZEGIGCvI1jLu0g==
X-Received: by 2002:a17:90a:eb07:: with SMTP id
 j7mr118991pjz.224.1602180982142; 
 Thu, 08 Oct 2020 11:16:22 -0700 (PDT)
Received: from localhost.localdomain ([49.207.141.225])
 by smtp.gmail.com with ESMTPSA id u18sm8492491pgk.18.2020.10.08.11.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 11:16:21 -0700 (PDT)
From: sandy.8925@gmail.com
To: alexander.deucher@amd.com
Subject: [PATCH 2/3] drm/radeon: Add implementation of get_current_vddc for
 Sumo
Date: Thu,  8 Oct 2020 23:46:05 +0530
Message-Id: <20201008181606.460499-3-sandy.8925@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201008181606.460499-1-sandy.8925@gmail.com>
References: <20201008181606.460499-1-sandy.8925@gmail.com>
MIME-Version: 1.0
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
Cc: Sandeep Raghuraman <sandy.8925@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandeep Raghuraman <sandy.8925@gmail.com>

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_asic.c |  1 +
 drivers/gpu/drm/radeon/radeon_asic.h |  1 +
 drivers/gpu/drm/radeon/sumo_dpm.c    | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

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
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
