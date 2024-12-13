Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B42C9F19E4
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 00:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9187B10E44D;
	Fri, 13 Dec 2024 23:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rSfgqI5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAF810F118
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 23:29:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwIDIMM5dS76vEqK7kHQULo+OTHEYD9UaQk4Ytwrj27Y/Wj0BFx2eEicxcfwuWdd+1WnacVNQfKQvXhV7mhZuWCu6ihQOhOX7UAl4yxk7ABjhiUf3YC1JFN3Ee0zWM1j4H1LoayjiwP5HlsXMutrcM9EtW3xzk1chK41tyatJnrRs94khDN2xfgh1RvJN5nvFF9YcNfUVPKgdycooaromm4AZbLI3UZA8ktaNWSnBga7vmasnJGlTDxZf43H56cMXXuw0V9XUIz2WyP95IdjGu5ejnDQzGtXqvpGL0v4tFOwk34GkbA7ZOHrV7xA3lNRjU344BmUdKEQnjgFi2ZhOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyruSVpMu8ps/yJ0DI+rseyttlx5z01bv9O+pd7K2HE=;
 b=aQzc7NEwC/Ld36SiWgbas7I8hoYj9Yo0HRYORZd5MApq5wGLOGkZzhJn6PIjLxf6Qo9aN7Vy0cI+AiYXPY/vgabtxvnlwwSXQgfwiXeFPfauAbFKPbmVHQ5mvtuozOcieVoFkmTHwlnbYnAsuVAt8yYXbKCTZCZgNHaROWpUXsBoTiY6rj0yQ8t93RriziAdJ0sMNdM869EQBwsYtJ/qZKrsoNjd2RYcvGSMnJsW3876tbaSzZl+fTc+sDALKYwDTc7+xWUDdDyHQ+0+A6EXR7CPDn6EvPjVv3w1w2GI9EcLPBdj2vaG3Oj6wY7+8NvphI0TOCZXWQBwmNUd+pC9Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyruSVpMu8ps/yJ0DI+rseyttlx5z01bv9O+pd7K2HE=;
 b=rSfgqI5JBBCRpoUZl/X0VnV6NN77YNXWRu3XW1AdftwvbfmqG4Y7gvw2OJ7EXGQj7TxmHcIjSLNvnI8WpcWn7LYL76G2yRIN48A9JBkkXNJwTjrKg40wlgXqGS15ODsyg1f1D1aZYmeJIm90nOWXPCR7KB1iEKWN/FtVzgxSTSg=
Received: from CH2PR10CA0003.namprd10.prod.outlook.com (2603:10b6:610:4c::13)
 by SJ2PR12MB7797.namprd12.prod.outlook.com (2603:10b6:a03:4c5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 23:29:55 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::71) by CH2PR10CA0003.outlook.office365.com
 (2603:10b6:610:4c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 23:29:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 23:29:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 17:29:54 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 17:29:54 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V3 5/5] accel/amdxdna: Add zero check for pad in ioctl input
 structures
Date: Fri, 13 Dec 2024 15:29:33 -0800
Message-ID: <20241213232933.1545388-6-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241213232933.1545388-1-lizhi.hou@amd.com>
References: <20241213232933.1545388-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|SJ2PR12MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a6f868-73ba-4f97-11be-08dd1bce0d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zc2wgJXBl2aItI9OmndqWG2QngGWGc8HyVeJaoShJZw2R4KjSUcX2ShejV/s?=
 =?us-ascii?Q?IPnW1DfncPVNaJI/70VHnQhxz/Sv6sP15P5hTvOye6loDaB6N7TZ62IA0Js5?=
 =?us-ascii?Q?ntHMLVhEg6+AeybViuikF+QgdAhl71+TK0TtaluGsE5iU/EH3nOJoeiZcbg0?=
 =?us-ascii?Q?Nm9vD5XRkgL4z9A83L2HTAYfdj8pXnHhcoeiwbl95Nvtup4W0rXE4r2qK5tS?=
 =?us-ascii?Q?qYx1rWU4A/HadFAqxS1+i7d8AIcAVniqBLXEt4By6Jww4fHkyL9dtvrDSqde?=
 =?us-ascii?Q?tv8mSUzIhmPbejq2VBS0b31tSx0Q01tCeVg8rcE7nMCUK+FfIPIFCp/8S95h?=
 =?us-ascii?Q?azJJkBzmxtgHl+GfxcmfuUedLI7RxyCJvVDXlfFwNS1Mhod7a6JyeXLTLUQi?=
 =?us-ascii?Q?WgJ7d0ehS2wJ55qgU9pPg+oJ67hZDQzcFMBRa/B+I8cdUOCRoSCztdvQ5GPw?=
 =?us-ascii?Q?TUBEMkA1fzRbQs8Td0LajrNgT21WT7d1A0Kv+vlMQmkk7kachzH1qZcKhJAA?=
 =?us-ascii?Q?D32tUyUnYLYawOQckgBBqvSDtlwd+5ReBHjoNDBAlmD7sD5MdEHAo4W1cGRx?=
 =?us-ascii?Q?NvZkZJvAYc1hNWqT6d1TaZF4gxNIlHWZRJCduJ69SuWpPAYnlddpXF4qOMaL?=
 =?us-ascii?Q?R8tjTM7D1EkvaEe70xcfYQpAX49/fjjd0mKoB4SVtFehDGr59niR2p3nuhxR?=
 =?us-ascii?Q?6nUYu1Ek/YNcZK3C3F4iFvwmqlPd8PEJ+R3owSZdeAhpmTJ8x2h7R3VlTxwb?=
 =?us-ascii?Q?2AWy/2ANQ0LiJcer8NbdCTRFQsQ2KizLyvr/PWkKa0IW23SVWqJvbZcwEwT9?=
 =?us-ascii?Q?HZdOaEq0S7S3AH/RAVKHtHVKwhi4SblOrQlNsTxMOiyQU1on1eg3oSxqSW6G?=
 =?us-ascii?Q?GQ7GkjBFoKGd3KKVAUvBhrx1f6ZS/GB/4s7fC/E/Xd57rUb5froibeGwf6F/?=
 =?us-ascii?Q?NHaOnE259V0rb2ghrrJE07yvonHctLED9dRyEVbRvaolWRISIzHXhuSHkq3Y?=
 =?us-ascii?Q?7n0ZWtJ/qa7wJOk/dhAJZHM8zW7K+u+E21dbO5ZSQEmH9wYEFPfx2N+4w5sY?=
 =?us-ascii?Q?flb5vP7c8WvJ5l4CdZfmkfDah3WpuCVi+RjelR9vO7skqG7Q9/UFTHtmogup?=
 =?us-ascii?Q?16kCjes2zUPcOXaZ6UoM3vjg1QaGWKfiG4m4leD2wNv3zP/Vwy0GNYLULgtk?=
 =?us-ascii?Q?nhZE13PW3CHjqBLsO/JMjkKSusubZD+srbPBMf4cUeFhglH2f4wJzXHWSbzw?=
 =?us-ascii?Q?HFygH3BBfEw0wrkK7glzmZ390HP8OWq7kjPvUa5xY/jYlVMAYcfgduNSYcZq?=
 =?us-ascii?Q?oO6vKrrccSMdb4ctBfaUk61Ia2qeAIGghyuUia8bAlGy9pe3coLUfpEisJin?=
 =?us-ascii?Q?XJCnpnmQ7F4ee/brGP6JOLqSFAxzQLsicUobvNiaXDPyQmIOPO3aym4mk6Nl?=
 =?us-ascii?Q?KImyuuxizMzhQVeU9AZ0OI622IXcPBwN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 23:29:55.1058 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a6f868-73ba-4f97-11be-08dd1bce0d03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7797
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

For input structures, it is better to check if the pad is zero.
Thus, the pad bytes might be usable in the future.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c     |  3 +++
 drivers/accel/amdxdna/aie2_message.c |  3 +++
 drivers/accel/amdxdna/amdxdna_ctx.c  |  6 ++++++
 drivers/accel/amdxdna/amdxdna_gem.c  |  2 +-
 include/uapi/drm/amdxdna_accel.h     | 11 +++++------
 5 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index cdeead75c6f5..9facf45818f9 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -690,6 +690,9 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
 	int ret;
 
 	XDNA_DBG(xdna, "Config %d CU to %s", config->num_cus, hwctx->name);
+	if (XDNA_MBZ_DBG(xdna, config->pad, sizeof(config->pad)))
+		return -EINVAL;
+
 	if (hwctx->status != HWCTX_STAT_INIT) {
 		XDNA_ERR(xdna, "Not support re-config CU");
 		return -EINVAL;
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index b2ca78cfd0a7..9e2c9a44f76a 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -395,6 +395,9 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx)
 	for (i = 0; i < hwctx->cus->num_cus; i++) {
 		struct amdxdna_cu_config *cu = &hwctx->cus->cu_configs[i];
 
+		if (XDNA_MBZ_DBG(xdna, cu->pad, sizeof(cu->pad)))
+			return -EINVAL;
+
 		gobj = drm_gem_object_lookup(hwctx->client->filp, cu->cu_bo);
 		if (!gobj) {
 			XDNA_ERR(xdna, "Lookup GEM object failed");
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index 324f35c43f6c..d11b1c83d9c3 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -243,6 +243,9 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
 	struct amdxdna_hwctx *hwctx;
 	int ret = 0, idx;
 
+	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
+		return -EINVAL;
+
 	if (!drm_dev_enter(dev, &idx))
 		return -ENODEV;
 
@@ -277,6 +280,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	void *buf;
 	u64 val;
 
+	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
+		return -EINVAL;
+
 	if (!xdna->dev_info->ops->hwctx_config)
 		return -EOPNOTSUPP;
 
diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 4dfeca306d98..606433d73236 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -552,7 +552,7 @@ int amdxdna_drm_get_bo_info_ioctl(struct drm_device *dev, void *data, struct drm
 	struct drm_gem_object *gobj;
 	int ret = 0;
 
-	if (args->ext || args->ext_flags)
+	if (args->ext || args->ext_flags || args->pad)
 		return -EINVAL;
 
 	gobj = drm_gem_object_lookup(filp, args->handle);
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index e4edb52bc27b..a706ead39082 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -87,7 +87,7 @@ struct amdxdna_drm_create_hwctx {
 /**
  * struct amdxdna_drm_destroy_hwctx - Destroy hardware context.
  * @handle: Hardware context handle.
- * @pad: Structure padding.
+ * @pad: MBZ.
  */
 struct amdxdna_drm_destroy_hwctx {
 	__u32 handle;
@@ -98,7 +98,7 @@ struct amdxdna_drm_destroy_hwctx {
  * struct amdxdna_cu_config - configuration for one CU
  * @cu_bo: CU configuration buffer bo handle.
  * @cu_func: Function of a CU.
- * @pad: Structure padding.
+ * @pad: MBZ.
  */
 struct amdxdna_cu_config {
 	__u32 cu_bo;
@@ -109,7 +109,7 @@ struct amdxdna_cu_config {
 /**
  * struct amdxdna_hwctx_param_config_cu - configuration for CUs in hardware context
  * @num_cus: Number of CUs to configure.
- * @pad: Structure padding.
+ * @pad: MBZ.
  * @cu_configs: Array of CU configurations of struct amdxdna_cu_config.
  */
 struct amdxdna_hwctx_param_config_cu {
@@ -122,7 +122,6 @@ enum amdxdna_drm_config_hwctx_param {
 	DRM_AMDXDNA_HWCTX_CONFIG_CU,
 	DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF,
 	DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF,
-	DRM_AMDXDNA_HWCTX_CONFIG_NUM
 };
 
 /**
@@ -133,7 +132,7 @@ enum amdxdna_drm_config_hwctx_param {
  * @param_val: A structure specified by the param_type struct member.
  * @param_val_size: Size of the parameter buffer pointed to by the param_val.
  *		    If param_val is not a pointer, driver can ignore this.
- * @pad: Structure padding.
+ * @pad: MBZ.
  *
  * Note: if the param_val is a pointer pointing to a buffer, the maximum size
  * of the buffer is 4KiB(PAGE_SIZE).
@@ -175,7 +174,7 @@ struct amdxdna_drm_create_bo {
  * @ext: MBZ.
  * @ext_flags: MBZ.
  * @handle: DRM buffer object handle.
- * @pad: Structure padding.
+ * @pad: MBZ.
  * @map_offset: Returned DRM fake offset for mmap().
  * @vaddr: Returned user VA of buffer. 0 in case user needs mmap().
  * @xdna_addr: Returned XDNA device virtual address.
-- 
2.34.1

