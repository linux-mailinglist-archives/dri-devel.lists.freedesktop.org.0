Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FBE49BEAE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BB510E5CA;
	Tue, 25 Jan 2022 22:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF6610E5DE;
 Tue, 25 Jan 2022 22:38:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1qNXwUa6k8W+bEQCxnAjp7O6C+SJMwPB2WAku3qLpXBA1mQGRKBfP2vNiXdyx7gZjItmqTVhUBJhmTC4VKXuABj4a4vw8qA4XEHPwKL/vzB3NY6q6I+O1818VKYZiV8i66ZPavFH3McBTxusIUVg35PBMW3U5NJOHR6oVT0KdpIpXNQ15bS2LONFWOF0szX+c4GwqbSklT35w67G/9I561EjuhA8pvoyXHAMFhhdRblWbK16Nke7CiEzZcxCjyThtMZGg+ut4UTPejS9TGIoouNdPWbQVG+p+wsoa0QvevfYaELN8mBwAWp6djXN/LEWJH90ZFv0gd2D0D5W+e/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULSNpqazNJs7dO0hZB5CNlBxQevOI3noWFdpkMwzggA=;
 b=Gdz0ktzWWW3CkK+DT8GeYc7ohU10Jpoe0qtreWunSFgjOT8hFP5lUR0dVBRy9UT//EBB9XYbirHbzep6h8H1TKxRgPyPe0+TcfAL8XLx+ihaOoJUcTocDMEuKO7ezrjxiMvZJ/pgvE/2vmyXdzsh5MzFiq39jsNPGcM3U9mxHLAtknl7s23Nns8gydXTvjjwVkihMsPym6aVkxL79qDSX8MPzSJ5VSO4PLw5zT5Ioss6OASWab7xXyo7JoAn8G+FMv0HNOZCjIsb1j7utldJish8T47B6SMQQW8sEx8R0EfamJcEtm0SVN5uKLNMVTmawfRadjbxWpa6lJhMyyaeqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULSNpqazNJs7dO0hZB5CNlBxQevOI3noWFdpkMwzggA=;
 b=Y+qXMciYjQeiymSAMKFZSI3MjfZiZbXR6JMg7T1E/07NGC417PWAehmbcFX4d46VaRpjiu99R4darlDLrAnp5n+sxP9ZPis/AX3jNidd3SKe0K733gt/kNhhnZ2OK0L4c672M/X7KvYKNJiWTyyDC3jaw3WTQqXHXilpBxuHg/o=
Received: from DM5PR21CA0029.namprd21.prod.outlook.com (2603:10b6:3:ed::15) by
 MN2PR12MB3727.namprd12.prod.outlook.com (2603:10b6:208:15a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Tue, 25 Jan
 2022 22:38:31 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::d4) by DM5PR21CA0029.outlook.office365.com
 (2603:10b6:3:ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.4 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 22:38:30 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:29 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 09/12] drm/amdgpu: Move reset sem into reset_domain
Date: Tue, 25 Jan 2022 17:37:49 -0500
Message-ID: <20220125223752.200211-10-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2ffe60a-1792-4762-fd8d-08d9e053697e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3727:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB37274559B9E68258E50B0EF1EA5F9@MN2PR12MB3727.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fCHkh4gBrL/Ug329uOADomX8bmHCAI1CG/lyQR80yB32dKMPHtx2joPtlkIwhakTIklOa8U5twJlXjG80cidXM2j1FreeSl5+UxbvRJZenMJQNaFqMZmu8uRCX57xnLJV7eUbKvWVV9O1+4OJMA7vQexUPKs/QPHcaf03fAwB3kWUBdfSvx9t3RjidJEQI9FVgY33hsHy4FKDOouGXhiWRwCHjROyrluabEcXTgto1bmA9zBH5NTVZ9C+tYtLEgFDtcCWG0MQp3seL21IMlbPl3nlPeARtB2Bh9ZItS7fcWy7aSBT6C+lnrEhCTKwwd434c0iPaVpjrTdtYx2s43pf7F0vxcopNAbYIsKc9JBOkqYg9fc1EyZbQeiLX9nZAaVyt+EtieFPgWvLctwi+TpD2BujyIk76wpd9+1Up/XyBcFs63C6Dea9G8umeQkfswtpEL0XPr/xl+9rZUT3HFrzvH65rkTOlBfK4OzDvq8Sxo40lqoiee9AhNDv6YEFBrApx+bcQLaUg3krc3yZnlqP0LP5nWEFMOHvvuvNO3CPhaWuh34EKmMZZeciSB4azrJNC+Sni5zhyiMrSTKDiZaEzw5R7JPHkhj0/GLSxewqVRfuYu1LlcusZptIZVwjca4jiRMEaSiRiEJt1B6TakhqLTr+LvtbEAk8P1W3b4P7OUN8dxIawt2R6qd9FVkC/mYpClzZMa189D9m/EO/iEw+EsU3H5KQRDBTCnTHhWjECaGeemkYySX60Vn9B6sAJJqMd6ws2DB9P9kK5tJlLHHYDak/zPOiwo9XzRfoEPmVI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(46966006)(36840700001)(5660300002)(8676002)(36756003)(7696005)(8936002)(83380400001)(86362001)(2616005)(508600001)(26005)(426003)(186003)(40460700003)(70586007)(82310400004)(16526019)(44832011)(4326008)(47076005)(110136005)(54906003)(30864003)(1076003)(36860700001)(2906002)(81166007)(336012)(316002)(356005)(6666004)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:30.5379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ffe60a-1792-4762-fd8d-08d9e053697e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want single instance of reset sem across all
reset clients because in case of XGMI we should stop
access cross device MMIO because any of them could be
in a reset in the moment.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 10 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 23 +++++++++----------
 .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    | 18 ++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c     |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  6 +++--
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         | 14 ++++++-----
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  4 ++--
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c         |  4 ++--
 10 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index f2ba460bfd59..f021cd3c9d34 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1058,7 +1058,6 @@ struct amdgpu_device {
 
 	atomic_t 			in_gpu_reset;
 	enum pp_mp1_state               mp1_state;
-	struct rw_semaphore reset_sem;
 	struct amdgpu_doorbell_index doorbell_index;
 
 	struct mutex			notifier_lock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 164d6a9e9fbb..e7ccd5d16e9d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -37,6 +37,8 @@
 #include "amdgpu_fw_attestation.h"
 #include "amdgpu_umr.h"
 
+#include "amdgpu_reset.h"
+
 #if defined(CONFIG_DEBUG_FS)
 
 /**
@@ -1279,7 +1281,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	}
 
 	/* Avoid accidently unparking the sched thread during GPU reset */
-	r = down_write_killable(&adev->reset_sem);
+	r = down_write_killable(&adev->reset_domain->sem);
 	if (r)
 		return r;
 
@@ -1308,7 +1310,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 		kthread_unpark(ring->sched.thread);
 	}
 
-	up_write(&adev->reset_sem);
+	up_write(&adev->reset_domain->sem);
 
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
@@ -1517,7 +1519,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 		return -ENOMEM;
 
 	/* Avoid accidently unparking the sched thread during GPU reset */
-	r = down_read_killable(&adev->reset_sem);
+	r = down_read_killable(&adev->reset_domain->sem);
 	if (r)
 		goto pro_end;
 
@@ -1560,7 +1562,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 	/* restart the scheduler */
 	kthread_unpark(ring->sched.thread);
 
-	up_read(&adev->reset_sem);
+	up_read(&adev->reset_domain->sem);
 
 	ttm_bo_unlock_delayed_workqueue(&adev->mman.bdev, resched);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b24829096359..6991ab4a8191 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -423,10 +423,10 @@ bool amdgpu_device_skip_hw_access(struct amdgpu_device *adev)
 	 * the lock.
 	 */
 	if (in_task()) {
-		if (down_read_trylock(&adev->reset_sem))
-			up_read(&adev->reset_sem);
+		if (down_read_trylock(&adev->reset_domain->sem))
+			up_read(&adev->reset_domain->sem);
 		else
-			lockdep_assert_held(&adev->reset_sem);
+			lockdep_assert_held(&adev->reset_domain->sem);
 	}
 #endif
 	return false;
@@ -452,9 +452,9 @@ uint32_t amdgpu_device_rreg(struct amdgpu_device *adev,
 	if ((reg * 4) < adev->rmmio_size) {
 		if (!(acc_flags & AMDGPU_REGS_NO_KIQ) &&
 		    amdgpu_sriov_runtime(adev) &&
-		    down_read_trylock(&adev->reset_sem)) {
+		    down_read_trylock(&adev->reset_domain->sem)) {
 			ret = amdgpu_kiq_rreg(adev, reg);
-			up_read(&adev->reset_sem);
+			up_read(&adev->reset_domain->sem);
 		} else {
 			ret = readl(((void __iomem *)adev->rmmio) + (reg * 4));
 		}
@@ -537,9 +537,9 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
 	if ((reg * 4) < adev->rmmio_size) {
 		if (!(acc_flags & AMDGPU_REGS_NO_KIQ) &&
 		    amdgpu_sriov_runtime(adev) &&
-		    down_read_trylock(&adev->reset_sem)) {
+		    down_read_trylock(&adev->reset_domain->sem)) {
 			amdgpu_kiq_wreg(adev, reg, v);
-			up_read(&adev->reset_sem);
+			up_read(&adev->reset_domain->sem);
 		} else {
 			writel(v, ((void __iomem *)adev->rmmio) + (reg * 4));
 		}
@@ -3512,7 +3512,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->virt.vf_errors.lock);
 	hash_init(adev->mn_hash);
 	atomic_set(&adev->in_gpu_reset, 0);
-	init_rwsem(&adev->reset_sem);
 	mutex_init(&adev->psp.mutex);
 	mutex_init(&adev->notifier_lock);
 
@@ -4779,9 +4778,9 @@ static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
 	atomic_set(&adev->in_gpu_reset, 1);
 
 	if (hive) {
-		down_write_nest_lock(&adev->reset_sem, &hive->hive_lock);
+		down_write_nest_lock(&adev->reset_domain->sem, &hive->hive_lock);
 	} else {
-		down_write(&adev->reset_sem);
+		down_write(&adev->reset_domain->sem);
 	}
 
 	switch (amdgpu_asic_reset_method(adev)) {
@@ -4802,7 +4801,7 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
 	amdgpu_vf_error_trans_all(adev);
 	adev->mp1_state = PP_MP1_STATE_NONE;
 	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
+	up_write(&adev->reset_domain->sem);
 }
 
 static void amdgpu_device_resume_display_audio(struct amdgpu_device *adev)
@@ -5421,7 +5420,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 	/* Fatal error, prepare for slot reset */
 	case pci_channel_io_frozen:
 		/*
-		 * Locking adev->reset_sem will prevent any external access
+		 * Locking adev->reset_domain->sem will prevent any external access
 		 * to GPU during PCI error recovery
 		 */
 		amdgpu_device_lock_adev(adev, NULL);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
index 05117eda105b..d3e055314804 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
@@ -31,6 +31,8 @@
 #include <linux/debugfs.h>
 #include <linux/uaccess.h>
 
+#include "amdgpu_reset.h"
+
 #define EEPROM_I2C_MADDR_VEGA20         0x0
 #define EEPROM_I2C_MADDR_ARCTURUS       0x40000
 #define EEPROM_I2C_MADDR_ARCTURUS_D342  0x0
@@ -193,12 +195,12 @@ static int __write_table_header(struct amdgpu_ras_eeprom_control *control)
 	__encode_table_header_to_buf(&control->tbl_hdr, buf);
 
 	/* i2c may be unstable in gpu reset */
-	down_read(&adev->reset_sem);
+	down_read(&adev->reset_domain->sem);
 	res = amdgpu_eeprom_write(&adev->pm.smu_i2c,
 				  control->i2c_address +
 				  control->ras_header_offset,
 				  buf, RAS_TABLE_HEADER_SIZE);
-	up_read(&adev->reset_sem);
+	up_read(&adev->reset_domain->sem);
 
 	if (res < 0) {
 		DRM_ERROR("Failed to write EEPROM table header:%d", res);
@@ -387,13 +389,13 @@ static int __amdgpu_ras_eeprom_write(struct amdgpu_ras_eeprom_control *control,
 	int res;
 
 	/* i2c may be unstable in gpu reset */
-	down_read(&adev->reset_sem);
+	down_read(&adev->reset_domain->sem);
 	buf_size = num * RAS_TABLE_RECORD_SIZE;
 	res = amdgpu_eeprom_write(&adev->pm.smu_i2c,
 				  control->i2c_address +
 				  RAS_INDEX_TO_OFFSET(control, fri),
 				  buf, buf_size);
-	up_read(&adev->reset_sem);
+	up_read(&adev->reset_domain->sem);
 	if (res < 0) {
 		DRM_ERROR("Writing %d EEPROM table records error:%d",
 			  num, res);
@@ -547,12 +549,12 @@ amdgpu_ras_eeprom_update_header(struct amdgpu_ras_eeprom_control *control)
 		goto Out;
 	}
 
-	down_read(&adev->reset_sem);
+	down_read(&adev->reset_domain->sem);
 	res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
 				 control->i2c_address +
 				 control->ras_record_offset,
 				 buf, buf_size);
-	up_read(&adev->reset_sem);
+	up_read(&adev->reset_domain->sem);
 	if (res < 0) {
 		DRM_ERROR("EEPROM failed reading records:%d\n",
 			  res);
@@ -642,13 +644,13 @@ static int __amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
 	int res;
 
 	/* i2c may be unstable in gpu reset */
-	down_read(&adev->reset_sem);
+	down_read(&adev->reset_domain->sem);
 	buf_size = num * RAS_TABLE_RECORD_SIZE;
 	res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
 				 control->i2c_address +
 				 RAS_INDEX_TO_OFFSET(control, fri),
 				 buf, buf_size);
-	up_read(&adev->reset_sem);
+	up_read(&adev->reset_domain->sem);
 	if (res < 0) {
 		DRM_ERROR("Reading %d EEPROM table records error:%d",
 			  num, res);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index f2d310cd8d40..011585e330f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -127,6 +127,8 @@ struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(char *wq_name)
 
 	}
 
+	init_rwsem(&reset_domain->sem);
+
 	return reset_domain;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index cd030e63e4c6..7451089b0c06 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -73,6 +73,7 @@ struct amdgpu_reset_control {
 struct amdgpu_reset_domain {
 	struct kref refcount;
 	struct workqueue_struct *wq;
+	struct rw_semaphore sem;
 };
 
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 3ec5ff5a6dbe..29d3a222181e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -48,6 +48,8 @@
 #include "athub_v2_0.h"
 #include "athub_v2_1.h"
 
+#include "amdgpu_reset.h"
+
 #if 0
 static const struct soc15_reg_golden golden_settings_navi10_hdp[] =
 {
@@ -328,7 +330,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 */
 	if (adev->gfx.kiq.ring.sched.ready &&
 	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev)) &&
-	    down_read_trylock(&adev->reset_sem)) {
+	    down_read_trylock(&adev->reset_domain->sem)) {
 		struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
 		const unsigned eng = 17;
 		u32 inv_req = hub->vmhub_funcs->get_invalidate_req(vmid, flush_type);
@@ -338,7 +340,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 		amdgpu_virt_kiq_reg_write_reg_wait(adev, req, ack, inv_req,
 				1 << vmid);
 
-		up_read(&adev->reset_sem);
+		up_read(&adev->reset_domain->sem);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index cb82404df534..d5e8d4709d8b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -62,6 +62,8 @@
 #include "amdgpu_ras.h"
 #include "amdgpu_xgmi.h"
 
+#include "amdgpu_reset.h"
+
 /* add these here since we already include dce12 headers and these are for DCN */
 #define mmHUBP0_DCSURF_PRI_VIEWPORT_DIMENSION                                                          0x055d
 #define mmHUBP0_DCSURF_PRI_VIEWPORT_DIMENSION_BASE_IDX                                                 2
@@ -766,13 +768,13 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 */
 	if (adev->gfx.kiq.ring.sched.ready &&
 	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev)) &&
-	    down_read_trylock(&adev->reset_sem)) {
+	    down_read_trylock(&adev->reset_domain->sem)) {
 		uint32_t req = hub->vm_inv_eng0_req + hub->eng_distance * eng;
 		uint32_t ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
 
 		amdgpu_virt_kiq_reg_write_reg_wait(adev, req, ack, inv_req,
 						   1 << vmid);
-		up_read(&adev->reset_sem);
+		up_read(&adev->reset_domain->sem);
 		return;
 	}
 
@@ -868,7 +870,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 	if (amdgpu_in_reset(adev))
 		return -EIO;
 
-	if (ring->sched.ready && down_read_trylock(&adev->reset_sem)) {
+	if (ring->sched.ready && down_read_trylock(&adev->reset_domain->sem)) {
 		/* Vega20+XGMI caches PTEs in TC and TLB. Add a
 		 * heavy-weight TLB flush (type 2), which flushes
 		 * both. Due to a race condition with concurrent
@@ -895,7 +897,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 		if (r) {
 			amdgpu_ring_undo(ring);
 			spin_unlock(&adev->gfx.kiq.ring_lock);
-			up_read(&adev->reset_sem);
+			up_read(&adev->reset_domain->sem);
 			return -ETIME;
 		}
 
@@ -904,10 +906,10 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 		r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
 		if (r < 1) {
 			dev_err(adev->dev, "wait for kiq fence error: %ld.\n", r);
-			up_read(&adev->reset_sem);
+			up_read(&adev->reset_domain->sem);
 			return -ETIME;
 		}
-		up_read(&adev->reset_sem);
+		up_read(&adev->reset_domain->sem);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 05e98af30b48..5dab06fce26a 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -254,7 +254,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	 * otherwise the mailbox msg will be ruined/reseted by
 	 * the VF FLR.
 	 */
-	if (!down_write_trylock(&adev->reset_sem))
+	if (!down_write_trylock(&adev->reset_domain->sem))
 		return;
 
 	amdgpu_virt_fini_data_exchange(adev);
@@ -272,7 +272,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 
 flr_done:
 	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
+	up_write(&adev->reset_domain->sem);
 
 	/* Trigger recovery for world switch failure if no TDR */
 	if (amdgpu_device_should_recover_gpu(adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index 6e12055f3f4a..868144fff16a 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -283,7 +283,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 	 * otherwise the mailbox msg will be ruined/reseted by
 	 * the VF FLR.
 	 */
-	if (!down_write_trylock(&adev->reset_sem))
+	if (!down_write_trylock(&adev->reset_domain->sem))
 		return;
 
 	amdgpu_virt_fini_data_exchange(adev);
@@ -301,7 +301,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 
 flr_done:
 	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
+	up_write(&adev->reset_domain->sem);
 
 	/* Trigger recovery for world switch failure if no TDR */
 	if (amdgpu_device_should_recover_gpu(adev)
-- 
2.25.1

