Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDAEAFE508
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 12:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E8B10E791;
	Wed,  9 Jul 2025 10:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sGpfLbPo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4ABC10E791;
 Wed,  9 Jul 2025 10:06:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmU1MxKkTzOtP4MmpakQ5auO6SfAmW4/NBKxUqhoo98Xd7doswLU1WiBGowuTQm327VBnfh9PyrQOJNMN+2rnz1qZQ9gqV0VIykr9qSvT8qmtPQTPmH7d3H/aggiOkdNHOlrdXT+GkuPTLN9np1XZFXD6lFj+XD+aXs5lmRvwC5SJyXlsaJUOEzii9Tqm8vuxAN+tY4BIkaMPR/vNPOMewqhhvtSPLe4olzjADIQnZfVUG50uZiBPNxW45Zoz4TKDLkyxYmMKaIJlGLP51yeANsOE5Asa9RvtFAM6eeeNFmkxUKKq1zr9i/GlGSVipXkvly2VqRPqtClIVl6f1dHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqRuNUr1X/c6qSZqGmFlIUjbdBiunAB0M33CLbQVPo8=;
 b=f4+tTeZaQHMQY2rnIrpvhy0sIfBmwPnqIFpB9Yt7vfC0/pCEsUiWUK7Oi63asx5QXk/lSf2ATGWn0X705lFvt8/O3Q20HnUmqaHKgpwFqct9dfsKXJQbgfAx4XklHahyyFIwcvbvxIy2NSm+Z8LAiDvvtrDRzhPB1meP8cHTBYiu4SGPb/VuRBVhcxpLKDI3UrHy7J68EQJ29lYZvpwhb+q7T6DNRZOINGGKsOnKcdbQ/CPpbG7j7JTIxwvA6zmHRHBy9xR/E9ev0R0nFiGJ2d5hf5DpvofgWn56ga7zeY2Mq+GX8T2PLp32nf9JC+vxS9T01iaJVn0pUYDFqkhwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqRuNUr1X/c6qSZqGmFlIUjbdBiunAB0M33CLbQVPo8=;
 b=sGpfLbPock9LxITZgr7zpX4L/e1DN3O3fardfbmzQmQNpij+YE07gBKltxU3d785TPLO4yMDtx+lf7khjPxP3OtQHkIwTawtouZAlDjyOIpXrYsFIvpKrNuYS5SNYmGj8QeNHHpwbiUw4/Ns7PvBtfCaRZdpUa8/pXqAgu5DccE=
Received: from SN7PR04CA0183.namprd04.prod.outlook.com (2603:10b6:806:126::8)
 by DS0PR12MB8072.namprd12.prod.outlook.com (2603:10b6:8:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 10:05:59 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::89) by SN7PR04CA0183.outlook.office365.com
 (2603:10b6:806:126::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 10:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Wed, 9 Jul 2025 10:05:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 05:05:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 05:05:58 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 05:05:53 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <Owen.Zhang2@amd.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Samuel
 Zhang" <guoqing.zhang@amd.com>
Subject: [PATCH v5 5/5] drm/amdgpu: do not resume device in thaw for normal
 hibernation
Date: Wed, 9 Jul 2025 18:05:12 +0800
Message-ID: <20250709100512.3762063-6-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709100512.3762063-1-guoqing.zhang@amd.com>
References: <20250709100512.3762063-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|DS0PR12MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ff629e-326f-4505-12a9-08ddbed03448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BC33KRkNvm1QxPyGWy1qhPzko8kkPTly/HN0Wq/5HvzrEjrgMjuRFxjFPFfb?=
 =?us-ascii?Q?ybpkNLgAWp41BGrMh4n5RD0xzLov5rFl1lR1y75ix7PaJgdmxt71uleaZRT1?=
 =?us-ascii?Q?mF/pB0j8wTanQRpI/yPU+dD/lFgfPg6bFVqdNwTyIqtrYMp11FFIwKnRRp3C?=
 =?us-ascii?Q?XT5IJBmuDA7B51Q0vEnwsQTl4Vj6EB+uvhHpBWY6zkwT3pDlu293MymI2Jhu?=
 =?us-ascii?Q?l3V5EYsurrVEUyC8wLBP2q5h99FA6POWFeB9ssKJslqhLqWZHMMYB9OYHwKV?=
 =?us-ascii?Q?hhBBeap/4MhRIZNr7YZMl9z0tG9yjxN1wrGBlIbTu57Rclu4LRKjQ6EZDGyh?=
 =?us-ascii?Q?+p8Ml7YMWVs/XwK8mr0adpYJ9MjMatF4doR/cBK4Jl0cBpUuVEs7FfyroRdY?=
 =?us-ascii?Q?5y+0mgzefLpNXsDLmfmQkQMDb3bmK4L0YNm5yvGSEIV+TTXa2CDme13a0LN2?=
 =?us-ascii?Q?MZbvX/QM5q9pVRtgWvlB/w9JlWwOOuvJZjIERezxyP5488BqFfH2pc25J1QU?=
 =?us-ascii?Q?Ro3Vt0A3thHX56/HvZ03LuPn//BVV6WKPO8NJDzSHqk8rdF7qDpd4WwDhdqo?=
 =?us-ascii?Q?q7xY3YRLl/yGmxiDgJZ5RbbYIFKAFJMgVFxHA31RH1z1gFsQIuhHfnRF8H21?=
 =?us-ascii?Q?iahBovUNdOqh7Pao0m6e64pa3wMiaIN8A9RiKRPRI2gT4ER1dm2DJeRQMhCZ?=
 =?us-ascii?Q?rvwbVYtrFFCxdof3krjG3BU+q9kMWxR3kSgt0mgSqJzZy+a/8EAzNb3DLLlA?=
 =?us-ascii?Q?sgLE37e/lLGoY85vgIYit04KTXLvPBVtG1QNooYGDfcP8tlFOjfk6KhTPw4r?=
 =?us-ascii?Q?YKqiMS+lM+Kqv98nQIumuxV/groUppzB+0Dv05RccghVGjdtbxRhjGlfHgDN?=
 =?us-ascii?Q?eFxoWQU2KykJNV7J57l3jtQWUppPgnOGoAS8jd5Sxam6EM1C6al0Tsygfl1r?=
 =?us-ascii?Q?WLGXPhlBjCPG7HLg6LVXIVVj9sSx8NNNbjxr4lDnyqDkkbSwk8TRwvG9C5F6?=
 =?us-ascii?Q?0clfg7PFvg6idUM+tEb5jvPTW6Vr9inQZvt6uBSttxAfCxlm8z8sRq7dVDaG?=
 =?us-ascii?Q?rk+N6q8RFkst+V2XkMzQhM4J+CV0V1mum1M6MPMvNt3Y3lP5nbS9J6Q9PrJB?=
 =?us-ascii?Q?jDG0SxUooSDd4nNug1uySMo3ETfUutnoh4pp1bT5bx9LaWRVqE2a++9Z34lr?=
 =?us-ascii?Q?serkDbhZLFZpOZ9F0XbyT1t11oo5bm7hIQdItThVa02fbWVqLUiCbYsrNkIK?=
 =?us-ascii?Q?08iScqlJt8W2PRocZbhlPlGul+6mnJanE8ACJzsucWQI4TVTk3JBhM6JzlI6?=
 =?us-ascii?Q?ADDXRoQlViNGTae1I7YW3BxHdlqngnS75fBn+gQ4jXVRDI1To6OYUGskxHEr?=
 =?us-ascii?Q?J9jyqi0YnBLTbg2m+9Hp9r8UUC9tj7a3IiwbJY7RtrnZP91WLYorPDHBx//7?=
 =?us-ascii?Q?A64O68518Wxk9o+e1zETD1h64m1SRgbCqj43OQ1+cbaprApp5YxbZeIQdqqh?=
 =?us-ascii?Q?C4e0a+bthLCA8esA5WEzOtLwmYSzephYkooKAqxGEP5RB0defwvF7EhUlw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 10:05:59.5358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ff629e-326f-4505-12a9-08ddbed03448
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For normal hibernation, GPU do not need to be resumed in thaw since it is
not involved in writing the hibernation image. Skip resume in this case
can reduce the hibernation time.

On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
this can save 50 minutes.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4f8632737574..b24c420983ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
 	if (amdgpu_ras_intr_triggered())
 		return;
 
+	/* device maybe not resumed here, return immediately in this case */
+	if (adev->in_s4 && adev->in_suspend)
+		return;
+
 	/* if we are running in a VM, make sure the device
 	 * torn down properly on reboot/shutdown.
 	 * unfortunately we can't detect certain
@@ -2557,6 +2561,10 @@ static int amdgpu_pmops_prepare(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 
+	/* device maybe not resumed here, return immediately in this case */
+	if (adev->in_s4 && adev->in_suspend)
+		return 0;
+
 	/* Return a positive number here so
 	 * DPM_FLAG_SMART_SUSPEND works properly
 	 */
@@ -2655,12 +2663,21 @@ static int amdgpu_pmops_thaw(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
+	/* do not resume device if it's normal hibernation */
+	if (!pm_hibernate_is_recovering())
+		return 0;
+
 	return amdgpu_device_resume(drm_dev, true);
 }
 
 static int amdgpu_pmops_poweroff(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
+
+	/* device maybe not resumed here, return immediately in this case */
+	if (adev->in_s4 && adev->in_suspend)
+		return 0;
 
 	return amdgpu_device_suspend(drm_dev, true);
 }
-- 
2.43.5

