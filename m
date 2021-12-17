Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A95479720
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 23:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85A810E779;
	Fri, 17 Dec 2021 22:28:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2070.outbound.protection.outlook.com [40.107.102.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2372810E6CE;
 Fri, 17 Dec 2021 22:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWG9yl6z7/2i3bKvZjT/EpKFyiZ/DozGEVFmzK89rlDDGURxWsJukqVY0kkHnpqniq5FTIOrwOD3Mv74EX+elV5wsCd04sFQLfbDDgWoghGgjDG0sLXpsL/irq/gySai6r9pLsvV4/HfEMHNtsRLC432RLo7b/Gio2xKLZNZ5El/JGvasXvghbpdzYNFxHy/AeyqwtEzqU+kUMyDfjxUnKqvPNCG8+1M+Xi8ODFy1y0YFSDJW9mNxX0EUOS3nkercrCpbrv2iJTg+wi8PuxRqhDM12wAugr7o3hczR8D93D8usBf3zwXzGU3LVBcUFIqDfW78KBG/Ks2J9cKjUQIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOqzt8UQjxRRCGvkuiLk04dl9aIzxyq/VPOFpOyI8pA=;
 b=D5udkzSmRPg0b77v8o89gjL4F3+lP+aaXwg9u/buMNhee7w752bpH0J7uUVhZ56uS4vvuae+t4Nru++b3x6Kf9/sSr3MW9ir86nNbuFw1b423CMOk0n6Zq1QjDIsnLBvpVH5CH1o7t32beeI7knBLRycYCz+2JZNNWd74fVdJ80RdxlAXzfCobLPYw1uHeB0qv2DJz8i9mqNB++i5/57utg13KAKSdq5QOuEaa8kRHhZtOY7fB+ymF3WNovDxaD6sUddRPsCMnfzz4BDUEcwmryWTpxRRHMVr+YAIv+1K9LG6g4ttZUcU1wUW+Q7wSeC5341InXNuapJAgfHCeXc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOqzt8UQjxRRCGvkuiLk04dl9aIzxyq/VPOFpOyI8pA=;
 b=d/1VKs/WBGhpGIN1hWB5pFaHqLOx8ADUteTRjs70+dfkZaOrAUPA5a1LFBggOlhnBkitQovFk2EqJctNCRM8IMrTVGwMDVZ5XdYReWbeV2ONGxvRX2dxWaK46a2xleSaccGTBbN+fJ9f3SSotG9zVrS5EId2bc3hjLHqBjcZrMI=
Received: from BN8PR04CA0027.namprd04.prod.outlook.com (2603:10b6:408:70::40)
 by BYAPR12MB3080.namprd12.prod.outlook.com (2603:10b6:a03:de::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 22:28:14 +0000
Received: from BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::8a) by BN8PR04CA0027.outlook.office365.com
 (2603:10b6:408:70::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Fri, 17 Dec 2021 22:28:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT051.mail.protection.outlook.com (10.13.177.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 22:28:13 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 16:28:12 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC 4/6] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Date: Fri, 17 Dec 2021 17:27:43 -0500
Message-ID: <20211217222745.881637-5-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: b5c82c37-f06b-4a3e-dfb8-08d9c1ac83da
X-MS-TrafficTypeDiagnostic: BYAPR12MB3080:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB308070D2C66A74612E6E1C31EA789@BYAPR12MB3080.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 02CEsSi0v2xyM1gCk/6v6na7jdus/vl0xrnVRxad58F5VvpViZ5QvuXTNwqvA+iEQ3yFXl2GZxAYL1i+j2azMZr3+gj4p1Q+DDu8z4mlbfx016Et7K56vohSvCkN44zrPxgFLuNlDHP2iUBEjF6Xjk71JQmx0SFG1q4/iNwiNT67Cdh9MnmPi1GNWJCs2BEANBa9gnCAIhWJ7d+BW5QErOdH0EYdDP9yRvRGtjWIMVx1CVPr1Rq9eGiQ1TswB2/DYtY3lCNzOi2Yo3DmRvmVKguk88/qXievC8VYC8SZkbt0d4jccPgEORThF6H6hHCaR1QaUJSszrAhJimCduYghMY5imZ4pvR3h9DOtLrqlH4ULECPueYn3mSH76fIXqzkur7pJUj5toArdTkWhgIGaSUkg2ecStyjMr/Hd4bSWkIe4BLekpJdDLLmgZYokqgNOa9Qzw68SRpm74bl028PdsYfAl56h25VOSKfEMqy0B2WeBJZG9VE8TdkxQP/Pjc9s/E38o7kukugaxhcz1C5ZtRUQ8pIv48SbM7MvYFb/ohE75kJ0Aj6o9klrBlCMfBPRqL/AnPiNRumtBRmYx9BJbiT2lR/juQWiEOpVEAkTR2Jlo9QH7InoAF3TPGG/SVYaoS13wG6SLnulk+M/gR1OpKu7To1/26ocxQ6Rfd27gy96+SbeyU0ICpUcBWWFuIMn0vC09MmRTmorFpffrFSLC64gpgAj/dqdYQCdCBI7RZ1bsxyX3rO56BX1i9TMDYn7M8zPg34A2wU3ZbWOL9o4SuUrMmkMgu+EcvXg+zNwtM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(36756003)(4326008)(47076005)(8936002)(5660300002)(86362001)(336012)(83380400001)(82310400004)(44832011)(40460700001)(70586007)(26005)(6666004)(7696005)(81166007)(356005)(110136005)(54906003)(316002)(16526019)(426003)(36860700001)(186003)(508600001)(8676002)(2906002)(70206006)(2616005)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 22:28:13.9003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c82c37-f06b-4a3e-dfb8-08d9c1ac83da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3080
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

Use reset domain wq also for non TDR gpu recovery trigers
such as sysfs and RAS. We must serialize all possible
GPU recoveries to gurantee no concurrency there.
For TDR call the original recovery function directly since
it's already executed from within the wq. For others just
use a wrapper to qeueue work and wait on it to finish.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index b5ff76aae7e0..8e96b9a14452 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev);
 bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
 int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			      struct amdgpu_job* job);
+int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
+			      struct amdgpu_job *job);
 void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
 int amdgpu_device_pci_reset(struct amdgpu_device *adev);
 bool amdgpu_device_need_post(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b595e6d699b5..55cd67b9ede2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
  * Returns 0 for success or an error on failure.
  */
 
-int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
+int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 			      struct amdgpu_job *job)
 {
 	struct list_head device_list, *device_list_handle =  NULL;
@@ -5236,6 +5236,37 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	return r;
 }
 
+struct recover_work_struct {
+	struct work_struct base;
+	struct amdgpu_device *adev;
+	struct amdgpu_job *job;
+	int ret;
+};
+
+static void amdgpu_device_queue_gpu_recover_work(struct work_struct *work)
+{
+	struct recover_work_struct *recover_work = container_of(work, struct recover_work_struct, base);
+
+	recover_work->ret = amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
+}
+/*
+ * Serialize gpu recover into reset domain single threaded wq
+ */
+int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
+				    struct amdgpu_job *job)
+{
+	struct recover_work_struct work = {.adev = adev, .job = job};
+
+	INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
+
+	if (!queue_work(adev->reset_domain.wq, &work.base))
+		return -EAGAIN;
+
+	flush_work(&work.base);
+
+	return work.ret;
+}
+
 /**
  * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index bfc47bea23db..38c9fd7b7ad4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
-		amdgpu_device_gpu_recover(ring->adev, job);
+		amdgpu_device_gpu_recover_imp(ring->adev, job);
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
-- 
2.25.1

