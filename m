Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A8D7E3D0A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054BF10E566;
	Tue,  7 Nov 2023 12:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C53C10E566;
 Tue,  7 Nov 2023 12:25:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9DC636119F;
 Tue,  7 Nov 2023 12:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625F9C433C9;
 Tue,  7 Nov 2023 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359924;
 bh=Ioi7mPlGKMyVopP5FR3mxUEhN3/XvHFSwUJ360SaOKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jGqRvpEC0vp0rezzakPtaKhS1yhyr1eKTXoe3myHmidCsN9SmtMAKHcN+Jov4TZtn
 kffdkbNlEXYtteLxCUWZfQ4TioND3C6Gq8Mcci6Eg4vKecOqEXxwFqnyY6DY395+pT
 Z4KVixp8dQWVRpk9+2MMesCGGWdPtF4w+an1uUeMfO3toLWqrgS283XI0G4ZO+RMqw
 esQiX1SFPrW9OksF68xUXh337lm3aYXzoekaHlQykw/yD8bQKy0l4zfmVBrWEX3gIm
 XsWVek6Fbxfanodi62xzptuThmjJwV9ptKjWnXYPpJ6n1AC09GZV3GS2JnbfnwJd81
 NsNQc/9eiKzgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 11/37] drm/amd: Update `update_pcie_parameters`
 functions to use uint8_t arguments
Date: Tue,  7 Nov 2023 07:21:22 -0500
Message-ID: <20231107122407.3760584-11-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122407.3760584-1-sashal@kernel.org>
References: <20231107122407.3760584-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
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
Cc: lijo.lazar@amd.com, dri-devel@lists.freedesktop.org, Jun.Ma2@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, coelacanth_dream@protonmail.com,
 Sasha Levin <sashal@kernel.org>, mumei6102@gmail.com, guchun.chen@amd.com,
 amd-gfx@lists.freedesktop.org, Lyndon.Li@amd.com, kenneth.feng@amd.com,
 Kun.Liu2@amd.com, Tim.Huang@amd.com, bokun.zhang@amd.com, le.ma@amd.com,
 sunran001@208suo.com, evan.quan@amd.com, yifan1.zhang@amd.com,
 kevinyang.wang@amd.com, Xinhui.Pan@amd.com, baomingtong001@208suo.com,
 Alex Deucher <alexander.deucher@amd.com>, Lang.Yu@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 7752ccf85b929a22e658ec145283e8f31232f4bb ]

The matching values for `pcie_gen_cap` and `pcie_width_cap` when
fetched from powerplay tables are 1 byte, so narrow the arguments
to match to ensure min() and max() comparisons without casts.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c               | 2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h           | 2 +-
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h            | 4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c         | 4 ++--
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 8 ++++----
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c          | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 222af2fae7458..16c03771c1239 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1232,7 +1232,7 @@ static int smu_smc_hw_setup(struct smu_context *smu)
 {
 	struct smu_feature *feature = &smu->smu_feature;
 	struct amdgpu_device *adev = smu->adev;
-	uint32_t pcie_gen = 0, pcie_width = 0;
+	uint8_t pcie_gen = 0, pcie_width = 0;
 	uint64_t features_supported;
 	int ret = 0;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 6e2069dcb6b9d..d1d7713b97794 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -856,7 +856,7 @@ struct pptable_funcs {
 	 * &pcie_gen_cap: Maximum allowed PCIe generation.
 	 * &pcie_width_cap: Maximum allowed PCIe width.
 	 */
-	int (*update_pcie_parameters)(struct smu_context *smu, uint32_t pcie_gen_cap, uint32_t pcie_width_cap);
+	int (*update_pcie_parameters)(struct smu_context *smu, uint8_t pcie_gen_cap, uint8_t pcie_width_cap);
 
 	/**
 	 * @i2c_init: Initialize i2c.
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
index 355c156d871af..cc02f979e9e98 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
@@ -296,8 +296,8 @@ int smu_v13_0_get_pptable_from_firmware(struct smu_context *smu,
 					uint32_t pptable_id);
 
 int smu_v13_0_update_pcie_parameters(struct smu_context *smu,
-				     uint32_t pcie_gen_cap,
-				     uint32_t pcie_width_cap);
+				     uint8_t pcie_gen_cap,
+				     uint8_t pcie_width_cap);
 
 #endif
 #endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
index 95f6d821bacbc..addaa69119b8e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
@@ -2375,8 +2375,8 @@ static int navi10_get_power_limit(struct smu_context *smu,
 }
 
 static int navi10_update_pcie_parameters(struct smu_context *smu,
-				     uint32_t pcie_gen_cap,
-				     uint32_t pcie_width_cap)
+					 uint8_t pcie_gen_cap,
+					 uint8_t pcie_width_cap)
 {
 	struct smu_11_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
 	PPTable_t *pptable = smu->smu_table.driver_pptable;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 9119b0df2419f..9a5f3d31e7780 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -2084,14 +2084,14 @@ static int sienna_cichlid_display_disable_memory_clock_switch(struct smu_context
 #define MAX(a, b)	((a) > (b) ? (a) : (b))
 
 static int sienna_cichlid_update_pcie_parameters(struct smu_context *smu,
-					 uint32_t pcie_gen_cap,
-					 uint32_t pcie_width_cap)
+						 uint8_t pcie_gen_cap,
+						 uint8_t pcie_width_cap)
 {
 	struct smu_11_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
 	struct smu_11_0_pcie_table *pcie_table = &dpm_context->dpm_tables.pcie_table;
 	uint8_t *table_member1, *table_member2;
-	uint32_t min_gen_speed, max_gen_speed;
-	uint32_t min_lane_width, max_lane_width;
+	uint8_t min_gen_speed, max_gen_speed;
+	uint8_t min_lane_width, max_lane_width;
 	uint32_t smu_pcie_arg;
 	int ret, i;
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 9b62b45ebb7f0..4fa94f583b87c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -2426,8 +2426,8 @@ int smu_v13_0_mode1_reset(struct smu_context *smu)
 }
 
 int smu_v13_0_update_pcie_parameters(struct smu_context *smu,
-				     uint32_t pcie_gen_cap,
-				     uint32_t pcie_width_cap)
+				     uint8_t pcie_gen_cap,
+				     uint8_t pcie_width_cap)
 {
 	struct smu_13_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
 	struct smu_13_0_pcie_table *pcie_table =
-- 
2.42.0

