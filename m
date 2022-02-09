Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7596C4AE5ED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7FA10E5BD;
	Wed,  9 Feb 2022 00:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51479895EE;
 Wed,  9 Feb 2022 00:23:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCDcjBMbTjGkfsVLYRjMaIQxlgK5jiMYY4Ye1AzS7dvcPVTTD6v1NUwtMz2gS4o2zaOcI0nPiPJ3KfOfu6ZjRaHqgnF721XY21BtE7QQw+fMqAF/egjAiE+SI8bIt+cQwe+SFFLNA+WHopk6+6LnR/CjrKdGXgn/j9MQc7IX/u5B8knDghS4mBdGLhH8kV/Gunb+ieg5A5smUu9UvGWY9piC2u7RW5Ui6udWqj6kBEuOwNtZZ3CjkYBmyN8257LigI0wXnSZKwmiQ2eILXtPP+U7fWNRQARU25PNumcQdk/v3/VzVGJd24KPhTRQASb4+jPRaWUykeLw6Dph38Xwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFcXOhGzkHsTsqH7uPZsdDRxtR8qzeD20AVJ3ktkMLA=;
 b=lTYXYe0UDy9TByHtdxkEMtTZHHvOWhchj7Riul33GcvCUf2Qkdsx0/6k80VvGnvIBHQHU1PanuWTUlcY2LTM2prF4Jv62mo12WrEjTDAPmpU6Uvy6+gBwgt1ETxHlw7KD0dILgl5GcYeVv8T+veRs6Zy+Lapsifxf77x7FFAwOHXZrQ7Nm8l5Mw2BKESM7NbZeC/4RGZfnM1VVbe+VNSheKVIGCQT46S2Tt1x95RJpuA4dUTK1015EBy0Y+96+eqii0Nqai+yaNq0XYgQTStMsGpS0gt+mwCr2MU7VeAJvvEtRGziMQ98xFiptO2PySasCuL3Hfpv6DYGyT8BNoFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFcXOhGzkHsTsqH7uPZsdDRxtR8qzeD20AVJ3ktkMLA=;
 b=ao0sqGnNM36uxb1rQb9zo7NHTPQmMtuFa3pta0DjdbacDJ/qSZtLhB7LMA0b16JiM1Xy/EjB+9pY47bUuBkW4MTcAi/ns49KHB6huz3Y/PSiHHpDASiM8rEnt7gwVIRPNzBeL56FL4bgbf0tK8cxq5aLeUBLNUel49dXPKCYrl4=
Received: from CO2PR04CA0064.namprd04.prod.outlook.com (2603:10b6:102:1::32)
 by BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 00:23:51 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:102:1:cafe::65) by CO2PR04CA0064.outlook.office365.com
 (2603:10b6:102:1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:50 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:49 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 05/11] drm/amdgpu: Drop hive->in_reset
Date: Tue, 8 Feb 2022 19:23:14 -0500
Message-ID: <20220209002320.6077-6-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19a35e09-e753-497c-d137-08d9eb627299
X-MS-TrafficTypeDiagnostic: BYAPR12MB2743:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2743EFAE0D3FB4D82E1C7B5FEA2E9@BYAPR12MB2743.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcZU7CeNXslHU/fN8wdIph7vZzJNKKGGOMEqFSJehQCE0IvKFk+9Ug8kgpKCvklpOJj+355CJZpa+F9HFzt9dNqReKzCdAYCdFuBqIhfP8zx59a8a7cQJXqsUvLbfSp2gOf6XgfCnD9tFijPQ7UiMjrkyVIfpjvVVVSRuewFsmQr06D+ns4jbYW4gYmHvX3xWpyp8pryoIRtKRZHNVsmj0iSyWaZVttpP3wbZihIUGHzpVUt0hqf3Mozlfu/gb3QPWHUK6MF7/xMBzyUfBBDe8JF6RJLE7PaVyiRNosvDICNelsWefhcikdJUfcHgLWPR5MxIQ/+q8taqJ7+jz6RHzx1/4OFWwd4CgyMgVVYOT/mzbHpetdczkn88YBHSmyd8nleCUjYzQim1ID4LKO8CuZ3KMdOtUqOSpLQRGUAUKTSsfwQ9kPXp1GP6qdUL+qpRI/3z5LY6w+DxoBO00iKgNdO0XsPYer7sRMHvj3lrZaPd6b+DxjQcWXvdva5o2TFzXy6CTh14bNaAnCxZqsGFQSP3DoqLH1liqsCQIJbLNSANP3Z0dsKflgs/JyNpia6xov1h1i3AodNBMxgDQfmjY678xF8td9sy6sTE9O0cnxRbP1W2+3DW3FhCih32P2589mpoL3c1YW47HHEMCAzcbMJgwc0FuxerEh1RYhjOQZXydaOW5p6YF5cQm3a0aJplHVudf5nqSfUl/v64ZcYYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(70586007)(70206006)(8676002)(7696005)(6666004)(8936002)(110136005)(316002)(356005)(508600001)(81166007)(86362001)(47076005)(5660300002)(82310400004)(4326008)(44832011)(2906002)(40460700003)(36756003)(36860700001)(66574015)(16526019)(26005)(83380400001)(1076003)(2616005)(186003)(426003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:50.9766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a35e09-e753-497c-d137-08d9eb627299
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2743
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
index 15e8fde3ac2d..7e92f2432087 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5067,26 +5067,10 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 	dev_info(adev->dev, "GPU %s begin!\n",
 		need_emergency_restart ? "jobs stop":"reset");
 
-	/*
-	 * Here we trylock to avoid chain of resets executing from
-	 * either trigger by jobs on different adevs in XGMI hive or jobs on
-	 * different schedulers for same device while this TO handler is running.
-	 * We always reset all schedulers for device and all devices for XGMI
-	 * hive so that should take care of them too.
-	 */
 	if (!amdgpu_sriov_vf(adev))
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
@@ -5282,7 +5266,6 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 
 skip_recovery:
 	if (hive) {
-		atomic_set(&hive->in_reset, 0);
 		mutex_unlock(&hive->hive_lock);
 		amdgpu_put_xgmi_hive(hive);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index d406897346d6..89b682afe821 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -410,7 +410,6 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
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

