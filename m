Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F947D93C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0975F10E381;
	Wed, 22 Dec 2021 22:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FBC10E3BC;
 Wed, 22 Dec 2021 22:14:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgtDs10QlNkxw+uYsYIXCnB/bXUxO9htg1siijnvFlUvcSdjH4HyLwBrDhPPo2iRW2G8Cp3OJpAmckSSiZFUFrbxDzlfo0Tly1XwuRa/aboBaHpHIrHticE8opZMwNKjWInbhAD2tN5gCOGiSLLc7w0xpEOYY9PZOsk0faY5Yf21bye6sTjfmzchg0NE4joUTJabxDIa0nrm25D77DtZZZmyBMd5i771XT2vr4mNKtX/TuS+bXGry0QRrmuu7NT3wjtyYz/+lYUjM4+Nle3dRj7Cj2d4E+IWqJA/HcX84jnsIa1k+3egKihE1uwUdOq4ZT6RS+CeITiOf84oGQPtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrOtf4AlwuVvJ7fN764PzPVSU91mOZX6pPUozlHxkB4=;
 b=QJ4atWPi+VFj4IpA4YC7uFh0tyZ5aKASyJWAoePry3uHUCQcaryzPznbYtD8TDl8PJ6QGCN6m+oaS54lkWXp+5N+4pcq2LuP4H/a3TCWo7OMfkeC0/FQhPW3qde1one/mHnDPc4OvsOgQG/DsQkBBZc4m+2m3vYDV66UqEj/Zpq/eKvTUEOeovnYtmHAoD+jtcMkcXbh38qe/WeHl8BzSEwPF/1Vv7hUhFUiATmD/ey0I8wQ16a+uOGPSCeZ+1vC1qcakLOPoQ2bJMk55XfKV4WTfVGn4SB80hlc0YaDOI+7p407KcPwJSCWLdnyvOOL7qgnjokfQixkUNTAvhd+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrOtf4AlwuVvJ7fN764PzPVSU91mOZX6pPUozlHxkB4=;
 b=RASdFNvN7pBUPsDW3tVt577hbQl4Hse3lvx1FmcyoasCGv79y8pe6dBNcgAH/Jbwzi1zSbfET6TskjO8qVOFxLM5u0qhZGJ1/ZaTEjZOOJaZzj9oXEXJ5V3USrnR3kagD+tPVNZn8TjtdXbdktih4K5PtjaNS+2fyjq3KGifLdg=
Received: from MW2PR16CA0068.namprd16.prod.outlook.com (2603:10b6:907:1::45)
 by BN6PR12MB1940.namprd12.prod.outlook.com (2603:10b6:404:fd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 22:14:21 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::ee) by MW2PR16CA0068.outlook.office365.com
 (2603:10b6:907:1::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20 via Frontend
 Transport; Wed, 22 Dec 2021 22:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 22:14:20 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 16:14:19 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v2 7/8] drm/amdgpu: Drop concurrent GPU reset protection for
 device
Date: Wed, 22 Dec 2021 17:13:59 -0500
Message-ID: <20211222221400.790842-3-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222221400.790842-1-andrey.grodzovsky@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 865aa01c-4653-40d0-326f-08d9c5986741
X-MS-TrafficTypeDiagnostic: BN6PR12MB1940:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB194085D84D17D83B31D6245EEA7D9@BN6PR12MB1940.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDG4CW37qWZ6PvzH+VYPOnAz0HFkvjvE3gXl/8kGO8O+wdPxI3UeIkjrH2aALrw7RpjlNETLWNJvqKOAeQMt9T5ud0LBiip2y3QxlBvmIBMsB0AZ0G/v0VPc2YE4v23IugZ+f+qq1P8YkkVvh782JwmfzOOKnHokBSkWfj5ppwIC4CanQy1JoDey+mDPZF0DhedLrOsfqZSjYvmqkawd0lZYQBWuLqOGr5sJSa9Y72u/VNpEYGaWHFdPLhaeKrZ6CU9x6LVCvnopbTBzxa0fdRXXPaRfhPc7B8xs95blxkfKI1GR/L0SseOdqH9exXgf6Jgxt0gKn6ZsroIyg02OSRDUutiRjWp4w3SxaopLfUxqdDezMEfXpIF39T1q1kJ+2KRAx7sBPka5GYFH7l+y7nwpP37LXvabtgWaZolLibhPIw+iDSrM701CQGHYE0lzMT1z+IwrE4Lo1v1ejVaRsfc2YAug8VOSiRFsQvbNaJbE9HHx9XrXmBOTe5ZLJR0zIzM4q4MSDwNR/6/Z7NCCdgEI620KBV4shlNrA1t4YxW6YaFg2zH9C4tjSEs8TDpRwFIef+mS4y+qDnXW/YraaBbKqdCN0Hq0X9Uf2/LABd1iM4XoQYfY4w5S9CvgjoY9D/uXdNQWL14NcaNv1r6wffhwCqj2zedyw39p46Q8K5ECtf8S8+6HRyQLi0eNj/+HHOLlcvGJj84J4kiRKUxoYaD9S24/CKUP0BPuvMum/6Fv1vf/h8bxhEwy/DUTsNwzqh1pWLbKUX0KmTVQTbAreq0Zsv5Xkqh0zsjaErAiuZ0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(508600001)(7696005)(2906002)(16526019)(356005)(83380400001)(81166007)(36860700001)(186003)(86362001)(40460700001)(26005)(8936002)(44832011)(66574015)(8676002)(54906003)(316002)(336012)(2616005)(426003)(82310400004)(110136005)(6666004)(36756003)(1076003)(70586007)(5660300002)(70206006)(4326008)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 22:14:20.6100 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 865aa01c-4653-40d0-326f-08d9c5986741
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1940
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
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 89 ++--------------------
 1 file changed, 7 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 107a393ebbfd..fef952ca8db5 100644
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
@@ -5209,13 +5153,12 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
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
@@ -5438,20 +5381,6 @@ int amdgpu_device_baco_exit(struct drm_device *dev)
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
@@ -5482,14 +5411,10 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
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

