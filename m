Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B24CA1086C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00BF10E2DB;
	Tue, 14 Jan 2025 14:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jan 2025 14:04:33 UTC
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3D610E2DB;
 Tue, 14 Jan 2025 14:04:33 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 14 Jan
 2025 16:59:03 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 14 Jan
 2025 16:59:02 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>
Subject: [PATCH] drm/radeon/ci_dpm: Remove needless NULL checks of dpm tables
Date: Tue, 14 Jan 2025 05:58:56 -0800
Message-ID: <20250114135856.16192-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
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

This patch removes useless NULL pointer checks in functions like
ci_set_private_data_variables_based_on_pptable() and
ci_setup_default_dpm_tables().

The pointers in question are initialized as addresses to existing
structures such as rdev->pm.dpm.dyn_state.vddc_dependency_on_sclk by
utilizing & operator and therefore are not in danger of being NULL.

Fix this by removing extra checks thus cleaning the code a tiny bit.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: cc8dbbb4f62a ("drm/radeon: add dpm support for CI dGPUs (v2)")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index abe9d65cc460..7c3a960f486a 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -3405,12 +3405,8 @@ static int ci_setup_default_dpm_tables(struct radeon_device *rdev)
 		&rdev->pm.dpm.dyn_state.cac_leakage_table;
 	u32 i;
 
-	if (allowed_sclk_vddc_table == NULL)
-		return -EINVAL;
 	if (allowed_sclk_vddc_table->count < 1)
 		return -EINVAL;
-	if (allowed_mclk_table == NULL)
-		return -EINVAL;
 	if (allowed_mclk_table->count < 1)
 		return -EINVAL;
 
@@ -3468,24 +3464,20 @@ static int ci_setup_default_dpm_tables(struct radeon_device *rdev)
 	pi->dpm_table.vddc_table.count = allowed_sclk_vddc_table->count;
 
 	allowed_mclk_table = &rdev->pm.dpm.dyn_state.vddci_dependency_on_mclk;
-	if (allowed_mclk_table) {
-		for (i = 0; i < allowed_mclk_table->count; i++) {
-			pi->dpm_table.vddci_table.dpm_levels[i].value =
-				allowed_mclk_table->entries[i].v;
-			pi->dpm_table.vddci_table.dpm_levels[i].enabled = true;
-		}
-		pi->dpm_table.vddci_table.count = allowed_mclk_table->count;
+	for (i = 0; i < allowed_mclk_table->count; i++) {
+		pi->dpm_table.vddci_table.dpm_levels[i].value =
+			allowed_mclk_table->entries[i].v;
+		pi->dpm_table.vddci_table.dpm_levels[i].enabled = true;
 	}
+	pi->dpm_table.vddci_table.count = allowed_mclk_table->count;
 
 	allowed_mclk_table = &rdev->pm.dpm.dyn_state.mvdd_dependency_on_mclk;
-	if (allowed_mclk_table) {
-		for (i = 0; i < allowed_mclk_table->count; i++) {
-			pi->dpm_table.mvdd_table.dpm_levels[i].value =
-				allowed_mclk_table->entries[i].v;
-			pi->dpm_table.mvdd_table.dpm_levels[i].enabled = true;
-		}
-		pi->dpm_table.mvdd_table.count = allowed_mclk_table->count;
+	for (i = 0; i < allowed_mclk_table->count; i++) {
+		pi->dpm_table.mvdd_table.dpm_levels[i].value =
+			allowed_mclk_table->entries[i].v;
+		pi->dpm_table.mvdd_table.dpm_levels[i].enabled = true;
 	}
+	pi->dpm_table.mvdd_table.count = allowed_mclk_table->count;
 
 	ci_setup_default_pcie_tables(rdev);
 
@@ -4880,16 +4872,10 @@ static int ci_set_private_data_variables_based_on_pptable(struct radeon_device *
 	struct radeon_clock_voltage_dependency_table *allowed_mclk_vddci_table =
 		&rdev->pm.dpm.dyn_state.vddci_dependency_on_mclk;
 
-	if (allowed_sclk_vddc_table == NULL)
-		return -EINVAL;
 	if (allowed_sclk_vddc_table->count < 1)
 		return -EINVAL;
-	if (allowed_mclk_vddc_table == NULL)
-		return -EINVAL;
 	if (allowed_mclk_vddc_table->count < 1)
 		return -EINVAL;
-	if (allowed_mclk_vddci_table == NULL)
-		return -EINVAL;
 	if (allowed_mclk_vddci_table->count < 1)
 		return -EINVAL;
 
