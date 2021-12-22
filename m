Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E47347D936
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD8210E37E;
	Wed, 22 Dec 2021 22:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5353710E377;
 Wed, 22 Dec 2021 22:14:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSueTYd6rd0rMufJXA9s8l6iB7B4hljY1E5WQrPrfT7zDUk5dAGPhnDvi/b9aUomEQCwNK8ba9X4O9WUf5zydNRdI0Sq72KkMDiyjExD+AXISk2tW209rtY3HI5/GuER1bFNqwIgs1qI4le7XOprnuwB7bEmjTM65IdEN4lkFW7ffU2Oe2Z/jH3FX+ihliu0MzYMfEJ9547dVABjNsw76qph7ETAOnDyXJCl3OhSJLT+EgXjLxssmPK3Xu+yQz1RuU93dDlrZg6DsFlQrshlMRs54SldcP0fwoB2bCSdS7I5K/+UCNkvPjwXoVmd80yOXtQhscbRVVt5hd6tGPeIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwXAtj3obP/VPC6vnQpjR/+tsahOlycfJQ/OVEBchKw=;
 b=EYwv3UoWJQP+2212svG5NpT1Ect1wpdnnEWp+2iYlgi2E9fVftlIleBhUBV7VO4D2bEV1pap05ZCzL5slYwCwaY6igdSJvo5zafB1MFtXEy3kisw4sAW7n7YiaGtGqdtzJnJWqxxkX+v2ndXPlRx4MnNjiLNaJVRt0U95mvZFgarU6BdhA0/5qTRTohDOjfy0gCh0J1SzaLlLqGvVlW7b9K+5S9FgBLo9nC8vbtMinsBGc95sN7bz22K7cT1oyRj71lNMTB5ZMTSB+yC/aGwI/hGQKd/YUsLG77U6SQiMxbXsW3xDDiERIu1LC0cA8NLxFe2HS1N1xzZ9sjq2GO5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwXAtj3obP/VPC6vnQpjR/+tsahOlycfJQ/OVEBchKw=;
 b=oHsZdMXtZYbwLAemoG1G6DwvT7pfC3dLVk8mkE2tqi7JG1kp0xSnhjOqo0azpK61ARv1yQWamcCVUkTOoiK9T53qwDmPxOvIxAeT8kwp2AzxKaEaOgob1WaFU2Mdo9KaQsbswpD7F2OuYGLFiMTKj7PXg/W0SerCtqBycUuhD7Q=
Received: from MWHPR18CA0059.namprd18.prod.outlook.com (2603:10b6:300:39::21)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 22:14:18 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:39:cafe::9) by MWHPR18CA0059.outlook.office365.com
 (2603:10b6:300:39::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14 via Frontend
 Transport; Wed, 22 Dec 2021 22:14:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Wed, 22 Dec 2021 22:14:18 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 22 Dec 2021 16:14:16 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v2 5/8] drm/amd/virt: For SRIOV send GPU reset directly to TDR
 queue.
Date: Wed, 22 Dec 2021 17:13:57 -0500
Message-ID: <20211222221400.790842-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f5e6450-e1e5-4d49-0f15-08d9c59865c0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4186:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4186C1B1BAFB0B918117EBE0EA7D9@DM6PR12MB4186.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:245;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kI+koM2aev1wmvITzwPbZ6PSXo3dmjsr99FsyBocDCn03UJGS1yG8Z6oS1ROXhhfZOFs6vs3yFcxEv33Y05NX6/dmJkhGVqbcvl/wsquLcPJuZg9nh5URFEqJPn2cBP/D6qOSgR14DGVfaDqLKJ6UKVQlnhUnxC7SSdahklB9kOvc1+wkSZ3oJqL5Yh41LsUF9EtC2Rw88r0Nw8UgH+xfAB1Ott6ELzmO4I5NB4dqeF0VpBVVgRVHeDBFCTqCs5oWpC0WAta0OEZBYZ20JkhvwsdY3pRRm2gE9EM3HiFOvXogcFkNJOkytogIVTUVVyvosDbrmpOyzHyeh9JccNB2/EAbIhgwNVdhvzzyiqAHgWBFCU4QLNVjEF7AtxpTupgjBrayHrvKHIes/YbaDDt04Lq5UdY2itTtK7DzLKN40B5k+oWmdAVXQhGP6kL38JZe3WgL+y8p7IWah+2ieVK4oFrdZSMGTJ+QiApistM5l8ylfKozJ5r78etRmq000dfXUG+x8DVU5kfEc/Yt9A5ls0tWHHAVu7x3SrlsM7MojkL7JVKMQTgCQWpuL/WttrWig9WmlfHzuHSnsEzJHABGp8wEaoqp6V7gM99gXgG7OHcJ3lZxM6GACmqiZhi/S04OscvaaPZwuHqZCaSEBkabL5yTjKUDs7BcrNyFBMw73ULWW4aRESmkKGrwfsnHACMKcpDZIHvDo2TTqb+TlxmCH0r45TD+RH4RA8aLdBJMnkqy87lcqkFjatJFGdfayhfy4MXa8fbOdAMp6nqQaXqpChhbrRp9+yZXJLpabhi/Iw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(2906002)(8676002)(316002)(70586007)(8936002)(81166007)(110136005)(40460700001)(70206006)(36860700001)(47076005)(6666004)(54906003)(356005)(83380400001)(86362001)(82310400004)(44832011)(426003)(4326008)(16526019)(186003)(36756003)(2616005)(26005)(7696005)(508600001)(5660300002)(1076003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 22:14:18.0859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5e6450-e1e5-4d49-0f15-08d9c59865c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com, Liu
 Shaoyun <Shaoyun.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to to trigger another work queue inside the work queue.

Suggested-by: Liu Shaoyun <Shaoyun.Liu@amd.com>
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 7 +++++--
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 7 +++++--
 drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 7 +++++--
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 23b066bcffb2..487cd654b69e 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -276,7 +276,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	if (amdgpu_device_should_recover_gpu(adev)
 		&& (!amdgpu_device_has_job_running(adev) ||
 		adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_ai_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -302,7 +302,10 @@ static int xgpu_ai_mailbox_rcv_irq(struct amdgpu_device *adev,
 	switch (event) {
 		case IDH_FLR_NOTIFICATION:
 		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __FUNCTION__ );
 		break;
 		case IDH_QUERY_ALIVE:
 			xgpu_ai_mailbox_send_ack(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index a35e6d87e537..e3869067a31d 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -308,7 +308,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 		adev->gfx_timeout == MAX_SCHEDULE_TIMEOUT ||
 		adev->compute_timeout == MAX_SCHEDULE_TIMEOUT ||
 		adev->video_timeout == MAX_SCHEDULE_TIMEOUT))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_nv_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -337,7 +337,10 @@ static int xgpu_nv_mailbox_rcv_irq(struct amdgpu_device *adev,
 	switch (event) {
 	case IDH_FLR_NOTIFICATION:
 		if (amdgpu_sriov_runtime(adev))
-			schedule_work(&adev->virt.flr_work);
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __FUNCTION__ );
 		break;
 		/* READY_TO_ACCESS_GPU is fetched by kernel polling, IRQ can ignore
 		 * it byfar since that polling thread will handle it,
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
index aef9d059ae52..23e802cae2bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
@@ -521,7 +521,7 @@ static void xgpu_vi_mailbox_flr_work(struct work_struct *work)
 
 	/* Trigger recovery due to world switch failure */
 	if (amdgpu_device_should_recover_gpu(adev))
-		amdgpu_device_gpu_recover(adev, NULL);
+		amdgpu_device_gpu_recover_imp(adev, NULL);
 }
 
 static int xgpu_vi_set_mailbox_rcv_irq(struct amdgpu_device *adev,
@@ -551,7 +551,10 @@ static int xgpu_vi_mailbox_rcv_irq(struct amdgpu_device *adev,
 
 		/* only handle FLR_NOTIFY now */
 		if (!r)
-			schedule_work(&adev->virt.flr_work);
+			WARN_ONCE(!queue_work(adev->reset_domain.wq,
+					      &adev->virt.flr_work),
+				  "Failed to queue work! at %s",
+				  __FUNCTION__ );
 	}
 
 	return 0;
-- 
2.25.1

