Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6762999C8D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED5910EA42;
	Fri, 11 Oct 2024 06:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kHO9YPi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BBB10EA4E;
 Fri, 11 Oct 2024 06:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTkRLpocD7BDSD/DycffFST3CmKz9Gn7A4NatiQeqyzC5uIn9/cFw3frjIUkaUFS9NElLiFzUuOtLUoVEqd32/0O0Zb9jHHVoJ0ixuLUYxcczJhFhlzg8Sj3Mpq3gy+PruPGfPgX03ZHqW3sv4Hvzh3dz7IjpYq4j8DlFA+ZRXfI8lfeMVjJNJl/l3E8H8J+Qwgi7RgpwMz2RlzDSlh/kinnHcqP/8j2A5bkcYYL2A+uZEkFU5qrKKjMQmn4hp2XfvPZ9Tk5vdNEWWGsXyYJOzKEVkmmMEEUvKSAb/ZKw07X7B9lrIO3FwgSoEcsNnbwXDaFPlZIEw1z+Q8dj0GH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSNn3mAsPPiQfFdQ1tThuHFsXa6lDe3vKbEBiMkSE/M=;
 b=mCI18TgdS/PTaE+EB2wz69/mPSfYnxhGAHp248AS6Bs+iZuK98grWUHTW4NVjXluC9HdO8HpNm8GPVRASU1M0SY/Y/nDdEdqTmEXhJQYtwsWF2VyGaE/yFiKhNInrTSfKC5oITHUoIO5mz72SjgAqvyqnF76baiiMkB8ddlZTz4kuA4sEVZLO6Ebw6TjR4JTypFRv0SmHUg83E+WXrmZO3s+zC2Lm4SoArmQQTCM43TfqghH5e+P9C+XvgGM0dF/i/Qd7mwQOJeGNkd2MEVsQHInTFsCaUt4z+NIfa5lEr0Q8BttoBvkKTQYfTgaquArTs2eJFeQ9GrpFXQihL11nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSNn3mAsPPiQfFdQ1tThuHFsXa6lDe3vKbEBiMkSE/M=;
 b=kHO9YPi5VsFAOBg7NjWoR7E84PPe9Q6hf1dYWfgDvj8b9l1YY59xIwrHy1XiX0U7H3u+2KOiu/z4qm4T+pywoWN2KpDlSNWj8I9hn6HVIya30cijzF1CBf+amdVAC83XAUndv2YUBHLQejBOh6lHw/57hvUANQOcafH8oabzDk0=
Received: from BN9PR03CA0664.namprd03.prod.outlook.com (2603:10b6:408:10e::9)
 by CH3PR12MB8402.namprd12.prod.outlook.com (2603:10b6:610:132::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 06:21:52 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:10e:cafe::6e) by BN9PR03CA0664.outlook.office365.com
 (2603:10b6:408:10e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19 via Frontend
 Transport; Fri, 11 Oct 2024 06:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 06:21:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 01:21:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 01:21:51 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 11 Oct 2024 01:21:44 -0500
From: <jesse.zhang@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: add the ring id schedule module parameter for
 amdgpu
Date: Fri, 11 Oct 2024 14:21:36 +0800
Message-ID: <20241011062136.1019695-2-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011062136.1019695-1-jesse.zhang@amd.com>
References: <20241011062136.1019695-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|CH3PR12MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ea0a00-c082-4c06-fe3b-08dce9bcff0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m/AihmksVOUCV5DA+xD0mtMDYvKE+cFlg/Ak/eQjnHpjObeuNP1LOnRv9QF6?=
 =?us-ascii?Q?ZC4azGKReZjHY+H0HGfvpwUtsKMox6MKNmaaDSLk3EwwG9cGVE4zDlawlKix?=
 =?us-ascii?Q?fFX9p/lrjxfuwZ21hi5LCivoUy5BKRPzKBV87dvOVQPS+qoMm07AnO9UKNGQ?=
 =?us-ascii?Q?hlKAkLrHdX+aBntf3vCfTYOx2UMbmhWaN2/NmQd4OYCx081MytwNlQf9V4kg?=
 =?us-ascii?Q?XZjJsImPNG9U+RYLUuRR0j4CsnUFEWQngp7jFYv0OtLF5FmRFbWsOszaO7ty?=
 =?us-ascii?Q?CYa03tbEtbnda36KOHRhPmmH+1EW0D/6Dqh6yydwzOzbrZWmFvU4qVCvjlJ2?=
 =?us-ascii?Q?JPEZpJJ9IhAd6UZaWo3bxHNH849TlTY8yEGtufwCoaSMsI15G8mFe3zW7t0J?=
 =?us-ascii?Q?zEsuYhN+0/8txpq4DYlvou8pGjS9rb9bFtp8lFDGDOL4o0qa2/yGsT2RzPL9?=
 =?us-ascii?Q?/QdSajkKqIzgM3/0sQOcXyaa0GCz/ArNrcd/yTA0l/vpmL3e9hJ824WuSQrJ?=
 =?us-ascii?Q?rXn9/dZmJdV2l5HdNyiQ1mE9shW3qir++/LCwtStSk2syR38WaARvGIZhCPm?=
 =?us-ascii?Q?xfxHQqM0XySPZRwRABWv2Z5jqODJNBlHhbtVK7poWyyos+pwhgRN1nd+X0ac?=
 =?us-ascii?Q?HVHPquDmzRoCGglkZHFi0voGXUDIK/hqJD5RsbH47BJTJOX9QEhlvfXwX1Fx?=
 =?us-ascii?Q?9Y0+4L8gSqAbEQC/GvDbh5ZFYy8jJgPdtfJyM9YovKfcakUBDcEFRTNDKctM?=
 =?us-ascii?Q?Dtq/J/tDsCeF+ds32iwkaBC42XMewrP0KbbFFxQ+QFznrnP5nHDgFTQiJtPM?=
 =?us-ascii?Q?1+nH1Y5fq/uuXLyRxZgOWWA/H7JcPid5zhaQ527VODzptBDuiUm56lk1oEYm?=
 =?us-ascii?Q?GQC0N3ixcQh8EMA49NycZyYN5sB+onSj53JuYB2hB3xYSBY3MVp1BqsmNGso?=
 =?us-ascii?Q?1DSMNvjUgrd5r+CCXYgWTxHMzILrnrBMYG5LoGdDGfmI5c4XHiBut9fLO/14?=
 =?us-ascii?Q?n5PMuOLoESSVtu0Joayuod/RwB7FFovHj9lVM1Fyf7XSqDvrEi/8x+WC5fiu?=
 =?us-ascii?Q?3NdXpcY1viYlbBouCeRA5Fs/pnaB5RIRpU8oRR+XzEyWh3/MKxztWN0kakg9?=
 =?us-ascii?Q?GF1sHp7TM4vlsu6ljeX5pyaxkYBkA5ocX6sVWzUnNsgxnm2FU+50nM9HOf6U?=
 =?us-ascii?Q?gmxYIRhMJC5XxR4f7IQoExcbfYRIX0ZfTnlG578zYg/dTBWRMSLKYwa1baN4?=
 =?us-ascii?Q?jbjzlH2edQ3jlEG4/gxLpmnL5n8uAPZk7L7zXxBLuUTfwDa7Q2zARBszSwc8?=
 =?us-ascii?Q?O2pn77uw06ArI8OH7tWekpDma/S0t8xBncL6Nj4fk66/076hQHwqcg9zNaqL?=
 =?us-ascii?Q?9/Niqf3KhC6+ROrT8/7sm8KlDqcO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 06:21:52.1242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ea0a00-c082-4c06-fe3b-08dce9bcff0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8402
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

From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>

Added ring id schedule to switch scheduling policy when cs submits.
Schedule the ring by setting the ring id.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 9 +++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 48c9b9b06905..3fd3e4eeab47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -227,6 +227,7 @@ extern int amdgpu_noretry;
 extern int amdgpu_force_asic_type;
 extern int amdgpu_smartshift_bias;
 extern int amdgpu_use_xgmi_p2p;
+extern int amdgpu_ring_id_schedule;
 extern int amdgpu_mtype_local;
 extern bool enforce_isolation;
 #ifdef CONFIG_HSA_AMD
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 18887128a973..33658bef5513 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1276,6 +1276,7 @@ static void amdgpu_cs_post_dependencies(struct amdgpu_cs_parser *p)
 static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 			    union drm_amdgpu_cs *cs)
 {
+	struct drm_amdgpu_cs_chunk_ib *chunk_ib = p->chunks[0].kdata;
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
 	struct amdgpu_job *leader = p->gang_leader;
 	struct amdgpu_bo_list_entry *e;
@@ -1285,8 +1286,12 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	uint64_t seq;
 	int r;
 
-	for (i = 0; i < p->gang_size; ++i)
-		drm_sched_job_arm(&p->jobs[i]->base, -1);
+	for (i = 0; i < p->gang_size; ++i) {
+		if (amdgpu_ring_id_schedule)
+			drm_sched_job_arm(&p->jobs[i]->base, chunk_ib->ring);
+		else
+			drm_sched_job_arm(&p->jobs[i]->base, -1);
+	}
 
 	for (i = 0; i < p->gang_size; ++i) {
 		struct dma_fence *fence;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 680e44fdee6e..55fba9e93a8b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -221,6 +221,7 @@ int amdgpu_reset_method = -1; /* auto */
 int amdgpu_num_kcq = -1;
 int amdgpu_smartshift_bias;
 int amdgpu_use_xgmi_p2p = 1;
+int amdgpu_ring_id_schedule = 0;
 int amdgpu_vcnfw_log;
 int amdgpu_sg_display = -1; /* auto */
 int amdgpu_user_partt_mode = AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
@@ -740,6 +741,13 @@ MODULE_PARM_DESC(use_xgmi_p2p,
 	"Enable XGMI P2P interface (0 = disable; 1 = enable (default))");
 module_param_named(use_xgmi_p2p, amdgpu_use_xgmi_p2p, int, 0444);
 
+/**
+ * DOC: ring_id_schedule (int)
+ * Enables/disables ring id schedule interface (0 = disable, 1 = enable, -1 auto (default))
+ */
+MODULE_PARM_DESC(ring_id_schedule,
+	"Enable ring id schedule interface(0 = disable, 1 = enable, -1 auto (default))");
+module_param_named(ring_id_schedule, amdgpu_ring_id_schedule, int, 0644);
 
 #ifdef CONFIG_HSA_AMD
 /**
-- 
2.25.1

