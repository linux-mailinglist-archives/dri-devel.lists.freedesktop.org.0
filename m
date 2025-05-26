Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563D3AC3F2E
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0C810E300;
	Mon, 26 May 2025 12:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o19xyrgd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6B010E2F8;
 Mon, 26 May 2025 12:15:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMonylrFgKFOhE/9rR9BsPPscCX7bK8BBKA4d8fEOrYzJyW4fP8jMwJOunhqmYLZzX9ShmQss3prsKL3C9ofW1KpMuwXJh/Sdf3ej4uSxTygtL1lR+kXE77nUukf6/FzvSXUeNh9/p0kF32icG3pzFzNyj1Ld7+YI+bPjaK95brdBe6rfrGIJUxkMsiBrfFQ1YQ/STlV1mcJ+NvsQQt075ci9lBfhKGy6shBTr0DUIbKxy468tJhFpg++P8+G4+ztUTLKqgRjjD9nlgmOMVwRgkcKODL5fdc4TpxSYfJ/JbTJwq5vosGLz30SMB/oA1pWUD11x185l2hvojqFotxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVpFIT8sUsT9L9lka83Ezude++APrXZWnmfj5i5hORM=;
 b=p638lSpfpK8WvTBeDFpTn3CrQbh0ccyBSRp4CQ7p5XOGxtUXiVZbDHuJwztY5uGOQ1YLg4GfRJ0JHa6P2DpinCqOydQ3vZfcW4U8AWtyUFlR+EkXsjuKad+eo+15Fn6GwclK/9NPhKcW8hylE7LJ2gNF6yJ2t89PczcvaTIhN3mTjZv7keFXZkCUMHCEbrMit0d4f/blBDkmYuyaFjzJ4PBphGQiDL6sgTAZfxC1RYztwzb6WXEukJkGh9rvELhjzIm/+vpjoS17w7kTGQ1IEP6BIBvt5yWtfaR/LAGekJBfkJmQ09EpGH7ZWZ/Dqu527s5zUYCJcVhX0ZCQgBFwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVpFIT8sUsT9L9lka83Ezude++APrXZWnmfj5i5hORM=;
 b=o19xyrgddn7K2it2C5K0N5LgYqLlzaHexOBABsE5E/T4ci99fHH9m3VOxeGE9cLBMH33Lq46Vok/JBArHek6m0bjtLrgkZvRWfGeTRLsUkeVtfLvTXnHd8eGTRso+f3fwT7YI28MpVhqzT7KXTwayyEBgWmY1HfwXG2hhV4h7D3+VVw/gv6fsBIoJroVygLeKQvgjOW5iXp+DzhZbGRVbVrK3tUNmmVWBh+VXsio4gaEVHKfZcW4AXSC8lMrMkUVMKpckC8aQwnyaGajR0XTaIyzg6OeiGB3Tu3eduZcABXOIutCqH0FTCxPrPQ249YMFsdKIZ1xq7rWoP2M0Ui+Zg==
Received: from BY3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:254::9)
 by CY8PR12MB7539.namprd12.prod.outlook.com (2603:10b6:930:96::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 12:15:43 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::ac) by BY3PR05CA0004.outlook.office365.com
 (2603:10b6:a03:254::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.15 via Frontend Transport; Mon,
 26 May 2025 12:15:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 12:15:43 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 26 May
 2025 05:15:21 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 26 May
 2025 05:15:20 -0700
Received: from ipp2-2167.ipp2u1.colossus.nvidia.com (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 26 May 2025 05:15:20 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <lyude@redhat.com>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <aniketa@nvidia.com>, <arpitj@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH] drm/nouveau: fix a use-after-free in r535_gsp_rpc_push()
Date: Mon, 26 May 2025 12:15:17 +0000
Message-ID: <20250526121517.8319-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|CY8PR12MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b702671-7919-4e10-d42b-08dd9c4f0970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tga6vQja+y4UBWpSG4Ubl6UWI7aWd1tZ20uzl43YLqeRRsn+NymSlzb+ThNf?=
 =?us-ascii?Q?ZA9tBPv/Rf+0DIDSqRA5xsNOEQCLm6rrgRTxuNi1GtorYjJtKnzOl21grUio?=
 =?us-ascii?Q?F6GJHuQHE+Wx80prHZWu14b+AKkKBnOoQAhnKmDBIPnJcItHTMz/YFJZF9FL?=
 =?us-ascii?Q?IefFEeLkUlr8APahCAItH1FcjgzshCpKWrm/DG1zAJ5xn48KVa9NyOgafcNa?=
 =?us-ascii?Q?VEPecuuQxVhwpP3mMTaUq2p0dW9Na6/3lGy4DiDU+To7cLYa9E6ZgxgxWOE2?=
 =?us-ascii?Q?V112yJIeTP69u7YF33I27XU+Vqlv1uqt+en9aq1HeRTOUla5wz9xxKx/3kFh?=
 =?us-ascii?Q?bLIg7MxBJkjRRyS+uGFX+AR3zwHVw/euMcAYREZegV2NYr5pNZCnIx0mplcc?=
 =?us-ascii?Q?OAuAziERx/gJYERPoMcR8ext67USzT1Utdk6ou7NkTzEfg1IuI6pEcQvrGxd?=
 =?us-ascii?Q?e8fNINWE9TNB3AFnksO23jMJtnMvnwjf2Bmc3lJkJ4qID7pud/tS2VOOuhA4?=
 =?us-ascii?Q?Zzs9/yB147+ar6G4+dQQg7Z3B5AWogEFCJU+TI88mZFfM4Y7LV2ru4A9JuwT?=
 =?us-ascii?Q?iwhdrQ2dfQXR6a4a5x5GmKwohy5w4VK1/ONNrpCCByruB8IyR0tXvQeNA3MM?=
 =?us-ascii?Q?KwAdN1IbZFcbncecwMZbdk/MXLDsgWpP0/dd+LYWYisGUEouMJ4UhtDCaixf?=
 =?us-ascii?Q?aN1Zb0ag5oAiAl1aOchsnIL8D2aUJVKBpKxnnGEshzFTLOZFzRFu/tcGZZ67?=
 =?us-ascii?Q?Nx4Nwh2LBGt3qaKDoeFaep+20SqRQZq26EYk9DaY4xV1v6Lcgqy6y6oRDpf0?=
 =?us-ascii?Q?8tsqsLNmbXi6xR+NLM+f5BG3T0aILMiyQpnMfTaNLc/JzzG0dNecy6R/A2Ok?=
 =?us-ascii?Q?cdpCd5oeCm6UphSHR5JF/89DEHUVJEhSAxKJfkWBad+JRK+vb6jpGxCySGXd?=
 =?us-ascii?Q?/IuQrKYmc67M9yp4IdjuFiKZ30zpHiIsXIEc+p1lVQPvUQTScFUCfFTxGgC7?=
 =?us-ascii?Q?uxLjzDYzncG/6RVSLLOgE+n52kjBrgRKwMjti9iT3/DPK576VPB0wah2eNdt?=
 =?us-ascii?Q?xma5axIljcXjjSUJI5Bgcyb2rcbVOMWOGo5JBueJxzo42NPaWSYgtS0vp2VY?=
 =?us-ascii?Q?djEMAp8TgnafcCtjpXIwRtlkINsRxSRvxOkD+qV8ANHAVUwbKNL6/AWOeSof?=
 =?us-ascii?Q?ybbS9x8LqPN+RC4Z72RXQi5T/feV0ZpeC/bN/4QBBAm6N4/UEno1sW8O1QNY?=
 =?us-ascii?Q?HQSo5fKdVpVvVBocIggYj0B/3zYVboiFSRktfAdwwYZK31Gz13uadOImt4f1?=
 =?us-ascii?Q?XiwdfLtQhmAnAA8W8TCJVUAu/RoPrREhu607DA9a0mv0BVlQZGDQtVT+CHkQ?=
 =?us-ascii?Q?D9ntp2dJ51cjLdkkVk6ZRBXM9nb2Zsyv0+nS9Gm5cTzcaeG0ZqgNuKeZGTqX?=
 =?us-ascii?Q?aqsa6zP5mLLPnr3I4iu/ZTG5biPIjsLkL4pdbAXC3kPpZFEv4MQJyyQD+eNd?=
 =?us-ascii?Q?cM+Q9/jukQ4rCzA9VLY5sTrPmCXOyr4meav5?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 12:15:43.0152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b702671-7919-4e10-d42b-08dd9c4f0970
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7539
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

The RPC container is released after being passed to r535_gsp_rpc_send().

When sending the initial fragment of a large RPC and passing the
caller's RPC container, the container will be freed prematurely. Subsequent
attempts to send remaining fragments will therefore result in a
use-after-free.

Allocate a temporary RPC container for holding the initial fragment of a
large RPC when sending. Free the caller's container when all fragments
are successfully sent.

This problem is caught by KASAN.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 969f6b921fdb..ab865da2541d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -978,12 +978,21 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
 	if (payload_size > max_payload_size) {
 		const u32 fn = rpc->function;
 		u32 remain_payload_size = payload_size;
+		void *next;
 
 		/* Adjust length, and send initial RPC. */
 		rpc->length = sizeof(*rpc) + max_payload_size;
 		msg->checksum = rpc->length;
 
-		repv = r535_gsp_rpc_send(gsp, payload, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
+		next = r535_gsp_rpc_get(gsp, fn, max_payload_size);
+		if (IS_ERR(next)) {
+			repv = next;
+			goto done;
+		}
+
+		memcpy(next, payload, max_payload_size);
+
+		repv = r535_gsp_rpc_send(gsp, next, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
 		if (IS_ERR(repv))
 			goto done;
 
@@ -994,7 +1003,6 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
 		while (remain_payload_size) {
 			u32 size = min(remain_payload_size,
 				       max_payload_size);
-			void *next;
 
 			next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
 			if (IS_ERR(next)) {
@@ -1015,6 +1023,8 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
 		/* Wait for reply. */
 		repv = r535_gsp_rpc_handle_reply(gsp, fn, policy, payload_size +
 						 sizeof(*rpc));
+		if (!IS_ERR(repv))
+			kvfree(msg);
 	} else {
 		repv = r535_gsp_rpc_send(gsp, payload, policy, gsp_rpc_len);
 	}
-- 
2.43.5

