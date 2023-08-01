Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C8A76B540
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 14:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 131BD10E07E;
	Tue,  1 Aug 2023 12:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E3B10E07E;
 Tue,  1 Aug 2023 12:55:55 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFZkw33NLzNmbP;
 Tue,  1 Aug 2023 20:52:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 20:55:49 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <evan.quan@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <mripard@kernel.org>, <tzimmermann@suse.de>,
 <drv@mailo.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] drm/amd/pm: Remove many unnecessary NULL values
Date: Tue, 1 Aug 2023 20:55:14 +0800
Message-ID: <20230801125514.378451-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ther are many pointers assigned first, which need not to be initialized, so
remove the NULL assignment.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c      | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c    | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
index 182118e3fd5f..5794b64507bf 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
@@ -1237,7 +1237,7 @@ static int get_vce_clock_voltage_limit_table(struct pp_hwmgr *hwmgr,
 		const VCEClockInfoArray    *array)
 {
 	unsigned long i;
-	struct phm_vce_clock_voltage_dependency_table *vce_table = NULL;
+	struct phm_vce_clock_voltage_dependency_table *vce_table;
 
 	vce_table = kzalloc(struct_size(vce_table, entries, table->numEntries),
 			    GFP_KERNEL);
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
index 4bc8db1be738..9e4228232f02 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c
@@ -2732,7 +2732,7 @@ static bool ci_is_dpm_running(struct pp_hwmgr *hwmgr)
 
 static int ci_smu_init(struct pp_hwmgr *hwmgr)
 {
-	struct ci_smumgr *ci_priv = NULL;
+	struct ci_smumgr *ci_priv;
 
 	ci_priv = kzalloc(sizeof(struct ci_smumgr), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
index 02c094a06605..5e43ad2b2956 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
@@ -332,7 +332,7 @@ static bool fiji_is_hw_avfs_present(struct pp_hwmgr *hwmgr)
 
 static int fiji_smu_init(struct pp_hwmgr *hwmgr)
 {
-	struct fiji_smumgr *fiji_priv = NULL;
+	struct fiji_smumgr *fiji_priv;
 
 	fiji_priv = kzalloc(sizeof(struct fiji_smumgr), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
index 060fc140c574..97d9802fe673 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
@@ -259,7 +259,7 @@ static int iceland_start_smu(struct pp_hwmgr *hwmgr)
 
 static int iceland_smu_init(struct pp_hwmgr *hwmgr)
 {
-	struct iceland_smumgr *iceland_priv = NULL;
+	struct iceland_smumgr *iceland_priv;
 
 	iceland_priv = kzalloc(sizeof(struct iceland_smumgr), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
index acbe41174d7e..6fe6e6abb5d8 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c
@@ -226,7 +226,7 @@ static int tonga_start_smu(struct pp_hwmgr *hwmgr)
 
 static int tonga_smu_init(struct pp_hwmgr *hwmgr)
 {
-	struct tonga_smumgr *tonga_priv = NULL;
+	struct tonga_smumgr *tonga_priv;
 
 	tonga_priv = kzalloc(sizeof(struct tonga_smumgr), GFP_KERNEL);
 	if (tonga_priv == NULL)
-- 
2.34.1

