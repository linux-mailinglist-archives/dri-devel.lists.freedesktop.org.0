Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6988747D93A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8FE10E388;
	Wed, 22 Dec 2021 22:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4525510E37D;
 Wed, 22 Dec 2021 22:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn/TLCthmY0pm1axmAVA9cA0UZ9Nf37tak2470+Sgd683Fe5FPukco6U0aHhf2kU0t58Z/Izl+DvtQTx2zu/n1deafeJFKMZXE6lstIzeCi+MzwLtofV3bskNRk42oNmKRlMJ/iGXgJO0IuDLSkTbVwO3BSNHJ3YCQLnJzmtGlksNIqG33wNlg1YkSRQc8Y+VjlfXly1ySXEotbQdocz1IVIU7uwFeozGsWQLUjGOcL2SpSOBEz1YWZwOy+dmmy89a93zp3UiQQwJK8GxKFgDSRjMg27R8WfYaNcUDIBKE9YoKCExtDz9jzG2C2aY70FdXY7A8YtMv81i4/O6p/wDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhXyC0flfwv6bNeZ29uT/mET9BrHzj+KxClAUd2H4Vw=;
 b=KiJrO1SerdZXN8Qsgu1Tpfx2ju770+FRfrH1mMXvlxOFP+oPCc3g/t/vQS8jqIn8snSduRErLDiPzWClQgDr61NqKO41rJwViwD9XJ91uXld9tzNB2X5Koo2uqJPjV6u/SKOZArL4021UPQIN++HWhDdyLwurTJhxjwSCWMxM7EwkU84U+2HxPhOOzQxUrDTIvNB8S3VuoKvJ1rcyaBI2XkE3HUG0sQaZ0kNlW5l2kRPr1QdsLl2fjJSsOXovouQwYSCVD3APnPmFbNjkhATJmE22xfr/9PGJPvmZPDQbvVjkSidDrdLTVXK8r5C2javla2dUFdpI8qOp8Z8TXaqvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhXyC0flfwv6bNeZ29uT/mET9BrHzj+KxClAUd2H4Vw=;
 b=cnyGEqWebgo8yWz3uCqW+XEVzmLVnCjgReSvwM2DMKgf1EdPHFV0Jj6sWosMiiLUTdxyNMt7Zq4B3iU2UmCodgjHx7FlalNdqF9QM20fHuC/fO0UNPZj8KtPrQ23HtKNsG+xDtPnybSSxMq9zcISwy5zHCctLunDThLcWEuO+VI=
Received: from MW2PR16CA0039.namprd16.prod.outlook.com (2603:10b6:907:1::16)
 by CY4PR12MB1446.namprd12.prod.outlook.com (2603:10b6:910:10::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 22 Dec
 2021 22:14:20 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:1:cafe::4a) by MW2PR16CA0039.outlook.office365.com
 (2603:10b6:907:1::16) with Microsoft SMTP Server (version=TLS1_2,
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
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 22:14:19 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 16:14:18 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v2 6/8] drm/amdgpu: Drop hive->in_reset
Date: Wed, 22 Dec 2021 17:13:58 -0500
Message-ID: <20211222221400.790842-2-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 85c5a21a-89ce-48d2-60c5-08d9c59866cc
X-MS-TrafficTypeDiagnostic: CY4PR12MB1446:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1446F6DD68DD41FA345983FEEA7D9@CY4PR12MB1446.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TwZ5yqIIMkEoTT5LXuJGf14jozV/k6sYuhvkRkON6uduEFBLrj3jlI2oK52Iyfx9+fByYWroCvNRTDGJgieDJxnSbVZ6+00NM5d25v+tbBUjrVUViRJ1hUY5V5HJcU4x/TblUEjlymSxrF821PW8e/tXr5WhnEtVBI19m3ZVBBKEPN5BnV/EuCAbbYf/rU04eLJ3tYaBzAuge5B0TweMBuSX77FR0N+W+Hi/9PSyLGFgdIkvNsEdHy92Vrj6XuWsSnJL8gkYHAvfP114dS4SJEr/EV15k+Q5NHYTMjq1MGmaMEf5mbxJ9sqndHGKgCO7UrZBTzdk5MzgtGbSLlQZNGREkOdlRWYrbtI1YxHaRgVx+g1NWmWJDkB+n0jY7sARl8pFZtS6lKbS5LZCR2VcJxx5XBJCUoT3WmDB/10ph6TPKvYb4Bh41ejFlq7jGamzVQ6D7/hSfJOhuzDJMh2mnzUXjnLYILXCjYorQCMHB4rWwbmhCfCMr5/HtGgW9XkNYWUWE7iOSCAfZ/5TN+Py9yLcKMM1kfAoJZeS0aItaE84mROuNLJmZ8fxLh0H6Gre/RP90/DxFQST7ewJ6QurVOOv+1mv7V/mb6S/NQpVIchu7xZUvgH1AkT1y9YVWjsTKUIxDZo3aa6swYdoR5rdQjcgOnoUKFTrxDQKenFDmH+3X4DA/63rXlSpBp2dN8DEQYnVZCSN9wLULh/Y9rlC+maTAXw0lyVXw8knnnKM8iFg1QvHP4CYxRG9tzegjEHuGbikFR/j1NXl14cCB7iUCkuE3QUm0P9zsbnPxXY1S/E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(54906003)(508600001)(81166007)(36756003)(7696005)(110136005)(6666004)(66574015)(40460700001)(82310400004)(356005)(83380400001)(4326008)(70586007)(336012)(426003)(44832011)(26005)(1076003)(86362001)(16526019)(36860700001)(5660300002)(70206006)(316002)(2906002)(8676002)(8936002)(186003)(2616005)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 22:14:19.8444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c5a21a-89ce-48d2-60c5-08d9c59866cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1446
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

Since we serialize all resets no need to protect from concurrent
resets.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  1 -
 3 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 258ec3c0b2af..107a393ebbfd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5013,25 +5013,9 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 	dev_info(adev->dev, "GPU %s begin!\n",
 		need_emergency_restart ? "jobs stop":"reset");
 
-	/*
-	 * Here we trylock to avoid chain of resets executing from
-	 * either trigger by jobs on different adevs in XGMI hive or jobs on
-	 * different schedulers for same device while this TO handler is running.
-	 * We always reset all schedulers for device and all devices for XGMI
-	 * hive so that should take care of them too.
-	 */
 	hive = amdgpu_get_xgmi_hive(adev);
-	if (hive) {
-		if (atomic_cmpxchg(&hive->in_reset, 0, 1) != 0) {
-			DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
-				job ? job->base.id : -1, hive->hive_id);
-			amdgpu_put_xgmi_hive(hive);
-			if (job && job->vm)
-				drm_sched_increase_karma(&job->base);
-			return 0;
-		}
+	if (hive)
 		mutex_lock(&hive->hive_lock);
-	}
 
 	reset_context.method = AMD_RESET_METHOD_NONE;
 	reset_context.reset_req_dev = adev;
@@ -5227,7 +5211,6 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 
 skip_recovery:
 	if (hive) {
-		atomic_set(&hive->in_reset, 0);
 		mutex_unlock(&hive->hive_lock);
 		amdgpu_put_xgmi_hive(hive);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index a858e3457c5c..9ad742039ac9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -404,7 +404,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	INIT_LIST_HEAD(&hive->device_list);
 	INIT_LIST_HEAD(&hive->node);
 	mutex_init(&hive->hive_lock);
-	atomic_set(&hive->in_reset, 0);
 	atomic_set(&hive->number_devices, 0);
 	task_barrier_init(&hive->tb);
 	hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index 6121aaa292cb..2f2ce53645a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -33,7 +33,6 @@ struct amdgpu_hive_info {
 	struct list_head node;
 	atomic_t number_devices;
 	struct mutex hive_lock;
-	atomic_t in_reset;
 	int hi_req_count;
 	struct amdgpu_device *hi_req_gpu;
 	struct task_barrier tb;
-- 
2.25.1

