Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8445F7BA7CF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE2210E478;
	Thu,  5 Oct 2023 17:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26CB10E478;
 Thu,  5 Oct 2023 17:21:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hq8R6Jvw60mxBVMTqoDGN6tn6wBe8JDD0lePzbtK7LBWlHScN96g6CIbpPHpXwzzNAOvb6CksrPQjJDpmLTcVqo8c3jGXu8gZFcMszO7bIgAdaWXhgKeGXKyuA3tXSxz6zvEQqpjh70/W5V/CoQA7GTTQp83sqDUU2IMYvASE7g4GOPQUuF0tETCLzGQWOu3dr//m0+zj55FQm8R97QlobGovamgLKhpQLXqIyyhw6t38UaMWKIQuTTZmtquyrf4cvPfjxGjqJZ5tzS80CarzQUfl6nDi3wm2s2QEusxxBPcGysCVAa6QCIfRzKXUVVtbP+f7j+AsVTCcZ+KsvOEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WztqDgo7TjJyCM3T7lwugZwY+t5sFQZRgrk1r0fcRzk=;
 b=SyBPfBsSUdt0kNPQA5fECFbLLCWrQ+gEaPMtxCVSKc2MPws+euhXRHKFTBtKwQiE2zKY1PPOzPM3LCSxsLMfgPykjABlVnzfQiCo1haN5UwMHAB1kRUk9dGDMoUKG/cbucpo81qjqSV09H0Wi/BLgmnCTJvtrbifEXRWWPIYnrBqFcFoiP44A/3S1Qq6M1SFLERiO8x6GevSYXtaIxEbeYuq91xk3yg3Lgcu0uNtkE0nkcEtqsuSGIRlA6CWapWQ1FWgM1sTDWLQa/SMtxw+JQVrOK6JN5jBwUyQqH6T8yDjgl+K6vwXvKmu1jTthgkh3Ihb5p8S2hxQk0GEl7jjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WztqDgo7TjJyCM3T7lwugZwY+t5sFQZRgrk1r0fcRzk=;
 b=JU6UP30WdvvFYQfcj/3okYmD1/i3vPR1h/Uw8tADioj/EDLN8fM9WVwZN9FmYdcoWenteuGfPFL7LAOWYNAQEQv6L44PP6C6LBXRREsfvgNbST1jDL0FM7yhnU8mAdPzC7ZTGt2OQghw4/RSWsPmhLkfjJsdDRIKWF2yPIbte54=
Received: from CH2PR04CA0018.namprd04.prod.outlook.com (2603:10b6:610:52::28)
 by IA0PR12MB8646.namprd12.prod.outlook.com (2603:10b6:208:489::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.28; Thu, 5 Oct
 2023 17:20:57 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:610:52:cafe::3e) by CH2PR04CA0018.outlook.office365.com
 (2603:10b6:610:52::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37 via Frontend
 Transport; Thu, 5 Oct 2023 17:20:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Thu, 5 Oct 2023 17:20:57 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 12:20:53 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Felix.Kuehling@amd.com>, <Mukul.Joshi@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 1/1] drm/amdkfd: get doorbell's absolute offset based on
 the db_size
Date: Thu, 5 Oct 2023 22:50:11 +0530
Message-ID: <20231005172011.9271-2-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231005172011.9271-1-Arvind.Yadav@amd.com>
References: <20231005172011.9271-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|IA0PR12MB8646:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f9d98c-de55-46a4-6a04-08dbc5c7704a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYXaw66nZPEoQ8DQSCVvsjG+I1czSbJZeeD7Z0ablXsX+GcFdbsNVZIyDIejpcT3sOdL7cSDBUCIZy1BQhtdwD8tsZayKdIMbG7kJty6C5tp0V5+90h/9si/uvrbk/t395cmoIBrCPBIJvQeDmM/m1SulnJHYDwFX//N2QwZd7hd+nCR0Or6IsLTT5J7vMfPJa021Dqk6nH5vI3ThC5f4natEy5SoqvebBYIh8FlDN1Q2DEw/wsfvKhdzqasw2VKMUoHOfSQqJgJMoWDQvE6trIXc3o1zXyY+bYkcINW3EgYF3a6XQHX+nagB+QHTIDLXv49bENEXlk8C9JSHdvt5G+1YYYinQdHoI40rb4YD8/FclXuIrNtly1n+qdCYb7sOZd4xJsymNojSYMc4mWUQwRAVMP+Gg6DVDgkHPwq34vEZIJOojlrLpJ51fcpajt+sjG7yoBAFeWQinv2XrWVYP0qq8M1s0N8VffL4itowG0+sUg4UtSjC6eAT60c3m6C78lM6UvZhWojnzjCQuFEey2R/QYZy8Wl46ynynZJSHNln9naOLXR14YBUgWPeI9Zp5B9OPh7y8bmhHpWDwN9S0a0fiIuNgNqpQpyqcg/PBbwHfPfKjYnwLYxid2DTSQEQ7t9u9BObAKGhBOooOy/CfO2TNzAbdYqD6OWZe+oXkKvhGdhMLbUdGL+V3QmhVtKCGHVYAyu8apXKBgSe65Gg4or7idy778PxIIBU8rFsHkkR7363/6jiit7eqoK93ZSfOX0QvDTXss+NYVUkmzAOw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799009)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(6666004)(2616005)(478600001)(7696005)(36860700001)(47076005)(82740400003)(81166007)(86362001)(356005)(41300700001)(83380400001)(2906002)(426003)(336012)(1076003)(26005)(16526019)(36756003)(70586007)(54906003)(5660300002)(316002)(70206006)(8936002)(110136005)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 17:20:57.5052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f9d98c-de55-46a4-6a04-08dbc5c7704a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8646
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here, Adding db_size in byte to find the doorbell's
absolute offset for both 32-bit and 64-bit doorbell sizes.
So that doorbell offset will be aligned based on the doorbell
size.

v2:
- Addressed the review comment from Felix.
v3:
- Adding doorbell_size as parameter to get db absolute offset.
v4:
  Squash the two patches into one.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h        |  5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c    | 13 +++++++++----
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c   |  3 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c           | 10 ++++++++--
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c  |  3 ++-
 5 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h
index 09f6727e7c73..4a8b33f55f6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h
@@ -357,8 +357,9 @@ int amdgpu_doorbell_init(struct amdgpu_device *adev);
 void amdgpu_doorbell_fini(struct amdgpu_device *adev);
 int amdgpu_doorbell_create_kernel_doorbells(struct amdgpu_device *adev);
 uint32_t amdgpu_doorbell_index_on_bar(struct amdgpu_device *adev,
-				       struct amdgpu_bo *db_bo,
-				       uint32_t doorbell_index);
+				      struct amdgpu_bo *db_bo,
+				      uint32_t doorbell_index,
+				      uint32_t db_size);
 
 #define RDOORBELL32(index) amdgpu_mm_rdoorbell(adev, (index))
 #define WDOORBELL32(index, v) amdgpu_mm_wdoorbell(adev, (index), (v))
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
index da4be0bbb446..6690f5a72f4d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c
@@ -114,19 +114,24 @@ void amdgpu_mm_wdoorbell64(struct amdgpu_device *adev, u32 index, u64 v)
  * @adev: amdgpu_device pointer
  * @db_bo: doorbell object's bo
  * @db_index: doorbell relative index in this doorbell object
+ * @db_size: doorbell size is in byte
  *
  * returns doorbell's absolute index in BAR
  */
 uint32_t amdgpu_doorbell_index_on_bar(struct amdgpu_device *adev,
-				       struct amdgpu_bo *db_bo,
-				       uint32_t doorbell_index)
+				      struct amdgpu_bo *db_bo,
+				      uint32_t doorbell_index,
+				      uint32_t db_size)
 {
 	int db_bo_offset;
 
 	db_bo_offset = amdgpu_bo_gpu_offset_no_check(db_bo);
 
-	/* doorbell index is 32 bit but doorbell's size is 64-bit, so *2 */
-	return db_bo_offset / sizeof(u32) + doorbell_index * 2;
+	/* doorbell index is 32 bit but doorbell's size can be 32 bit
+	 * or 64 bit, so *db_size(in byte)/4 for alignment.
+	 */
+	return db_bo_offset / sizeof(u32) + doorbell_index *
+	       DIV_ROUND_UP(db_size, 4);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 0d3d538b64eb..e07652e72496 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -407,7 +407,8 @@ static int allocate_doorbell(struct qcm_process_device *qpd,
 
 	q->properties.doorbell_off = amdgpu_doorbell_index_on_bar(dev->adev,
 								  qpd->proc_doorbells,
-								  q->doorbell_id);
+								  q->doorbell_id,
+								  dev->kfd->device_info.doorbell_size);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
index 7b38537c7c99..05c74887fd6f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
@@ -161,7 +161,10 @@ void __iomem *kfd_get_kernel_doorbell(struct kfd_dev *kfd,
 	if (inx >= KFD_MAX_NUM_OF_QUEUES_PER_PROCESS)
 		return NULL;
 
-	*doorbell_off = amdgpu_doorbell_index_on_bar(kfd->adev, kfd->doorbells, inx);
+	*doorbell_off = amdgpu_doorbell_index_on_bar(kfd->adev,
+						     kfd->doorbells,
+						     inx,
+						     kfd->device_info.doorbell_size);
 	inx *= 2;
 
 	pr_debug("Get kernel queue doorbell\n"
@@ -240,7 +243,10 @@ phys_addr_t kfd_get_process_doorbells(struct kfd_process_device *pdd)
 			return 0;
 	}
 
-	first_db_index = amdgpu_doorbell_index_on_bar(adev, pdd->qpd.proc_doorbells, 0);
+	first_db_index = amdgpu_doorbell_index_on_bar(adev,
+						      pdd->qpd.proc_doorbells,
+						      0,
+						      pdd->dev->kfd->device_info.doorbell_size);
 	return adev->doorbell.base + first_db_index * sizeof(uint32_t);
 }
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index adb5e4bdc0b2..77649392e233 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -377,7 +377,8 @@ int pqm_create_queue(struct process_queue_manager *pqm,
 		 */
 		uint32_t first_db_index = amdgpu_doorbell_index_on_bar(pdd->dev->adev,
 								       pdd->qpd.proc_doorbells,
-								       0);
+								       0,
+								       pdd->dev->kfd->device_info.doorbell_size);
 
 		*p_doorbell_offset_in_process = (q->properties.doorbell_off
 						- first_db_index) * sizeof(uint32_t);
-- 
2.34.1

