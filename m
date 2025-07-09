Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261B2AFE042
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 08:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762D210E739;
	Wed,  9 Jul 2025 06:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OzZfvsUX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5FB10E72F;
 Wed,  9 Jul 2025 06:44:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8sbCT5KDFruxdLAWCWXSHOpPniNoRxc2jNjUGSARXfcj7Jee/ub9k3+vIzOzitTAd3BzxE/2wQGOHlFzz+2hRa1pQk50ETe/ZtzsbAZmBduRpx8JTZjDNgFs0MjwGNiqfVXdDLKpd+2uBYR6aIZwLL+FCV/fFhJ6F7keRujUXZ41ZxZqqf/dnKhKQcjzvG95RvZ3GN0ZXYwmzZnI59N0szgWQDt+7Hs+aX6DQfIiPuvAVVFwvtFdB7fUDGMfWPnEXWbact1/mGxUYKKOShjLUMtNagAdpUt1OPcBk5OL/y3qey39IfViGGM/iX7RsoHf0A5Yvnj0uoKfbkD77Z1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkJLoTId2FA37bRFRZ2PSUtBrJasZON80ybgzxWyU40=;
 b=EhuoZJd4SkJhUyXhuvpT3S0A9ca22gEAKZ8wYxNDBpDJCSdZTXEc1wcY/xDLiFczmnc3pVIQKn4KEtjJLA/Ixc1/xP5zhQlOQHIhY+nPQXOj2gc/fgZLqP9/fWpYYPRkW3ywQagjuXDW74xszFVOqXYGElnWn48cmr7Ex0LkazT0w9jfwZjlXU0KemwII1kqFkkri7xdyecGj+2mMvXcwIxFY5j5/IRRu50i22HYtXO5m2/k0666YMm1HsheSsH56eazqMa8GNaQIDCVlYYj12DQzqYAbAz8P2+pt9DiIplNTaY+OdY5koai1TeFGEH8XtiBMstKEpICufrLSIlmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkJLoTId2FA37bRFRZ2PSUtBrJasZON80ybgzxWyU40=;
 b=OzZfvsUXl0EjimMRQAug4DybKT2AL1/qrvs1A9QK6Su9tmd2QyE6/98MlngoUXQNr6IJbFgTEsee1pYrL497agqNH9QL1H5afRBHHbj9SFQnkSlPt5s3yVizLe7K70qz3PPJcOzR7YglBxZQHLyI/QL6tDfMpJ5HnlfaISNghko=
Received: from BN9PR03CA0177.namprd03.prod.outlook.com (2603:10b6:408:f4::32)
 by DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.28; Wed, 9 Jul 2025 06:44:46 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:f4:cafe::f9) by BN9PR03CA0177.outlook.office365.com
 (2603:10b6:408:f4::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 06:44:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 06:44:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 01:44:45 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 01:44:40 -0500
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
Subject: [PATCH v4 5/5] drm/amdgpu: do not resume device in thaw for normal
 hibernation
Date: Wed, 9 Jul 2025 14:44:04 +0800
Message-ID: <20250709064404.839975-6-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250709064404.839975-1-guoqing.zhang@amd.com>
References: <20250709064404.839975-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: guoqing.zhang@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DM4PR12MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ad93f4-f0ee-4285-52db-08ddbeb41814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eccAdfrHFvW+kc3UgIkS/8aY0Y+vXHOn42BQe1oiq/J+kCNPmcCtDIMYuztJ?=
 =?us-ascii?Q?hCZN8ejboFzWRZAy+FHUVIO0+K9Sg7mBjshIA7fLmdfgLfmNjmTLUKz1aSaA?=
 =?us-ascii?Q?v/K89RLKDAlQgLKfxVHzJJkrGpmDJBYsUc168Euyyy0TnkfSmWA5+gHLQi33?=
 =?us-ascii?Q?rLIgnrH7tHfYNW4QaDGBI/xI/nFan7GWlTikUiE+nuCpZC5zf7AMTkpKL3nH?=
 =?us-ascii?Q?95R8Lk+GSPD+P0mbhzuSwCZJRbiitjps7HDWZ4kK4KPmrmjWWI7FqXhDET5X?=
 =?us-ascii?Q?RTr7YJtQQNZa6yOcQZUe2/A3cjyr7aggjgam8JMVJC8CMNyrnclxsky4lEFy?=
 =?us-ascii?Q?c0Onb0DGfjPTpRp5UuJb9o1g/EoFn4MUet7ECrWUos3K7OlMwSn5wmIIYqjj?=
 =?us-ascii?Q?IFV6vwUYpC2QjDKc5Gv/Z1L+CqtpELkKzysxNtfzVO9ehIk6be5zTVqp9huE?=
 =?us-ascii?Q?4E9ud5hLHU3NrUY9IPTRHjQMYxlys29bsHvI/BzlM1CrWlrQ1qkA60gJYPq2?=
 =?us-ascii?Q?f2UlqgLK279nDA/NxJWYf0D2+OByVU/yWeVQHU3++/38Ywsx/oF7nk7ZSzmP?=
 =?us-ascii?Q?Gs7CE/4L/YTX7cp6zpa7PM7RwYRMXC9ubbOyA/1AVU2M/En7JEEwxAi0c5zU?=
 =?us-ascii?Q?KV1qdFzK88c56j8laRJpQls0Hd49g5zCr3YFTQe39VabN/1EwDdo5tF1meor?=
 =?us-ascii?Q?67VR8yPCt+XKpbfmj4i2k1EhrR6fbr4NMNvUeXvNLzAvZlDQ01VSVJuKulHi?=
 =?us-ascii?Q?VzZ4qzo6J+F16291D7fyQH8Kt8FMRoyCirQFXzy3JRq6VrT57vvKJZegGA5W?=
 =?us-ascii?Q?onA2ir0tcibO0O/f0ylfXS5k+5AwbLLrO3VwJ7ZHWae01mwiQP4y6Q4bwXdH?=
 =?us-ascii?Q?Q+oEmxzmyYm2C1jKG5SedDRL6ix8fHoVuFMPuCbg1O1RLJJIKYv2COxSiLjI?=
 =?us-ascii?Q?qUkUvYccDB6dbMYQ6nMj/xsj9oZgDYhTBxEWM6iZu5DyyAySD4a3tetg7C/v?=
 =?us-ascii?Q?N2GgwbNssjbslrz17GhxYjA8aXAgvyRmtB1pM12JUi1s71Ymcx4iePZQrtcp?=
 =?us-ascii?Q?JEdM+0xYrvw6pxglAwuGKxNk9mcFu1LDIziG8QiT+GOeGiwXrmsAQ6A17CU9?=
 =?us-ascii?Q?8DcpxDEFHjiQtCRNP9NMMBN4uBrU0i2faS17bjx7UM6MQJqUneMxVLG+PtLx?=
 =?us-ascii?Q?YlLRbFF7OwJS7JcssiLzNPjVCV50LAIKXX7AvbZ+BZKRiQvVJE7U9AxWQAAZ?=
 =?us-ascii?Q?btb8sibJh0SfH1m8zRDzmAwXlHrpKQy+ToWle/AZg8pnyJxPhGkMg17s11qq?=
 =?us-ascii?Q?uccuHfTUShFCyITKQ7qBMFNn7T9xyW6c4sOMElMojLVDJJTdvJGBopA6atPk?=
 =?us-ascii?Q?5q7O2ifrSK5ay1siCswxEkEA98rWidksC2y18yQZx3j2iamLhimTc4sbOa/i?=
 =?us-ascii?Q?Tvtb9IOP8S9Ar9Qsc3N/nH9U/ztroO/oSMn+08iAVlJTgG6wMH9/hGSK0PJc?=
 =?us-ascii?Q?CNsjUHTK/zKq+zJE03a02sPdpyNJdovDRGwKgHWJy+9zdxEk8G4k9e3Y3A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 06:44:46.3428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ad93f4-f0ee-4285-52db-08ddbeb41814
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9072
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
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4f8632737574..c37285a8b2c5 100644
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
+		dev_err(dev, "unknown pm_transition_event %d\n", event);
+		return -EOPNOTSUPP;
+	}
 }
 
 static int amdgpu_pmops_poweroff(struct device *dev)
-- 
2.43.5

