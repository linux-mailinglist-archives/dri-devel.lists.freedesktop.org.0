Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2884AE5E5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 01:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375CF10E4C7;
	Wed,  9 Feb 2022 00:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A530910E4D9;
 Wed,  9 Feb 2022 00:23:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgMoVaBIlEHdy5UfjaohqHSpp+RuXBDlSMdtvN+vNQ1SERKj2YgElMmHREQJ86Wtajm3SeiISgJPMVwamGEvh39K6feJOvo7TZs66JNhKRLvUtdiUf7xOQXt0R6VSRYpW0HYPc6oX+32O+HwDV0CiYUZZ4SCVewll3dUThD9TbsFz9yK3eT8m0KR+wLRI1IXg5EeYW0saYghgFhkge9+9RU5jgmVAVt6ixCovDD4M1EW9pLBio+E2oiitm6Y+y5zM1K14qqDkc6juTfulkl/+ucYeHz4GbZ0XjwVoDgOrZHZC11cKgdsW7j12CAh681pKjtw5AcCgpw5D7+emSCw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LjNuCKCfVYukAjPchO+n3HvS+9wmZAjQb5cPITKDVE=;
 b=La5JlTDpsK6oPaLYZH78cvApHGjHBEm32qpmpLyzhuCvzwu0XLHoCOTunrmZpkDN01azG4B2BNtHF/Yyc8lc4oIu6nBXbzGkooGF0WD9Zdgwdj6GvsZEix2ZkpWAZO89ee/KxfdNMpV0/gyZSpZoxREPAAA9GOjkGI5umOEIBRFk/SAZw5K8gRaX2sRN1MlCDYFuyts2FuLVAL/ZVJtx2cdHhTDdguwidjgydC71sBbfhxPrgsiHdcwrSJk720uPyRAyJQ9OPcofXAsjGAWOHObuvO4V6+jIPZSnsNqzFBRTejPT4Uji34RAhJX/rIrbFVmqqsqmAYWuSisa1jemog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LjNuCKCfVYukAjPchO+n3HvS+9wmZAjQb5cPITKDVE=;
 b=q4gDB+Cf/m077+WGtxhc3CQElMN51D1mhISlNIrESLmM3/8Ht0S1aKi2b1Mt81CelWzETQPrmkd2IEiDjJxiwAgBJCugs4Sds3e31klIJPfb/U8JYiXa1mfOaF+7/BcgHgdPeB27c6EPrZt4bixrxvCGSpLH4tnakBMrJxBSdc8=
Received: from MWHPR11CA0047.namprd11.prod.outlook.com (2603:10b6:300:115::33)
 by DM6PR12MB4449.namprd12.prod.outlook.com (2603:10b6:5:2a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Wed, 9 Feb
 2022 00:23:48 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::90) by MWHPR11CA0047.outlook.office365.com
 (2603:10b6:300:115::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 9 Feb 2022 00:23:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Wed, 9 Feb 2022 00:23:48 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 8 Feb 2022 18:23:46 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v4 03/11] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Date: Tue, 8 Feb 2022 19:23:12 -0500
Message-ID: <20220209002320.6077-4-andrey.grodzovsky@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 15179e89-6d76-41ef-99c1-08d9eb6270df
X-MS-TrafficTypeDiagnostic: DM6PR12MB4449:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB44495138708A2225CAC20AFEEA2E9@DM6PR12MB4449.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8T7fni39Q2cDDzKVA3t/r+A5Xr4g9R/vANCiEvTmK/IzRANF4D7pPHBT48dpZBFYgrK542IxD34unjW8pukFzVS74+4guGgsf/Y46n6bUSG4/D8OxRV9HLCsM1eHFvLrW/UxjuZMrSEvJDX5aBzcY+jMNgsFg0LBpGTBYEw0yFr7Ck0rV8OP2F6Xt1GzeqQOTxvOvGXTQBGoMvJnCJ1gkjNPa8lQDoLvQ3sveixq2gF6mjfwATntJ65gqf9UYp+/dL5yzEi6fR7v738LtKodaSZXRVmw7kQRtQPzDw/hnKEgLU28B5zX5WmX673WzEszcoJKxWBpIr4pEI78f1EVjoC/SFPKKnd5+4qhEK3WfLTLTA0GGxh+7CJqk7fXJv9aNVDvG5X/hcgxnVw/xTyaoI8+zsq2/toMPCtRmGUN/gkpc1796m9ioFT6AyI508Lc1P2niUIa1LtfEiZK2xVudRlhTer5+VgAFZIDf+bO+I4RHEIE7IP24jGwVS9qE8edOH1e9C7Bp1bGAxEged9A1m0Xi5pP1YaicLgGu98mZ9Fm1JhXIkwnoK/jlU0hXM8iBzx9ixXgXbTreOcevOCHtEKwpXhhC5Vf06y2xZog9irYyRnXH7OzA9GY2OKQq0pqnNKUryYeBtEX+YJmcUW1kjRapIlei+XHjcLNHeD1Z2HaEvb5bemdSyhDxlT1BIC70J5T8DPoRCHcHRADmsM3g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(82310400004)(186003)(66574015)(2616005)(8936002)(47076005)(36860700001)(70586007)(356005)(426003)(336012)(26005)(16526019)(81166007)(316002)(1076003)(70206006)(36756003)(8676002)(54906003)(7696005)(6666004)(110136005)(83380400001)(4326008)(40460700003)(44832011)(2906002)(86362001)(5660300002)(508600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 00:23:48.0785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15179e89-6d76-41ef-99c1-08d9eb6270df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4449
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

Use reset domain wq also for non TDR gpu recovery trigers
such as sysfs and RAS. We must serialize all possible
GPU recoveries to gurantee no concurrency there.
For TDR call the original recovery function directly since
it's already executed from within the wq. For others just
use a wrapper to qeueue work and wait on it to finish.

v2: Rename to amdgpu_recover_work_struct

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 +++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index b76c1cfad7f1..540a38fe5cd6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1298,6 +1298,8 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev);
 bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
 int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 			      struct amdgpu_job* job);
+int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
+			      struct amdgpu_job *job);
 void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
 int amdgpu_device_pci_reset(struct amdgpu_device *adev);
 bool amdgpu_device_need_post(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 00123b0013d3..15e8fde3ac2d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5033,7 +5033,7 @@ static void amdgpu_device_recheck_guilty_jobs(
  * Returns 0 for success or an error on failure.
  */
 
-int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
+int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 			      struct amdgpu_job *job)
 {
 	struct list_head device_list, *device_list_handle =  NULL;
@@ -5292,6 +5292,37 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	return r;
 }
 
+struct amdgpu_recover_work_struct {
+	struct work_struct base;
+	struct amdgpu_device *adev;
+	struct amdgpu_job *job;
+	int ret;
+};
+
+static void amdgpu_device_queue_gpu_recover_work(struct work_struct *work)
+{
+	struct amdgpu_recover_work_struct *recover_work = container_of(work, struct amdgpu_recover_work_struct, base);
+
+	recover_work->ret = amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
+}
+/*
+ * Serialize gpu recover into reset domain single threaded wq
+ */
+int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
+				    struct amdgpu_job *job)
+{
+	struct amdgpu_recover_work_struct work = {.adev = adev, .job = job};
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

