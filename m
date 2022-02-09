Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E374AE5FA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458D910E62F;
	Wed,  9 Feb 2022 00:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCDF10E5F6;
 Wed,  9 Feb 2022 00:24:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6XKOsd1iYYs206DOUfEiVdW5GTkqzctfrw//L2k5z+XZHc/tt9IWudhZ/xr2qgN3qzjm7cLSykKJJrFxT9FUlUGMnhChEOj/eOtZ9X8x33PiL4ovE3/PLO4v22kOv2i5P8zfgwwiUBmjeAxnXZ1X5WlVQ20losNyZdbElU/TStyrvQ9dfugXLssg3HCaUeNJ6N+OW3cHjxivWqD7O/I7b19GX5MUQKOYTCp6IZxaoiGSf8rDE36qLNiaQxGVdpUa1lX3S6nqbo7zTUoDyXZxwu+Ka5R2sejBdYdxtpuiHLsvQYPt3IJTvrNCiNCvlHZp5lOeUMEJVWXBYDwr095KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yCcwQNCOG4Hn4L9MzXZLhRLchB3QnBWv2Z2f7fyBDo=;
 b=eCIncRHUnyq9JxANhhImID/S60cNqQVEASLgRolF0it//fyy1ILsDq7L22+d60FshvdCkkUsu2013170oCt6m36fukptd2STKDZKAzIzT6AAjHDBeWFOK7vLR1NmuVRDhRB1URwFhcf95yrJEFAj3khTQfyE9F+56oIDdFeX0mURDdyaqJ1+HpLjNehUWWS950OBqWgMqrnli2DmCzefL122jo/xgF9AsiwHQdUUviAM1rJWv/wgj98dtIxg91KP4ANaoS6p4WAOHBM+YJ8CRvrlyYfL61MTUbVmKweUzMxVIBHzXJj7XirALYNyB1SlcpnwuzdTuCuxRS6EdyeLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yCcwQNCOG4Hn4L9MzXZLhRLchB3QnBWv2Z2f7fyBDo=;
 b=kJxMpEWf+S9YlnydK/C1NAdQ6vKmDAySMXQwThiKbabUkTuqUjQJbO0+XMQfPDoxBVf5gYzN4rzkulWLT9+RM03TEfqKmbj4u3cNPTAcgiI0q0RwG4ZhkISe/IsxBqC8LgcQOtf06GjbBvtKPk+fx1qSLyIuRrqzLTvNx5Nv2fc=
Received: from MWHPR10CA0051.namprd10.prod.outlook.com (2603:10b6:300:2c::13)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 00:23:56 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::2c) by MWHPR10CA0051.outlook.office365.com
 (2603:10b6:300:2c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:56 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:53 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 08/11] drm/amdgpu: Move reset sem into reset_domain
Date: Tue, 8 Feb 2022 19:23:17 -0500
Message-ID: <20220209002320.6077-9-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99ede347-685f-4440-1af0-08d9eb6275e7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4333:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4333F2C234CC83FA4C66B63AEA2E9@MN2PR12MB4333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LyVfqGg0uPU802XIhOPC3WmuXR3KUZ/JLUQid9/uhVP5oWJseGS3W2Eo0FHKUIxz+xrzIuvCsw4J2g8HEeGvMgN5bCo5PhHX9RiP0/5hHt0HpN9Lgj4dkSnwzorSqve/2IMVxjsV7UyJr+ibtSUwtcsfymKiPedgrOZGnoyKgCyKsrGd0zBQhaqPJPWe0dp0Lf6FseftK7RxUgljFrMlPbO7e+63tSFVMZXhFlljxCqNeqwfVz2o/GQ+3wwHx2WiS4VWUZpiYu17oW732mhLfZ8Lj9bMeSvQpR//V7H1aMtapV9H8qWQEX9Tpe6lvL0dON2T9Rj5YSSR00T6lGbiEqqienkbfUO9Pk/DvBgkmcoP5LYOirGnTxPzYPxNO4KdGEuHHeO3CSTcvH80kji1h8LmTbzFGx+wPcZ38+qlLXv7ICEKDuJCsXoJT9xmXCcrVDNcVU8QVsjTdAfmajK1NqUUigUqwGK0RR8zcP97/uikexPkF5cXWWqa4pZVYBe4Pt94NMQ+eh/IsQ5n1OGFIVRW8zHE0qrB1Gy+fonB8uLetwD9hloDw6eVwOJnlAavHzB3CcBCGHKxRbr9hSFM3+T1uqI/NgAZCIfzE3zXC/3WFFd3EEo21MtV19wnA+S6pQNHVmsSx1ketcRaNB84I1Qmkp6HLyByJZaKmSvmdBpUeqOL+z9DjauaWiPPp09YRak0Ot8dbDP9UrD+DWUbw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(7696005)(16526019)(4326008)(83380400001)(6666004)(2906002)(5660300002)(2616005)(44832011)(70206006)(36756003)(336012)(70586007)(426003)(8936002)(54906003)(26005)(186003)(8676002)(30864003)(508600001)(1076003)(110136005)(81166007)(356005)(40460700003)(36860700001)(316002)(47076005)(82310400004)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:56.5163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ede347-685f-4440-1af0-08d9eb6275e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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
index cb9764513df8..ddfbcc8fd3d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1058,7 +1058,6 @@ struct amdgpu_device {
 
 	atomic_t 			in_gpu_reset;
 	enum pp_mp1_state               mp1_state;
-	struct rw_semaphore reset_sem;
 	struct amdgpu_doorbell_index doorbell_index;
 
 	struct mutex			notifier_lock;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 25e2e5bf90eb..c3728061d65a 100644
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
index d61bc0a0457c..dcbb175d336f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -424,10 +424,10 @@ bool amdgpu_device_skip_hw_access(struct amdgpu_device *adev)
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
@@ -453,9 +453,9 @@ uint32_t amdgpu_device_rreg(struct amdgpu_device *adev,
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
@@ -538,9 +538,9 @@ void amdgpu_device_wreg(struct amdgpu_device *adev,
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
@@ -3555,7 +3555,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->virt.vf_errors.lock);
 	hash_init(adev->mn_hash);
 	atomic_set(&adev->in_gpu_reset, 0);
-	init_rwsem(&adev->reset_sem);
 	mutex_init(&adev->psp.mutex);
 	mutex_init(&adev->notifier_lock);
 
@@ -4833,9 +4832,9 @@ static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
 	atomic_set(&adev->in_gpu_reset, 1);
 
 	if (hive) {
-		down_write_nest_lock(&adev->reset_sem, &hive->hive_lock);
+		down_write_nest_lock(&adev->reset_domain->sem, &hive->hive_lock);
 	} else {
-		down_write(&adev->reset_sem);
+		down_write(&adev->reset_domain->sem);
 	}
 
 	switch (amdgpu_asic_reset_method(adev)) {
@@ -4856,7 +4855,7 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
 	amdgpu_vf_error_trans_all(adev);
 	adev->mp1_state = PP_MP1_STATE_NONE;
 	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
+	up_write(&adev->reset_domain->sem);
 }
 
 static void amdgpu_device_resume_display_audio(struct amdgpu_device *adev)
@@ -5476,7 +5475,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
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
index 91864947063f..c0988c804459 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -131,6 +131,8 @@ struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum amdgpu_reset_d
 
 	}
 
+	init_rwsem(&reset_domain->sem);
+
 	return reset_domain;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index cc625e441fa0..80f918e87d4f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -80,6 +80,7 @@ struct amdgpu_reset_domain {
 	struct kref refcount;
 	struct workqueue_struct *wq;
 	enum amdgpu_reset_domain_type type;
+	struct rw_semaphore sem;
 };
 
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 38bb42727715..222b1da9d601 100644
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
index 88c1eb9ad068..3a5efe969735 100644
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
@@ -787,13 +789,13 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
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
 
@@ -900,7 +902,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 	if (amdgpu_in_reset(adev))
 		return -EIO;
 
-	if (ring->sched.ready && down_read_trylock(&adev->reset_sem)) {
+	if (ring->sched.ready && down_read_trylock(&adev->reset_domain->sem)) {
 		/* Vega20+XGMI caches PTEs in TC and TLB. Add a
 		 * heavy-weight TLB flush (type 2), which flushes
 		 * both. Due to a race condition with concurrent
@@ -927,7 +929,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 		if (r) {
 			amdgpu_ring_undo(ring);
 			spin_unlock(&adev->gfx.kiq.ring_lock);
-			up_read(&adev->reset_sem);
+			up_read(&adev->reset_domain->sem);
 			return -ETIME;
 		}
 
@@ -936,10 +938,10 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
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
index 6740eef84ee1..4e23c29e665c 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -262,7 +262,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
 		return;
 
-	down_write(&adev->reset_sem);
+	down_write(&adev->reset_domain->sem);
 
 	amdgpu_virt_fini_data_exchange(adev);
 
@@ -278,7 +278,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 
 flr_done:
 	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
+	up_write(&adev->reset_domain->sem);
 
 	/* Trigger recovery for world switch failure if no TDR */
 	if (amdgpu_device_should_recover_gpu(adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index e967d61c7134..f715780f7d20 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -286,7 +286,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
 		return;
 
-	down_write(&adev->reset_sem);
+	down_write(&adev->reset_domain->sem);
 
 	amdgpu_virt_fini_data_exchange(adev);
 
@@ -302,7 +302,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 
 flr_done:
 	atomic_set(&adev->in_gpu_reset, 0);
-	up_write(&adev->reset_sem);
+	up_write(&adev->reset_domain->sem);
 
 	/* Trigger recovery for world switch failure if no TDR */
 	if (amdgpu_device_should_recover_gpu(adev)
-- 
2.25.1

