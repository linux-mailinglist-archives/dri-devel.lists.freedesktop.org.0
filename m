Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E5AFC4A1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D147210E5BC;
	Tue,  8 Jul 2025 07:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="blTlIFQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAADE10E5BB;
 Tue,  8 Jul 2025 07:51:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1bzYsxgjf004ur+BaEM8y+ebjPsGIiPtUMFE4TBUlb2E+dFXEoAaVnz45FSpp8Vg/hiPM0DennlZYS02cVWB6RZlkcs4ckKbX77wM1Q2s4vNPlKmRLxOi4vImuDyCCcX0MCBGwvhOEBbTovxY0jEQMkTF5mABjbk282JoKaeOe4RMHAO3yqTGhKFUxOLwyjTNN6hbGvCssmTDFFwSLrBQXJm3YERJ4OdH+uYF8bhMlxKYhRNPP8DIdLLeWoXCw0nMyAMz9orqBEq7PHWrGmDc/PqnzrTx4WS55FM2bsI7IaRIuxYR/TKYKEAHxDeDUQhhaTv2w7Dry8qMWx804ZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+z59hz6hvs10vCN8K6MNPh2EIOQdQt1+J3Ggl8NyT8=;
 b=y15mqYJlZZkbDXT14N9ww0HA0q3lupCLG9tiIFUsdlBKWB6CWAG1S0rihlR8ESO1gvsgt/8uRfM5+xe04tScH+rlSa3D82+N1VI+wp+aHFo7NHOyXFY5hu2AP7GA7xZ7C+3xGjus3fj0AP9q7umv1f6QlE8d8N88r6wkT15ZsGmuKikYsNUauS2J0S67JPdPe0dzt/FWWJq7yjJru7+PM2K5At6yrVFnX2G88J3w6I6+usvlwz58mgqeOIsaaijz0Nuj1lYokkX56rUBT3eOkUQNsN/t0PdcwwgnoCEyxaUSCXJoZc7HP1yZSJ6iZT0tyg8eqbVgDGvOMQYr25CDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+z59hz6hvs10vCN8K6MNPh2EIOQdQt1+J3Ggl8NyT8=;
 b=blTlIFQwSHF4YE1NKJKThVZp3BgeML2txtBvN8M0Svkv34bvaZRJiqsVhgvqXVVVfYCA4TBsacuEoKvCs2uj8Cl49BN+btgtE1h6Qw2V3Z82YvCysj5pWpqXNZImZqhLfJ3XjXhiT7Gu2tw/RL8TM/Z1pnEhJnvX+aMqCmK93Cg=
Received: from DM6PR05CA0048.namprd05.prod.outlook.com (2603:10b6:5:335::17)
 by SN7PR12MB8004.namprd12.prod.outlook.com (2603:10b6:806:341::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Tue, 8 Jul
 2025 07:51:51 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::f7) by DM6PR05CA0048.outlook.office365.com
 (2603:10b6:5:335::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Tue,
 8 Jul 2025 07:51:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 07:51:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:51:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 02:51:50 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 02:51:45 -0500
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
Subject: [PATCH v3 5/5] drm/amdgpu: do not resume device in thaw for normal
 hibernation
Date: Tue, 8 Jul 2025 15:42:48 +0800
Message-ID: <20250708074248.1674924-6-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250708074248.1674924-1-guoqing.zhang@amd.com>
References: <20250708074248.1674924-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SN7PR12MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 92375cc1-0d12-4f22-1f23-08ddbdf44ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IHzt+vfbzcf2D8pp5okWaiqqvXeYSjuaJrn32sQFQlF0Px+1m8eKznMHQF6i?=
 =?us-ascii?Q?5AkYZJJhq9ykjq67NDNEky/9xED0SSva8+GFtN9yiZxUh4VCKYvQGNPnMJWS?=
 =?us-ascii?Q?zrW9T4YnRmU4kpbV2hPcxyzJQMuDsgtu6pSW05Rikz5MhuIJWE8eCQ6z2AFO?=
 =?us-ascii?Q?g9pkFD1pNb7k0Fonu3cxcp9hyFaaHM2Qg6xcAwukp5HhFxV98pMSDrnYJ6yF?=
 =?us-ascii?Q?VLlv1q6Zw66Gc9KTNhodOOqr9vT4vNBOSMJQ4aRaGr2B/7WvBGXZDQLBfp7U?=
 =?us-ascii?Q?PZDyD9LGb+k7rWkkAvkN7jXhpPU9idlcWW+J+3WZWN/sXj+sJUBWd31zHvQ0?=
 =?us-ascii?Q?t5rvrSXzRYQM3VdOAcfOFqNGO90uIX7X95aHT8XUTQ/SDSu8EDOYlJTa63H7?=
 =?us-ascii?Q?0h5++4lyweWobgQCP652dIecUD7aVXQsj+8/CNzKEYuc65GX5GAZtisqdA8D?=
 =?us-ascii?Q?MDtZxXMPotaWWQfn0nQIU/XuW9cBO8xlvKA6wq/uEHa1rwMzqVP55A6kDxid?=
 =?us-ascii?Q?8CeKaUrIAzW7MxFdvRF609b5Wbuh7c+XXI3q7+u0C0NfN8g7mp8fmQRHqw1a?=
 =?us-ascii?Q?Dkt16OZKpCYVEruBus5F9fHInYO6NA8Yj++9ayqypcvqLgaIri9m7o/IvmCn?=
 =?us-ascii?Q?E0yTOdShxdw4EcexuSX7tzlpHPaBpCqV2KcBsZ4EFGX14cKcw7pPj9VerLIH?=
 =?us-ascii?Q?fYuuQCz8fwEypX6ayk19U0L9FMLtagHQLHiFJMfifGbkHRS7Ff4KJgRDQUz8?=
 =?us-ascii?Q?hyaJtd6usM5+zNBusp/rtOROMBWwHMrfKg5hhqgElL3hxaYyJgLG4lHs/K2b?=
 =?us-ascii?Q?tCCtphoW5Zq4KjZyh0kHD0p3S2bMevH0JhBgfFd08DuBeZcdl5ILgLImeESo?=
 =?us-ascii?Q?Q5bDkhU4rBf/UCEfKDIP6sm+sZZeMj0+JJM0O8+OVEYsm7azmcO03U96XN39?=
 =?us-ascii?Q?+D8jNS4gBuhBkBQIvNwbNuXOEUJJ631+p8uCTqBzPjDgN8R57fyTX2u9SEDi?=
 =?us-ascii?Q?GokN4Z4U3/yHiTO6ZIIZK7rtp6Yziw6g2+MhZvdr03WQYhlsE9OKkbd4eTDW?=
 =?us-ascii?Q?T8wQZ2uZ+FeZuRUzvI6OcMNgIl4H91fo1eGU0IJQgPTc760RcfRIi1mgGoSL?=
 =?us-ascii?Q?slcSOzL6zHkbWfWGMD91Mqcek7P3U09ztoxEJ2BUgVZfXDh4kNjALU0qkjiO?=
 =?us-ascii?Q?jVNxIWvqaTWyR8gA//JQGUZmVifyDKsEFVHK1moXbzYVXMOMyihptn/ktA3E?=
 =?us-ascii?Q?+sRME1u+L5cHOvzRhshZ+jEma4kQk2wJ+ZF2v51spkVnP1yskAt7wSV+a08q?=
 =?us-ascii?Q?T4MxpQlkFUS2tLJ9yVLu0gnZwghIroSmykwcE0QLm5BndwmUl7supaPPNkfG?=
 =?us-ascii?Q?tOeRm2DYQv25lffivzYSWH3Glmwaz1Kce5TDYgoOFw3k9H+4OHzxWER+PWaE?=
 =?us-ascii?Q?fNJIBV/fsEU0i623beHEXGcz+6Qt+/l+tC39RwM1mx6tc8y6Dot8B7SbKkAZ?=
 =?us-ascii?Q?1uJvHkyBzLekv0std230cpiAhfanMwqZKA/Gp0QeHHZRnCyCSBH/xmCcxA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 07:51:51.5486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92375cc1-0d12-4f22-1f23-08ddbdf44ce6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8004
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4f8632737574..10827becf855 100644
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
@@ -2654,8 +2658,17 @@ static int amdgpu_pmops_freeze(struct device *dev)
 static int amdgpu_pmops_thaw(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	int event = pm_transition_event();
 
-	return amdgpu_device_resume(drm_dev, true);
+	switch (event) {
+	case PM_EVENT_THAW: /* normal case */
+		return 0;
+	case PM_EVENT_RECOVER: /* error case */
+		return amdgpu_device_resume(drm_dev, true);
+	default:
+		pr_err("unknown pm_transition_event %d\n", event);
+		return -EOPNOTSUPP;
+	}
 }
 
 static int amdgpu_pmops_poweroff(struct device *dev)
-- 
2.43.5

