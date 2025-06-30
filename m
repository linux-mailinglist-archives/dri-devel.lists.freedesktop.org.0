Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF8DAEDA1D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 12:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B79410E405;
	Mon, 30 Jun 2025 10:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1AMjU8Is";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2066.outbound.protection.outlook.com [40.107.101.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1524E10E406;
 Mon, 30 Jun 2025 10:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BobdrmNHzpqrFHeuditosSFG3q3sumCCdBmGPvQX6Jbe5nHGb3rDzGTBjSDSn04LeY2O7j+BIbW0dIXLEXpWQLN4uhoLXH/apdZtSDy1NCeT7KPPXnBpMvrq6bMHY4VLUJ1j9en+oMO7w13VzU6HxuYtPiJf4bonhPOp9gvI5tE++/zvHUHJNh3MUcr77zEUSW8lI/1UwE7XQ+/LgKLBWkE8bbOp97qrKeVgzhlkfxF5Mf2Y32bHW0XTmxK4jC+CGJSxfxOyOvrdFvsj+JZeMBc3kKg1s+n94uOP9Rvw6KZdn30l8zsag+wyv5URWsL0C+TGtc/7K3piG6eV6B/Q4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4L7Ww+hhD42gc5GQN0DToyDYofS1ZmQRzIw0dKVfFs=;
 b=gxeXYmQgA5TRkcW337vl5d5benkhZVn4d/d3Tz1+hg6vVqz8wpJYQf8j8+ARpFcrqQLSRL4kv+Dzz9YZKzDTcgAqIZr6YKw+TQwf/ztU7ZyHzPMHHIDrpe4GZpMVClyhsN7Dn5WqusrSe3RjWkbB3vEC5q81t8Pt3gSZEey3Z45/YlwudzK1CC7qdlJzB9KIFwxYxxEhlinwOHw2ekbD9S/2uk9eh+JmA8Bih3XZfWOhWCntxneterkAbTna835eN81zwlMsrSFcO7PCL+1RbLCsCtNVWwOlD4YwNp7utuvrIfD/hq3BsJfLkNsfXAfWcwc8iJkIM+wYeb1am9XkAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4L7Ww+hhD42gc5GQN0DToyDYofS1ZmQRzIw0dKVfFs=;
 b=1AMjU8Isl/gg5wj3SZVvVuOZhrAr7sGH0koOCkro0j9loMc+JtTtHDD0M6z/6rt0TwQ+KZUSBGGRkaZYD+GLFwkN5BA/T6AvyiKE1nmR9GirO2YJEo6IPP7N8vDBYJ1tJPCmlCKwadyFGjnRb57B3EecG78+qWeobH4wi5xK3xs=
Received: from SJ0PR03CA0270.namprd03.prod.outlook.com (2603:10b6:a03:3a0::35)
 by SJ5PPF000ACABD1.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::984) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 30 Jun
 2025 10:41:44 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::e0) by SJ0PR03CA0270.outlook.office365.com
 (2603:10b6:a03:3a0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Mon,
 30 Jun 2025 10:41:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 10:41:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Jun
 2025 05:41:37 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Jun 2025 05:41:34 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <mario.limonciello@amd.com>, <lijo.lazar@amd.com>
CC: <victor.zhao@amd.com>, <haijun.chang@amd.com>, <Qing.Ma@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Samuel Zhang
 <guoqing.zhang@amd.com>
Subject: [PATCH 3/3] drm/amdgpu: skip kfd resume_process for dev_pm_ops.thaw()
Date: Mon, 30 Jun 2025 18:41:16 +0800
Message-ID: <20250630104116.3050306-4-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250630104116.3050306-1-guoqing.zhang@amd.com>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|SJ5PPF000ACABD1:EE_
X-MS-Office365-Filtering-Correlation-Id: e379d11f-4fb9-49aa-d7f3-08ddb7c2b4d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HY6ZSg9aOegnZWnSOd/13F/BBalC7+jgn+CZeIVwmWXYHgMOaxYd4E6Lug6S?=
 =?us-ascii?Q?SVQhi0IRrWKI01PSMUz1Wp874LvMITNjjp+X/BgOl4BZLjSUkCd7384aj22w?=
 =?us-ascii?Q?yN7o1168iy5bomZdF4Rh4ASAGeiUcmuMvk1h+jGXkBddjTtRfBN0qNSA15T0?=
 =?us-ascii?Q?0eBWEo+WbmUr4JW/bx2oOCGH2ZsvQ8wr6/7FGZrnwIjFdWGnj9Je3Sdcofy3?=
 =?us-ascii?Q?I8CJ58Ct0khRMbq6e2HMBNBOS2teKOB1CfyjlSZoJN7dzTpb4d8HeovV/9gi?=
 =?us-ascii?Q?3e9o5Ev3eF/TRyMCfW2F1fZrv00c+xL8MXSfYl0jF2+AxnYl6TqLFeB+oLTV?=
 =?us-ascii?Q?8TW3waArgP9SC4wtWncBLLzgJb9BNzkOYV22x2onHnltZT09RqGV2Tx4i3Nm?=
 =?us-ascii?Q?Ri43TxM/G/jUKQKMIHlk6ywKx1+dfsuJdELj1VYg+y8JnFATCL/qnO2bXXHa?=
 =?us-ascii?Q?lNcXZhI9JyycuawzicDb6g2iZgOhsAqEeFqrh2Q0n5JT5K0S++/Rpoz6rLRy?=
 =?us-ascii?Q?eFxfayXbbUt5IPCN4bzAXh0FEd7MiRPnVYIjUpLCG7orJZZCiLElmC5zGih8?=
 =?us-ascii?Q?VvB7cKon2kVHflf9nKSkZXm1qNmW/3rsC/4hcUpb0JvM3ix5ncySlP0IhsqJ?=
 =?us-ascii?Q?pzy0bRtqheee0wmBWWuGhiKKETG2raUrNvJuXZ3uI2eCmSLXPHyJD3swK9bP?=
 =?us-ascii?Q?QDR++BBLkuH/g57sEOcdcTdH+IxgtqM7Rcvd3lWgH0hQ+JOkWvJyCT/ajfiW?=
 =?us-ascii?Q?y5yCzN/goY7iKJeYdYGc6AvctRrbjexEEUjHAb3OTFYTrECCtPelejVYevGz?=
 =?us-ascii?Q?H8uIkQ9Qbu38yaw8iKbk68KHsWgYKu6OGWfstjEHdradzxS9sjH8J59XwLUJ?=
 =?us-ascii?Q?kaW/P2oKhIcGRM+iASYFDuMJKFoNOk4E/PJlsao/3isxLRpWKa+97i0amjPW?=
 =?us-ascii?Q?jjqbYTVoxolAZHOemaLS1ab3MmQyjeCt1/o+SJpFVVj2vz0avxwz1jqqXdHF?=
 =?us-ascii?Q?uusdRUPP5+wggLCMDlRhzmd0JvbmH8vYG/UjiM8bCjhV3xkJvpEJYCDqHwzg?=
 =?us-ascii?Q?2EJoFLsqR1ebtT9ugVVDeSMJH02n+fn+MGDDG4+PulqcQECPf0SWX3wDtbwi?=
 =?us-ascii?Q?mdYnPV1/qGo8/LJtnFdCc4IsRGlR5oBM4dCD9gzaWkl0lqPAHsL+AE47Viyb?=
 =?us-ascii?Q?wj0qeGj6kXzj0GWIRgag3rcvXcpOJk/Qf5GEiMx8HyRaFys/dUakC7qUHSfY?=
 =?us-ascii?Q?Y9XyJc8oQn2Q6h8y0jhTndM1M8+TRHUqkPL+l7H2H9vTU+9lhAbXoxx+Bhf0?=
 =?us-ascii?Q?IKsfiHBXDWGHXVLB69EjvioTFsViMRr1LRbGlT4x/uDwXZr36WUmHaDNr6Vt?=
 =?us-ascii?Q?6UBvaclpKW/mgk8jJGF/SeHoJrtJ7XNbUejaywXtUHVf50FCOTuBIP+lLPP4?=
 =?us-ascii?Q?SYLseOZeyOCIwdKy6C0itii7nly48vSHG8qFaWBoaW+zva+XYn+RBWGI/ytA?=
 =?us-ascii?Q?231NgTEvCBxchDgAsk4QAtq9gJXfAou3PG1G?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 10:41:44.0826 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e379d11f-4fb9-49aa-d7f3-08ddb7c2b4d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF000ACABD1
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

The hibernation successful workflow:
- prepare: evict VRAM and swapout GTT BOs
- freeze
- create the hibernation image in system memory
- thaw: swapin and restore BOs
- complete
- write hibernation image to disk
- amdgpu_pci_shutdown
- goto S5, turn off the system.

During prepare stage of hibernation, VRAM and GTT BOs will be swapout to
shmem. Then in thaw stage, all BOs will be swapin and restored.

On server with 192GB VRAM * 8 dGPUs and 1.7TB system memory,
the swapin and restore BOs takes too long (50 minutes) and it is not
necessary since the follow-up stages does not use GPU.

This patch is to skip BOs restore during thaw to reduce the hibernation
time.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a8f4697deb1b..b550d07190a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5328,7 +5328,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 		amdgpu_virt_init_data_exchange(adev);
 		amdgpu_virt_release_full_gpu(adev, true);
 
-		if (!adev->in_s0ix && !r && !adev->in_runpm)
+		if (!adev->in_s0ix && !r && !adev->in_runpm && !adev->in_s4)
 			r = amdgpu_amdkfd_resume_process(adev);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 571b70da4562..23b76e8ac2fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2734,7 +2734,9 @@ static int amdgpu_pmops_poweroff(struct device *dev)
 static int amdgpu_pmops_restore(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 
+	adev->in_s4 = false;
 	return amdgpu_device_resume(drm_dev, true);
 }
 
-- 
2.43.5

