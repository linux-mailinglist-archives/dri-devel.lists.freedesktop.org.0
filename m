Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE64BD3981
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F068E10E45F;
	Mon, 13 Oct 2025 14:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="XejZ1RHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023138.outbound.protection.outlook.com
 [52.101.83.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7E610E48F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:37:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUL7nQkqr9qJUxVUp93x/oh/kzF9YWAflZ0gd98P9I0mF84ZgfKfAZVaIDdwpiAHRAQQsiwMFFbnioqgun8dX21wGXoY6y1t9uh+Lu9KKIYjKjQiafxryjmV/RoWkRCEDf0FJ7q/F4VXAXWsxQmMwanSd4J1KyJULQ4650457YKSnIWBjr3XRz2b268ZyAixTxDP2/0/oUj5kgtoHK1e8IYcSgTMUUgtFkWDgykEkHCVJTrtNA872vXC2gQHJuyy7aH6as8xe3xp9ra8se0wjG+J2BD92W+PgZcVOeqGyb40qXQsRc/GCKj7Urg3dS1lE7VSLpXSQ2nMVeUeCFenxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQBgpt0koFNtwYCHmh+6eSg3DeIvTpzvwMN+etWE4UI=;
 b=TanRBd1D9+OqICFHa9kAiq88TpMAXD2sZQhElm/JfPC5kW3gHiMdz/95fWGOcAy5vyNSBItDNiqsJOys5nMNSGHwYQeWmtNPB28QDZNxsRLoFX1aiPq7BhDtJzXi34gO1ARL0MhBF5QGPvQU3P5Z3sSb0QhkV90S6mHN9WDBZK2K9hb5WPxiT4KNIH0SD4Hir1V5GA8oJ+8H/wAjz4j+7JsOnkCr1Z1UV4lWZIeZuH9Hv2uTfE8SuvLASsw+OyKBo488Qt+FUtWksowFs9PruQKDXH5RPmAynML5SBRMgudcosZkp0ZqCF8zv99S7BEsiFHwe+PdPftcRBeWqBTvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQBgpt0koFNtwYCHmh+6eSg3DeIvTpzvwMN+etWE4UI=;
 b=XejZ1RHlR1NIE6Pg6qTSone1RikikYsbUL4tuncKBHua0n8SL6QUzdfRIyZQpx5vIbxclcDqcfKDQAzu/XG9zUVG6m6U9c33H8oMPDA3nnqjx9xwOSOGup/SKGWYI5tHmlYcyfl4ge+o0Ay+3HgDwZrG1dzI7M66sPFTQ95n0TE2X1dkg1euWRM21opC+d009scuFontIRT8xepgQ+afG3Rz9+hcETsFyqBo4Zo1oT/mswolhzJHVPPmIYe0/bJ30iHst2lJ6moXPyk6pZzvj5ef9VT6YFBPrSt6/1Li2SqU/UkLm1vLxyWfSh1o/Y71jt2gieHt/+6S8kj9usOvOA==
Received: from DUZPR01CA0200.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::10) by AM9PR04MB8633.eurprd04.prod.outlook.com
 (2603:10a6:20b:43c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 14:37:12 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::43) by DUZPR01CA0200.outlook.office365.com
 (2603:10a6:10:4b6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 14:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 14:37:12 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.52) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 13 Oct 2025 14:37:11 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GV1PR04MB10195.eurprd04.prod.outlook.com (2603:10a6:150:1a8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 14:37:04 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:37:04 +0000
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
Subject: [PATCH v7 0/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Mon, 13 Oct 2025 16:36:48 +0200
Message-ID: <20251013143658.25243-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM8P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::7) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GV1PR04MB10195:EE_|DB1PEPF000509E2:EE_|AM9PR04MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: 71e254a5-bab9-495f-73a9-08de0a65ff37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?2dwDaL84B94n9fFXj6TQ4BTb4i7D60dvaZKWiMwJbISNopIURvLjZl2LKFQ8?=
 =?us-ascii?Q?aEG04pxCoH19ml6SPH7d2aFLswjjHdye14Q7Bl51ci6P+dDd0RMKsRUo9Gvp?=
 =?us-ascii?Q?bj58GsdFpP5CAmBdN/pMLQ/gtf1vx/C/x/nB8IesKYviO6VWneiJArdd+BmT?=
 =?us-ascii?Q?EMpTwWsccWYZYcwSP7JTxuqdgs279atjrIDdPCvIIWExDtE2+8W/x2rtFZeM?=
 =?us-ascii?Q?Hko+c0i4VV3nYSilveNIpylu1RvC8sbrsSc3AOE8gRXs7H7Kw+A+ywxLBjwz?=
 =?us-ascii?Q?fr0KYxSpmOlaUdQ4UHfEwKjxSrHrMTxkuLd09hdbksunlJcjna5oo7Ui4bjy?=
 =?us-ascii?Q?3uMlO3ECSedMJDsyGb0PyN/7FPRXPxMg/CPqW9yWkpNacCj7u2GREk62GNtc?=
 =?us-ascii?Q?JwVsCLbWCPrF/mlLbOXC5FtiO2/SDyEqLB9tpR2wlOLkwozjDGvutySHoOis?=
 =?us-ascii?Q?A93eGc+K+20zylTw7usD2wEcks4r78IfSEe0y31jgxChnxpkERpQmWrQGyxt?=
 =?us-ascii?Q?AnUri9XnsvIu4VAMMNmynLOacJ0kPilXFSXFlzj1LY9XZlDXrDzLwvoOF804?=
 =?us-ascii?Q?yzlxjJMA2Bq7r/SgG1jBkvigY+MwJkv5FjXP4+eHHPniZ9bCcuOusGYJYJcB?=
 =?us-ascii?Q?Y9qxpMXlwshEa7hXbmEwK8mk4liM+QPC4U6ObBXsAGWf9Ctb1F2fFKwRpw3M?=
 =?us-ascii?Q?k1Q+HksKAdCQNZthxoJ+nmSZwssyo7WyUttOJGh5Zz+hp1MenpDGgCuSq6MF?=
 =?us-ascii?Q?9hOR6mU1wjphgTOhycMhL8T4BVODGwtiAGN1QaxyyF4k+FgqHLMF+XJC/cP5?=
 =?us-ascii?Q?udI6LG02bM1/A8bgUg2NH5J3YRyHUP8sAnydg/OVEpSClzoI78R5w/mk++wG?=
 =?us-ascii?Q?7TkslnoVWpMoGGb+i9AX1Z4gP7sXqhJlmzgpwoJNyVZ4ucSUqo39qf5ehTHO?=
 =?us-ascii?Q?vGsbN7O1BmEkhFGTJDfQX52eM/ygAnextrSK5yCN6cJwFg6MHzQ6oHwmpyte?=
 =?us-ascii?Q?uO4NGcjInI3lZOHaWVfRtq9HtlnvXdCemdmmGrMSB5vqZPWn+lJIC2XKnOfc?=
 =?us-ascii?Q?inv0XLSIgm7pFMbT+g8hFIpfeFm3depcJRDOUBtme+rL/h8p7sw2sFKP3dyL?=
 =?us-ascii?Q?0YMeC7m/iqSBAHUwg0JmgJxYBP/MDPwK6G4GQmBHAT8NKRaSeKtbzFCLlHbq?=
 =?us-ascii?Q?zv24GpzSM9y45HvFdNiKtt52GBBIvLOdJOvs9ZIOtMkKT4UFe3Yt2RVnWDaQ?=
 =?us-ascii?Q?lG+OGlp/T59MBq0D+FmxeP9THhetWt4hYJe80YN+Eos4h9UDgj5ewqsGGInT?=
 =?us-ascii?Q?cuit8kS4Jk4xCTy+wqavwXQRJLWmxrZa5zWUglNyOx+8JRNEhjR/72sKcJ/6?=
 =?us-ascii?Q?U67n37xkD0f87dincoV1JupFQjzmjkbU3t50txufuw773gGBSyfDkuJED/aN?=
 =?us-ascii?Q?42tsi3HXK64QD+8aI7m+nU58d2AYFANZhTfpAD82u2rvIZExtGzeDE0SE50E?=
 =?us-ascii?Q?yebVYQvABXq4PwdPMo7HgtKHfMDW5Mz/tKJR?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10195
X-CodeTwo-MessageID: 3812055f-ba43-4924-8429-6bb0005138ba.20251013143711@westeu12-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.838056b5-4602-4059-85b7-fe97b8a79b86@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a1006f71-023c-4a38-7fe3-08de0a65fa7c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SS+ogqejFFC6rDxlgwhcomeJ8EPohnFO+1vAOrwF+sVlkVhVXG+c09MhV/oW?=
 =?us-ascii?Q?IAC6+XbqVBU/Rv9tk/Bq/4fw7aHQ9Xtd/uHUhoQxvoYrxVD9hjhfhO15yPtL?=
 =?us-ascii?Q?luQ/PQdl733ljEuWXNgbjHflGaAt850Z/Jx+HwiX+L2NHUvymGTa72a9x3wX?=
 =?us-ascii?Q?TrYYK14ZpMezxv0JNRNSNga6VAVyJKG28pbVJWfI42u5q9HOr/1z8LowpPF5?=
 =?us-ascii?Q?x8dlRz1D5atTUHHLXxs/aD4Dae5SXTyeXDTVKa7tcJKR3TyAjv5yrereynJL?=
 =?us-ascii?Q?zIKCDZ6Wo7rNpKlQ58j28CwmtvDftnkbr5Z8GO+JbNIQALXnT6yq5qUIkXso?=
 =?us-ascii?Q?ZOu68cvJNOqgiBLAbkHL6TDlOE4K4p6+FL6/WwcuMgXT95HqYsyYogsR0JAL?=
 =?us-ascii?Q?hmYeHLVaYWQDKQPF2xRHaTdHMlpTojyb/H3Lf8fxFpvr7ZwT/Gt6lZ7D28Zo?=
 =?us-ascii?Q?IYGnbLY9RvCBaDhs1bxJudYHGm9XWQUfXNv0E/apbBJZWWFYAmz3k1bJ+g7V?=
 =?us-ascii?Q?kBkaPp0Zsb8OBAalC76QehKrIvimFu6Y4Jw6k5LPlbbvgHnW4i83RzwzrR3I?=
 =?us-ascii?Q?IV1/JpANXGxiBPYZstdwKTe2SxhpCV4rMoydYbU49r9UOcbENwIFJeaoTRuP?=
 =?us-ascii?Q?E5CmBjS180ntcNPRDkgm9GgL+pGv7zlzWL8Dlrr9VHkFXT2nWsqHyFA0kQtM?=
 =?us-ascii?Q?V3zhfYjj2LSRFyap7CCEaIVtI+usQiVFI44DewNaIihCnSZtQrh6Ss1Ut+te?=
 =?us-ascii?Q?lqY3GNqb6Izk3DwHcjQ64ESNcA14zGebK82I4WKiTYYFUweEkfxM7/G6PvUQ?=
 =?us-ascii?Q?GBhxwyNEMHmom6dEXdOgrcNFYotEM4soHtnfVkQ7AaWpuUjNRbdHpYxToXa8?=
 =?us-ascii?Q?GEEhhdPeEMUmmOBUhBpIpVUupyibugnEp4z6AJPS5aDGITos/63kG8d8H9Tz?=
 =?us-ascii?Q?mjVghvV5YVyW2SqwvhKGfcCqUWBN1EFa80QwhxP4lMrWifN4Zh33KyKYYk1q?=
 =?us-ascii?Q?V7fkHJGjhJczudcvlUUVQ9v9vW7NBsqYJBcIYQRhzlITHFiUUwJJGMCQy0RO?=
 =?us-ascii?Q?0fy3i1QSDDb7x+9udtbXVROl93XrOMk9KiovY+3M3F/4JdGQjcofUtmMC2i1?=
 =?us-ascii?Q?Xm+633oJC/DNbsVIXhYnNKdEgs5Y+7KZucVTKs79wqwydjRDVcHfT3pH7JYO?=
 =?us-ascii?Q?g+bKm1qSnbOc7382uWgP3gmfi3r/zJ57hInuzJwttBELprebxOf/WaVKvDpc?=
 =?us-ascii?Q?+Iumvf2PpclPzWuqq9/L0TTD0tPSUUFZ2kb2UeWTF6kWEOUGW4lDDCBLYPrP?=
 =?us-ascii?Q?Od3Y4gbfEpQH6XLeMVNhZk4u9dG2YQkNmxranMboVM5NFYnHKsaKp4WWDicW?=
 =?us-ascii?Q?UmyJ6PW2QB+MScMYwlYpr0kmamuoKMKTnII6AUKgpnkhRagjnRdjTw7L+mqB?=
 =?us-ascii?Q?VE9GcMOI8FvApiAnr+dJX4MgYjhUzqLTnumQI5uzyKi7L3untjOST18xq/yI?=
 =?us-ascii?Q?QXu6A9Jx5N4+bQM=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(7416014)(376014)(36860700013)(82310400026)(1800799024);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 14:37:12.0243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e254a5-bab9-495f-73a9-08de0a65ff37
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633
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


In the past I've seen (and contributed to) hacks that model the chips as
phy or even (really!) clock drivers. Since the chip usually sits between
a signal that is (almost) HDMI and a HDMI connector, I decided to stop
lying and write it as a DRM bridge driver.

Our experience with these chips is that they work best under manual control
enabling them only once the signal is active. At low resolutions (under 4k)=
,
the optimal setting is usually to only use redriver mode. Setting the
termination to 150-300 Ohms improves EMC performance at lower resolutions,
hence the driver enables 75-150 Ohms for HDMI2 modes and defaults to
150-300 Ohm termination for other modes.


Changes in v7:
Add DRM_DISPLAY_HELPER to Kconfig

Changes in v6:
Rename ti,mode to ti,retimer-mode
Add DRM_DISPLAY_HDMI_HELPER to Kconfig
Change "ti,mode" to "ti,retimer-mode"

Changes in v5:
ti,equalizer and ti,mode changed to enum
Rename ti,slew-rate to slew-rate
Make properties conditional for DP159/TMDS181
Remove ti,dvi-mode (always set to avoid conflict)
Really added vcc/vdd regulator support
"oe" gpio is now "reset" (reversed logic)
devicetree enums ti,equalizer and ti,mode
Always disable HDMI_SEL (formerly "dvi-mode")

Changes in v4:
Use fallback compatible
dev_err_probe, this_module, of_match_ptr
Use fallback compatible
Add vcc-supply and vdd-supply

Changes in v3:
Fix duplicate links
Add vcc-supply and vdd-supply
Fix missing type for ti,slew-rate
Lower-case hex values and use defines for EYESCAN registers
Remove equalizer code (unlikely to be used)
Remove attributes (no longer useful, undocumented)
Fix build for 6.17 kernel
Use devm_drm_bridge_alloc
Sort includes and add linux/bitfield.h
Check chip type and complain on mismatch

Changes in v2:
Document driver specific bindings like slew-rate and threshold
Use atomic_enable/disable
Use #defines for bit fields in registers
Allow HDMI 2 compliance
Filter modes on clock range
Use cross-over pixel frequency instead of manual overides
Devicetree bindings according to standards

Mike Looijmans (2):
  dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181 and SN65DP159
    bindings
  drm: bridge: Add TI tmds181 and sn65dp159 driver

 .../bindings/display/bridge/ti,tmds181.yaml   | 170 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c           | 427 ++++++++++++++++++
 4 files changed, 611 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml
 create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c

--=20
2.43.0

base-commit: 53e760d8949895390e256e723e7ee46618310361
branch: drm-ti-tmds181

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
