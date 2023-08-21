Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FC77823F5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7091010E1EF;
	Mon, 21 Aug 2023 06:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6075410E1EF;
 Mon, 21 Aug 2023 06:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OK080u4tQ452T6MO6gBq9D+K4PgYTeYNhACOLYpl5Hwl5q5iNct76r5srAUPB5ogZ5cd9oAG7IX2PJgpHJsIfAwFsBUcO4oxYmLUso7IPKYrgQndb3lK18AxJcquYQvGph+nL0NHH4oNkQJJkxA3iCejIU3gdLaTjvURubL8WDnFCqN5LuAhv4WaEaN1KxIwgeF6LkoA6ISccOKn6n4GuVe44l4YYlHGp55phRIq3KSP8VejbS5gY8tr9GWnV/Cgz0P34cDcuK9Cn5jcZ3aDUffYhHabMxKUsvzMogZfLkH9HUUD+b7Q+LaRifsyLCkoWRG2MFPkQeGlUxpIbCHbzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gqp2tKfzEQuKez93RYHEJ3TyrG37Q0Ccr0hQKhpWrVQ=;
 b=D+7MR2/+VRYQ77oe/5itw1fwCV7+FVdBnSe6REtcs/YUtyaTi9v57gxSs70ywr/Qrz1nE/exD8Bu+HU7H05dcpFovABoLLoLVwFoepCnpk64D4Yg58WCKizSUEdooxAidPbnXy/BseuTJs36QpZoemxPc7iiYphdyB6PWXlCUQDDZz15/lAlpPTjowADpskTqzIu82VLtn02Ko/6ssKPvqcm+WJbaxhYSPqbDA58oHhNpD8L1iJBz1jQW385GybI2aRDY5KBWVheTM1GLleb05fggbeQWTx/ddSV1HoDJH7toIT64D+hkKK9NK26/p4K4072vXnQbEC0zgCUuCtOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gqp2tKfzEQuKez93RYHEJ3TyrG37Q0Ccr0hQKhpWrVQ=;
 b=x6wYvcr4VQbAuWYU/qFk3jaL1d/6Oj+gNLD7mWnVD4cxOfxvk2hKYYgAilgQESQ2ykv6K98aV9SAQ76S06SpWc4n64/nHkt219PkK4o3y2+xWq6YJd2ofHlo68A9+5v7Xg22Ic+zieH76vZZuPonM7QzRUgbYBONiRWoU53n6vQ=
Received: from SN7PR04CA0183.namprd04.prod.outlook.com (2603:10b6:806:126::8)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:219::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 06:49:13 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::4b) by SN7PR04CA0183.outlook.office365.com
 (2603:10b6:806:126::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 06:49:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 06:49:13 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:49:00 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 5/7] drm/amdgpu: Switch on/off GPU workload profile
Date: Mon, 21 Aug 2023 12:17:57 +0530
Message-ID: <20230821064759.94223-6-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821064759.94223-1-Arvind.Yadav@amd.com>
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed5b5cc-2c0a-4667-29e9-08dba212bb08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flGK8tNsvKQOYVv4ZjbPisW7Y1LoHwTAagE8NuqgFG8O3shOxQ9IFpushqYv3iO4qAYRxClT2TAfMSE1s+W+pgJKkOU0RNp7fnzm7CNqmb/TywCbdLO8fnDW73KZwIGJIYPIoQsUg5EYubM6wQUD607vFAZ1XOg/DBvXpZjMWN1durmXf2waEUqrx8av+87a7tThnvx0jXgjlOePVi6eDe2HhqvJW46yotMWKpTb9KGi0+nlfHthXcCiuEZaJR50AP5SWGESfACbM3j8F8d95ZqgQeMJu5UQKnPgpm70AymF9/XZb5eiD0VVQ+0WjPVRnAgfqVTb/TmDM07UKX8CwtzpPN9MLEbkOkRtNfRv+QHPBDqUmk0JCKab+J9y2uUwW5Onz1tYSoGgf+HoD2oMDwO6rnJBh6dbiShhMH7IqsI98aSWj3P7bTToebS0Jqw+AOrsqanG3RkPmAdVMRtU7v7i+p8aDpLsVfZ45EPrhC+ndZt/v6sevqdYWhys8S7dOfkhGcVkLK9hWk+YYYDWjrkroYQRVbJc4B6plUXk6TerbF+aSXb0UhYdEljuXysSxI6Y/HAy9fLNNz3AQUTMBRjni5d08ZAFc71mHbJRBITTLJTRQFwVTdBide84j3CUrNYpFYfsckm2ASEDxH+ix8vinl5cvk9ZkIsFav6v4IKSpPz+3amvMU7nYW2ofWc0bZZ1ucLIXUGJiNRO+chfl0rnGz+8xm+VVWRUVmxllWE5fmrK6QczFiSWOpJzU6e143VXuyUCdjr+u8gcVLghgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(2906002)(7696005)(40480700001)(5660300002)(336012)(426003)(26005)(16526019)(86362001)(47076005)(36860700001)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(54906003)(70586007)(110136005)(478600001)(82740400003)(356005)(81166007)(6666004)(36756003)(40460700003)(41300700001)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:49:13.3573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed5b5cc-2c0a-4667-29e9-08dba212bb08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is to switch the GPU workload profile based
on the submitted job. The workload profile is reset to
default when the job is done.

Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index c3d9d75143f4..c2b0fda6ba26 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -176,6 +176,9 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
 static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 {
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
+	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
+
+	amdgpu_workload_profile_put(ring->adev, ring->funcs->type);
 
 	drm_sched_job_cleanup(s_job);
 
@@ -295,6 +298,8 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 			DRM_ERROR("Error scheduling IBs (%d)\n", r);
 	}
 
+	amdgpu_workload_profile_set(adev, ring->funcs->type);
+
 	job->job_run_counter++;
 	amdgpu_job_free_resources(job);
 
-- 
2.34.1

