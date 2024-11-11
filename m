Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD239C4ABB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 01:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A7710E549;
	Tue, 12 Nov 2024 00:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01on2129.outbound.protection.outlook.com [40.107.222.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53A910E1E8;
 Mon, 11 Nov 2024 12:10:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke8WOnsbQMIQgBYGVrznE43hCD+ORT1m8MI4lhtONIQMuk7jaW/KtdL+uAXcQg03BcOHCt+KKs936ploK6Tv28bS9jYD6ulMEiMVoSNHEVPeXyyo53TEtzLivkbUKL7d3e7GYMdoHcYusFNSzbQ8vOygX5lwM9E1iUpQ39ZXjndH9wc78YmcmWw4jbaoETWjonRV0bAnp9MMWMvHSIDnXKJYdNVBdMBpYBPF+pNGSs0POBkNGS3nkZdAyMqmP5mkK9znJNApd6P/AtABoXhMbOmYsi88siLgBIXLryKfFiTs9jarQ2ZqNaQJK9B2rmqLrf1GPq+SMmauORyeXr/uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw0cIZJ64UmjbmmNvP66gFrQvqnsPHnKXxghmuvnpPM=;
 b=UE1KKISRhb4/qwaJ5ouU/7LUeHCTTAgvSBYgxRSthwZRJKZKI6F1SmhCOE95+hOPf/gWP9kEGEa7Sr2u7rTBfEt7rC7I+KGtw8fsripyPjEN90rLtq8iqnMQ/lqAyVGxbgMfgH4eA+HkX+mKF3iKCHtgUkoaEK0dChCJzaK8HKV0JonYayXVHe8FcQCgtUrPVFP/d1495Plu8bu/YqBNTG5ZgyjEBqjT/tYmoq8wpuFwIpKbAdVozRLFdG8oT88tpDf73zqkNX+3p8nEnkbaHOjvOofbbrqy6vidkjO5BaiKv9jeJQJ3J/3fdonHoNhgQxuXq/7dfhRlrnKUhaSH2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::5)
 by PN2P287MB0675.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 12:10:07 +0000
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a]) by PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 12:10:07 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To: alexander.deucher@amd.com
Cc: tarang.raval@siliconsignals.io,
 Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Roman Li <roman.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Leo Ma <hanghong.ma@amd.com>,
 Ilya Bakoulin <ilya.bakoulin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/amd/pm: Remove redundant check
Date: Mon, 11 Nov 2024 17:38:29 +0530
Message-ID: <20241111120900.63869-3-bhavin.sharma@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111120900.63869-1-bhavin.sharma@siliconsignals.io>
References: <20241111120900.63869-1-bhavin.sharma@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::13) To PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1a1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1171:EE_|PN2P287MB0675:EE_
X-MS-Office365-Filtering-Correlation-Id: f581f3b6-0b35-410e-8e0c-08dd0249c82f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CPR3SYnOrE9XThCcC3vY2ydvoV69/NrUolPcH/P+nkvQDOSBN980MSqW1X2c?=
 =?us-ascii?Q?o1BQW7lVlFb1CivVaz3zLqLOKJYV0GP4v/Q0ZI6/IYGSY/d6Oq1NTui5w43J?=
 =?us-ascii?Q?6Wlda92QvDqwQNcnLmgbBC+/7f3U83X8qH1mVdt4x2FpNIVoK0EaWtQCqOla?=
 =?us-ascii?Q?3tzNrHSBkWp2nmkHdz0V9Hu/2YXkmWQQQ9++EznvLMtKdQL5P06gbhICRKuO?=
 =?us-ascii?Q?ITIOIsaabfyY5guHqA0onmTmzaEV7PgYpSmYOAUxJkkrTcauUxlFZX+08tiV?=
 =?us-ascii?Q?JFcRi1lmbYM5+KD8O/7nwzORnLYDSM506iwLVNxXX0oaHAg2AfkzXpFqfTMi?=
 =?us-ascii?Q?MIKyhpG+8OygAq1+m+9sP7XbD3zRigZqEs0aoev2lpOwOvZhPnDnw3izTQ+f?=
 =?us-ascii?Q?pPdWF6R/uAZ6uAgZh0RFZahRqwaUyJY7koY23L8QKiWZO7D/IhrSDjjKdrIL?=
 =?us-ascii?Q?IXecvsSocMfJXKI4oFnyQONrHJcB6p19I5UKcXx7oEyvj0dvBvlPI/1xMKW3?=
 =?us-ascii?Q?K4uTflIjpVbqs39NROcnj3lw3u+ZiHmbEaP813R2zZsCJMIgmwpjcpUKmZRL?=
 =?us-ascii?Q?W25QRy3xCuMHn17va8dhmjOK679KHgJ8Vt0IpvQZVkuQZ7lP3hOWQ1hE3Tr+?=
 =?us-ascii?Q?a85m0+l7mIrxJn8uzjijun5ei4FLqftgoKKRKUHCPf6Cc45R4oWO2eyz8Axj?=
 =?us-ascii?Q?lGmALp+PpCUrdujWhlMXCCVKGwU5QbuFR3Bi7lPs/6mgJ5M7urUC2MUYbVqi?=
 =?us-ascii?Q?6h/ZkRPnse7BfiZnecn8WAQElSMwcdwjsJ2Fi7IRMMJodn82QFzeioo6KAUt?=
 =?us-ascii?Q?xZrFzhayKTPSbRfMcuQC6m8PTleAfEcWFz431j/64J7mZgN5tR0i7O7Jta7l?=
 =?us-ascii?Q?A9NL2fAWMKzsMm5U2f+V9vqwysQMdG281Gxld69PPCCwtVAJWmJ100EHdGWT?=
 =?us-ascii?Q?MQp6XWRp28CHLTd7EJ7qOrp0PPd6gqLqGPCLIlPAGzoT03RYxeSQRsEvXirZ?=
 =?us-ascii?Q?fQdpFnxlnvEvoVBshJ4oR5DcVwob1u3TQ83ljV97/2uRSyQ+/wbMUzs30YAd?=
 =?us-ascii?Q?OWY1qZoGfWfp42gxnU7IGO6+P0iMbXGqY9Utf5JTt+1pOumSP1lsYl8hmLq1?=
 =?us-ascii?Q?CmxSCfUWXLNEuIIlrerpIPKBs2/K1ZgZ6qVgXEt+sRlCU5FKcgwq6M/ciOM2?=
 =?us-ascii?Q?NGIRT6avv4mbSXZwy9YZ1Y1wi1MVb2NWhdVoggL3aozOTxo9qap9lXOSa+re?=
 =?us-ascii?Q?CyEKw5wnQWnTYnrpeBOjKGrbvLffyAngZpuUXwCcpQW4x//0lebPQi30HFBN?=
 =?us-ascii?Q?Nm7ccc0DwiRiifJOqsXlaPhGACG8AYAJvgts699A8IVeV8FFJ+LZf8eArlJJ?=
 =?us-ascii?Q?WVtJ2hs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1171.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HYM+DYDOjYPSKEdF/uh5AcAKWOxiQm5G//xWKo8ZTPCZ/Wg4gphbw5WlEEJH?=
 =?us-ascii?Q?68JYNCmHaFkzFL2nRveY8PIJdz3wRnFwkj/sxSQrm+447F7baBCVDgWEMjUS?=
 =?us-ascii?Q?uxAeEMfqNIifEyDYg9k2R8mIwk4I1uuxIBeEKMoQUHdSymKA59p2lwqTrYAK?=
 =?us-ascii?Q?lXJeK6AxAvQDuqjdP6lfR95w1FemKEmk3ZAwhCYfAuhWArZr57yEq8V80gxT?=
 =?us-ascii?Q?gHHnMnsxvAqxUF5pY6N2tT3IjsW3u/Uvwqw8pP0K6ctbSj2wKhvl7LALYbDs?=
 =?us-ascii?Q?JdQ9au+M32OzjHhC704FTrzcumbxTNR4Vq5J0Z3SJhbwJClP5Bx5fKDRbqnK?=
 =?us-ascii?Q?oul/S7rjReTs77PWBF2NCLg+fkBkQVOw66YVIVQByobJslVFBfWskH+iSlhD?=
 =?us-ascii?Q?+dyazdsneJ2pkrJy7X2NFYY2pzyAkAnjit3Z01IYAlioSYNJHHSNZPsjbU6F?=
 =?us-ascii?Q?4eNMoFtTRJdbcKdCwC/l3Kn7o3q85QBN5bc8Yuk/Mqbqw9OvB4FLcHddBQpp?=
 =?us-ascii?Q?3eNe6yPFqg91cVj/APjLrLy4TegKM4JFyEPurzHwPvD9h1b9wsqLJM35znho?=
 =?us-ascii?Q?G6ssOO1pX49q2B4gY1haUWKEnvSe2+FkUO8kzgOjQ/3yAcQRwTzUKQid6qOn?=
 =?us-ascii?Q?lM9UJwEFoqVq2wz9T1fsSNoSmcOjmNjK98wIIf5ZQ9GFGI/ea50g319nvKcw?=
 =?us-ascii?Q?LRWDzcXmtYJEjka4qPajJVub659r6jG5lwBWMnIt5CjJpfk5quH1ZEz3gt+Y?=
 =?us-ascii?Q?ixVvRUAEPxiMIgM+4KvTPMyo2Tw97I0q1xBrW3XeLIxkFSJ9zYr8nQtSQ2X+?=
 =?us-ascii?Q?KWl5+XAhxGS7XnZ33vudZmNE9p2KmzIJswtP5RQE6gUkbDTwwEEhGNPXO+s+?=
 =?us-ascii?Q?HcDWkwquv4xJ4GgCJuTMDp2vgRvD/LX3KBMh7RzwFY/WeD6casluHeH6GWtf?=
 =?us-ascii?Q?zdUXo5ZNBTwBoP+SC2smCVLG9jvM2Gd1CDS0vpSwRH61aNJdj6P6L5R4omIe?=
 =?us-ascii?Q?Z/jLSqhl83iOi15SBDFPyD91wqUVmmRi5Jjb7UcmRMkbglmCUQ7Yn0FX+Alc?=
 =?us-ascii?Q?FtYvtJDakEy1Ft10luxTGn7+d5wru5t7Y1qBXu9o0FmJaLq2ixCAMzBw/pm7?=
 =?us-ascii?Q?gJ389iYTwM2OD+n5MmdKFCs1FGaNRsVL55ZPCOn+5uU4xwok4kdUOhO5eMNt?=
 =?us-ascii?Q?GGVfqHhANmIhVNeL8V2E/hTwsj22ob+0JLFikztItC6ZyXU/BUT1gXuRJQJc?=
 =?us-ascii?Q?/PAIR+deZuMy4sWaPaVprUxybrx7+3rV2pSYvgrOV0dBlV0YALfbQSTa97vc?=
 =?us-ascii?Q?PecgBe8kspdzQvRWBKWvCzqgo7DjiQqt7H4sdH3ULnxf/422WlP70npzgQrS?=
 =?us-ascii?Q?2/9e4ElasHmI5WbJfdhKmbny8VhNR3VBgZBc/qDU38oLrieCS4OV7vYlmtAP?=
 =?us-ascii?Q?zDN4jOHXn59EZyqcXr4zC3SuqMEtIgjz4lx1rGSi7u0NpXR/yxD0LgXkHK1t?=
 =?us-ascii?Q?eAC2/cQvjt0z4ZZqQ5Wh97RCEVqKe7Pjmq2l3pvBgFb1oIoGazkvDQYoJhx9?=
 =?us-ascii?Q?lp3xfL2zIhRvXqBmQhSLuROG5VxZ4jGKtRxD7zGXBOzRGgNTz5RKA8mLj8bC?=
 =?us-ascii?Q?Vyz8dg1iHDtaW9g1ehfkuro=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f581f3b6-0b35-410e-8e0c-08dd0249c82f
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 12:10:07.1688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jYW95vwFqZNKYApztPxhJVLvGjWL8Y3y4aPe7j+XuFIvpMtxKJ23c+EOy3UOrToBCFev+0ygC7njGPzWO/HpkP/jzHkG6HXxo10ptHOfoZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0675
X-Mailman-Approved-At: Tue, 12 Nov 2024 00:28:18 +0000
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

The check for tools_size being non-zero is redundant as tools_size is 
explicitly set to a non-zero value (0x19000). Removing the if condition 
simplifies the code without altering functionality.

Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
---
 .../amd/pm/powerplay/smumgr/vega12_smumgr.c   | 24 +++++++++----------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c
index b52ce135d84d..d3ff6a831ed5 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vega12_smumgr.c
@@ -257,20 +257,18 @@ static int vega12_smu_init(struct pp_hwmgr *hwmgr)
 	priv->smu_tables.entry[TABLE_WATERMARKS].size = sizeof(Watermarks_t);
 
 	tools_size = 0x19000;
-	if (tools_size) {
-		ret = amdgpu_bo_create_kernel((struct amdgpu_device *)hwmgr->adev,
-					      tools_size,
-					      PAGE_SIZE,
-					      AMDGPU_GEM_DOMAIN_VRAM,
-					      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].handle,
-					      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr,
-					      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].table);
-		if (ret)
-			goto err1;
+	ret = amdgpu_bo_create_kernel((struct amdgpu_device *)hwmgr->adev,
+				      tools_size,
+				      PAGE_SIZE,
+				      AMDGPU_GEM_DOMAIN_VRAM,
+				      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].handle,
+				      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].mc_addr,
+				      &priv->smu_tables.entry[TABLE_PMSTATUSLOG].table);
+	if (ret)
+		goto err1;
 
-		priv->smu_tables.entry[TABLE_PMSTATUSLOG].version = 0x01;
-		priv->smu_tables.entry[TABLE_PMSTATUSLOG].size = tools_size;
-	}
+	priv->smu_tables.entry[TABLE_PMSTATUSLOG].version = 0x01;
+	priv->smu_tables.entry[TABLE_PMSTATUSLOG].size = tools_size;
 
 	/* allocate space for AVFS Fuse table */
 	ret = amdgpu_bo_create_kernel((struct amdgpu_device *)hwmgr->adev,
-- 
2.43.0

