Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F049BEB0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7EA10E5DA;
	Tue, 25 Jan 2022 22:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D89C910E5CA;
 Tue, 25 Jan 2022 22:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6QWvHZNHtXKrPQsYxd+fRiSEKRjXaXn+a9dkAfAZMUKEC0N8juB16HHakduPk5oEo8ib5Jzlce5fq/gI4cgCTF03O+GoQC9NC1Cc+K9SDLOt0plZThg9tiLDH8kGsSB1nmPBPLjP11W1hcodZzoKR/AbANCglaA/KQy+aKRN01Xp+yDhi5h3YOx6JOQCWPu6hBlSgM739RydeHE6MF3ua8qxpOGGj98o+yxIllLlZOOQ4J4AbJHmvmseW2FlGesXa8JKzqZ0OWlFKANzMJVDOm6mdlQCJCy5qWbTLMMWrX0dUN4v9MqLGYwtG5g1iS6gmvqKshnF44fQQCRr1tJpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZ2E8Ay0UNE69ydF/yYCWKT8PZWVh0dc91EBkG/i2p0=;
 b=jn753go67kvebR8bh0NOB1Vrk4mfiCF+4JeUhteOtOTAiKsXGMdE5ty+jrlu2gCE9nSVmaZ5rj+2iwksdc1z7ASAYI7sk56n2GBu+kSvMS8Dq8tr3PiRsDwaSejOCdryjdkXcdgcdasAoc2d3fHXSXNnOW6qXJJCfT2jUxSSJgd/qb5kn9yk1e9UnP5xt7WkmLti8VnYBNLPz3TuD28dtgOTIbxynnYMA6HtppSo+vFXteZ3WdgEmno7t/8+u1dtdCf0URbrzEEVtVr99fN3VlMWe9yUXa2Zyf5xRZo/ew5hYAvf8SP3GqsWJywpd74+dEycXFZgXM790RIGp+Ma9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZ2E8Ay0UNE69ydF/yYCWKT8PZWVh0dc91EBkG/i2p0=;
 b=FcevbAt4eXlnIAHPnmQKp9TYnvr1mMo+JOoRZWfEP0tkyXO12AdsBJfW2fFVm+6qrs3J7UR7EbojsNOpQ20mCvNrwxya5iBFQD0Qskz0/+gKMhUbLbyNk/vwsCGnQ1uUcrl10UGrhh8cmSYuPdlZqanpesE1ON/P1RQZTN+8bxc=
Received: from DS7P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::33) by
 CY4PR12MB1127.namprd12.prod.outlook.com (2603:10b6:903:44::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Tue, 25 Jan 2022 22:38:34 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::a2) by DS7P222CA0018.outlook.office365.com
 (2603:10b6:8:2e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 25 Jan 2022 22:38:33 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:32 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 11/12] drm/amdgpu: Rework amdgpu_device_lock_adev
Date: Tue, 25 Jan 2022 17:37:51 -0500
Message-ID: <20220125223752.200211-12-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ba1378b0-1dee-4706-88c3-08d9e0536b68
X-MS-TrafficTypeDiagnostic: CY4PR12MB1127:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1127EE3B11299D6AC7E9B06AEA5F9@CY4PR12MB1127.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IrOtfvpO555IuNIPg/ySgLOZNTHtJDYwp24q9k2G2blAXpkZ6RR9Ls2JthFZ1WS73uP7jddk0GA/W+4KDphI66+f4nhtW4ISjMnwgdFhGbvngw+YD9EVTimfnPgxajYuTyXFK6ztMDtMPz0/U3LeXcvK5P/9MPcwuEl4WWPdAf0uqyKCY9dRnxA8uGPAD9n+OoJlr+a8X68Vje9IV6YKVTBuUADlfQN736D5pTLOSZBY0ejp7aeiflCr5mul50d8o99stIp5qyAWQlyxjBrJMzPuWyFUAQsPm8d6MV5m1eb5x6o9qOSFo+Dqmmn96F9Hdn30eEqCiOSJvPmLYBEgBvx6530ggR1gt4bdMHLBIWUz+kRMRXGhHAZGVk8QBGUKXxmcL5mB7DXsMQhjtyMZbzujle/V4FKe8U9Lj2HnMRJzhw+p2ATLjlYGlq4qOgy+qD8yVD8IsWU+++yd3+uXImQQkwcxzhjVPV1bOcViJuuRAFVH/orgXFV0rdSngqQTe8JkDxjkBqCQHHB9JN86hmq4cRPsDbGj0kgAnRIYs2azMQ3YtDaWVt6dLzXy7/5cmnEORJGwhTbD7sHnDfk2aFat8oNWp4QmuEdZD4M4kWZHRNzqfIs4Fi3tp0juRsXFZPbRfz15pEyOdYD92/DxoRMte1Ket+sgILh5V8fEogTC27x/QLrFvPwg2BtMRfHV4U2uWESkWJJiyjoJ9J0aI5Udbn0PIyV1evOavOUXxH0s2rtyKykjXstCo6R6k9bU0NzKGL1cX0iy8hqRXKdmKUNYfFTRxF9MdT88Raq4BaQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700004)(7696005)(186003)(16526019)(2906002)(8936002)(83380400001)(44832011)(86362001)(426003)(8676002)(6666004)(508600001)(4326008)(70586007)(47076005)(82310400004)(26005)(36756003)(54906003)(2616005)(110136005)(36860700001)(336012)(70206006)(5660300002)(356005)(81166007)(40460700003)(1076003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:33.7774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1378b0-1dee-4706-88c3-08d9e0536b68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1127
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

This functions needs to be split into 2 parts where
one is called only once for locking single instance of
reset_domain's sem and reset flag and the other part
which handles MP1 states should still be called for
each device in XGMI hive.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 48 ++++++++++++++++------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index aa43af443ebe..31310922b6bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4771,16 +4771,20 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 	return r;
 }
 
-static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
-				struct amdgpu_hive_info *hive)
+static void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain,
+					    struct amdgpu_hive_info *hive)
 {
-	atomic_set(&adev->reset_domain->in_gpu_reset, 1);
+	atomic_set(&reset_domain->in_gpu_reset, 1);
 
 	if (hive) {
-		down_write_nest_lock(&adev->reset_domain->sem, &hive->hive_lock);
+		down_write_nest_lock(&reset_domain->sem, &hive->hive_lock);
 	} else {
-		down_write(&adev->reset_domain->sem);
+		down_write(&reset_domain->sem);
 	}
+}
+
+static void amdgpu_device_set_mp1_state(struct amdgpu_device *adev)
+{
 
 	switch (amdgpu_asic_reset_method(adev)) {
 	case AMD_RESET_METHOD_MODE1:
@@ -4795,14 +4799,19 @@ static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
 	}
 }
 
-static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
+static void amdgpu_device_unset_mp1_state(struct amdgpu_device *adev)
 {
 	amdgpu_vf_error_trans_all(adev);
 	adev->mp1_state = PP_MP1_STATE_NONE;
-	atomic_set(&adev->reset_domain->in_gpu_reset, 0);
-	up_write(&adev->reset_domain->sem);
 }
 
+static void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain)
+{
+	atomic_set(&reset_domain->in_gpu_reset, 0);
+	up_write(&reset_domain->sem);
+}
+
+
 static void amdgpu_device_resume_display_audio(struct amdgpu_device *adev)
 {
 	struct pci_dev *p = NULL;
@@ -5005,10 +5014,15 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 		device_list_handle = &device_list;
 	}
 
+	/* We need to lock reset domain only once both for XGMI and single device */
+	tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
+				    reset_list);
+	amdgpu_device_lock_reset_domain(tmp_adev->reset_domain, hive);
+
 	/* block all schedulers and reset given job's ring */
 	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
 
-		amdgpu_device_lock_adev(tmp_adev, hive);
+		amdgpu_device_set_mp1_state(tmp_adev);
 
 		/*
 		 * Try to put the audio codec into suspend state
@@ -5158,9 +5172,14 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 
 		if (audio_suspended)
 			amdgpu_device_resume_display_audio(tmp_adev);
-		amdgpu_device_unlock_adev(tmp_adev);
+
+		amdgpu_device_unset_mp1_state(tmp_adev);
 	}
 
+	tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
+					    reset_list);
+	amdgpu_device_unlock_reset_domain(tmp_adev->reset_domain);
+
 	if (hive) {
 		mutex_unlock(&hive->hive_lock);
 		amdgpu_put_xgmi_hive(hive);
@@ -5422,7 +5441,8 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		 * Locking adev->reset_domain->sem will prevent any external access
 		 * to GPU during PCI error recovery
 		 */
-		amdgpu_device_lock_adev(adev, NULL);
+		amdgpu_device_lock_reset_domain(adev->reset_domain, NULL);
+		amdgpu_device_set_mp1_state(adev);
 
 		/*
 		 * Block any work scheduling as we do for regular GPU reset
@@ -5529,7 +5549,8 @@ pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev)
 		DRM_INFO("PCIe error recovery succeeded\n");
 	} else {
 		DRM_ERROR("PCIe error recovery failed, err:%d", r);
-		amdgpu_device_unlock_adev(adev);
+		amdgpu_device_unset_mp1_state(adev);
+		amdgpu_device_unlock_reset_domain(adev->reset_domain);
 	}
 
 	return r ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
@@ -5566,7 +5587,8 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 		drm_sched_start(&ring->sched, true);
 	}
 
-	amdgpu_device_unlock_adev(adev);
+	amdgpu_device_unset_mp1_state(adev);
+	amdgpu_device_unlock_reset_domain(adev->reset_domain);
 }
 
 bool amdgpu_device_cache_pci_state(struct pci_dev *pdev)
-- 
2.25.1

