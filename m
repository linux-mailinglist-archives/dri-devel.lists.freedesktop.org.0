Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC6AB249DE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 14:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F0310E704;
	Wed, 13 Aug 2025 12:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="GN3/KQsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012025.outbound.protection.outlook.com [40.107.75.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A1010E704;
 Wed, 13 Aug 2025 12:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhCktlROiBerNXVv1TiZIY1tjXme3Tx/GRS+hWO3+DKaNYguO8wJh+GjzzFsX3OGv2BdZ+i2WMbNqFsf1j0ekPWmhLqnJv4nHXUdPEQGtbeJC75mTVG9p5N3L5ZDgUgRhxKIW+0t0SwPwDkaVnjjS+ILwqDsGWChbDMFEMjXb12qCHKIe4uv67O+OVJ+JqPI4o8l0b1dyLKVVCrjnUyIe4FORbuHxYPirPssD86RNhZcjvQFxRMOLidd3HHoJ5Jt1EtbaRuqU8LKup8cDvpLjC9SibDSpdvMBdxRQOYXl0vMVJz06BtUOZEuJNoasuF3bQwPwloJzNQNNLqkQOdEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0e85y5MKtlUYLYtGQa/8YuHpUw7HZYG1tQW3KAAX4U=;
 b=FL9TAkaAx4okZdCRurIXpkEaKF+Qh9eJlonGG54Z4XkV1erZg1LfTlIhYRfnR3h93xTHaLqdROoCIancimpB8x0jxefEUzuv+E5QKlwpQXZuBoU19FQzxQLjFN+t228p5CIOYF5FdhpFCnsv/M8n23Z4L4I20ybNbFywdUqoBD7NiXOONYLesTWpJS8BCgEVQPBux2CQDqY8ahxErxeIqcgF6ju1KlA4RJBgaYk3HMQqD+9VzEXimdQ/UKUI73PD9SZfb4tjU/yW51VaDWufHZIKnW3bzhLKjtJJcE4VAm1lZSCTzV31fkcPo6nxlP6c2dienKcA2o9COGINIEt/uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0e85y5MKtlUYLYtGQa/8YuHpUw7HZYG1tQW3KAAX4U=;
 b=GN3/KQshT3utwbqyAtbBlDjmmon04K8SWMN9Krfg5YAMjYoNSehEvff+BP5aqLMyYExc44jLWmbzepdG/VCZxPiPZC8Y4N+dBv8oTD27FwBQnABvWCINZ58B81q3sm+0o/GWBxrUPrjbay+2y3BIVNdpRh1i+1NcPjVIGylZvJ9Z/xGEhacmht2S0j/yfJ9GjWMwJwXbUuMme7zLucI7wCbAc3aB3FrKWc0NpHZVUqc7VDP71B7xzPOknDRdxQNxiPxIeC9y4b8shhLhjJ2b6JxQhqsC7CYRfveO8qcYGkXF0Cp2MmwuQclsJ6bOlXlSg0woRaFfsHd7Ee7HbFPWsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5128.apcprd06.prod.outlook.com (2603:1096:400:1b3::9)
 by SI2PR06MB4994.apcprd06.prod.outlook.com (2603:1096:4:1a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Wed, 13 Aug
 2025 12:54:24 +0000
Received: from TY0PR06MB5128.apcprd06.prod.outlook.com
 ([fe80::cbca:4a56:fdcc:7f84]) by TY0PR06MB5128.apcprd06.prod.outlook.com
 ([fe80::cbca:4a56:fdcc:7f84%3]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 12:54:24 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Timur Tabi <ttabi@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Zhi Wang <zhiw@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Date: Wed, 13 Aug 2025 20:54:04 +0800
Message-Id: <20250813125412.96178-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0028.apcprd06.prod.outlook.com
 (2603:1096:404:2e::16) To TY0PR06MB5128.apcprd06.prod.outlook.com
 (2603:1096:400:1b3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5128:EE_|SI2PR06MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: 84ef44a8-98d7-4e07-beeb-08ddda688746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hd91hA6Rro5MM/W7jvgGc1vXTzvHqoCJOF1VleWlwPlffA+bmKznowcAGKwR?=
 =?us-ascii?Q?lPO3qsG2IxMUPDqG09OpzVW6IxPwKxWfePKbL9+JCjk86PlF4fZp6FyJs2TQ?=
 =?us-ascii?Q?YtX59lNPWGQFN1wO1m//ocH27JFlaMiabrKVnGHrrn24Btsy5wj/S1jJAor6?=
 =?us-ascii?Q?7htTP525vMYGhHhrXFNLyTDFvcvTeWFb1WH6jUoACXl7NLEGewweR6qYa1AZ?=
 =?us-ascii?Q?VMlHcmS7JbjIZvmABXRfZZlxmBLEcvxY/8ndgzmVBgPBnh5vQ6Eqcqir4Uga?=
 =?us-ascii?Q?ExxxCKWA06Z2HboVq8eJjK1ZkUnbf6o2uSkN6q5YxYD3NuI6A14G/VWXxVTN?=
 =?us-ascii?Q?RzYHe0TyfFR4nGcX+iK/7oKdIUNP9iO7Vq7lakz+1TCrMu+LLeqj0On4rcfm?=
 =?us-ascii?Q?ZbtqVy61LPg6NaNS3HTCa31rnIMqeDo/RIU7oUYWcU79Y4r+ykbcHmO4xzUk?=
 =?us-ascii?Q?L2zEcTEK+MD9jbNoVJwvhu1ECZk6+2P1Tu5dDgr2FC7xiYLT/nIjUxfNvxPN?=
 =?us-ascii?Q?piseDr64vf/ZP9+BltvRXoqRFQY1AxOHYr8Lfm5uVY1PKY1Ckky9ShWV4sxp?=
 =?us-ascii?Q?CUYRVPXYU4HvOIxnVGv1HXMw30OcVfNV152M+pqcnxVPkigqrZjji5Y/zHM6?=
 =?us-ascii?Q?uQ9MfkzwbgO+1JmcTCj7pItS64XWXzzy3leRLuaGzYVfaM6fHrugwT1BqSsK?=
 =?us-ascii?Q?+M6jmgBeEnkOgbiFd+gq5oTnvLgUR+MmF5ueRAGQ3asgTWWe5fPs65CodpLb?=
 =?us-ascii?Q?2wXDG5Ia83/ZAWg440LlgGef56fjlccuaF2PJ/CaNqc2hRsiRcj+u2P0IZtz?=
 =?us-ascii?Q?9hBeEBzqep2P5hpaZk2sHRTTQ/fotObN5SVlUtMgWHilVJn+bYL0JYW4NhnY?=
 =?us-ascii?Q?EKb6j80B56AxiciCB5j8iOofiRcXfOExqtGtIbgCAddFK9uxNe1QIj1mEt5z?=
 =?us-ascii?Q?k8Ggil+eVJbqXD/dZMKDzZGMbQdBY6KQFgYOpepgbqHSiIk2C5O9KnA+7n5u?=
 =?us-ascii?Q?DJT634roT0/yduw+dxjSjGodAdrRP8uVrznjHNpGt+KZVp+bCEkx0yvy5f7e?=
 =?us-ascii?Q?eluJb77jFlb2w3SPJuNV5o99vLvPA92URCBEPAD/RUYFvTUrXoQEor1xaF6G?=
 =?us-ascii?Q?3FwkJRuNr17b3szdfnHW/C2aISRKrdc2aQEy5/iz65cN7BSoWo1aSeN4JZMD?=
 =?us-ascii?Q?58OX3dF7QkHdhZas8QLcvnvJh9obgBh5yEEaM7yi1F1o8e+UCukvN1ruDPLZ?=
 =?us-ascii?Q?9ZYhG4nSBzQhedAavwzBqLAH/p2eX20r0an1z4obEUbP3pBSmCKNDrBjEkAv?=
 =?us-ascii?Q?adTgblTGh6wLhbfE5R2bV/BZVTggfFmctaqwrO5IO/dEY56Ef0jhHfwSvqKO?=
 =?us-ascii?Q?x8p8L8yMViFa+GLi2q70Vqg9AtD8rV2lq6NXCLEJXADGm6WoDPps/OJnj+Ec?=
 =?us-ascii?Q?CCePbu0hSFBWXS3eZDqNYbPJORTe2htzI2fEvDhVfA9p3xnCUTEN23OqBSO9?=
 =?us-ascii?Q?DW8gLBg5/5tcqvA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5128.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4CnzuMoRr5NETI9u4WGQic9zc0v3VFT/1LIGtqxIH2efOuGO+rPU7i79v1Fp?=
 =?us-ascii?Q?iITHwWhk9mI+lLz7tomBJCWku1kMfZm+p+0PX6xSCQAzBVt847cr9WP9zKT7?=
 =?us-ascii?Q?BgtkEKBmB1PsC9ioJL4BeNNXEecia1OU5CoJhSk5QWwkqHuDv3yG5l/E57g+?=
 =?us-ascii?Q?NcI/DBXFUoHJZr581WKCwuiCpfiQ9aEI0D1O2YBv/ohO38J1HbsUteCkNdVM?=
 =?us-ascii?Q?0zLfir88NzCPJUdHDThVm/plPa2FgczisheKh7zEuC4ImV1WVm5lG17ZlWGA?=
 =?us-ascii?Q?KVb63kIZCY0dD7EIs3Ge0FU5PnR/ohDHf/3/1vgqXk/ICI+Oq+USlcudZU92?=
 =?us-ascii?Q?fQ6/aZAVMYLesYljCD9qcCOAG/tzjRNqaDBYtD7InuvVFE5BXVd1wr+0e1o0?=
 =?us-ascii?Q?Gh1E8uDWda4bWHSkst7wIGySbDhVvo/gWx0oldLOF8NBduULVHZ2c+yVfEVY?=
 =?us-ascii?Q?pmZnizAN3A0bGY7CIDDJynRc4TAAD62jfyW+mV1Sw2yOwfzgKJUIp5427O9z?=
 =?us-ascii?Q?qX3TZjxjcntYRe3d8AKQN7jD0JPKkVGKnTEhykcbM2ck1uA3YjQYvToIO4Ym?=
 =?us-ascii?Q?5hs1aIYDgJiKM8+JctQgNv+usIvcSvbnT7Ra0Fu2wwycLz8X+utXMS6NpTfD?=
 =?us-ascii?Q?P/zfCT/mR0H/kgN+eX6pAAZxdhkyAwdzZAcZ+8FzFDxZk6PBpCwb6pegyO9S?=
 =?us-ascii?Q?B3ucAFj6+udFrD40NH0dOtik2Zfdnrwm2nk4A8q+lfUdCfLcY4nL3tRbUPVl?=
 =?us-ascii?Q?ecFfeAPOXMcp4kqIN9muTrJRfilBLYc7hXxP3Nh8KFyGab6FOHLRAjJMc1OA?=
 =?us-ascii?Q?Fo2+vEHzILREgnExCXSD8q0CAjWhwjt6Knl5dIAaEr67Ij6hb7dW1GX/sOFs?=
 =?us-ascii?Q?4FYdkVSON7JQTUqhpHgIv2MRHdCU5RxoxWlAoeNZZIJZn+Mg6i1OwyCsL+G8?=
 =?us-ascii?Q?J2+CPIjeIo16hubOb37DTiaQ5XGRRgIr+Pzi0yFA4BWoLtHbWBr0DZY5URmY?=
 =?us-ascii?Q?zqSf4o8M29EGdysdezHvi+fmJjZaOa+9UV8SKxmbfeQPVEDfWs/3kZF6LHGo?=
 =?us-ascii?Q?vRl5TU2J/rB9O2ef0z38DBbHY6OEER8BRH10XTINks70xD5TG3Hy/Lu25qSn?=
 =?us-ascii?Q?LBbMlG83dhpN+G3a+bgW1SMru6+rBpaPhbXu7LBXalmtvGgUvTwdERMjsnFQ?=
 =?us-ascii?Q?rWLspyktDIyN4cqTp5aurMeW/V9e6cAGkqpmhooRL7TJF8DibLDsvFc1ZeQW?=
 =?us-ascii?Q?0M0SgtWlvJ1gY8SF31IBKEZM1JPjoyk80ZUTCbKBQPosGC/zHhFcdDHaeK1+?=
 =?us-ascii?Q?78j4jTHQKXxVvwn0mpzenmBz1EsnYrWu5auZMNOrDUj2UJjKfveVIIXNTGSX?=
 =?us-ascii?Q?N3+Ja5BoaZfNEJlsQkwHJ/1luih7exikAjKcCl4BlI+Ap6o8Ek/NG9jiC5s9?=
 =?us-ascii?Q?HOsDOyEYo9odjLj071mffajTRij6F58bEGVntwuEGzXuxKjsN1YumShjS770?=
 =?us-ascii?Q?derOB+nL73Gx6mhRwhueJTelL1v341gfWChInsaM6hV2BYjxeHaY6CpEUCKW?=
 =?us-ascii?Q?+e0O/SVREJ45usXFWp9giDLft3MQfUXmi6bZnzWS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ef44a8-98d7-4e07-beeb-08ddda688746
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5128.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 12:54:23.9697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efYOjRYnO4tDhxRNuMaCv5zb8Dzp5xq73TWVbePeMcSKkQI28d9cA2ASDYYgwUu3JgzgCI4+x2mo9vKOSUmisg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4994
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

Replace kfree() with kvfree() for memory allocated by kvmalloc().

Compile-tested only.

Cc: stable@vger.kernel.org
Fixes: 8a8b1ec5261f ("drm/nouveau/gsp: split rpc handling out on its own")
Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Acked-by: Zhi Wang <zhiw@nvidia.com>
---
v2: Add a Fixes: tag.
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
index 9d06ff722fea..0dc4782df8c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
@@ -325,7 +325,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 
 		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
 		if (IS_ERR_OR_NULL(rpc)) {
-			kfree(buf);
+			kvfree(buf);
 			return rpc;
 		}
 
@@ -334,7 +334,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 
 		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
 		if (IS_ERR_OR_NULL(rpc)) {
-			kfree(buf);
+			kvfree(buf);
 			return rpc;
 		}
 
-- 
2.34.1

