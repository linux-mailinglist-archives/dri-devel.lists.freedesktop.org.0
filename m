Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1BD2883D8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2616EC6E;
	Fri,  9 Oct 2020 07:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7DA6EC6E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:46:10 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d6so4051419plo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Xsean4YAsTwGnCr5AEHz62rOk5gCShirz9bkxvtA9xw=;
 b=G3UNbk8aLs3cjNy9v2SkwZAHSLvNV3FUNZW0MElAlXm7rQVDNetRRecTey6QPJwQY/
 EOvzxJ2XIyc5ss98sTjor65xhU30zh9aUGrU0PtcxLT+/TzBSqdmRWHo/zkSLfWEXiWR
 y9qttbQdDljrFTtNDh6qxwPIRI3dX9+NL2qfTP8N1K9xwJStkhrbB9IUBdl89/01XSjW
 5ulzeEekN43VDGSC45zV0zaKzY0buHbzmF/aUSor1lW4l78YGD7pbd2/IhH71qJ5xFD4
 SAb7DvqTTrmEQ3XXqtC2Sjha/rvvFpBVt/so+O7ZIBw37G5wFVMQyNkrRa9V4gs59ZQX
 25WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Xsean4YAsTwGnCr5AEHz62rOk5gCShirz9bkxvtA9xw=;
 b=mgKbvZkCbnbBDi0NnVZb98KHi5DIOCnqmmm+0pFebvxoeUw2t+/Rphcx1+ZbBHCgHs
 VxUqdb2eS7PSxr75dBDSK9iNK9IbfSIb0+gUowd87JN2hWlKWGktE0d/vxKFrp1+GM4b
 zouuqj5gCAhPLfTUpEX5DeOZ/NZpvJV6vfmQxS+EHVZFdnIZsWORMTolmq7V/Tkkc+UH
 sgyutB+s6EPswsVOJ4O+QGjv5STMvOf+kvoOuUF870sB17dHXkQTnnRKS5zHUhH4wmMJ
 IEo2G3g562AeGfXiB56jEPekwH06aKQtMO8rI0qvpefKYj93DWSABtJ+Zk4kkTmGrT8y
 Ml8A==
X-Gm-Message-State: AOAM533W2W+Ts1AdDovEkVaZfBdO2BlkmPh5UQMkvf0hrOg0FvbD2Cpt
 rAh0it5yd1sZc9Z2EAOHvDW2POgZmTt/dQ==
X-Google-Smtp-Source: ABdhPJwj6c09Zeve8hI582w1mOi6dPUyjsRHbrDihBssMed4JHjicaQjxK8nRjqPHsXNxT2bAbMZvA==
X-Received: by 2002:a17:902:ea8c:b029:d2:8abd:c8de with SMTP id
 x12-20020a170902ea8cb02900d28abdc8demr11474443plb.21.1602229569634; 
 Fri, 09 Oct 2020 00:46:09 -0700 (PDT)
Received: from [192.168.86.30] ([49.207.136.194])
 by smtp.gmail.com with ESMTPSA id x3sm10059735pgg.54.2020.10.09.00.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 00:46:09 -0700 (PDT)
To: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH v2 2/3] drm/radeon: Add implementation of get_current_vddc for
 Sumo
Message-ID: <f70a5685-54e8-82a2-d549-0ec962a1a7e8@gmail.com>
Date: Fri, 9 Oct 2020 13:16:09 +0530
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

Add implementation of get_current_vddc() callback for Sumo.

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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
