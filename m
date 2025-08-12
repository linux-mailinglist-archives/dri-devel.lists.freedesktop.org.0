Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB65BB22B1C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 16:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE8C10E5FF;
	Tue, 12 Aug 2025 14:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="cL8avMBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023078.outbound.protection.outlook.com [52.101.72.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A742410E5FF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 14:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQvgKWpTCexyDeMEzeeDNAl4xRcY88Vk51go/gLYuSHG/aLVFVhXfKgF60Ytj2W66EXE7jWOvId5XuXPjcMjiSjJfGvoC5qL8J2wKOzgRm4GZIg9skZif2i9WTGGJ/jJ1RI6D1V1fKBfLHlvPmbbGAVSQZTu/792r1kpXHky8e1WAFw/1vMgQBXVrULax+p97+040NKr9ckUaEbZP35m/tUc83UkFiFWCmQ+DLX6GqLnO6oK9HdErNA5EddPatJ5aO75Pful97DXXbQGSwSGT4ijimtb1kjJQP1jjvnK6DsUV5harCYdgAy3DD9O66/999dDTNyLAssTZn6neRlDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdI+dfcRKk/Qa3w0CJtG80/Art//+buMulBHWOox+7w=;
 b=v/tzruh5yrs4ObkRx9yK+W9Q0qFgBnmaWieiDOCI5PebelXE7IIvP3EaYiHrVtRaCD8OqqT76pi6lk3qIB9MCkbFfbRvB/iudoUnBSkHdF/KKj8fIa/5Ke8Dcl3dYI4uVX257DryNqPE2Q+Bk4b6DDv/Qa1YHh4O2zEO/+xkE6HOrSAtSTx3S2+MOkwSkNIXCmtSoQ21Le8jxPzbL9yT6XK0zYB+n43M5y4diVjM3AMm45SNc6y20kQCqUF1OF4WZo9ePKW5GuwLBoREoafakLYONfIcDfljhsQBs6KMHKAEyNo4HYGp7KRkLAmqB0l0pHfBi8GJ7DXdMW0q0SKZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdI+dfcRKk/Qa3w0CJtG80/Art//+buMulBHWOox+7w=;
 b=cL8avMBBqEVPq9eX1HUfRIJnNF8/hpf+ZUVrXmGSsQdq0qQ+91ZN+G9j4akr6XLtgPMdkk/9U18C2a/8gwta/UHEnuACUqWltL0FyY5u4dpVSy1P6RxTIHIQMLXKenJ864to0p4JhSj531ZxyNR5v+6LC/GCP/Aege0zJbJdYag1WRZ/lMa6tlk0rXBNV/pdqHPHMQ8hFtGpa7l/RhRSIUBPNz0HG68FvYlVeh3qODP6J01ZS7LlbkVwvUUC5NRpjpKrIy08d3GddVGK9JJjxdpOTR265e2bEiQ4Q0/b9obDPnEUcuW9/tmwPeBYSUUPNbV+9nhyMalD+NgSGOb/ow==
Received: from CWLP123CA0260.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1d5::10)
 by GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 14:53:07 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:400:1d5:cafe::aa) by CWLP123CA0260.outlook.office365.com
 (2603:10a6:400:1d5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 14:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 14:53:06 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com (40.93.65.12) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 12 Aug 2025 14:53:06 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU4PR04MB10742.eurprd04.prod.outlook.com (2603:10a6:10:58c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 14:53:04 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 14:53:03 +0000
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
Subject: [PATCH 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181 and
 SN65DP159 bindings
Date: Tue, 12 Aug 2025 16:51:34 +0200
Message-ID: <20250812145256.135645-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812145256.135645-1-mike.looijmans@topic.nl>
References: <20250812145256.135645-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3b7d4319-e208-470d-9ada-585343a64822@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU4PR04MB10742:EE_|AMS0EPF000001B7:EE_|GV1PR04MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c78c32-7dc5-410b-f866-08ddd9aff27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ogml/K1YjfOC+AQFJc/z08VojeE1fE3WMnQrkr/Og16ZpCZckFs3ywSf3A4e?=
 =?us-ascii?Q?9YfpSAhtH7JWDzai9jrfTmYAxsyLiwvG7GJ4mVoWnRrvjWN2fMtdYLIkQ6Hk?=
 =?us-ascii?Q?8hfkyt0EefdT156mN9iXrvxMEZ5kDGOtrdoPdiqVlo2yAgPj3WqlYFVa/i6S?=
 =?us-ascii?Q?qqpmjstdVYFK218AgKEiqearbHrCwQ88zFz0PpALJWqa/S8GbrDMsNgEYR0N?=
 =?us-ascii?Q?+mv318LIb/tx0LbiFDR4EkocUCK/URPRs4hV9V4A0gOb/ruo3kZi6a/o0f0+?=
 =?us-ascii?Q?ZamdsXWeiXsaXh027mNqQ0gs1kZZV3s8+o2VqY5Q4jHKKrm1xvs84o+zCb67?=
 =?us-ascii?Q?whbTqTrPiYqTTxIlmQ1CfdjsKx26YJOok3+1tjdCeOX5LHW0tm3slcgevVYr?=
 =?us-ascii?Q?2W760VCD92uD/iKL8q+1BT4Sh2+1WrnRHQ4Ad+Um3c19UwoIOPbZNTJl68Kn?=
 =?us-ascii?Q?X4UOohycMBP17O/MOx65B27K1kXfl7I8lbzaR53cgA//csJTK8pG+1W0Uu3l?=
 =?us-ascii?Q?4twZFhQUJYUHcdWUN1652mw/lSE66ibvT17NkBj0uXFLFdmHDr8FUFdiPJx8?=
 =?us-ascii?Q?eXaoQbzZwhDkejIMNaI0ymytENtbDl43thd0tuviAgm6p+ecEXaSbDf1kgCf?=
 =?us-ascii?Q?Q7a8rxVeFJnET2UDcbWd+SlYKT2v8ZGJ+ApXAMoy8fU+bmsz3ChFSTLkpzeP?=
 =?us-ascii?Q?Qdiwz38wSGRdkhj6tk7di/yMnxnyMrVaEW4lx/am+tfXfIGVEOsASK8EcdRS?=
 =?us-ascii?Q?UPyvLUvP+H+PUo+BDp5ZF2cwEgcBdOGSxuS08jK7UHXbodpN15cPEJviFGJM?=
 =?us-ascii?Q?ZJylCdLfthym+ncSwgbLJB2nKtosNB55exwcSZ9Msn+XlUxhreAXd/oRhSzf?=
 =?us-ascii?Q?qaBeQRxo7VXn9EpXt09DOnpnQJZ2MVaisMqS59Rybh11oup2ZgAAW7FgdaC8?=
 =?us-ascii?Q?p8wN/P2+epRyFQXJTjaQYUQLlI8nyjTHW5wIzehJBxwqE2dO2TSujxNUfMWa?=
 =?us-ascii?Q?XiD/s+3QsIK3A6BcOFzr3LAaYkaMrNEMPHF+bhqXKQ5vFrvAfnRkT5Jknnw7?=
 =?us-ascii?Q?pFG/a+Abvku6L9ZyLZrJhEUYkD7ekXvWeErH6g9XCkNiwRHTsYPXuV4gExtr?=
 =?us-ascii?Q?KSZaOglaj1OvOC8WUP6pkyaYclkG9GFXa0MSwyzdti233eUrWz2I4ndVqOtF?=
 =?us-ascii?Q?MY2E2/jrfJKA9sbhh6AXeuufgKfcPBQnnXlH4ImimA2GTM0EUjtq4KHRyw0D?=
 =?us-ascii?Q?Z7YGH9yp2xWslhwg1d17NrjBMP3IQfHUtTOYU16fmVthc0lv/ri1+u2JcMn2?=
 =?us-ascii?Q?eef+dWrsNuEr6j/qlAkHBUZv61zyFE5EraFr6OoJBwQOOtAkQMsk33y8cXLu?=
 =?us-ascii?Q?oRpRXIGSwrN1DRr272SvvWlnhCpvlgULJqENmQNFRSA1aZiul7v76+EJPP0F?=
 =?us-ascii?Q?VaZufcjEEkQ=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(13003099007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10742
X-CodeTwo-MessageID: 1ecca8ae-8615-41a4-bb52-e1a6792ef4d5.20250812145306@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0bbb6d8e-8279-47b7-5aec-08ddd9aff0aa
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|35042699022|376014|1800799024|7416014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+em8DF7DAFrkn/HmiznO62NAB8R6arsKfFNgt5jwzdmbT00ng6JIyd6V6Juy?=
 =?us-ascii?Q?uclXp1G/DxwbTULVS3oNyGIhyQXrJy/5ebg52ZW+zVtU2xwOqZZ2f/kikc4P?=
 =?us-ascii?Q?T/4oj3uDqArNKPhP0yrlzTWye6uC1yF0SUDKR5QPimzEGBkIWQqffeYyeacS?=
 =?us-ascii?Q?RzlU+/OUCq1AJo3K6TuLQVTkSEJS8X+0RdbBs4L/cAIApo3mWdbW4aBq1n+C?=
 =?us-ascii?Q?SgY9XjszJb6q/tH2KxxU/tEGcvi8AcKJa83eRh4H2pNAIHg8UDaCDdbQopFM?=
 =?us-ascii?Q?amayU0KjGiUDGgUUvWgKIldC5eCWWKumrW7E5eseW56hGlpuYWlfXsj3ugEK?=
 =?us-ascii?Q?qSvgah3Lg7501eIP3QwxuI39l6T9bFy4W0qTt1U+ZYhEDegIed6qBQtJZjIE?=
 =?us-ascii?Q?QXKjhSjXR7EoSVpS4YFMVRBgHCBx8+9pf1YbiUtU9X8GJ8xnH1Jq4EV9/2t+?=
 =?us-ascii?Q?peyBqfPuIgPq4nH2bdPIXLGA6iTrdZrpezIYwzZkNYnNNwFVpVmoX+EgKofA?=
 =?us-ascii?Q?PUYXO8km+WzfHXkOb1MngS0SbG7rcL/Jngphnb7pBIEMQLqlQ0LobfWZ6F/e?=
 =?us-ascii?Q?MJqdar25Glim32rVP0NsqGw8alMYOtu0MuGLJMVoirG5I6dMBt0GNfxrvcGk?=
 =?us-ascii?Q?dXqD/3jojTjF1lZZgn16qc73ip5mvUAO8FMYOv18nkkvOR4IdFSqbbPH40h+?=
 =?us-ascii?Q?q24yKqVgP8oG5O0fsIZ58iof4FUzbv/BHuhRsN70aimUCxUqYLjRE/pj/xPw?=
 =?us-ascii?Q?75SeGlnXOL1XZ8CsfuoJaHRD9blgd191d7j1hHvQOaZnBENndHlkq23y69iV?=
 =?us-ascii?Q?3QMfrN2KpijLd81Ym0Agx5rZvofZbX1sURly0OXJrU4ADTEw+tWNpOIUvD1L?=
 =?us-ascii?Q?TRvD1uwITxhIv3wslAagWJ/QdqHLpbyD07LZwTvAOfKGHjJKTBxiyNRlFUTT?=
 =?us-ascii?Q?/SVg1kB33Wr9AbtZEHY8c0seeu3cy92qPKk1qVWit5YptgEdNmlmFnJ7Dzow?=
 =?us-ascii?Q?4oBTd8jcPKQyAVDnC8KdvhyAXnX/iuttJd/KyRl/P2oUMWB8gegZWwDVc+2t?=
 =?us-ascii?Q?zVhXrISyp1KbYnnzPmumGU3VZj7fachfxo3m8niI+rzJkVUQY+6OAYqq1Flk?=
 =?us-ascii?Q?T/FbdqCkrvJa67cZrP65rC7y8VFkMKl/MAhBFfQPJw5dJSWLeBT3MvQ6NQEe?=
 =?us-ascii?Q?mo/HztZ9dwS8olqiroOq/VOqVDGGBXNv30DhX1s3URM34KlW50/teVm2r6j+?=
 =?us-ascii?Q?u4ukOiv6PT2RTtZgdWi+TpQxR1zHaDa8Fvi59yGb65NHn6Fl1rtSAP0lAVcR?=
 =?us-ascii?Q?RTlCol0SCimIVK9nX2SNvgqDbUSth2HWpcv/oPrbj3FMRNjarXwE7YOu18dz?=
 =?us-ascii?Q?WI29QeVZ3XdYYe/XVE9uGmcBunF1RIHBiYzjAoEkii9rg9N9QAQfg2d5UUj2?=
 =?us-ascii?Q?YSicJI7114g9bBRsJR6yLLkFG8nfpMBkwuXS2Sf4yKW6+hSsx8fQcg=3D=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(35042699022)(376014)(1800799024)(7416014)(82310400026)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 14:53:06.6801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c78c32-7dc5-410b-f866-08ddd9aff27b
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9183
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

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 .../bindings/display/bridge/ti,tmds181.yaml   | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181.ya=
ml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
new file mode 100644
index 000000000000..87ffb556c4ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
@@ -0,0 +1,104 @@
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
+  https://www.ti.com/product/TMDS181
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
