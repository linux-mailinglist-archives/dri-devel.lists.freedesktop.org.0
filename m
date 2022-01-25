Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A549BEA7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:38:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D22810E5E1;
	Tue, 25 Jan 2022 22:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E295D10E5C8;
 Tue, 25 Jan 2022 22:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lt9nkPTdZRL9ekHE6vooWpkutibm4Av2l6zI5gpAXQoZrz7LSRwHGbPuUZ/qSw0scWUB8JtoNFRd2gWcllEyzoxoryTpnqS73WsW+QjIljGi2NtrOZUs0/P3WQqd6hOa0vICdic24pyya8UN0k0z2zl9uZ8sYcI/P+ZFb5X9nlHyj3Oipg8Miz+tbPkTfjrIxOpSlKjGi3pUI+dWSCGaODNd/HKYIKuvWg0UMLwnkmcfW0hipJIbGLaqoVwntjOZE2EofbBtfSXOO5j6wv1zu6LXlsvpd7vTgu0W9MfvDul5H8mTCb0FhxUnIrx12rekfB2960pjqkH/+HUdYAJCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFi4K7sUyJk1N/qp/t2W0ExOzvuLVTItmEx6TJtX6Xo=;
 b=Vqvjg779Ij+xHasdT5x1iJjImljqu3resZXeqAzIEQ1TXUhGHYbW19Wr+j0Zz9T5Iv2qJ3squEICpjAWx85PjA07K1grScOao428sozmYz1Uh4oNYEZ/SMdmc8NZ8+39WNtbPltMu8BQmOSmibrsNmsAzmX1JzkBRxYjbR5r+oOUZPY2wh+kX2HKDs0yxE++AGe0NBcHkELZlMT+ENggLCzQoEpEJbStypebLT3kZHXXWUD8onTmGLL4tZj1joWh/BsHllJZdzz1JiW+4srg7SK0qKubvL5C5OBNDiCB36pLNKkUpduWsFodO2ZsGzOwcfaELFrtuN3X7fbNeaYzWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFi4K7sUyJk1N/qp/t2W0ExOzvuLVTItmEx6TJtX6Xo=;
 b=P2UistEuc7pDby7q+xcr/DEp5C8l+Mq+2SCTq0mVkK6/2jwVncgoHiBsikC+B1PgIwQelpoMYA+3hCgk4YPJAxRaAAQMuu75xDMJQv5iatwxh9cZcUrfQgFUyjfEElwnQX4GaQVTxsGotlqC898uXRBX7Rjd2ZlO2f+bnSABSh0=
Received: from DM6PR02CA0057.namprd02.prod.outlook.com (2603:10b6:5:177::34)
 by MN2PR12MB4654.namprd12.prod.outlook.com (2603:10b6:208:1bf::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 22:38:22 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::5c) by DM6PR02CA0057.outlook.office365.com
 (2603:10b6:5:177::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 22:38:22 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:21 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 04/12] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Date: Tue, 25 Jan 2022 17:37:44 -0500
Message-ID: <20220125223752.200211-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 082e7d24-565b-4a68-3d05-08d9e05364d8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4654:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4654AD15E51ECBC1D9E5C049EA5F9@MN2PR12MB4654.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qA+nfKZOE2pHSsMi9W56+1JKizXdWS0IDSNXAOwssjGH35iPD1AO40vEsVEksqV+H11RNfZfPUiq5GavbQ5S9exv7F43B2QvcbxP/LwHsD9/hTVdTV8rYwXtdwIrQHifLNlKkHWg+Zxi0XL7A8hPhSAhTe731fRXkIA8tfcSFl4v47AxJ2YLbOIywF/IPfVDMko5xUkdRkC+iOmW/HyZDGXVHW5MHeMnNn2ofMOAWFW6T5JWAo2UkMV3EHRDTVwccIXU1jwmesmC85vPw/7znNJiqRXOYsDgDSk+VJFONcYYHARvYxPnIrFnAGKPVsN8eeRBFO6lE6XqcLlju6OcxwSnvPRv7muwXxw1Ed98Hh4KefkAO0OQTjqsc5HWfbzQPAaqTK+9aMFO+iiG5KYEEhEGmPFjHSpKPCmGH0ud2vWSayG9pldhhI6mbgqie01WuXjLvaO863/YIuk5t4hTzEtABi8g1j4MrjUT/yGaDYccT626OdhUyfI8q3iYkqY0hnx4P8SOkoqHEH9+dVEgOd4rikFfvLiB/39ZUzZys2JNbLpaDJAkQ0vJytht4CXfLBULX4oB6ixmeZhahLdTUD6UDLgyMYYQkov5tFmsLjtteXlybw6nrdisK+bGiAbBdOxixH/D5LL2zYheI91KkVPguDrtISOM39Ifvv9do2jvNC8QfNmPWctrruBxH5y6s2mz0WGXui+PwafdRzFnsEBUIJYQs9Mxwa7VVO575fASACrqD34F6LNjre09BY2KVWKvKl1nBC26w3iFkHrwNl6DdVczDljaxLuCEbMHPF8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(36840700001)(46966006)(81166007)(316002)(5660300002)(26005)(6666004)(70586007)(8936002)(66574015)(426003)(47076005)(356005)(110136005)(83380400001)(70206006)(44832011)(186003)(508600001)(2906002)(36756003)(8676002)(82310400004)(2616005)(36860700001)(86362001)(336012)(1076003)(7696005)(40460700003)(54906003)(16526019)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:22.7498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 082e7d24-565b-4a68-3d05-08d9e05364d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4654
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
index 7c063fd37389..258ec3c0b2af 100644
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
@@ -5237,6 +5237,37 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
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

