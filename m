Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4C39E46F2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3C210ED57;
	Wed,  4 Dec 2024 21:38:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NJA+kJFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083F810ED5C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 21:38:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFufAWqzoBlcto2raa78dv2uIBsEJMig8M/m3Wmad5/J2Lebu/I+4QZCwc69ZOI/GU1SyRpJj+4Jed4neBXYZdxXzHo5MwT3nbCyq7v9j8KRj8BXxCY1+6qbVjuvCuUEvmACN7Cf4fbDvz+wA3JItLfw2s3FAkZbx8c+lH/toO+DUO0EsHeoKQN4g2B8UWpz5+FlqDDqBWcdxCeuj1XsrQhxHabY4aBbNkrmCJKNBiIVQkr6tYzSDxJ8eaNmHyUCPnAEjzH+dwRtRElQN7Ilc24gAh8lxncAUaoAXfbsBHc8i/JA1RMSxAjd47KP3pYJ5ft8t6sR1k/bsGfdMqQJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MAEkych0gZM+G1VVu4YwSSh2TQGOrnn9U5H/xW2Lvw=;
 b=b84B/04YvQnqiXPMA/VDTtO1VuE7dwUAM2JlELcxQWkChH0Le2DAxA9wnLdSBZ9Iazcm7wELhTCwV6GRscT6jfe+Egr/zqtUIKHgcGQC/ksWE3KcKV17WTotrQWBoOyGGbzKAUMlUesiT+UMdQSt9GMEhIVy4CfS8C9HGOZoi2alPmVuvinWnMEY1ZDgPMQbZGS/VPei/ILgK0vSAeBBqXn7mNHWuwIuk06UhkYn5gsKtCm1GqgULdIcgt1fJJlACpmcsRcTZ4ghSNlhvtdG2sLnFihwBXJ4wEdiC6gijJTZ2WCw6yduSo0vnC/qwBROIFO6BJK+EmaK1dCPneCpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MAEkych0gZM+G1VVu4YwSSh2TQGOrnn9U5H/xW2Lvw=;
 b=NJA+kJFlWmANKP57OKtjdrdX9K89pR1jAP1zwQ/167iYHy4JAxsa/oyVEId4LWuaUgdmkPVUykML5dQgMl3US+4F/LvheZPvWTrghch0bST8z7m6AYcYxUn+ujCe6qz2pLD9NzEqp5OsD6WMh6dHvFSh5fu37bT7/EjT3T3Rp0c=
Received: from CH0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:610:cd::15)
 by IA1PR12MB7544.namprd12.prod.outlook.com (2603:10b6:208:42c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 21:38:42 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::a9) by CH0PR03CA0100.outlook.office365.com
 (2603:10b6:610:cd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Wed, 4
 Dec 2024 21:38:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 21:38:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 15:38:41 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Dec 2024 15:38:40 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1 4/7] accel/amdxdna: Replace idr api with xarray
Date: Wed, 4 Dec 2024 13:37:26 -0800
Message-ID: <20241204213729.3113941-5-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204213729.3113941-1-lizhi.hou@amd.com>
References: <20241204213729.3113941-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|IA1PR12MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 098074fc-6baf-4c20-4c62-08dd14ac05da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DMPl8x8efJ8eayxLk3r6o5KtSbAWLwGBsUrL5bJXFgxW7I7PoJ2T9WTTAr8a?=
 =?us-ascii?Q?LF8hTZmwg5Ytc6vNRz0UCG+syzuhnoWojRTEXwNDvgwv175XGgBLuCPQjndU?=
 =?us-ascii?Q?8l6u62COJJ2Td5+WItRDzApYNzTBL/Px7555+LJ4Vi/HQaTbi/ZmBRWs/NO3?=
 =?us-ascii?Q?L6OVQn1Xp+K7ONpo0EPlc5uS4vMGBW0BdUnP/QbP+7evUKydhluhHrAjK3IZ?=
 =?us-ascii?Q?ZCrkJbSuyMTD/SEqbZOuEINQAUxvabxjiejRTLjtnFaSXSNN0VD28qS1Dh8r?=
 =?us-ascii?Q?TWwnMxuZ7N/gtNqi7H90zPMiLCl4yAQedQkp2G8tvbNTEIvj8TPYuIDedJw6?=
 =?us-ascii?Q?hK82lWJf+35xOUmscLXo2HqI1jQ+CzW6J2ZrjCTYnoMnmGwpSAEack5iCrhK?=
 =?us-ascii?Q?19FzHhjpVDeu4092BEoykZPu0k7EaTRJwcz7wbO1oNvVKm9r0G9+xxhwg2T4?=
 =?us-ascii?Q?1RGuu6hvApwScNlV+QzMfD13Lfa6bCDOgNzAEH8cJGC8l0n+L2JGfpxuPTVR?=
 =?us-ascii?Q?jyfcnev8hBhM7omgJ/N3CkO/xDinzqBF5Aj73izOZ+HYlc2L22HZZd6UEa+z?=
 =?us-ascii?Q?jlE973w+zD0I+ssPvfmRhjP10T6rradkqQ5Dn5mkZCTTTyttKtIGWAF5dRaH?=
 =?us-ascii?Q?MLTKkRdA1rR55ia8Q1tOCODBUh1TUjNLzr0oWnJWMLtLfe/tTgqG7hUPv/1S?=
 =?us-ascii?Q?qSMYRwN+fK0sGZ9hBFHNAR83OMVCtQMUgJAj8prqNd4ACpotyyRHv5gSV6Za?=
 =?us-ascii?Q?/wQhYuORqZXu+wL2ZCKZYCbRKMV3HssoGNMoYlweiC3mpcNh5Rc533Hwhwqw?=
 =?us-ascii?Q?rzGAhYdIexfJPsnaTqTaGierRr8Zb5v1A/tMA3+80xk5QEi7DDDxy+2U4skK?=
 =?us-ascii?Q?Xuz4/fDPF0JOCzbFrcTy+oJBJypCjzjPcU4W7rtCYsYOYbwJ+34Ci/mA2igd?=
 =?us-ascii?Q?Y8wZHk7iTuhhI3PuLpD5ayhYAWE66kYD0ZS5zMr6pN5VHehRofjfbXFdZ+SD?=
 =?us-ascii?Q?2rieWE7MtdXQa94ZhX2JmWlV0uHQ80gVtOXgff50fYJZn01YVnYFm1gIFe/H?=
 =?us-ascii?Q?ysmTdA0ODY19xERBeg9sg/E6uh+TINUGUkSfdefPTCE1xA5CSjbJ95hg8UOW?=
 =?us-ascii?Q?QG5wvwqZjqZpsHcUGnTnOYH3h9keNGnSLye+l82HoB+oXhmgqh8wFb8Rdrfo?=
 =?us-ascii?Q?zfyOWTOO0iIFcHxSzJlgBIkmKsdJXkDRR+2NjUH4mlH1jZ0gs+5ohcX7mM6J?=
 =?us-ascii?Q?Fw3wXw0wMa+xu3rAlhKaUqz+OOM5WeAQBbo24IC4Evs6VZpGubPT4HVJc5p3?=
 =?us-ascii?Q?B8fJG+8eb0u0O4JGyuu36NIBz01OEKst/cu46xFeIUCRXyaO/klSUTjd655y?=
 =?us-ascii?Q?IFMtsnCMR89o4fL1kRf8kfCwNfXZqFSSYVmv4Q3t501stVRGZAldEgOGSdLa?=
 =?us-ascii?Q?DxmrHwUUeik=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:38:42.0820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 098074fc-6baf-4c20-4c62-08dd14ac05da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7544
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

Switch mailbox message id and hardware context id management over from
the idr api to the xarray api.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/TODO              |  1 -
 drivers/accel/amdxdna/aie2_ctx.c        |  4 +-
 drivers/accel/amdxdna/aie2_message.c    |  4 +-
 drivers/accel/amdxdna/aie2_pci.c        |  5 +--
 drivers/accel/amdxdna/amdxdna_ctx.c     | 46 ++++++++-------------
 drivers/accel/amdxdna/amdxdna_mailbox.c | 55 ++++++++++---------------
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  4 +-
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  6 ++-
 8 files changed, 53 insertions(+), 72 deletions(-)

diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
index a130259f5f70..de4e1dbc8868 100644
--- a/drivers/accel/amdxdna/TODO
+++ b/drivers/accel/amdxdna/TODO
@@ -1,4 +1,3 @@
-- Replace idr with xa
 - Add import and export BO support
 - Add debugfs support
 - Add debug BO support
diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index b5282555bbf2..07eecb40767f 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -90,11 +90,11 @@ void aie2_restart_ctx(struct amdxdna_client *client)
 {
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_hwctx *hwctx;
-	int next = 0;
+	unsigned long hwctx_id;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 	mutex_lock(&client->hwctx_lock);
-	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
 		if (hwctx->status != HWCTX_STAT_STOP)
 			continue;
 
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index c01a1d957b56..fc33a158d223 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -315,10 +315,10 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 	struct amdxdna_dev *xdna = ndev->xdna;
 	struct amdxdna_client *client;
 	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 	dma_addr_t dma_addr;
 	u32 aie_bitmap = 0;
 	u8 *buff_addr;
-	int next = 0;
 	int ret, idx;
 
 	buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
@@ -329,7 +329,7 @@ int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user *buf,
 	/* Go through each hardware context and mark the AIE columns that are active */
 	list_for_each_entry(client, &xdna->client_list, node) {
 		idx = srcu_read_lock(&client->hwctx_srcu);
-		idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+		amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
 			aie_bitmap |= amdxdna_hwctx_col_map(hwctx);
 		srcu_read_unlock(&client->hwctx_srcu, idx);
 	}
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 19c76b2b204b..1c8170325837 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -674,11 +674,11 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
 	struct amdxdna_drm_query_hwctx *tmp;
 	struct amdxdna_client *tmp_client;
 	struct amdxdna_hwctx *hwctx;
+	unsigned long hwctx_id;
 	bool overflow = false;
 	u32 req_bytes = 0;
 	u32 hw_i = 0;
 	int ret = 0;
-	int next;
 	int idx;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
@@ -690,8 +690,7 @@ static int aie2_get_hwctx_status(struct amdxdna_client *client,
 	buf = u64_to_user_ptr(args->buffer);
 	list_for_each_entry(tmp_client, &xdna->client_list, node) {
 		idx = srcu_read_lock(&tmp_client->hwctx_srcu);
-		next = 0;
-		idr_for_each_entry_continue(&tmp_client->hwctx_idr, hwctx, next) {
+		amdxdna_for_each_hwctx(tmp_client, hwctx_id, hwctx) {
 			req_bytes += sizeof(*tmp);
 			if (args->buffer_size < req_bytes) {
 				/* Continue iterating to get the required size */
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 5478b631b73f..64fc59b20a24 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -63,11 +63,11 @@ void amdxdna_hwctx_suspend(struct amdxdna_client *client)
 {
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_hwctx *hwctx;
-	int next = 0;
+	unsigned long hwctx_id;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 	mutex_lock(&client->hwctx_lock);
-	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
 		xdna->dev_info->ops->hwctx_suspend(hwctx);
 	mutex_unlock(&client->hwctx_lock);
 }
@@ -76,11 +76,11 @@ void amdxdna_hwctx_resume(struct amdxdna_client *client)
 {
 	struct amdxdna_dev *xdna = client->xdna;
 	struct amdxdna_hwctx *hwctx;
-	int next = 0;
+	unsigned long hwctx_id;
 
 	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
 	mutex_lock(&client->hwctx_lock);
-	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next)
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx)
 		xdna->dev_info->ops->hwctx_resume(hwctx);
 	mutex_unlock(&client->hwctx_lock);
 }
@@ -149,13 +149,13 @@ int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
 void amdxdna_hwctx_remove_all(struct amdxdna_client *client)
 {
 	struct amdxdna_hwctx *hwctx;
-	int next = 0;
+	unsigned long hwctx_id;
 
 	mutex_lock(&client->hwctx_lock);
-	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
+	amdxdna_for_each_hwctx(client, hwctx_id, hwctx) {
 		XDNA_DBG(client->xdna, "PID %d close HW context %d",
 			 client->pid, hwctx->id);
-		idr_remove(&client->hwctx_idr, hwctx->id);
+		xa_erase(&client->hwctx_xa, hwctx->id);
 		mutex_unlock(&client->hwctx_lock);
 		amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
 		mutex_lock(&client->hwctx_lock);
@@ -194,15 +194,13 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	hwctx->num_tiles = args->num_tiles;
 	hwctx->mem_size = args->mem_size;
 	hwctx->max_opc = args->max_opc;
-	mutex_lock(&client->hwctx_lock);
-	ret = idr_alloc_cyclic(&client->hwctx_idr, hwctx, 0, MAX_HWCTX_ID, GFP_KERNEL);
+	ret = xa_alloc_cyclic(&client->hwctx_xa, &hwctx->id, hwctx,
+			      XA_LIMIT(AMDXDNA_INVALID_CTX_HANDLE + 1, MAX_HWCTX_ID),
+			      &client->next_hwctxid, GFP_KERNEL);
 	if (ret < 0) {
-		mutex_unlock(&client->hwctx_lock);
 		XDNA_ERR(xdna, "Allocate hwctx ID failed, ret %d", ret);
 		goto free_hwctx;
 	}
-	hwctx->id = ret;
-	mutex_unlock(&client->hwctx_lock);
 
 	hwctx->name = kasprintf(GFP_KERNEL, "hwctx.%d.%d", client->pid, hwctx->id);
 	if (!hwctx->name) {
@@ -228,9 +226,7 @@ int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 free_name:
 	kfree(hwctx->name);
 rm_id:
-	mutex_lock(&client->hwctx_lock);
-	idr_remove(&client->hwctx_idr, hwctx->id);
-	mutex_unlock(&client->hwctx_lock);
+	xa_erase(&client->hwctx_xa, hwctx->id);
 free_hwctx:
 	kfree(hwctx);
 exit:
@@ -249,24 +245,18 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
 	if (!drm_dev_enter(dev, &idx))
 		return -ENODEV;
 
-	/*
-	 * Use hwctx_lock to achieve exclusion with other hwctx writers,
-	 * SRCU to synchronize with exec/wait command ioctls.
-	 *
-	 * The pushed jobs are handled by DRM scheduler during destroy.
-	 */
-	mutex_lock(&client->hwctx_lock);
-	hwctx = idr_find(&client->hwctx_idr, args->handle);
+	hwctx = xa_erase(&client->hwctx_xa, args->handle);
 	if (!hwctx) {
-		mutex_unlock(&client->hwctx_lock);
 		ret = -EINVAL;
 		XDNA_DBG(xdna, "PID %d HW context %d not exist",
 			 client->pid, args->handle);
 		goto out;
 	}
-	idr_remove(&client->hwctx_idr, hwctx->id);
-	mutex_unlock(&client->hwctx_lock);
 
+	/*
+	 * The pushed jobs are handled by DRM scheduler during destroy.
+	 * SRCU to synchronize with exec command ioctls.
+	 */
 	amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
 
 	XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, args->handle);
@@ -324,7 +314,7 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 
 	mutex_lock(&xdna->dev_lock);
 	idx = srcu_read_lock(&client->hwctx_srcu);
-	hwctx = idr_find(&client->hwctx_idr, args->handle);
+	hwctx = xa_load(&client->hwctx_xa, args->handle);
 	if (!hwctx) {
 		XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
 		ret = -EINVAL;
@@ -436,7 +426,7 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
 	}
 
 	idx = srcu_read_lock(&client->hwctx_srcu);
-	hwctx = idr_find(&client->hwctx_idr, hwctx_hdl);
+	hwctx = xa_load(&client->hwctx_xa, hwctx_hdl);
 	if (!hwctx) {
 		XDNA_DBG(xdna, "PID %d failed to get hwctx %d",
 			 client->pid, hwctx_hdl);
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index eab79dbb8b25..fe684f463b94 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -54,8 +54,8 @@ struct mailbox_channel {
 	struct xdna_mailbox_chann_res	res[CHAN_RES_NUM];
 	int				msix_irq;
 	u32				iohub_int_addr;
-	struct idr			chan_idr;
-	spinlock_t			chan_idr_lock; /* protect chan_idr */
+	struct xarray			chan_xa;
+	u32				next_msgid;
 	u32				x2i_tail;
 
 	/* Received msg related fields */
@@ -164,19 +164,17 @@ static inline int mailbox_validate_msgid(int msg_id)
 
 static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, struct mailbox_msg *mb_msg)
 {
-	unsigned long flags;
-	int msg_id;
+	u32 msg_id;
+	int ret;
 
-	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
-	msg_id = idr_alloc_cyclic(&mb_chann->chan_idr, mb_msg, 0,
-				  MAX_MSG_ID_ENTRIES, GFP_NOWAIT);
-	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
-	if (msg_id < 0)
-		return msg_id;
+	ret = xa_alloc_cyclic_irq(&mb_chann->chan_xa, &msg_id, mb_msg,
+				  XA_LIMIT(0, MAX_MSG_ID_ENTRIES - 1),
+				  &mb_chann->next_msgid, GFP_NOWAIT);
+	if (ret < 0)
+		return ret;
 
 	/*
-	 * The IDR becomes less efficient when dealing with larger IDs.
-	 * Thus, add MAGIC_VAL to the higher bits.
+	 * Add MAGIC_VAL to the higher bits.
 	 */
 	msg_id |= MAGIC_VAL;
 	return msg_id;
@@ -184,25 +182,17 @@ static int mailbox_acquire_msgid(struct mailbox_channel *mb_chann, struct mailbo
 
 static void mailbox_release_msgid(struct mailbox_channel *mb_chann, int msg_id)
 {
-	unsigned long flags;
-
 	msg_id &= ~MAGIC_VAL_MASK;
-	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
-	idr_remove(&mb_chann->chan_idr, msg_id);
-	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
+	xa_erase_irq(&mb_chann->chan_xa, msg_id);
 }
 
-static int mailbox_release_msg(int id, void *p, void *data)
+static void mailbox_release_msg(struct mailbox_channel *mb_chann,
+				struct mailbox_msg *mb_msg)
 {
-	struct mailbox_channel *mb_chann = data;
-	struct mailbox_msg *mb_msg = p;
-
 	MB_DBG(mb_chann, "msg_id 0x%x msg opcode 0x%x",
 	       mb_msg->pkg.header.id, mb_msg->pkg.header.opcode);
 	mb_msg->notify_cb(mb_msg->handle, NULL, 0);
 	kfree(mb_msg);
-
-	return 0;
 }
 
 static int
@@ -254,7 +244,6 @@ mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *heade
 		 void *data)
 {
 	struct mailbox_msg *mb_msg;
-	unsigned long flags;
 	int msg_id;
 	int ret;
 
@@ -265,15 +254,11 @@ mailbox_get_resp(struct mailbox_channel *mb_chann, struct xdna_msg_header *heade
 	}
 
 	msg_id &= ~MAGIC_VAL_MASK;
-	spin_lock_irqsave(&mb_chann->chan_idr_lock, flags);
-	mb_msg = idr_find(&mb_chann->chan_idr, msg_id);
+	mb_msg = xa_erase_irq(&mb_chann->chan_xa, msg_id);
 	if (!mb_msg) {
 		MB_ERR(mb_chann, "Cannot find msg 0x%x", msg_id);
-		spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
 		return -EINVAL;
 	}
-	idr_remove(&mb_chann->chan_idr, msg_id);
-	spin_unlock_irqrestore(&mb_chann->chan_idr_lock, flags);
 
 	MB_DBG(mb_chann, "opcode 0x%x size %d id 0x%x",
 	       header->opcode, header->total_size, header->id);
@@ -497,8 +482,7 @@ xdna_mailbox_create_channel(struct mailbox *mb,
 	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
 	memcpy(&mb_chann->res[CHAN_RES_I2X], i2x, sizeof(*i2x));
 
-	spin_lock_init(&mb_chann->chan_idr_lock);
-	idr_init(&mb_chann->chan_idr);
+	xa_init_flags(&mb_chann->chan_xa, XA_FLAGS_ALLOC | XA_FLAGS_LOCK_IRQ);
 	mb_chann->x2i_tail = mailbox_get_tailptr(mb_chann, CHAN_RES_X2I);
 	mb_chann->i2x_head = mailbox_get_headptr(mb_chann, CHAN_RES_I2X);
 
@@ -530,13 +514,18 @@ xdna_mailbox_create_channel(struct mailbox *mb,
 
 int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
 {
+	struct mailbox_msg *mb_msg;
+	unsigned long msg_id;
+
 	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
 	free_irq(mb_chann->msix_irq, mb_chann);
 	destroy_workqueue(mb_chann->work_q);
 	/* We can clean up and release resources */
 
-	idr_for_each(&mb_chann->chan_idr, mailbox_release_msg, mb_chann);
-	idr_destroy(&mb_chann->chan_idr);
+	xa_for_each(&mb_chann->chan_xa, msg_id, mb_msg)
+		mailbox_release_msg(mb_chann, mb_msg);
+
+	xa_destroy(&mb_chann->chan_xa);
 
 	MB_DBG(mb_chann, "Mailbox channel destroyed, irq: %d", mb_chann->msix_irq);
 	kfree(mb_chann);
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 02533732d4ca..c3541796d189 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -77,7 +77,7 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 	}
 	mutex_init(&client->hwctx_lock);
 	init_srcu_struct(&client->hwctx_srcu);
-	idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1);
+	xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
 	mutex_init(&client->mm_lock);
 
 	mutex_lock(&xdna->dev_lock);
@@ -108,7 +108,7 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
 
 	XDNA_DBG(xdna, "closing pid %d", client->pid);
 
-	idr_destroy(&client->hwctx_idr);
+	xa_destroy(&client->hwctx_xa);
 	cleanup_srcu_struct(&client->hwctx_srcu);
 	mutex_destroy(&client->hwctx_lock);
 	mutex_destroy(&client->mm_lock);
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index c50d65a050ad..f5b830fb14bb 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -100,7 +100,8 @@ struct amdxdna_client {
 	struct mutex			hwctx_lock; /* protect hwctx */
 	/* do NOT wait this srcu when hwctx_lock is held */
 	struct srcu_struct		hwctx_srcu;
-	struct idr			hwctx_idr;
+	struct xarray			hwctx_xa;
+	u32				next_hwctxid;
 	struct amdxdna_dev		*xdna;
 	struct drm_file			*filp;
 
@@ -111,6 +112,9 @@ struct amdxdna_client {
 	int				pasid;
 };
 
+#define amdxdna_for_each_hwctx(client, hwctx_id, entry)		\
+	xa_for_each(&(client)->hwctx_xa, hwctx_id, entry)
+
 /* Add device info below */
 extern const struct amdxdna_dev_info dev_npu1_info;
 extern const struct amdxdna_dev_info dev_npu2_info;
-- 
2.34.1

