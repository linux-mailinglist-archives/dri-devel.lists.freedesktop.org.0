Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87238AF8FB6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 12:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D0910E9D9;
	Fri,  4 Jul 2025 10:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Kl1SHi3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E6F10E205;
 Fri,  4 Jul 2025 10:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUrQMyGxbzp/6K8aziTxyr/4jar6r0E40+m54mpS8RcSIUt479skoTFhsj5rmbY+7S/NMld4GUq+nrZzjq/jzELBmnII8D47cjINLg0siuf8LzVUdldBZo0QUocl3YPZy3X+DqRlPyybiy5SN8kLzeT9GzmflA80ASighixT0pOH1kWkHY4DBkmMM3u3ns60lP49aML6Wqo+d1kLvlJclm1RM1w47EX/r0ya1RBoWmUeQGB+wZKVTnEdXawaXKs+hU6JiNzl7v+5tBRNzW/WkiG0DVlnU/hy5spxoeT5qcs2VMYZP/hcg0+Y15plvQ+hOV9BQ66MR7fUhxndr2k47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70WR1xM7vooAdxAFQ1aI8VMwDAPuSwpgKB6gTrqSqNc=;
 b=JLoEsmYpgOiXZ/5zr/GCf0m+BI11dF0k4x1LZj1KJsh187ojSUNYwxQ2RpRTp3WWXtvtUkZhsFO2BgJVf0qtTYrxoDU9RY3AqPkiVa66Wai15CXtRnJuLdr6EkrBZrepHN1KbHT/AI/jRqLNksEwgK8Uz0G/CfnWeFSB0zzVs9A8wPZgm0rfaPdr+RGcTjlMsB03j4ropWjc/CcA3BLLh5uQTYvtxM4F/6Wt7RHqw25wbPXAgW/l/84G0GgHXDO1F81BaKr/h87y6jP8ZkSttW09mcjUQcLLW+p4xtFtiSxmaJEwfS2NVRXICvLd8e4VerefpetvGIViUm9hJd1ogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70WR1xM7vooAdxAFQ1aI8VMwDAPuSwpgKB6gTrqSqNc=;
 b=Kl1SHi3dWS6q0W9ba8GyslmenZWfCWtSEyS2PCzTRSlL1gksVjRYQaLDmBUZhx0Gh9qN1N+FdrYX8aT4Z1NZlgnMRdHpmUCTXRCut9/kYPGBlPUf9WgMkmpMtxj1xUWZK1RA4dEELS+srlwBSfV4bvpgIPiprqI9xIjbcSmIGmI=
Received: from BN9PR03CA0792.namprd03.prod.outlook.com (2603:10b6:408:13f::17)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 10:14:33 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:13f:cafe::d0) by BN9PR03CA0792.outlook.office365.com
 (2603:10b6:408:13f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 10:14:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Fri, 4 Jul 2025 10:14:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:14:32 -0500
Received: from hjbog-srdc-41.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 4 Jul 2025 05:14:27 -0500
From: Samuel Zhang <guoqing.zhang@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <rafael@kernel.org>, <len.brown@intel.com>, <pavel@kernel.org>,
 <gregkh@linuxfoundation.org>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <ray.huang@amd.com>, <matthew.auld@intel.com>,
 <matthew.brost@intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>
CC: <mario.limonciello@amd.com>, <lijo.lazar@amd.com>, <victor.zhao@amd.com>, 
 <haijun.chang@amd.com>, <Qing.Ma@amd.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Samuel Zhang <guoqing.zhang@amd.com>
Subject: [PATCH v2 5/5] drm/amdgpu: do not resume device in thaw for normal
 hibernation
Date: Fri, 4 Jul 2025 18:12:33 +0800
Message-ID: <20250704101233.347506-6-guoqing.zhang@amd.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250704101233.347506-1-guoqing.zhang@amd.com>
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|DM6PR12MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9577e4-927a-4a5f-df08-08ddbae3925c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZxovNvAH8xZ9H8MUyCOdb5urn7FDqtOIpAclfeSOlnd33Y3IZXMe2ixUnAmg?=
 =?us-ascii?Q?dRVuBdrz1rIo1FThy+l4SldDL/9quk3KYDqtWhfkd4h0TCF1uegmjnw7ogOA?=
 =?us-ascii?Q?38mq5HdTiEXV5jj2dQufUFNkD5thecZXOFclEJQmIICTIgyAYijZ+VXzvwbF?=
 =?us-ascii?Q?uYWu1vB8QJQhJkIYhPu7gPGSo1Fx9+kqIPBUL7g3vwAjYHMBy7EfvAUI7Jot?=
 =?us-ascii?Q?lEXIfhgQqJ2A5yoE1P2PiO91uup665P87wa6mVotAYee5OZv295mQ+U+ZY3S?=
 =?us-ascii?Q?599zrIcoeHfLmJqy9aB2TkfpkSwaXdsvPVflAbNMPcDu9czBSC2x3Wb7n38e?=
 =?us-ascii?Q?88ahCb3CipfaeFRnSP51yhLSQUymQPPSMfN/A8+uVIWjM1vjvdS/bmD83pP4?=
 =?us-ascii?Q?Uld262BjBbOwkx2pbrOk6zhiVr5YRpwa2ZMVzNNWC04HNn7JkW5vA+z6StDc?=
 =?us-ascii?Q?irjnS2EaR4M9GfJdMuminTxWqw9wowZcZd6xDOg8sq8S1ObkrphFPc+qiAFj?=
 =?us-ascii?Q?K3OOGCbP4jKjD8xMArzzvDbNfvXLtjZsQy2Joh0HBsog5DmAX7X0cAu2X0Eo?=
 =?us-ascii?Q?SYs9vWYeRgraUD7rVYpRM0R3goSk7jtyRT8WpI/p8Jk/ULLxCV3oQ7+u7TUt?=
 =?us-ascii?Q?gMkNKd34aNUhPUuRhnXI0QRLKu0isOWCYFXfJJ7yu9UzrZuiXQ7q3yH586Or?=
 =?us-ascii?Q?RHlk4g2BwDkmcVQX6Ithy6ju93IofK3tnZiqU797GrPfNrDBJT6cHM3cKWAR?=
 =?us-ascii?Q?bWQfDpCebv/HFcenDTpiJBm9+FXaMMDO+kmpBS/j1IebDVP2CXfwv4vSgNW+?=
 =?us-ascii?Q?awZs0gtKaStgAjhU6FhNuLyZI7URpeQYn+BJuMFZey8FhGUXC0q9vrO4lnBW?=
 =?us-ascii?Q?jvSYlO+5sfwUWcytvpZtaS6nvHbp1hSfL5nu1TXhFR2QGA3Hvj51sWtspzJp?=
 =?us-ascii?Q?P3HzRaL3Ge0XRPJanCfU06mV5xLTPSLuyQcbXuPU13/+Olk7BFNATunaIrQj?=
 =?us-ascii?Q?aZ0I++IZKdy5SVQAT6x/bzSvAzMrH6fp87ELSwgUz3EiVn7+zFk+iB6uGJ/t?=
 =?us-ascii?Q?73biMveEz2pSlVSTTph0Fmf1p1+J5rIHRqUlv0S5wfarP5H40hY+dnhrL+ka?=
 =?us-ascii?Q?FawA4AJvoWYoLUDThfHCx9ibxFOk+E4JOIXkJBdd5ITxeN+szWmT+DWhX4Wn?=
 =?us-ascii?Q?urXxABK1Phc4bcm1YVZDYm44gafwsjph3eERu2NyrvkRmG7q/DYm0Z5lSeDh?=
 =?us-ascii?Q?ydIkeut/0NE47kjYYZwyk+ZTVpmfzQNVdzKO6DocsERMPwWOy9YpbqAskwIH?=
 =?us-ascii?Q?osYac4kDgB8ZUsA+8M+H6uGwzs7z5dtY0ml/OYJiKJ6QR77S+M8zpIWVCs+5?=
 =?us-ascii?Q?RzZvTbMg4/d4ctKvrP96AQ3EYcXXBOSjjBE4g49NAU0RCBNdJJ+xBGqWEs7Q?=
 =?us-ascii?Q?oN9crwzjCnm/iqCsqU7kVWWTlO8JEWAb75G2JqaXTjQuUcAnIU8h8V6TiL65?=
 =?us-ascii?Q?x7lOXp/BP6WVESfAnFV6/fphFrFiOXMVxAD0Fbqt0XDpmV3o1ENCWV/lAg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:14:33.1953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9577e4-927a-4a5f-df08-08ddbae3925c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
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

For normal hibernation, GPU do not need to be resumed in thaw since it
is not involved in writing the hibernation image. Skip resume in this
case can reduce the hibernation time.

For cancelled hibernation, GPU need to be resumed.

Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4f8632737574..e064816aae4d 100644
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
@@ -2655,6 +2659,10 @@ static int amdgpu_pmops_thaw(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
+	/* do not resume device for normal hibernation */
+	if (pm_transition.event == PM_EVENT_THAW)
+		return 0;
+
 	return amdgpu_device_resume(drm_dev, true);
 }
 
-- 
2.43.5

