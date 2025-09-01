Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA6B3E726
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CC510E470;
	Mon,  1 Sep 2025 14:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="ItuOjCM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023095.outbound.protection.outlook.com
 [40.107.162.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C577510E473
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 14:30:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pd/ouxhLp0MN0mzt+h13GtCuGG++DOUaP5SnDiSItgV2JWgY4Ju0bfc98fGMpbJqbqax+/YcHrZAVViwV/P+NKYiRT4B5EDoGPPVaoOhoOq2cqrzquiCkZvCeNzjEKNvbqonTcKkK2pJAJhX4pqQJDI/iNZFZYKJSIbw49P8l33VAQ154hyW1KCR2NShxWcMKkLWGiL2gcl5C4wQHYcT1U9kVM6vDKp+Om3Q3Us09WZBHLFbrfw5nppaynsbKTi9lV43FDvx889C9K5MAzkMKhhxOnkx1TRTwxEQkeMuzYoRMYiaZh17U8PbOlClqVFvsBjRYL02eXwUH5fJrRz++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8F7cUx3zpE4aOqxscDknAwLJBzoW+Z+2okpjSXaU30=;
 b=eEQg482XlsRHl6Z4A+iJdjnbw8jb2hEnRsT0OIW18tgHnrEspkFYfMEkclZ+S/DhaMiDd6R/XKJd3kQZGAXkxtz0h+5rLoo61avub/pf9ocbw8PUt+ioeU2LfDySf1LaBlpCQ9LjGPTgvFSciWleN0HU5jOtPC+mC7YkOa/MkIhkDvcs3ZgF+V/G1RwDMwsyAHdwBKxn4pDfCytiwhHiTq6iMI6w6eHWkmTr3sk1yBQX5fKR0rTv5HvQy8NAm2KAJelgd6mpk8tt+cMa+I18T+gX2LkPDHxkypN4EpDShfW2v0cF1I6N/30nhl9O5CuLQ+ab/U7tietP/aRHI/nUoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8F7cUx3zpE4aOqxscDknAwLJBzoW+Z+2okpjSXaU30=;
 b=ItuOjCM5mBq+eJC+C8M1lxqesixhnneSc+qKsyswZlOUnu9r6WB+LMAwhujoySV1vKl6hcyrGw8wU1CH5HppJ8lyXYRcMl2TTZtbA4F7/JiY2qFWYzZS1l5rkcZzTHr5urk+dP2Ug6GhSko3QzgKBSiBYm1DxlbKuwKZAnzL5O7FBEeX+GTZ6YoKk99YOFEAJXG0R0Ox0bc7j59Jpn4jQ7IzZGiQsVwfBIOhX+ki6LKjp2k46iBSHSa7n2uPaijHLjKRUx7vqeaFTwfP3cpVq2WcBTRAkqmvTBFVHjWCRUaW2fo+X1rLjEhRnhpMSn+8Tl7jZuQVRdFIxwL15ORgsA==
Received: from DU7P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::10)
 by DUZPR04MB9870.eurprd04.prod.outlook.com (2603:10a6:10:4d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Mon, 1 Sep
 2025 14:30:10 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::c5) by DU7P191CA0004.outlook.office365.com
 (2603:10a6:10:54e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Mon,
 1 Sep 2025 14:30:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 14:30:09 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com (40.93.81.78) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 01 Sep 2025 14:30:08 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA4PR04MB7806.eurprd04.prod.outlook.com (2603:10a6:102:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Mon, 1 Sep
 2025 14:30:05 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9094.011; Mon, 1 Sep 2025
 14:30:05 +0000
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
Subject: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
Date: Mon, 1 Sep 2025 16:29:01 +0200
Message-ID: <20250901142958.843678-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250901142958.843678-1-mike.looijmans@topic.nl>
References: <20250901142958.843678-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.edc18686-244f-441e-a6ac-0b62492b96c8@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM8P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA4PR04MB7806:EE_|DB1PEPF000509F1:EE_|DUZPR04MB9870:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b5330a-608f-4e51-3f0f-08dde9640e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?e12TgiajL5XlvPDGzfm6Qg75UtZ1qMpPJ2AO1KwxSG2q9nJsJrMXDLEm9Xv7?=
 =?us-ascii?Q?EeMgn4BK96pgLxB5mMtb/tOQgeha4cqUyQhWhKjGqmWgNPtgVOJtdEy4+/ep?=
 =?us-ascii?Q?Inw7xDd7E6tq2mE09SfQCmZS4bnT15qNGkhO21HQbQS/95LayYmP2DaYXp3W?=
 =?us-ascii?Q?Mw6bFUiWZKxyFc1+ducUw9hb3kTocb/mbJETc+QwEH6PRj9y3ve5FZGK77Fp?=
 =?us-ascii?Q?yyQPEnBWnbmNDPQM7IlUnMTEmzMiIK0pEBYwp6MZKGEb0VOp86CXvEZgAqnZ?=
 =?us-ascii?Q?krbnawjoA8KfpaDJ7MKE7eZwyNfKiCO1ssHsvyP8WOUduq1T9Fn0dpiDwT8K?=
 =?us-ascii?Q?9IjQ+E6yUGyxCA8TOReSM0zXHuqtHm/Vt7Tyj5Xk+LXVVtvWydi1tfhX0Rer?=
 =?us-ascii?Q?3N8J+F/ju3DdbCkFdwWFCKxFueQm73jrSngUiiJE5rCDbf/s6RS0d3xqNIQp?=
 =?us-ascii?Q?o4pD/WifcuPWPJigLrluttH9XnvPqYbSLTwsSMnKV3wyaDAxWB54/avAI1Gc?=
 =?us-ascii?Q?gZCJsQa+G5bucMrhyDF2jm5mNYwKFB/QB/PSQ7kMWweJbUzmtwJ60H6Mkhfw?=
 =?us-ascii?Q?kWCvC1wGfDOC3nVfVUVqgBrUtQLBWv1N87KImS2kQMUNIE3y6+aFBcHHpoNI?=
 =?us-ascii?Q?LGmX3HJtyTGvoRF8dUm4uuzKg/tTfULbztD6Os4T+Zanaq1Q8TlNoVlJaOUW?=
 =?us-ascii?Q?UjTUR7vGm7itwBJznUtlicILstDo2P9Wz04ZhFFBKsiWivKtmf5+04iVke09?=
 =?us-ascii?Q?jBG8uXcOV8AxgHh5usP9wHggcZIOQmn0gDTRElBX0cxDmvMuIaIUvYBHoXpq?=
 =?us-ascii?Q?kL24H5ltayXZuGWcrulBiX6DTp5d0Fvm4VYD8Xg0wc1IStU1IrjW6zML9QVo?=
 =?us-ascii?Q?HwPb3AzSImd66Ubdr+iEKHwavjfGVS1M4NGrkKX7Jy94qskPA7TGl2Dek6NV?=
 =?us-ascii?Q?XeHxJdCS0g408FFQ3ja7mSp/2VHymXvoPvFwfg2s3VU3I4rxqO3Ta+2ii9Tc?=
 =?us-ascii?Q?D3PFfjxoJ9nWxpb8BNw6M6Imbev5Cz5+hyLXHH5LPMYKd+z1wYEKcpU1WvUu?=
 =?us-ascii?Q?jj9LICX3z08u/OOeeAQh/O3qPEq2S34wfwjjWmOKMfRe6tnZEuSoFt0asvzL?=
 =?us-ascii?Q?C83SScFTIHYXDQVvpudQ59AQzv4ccwDulGAzgLK/65l4ScNxqUfXhesJfFzg?=
 =?us-ascii?Q?01aEjKswHkGQtbTQ61AW2gBaLq/u5qjSzTSockIAajBSgBSCDZqwFNLf0nog?=
 =?us-ascii?Q?HJQpJzm/MhJc/8KSUrfCp+fivwq9g6rEFyGYb1i/ETMkGhFU5+gB2HcBV0xI?=
 =?us-ascii?Q?iyAYwBq/kI90iQ5K2n8lc3vuOc5nW3ct+K2lFuDEAxsH4d/jyZF82FI68EC5?=
 =?us-ascii?Q?LbVPK6in8YFcAMrmixq8pXCMaMUq9pgMP2g7voXfOGaCJRJtx9p8BeuEofKW?=
 =?us-ascii?Q?bm1RAZG8VH4=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7806
X-CodeTwo-MessageID: 84088689-96c8-482a-82df-7882d2bb92cb.20250901143008@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b5133d8f-416a-493d-947d-08dde9640b18
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|14060799003|35042699022|82310400026|7416014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ZBFsZsW0hAhGqscWR6WiJ1gyy1ubZukPpXnsTokBLXwLnv3kbU8TMyck3gA?=
 =?us-ascii?Q?D4kbhOCOywng4VyN4WjyCBUBdsEZjLaFPbSqxTbehJdDzOdg/trbQh2og4XO?=
 =?us-ascii?Q?/y42Q9K2zRh5FNYee+25evY3pCy8qiezT6h53pH2XVZqxUU/39S/QBhi3O+/?=
 =?us-ascii?Q?qBYXoMxBVgwPP5pCK3nbW1CZJMyQfZxNrgHl8VR1iYmwiueGJ3gUqgq5bA41?=
 =?us-ascii?Q?lSIPws44EkXTz/LMh5vpDvxezbVCoH6VNjzUE2OPocXt+AKvpFLb9LFklokr?=
 =?us-ascii?Q?nznK4L4acOJwTXMMkNgFi7UTN7xbYvgXAYXUOi4rYrf89qwarUNoPtZIcvjc?=
 =?us-ascii?Q?IwlJvfhr/YS2IAAAMXbDFZe7/DPDAdIT6Kp2HIAvWzaWx/mP2xIgH34hnnYT?=
 =?us-ascii?Q?KInxb9SIHEKEH46/E2TDYOfzxFpLVqdfyyPdKVmIEbVBMMFv5fLdmiG/Oj9U?=
 =?us-ascii?Q?NUvftTfZSK4TAhk4b94aBCXeLBj1hS7YD/+PHPICsmTyHjwXcIgBp0qPSQUp?=
 =?us-ascii?Q?Vj3S9KyukVVZwo9O+Hn3bjIJD+ItABuVi7uvSG0ktqxN8R3d1alFPzOma/5P?=
 =?us-ascii?Q?UBhn/B9GP0/XZDBDx9pCVV1g5BxHc0NYQfRK3Dz5P8y/JP5am4nhA/TvBYiQ?=
 =?us-ascii?Q?3xzhD7MNlOU/KtKDMP+cpwsUyOixunEpMFcqLUtyI/mpYN6R90RhTv+0MAHw?=
 =?us-ascii?Q?f8/zlY6/WcMnnYXA29qyGmmZzN+3YaqVRyPR36ltvByzPZroYwDqHubpRr9U?=
 =?us-ascii?Q?Yqido4PtAoNWyxwCSLYjBxEqgyvjOSEu+1OssYZzZPHhzle75XzNUShXQQoc?=
 =?us-ascii?Q?icNUHOpdFFnCFGUmtDnkH7GuFpUWrDkSqUkM18SpRSXJBQgpwwrByP2R4Kwn?=
 =?us-ascii?Q?mIDnCHo3wUlRbsmYSOfcKvI8gwG5BiPwGhxyhVXOknaM7ljZz7J7pC4Q3t1R?=
 =?us-ascii?Q?SxxS0EzCxAQVswBXhaS9uGlt8tsQHfEnW/FxzMMHW5Dg3Ry9Zbt0ziz3HeaL?=
 =?us-ascii?Q?45xsLTHU4iyGc4cjPpBxaUVFBUO27v042LhoeUzkmbMSXvg1AwjXBoDgCNUK?=
 =?us-ascii?Q?7orXxVSBbi19LpOJxcdz3FPbmxUIP1x5p2Lr1n478MWPDKQSiHX5Wtgbj7jQ?=
 =?us-ascii?Q?q6OYdGHCuGGwc5O2UHKzpM/WmpRd3e4zlU2PLhSroBwjvOo+Q0d6NqZrdw3V?=
 =?us-ascii?Q?uEcu1jHzdTSkfu06aNbybu7sH6PwBoS+dVpDnKnw3+UKKLfde6zCKqJ7QjZ0?=
 =?us-ascii?Q?MhsnPdQ4k+LcUISKRnbnyGkgEgi5uwiMxiHpMjyUkdD9357hrUoCY9qbuia1?=
 =?us-ascii?Q?TQqf/FfeXjY+vZuSS+/xwze6SuKasG5ovotSN5lQVjl3u20gmaL1q9svzz7T?=
 =?us-ascii?Q?DzPZO+diTo1M+3wTvpnDQcnJ/bpnlYUpkqeyraCgVwJcO8MskzjgRfnejMo+?=
 =?us-ascii?Q?vrVL/8U1FpdG8oHoj1RCzEdNHZHZ5aE+g8jYCY8wDue78EKiom/HNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(14060799003)(35042699022)(82310400026)(7416014)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 14:30:09.8367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b5330a-608f-4e51-3f0f-08dde9640e3c
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9870
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

Changes in v4:
Use fallback compatible

Changes in v3:
Fix duplicate links
Add vcc-supply and vdd-supply
Fix missing type for ti,slew-rate

Changes in v2:
Document driver specific bindings like slew-rate and threshold

 .../bindings/display/bridge/ti,tmds181.yaml   | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181.ya=
ml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
new file mode 100644
index 000000000000..c6387c482431
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
@@ -0,0 +1,152 @@
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
+    oneOf:
+      - const: ti,tmds181
+      - items:
+          - const: ti,sn65dp159
+          - const: ti,tmds181
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
+            compatible =3D "ti,sn65dp159", "ti,tmds181";
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
