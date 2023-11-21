Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F09547F2810
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32CC10E243;
	Tue, 21 Nov 2023 08:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2070.outbound.protection.outlook.com [40.107.249.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733BA10E243
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 08:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdutfUNZygPK/2W2CfE6m30bhAeyWirct3cqOwF430mx7EFDq0PL2hsHBx6OYTK9q1Z8sVWm7HR/5DJVDWZrIjkbg66B4oLWzJssOTu13NktTG+f0/JQ9y6mGKuUxk0SMRvhq5RQO+wayhmld/D7/tMGgs1Y0sX4QqpW1u+CRD8JjNTVyyksyklgUR08ydS1OTl+6cQt00UrMSAy8mfCVl/4tbmtyb4IGScnUhkWVzlX9PRSW7O9/iPXI58XpgqNeZvuQskWztuskwoegN33hLshIA/lr73t/DPC64q4puRw13i8+837hTqas8IvoNbdsHDVSQf2qtgsiiGVnektgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZ/RCylZk1gpD10xsiA87Vwdw6vJ3NkS3AD4uv0jVuM=;
 b=j0SpyLi/yY1vQn0iKC+YHFbk1myNKp82QG+usoB9NxzZNSvitCu5FQpZ+mknWMHkLbURm4rYpREpnpn/UiijKiD+12/V7VTuk1gyyDh91zQYS2nzmNrLNMHpNVDUapjWmPv7IoN+7tJWRVIJT8TiI2xZzJ1Np6hMGbA6ExXYXt+yq+HlnsXZz8mvspRJ16b2Ezv0rnjCqdK8pihfguLvUnvjCdD1RNjfAdrI4rtj3+jBjE7rfpuVYwybhZ+yCcp0+2IfKvzpJlqOvNhjHcOT5sThY5erRUOjKwlM/v0pFcUFeVn6Spb6zgxQTeR2gRva3ZgJzc2ubTYfSNaDct1elg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ/RCylZk1gpD10xsiA87Vwdw6vJ3NkS3AD4uv0jVuM=;
 b=cDPnmUndpVxRFQ5XvdlDh49nFwnqKxDIwW9wYEe6ZH9O4oEbozyl7IQwkJiIPyGR3CbQCm+DhOKdEF9cd84MQt4rU5PMkvPHngabdKzt774VbEwGFXZr0Oo0rBRhI2SmFkWt67An+CC3jtcQWE0tOIAH2T8ydzSqfcnSzs56AOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16; Tue, 21 Nov
 2023 08:52:56 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf%6]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 08:52:56 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: imx93-mipi-dsi: Fix a couple of building warnings
Date: Tue, 21 Nov 2023 16:56:44 +0800
Message-Id: <20231121085644.499520-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: 9068ceb4-8efd-42b0-3458-08dbea6f416e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zuVr/BsHGMNmTq+Lj2MseyStLtGJWZ+tUST7XMk9p2fGJ/aPS4Pqp6w9Ok+hfy1Bdg7xFUM1w6P1o7b/wNFqa8cE18Lj98Bv4M3e8Kf4c8mU1A0xK8FR67zsezwM96pjlcmYmpHbug6QkDcVwh+iypJZTwhR9z9nZHWVSKRFbDTBm30OjXqqni0iWpXgSsEmLR8+aS4gCUmmnXnLrfKqbgq7t23lVcZx0oXjG26yiHVGRI0HNxzd0d4R4v2fKs/hH+LPkbeA1CZWjPe7LYLyzWyn46dt/mnBVJef0etELvN2A4I5cIWpP9OixTo2uUJNCDUUqoCIRWDaYd36lI7vkfws8GXd664/PBUGay6gtWFhBcWP9Md9Tf0jXjf/TJcrOb4KWvyuFFUXd+mzqIiOjbtxbwaMv9gRGc2C0qCcoU78sAFXb1EGMXNV2QSYoqtVjfQ3ZwzeCXXoQh4sZ7wLCyxeDHDvWgXDZqL3+Xf74kyWyFyk7WmAkoxY0GMHZbLrLlFz40jBwD5N2gpKKPESzPJYj8nXHfEd/4q0JQVrwWg1WBR7Yf+iOBa0YboppzQopZucE/xspPK1fIg3POxthFpzhafrCQfcjBRqR5m3RztO2UbSjB998nUKQe8n4UJRaB8YhXMsUg68STzzaIbcwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(39860400002)(366004)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(7416002)(5660300002)(1076003)(2906002)(26005)(8676002)(2616005)(8936002)(4326008)(86362001)(41300700001)(38350700005)(83380400001)(36756003)(66946007)(52116002)(66556008)(66476007)(6506007)(316002)(478600001)(966005)(6486002)(6512007)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GY11qIcdHe2tz+56QgGLD64NKR8nrYixOUVOWz8mRLCM8DKn5Kqj/kVlLPqz?=
 =?us-ascii?Q?8hCiULreGe6wYcn/a/gXfumdcSDsiLsZzI677JcW8I01vKpjQYdghnt/8BOr?=
 =?us-ascii?Q?BkAhX37T9BFtmDe9yZNw69Ja82oH9WLJTdfP41v5/yeg6jzUKcEtnzNlhDau?=
 =?us-ascii?Q?xmZ0c69XqTjFix7Wq7qhOb2+ErPyoJksgjLel88210Apih9IXrWRWJsyi/uB?=
 =?us-ascii?Q?Nj8D9dyte+vxOfW/39Rp88NZ7fTDE59FMtu/jiPlWzYk6k2fYaJFEMGKOk7e?=
 =?us-ascii?Q?JcYZouHtdR/Pbi+nJvr42I+P/hr41hf3K7wIeP+vKfAee4QQAmt47ZHGKB31?=
 =?us-ascii?Q?cgx6zc3f2xVk02w4YKUf1GqrqcCR5sjyMQjdSBjwnwvPNERR9EMEPsPhn1RE?=
 =?us-ascii?Q?af/HnW+T6APu36n2M+7QsoCGroUUWycyi2QgnnSt7Y4FPKjSi/EubO3/U1Sr?=
 =?us-ascii?Q?9YkV1RFZb6E+3fLWYrTFhpX4I7lD+Lv+HrqqNkr1cugWWTyVVBqDqua6OZzG?=
 =?us-ascii?Q?HBocq9jIvkDVo6rGzkhRTp19i//VOaBZV6DIZJF0x0h0akNE8l5GZiLF081d?=
 =?us-ascii?Q?qw/rsONy6EpNonMGaUPcrK8q3w6XZa2VfxtlN8ybQfIekc82FOWByHG1TYrF?=
 =?us-ascii?Q?qwMhDWXtzfPKz7bGhUK3rAF5uxF5fALXnftEZ/mRdphLlMq/cuPxAT3sIzQC?=
 =?us-ascii?Q?aOBXiYkSSGCXuTLq1dUUsTH9AVCDYITmXDmGHbTxVZRzZjvAiPClpmeSjGHa?=
 =?us-ascii?Q?4bZAII28eHVuwgNVWL1L7NhV9PKRvBL4gTcedW3RAfjayPH3bmCM0g5lJJ8n?=
 =?us-ascii?Q?OhX7q+rjx68ZsVzRrVii0df/Qv0bD28QtHlXtbMNgk50ST3kN8cQ3x4nf392?=
 =?us-ascii?Q?VshdSXQPbUYElr32KSlP/gwWuXBXGLmdvbD210QBjd0f7lae0s0X2Xmdpnu5?=
 =?us-ascii?Q?3P6rcgNlWJXgu4D9AtsQnF1A/3c7+ARfdzrDaIjnWIKq5W1pMytp60N1KApm?=
 =?us-ascii?Q?PeZo597WB3Z66ZMtJWf5HBw5LSf3gZe5IgK0uvwpDHeou82nK9DNoMSNmeoP?=
 =?us-ascii?Q?Z0H73RE4Xz8b8+Fi64kQWjKaz6Yb1H/vfOyzVSZZ/J/VqlXgG/4/n75aL5rA?=
 =?us-ascii?Q?/JXelsdrYQYIAXIJBysWv305AJoqPF73NQmHjWrTlS7XzhX/K/ljf2pT90qI?=
 =?us-ascii?Q?t87dAzDkf2vmjN/8QWGZ9z2/6YRzYxx6MNraD6dnZhUBXBWjJGZJoWbGWe+/?=
 =?us-ascii?Q?I8tnwW1h99G4Ho+fjOzdQhugENc3WW9DzgtSs1/QpVlAkmOdQDX8v1YA6kIU?=
 =?us-ascii?Q?SUjXHnUASOUw/RxYkwb/0+hP+gd4isiy1Gjgqb3Y0YLnbadWZ7Hy2rtZjeny?=
 =?us-ascii?Q?egC+w9hMjuX9psXrSuJIFD5HZt5JXdO+q1yw8qtquoG7cnUFXZ220qJ/eUdo?=
 =?us-ascii?Q?5Xq3qz1tkHSWa2Y4CmnE24K39Olu/9lV5e2g3WYE4FAgj2astD+tOk5U74qa?=
 =?us-ascii?Q?WtNvNoahOYIbi0MmFaxk0gVbMqd0XO5wprdtYXkaDIC+8dxxyH0VjbaiMGYh?=
 =?us-ascii?Q?qzV1KjSuPCyOjAI6ay+vjV2JCsQBZEGw99J6Pnx4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9068ceb4-8efd-42b0-3458-08dbea6f416e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 08:52:56.7078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JI21vPmu+i53fMqa68vPf3azifwJ0RhLvU4jT8OMBKCLQlZWVUcFoyL5lds316uURU0R2ZCUMvvKw+sQiMW7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637
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
Cc: mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com,
 kernel test robot <lkp@intel.com>, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a couple of building warnings on used uninitialized 'best_m' and
'best_n' local variables by initializing them to zero.  This makes compiler
happy only.  No functional change.

Fixes: ce62f8ea7e3f ("drm/bridge: imx: Add i.MX93 MIPI DSI support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311151746.f7u7dzbZ-lkp@intel.com/
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index 3ff30ce80c5b..7b3b4f985098 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -226,8 +226,8 @@ dphy_pll_get_configure_from_opts(struct imx93_dsi *dsi,
 	unsigned long fout;
 	unsigned long best_fout = 0;
 	unsigned int fvco_div;
-	unsigned int min_n, max_n, n, best_n;
-	unsigned long m, best_m;
+	unsigned int min_n, max_n, n, best_n = 0;
+	unsigned long m, best_m = 0;
 	unsigned long min_delta = ULONG_MAX;
 	unsigned long delta;
 	u64 tmp;
-- 
2.37.1

