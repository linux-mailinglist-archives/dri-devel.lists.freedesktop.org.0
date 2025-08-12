Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F347B22B1D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 16:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C974C10E603;
	Tue, 12 Aug 2025 14:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="k0j+tgnz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023108.outbound.protection.outlook.com
 [40.107.159.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EC210E605
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 14:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQQCqw04Wiy2QW+acCxiRXtdqmN8KFXyZgE7n2gyfpHMV3XnEHDqGiP5JZEFyJcJ8HnyZk20yye+YIl3kv2NNDclxteOv+twx4N0uhRNi6cD/pZt40osQC/YJqIdQNPLMNbd8wPaJUyaPePykLvj7r1676hOfCQJY8tGBCrKWnjpFZjYmfFHrasV40DUmEVPjpT/MwctTsNBJEyodTjY/vmcVGRLqy4m96GiDHMj5uFKEqemfIXbNKlZJyAZXWpbmMFXQl/Ab82iQbVVuzkQAW5frt4kMIUZVxCb2Nqj/LlZdMvccAr7frzI7ZomYMNN/LRnxhdb/QmfNBlMC8vRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8fJ/MhRL5ppMIpL1AKrFeiG8Fmjv7SJt7sh+jUS0ks=;
 b=SoHrK13ki8wkpcOggF+svAQhDSb4Zcub5RiSDgRvdPFucMIVOusEC/RP5WQwJK8g/UnDEJotauFBLLFicNI9HEqb0x3b9TyExEMyz7aczRxfDzLpJrwgv4Q9cQqX6+cZ4K8ybwFK0yjQgjCNqP4Vht+2KYvMIHKusmZf978CFRBH0DWm7+d4CLfOnN8u3jt4nvN8C+vNe0WoxPP+Rd9JmI810F63BXdKlsKNF0bIiaiDvA5jg/XUJyGkLmNusOa+C/JfL7QDixqS7mIqiUogKBdL9L7yIijchrkB5MTrP+x0BDarHBIN2Rzw6thOWtfFXU8SiY0p4Y2itp2p5T6NLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8fJ/MhRL5ppMIpL1AKrFeiG8Fmjv7SJt7sh+jUS0ks=;
 b=k0j+tgnzwpD1zRayPDY5nWHXfN5ZmuXXcGZ6voeyhGcTNcBAA1M1sysuYNI9mKhaigt78iTV8wA+6SeyHF0LGerqG9eE8efeqrplHc4kDklZdWzpJ0miBZfGH3XtodmYfih1zwE03deBsAbYMnTK4W5xANbbt7MYGJCETKivim/swagcVndyXevpDdriBHU69I/5bl1kIfpOq4y68dUiO602mC+PU+rZ3ARA9qg5cUfMx4JByO5ldUr+nFs8kI3a1rpJtZFwAZwV1zkkQU3PBqA/B7byNYzWxxobBqjl0n8EaFPQBi7fJWsJNTqPCDoLlogMHBk6yJvtvrh0k49iNg==
Received: from DUZPR01CA0108.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::23) by VI0PR04MB10903.eurprd04.prod.outlook.com
 (2603:10a6:800:265::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.11; Tue, 12 Aug
 2025 14:53:11 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::e1) by DUZPR01CA0108.outlook.office365.com
 (2603:10a6:10:4bb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.13 via Frontend Transport; Tue,
 12 Aug 2025 14:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 14:53:11 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com (40.93.64.12) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 12 Aug 2025 14:53:10 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GV1PR04MB10193.eurprd04.prod.outlook.com (2603:10a6:150:1a4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 14:53:06 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 14:53:04 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Tue, 12 Aug 2025 16:51:35 +0200
Message-ID: <20250812145256.135645-3-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812145256.135645-1-mike.looijmans@topic.nl>
References: <20250812145256.135645-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6fffab14-bc0e-422f-81bd-f55176f1f6c8@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GV1PR04MB10193:EE_|DB3PEPF00008860:EE_|VI0PR04MB10903:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b64406-a42a-4ea8-ef9c-08ddd9aff52d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?4xcvrMO8tXBRPS594RNVwYUn4O35spKX4bLYkEor2sktyQJcsb3P5S3dWyW5?=
 =?us-ascii?Q?ez8bLMcWmR5zMZmGr67v8eRk2QMsg7ZUoxvCuPXeTy7Clnb3cQ77gy8Yc4tx?=
 =?us-ascii?Q?Wa82pHiRsOiEzHtgvrRRUqfhAgEy7ozlfg0srDksG7VIPwwvHgEPRcwOx1kS?=
 =?us-ascii?Q?40nxmIPPhz52hfqV0q+8Mce2zKuXMqyD1colT9cVpEU4JrK56A0joANqKulj?=
 =?us-ascii?Q?WFLrXx0Y/5Lwow3m2PtKqj8MBP0E5tJwjAOCWltUu/klh3GF74woScfucg0U?=
 =?us-ascii?Q?V716ZASrJmCtOcyoe2IFvwRy0svyFG0M0/0wo+I/ik+dntnW4sItT52qJQIa?=
 =?us-ascii?Q?dJ5e8Ohy+fEPwC8GmsP+4DSGObg0y107fZ2FGt6ao5sbOXjOSIqOQ50nY4zL?=
 =?us-ascii?Q?3PJPVv8SbNuVTjSWQk3mKQAblNTvHoGbwVGIKJc/lmBqCUp0lvDIKNyCV2bL?=
 =?us-ascii?Q?RRb0J48goJLstn6/GzDYIX8Y9O0e4QriPwIQbn0EGE954Heac87JjGqE74+b?=
 =?us-ascii?Q?5Zr8IMxMwRjo21a+KEAovmtszaaEEyi+qWACrT54J2ya2hMMHGwEmL40qw5n?=
 =?us-ascii?Q?JbLjhGfFmrPvG7XkHG5n+CCbljgOAfbBUC4ZyjRoNOhcyavJpRJUfuZDONyF?=
 =?us-ascii?Q?+OTA4ZqaGEmHbXSiziNowGdSamNtJADncePJ8lXgyfF6OSW2A7CHmQgruKAX?=
 =?us-ascii?Q?NSO+L5DdTbaOo5Y6/RootiU7Xw2YhJXu2ZZjgVVFhcnavDTJOi/9TNURwzmC?=
 =?us-ascii?Q?FlBJqZC9RHo+BBDJ4s3lSytv6+ZFuWDdG/bRLedqI08O+v0VRO6ps0SiSIZY?=
 =?us-ascii?Q?4cs2Pz+jQ0WuRVudUlyhY2/2ZsuVmjmFxnCC3EP9k4ikg744HlRR3k5A2zwH?=
 =?us-ascii?Q?jP+dzxjurwIuvjyxbSEZoNxqxrbntoSQgw8pZ0NA0DKu30Sd5m8rUsEumJR2?=
 =?us-ascii?Q?1VlVG+uRzRmFdfyv5m4FvWtfGb/X1RJOiNPnMRVC1kh0H1m6+X46eoUsaREs?=
 =?us-ascii?Q?+/ogbIkYd0Aajo2TCD+YyCtS84tsLqj/YlRY3G9hoU+qFLSKV6vHN9egezpb?=
 =?us-ascii?Q?5Dmi0+GCwMDHJRlPwnzs4FCuShXM6ygNvwSz2HEhJpJNUvYkUgyKVPguC+P1?=
 =?us-ascii?Q?ZcH9mJm/TylKt5j1BZaaSwjxuDI4vnnhcBKd6ZtNEWwzOXgsL0FqDDVtWePn?=
 =?us-ascii?Q?1con6DhzF0u3lc+2IyByT4Pkv5wgijekEx3/WnefKlm2h1EB5aK5GackLwHK?=
 =?us-ascii?Q?CDTZ0BVop0kUdOcwj7AQOcmj9TYmGmbfezA/HKS8wmC/JfktqXqshQ0i6J1B?=
 =?us-ascii?Q?AD5IXJaDAO5jBLc44/G9hXOB+dyRWBIPaa1lJaUfWuGXcNmHq01VLtn/oVCX?=
 =?us-ascii?Q?J3K5cVajWE8R5h9mqPqusswXIw322nxF8uo7+ade5qJM0OuNx0VmSCnOWPfc?=
 =?us-ascii?Q?L+vzgy8UfUs=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10193
X-CodeTwo-MessageID: 55ee26a4-e1ba-4604-8152-f344fe1a54ca.20250812145310@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 379ec461-c7fd-44c2-8ce1-08ddd9aff113
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|14060799003|36860700013|7416014|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0KrSabm5CHCc2KW27I9/ZhpUu0BTuwWFaOLOBcVCg3lN3w7IdW9S772c5dWR?=
 =?us-ascii?Q?4YVWO4yRI4MZe/78X4epqe//5mTF1Gt9WULiGiZ9dT0AufHO0+KHUWH2cLzZ?=
 =?us-ascii?Q?UvXLJz7GPJTLvlU1WekPsZ6y09mMiETn8uqhNSvQ0YpRfA2bK2W7wYwkOG4H?=
 =?us-ascii?Q?0wX7/zBqryDrZnQfESa+a2Sks8RRNM+B83jDrZaxBWBlVOU6GYs958egrINA?=
 =?us-ascii?Q?TiYvTwmunuV+h8yY69UN3bvVNHQSJdYM1laQ6oIMReS39pOZk6JwMjf2sKAB?=
 =?us-ascii?Q?MpLJ/HFGjeQ4cmztwSsgb017vQQrxcJei6f0WxAwi8n1QOXgmJpIvumySMFE?=
 =?us-ascii?Q?ClnerCT7raGXWp+Vujyiy0YEE2a7bhJ/kIxNl0iP/om0p1jnrkjRpq7XpC/N?=
 =?us-ascii?Q?NSmw1xDmX6Kzb3OemzS7NwY/hwbhyvLJOHbD0R0LaSLhcmjepR5oDHFdEXbB?=
 =?us-ascii?Q?ID6Oi0PVazsJ8dAGJ57AIxxnazNl86l48ly5mbQr2raCOGgL7QSZWyuWzYiq?=
 =?us-ascii?Q?TKYSU+cyx/5XipkxEsAhTvFmyUq9VKxVJpp+esKAh9VVxnmYoLIc4PPrfJQX?=
 =?us-ascii?Q?tNnC8CKzf6BK4yJt9FLQfRKwuEGVQZEqhJPtaZS6DMf7LH6VEV40A5DDRJR7?=
 =?us-ascii?Q?pfnVLa1JJhOByV16iYudG1/mMm7LhYD3dHlnixi+GEVoyGp6/9cSHiUj9chK?=
 =?us-ascii?Q?lCR+JPAvZZLF91r9/517ftoUOgli00XmzL7iINPst94KTmE9dIGcF0du3fWF?=
 =?us-ascii?Q?twLSwA5RuxqzIEZLFL5Wsk7eX9EMJWTk10rpV4RgwtNeFD7MKJck3vUtilzf?=
 =?us-ascii?Q?TGYaBRKeDfoKms/u8/KA3k+75A4+QCbaxWCXYNuEDtuiTdXacmJJnXa0pYmd?=
 =?us-ascii?Q?9QjC/yaJRUoXKo9dE+RAObcw8eQY6KSu8mOHcqMGEMcc/M9UKfundGWC4yPH?=
 =?us-ascii?Q?lHVzmuI4DHjHeO82xQ7/wfFA8XtZNthkKUs6AATq8ouHXp7FmCnA0+UksZvA?=
 =?us-ascii?Q?QxEpTJ6V9EnMqSAq7RjlPK18qVao8yDEphKFJk02nhya3dnBuOKmOOO2NKeA?=
 =?us-ascii?Q?/JRWQh0Utfu88dR6cmeXHYf55BTyH3k8DKXVpnc4c/f15zEolWx3B4S+PG0L?=
 =?us-ascii?Q?yL0zVhiFN0xadcA+2KJ6xgWWMQDDyxqDkRx68F0EAsxUCnTuzO38a4hx6KVb?=
 =?us-ascii?Q?9JV+eyPlpmTgxiEqCR+E8rvthF/dQSzMu9qhKMHZ0aBSLu8C9qp6GdBl3ATQ?=
 =?us-ascii?Q?CHvoii/YNjRU42GhpM8T6jhPQbfvORPdgfSkY32MgEHVNswjKapn+lCUEOP3?=
 =?us-ascii?Q?o8VbUJNd3+2MAP6EWfUL3OUXkSDOFmzXgcnGNb0hACJ6G+kBO1PUeO/mbKqp?=
 =?us-ascii?Q?nrCuLbykUzLdkdEjAQAu09wevvgG3EkEXFFcO/qxBlUrK0XDMBSbzrDaYWg1?=
 =?us-ascii?Q?me4ymOb7YQB/Pl0TbfMA/K2Cr20cXc5wzM6tJ6bEygCgjpPQjdNA/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(14060799003)(36860700013)(7416014)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 14:53:11.0293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b64406-a42a-4ea8-ef9c-08ddd9aff52d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10903
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

The tmds181 and sn65dp159 are "retimers" and hence can be considered
HDMI-to-HDMI bridges. Typical usage is to convert the output of an
FPGA into a valid HDMI signal, and it will typically be inserted
between an encoder and hdmi-connector.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 drivers/gpu/drm/bridge/Kconfig      |  11 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c | 512 ++++++++++++++++++++++++++++
 3 files changed, 524 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfi=
g
index b9e0ca85226a..753177fc9b50 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
=20
+config DRM_TI_TMDS181
+        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
+	depends on OF
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
+	  The SN65DP159 provides output into a cable (source) whereas the
+	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
+	  can be set up as source or sink though.
+
 config DRM_TI_TPD12S015
 	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makef=
ile
index 245e8a27e3fc..f4b5089e903c 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
 obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
 obj-$(CONFIG_DRM_TI_TDP158) +=3D ti-tdp158.o
 obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
+obj-$(CONFIG_DRM_TI_TMDS181) +=3D ti-tmds181.o
 obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
 obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
 obj-$(CONFIG_DRM_ITE_IT66121) +=3D ite-it66121.o
diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/bridge/t=
i-tmds181.c
new file mode 100644
index 000000000000..6fbbc13ddc10
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-tmds181.c
@@ -0,0 +1,512 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
+ *
+ * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
+ *
+ * based on code
+ * Copyright (C) 2007 Hans Verkuil
+ * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/i2c.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/gpio/consumer.h>
+#include <linux/delay.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver/retim=
er");
+MODULE_AUTHOR("Mike Looijmans");
+MODULE_LICENSE("GPL");
+
+#define TMDS181_REG_ID		0
+#define TMDS181_REG_REV		0x8
+#define TMDS181_REG_CTRL9	0x9
+/* Registers A and B have a volatile bit, but we don't use it, so cache is=
 ok */
+#define TMDS181_REG_CTRLA	0xA
+#define TMDS181_REG_CTRLB	0xB
+#define TMDS181_REG_CTRLC	0xC
+#define TMDS181_REG_EQUALIZER	0xD
+#define TMDS181_REG_EYESCAN	0xE
+
+enum tmds181_chip {
+	tmds181,
+	dp159,
+};
+
+struct tmds181_data {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct drm_bridge *next_bridge;
+	struct drm_bridge bridge;
+	enum tmds181_chip chip;
+};
+
+static inline struct tmds181_data *
+drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct tmds181_data, bridge);
+}
+
+/* Set "apply" bit in control register after making changes */
+static int tmds181_apply_changes(struct tmds181_data *data)
+{
+	return regmap_write_bits(data->regmap,
+		TMDS181_REG_CTRLA, BIT(2), BIT(2));
+}
+
+static int tmds181_attach(struct drm_bridge *bridge, struct drm_encoder *e=
ncoder,
+			  enum drm_bridge_attach_flags flags)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+
+	return drm_bridge_attach(encoder, data->next_bridge, bridge, flags);
+}
+
+static enum drm_mode_status
+tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_display_inf=
o *info,
+		   const struct drm_display_mode *mode)
+{
+	/* Clock limits: clk between 25 and 350 MHz, clk is 1/10 of bit clock */
+	if (mode->clock < 25000)
+		return MODE_CLOCK_LOW;
+
+	/* The actual HDMI clock (if provided) cannot exceed 350MHz */
+	if (mode->crtc_clock > 350000)
+		return MODE_CLOCK_HIGH;
+
+	/*
+	 * When in 4k mode, the clock is 1/40th of the bitrate. The limit is
+	 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
+	 */
+	if (mode->clock > 600000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static void tmds181_enable(struct drm_bridge *bridge)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+
+	/* Clear the PD_EN bit */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9, BIT(3), 0);
+}
+
+static void tmds181_disable(struct drm_bridge *bridge)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+
+	/* Set the PD_EN bit */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9, BIT(3), BIT(3));
+}
+
+static const struct drm_bridge_funcs tmds181_bridge_funcs =3D {
+	.attach		=3D tmds181_attach,
+	.mode_valid	=3D tmds181_mode_valid,
+	.enable		=3D tmds181_enable,
+	.disable	=3D tmds181_disable,
+};
+
+static const char * const tmds181_modes[] =3D {
+	"redriver",
+	"auto1",
+	"auto2",
+	"retimer",
+};
+
+static ssize_t mode_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct tmds181_data *data =3D dev_get_drvdata(dev);
+	const char *equalizer;
+	u32 val;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val & BIT(4)) {
+		if (val & BIT(5))
+			equalizer =3D "eq-adaptive";
+		else
+			equalizer =3D "eq-fixed";
+	} else {
+		equalizer =3D "eq-disabled";
+	}
+
+	return scnprintf(buf, PAGE_SIZE, "%6s %s %s\n",
+			(val & BIT(7)) ? "sink" : "source",
+			tmds181_modes[val & 0x03],
+			equalizer);
+}
+
+static ssize_t mode_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t len)
+{
+	struct tmds181_data *data =3D dev_get_drvdata(dev);
+	u32 val;
+	int ret;
+	int i;
+
+	/* Strip trailing newline(s) for being user friendly */
+	while (len && buf[len] =3D=3D '\n')
+		--len;
+
+	/* Need at least 4 actual characters */
+	if (len < 4)
+		return -EINVAL;
+
+	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
+	if (ret < 0)
+		return ret;
+
+	for (i =3D 0; i < ARRAY_SIZE(tmds181_modes); ++i) {
+		if (strncmp(tmds181_modes[i], buf, len) =3D=3D 0) {
+			val &=3D ~0x03;
+			val |=3D i;
+			break;
+		}
+	}
+
+	if (strncmp("sink", buf, len) =3D=3D 0)
+		val |=3D BIT(7);
+
+	if (strncmp("source", buf, len) =3D=3D 0)
+		val &=3D ~BIT(7);
+
+	if (strncmp("eq-", buf, 3) =3D=3D 0) {
+		switch (buf[3]) {
+		case 'a': /* adaptive */
+			val |=3D BIT(4) | BIT(5);
+			break;
+		case 'f': /* fixed */
+			val |=3D BIT(4);
+			val &=3D ~BIT(5);
+			break;
+		case 'd': /* disable */
+			val &=3D ~(BIT(4) | BIT(5));
+			break;
+		}
+	}
+
+	/* Always set the "apply changes" bit */
+	val |=3D BIT(2);
+
+	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLA, val);
+	if (ret < 0)
+		return ret;
+
+	return len;
+}
+
+/* termination for HDMI TX: 0=3Doff, 1=3D150..300, 3=3D75..150 ohms */
+static ssize_t termination_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct tmds181_data *data =3D dev_get_drvdata(dev);
+	u32 val;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLB, &val);
+	if (ret < 0)
+		return ret;
+
+	val >>=3D 3;
+	val &=3D 0x03;
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n", val);
+}
+
+static ssize_t termination_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t len)
+{
+	struct tmds181_data *data =3D dev_get_drvdata(dev);
+	u32 val;
+	unsigned long newval;
+	int ret;
+
+	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLB, &val);
+	if (ret < 0)
+		return ret;
+
+	ret =3D kstrtoul((const char *) buf, 10, &newval);
+	if (ret)
+		return ret;
+
+	if (newval > 3)
+		return -EINVAL;
+
+	val &=3D ~(0x03 << 3);
+	val |=3D newval << 3;
+
+	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
+	if (ret < 0)
+		return ret;
+
+	return len;
+}
+
+static DEVICE_ATTR_RW(mode);
+static DEVICE_ATTR_RW(termination);
+
+static struct attribute *tmds181_attrs[] =3D {
+	&dev_attr_mode.attr,
+	&dev_attr_termination.attr,
+	NULL,
+};
+
+static const struct attribute_group tmds181_attr_group =3D {
+	.attrs =3D tmds181_attrs,
+};
+
+static const u8 tmds181_id_tmds181[8] =3D "TMDS181 ";
+static const u8 tmds181_id_dp159[8]   =3D "DP159   ";
+
+static int tmds181_check_id(struct tmds181_data *data)
+{
+	int ret;
+	int retry;
+	u8 buffer[8];
+
+	for (retry =3D 0; retry < 20; ++retry) {
+		ret =3D regmap_bulk_read(data->regmap, TMDS181_REG_ID, buffer,
+				       sizeof(buffer));
+		if (!ret)
+			break;
+
+		/* Compensate for very long OE power-up delays due to the cap */
+		usleep_range(5000, 10000);
+	}
+
+	if (ret) {
+		dev_err(&data->client->dev, "I2C read ID failed\n");
+		return ret;
+	}
+
+	if (memcmp(buffer, tmds181_id_tmds181, sizeof(buffer)) =3D=3D 0) {
+		dev_info(&data->client->dev, "Detected: TMDS181\n");
+		data->chip =3D tmds181;
+		return 0;
+	}
+
+	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) =3D=3D 0) {
+		dev_info(&data->client->dev, "Detected: DP159\n");
+		data->chip =3D dp159;
+		return 0;
+	}
+
+	dev_err(&data->client->dev, "Unknown or wrong ID: %*pE\n", (int)sizeof(bu=
ffer), buffer);
+
+	return -ENODEV;
+}
+
+static bool tmds181_regmap_is_volatile(struct device *dev, unsigned int re=
g)
+{
+	switch (reg) {
+	/* IBERT result and status registers, not used yet */
+	case 0x15:
+	case 0x17 ... 0x1F:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tmds181_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+	.cache_type =3D REGCACHE_RBTREE,
+	.max_register =3D 0x20,
+	.volatile_reg =3D tmds181_regmap_is_volatile,
+};
+
+static int tmds181_probe(struct i2c_client *client)
+{
+	struct tmds181_data *data;
+	struct gpio_desc *oe_gpio;
+	int ret;
+	u32 param;
+	u8 val;
+
+	/* Check if the adapter supports the needed features */
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return -EIO;
+
+	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client =3D client;
+	i2c_set_clientdata(client, data);
+	data->regmap =3D devm_regmap_init_i2c(client, &tmds181_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	/* The "OE" pin acts as a reset */
+	oe_gpio =3D devm_gpiod_get_optional(&client->dev, "oe", GPIOD_OUT_LOW);
+	if (IS_ERR(oe_gpio)) {
+		ret =3D PTR_ERR(oe_gpio);
+		if (ret !=3D -EPROBE_DEFER)
+			dev_err(&client->dev, "failed to acquire 'oe' gpio\n");
+		return ret;
+	}
+	if (oe_gpio) {
+		/* Need at least 100us reset pulse */
+		usleep_range(100, 200);
+		gpiod_set_value_cansleep(oe_gpio, 1);
+	}
+
+	/* Reading the ID also provides enough time for the reset */
+	ret =3D tmds181_check_id(data);
+	if (ret)
+		return ret;
+
+	/* We take care of power control, so disable the chips PM functions */
+	/* SIG_EN=3D0 PD_EN=3D1 HPD_AUTO_PWRDWN_DISABLE=3D1 I2C_DR_CTL=3D0b11*/
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9, 0x1f, 0x0f);
+
+	/* Apply configuration changes */
+	if (of_property_read_bool(client->dev.of_node, "source-mode"))
+		regmap_update_bits(data->regmap,
+				TMDS181_REG_CTRLA, BIT(7), 0);
+	if (of_property_read_bool(client->dev.of_node, "sink-mode"))
+		regmap_update_bits(data->regmap,
+				TMDS181_REG_CTRLA, BIT(7), BIT(7));
+	if (of_property_read_bool(client->dev.of_node, "redriver-mode"))
+		regmap_update_bits(data->regmap,
+				TMDS181_REG_CTRLA, 0x03, 0x00);
+	if (of_property_read_bool(client->dev.of_node, "retimer-mode"))
+		regmap_update_bits(data->regmap,
+				TMDS181_REG_CTRLA, 0x03, 0x03);
+	if (of_property_read_bool(client->dev.of_node, "adaptive-equalizer"))
+		regmap_update_bits(data->regmap,
+			TMDS181_REG_CTRLA, BIT(4) | BIT(5), BIT(4) | BIT(5));
+	if (of_property_read_bool(client->dev.of_node, "disable-equalizer"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA, BIT(4), 0);
+
+	switch (data->chip) {
+	case dp159:
+		/*  SLEW=3D0b00 Mode=3DHDMI DDC_TRAIN_SET=3D1 */
+		val =3D BIT(0);
+		/* Default slew rate is max */
+		param =3D 3;
+		if (!of_property_read_u32(client->dev.of_node,
+					"slew-rate", &param)) {
+			if (param > 3) {
+				dev_err(&client->dev, "invalid slew-rate\n");
+				return -EINVAL;
+			}
+			/* Implement 0 =3D slow, 3 =3D fast slew rate */
+			val =3D (3 - param) << 6;
+		}
+		if (of_property_read_bool(client->dev.of_node, "dvi-mode"))
+			val |=3D BIT(5);
+		break;
+	default:
+		/* DDC_DR_SEL=3D1 DDC_TRAIN_SETDISABLE=3D1 */
+		val =3D BIT(2) | BIT(0);
+		break;
+	}
+
+	/* termination for HDMI TX: 0=3Doff, 1=3D150..300, 3=3D75..150 ohms */
+	if (!of_property_read_u32(client->dev.of_node, "termination", &param))
+		val |=3D ((param & 0x3) << 3);
+
+	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
+	if (ret < 0) {
+		dev_err(&client->dev, "regmap_write(B) failed\n");
+		return ret;
+	}
+
+	val =3D 0; /* Default for C register */
+	if (!of_property_read_u32(client->dev.of_node, "vswing-data", &param))
+		val |=3D (param << 5);
+	if (!of_property_read_u32(client->dev.of_node, "vswing-clk", &param))
+		val |=3D (param << 2);
+	/* Datasheet recommends HDMI_TWPST=3D0b01 for HDMI compliance */
+	if (of_property_read_bool(client->dev.of_node, "enable-de-emphasis"))
+		val |=3D 0x01;
+	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLC, val);
+	if (ret < 0) {
+		dev_err(&client->dev, "regmap_write(C) failed\n");
+		return ret;
+	}
+
+	/* DIS_HDMI2_SWG: HDMI 1.x only, keep clock at full rate */
+	val =3D BIT(0);
+	if (!of_property_read_u32(client->dev.of_node, "eq-data", &param)) {
+		val |=3D (param << 3);
+		/* If defined, also force the "fixed" equalizer mode */
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA, BIT(5), 0);
+	}
+	if (!of_property_read_u32(client->dev.of_node, "eq-clk", &param)) {
+		val |=3D (param << 1);
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA, BIT(5), 0);
+	}
+	ret =3D regmap_write(data->regmap, TMDS181_REG_EQUALIZER, val);
+	if (ret < 0) {
+		dev_err(&client->dev, "regmap_write(EQUALIZER) failed\n");
+		return ret;
+	}
+
+	ret =3D tmds181_apply_changes(data);
+	if (ret < 0) {
+		dev_err(&client->dev, "tmds181_apply_changes failed\n");
+		return ret;
+	}
+
+	ret =3D sysfs_create_group(&client->dev.kobj, &tmds181_attr_group);
+	if (ret)
+		dev_err(&client->dev, "sysfs_create_group error: %d\n", ret);
+
+	/* Find next bridge in chain */
+	data->next_bridge =3D devm_drm_of_get_bridge(&client->dev, client->dev.of=
_node, 1, 0);
+	if (IS_ERR(data->next_bridge))
+		return dev_err_probe(&client->dev, PTR_ERR(data->next_bridge),
+				     "Failed to find next bridge\n");
+
+	/* Register the bridge. */
+	data->bridge.funcs =3D &tmds181_bridge_funcs;
+	data->bridge.of_node =3D client->dev.of_node;
+
+	return devm_drm_bridge_add(&client->dev, &data->bridge);
+}
+
+static const struct i2c_device_id tmds181_id[] =3D {
+	{ "tmds181", tmds181 },
+	{ "sn65dp159", dp159 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tmds181_id);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id tmds181_of_match[] =3D {
+	{ .compatible =3D "ti,tmds181", },
+	{ .compatible =3D "ti,sn65dp159", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tmds181_of_match);
+#endif
+
+static struct i2c_driver tmds181_driver =3D {
+	.driver =3D {
+		.owner =3D THIS_MODULE,
+		.name	=3D "tmds181",
+		.of_match_table =3D of_match_ptr(tmds181_of_match),
+	},
+	.probe		=3D tmds181_probe,
+	.id_table	=3D tmds181_id,
+};
+
+module_i2c_driver(tmds181_driver);
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
