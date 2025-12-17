Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEF0CC902E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 18:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF82310E8C6;
	Wed, 17 Dec 2025 17:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vAG661mt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010004.outbound.protection.outlook.com
 [40.93.198.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF70210E8C6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 17:17:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rjmw18Z0SKCsS0SlWBA2FAySNRKZgd1ukdVm0+z0Xmc5oc6dy3jo1gOTw/DBzuh+biNFfndzcYcaDpoOO5sYobsm0r9ZE3C+llE7/E3Poa7hctZyaVk5hh6q61DCWVGObGGV9n9snEssfKXSidXZDvsQUvCliszwJlhFcEsMu+QPh5hqf/L5jIl5G4DujPfxK9fRkk2d7Spi+uPezMvWkJko7xx2LPNwfS8Xhc3Kirb9qjMXXFAcVpVyfA9DiGrY4BFx71Enl3y7Vjf+n/Y46l/0Bt2bAwK+G499+Dn2MiaTXmkis5wcqZ2v/LWKn7yL2yNTJ4pykeuOypxsi3dtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnouRlE30TQIPjcMY+pyHR+SB12WrQlfeFSshuVHdfw=;
 b=P5kVx9pcUVQbtSqyYejOSPOQgbhras+NptBb6BShZf+ExDFsYI0wPZzaaK4k+34MI6ZiZWbp53HQSrZA60SKCgavOdu9d45SZIVQ874qYdGuA/8129uZTdhfcEV831MvypH29uU090i/L7ck5FOoIFfwxhwZKc/Khz8SL2k+UM4dBDUlnFJxBUuTzmvy0gATkPPyyLtY9VLhAh2TOr5zF+Qs5ByUDBlxzJjuQ/b4R5+4sbE1YqgAB+L1fleBEfIcuroI3cmtG47aSepJy7w8vNrgCADmQCkiTIfXTIS7yQZlL50Bnz9gdzfgFB0Yx2b81jNXR5W69p44yYJxNuotrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnouRlE30TQIPjcMY+pyHR+SB12WrQlfeFSshuVHdfw=;
 b=vAG661mtRYllXg7rxoCybhTag+uQB1ctMKG3yZxqjQZwjK9M15iJDA9j4eqEx8jlg6rToa2HjJPFB7N7hfjKih1hX9GB+15IAcUnhD/Fan2NboJ91xGGmgokMFS2h9Imietb4EdXsf66MzKMm/AB4j4td0s5jQJdbjPnz15/PIs=
Received: from BN9PR03CA0372.namprd03.prod.outlook.com (2603:10b6:408:f7::17)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 17:17:26 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::e3) by BN9PR03CA0372.outlook.office365.com
 (2603:10b6:408:f7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 17:17:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 17:17:26 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 11:17:26 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 11:17:25 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Enable hardware context priority
Date: Wed, 17 Dec 2025 09:17:19 -0800
Message-ID: <20251217171719.2139025-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: ca878813-4905-466f-2ec8-08de3d90269c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DOMm0NQsRTjl9Ds3vyn/c0nRFHyNntlje4SpHTbhgTK6UTjeSjH9hNrkXNYS?=
 =?us-ascii?Q?9s+H4EwkEZsLeGIgG7xjlNEvEMW6U00SB4NhfvHJcfiXyHnnPkWreRUbjU0B?=
 =?us-ascii?Q?xo0Ioj5jkGnwXKZvONqixAqvhcPWefGhmBPBrqO5G2eLSQ5nQRXGKmIc2A0p?=
 =?us-ascii?Q?2Phhbds43mNPDN7Q4EtdHVDCZuV8F1bCo//ckzaDBXevnoCLJmfJfh5/SWfB?=
 =?us-ascii?Q?KKLC/zU74suHA/IlnYXXj4Y7SG21JqdFtJofOgALYuPLhvDPsIk2v0CAk5J4?=
 =?us-ascii?Q?yK4wmNUXstBqytEJ2swlNYRrTlGE0/8WP5QW0yVEYiBlI7NkzUoWyJ9VckiT?=
 =?us-ascii?Q?To1V2jXxbE3pZjRhlBZHgfd8AT+nMVwQZROT1kz405dhpKhbraK/M06CAr1B?=
 =?us-ascii?Q?/UIyvQvTrWr/8YbYOX5iUPlfnt4CCmNux6kXrILnqIN/wOI2Ttk60q0O11HN?=
 =?us-ascii?Q?xE9sx67o5Kj0yYdHBchfOmDcTktQGAFAO+MyXbc7Y+uT12KBzzWfWjqZeKc/?=
 =?us-ascii?Q?52mV/v562VHZWne04TgRNopG2TL6kFAsMJ7E6RY/DgFW9l1IZ7li7AI/vCYH?=
 =?us-ascii?Q?fYkOkS1LQoYa9fjzcLaLhvoHxVkfJzMkeaa5fGtJjKg+EJvXu/3pKsu2gZhL?=
 =?us-ascii?Q?PqvtOSVGotLRyOBwKmnR9Cd3HX+HpUDmBwhDcrhrKEFK8Bldr73FEb2yPZZN?=
 =?us-ascii?Q?FMIdl8/FWI5lwK0RtnOrgDPNIbVvlQJQdh4ETBbe2o8vgwwcTemd3c9sijnm?=
 =?us-ascii?Q?Tpj7XgpUBnjfahsFQzxuN4/o/8+aS60l1Pm4y4KVp9FdEVXvR8pTGV1HH3t6?=
 =?us-ascii?Q?3ldVq3EqoZhpw8Rjgqu+yEj/Xvw987K7oKdKN6QZ8zI1Xm8EU7sf/yA08Jyw?=
 =?us-ascii?Q?QtZINCjxLDFRHhGmkObCsIK0msPV5qfnP9BHQIZDOvQlcO7nBXbiS71QiFvE?=
 =?us-ascii?Q?NPma5ei5pppj0h/Oa19MwPpryzIoHsbwG2DrBrIZL0Ha/6SLV+NGgnH9jPh3?=
 =?us-ascii?Q?mQ3n9y2cZ7YLyOU8dmcO2EvGlDuOJLovo6oXGS/aNTvQmqdNAgjxqpZ9svVS?=
 =?us-ascii?Q?LHFIL1RxMS1qrj28nLRRsgMobCnF2iKGSSITSbOIeRApn1EVT3G7dEmWzq4w?=
 =?us-ascii?Q?S06FDPW0c+5CNCeAGfiHdgQ0YJi92/c/7IGnzq2CrusXtBjrEMyMFqikH2uI?=
 =?us-ascii?Q?ASmd+wrwVNV82ZLweGydFSGKRbbYPcmrC+iK5Yj8Ek9xncTs2GB0fUyviCeF?=
 =?us-ascii?Q?a5Bo9v/f+lQbwv/R4oROrkcqwiKLScQaWOUeE8LeMODycHre/TIrKZMujM24?=
 =?us-ascii?Q?TPeklv6zZU8ceVgMyMtBP0lFXMgnuZOcwHc76/qohAp1q3odQCrH2dPP8xVB?=
 =?us-ascii?Q?SHi9oahFtUk2m43fq4YpYbAjRPHH86EN/ewVFfWFVRQcZWEo8/fSi9SEZPyk?=
 =?us-ascii?Q?SJK6ywSIm3ExnyW9AW4gGvFhyJ3mTNayirw69SKL6pf/+Lzt4ZNKXj5dSQec?=
 =?us-ascii?Q?FUqEV1K/AyGnVRPqmkSLzs0dqvo73ETnIza2Y5fgBP8KUf3nn/5tZjA2veAs?=
 =?us-ascii?Q?diLjTMeF1PsmmHhiAHM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:17:26.5192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca878813-4905-466f-2ec8-08de3d90269c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
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

Newer firmware supports hardware context priority. Set the priority based
on application input.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c  | 23 ++++++++++++++++++++++-
 drivers/accel/amdxdna/aie2_msg_priv.h |  5 +++++
 include/uapi/drm/amdxdna_accel.h      |  8 ++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index e77a353cadc5..051f4ceaabae 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -205,6 +205,27 @@ static int aie2_destroy_context_req(struct amdxdna_dev_hdl *ndev, u32 id)
 
 	return ret;
 }
+
+static u32 aie2_get_context_priority(struct amdxdna_dev_hdl *ndev,
+				     struct amdxdna_hwctx *hwctx)
+{
+	if (!AIE2_FEATURE_ON(ndev, AIE2_PREEMPT))
+		return PRIORITY_HIGH;
+
+	switch (hwctx->qos.priority) {
+	case AMDXDNA_QOS_REALTIME_PRIORITY:
+		return PRIORITY_REALTIME;
+	case AMDXDNA_QOS_HIGH_PRIORITY:
+		return PRIORITY_HIGH;
+	case AMDXDNA_QOS_NORMAL_PRIORITY:
+		return PRIORITY_NORMAL;
+	case AMDXDNA_QOS_LOW_PRIORITY:
+		return PRIORITY_LOW;
+	default:
+		return PRIORITY_HIGH;
+	}
+}
+
 int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
 {
 	DECLARE_AIE2_MSG(create_ctx, MSG_OP_CREATE_CONTEXT);
@@ -221,7 +242,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 	req.num_unused_col = hwctx->num_unused_col;
 	req.num_cq_pairs_requested = 1;
 	req.pasid = hwctx->client->pasid;
-	req.context_priority = 2;
+	req.context_priority = aie2_get_context_priority(ndev, hwctx);
 
 	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
 	if (ret)
diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
index cc912b7899ce..728ef56f7f0a 100644
--- a/drivers/accel/amdxdna/aie2_msg_priv.h
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -108,6 +108,11 @@ struct cq_pair {
 	struct cq_info i2x_q;
 };
 
+#define PRIORITY_REALTIME	1
+#define PRIORITY_HIGH		2
+#define PRIORITY_NORMAL		3
+#define PRIORITY_LOW		4
+
 struct create_ctx_req {
 	__u32	aie_type;
 	__u8	start_col;
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index 62c917fd4f7b..9c44db2b3dcd 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -19,6 +19,14 @@ extern "C" {
 #define AMDXDNA_INVALID_BO_HANDLE	0
 #define AMDXDNA_INVALID_FENCE_HANDLE	0
 
+/*
+ * Define hardware context priority
+ */
+#define AMDXDNA_QOS_REALTIME_PRIORITY	0x100
+#define AMDXDNA_QOS_HIGH_PRIORITY	0x180
+#define AMDXDNA_QOS_NORMAL_PRIORITY	0x200
+#define AMDXDNA_QOS_LOW_PRIORITY	0x280
+
 enum amdxdna_device_type {
 	AMDXDNA_DEV_TYPE_UNKNOWN = -1,
 	AMDXDNA_DEV_TYPE_KMQ,
-- 
2.34.1

