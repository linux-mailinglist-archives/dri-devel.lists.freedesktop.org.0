Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644E5453265
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 13:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B522C6E9F3;
	Tue, 16 Nov 2021 12:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300113.outbound.protection.outlook.com [40.107.130.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E386E94C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 12:48:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuVPcbAxauNSL9NXjJb0vVih/W7t5pedJ8OFsA5c3RfHBK4wldjWEEXDfEOacgq03mT3u5THXr4/PYLde34FTbhwnF3j3IjkqOkTT/197Kl9YwpMBWMyh9qjN5ZP0a1m8/x8xTXC3WCRZ6dWpZlZcvinHanFt6AF8eG6I6E4bXKqZqdV0iHP8NkQlThHnTE9EMgKyxTfQoGlH7gyWf16UBj5foXC8yJWH4/z4Hr7RfxSpkBoZsgmuzIupLcykyBRv2e2Tjm3KvL5kxELWdoR6MXd6hThqHVhcbgfR6rR2uMHAap5a2DnVt22vEK56zV06kTZwSL9o1KXjqGgmrCuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHGflrQFVkRMTc6HJsRp6e5UBgiJa5NsSRG6Ess93xc=;
 b=SfidHhGQCQoFePRQ2qEtnF+IV0O8/brAWXp15MxgG4U1C6gDdtVIvza0qyNwLqXbNzz6gBDJO6nDscyQSrI1B7fFptC8Vb5Dc5eYpvw//XyFWjW7TwqxECyu9bZ1gttedAwiwYDELki0OC9w5S5urttzI9TZN1FlvQdaRXQpGWHa7lOS/IoFIXEWVeQPhvYRdtTF8PlNWoe0W/ETvm2XpX+8sQX7W4/GhouCXqhTP6Bcov2Ta7MdBEEU/xoYnh6RAxcGu/+1VnyxQOQHKlj0Xbgj+a01BBS6bfriL45fz/kwvyAUFEyEl55mZ0NYd4tumaSFUyaxcvVzwyrXL31wVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHGflrQFVkRMTc6HJsRp6e5UBgiJa5NsSRG6Ess93xc=;
 b=m6wMrKh9ECmq8GPth53Pk/bgLLK2E+EM46MM2ro4ITpgUljQuvb/W+zWKdK8tPVD/cHv88Ab/385H+Exsv4MixF7GGike32j+1BZHDotTvJu8f4W9beSFZuGHA3EbCwSLCCkMXR558yTK1erDwBHQG0Sx+9jco1POCyXz3svtdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PSAPR06MB4103.apcprd06.prod.outlook.com (2603:1096:301:30::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.22; Tue, 16 Nov
 2021 12:48:01 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 12:48:01 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm: fix potential memleak in error branch
Date: Tue, 16 Nov 2021 04:47:51 -0800
Message-Id: <20211116124751.31181-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::34) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK2P15301CA0024.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.2 via Frontend Transport; Tue, 16 Nov 2021 12:48:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7375d6cb-4540-45ea-f255-08d9a8ff52e6
X-MS-TrafficTypeDiagnostic: PSAPR06MB4103:
X-Microsoft-Antispam-PRVS: <PSAPR06MB4103266E7A97965E2FD01CA4DF999@PSAPR06MB4103.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aj457TkeQBP3hxS1VQJtYwKSt40W8iomF8Bb05sXgAvs8Xzf+FY8evt7oXNa0DjoKKy2/j2Wgzh3sSf2nmdGB7wuFU4xwQ1DjTrpn4GApBAy4fUuK7Rbtar2AGFH2wymToD+EPVSQhZC6qM7lx0Rgf6eHm0w9kjxW/9DlhIbpJ8FUTdEMHhMQ3CNZXfJii+1JhPv4Jy/OOO81QAWqah96IgHlwOK0m8syeCk9k81H4OKlFiZ1qm3AHpuK03yZsYJWfV2OaEzW2cEnFtUd0ZA3SXfGcVlZHzpgEtEeJ2KJphfXRpE+HsK0DL4huMgHJxLBkLvEg3JbRAsB3PKZpL+7H0DcK+7alzkSZy51QEMXK1LOA/mEWq7iEUCvKbtApZ678cAMlkGU0KhulNty5PN/sONGCchlTt4Isfgtr8gHgynk+N647D2XlqjqyezZ99BX753dzkKEoDKqo1aCrzIQgihWXq9pWAfmEB0WdkF/L5M+56ZYyDGvfiUg3u+PDJ89byQ7lIb2kYoibiRQJ+2h7Pk5mCZyTJpovxwpgto/vbFGFfXppE/F9firOtsv3CTdtMyGA0XQYNQ7/pxJbtJKs+tLgs0pjsvXOlSMQIU58W2TCE+ChOhNoBovH3pe7fap6PSunEtu083HJ6vYw3crqEdqd4w9cKIhwA1qXVwJ+7DbjZycx5ehmiQ5sw5OX0/wjfP3d5PJ5CXpL+zL6E1Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(26005)(1076003)(6512007)(6506007)(66556008)(107886003)(316002)(2616005)(52116002)(66476007)(508600001)(66946007)(8936002)(4326008)(186003)(6666004)(8676002)(38350700002)(110136005)(956004)(5660300002)(83380400001)(38100700002)(36756003)(2906002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wp1LzpcX7tieuBHg0ac5zM+LO0vM7giXUMS5/fcy0QP2umufAd9oV9qKIEOS?=
 =?us-ascii?Q?vUKp7eYrYXwva9BHrDPOFI+w92M5GU0C+9w87Lizrql6+SeEs2y5W5O2FZc2?=
 =?us-ascii?Q?9yLzBhgd9BU6KSR8n1hCO4ZXHC9P6c3S1Sa3cNsVV6meYfDDmk8nigwgsndt?=
 =?us-ascii?Q?T2DKTQLIlVHTosdVUrXXAkDOKCqT3dCezeYU+vg0blC/vJ8oW49GTE5Dc9vx?=
 =?us-ascii?Q?Mrw7bdIBQsWbc+D+MDQqsISUd99Ef7pfk6LLlc9brT6whwnY/pv7cDk9crPt?=
 =?us-ascii?Q?k/q20SnGDlQulWyPrSuYxq6o2U3iYwApA96w10gkKhNhyK5d5mtmJ6eyv7PE?=
 =?us-ascii?Q?GVaeFdgEPiGy/BtNHwKkC0GTTN7Uk3u38M4LU+3LwQ2LlrXrO2F0BRk3xWL0?=
 =?us-ascii?Q?IfwGyIpmiwr553u/UJxpkqCNJ/ahok0UYjMBI08U7/KhrxMYxfmlVEPeauON?=
 =?us-ascii?Q?9Lk0+NAyexCnjzkTgn5W8THkr2tY3+Fnpk3zvVJITDqr0xAFvF4xHPbk/9AM?=
 =?us-ascii?Q?0fAKIhHrXQpMpo+5Jfs39NR6TI7kpdwDArlyv95/k3E69LAxiaPWJezPqF65?=
 =?us-ascii?Q?WH98OcdAlak2fIQuJx4XO+MSfC1gxBMh/9/qLsnelcMy1qo+YwrvGOqe3JpY?=
 =?us-ascii?Q?UZnwOnI9GtAj9otVJyibRLn/B5nBy/8Qmn30FDvUkWJLdeip5mxi1Al9TTlb?=
 =?us-ascii?Q?0ih2K6e0N6WV+6uGEcV+0FfqxIBjPrg9ZF0kgtbfu9tBjFFYz2xjJ9YxumXQ?=
 =?us-ascii?Q?jETRMNnP5LA5WBIZx+MuF0fmimsYa2QAOVRGgDEHBdMBLJdva/5FpE52ezVA?=
 =?us-ascii?Q?SXtve4POUhCVB4BIv60ZBudQ/fakZzJvuEFrYIJ+SDGqgwS6YpPNgs+2g7Ki?=
 =?us-ascii?Q?WFDYD00xQYIeYknr0UBszesDZdpkqwjK/NzTKiGitFyDrOYaj7oAN+pAyxbX?=
 =?us-ascii?Q?ftxM41TX7A8u7meYhniGaCMJP7M62ypsk3JMdyqEQ4ENt0cgzK0oVv3MYD7S?=
 =?us-ascii?Q?ryrpmgOUV99z94HfBT/LugS+l7P5E67Gs/GY5eFvtzrKAqp4mnCqqf0le3gy?=
 =?us-ascii?Q?ZAQTpxGgQNcZHLyNJPJtcHlnF7jR9FzQgK8xyUZJ8X5Zgv2PLuB9T+GOrHzy?=
 =?us-ascii?Q?r6QXEftfjRNxKc1BSU8oUBLOIeo4x8FxWr41lLSNOlKjjCAPlPgZmzIVZvZB?=
 =?us-ascii?Q?00yrnyFXN107n5smG3qxfXsY0Mm23DSx4V+TzYYHl0+bEUerdnozkA2HqEHG?=
 =?us-ascii?Q?9dfYmuy7lDLGTKRWjE07OJgwfNyIafSZwQonm2Ih8LPQk0HDSVvefUFwRfuA?=
 =?us-ascii?Q?2eW3eUDCUmupSIwUIIypEd3YiT1evXbwvcGjvCdezdD6+is+fLXkz5V9cXO+?=
 =?us-ascii?Q?JfOe1VydHm/vMWOMuLOmNis9IcdvQsAGct6kdQxwINWTRX5ywi3tmKb0TBW0?=
 =?us-ascii?Q?MIIm0n6DD2p3a9BLY1NUZraigN/WCqadPthAwbAFPgrHU1cyTYv1JJvKoU7k?=
 =?us-ascii?Q?6acD1CgXJutyCU2+Klrd/y/a4EbMTuXOlASYZN7pRhrfg/TVcmLcnJ1hlkV/?=
 =?us-ascii?Q?rs3oyw6tnwgmRrhiLN8bWdkfHASsl3SNhlT8qlqMWrME/ZbksW803Zgo2ZF1?=
 =?us-ascii?Q?Wgd+bY8LaBvdpZsCcoFQN6Q=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7375d6cb-4540-45ea-f255-08d9a8ff52e6
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 12:48:01.3566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Iu8+zFRPQAUqD5tZggTqpML0lqUAtCd52LpLdI/49DMBwo+boOb2d5hfvsq2y3AXjqbiwmFfYV9BOgVTutGuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4103
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch try to fix potential memleak in error branch.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index f3d79eda94bb..f73b180dee73 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -5501,7 +5501,10 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 int max_lane_count, int max_link_rate,
 				 int conn_base_id)
 {
-	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_dp_mst_topology_state *mst_state = NULL;
+
+	mgr->payloads = NULL;
+	mgr->proposed_vcpis = NULL;
 
 	mutex_init(&mgr->lock);
 	mutex_init(&mgr->qlock);
@@ -5523,7 +5526,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	 */
 	mgr->delayed_destroy_wq = alloc_ordered_workqueue("drm_dp_mst_wq", 0);
 	if (mgr->delayed_destroy_wq == NULL)
-		return -ENOMEM;
+		goto out;
 
 	INIT_WORK(&mgr->work, drm_dp_mst_link_probe_work);
 	INIT_WORK(&mgr->tx_work, drm_dp_tx_work);
@@ -5539,18 +5542,18 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	mgr->conn_base_id = conn_base_id;
 	if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
 	    max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
-		return -EINVAL;
+		goto failed;
 	mgr->payloads = kcalloc(max_payloads, sizeof(struct drm_dp_payload), GFP_KERNEL);
 	if (!mgr->payloads)
-		return -ENOMEM;
+		goto failed;
 	mgr->proposed_vcpis = kcalloc(max_payloads, sizeof(struct drm_dp_vcpi *), GFP_KERNEL);
 	if (!mgr->proposed_vcpis)
-		return -ENOMEM;
+		goto failed;
 	set_bit(0, &mgr->payload_mask);
 
 	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
 	if (mst_state == NULL)
-		return -ENOMEM;
+		goto failed;
 
 	mst_state->total_avail_slots = 63;
 	mst_state->start_slot = 1;
@@ -5563,6 +5566,13 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				    &drm_dp_mst_topology_state_funcs);
 
 	return 0;
+
+failed:
+	kfree(mgr->proposed_vcpis);
+	kfree(mgr->payloads);
+	destroy_workqueue(mgr->delayed_destroy_wq);
+out:
+	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_dp_mst_topology_mgr_init);
 
-- 
2.33.1

