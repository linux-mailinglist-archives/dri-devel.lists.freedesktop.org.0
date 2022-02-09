Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8D4AE5F3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3503310E5D7;
	Wed,  9 Feb 2022 00:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE4689058;
 Wed,  9 Feb 2022 00:24:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMpB2j+YaJvdI2Jp1+3Zm5xQmYSF8pQ1oTf9olj2kEEZUp3H8UsFUdOc7PA19EGmauBNKrGZTQ4hoZytDaB9v+LDUS7SOBeeY610bWA4zs+5DQfaZ46h1BBC1Vbnub/hdp5qjS+LCBfLOIaYzGD03L3ndZ903tpHVUle02TylEUSMUMCZtoIE4bgyfGnYMVI1UC7NBL30Dn4Bfe6ALdd4UOhQ0N4PYcq0YefbwVzxSZR0EgyLfUdDn6PJGreLPYtP1QS+Q7jM2mllkgz2FAqp0L2/BLfkI2qUwcZdtfJre4g6qzo+1acHLm+Duq0IQIyPaQW5JCcS+mZrOvOcyFCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppnZ1dEXV70pxc5XgwiINThIC7CBTPxwpLr+cGIL+0g=;
 b=DxZ/uWQD28ZbqQ9LzxUo5fu0cOm4UDQS6Pvtws4buhhkACJMAMaOalwu/PB52+8m09SBtIU/Tb1GznHg61/2WINJxja6/fVV3iqbu1jS3hFTS1bTU4o6WZKGdrRy6CMxpPGDKr5KlMnYdqQKG0pKZr+EdhcrOn3Td7gv+uoySkc4u0ppCF2MA9h9Y6n8XOYqCNkpIzeQK1Dus89h7RmSpOtlrptuDLuc3Oxgi4lfAT5pj4HuxGqYmijUdSDF1ZdU+EVpEoBTJPDRAkQBq6keoypQv7wWo9wcZ/0zS9synW2tgLuBqZOXqxH7WPRj+J1Uy+0lLiW8FiV17sEcOyn4wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppnZ1dEXV70pxc5XgwiINThIC7CBTPxwpLr+cGIL+0g=;
 b=lYXIJzW66AnC74hTLf0qUaxkCY+czExhmXlgClqYdzDkmqep7cItz2ySobi1448ZoUsrtIQSOVNiBKH59pBwwsxFRMUEY6g79IjbVtGprax3//zszMSqHbpnYY1CGvQW+qCYHJkIAQiNEu5LI4sBD1biAXRnbvRAg5JydU8V7fk=
Received: from MWHPR10CA0064.namprd10.prod.outlook.com (2603:10b6:300:2c::26)
 by MN2PR12MB3888.namprd12.prod.outlook.com (2603:10b6:208:162::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Wed, 9 Feb
 2022 00:24:00 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::22) by MWHPR10CA0064.outlook.office365.com
 (2603:10b6:300:2c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:59 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:56 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 10/11] drm/amdgpu: Rework amdgpu_device_lock_adev
Date: Tue, 8 Feb 2022 19:23:19 -0500
Message-ID: <20220209002320.6077-11-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3658cbb8-fb87-41cf-af47-08d9eb6277a9
X-MS-TrafficTypeDiagnostic: MN2PR12MB3888:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB388837A84A6D7441CEA555AAEA2E9@MN2PR12MB3888.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YoW/s6JS+g2OHcY2sqIkzUaUro/66wvHzQEqPXbIwDQNYCGQM14SCMpRhn0HdUfhBVrWvs6P8Uh/5/WQXoQcgO1z9Hrz3Tl+kp4MgOtr4/WIihuYr2b5AtGLA61xpYDXaDudTSWxKQB8xSRtUjpDmDliwzZU+Mw6Z9n4v+F5EEyz8Cuzdt4P7Q5yMp6sIF2z+rJVPTbX63JIw3R2QDuYoaWrN+CUEvWM1HzeSFLeamcnOLd6oWAIu+1Sc9FKW+wIsSTF950VKcn8LzocdD6ZIUUg3hlFfhyGtz1ao50Yd1VOgS7NM9fhodRze3Vux4p9c5ryN5NuhcAIi2PSddo6Zi7OkB9etPkomdf9gxJFAZWnWOtthrsYHBPbTE/s5DRgQTnSkOPDgurz2k9Qi4BoxMbaYyC9+lRU+4Gwdpb/inlcqEIXrT2MdoO+hc5qesAgVsiyDGDf31sHq5geioWaWsHsD1IZq/ARR1R3sx1GxTvcGqaH2cWxbBHhR4khRLzf0uzRpAkJtSc8upDt/O6KIYYrJstnvrtgcaUOXtsyetV7ShJJJ/AUdiMuGwdXvfCcDi/wrJ+DD3SyptP3aBP0Gne9orMXMa/TPVBYwg0f9R94HOtFqDZ0pWaX3EAXK3eaYr4+4heCOGx+g+P16vFmneV8NEyHVqhnMvFsX34w3NfGkRSGwRuHSqdQWYUkZXSTIbFSDCgZk171MUMLFFUVvg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(316002)(426003)(356005)(81166007)(6666004)(44832011)(110136005)(82310400004)(86362001)(336012)(40460700003)(2616005)(36860700001)(47076005)(508600001)(5660300002)(8676002)(2906002)(26005)(4326008)(186003)(1076003)(8936002)(83380400001)(70586007)(54906003)(70206006)(7696005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:59.4692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3658cbb8-fb87-41cf-af47-08d9eb6277a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3888
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
index e05d7cbefd2c..aaecf0797484 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4825,16 +4825,20 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
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
@@ -4849,14 +4853,19 @@ static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
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
@@ -5060,10 +5069,15 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
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
@@ -5213,9 +5227,14 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 
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
@@ -5477,7 +5496,8 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		 * Locking adev->reset_domain->sem will prevent any external access
 		 * to GPU during PCI error recovery
 		 */
-		amdgpu_device_lock_adev(adev, NULL);
+		amdgpu_device_lock_reset_domain(adev->reset_domain, NULL);
+		amdgpu_device_set_mp1_state(adev);
 
 		/*
 		 * Block any work scheduling as we do for regular GPU reset
@@ -5584,7 +5604,8 @@ pci_ers_result_t amdgpu_pci_slot_reset(struct pci_dev *pdev)
 		DRM_INFO("PCIe error recovery succeeded\n");
 	} else {
 		DRM_ERROR("PCIe error recovery failed, err:%d", r);
-		amdgpu_device_unlock_adev(adev);
+		amdgpu_device_unset_mp1_state(adev);
+		amdgpu_device_unlock_reset_domain(adev->reset_domain);
 	}
 
 	return r ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
@@ -5621,7 +5642,8 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 		drm_sched_start(&ring->sched, true);
 	}
 
-	amdgpu_device_unlock_adev(adev);
+	amdgpu_device_unset_mp1_state(adev);
+	amdgpu_device_unlock_reset_domain(adev->reset_domain);
 }
 
 bool amdgpu_device_cache_pci_state(struct pci_dev *pdev)
-- 
2.25.1

