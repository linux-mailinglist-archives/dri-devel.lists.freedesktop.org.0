Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722F2B2DFB2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6901810E760;
	Wed, 20 Aug 2025 14:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="HAU/Ka/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023093.outbound.protection.outlook.com
 [40.107.162.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EFA10E760
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:41:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVVgQshOvHELx9B6MqVMbH8yiD1LgNwJMxCJoaS6/4/zXLDCHEsJKEIgBv0n5zNeL1KUVakrsS0KgsHiQe+mfppehuI2FCy0Tkdrx/Btm7JIo+Y8fhpxhnFplSF7w/y9ANJCZFveUKD6qq8wHeDV6F/l7AUAchhiiUU2M+ParNqIOujEHhNVSHUUw2QlJho3VfqQuP9WjRUis85I4+DeIY0pi4D1DnapJUZzzqqgrE897MHpP7Td6OyZod8hNomAjDeOP+/T2uZ8lCfGmm24b0R864hqHW/uD6WcmrkiTI40AY8v/nf0IT42KOdPWsJkmdoNECHKOzKprwD2VD6XDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfMxJP0pdVtq206pLoe4LScUn2lXTyB+qxUIMZrYnUE=;
 b=xtmiTilaFLYcDan29PLBu8kTAYEjIpatT63lxmooEX7OOk4NKVmOTkSMSiEPnnathnqZ2Wz/9w5An+xdc4BAW08DSWI4EEIQlwygPgivdVsy5Y1W4S/bqmaLsojbOsMu1wmKfaNwSHPs10jXV5ZwmnVIUf7NbQRg058je/gi+HfZR3b+CzyaMd/0CbqDOYwW1lca7WuNeJnXdYGliulAVjy3vmcdrQ9K260FOhL7W0j8nCFvBJ5e4F2/d9XTGXJd/5r6HEnnrffXlq5+XTf+ZPGQXQMHeAslpuDbbulwLeERywnKK7RfJROk81tMdhvuPUmfWfWhk+HnOWc262u5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfMxJP0pdVtq206pLoe4LScUn2lXTyB+qxUIMZrYnUE=;
 b=HAU/Ka/re/0yLbWE41j3KoQRInDk398As0TS73o+ZpCmQ5OJyLvgFn3hwLclgE0BHzKHp+dlvOj/86R8o7q1JbgjsNqcyDLyBYcJe56koI2MC/OT+1Jd0WKBoD7hD0T/ZYf1Lh5oGwZqQL49rnSAJt6+UANWA+0rKBgrPx7smIDvswEEDOE7ZwniZk8z8dq1H/QPbS9VjdW7ioUyPgJXbjAvE38WlX9hO+S0NLHfs0j9aMR7vtMn5636ERIQMi1efl0CVUg1xOqanFqu3WLxjUnK9zO0uhm5Dt6H+4QDtfIf09ivOAqZfr8x24IfUZHlqAljzx10dHS5QJRC5NhlAQ==
Received: from DB6PR0301CA0067.eurprd03.prod.outlook.com (2603:10a6:6:30::14)
 by AM0PR04MB6979.eurprd04.prod.outlook.com (2603:10a6:208:18b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 14:41:38 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::7d) by DB6PR0301CA0067.outlook.office365.com
 (2603:10a6:6:30::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.13 via Frontend Transport; Wed,
 20 Aug 2025 14:41:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 14:41:38 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com (40.93.64.4) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Wed, 20 Aug 2025 14:41:37 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PAXPR04MB9006.eurprd04.prod.outlook.com (2603:10a6:102:20e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 14:41:35 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 14:41:35 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
Date: Wed, 20 Aug 2025 16:40:34 +0200
Message-ID: <20250820144128.17603-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820144128.17603-1-mike.looijmans@topic.nl>
References: <20250820144128.17603-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fae92992-2446-47e5-b484-2a25fac0b454@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0118.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::35) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PAXPR04MB9006:EE_|DB1PEPF000509F7:EE_|AM0PR04MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: dc710ccd-48a6-4fac-8b50-08dddff7ab79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?itqpdIZxZtV7oRD/BGqC/gE4pn8g17YzLJ1+WLvx7C+Hz1EqxFyHQr7/uuab?=
 =?us-ascii?Q?+Qha33Bh63fbLncX7iPTeYb8NVTG6+4bejjWiRggQkEAn8Y4VpNPbN4KLr9W?=
 =?us-ascii?Q?/b6sIeOMCsmXYqlc5+k68S3jAjTapv6Rypy0M1Pu8mz2wwFQHOHRRjWVTNxr?=
 =?us-ascii?Q?6WSi/L45XVLZnf4nSlcAHKFLCcuVkzLv9JeQRtoj40bTZuN+XOCAp/uOcda0?=
 =?us-ascii?Q?YEoxsmPzRwooTXSZJPJnVtuZfd4jSrr2iN6Qf/HW5Xy3039yDfxWtEhtjiWM?=
 =?us-ascii?Q?90VWEZ+1xHJNRmV9LCdLlHB9Bp5syc2IPTY7EW2lPZWfI1Fx3iEbfctb6w62?=
 =?us-ascii?Q?MOVb9LLkZNmstcAgYVl5LEHEVkWyFTfOQN6tJx4wEgAys+wY7DX258JmId97?=
 =?us-ascii?Q?qPjr2I3O65EflQNQuz6KtXKMFYc+Sq67x34HcFUutUCcFg6p6VklAmAKZPsH?=
 =?us-ascii?Q?m20A5KJvmUcAjTwxBH5IBp8PJB8pmdzYG6zJcqSrBNWgDHvYcuQ+Ik6c/GSl?=
 =?us-ascii?Q?1DpHaJ77ldM/RM+M/THuFqxHdYL2hfjVJ1xVkgf3QYPiAuODauhOqpSKE4JI?=
 =?us-ascii?Q?aYGiqDXZ8DaXs4b+7NuZaipay1vrWcskH5zetfe4j/9FvSdSmRtwp1zr5MFO?=
 =?us-ascii?Q?uw1XbuxTLhXbeylSO2rY+ZhsZ6jjGsBQEWmAC+X06/3cx1Dx4/iHCWzqDa1E?=
 =?us-ascii?Q?KENwcz0+sOlIYmp8YRddOtICTHVu0EgV0voe05elyMxZ3hks+MgK6ACaaa0o?=
 =?us-ascii?Q?o690K/pmVjsuCCtKrjcTjWSh7ZOtKWZJuzHdy3EdoAmt5y4COnvTdCUefMgr?=
 =?us-ascii?Q?5/ESchU0zOfDlyPLLme+k1vMVomGshV5DrwzefVcMZwU0AprawWyLirmf+86?=
 =?us-ascii?Q?LPGnL9v9q8x1ENnQXs4BVGL5hEGlgrq/vToel2xqPoQOx5s823WeTqIGvkOR?=
 =?us-ascii?Q?LyODgcULO1Nnx88OU9tOhxuQTN0W74cpKZ3tAGFQMykXG3LXLBISOPiZU+FU?=
 =?us-ascii?Q?o68eF7s3OerLDv8FTEmCO3IEvABqvasoi/efAjKqh9YOwSdoe06BoGz3lZqx?=
 =?us-ascii?Q?oFWXbldBCbnWklFLUwtPc6DdOUaZROC0HdVY/3nSbcSt/PXEuPqek9nbDceW?=
 =?us-ascii?Q?vBJxao9iZa3UJVDTRv6ljwabTtLgzds0ewMRo7WO8hCg58OybC/0rQVdstkw?=
 =?us-ascii?Q?2/Yca9G78x/pAstjXvprZhXpR0G2/3158IhU0RkePjbPhAI+1je4jUP4eikx?=
 =?us-ascii?Q?Htlz9TutDR6q/x8XgEEvr//puDbBaE5VGnEZIHnMbwLKo7JhD+yz0u5XrplB?=
 =?us-ascii?Q?uwVknJkcd792soQ3gCrd+/8UQWW4RCpnzgEKnHHmsUxhu6i3jxfiTe8w+2wK?=
 =?us-ascii?Q?fD3z3afTCDPMizQHWFcI7xAAMzXCUeOpthhE7R0x99lZCmaHlhhVz1MCgRxr?=
 =?us-ascii?Q?HFpqeH6o1GY=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9006
X-CodeTwo-MessageID: 683ebe5d-9e41-4226-b095-f98fc7a19535.20250820144137@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 18d9891d-8614-4d1c-ec8f-08dddff7a961
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|14060799003|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ulkAlZ+MINT+bTVZY+zXGrPh6y+OsuUDTAgx0/AqgS2E89u4ICcwCJX5t9n6?=
 =?us-ascii?Q?RDIil8OFysiZb2yrvsLAep8aWeS1QxT/cuD7RLsYPV7DYwZpzyusQD8tJj7b?=
 =?us-ascii?Q?k8Ab6HbusJbnQnd0wFY8YzX4dyNbaKqi4YXVVYplf2KePKDvC68cas/5zpPG?=
 =?us-ascii?Q?SObDP++PCxRJqMX/YT5O/dUvdJpDZMY6mn9z0UCVMwwIz+qGt91ertnccuD+?=
 =?us-ascii?Q?B2PI39hiuhzQ2PelfCuobc7wJNiY99hSaR5LPUeox7p3vILjI0KQVouIOddE?=
 =?us-ascii?Q?pY9XTLEQFBne833uZXNVuLVVd0VPO5zMGkZzXUuPBzrsf1aE5YiRv9E0xsSk?=
 =?us-ascii?Q?rQHjVSKRgb8Ho4+mkEBkABfyihEXTmByqnT2Pa298CqiA8krGoZ8vaVxizKy?=
 =?us-ascii?Q?GZKs4dDdjyqFse1qfOb8xV5F8xCkurxhDL69JJqxExatBGYbyS4RM4i0FBJY?=
 =?us-ascii?Q?eHu5YJpOlrVKwldskpc3Vn2cvNbGWvlUFPVXYKU7j1fBipH5dCKgqMUrytST?=
 =?us-ascii?Q?NLUl+Ymzulz4mfwCyZEzYfrnuvoMZDfNZr1uAJcxxk4H9q/nXQMwGwnXjHkq?=
 =?us-ascii?Q?YtWT/ZvzRb5eR+cI5y6bRSriJTbWLPJUl/HkgbKAVb87Rd4D+uxVCr8ZzBWY?=
 =?us-ascii?Q?eHypUNf5coHHRiRujzaftQw6Oc5QD0GkXR673UK7rO3jmXiiL8Jd/4MYICub?=
 =?us-ascii?Q?+GO1GYPen2kEbQBMQgSIHGV7KiVS+GYvPRTHWlqBUkQ1ba02k8Xv2LHsraHN?=
 =?us-ascii?Q?Gq3SNV7a6oXj84Hys1wYwrwYRuEI7nqW0bIs19h/2rLXUF6Whv3IFN/qBbAq?=
 =?us-ascii?Q?swloD2VWQIFPq0sSuCKt+j8NQuZFcePmwG68psR7gNEw5+nOv4J565ZgKOqo?=
 =?us-ascii?Q?v8i3OYUH0oodb7B9Ie4D1mmUKeo/zkeFrBGGO2UlxxgMG2SW0HjGkG87dofI?=
 =?us-ascii?Q?r5Hrmecsf7DunI109W7E0RxDVqjilTap9P9hQaQgWgpLud8OHrDj01NdJv2f?=
 =?us-ascii?Q?x/XiBw4vi8UVXPT8T5iNtf2z5AJ3Vl2OAHNCstdKNKCu4dmLbTVqWD2pcSES?=
 =?us-ascii?Q?LBmxwiaVWv4Dc7HYKbARS2juwK1UmBYXQLKaoJhZj4/Rbfidzid7WZJjIzku?=
 =?us-ascii?Q?u61Dw5O6lQiZR9LrBMc1bNtO+nLNEBdBBzQinyipfzN71lQsaSNRu/N2q2NA?=
 =?us-ascii?Q?FCTZ+6Xe8Yn9mBKMaLUsUe3i1237fV3IGEc9xk2LZI2S5JUugupIHiIp/+8r?=
 =?us-ascii?Q?+CIL7q73UOIc7d+C5fR8WNIDL7RvGtWi9tEcd70QuaHaiwx3Oj99aHsSO8Cy?=
 =?us-ascii?Q?LZBTzrJzWak5WCRT4c2FPayNZ6/JFeWQntTUQp5dkmxj+gdLlRScdhcEMZaX?=
 =?us-ascii?Q?oa7M9VluJ21gB5C8S6t4VMou7lyH0VcmwMwVredmfZtIPceWMLXpowOnpxEC?=
 =?us-ascii?Q?fgpj+lhbjS3scfsGaz9kv2N/KTbDGVDYzYN1TLMqDd7m4SKDntFN+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(14060799003)(35042699022)(1800799024)(82310400026);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 14:41:38.0536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc710ccd-48a6-4fac-8b50-08dddff7ab79
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6979
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

Add DT binding document for TI TMDS181 and SN65DP159 HDMI retimers.

The two chips have similar register maps, but different applications
(source vs. sink).

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

---

Changes in v3:
Fix duplicate links
Add vcc-supply and vdd-supply
Fix missing type for ti,slew-rate

Changes in v2:
Document driver specific bindings like slew-rate and threshold

 .../bindings/display/bridge/ti,tmds181.yaml   | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181.ya=
ml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
new file mode 100644
index 000000000000..7433e694fae0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,tmds181.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TMDS181 and SN65DP159 HDMI retimer/redriver chips
+
+maintainers:
+  - Mike Looijmans <mike.looijmans@topic.nl>
+
+description: |
+  Texas Instruments TMDS181 and SN65DP159 retimer and redriver chips.
+  https://www.ti.com/product/TMDS181
+  https://www.ti.com/product/SN65DP159
+
+properties:
+  compatible:
+    enum:
+      - ti,tmds181
+      - ti,sn65dp159
+
+  reg:
+    enum:
+      - 0x5b
+      - 0x5c
+      - 0x5d
+      - 0x5e
+
+  oe-gpios:
+    maxItems: 1
+    description: GPIO specifier for OE pin (active high).
+
+  vdd-supply:
+    description: Core power supply, 1.1V
+
+  vcc-supply:
+    description: IO power supply, 3.3V
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for HDMI (ish) input
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for HDMI output (panel or bridge)
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+    required:
+      - port@0
+      - port@1
+
+  ti,source-mode:
+    type: boolean
+    description:
+      Force chip to operate in "source" mode. Allows to use
+      a TMDS181 chip (which defaults to sink) as cable driver.
+
+  ti,sink-mode:
+    type: boolean
+    description:
+      Force chip to operate in "sink" mode. Allows to use
+      a DP159 chip (defaults to source) for incoming signals.
+
+  ti,retimer-threshold-hz:
+    minimum: 25000000
+    maximum: 600000000
+    default: 200000000
+    description:
+      Cross-over point. Up until this pixel clock frequency
+      the chip remains in the low-power redriver mode. Above
+      the threshold the chip should operate in retimer mode.
+
+  ti,dvi-mode:
+    type: boolean
+    description: Makes the DP159 chip operate in DVI mode.
+
+  ti,slew-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 3
+    description: Set slew rate, 0 is slowest, 3 is fastest.
+
+  ti,disable-equalizer:
+    type: boolean
+    description: Disable the equalizer (to save power).
+
+  ti,adaptive-equalizer:
+    type: boolean
+    description: Set the equalizer to adaptive mode.
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        bridge@5b {
+            compatible =3D "ti,sn65dp159";
+            reg =3D <0x5b>;
+
+            oe-gpios =3D <&gpio2 1 GPIO_ACTIVE_HIGH>;
+
+            ports {
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+
+                port@0 {
+                    reg =3D <0>;
+
+                    endpoint {
+                        remote-endpoint =3D <&encoder_out>;
+                    };
+                };
+
+                port@1 {
+                    reg =3D <1>;
+
+                    endpoint {
+                        remote-endpoint =3D <&hdmi_connector_in>;
+                    };
+                };
+            };
+        };
+    };
--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
