Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01158CC0B12
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 04:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE4610E639;
	Tue, 16 Dec 2025 03:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uBNBRaFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1733810E639
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 03:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tswgln6qz+BisTY72iiTf0HhrCiIoUO2n9+apDkPBmdbaoqZtYeQ8hlIchRuRcPuGHD/5m8ii3UhsztvI2gT3qibd+pQp+cFuSg7KFw5VeMZU2WFGKZMqUKtgqTccjolE7yrPymZhk1gxOGA2IBt971S8rFp9xufaDoffs7/m+MHT9X0T1wnB6rxszAaLxAagTbG9tqa3NJtPjkBJe/8vhYX5SaD1Nt8nZK0k65up2Q2wtdRlM2cGVwIApeXiWXaoEjtvjyx4UC5R0NFgyiD9NtgO/5eiL++qVZIEqeLwE1vLyN2+m0JnG/Q1/R0TfEdUGl2n5/WYnVVgkJ0q/ldHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4Ig5RTP5qpYVC1Ac5FxianHIEOBrP7BhmxIDugNf1s=;
 b=axO0ubtfDPiq8Zbbl55qIX38p9+/lmZdQ1y3iVzo8FHD1X1NkfCyq1EagYfOol7FTs30F5/oUIlERkb4Deat+0n9z9/wrHpkeBAgcoMP0ySDGroXwlscIMbtkfef/GnE6Ss723nQDua6mAwySUBeGuTgiQZPyw/nurHpTkZbeoASd1qNN5wYmoDy0ML/nk1rPIxP+UVkl8qoVDjAUJQh4B1vu6aYapHNrwxRI52j4ll++d4LRpUmgmAFkdxDMMOek67C1F3RhxCzWbZeQpFBByktI3lCH6HVYReDU2FmKTA/uL6J+GBH1mFo4DP+VNcwcz2NE4HZFUumy4tC/mhFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4Ig5RTP5qpYVC1Ac5FxianHIEOBrP7BhmxIDugNf1s=;
 b=uBNBRaFv1a9hHaDpbiIfhe2UaQbHhNNz4FT4cPQtfClY1fMTwayl8O1XegJIhFnOpUilxMJs1lpcSeyswwONf03z1YZGVJ9fR9RmOTubJ3BzwnaeO5myY9cyy7kFQJ89Lhp+KQKcrEb7DjyTTehIMTC+7hwNw/RJHk+Xx4T6XfQ=
Received: from BY3PR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:254::34)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 03:13:14 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::d9) by BY3PR05CA0029.outlook.office365.com
 (2603:10b6:a03:254::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 03:13:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 03:13:13 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 21:13:13 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 21:13:13 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Dec 2025 19:13:12 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Remove amdxdna_flush()
Date: Mon, 15 Dec 2025 19:13:11 -0800
Message-ID: <20251216031311.2033399-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|IA1PR12MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f10109f-6132-422e-05db-08de3c510cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eQqDRK91LWTEvN2qOhc3+yrUG252T9jMoGr2tXFOzkCO5DtdY3ZEKSiG2JyW?=
 =?us-ascii?Q?msPVQUjM1/K9YCMbCQ/EhuwAdBYKKzpAIJM3C5s66c2gTq4rQao0VmDyd8Lk?=
 =?us-ascii?Q?0BHRwVDo/lbuNJKZOxvl2b+H/ZCDeoF1yimW5nAiHwqBVMY5LfjsBkoA71Gk?=
 =?us-ascii?Q?ejAU8mU/aw74umwdWvEvldCwO0XMl3rTHAw5Q2sJNH5N9xYmTJodf/D3hmuy?=
 =?us-ascii?Q?LP1lhCG7IC1CKgSWtXmfQDdJdOSsHfEzvPLwbQ9ppQXB5Cv++OhhP+njTS0N?=
 =?us-ascii?Q?RkIn0ThQMEpOSmgwks4U+aGEXkXj99SLMGbTdYflOywvMe9lvt0zIUu7PAeV?=
 =?us-ascii?Q?KF40ZeAXHqZJQq709G8jknA7tbJqqnWdAEuhrypWZdF+Ia3r29qUSfEeDV4F?=
 =?us-ascii?Q?MyyblQn9/i8wRbCB9cTxdgh/lfe9oNz8KScoVfEtn+ZiMN4S3SqnGIQEu1ew?=
 =?us-ascii?Q?qG0NVHI7DozjuuCeJu7UWAPXXFX+qU9HsqwoiYIJ1bb14Sw6WJ0jF4WxpPPG?=
 =?us-ascii?Q?lwbk1Fi+s3bfntXKZbTBD3iTPZCDpEUDP4r5oWm6bYYz7sptOz021u7oaaqS?=
 =?us-ascii?Q?UiC6aw2nogaZlNp+aLe80JU/UNR8SxB3mVV7PijiQ2j3H0Tp5ecFBtWGOSTv?=
 =?us-ascii?Q?Oa3OIpiRGBxhPEJCba1fqLP/SsKUfeCzA47E6Lmv5ueV47YE8G2yjkwyIy+J?=
 =?us-ascii?Q?mgFY6o1Iw8RmkkhzeJjbP87frxNlXgYVAHBSbQZtGgjk7vAnNW4dNjw27XWJ?=
 =?us-ascii?Q?Z48GZyzVcyEWphVy136xg3WCfyutsKqWj+hqMYPoSZuR1lMlK+JNKAeYLXOD?=
 =?us-ascii?Q?EELYTXD5Gmf/HYXoMjb3bYcWyNY2rJxymlXdGOaYR5Viw9J5/dIKyHUzmzVJ?=
 =?us-ascii?Q?SqgpTR8NZx+3T6JXfZkaVwMMgy6OoGm7nkE36UqiBwZPWDVGG+LeEp3y5gAS?=
 =?us-ascii?Q?c6HpVslKkpacIMH6z9iU8s8ML0Qr4Y1fP7pADEOX8L1OrXjpmDE6/CeoWbpj?=
 =?us-ascii?Q?cwwiuyOSL3VvB6MEfUH0H5OqvkZhsgq7GQRNxEMcCslJHeIR5ubgRDkTVu6W?=
 =?us-ascii?Q?XCs7G99nt60rgiTSKOgG9vgGhvmZMH0gDKH/4vh418ZPxhFpS4VqIWcEhN4B?=
 =?us-ascii?Q?Zi0KP9zBZEpAhlZbgFU8xJbTC2TmcfNseMvf0x/qdlA5G44+KAnFjUk4j8VC?=
 =?us-ascii?Q?ZUn85GPu47nOEulmVcTZJcvzAYHPc+TV5VodckZ70lu6nwopj7C2Os4kAZjL?=
 =?us-ascii?Q?XAJlN116Q1P++tMmlVLB0MpcmeisqTbbgVuMuN8GUXe0RQhud7APdf9HWQth?=
 =?us-ascii?Q?LLCVwsUWYfXuk4qRccAU5LWIWxJdgZi25X371RmgLx5IdBN+vg+wAoCU5KZ3?=
 =?us-ascii?Q?DvSZft7b3eln3ps22SPbZwxZlNYQB3Td0srxkyNWaRVru6TQwTB/WN8wOrNO?=
 =?us-ascii?Q?vNP8O6knAlRXsHNA8PnfrllWE05ll0nArEvh9iFPYa4qKZCYslDJ2yzSzbPX?=
 =?us-ascii?Q?FTAdfoahzziZfUMl6bFm6PnHCg9di4snjyATrscxRRr9Tl6nSnOG4/G/QOVr?=
 =?us-ascii?Q?uPgtLzxBpqnkknfqGdE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 03:13:13.9194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f10109f-6132-422e-05db-08de3c510cf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283
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

amdxdna_flush() was introduced to ensure that the device does not access
a process address space after it has been freed. However, this is no
longer necessary because the driver now increments the mm reference count
when a command is submitted and decrements it only after the command has
completed. This guarantees that the process address space remains valid
for the entire duration of command execution. Remove amdxdna_flush to
simplify the teardown path.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 29 ++++++++++---------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 1973ab67721b..fcf7e7869007 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -105,43 +105,38 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	return ret;
 }
 
-static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
+static void amdxdna_client_cleanup(struct amdxdna_client *client)
 {
-	struct amdxdna_client *client = filp->driver_priv;
-	struct amdxdna_dev *xdna = to_xdna_dev(ddev);
-
-	XDNA_DBG(xdna, "closing pid %d", client->pid);
-
+	list_del(&client->node);
+	amdxdna_hwctx_remove_all(client);
 	xa_destroy(&client->hwctx_xa);
 	cleanup_srcu_struct(&client->hwctx_srcu);
 	mutex_destroy(&client->mm_lock);
+
 	if (client->dev_heap)
 		drm_gem_object_put(to_gobj(client->dev_heap));
 
 	iommu_sva_unbind_device(client->sva);
 
-	XDNA_DBG(xdna, "pid %d closed", client->pid);
 	kfree(client);
 }
 
-static int amdxdna_flush(struct file *f, fl_owner_t id)
+static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 {
-	struct drm_file *filp = f->private_data;
 	struct amdxdna_client *client = filp->driver_priv;
-	struct amdxdna_dev *xdna = client->xdna;
+	struct amdxdna_dev *xdna = to_xdna_dev(ddev);
 	int idx;
 
-	XDNA_DBG(xdna, "PID %d flushing...", client->pid);
+	XDNA_DBG(xdna, "closing pid %d", client->pid);
+
 	if (!drm_dev_enter(&xdna->ddev, &idx))
-		return 0;
+		return;
 
 	mutex_lock(&xdna->dev_lock);
-	list_del_init(&client->node);
-	amdxdna_hwctx_remove_all(client);
+	amdxdna_client_cleanup(client);
 	mutex_unlock(&xdna->dev_lock);
 
 	drm_dev_exit(idx);
-	return 0;
 }
 
 static int amdxdna_drm_get_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
@@ -217,7 +212,6 @@ static const struct file_operations amdxdna_fops = {
 	.owner		= THIS_MODULE,
 	.open		= accel_open,
 	.release	= drm_release,
-	.flush		= amdxdna_flush,
 	.unlocked_ioctl	= drm_ioctl,
 	.compat_ioctl	= drm_compat_ioctl,
 	.poll		= drm_poll,
@@ -333,8 +327,7 @@ static void amdxdna_remove(struct pci_dev *pdev)
 	client = list_first_entry_or_null(&xdna->client_list,
 					  struct amdxdna_client, node);
 	while (client) {
-		list_del_init(&client->node);
-		amdxdna_hwctx_remove_all(client);
+		amdxdna_client_cleanup(client);
 
 		client = list_first_entry_or_null(&xdna->client_list,
 						  struct amdxdna_client, node);
-- 
2.34.1

