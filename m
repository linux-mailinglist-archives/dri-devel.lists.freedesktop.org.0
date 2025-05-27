Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1DDAC531E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 18:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4436810E169;
	Tue, 27 May 2025 16:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ft4WK94H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F7110E080;
 Tue, 27 May 2025 16:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIN+v5JUyt/gsjCXdhb1qbmEX6rfMJTXNYOR4wgGUGe5SnmGlb22rZXZJ1Rt30kTPKJ3Nvigtyjc9NLi9BUqGVqjmXEIBceRP5goyicWbN71gvubnwcuuCqVXSRhfinTr8lOFoT8F1pO6BFsWTqj/qibxE3ROGJofbJ+F04nkBK44q8VzFTrM0EsNhG5xan3FrEJGXdfLk9nBksMKrWSRzFW8ciS4Tu4uVsVpT2A/v6o8rViXamf+OMuaGntRyB7VTrHVVPqxqC3s42rSOivIBZ4LP35/bQjHMoZnNZk2CtM99zShBnT6f06VhkETdjQ0xQUZNc/RdJ7DH2SAcnj+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFdnEP42ZFWa82cBXLKcKUur1J2/1sraDt/xKf4XRjQ=;
 b=tT+LW/53O2SNNvdqTCmKLv0LwfJHvf1Tl13P8JggJQ+VmQ1vUQYOu1W8T+NylZfGf/u4diqGO2S6PZuaLi37K5d93sqooviyxGJi+dvPiqOd4wqwCF+5IzoYXaax1qlVvRLvU6u4z/NcaUNidpB2jFmTLxnM9yfbs/R3FyhYcMgGxs3hd5wwNWCoAQxiJtrdYjAibQYY91ZDoaT8EEN7hl/42bdD3lQ6D0OzyD6pQkxk1YAsGuUQUN28ji8A/nEKevJeSLw3kpTiBUGsCDh6iqywC/zDIwQTDwcNwTsUqaRZGMGMgHaR/3MT2mhyBLUXwJtzE1hF0Ul406sEdA6wKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFdnEP42ZFWa82cBXLKcKUur1J2/1sraDt/xKf4XRjQ=;
 b=ft4WK94HLRHw8XPeOt2DQAoDZEiy2XMYYsPd25iWwWK4Y8EBXcGsSBts56Of87m48LiWkzH3B7lj3gUt2o3TGB4CJsPfix+/UpJTOXq3FLfEfBUf03qvV1Eq9q532CttKaqCrCk5kq/0IHq4mnUxceDa6XCdaZF0RyWx9x9mBmALdOCTh0XfiU3XkgKpI+OOcLtIM7oly7n1xVAUJtTXQMO9rkRs89/oXwoywlevqwcUvTQMaz5Z9cbLjG20HZ7qqhj1JNXiqhzAQta9cmbfOaPsDjzX3GW1lIBha0yLRsuiKxyFgsg+FzdSArHLWou37mIgh2jy54WXkddAg2Ebhg==
Received: from SJ0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:a03:2c0::28)
 by CY1PR12MB9698.namprd12.prod.outlook.com (2603:10b6:930:107::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 16:37:37 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::7f) by SJ0PR13CA0023.outlook.office365.com
 (2603:10b6:a03:2c0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 27 May 2025 16:37:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 16:37:37 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 27 May
 2025 09:37:21 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 27 May
 2025 09:37:20 -0700
Received: from ipp2-2167.ipp2u1.colossus.nvidia.com (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 27 May 2025 09:37:20 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <lyude@redhat.com>, <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <aniketa@nvidia.com>, <arpitj@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v2] drm/nouveau: fix a use-after-free in r535_gsp_rpc_push()
Date: Tue, 27 May 2025 16:37:12 +0000
Message-ID: <20250527163712.3444-1-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|CY1PR12MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: d5887b4c-f60d-40ec-7d11-08dd9d3cca39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dQEAXebzT//Ls/fUonHLFC3u0YcrIi0iYrUgcdGmbqleXA9oogJrDebGgwQ4?=
 =?us-ascii?Q?7XCOj91GmYW6fegi0C/qyueFVxAATCM3j5w7DGsqR9G1ueUe1teZZ4KOpKyK?=
 =?us-ascii?Q?PAg7QgmE8ANTJNuvIKsugUp85mCcSahnxUpmnDSqFxfHPR6bkLrXyr72trgr?=
 =?us-ascii?Q?BtjReGsCa9Ex9ZQWh/2sAwZZiBVOSLtmYQMs7P6fKetKGlEmFl/DPLmZrrQw?=
 =?us-ascii?Q?xusWlbnsw/n1YA+ncdYKV8NYCQ/0eewFGN6XDC5GVqbX+UavIMrVfkGRiI1S?=
 =?us-ascii?Q?5+WG0GVmYTJAfCO8mI67bcFcR4VycJtPaDaZ8Am8cTVNm9yqN3KQaRXmy6No?=
 =?us-ascii?Q?u94tGsrFZPxxhnYYPVWKP5FXKlm6UxXFz6OHRI1N59id/UNfFcAEIEfttL2o?=
 =?us-ascii?Q?510WWqTrqgPofon75CIxkBl5urND+0mkculWL3KG1KctmIbOE1ntfu3XZ1Dc?=
 =?us-ascii?Q?xwZ/K2SuFgF7Q7xcKkJehN0YBjIbf1IMeB+8C9e6QF9eSLOFs0va/EEGo1Xb?=
 =?us-ascii?Q?3jWeV3YFCUO0EbsDx1lWq3oTqr70gGPQME0J+ftWrkJR4nKhLWafgJHg9b7T?=
 =?us-ascii?Q?vt/zoWwHBO7ESgzqDRkU7BzhqCyvPgGDyB0/Y6AWlPbizQNanSckTdAHNyJl?=
 =?us-ascii?Q?7v1eNXfbR7sZmaOi/WD9gWCIsYCynwFzTOvDvJLJ+JYDRww2soYnwUR4NFIo?=
 =?us-ascii?Q?5egP+fUZZH9srR4AwefI+Hy8I8DpTWrLmwPv1WLMbhZVyaIWzNCQ3EAqTlwF?=
 =?us-ascii?Q?47RfJYCDzks8oc3CKWmpyvX1yoasJkFKXJm5P3Iaea81ia01+d9HJttruTUa?=
 =?us-ascii?Q?lGi3IrO2TTotyzBQiGc8awleYDAmLm3hqLuisb4mnkbhBaiu7q2EsgrRBE1k?=
 =?us-ascii?Q?iNEz0YwEIW+VGb1JulgWNcTTdG0fY8Jh2QV1ZjVUuYULoEJUGMgJ1kmo3UbC?=
 =?us-ascii?Q?JfLwNiKsMsj6pcx/i4MvxAKi1LDlgYFVLhDv/8AQkXOBR0YgEnkTRIRjtzdR?=
 =?us-ascii?Q?1AT2YpmnOjReRTOYcvKnDasQjol2wcTOkYZfgYBBLzZHosI4Q3qVuYKPSG4T?=
 =?us-ascii?Q?9uI2B53Hf9ok+UI9Md8BpDcgsdtocQGDiM8u9IXIGnzVx1oQaBKcOP8fbD5r?=
 =?us-ascii?Q?JrAw4x9iLKbjavpvJT15/Y88SQjidui7f5+NPnQn6MJH0s+tT3+As/57oqwV?=
 =?us-ascii?Q?xnd+VitEcmqaK/yo5TXhnZULmJQgFG0Rhv25UD/QoxYM9JqI51AFL8mS5H7+?=
 =?us-ascii?Q?faBsQB3IkEMR1lqrm02EqKfBL1hkMdU4xAt/uYc91I296+VqY4SYa5WmChCk?=
 =?us-ascii?Q?wwWmROtYj8isU/Kv3FzSjClrPS7MXXqqw1lDYdCG3xsd1YiLR9ESHFltu0W5?=
 =?us-ascii?Q?+m0pZtDXbRW4YhTiYe8T27SbP2Dlx+oycFoHuEbS+IiVuy479VWiYShHVxMB?=
 =?us-ascii?Q?ymx+DkR0Yf5eQ9QPsRldIpkVpnUZ2GuJocGsby2xbQUvHyL/C/Oaayy/Ul74?=
 =?us-ascii?Q?y6TqvherkGRGV4l3AH1lXO6H+/wA1dG8Sp/z?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:37:37.2403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5887b4c-f60d-40ec-7d11-08dd9d3cca39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9698
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

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---

v2:
- Avoid unnecessary length adjusting on caller's RPC container as a new RPC
  container is going to be used.

 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 969f6b921fdb..83b2be43bd16 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -978,12 +978,18 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
 	if (payload_size > max_payload_size) {
 		const u32 fn = rpc->function;
 		u32 remain_payload_size = payload_size;
+		void *next;
 
-		/* Adjust length, and send initial RPC. */
-		rpc->length = sizeof(*rpc) + max_payload_size;
-		msg->checksum = rpc->length;
+		/* Send initial RPC. */
+		next = r535_gsp_rpc_get(gsp, fn, max_payload_size);
+		if (IS_ERR(next)) {
+			repv = next;
+			goto done;
+		}
 
-		repv = r535_gsp_rpc_send(gsp, payload, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
+		memcpy(next, payload, max_payload_size);
+
+		repv = r535_gsp_rpc_send(gsp, next, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
 		if (IS_ERR(repv))
 			goto done;
 
@@ -994,7 +1000,6 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
 		while (remain_payload_size) {
 			u32 size = min(remain_payload_size,
 				       max_payload_size);
-			void *next;
 
 			next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
 			if (IS_ERR(next)) {
@@ -1015,6 +1020,8 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
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

