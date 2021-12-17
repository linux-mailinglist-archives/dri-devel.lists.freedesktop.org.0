Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF7E47971F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 23:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8A810E780;
	Fri, 17 Dec 2021 22:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3195D10E5EE;
 Fri, 17 Dec 2021 22:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Whd+wUyAmFZCW+GBZg4p5NRePIbUeJ0PukM9BpoQ7Sv9U4w8J/6riomqQmhK3W0M0RaQApRAZT8+PfwUgPEsT6F5JJEGdTA6wGIbxUkID5xXw/F6aBP/dGKevMUdf/dZqrSDFbbllmTvK6YOE24wc3HZqcXPulpz/MIr1oyUfhGddhfWcmuZtmLyNs6B1O+wVHNtDNwhZmlpq7Gf84Z++kSsUTNQy3SEouk5xMCZeyEJ4qsagX57NSRDNN6XAXsU7SFuAvrWYhRVxGmnNMb1ssEpvJkAwqC1MYPwKNnf/ZKNNnMzHqqE+AuXaBf5VhECOyVJtr5M9InDoYm9t+9oKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXpYa3Qsx0FBgMqDi0pVO5hbwnlso8LCeZKlHmlIl+Q=;
 b=kfRqupIK6w20Wx4nkqPiPWJ5hNiKPLdsKf7eIFUpsUQv97UCzxvt39Sz/GN5b9dMUqiTgjh9Am3M5aRKmPFW7v+cZgxGh56jGJ8ICKzBceNxvWMz8Zo2xrmBNRi2+Z+WC5FalyclZLRZjthUKEcNucccbaXC31HuhOvk1FPE7EA4O3dqj3nkxR9CGINEBrK3b7iAXk1/ZSmljWO4xdys+0rSFeL3VL3zV9O5JguPFb8CvWXms4pOWyYgJKaOcpqfnyucg4SH6dNyy4jaIgedJWUnpOb/tR55OnKD9xMVBTjfL0pzMcet9JKu9XcCZx5wyJxFzzsdmk+M3b5rsUAfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXpYa3Qsx0FBgMqDi0pVO5hbwnlso8LCeZKlHmlIl+Q=;
 b=Q/f7Xorc3hHHJcbDmxSFkVrepb94y/7/w4ESKlotCT/rvUNzu45otPau359Eavjft2hjQpLlprduz1ft1XtxyfSBWgvBiRc/kIIVgpd7DxEQRF5+3RIB05z5MiWd9MLI4pvhFxYXFdlKTye752+OhuG9o3i5agz/Eh8r8eRRUkI=
Received: from BN9PR03CA0951.namprd03.prod.outlook.com (2603:10b6:408:108::26)
 by DM4PR12MB5310.namprd12.prod.outlook.com (2603:10b6:5:39e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 22:28:16 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::e0) by BN9PR03CA0951.outlook.office365.com
 (2603:10b6:408:108::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Fri, 17 Dec 2021 22:28:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 22:28:16 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 16:28:15 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC 6/6] drm/amdgpu: Drop concurrent GPU reset protection for device
Date: Fri, 17 Dec 2021 17:27:45 -0500
Message-ID: <20211217222745.881637-7-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfd1b459-83e0-470a-8966-08d9c1ac850f
X-MS-TrafficTypeDiagnostic: DM4PR12MB5310:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB531012B0950F014EFD7DF00BEA789@DM4PR12MB5310.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZRnGe4LK0bAnZOM0AVK4oUM4+EUG/lopp3tr4Rpdu3xREb6tQdHloEPR39LYdT5BCBnoKml1pR8U0Hx/LXNZD/QcfRwGZVF7eUjfs1sGBXp2Qxo+jz1mQNTOLJGjCA39/JmYpVeyRZV/YVf3nHQ7rD+YbOP3QA3A7VBA9ZFDnT8qNyhizVgql1xNQRwSHm/fwIL+R6FPUmk1N9hb2+KYkN4wpF1/qyehXRIeB65TsoaWBm4fFD9Gc8t9RbML/MKUKIeneIujvMXV6nfhAYeTcvc6HHstFROYQh7yf9YB1OBQPcKgs4g2p51XJfXMISyItLDRsNzmYHjGvCLxdsYhxPPBCavActAe2e1se1qLRg035GgoqBoaD6KosGE8srE+jpKGEGHHEnX7R6ob6WOK7WSF/bGJjYxkZzpdadUCtjUczS13O3qhgujvJQsbKKkSsmRggSG6cYGLNck+rK4vHYA7/7i6HmXY7WogHyWaQNJaO2k4uk/5n3Wt9Tq7kebS50yHBAoutEJnwMzgZmnqyUM8EM7rFqu1C1b16Iev4YmnY5kPtbFkGVLPouxnTi5HOl8n05zX1bCA0nv2Y1cLLdswTEzTVnB0BnS/Ix18QZINIVbbhSeeU8WArdjogDfdAjMdBt1oSv2LEjXHgu3+uv8m3n6RfFV2MCcevVHHcNv4mLlNoMpCY1L4z5tFRio8+UCAs55Ct+COxFBf55ud2fWWX1hCErQ54Y9GeFiQgKvaWwtgIq7iE2FpPUJjFRudBnMDxO8s9KT96X2lA8YlX7Td4LENxdL4TfvIRUkVOQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(40460700001)(5660300002)(1076003)(44832011)(186003)(36860700001)(86362001)(336012)(16526019)(82310400004)(81166007)(47076005)(4326008)(6666004)(36756003)(316002)(356005)(110136005)(8936002)(7696005)(70586007)(83380400001)(2616005)(426003)(8676002)(508600001)(2906002)(70206006)(26005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 22:28:16.0090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd1b459-83e0-470a-8966-08d9c1ac850f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5310
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since now all GPU resets are serialzied there is no need for this.

This patch also reverts 'drm/amdgpu: race issue when jobs on 2 ring timeout'

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 89 ++--------------------
 1 file changed, 7 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index d2701e4d0622..311e0b9e1e4f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4763,11 +4763,10 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 	return r;
 }
 
-static bool amdgpu_device_lock_adev(struct amdgpu_device *adev,
+static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
 				struct amdgpu_hive_info *hive)
 {
-	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
-		return false;
+	atomic_set(&adev->in_gpu_reset, 1);
 
 	if (hive) {
 		down_write_nest_lock(&adev->reset_sem, &hive->hive_lock);
@@ -4786,8 +4785,6 @@ static bool amdgpu_device_lock_adev(struct amdgpu_device *adev,
 		adev->mp1_state = PP_MP1_STATE_NONE;
 		break;
 	}
-
-	return true;
 }
 
 static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
@@ -4798,46 +4795,6 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
 	up_write(&adev->reset_sem);
 }
 
-/*
- * to lockup a list of amdgpu devices in a hive safely, if not a hive
- * with multiple nodes, it will be similar as amdgpu_device_lock_adev.
- *
- * unlock won't require roll back.
- */
-static int amdgpu_device_lock_hive_adev(struct amdgpu_device *adev, struct amdgpu_hive_info *hive)
-{
-	struct amdgpu_device *tmp_adev = NULL;
-
-	if (adev->gmc.xgmi.num_physical_nodes > 1) {
-		if (!hive) {
-			dev_err(adev->dev, "Hive is NULL while device has multiple xgmi nodes");
-			return -ENODEV;
-		}
-		list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head) {
-			if (!amdgpu_device_lock_adev(tmp_adev, hive))
-				goto roll_back;
-		}
-	} else if (!amdgpu_device_lock_adev(adev, hive))
-		return -EAGAIN;
-
-	return 0;
-roll_back:
-	if (!list_is_first(&tmp_adev->gmc.xgmi.head, &hive->device_list)) {
-		/*
-		 * if the lockup iteration break in the middle of a hive,
-		 * it may means there may has a race issue,
-		 * or a hive device locked up independently.
-		 * we may be in trouble and may not, so will try to roll back
-		 * the lock and give out a warnning.
-		 */
-		dev_warn(tmp_adev->dev, "Hive lock iteration broke in the middle. Rolling back to unlock");
-		list_for_each_entry_continue_reverse(tmp_adev, &hive->device_list, gmc.xgmi.head) {
-			amdgpu_device_unlock_adev(tmp_adev);
-		}
-	}
-	return -EAGAIN;
-}
-
 static void amdgpu_device_resume_display_audio(struct amdgpu_device *adev)
 {
 	struct pci_dev *p = NULL;
@@ -5023,22 +4980,6 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 	reset_context.hive = hive;
 	clear_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
 
-	/*
-	 * lock the device before we try to operate the linked list
-	 * if didn't get the device lock, don't touch the linked list since
-	 * others may iterating it.
-	 */
-	r = amdgpu_device_lock_hive_adev(adev, hive);
-	if (r) {
-		dev_info(adev->dev, "Bailing on TDR for s_job:%llx, as another already in progress",
-					job ? job->base.id : -1);
-
-		/* even we skipped this reset, still need to set the job to guilty */
-		if (job && job->vm)
-			drm_sched_increase_karma(&job->base);
-		goto skip_recovery;
-	}
-
 	/*
 	 * Build list of devices to reset.
 	 * In case we are in XGMI hive mode, resort the device list
@@ -5058,6 +4999,9 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 
 	/* block all schedulers and reset given job's ring */
 	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
+
+		amdgpu_device_lock_adev(tmp_adev, hive);
+
 		/*
 		 * Try to put the audio codec into suspend state
 		 * before gpu reset started.
@@ -5208,13 +5152,12 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 		amdgpu_device_unlock_adev(tmp_adev);
 	}
 
-skip_recovery:
 	if (hive) {
 		mutex_unlock(&hive->hive_lock);
 		amdgpu_put_xgmi_hive(hive);
 	}
 
-	if (r && r != -EAGAIN)
+	if (r)
 		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
 	return r;
 }
@@ -5437,20 +5380,6 @@ int amdgpu_device_baco_exit(struct drm_device *dev)
 	return 0;
 }
 
-static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
-{
-	int i;
-
-	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
-		struct amdgpu_ring *ring = adev->rings[i];
-
-		if (!ring || !ring->sched.thread)
-			continue;
-
-		cancel_delayed_work_sync(&ring->sched.work_tdr);
-	}
-}
-
 /**
  * amdgpu_pci_error_detected - Called when a PCI error is detected.
  * @pdev: PCI device struct
@@ -5481,14 +5410,10 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 	/* Fatal error, prepare for slot reset */
 	case pci_channel_io_frozen:
 		/*
-		 * Cancel and wait for all TDRs in progress if failing to
-		 * set  adev->in_gpu_reset in amdgpu_device_lock_adev
-		 *
 		 * Locking adev->reset_sem will prevent any external access
 		 * to GPU during PCI error recovery
 		 */
-		while (!amdgpu_device_lock_adev(adev, NULL))
-			amdgpu_cancel_all_tdr(adev);
+		amdgpu_device_lock_adev(adev, NULL);
 
 		/*
 		 * Block any work scheduling as we do for regular GPU reset
-- 
2.25.1

