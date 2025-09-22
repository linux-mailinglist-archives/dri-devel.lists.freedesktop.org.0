Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCFB91173
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808B910E454;
	Mon, 22 Sep 2025 12:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="Vy35jnFC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022108.outbound.protection.outlook.com
 [52.101.66.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8338910E454
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 12:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUZazkABtrImaP2nin0qCjCg4EOOgTjqjK7Rc9Evdpf5LYvasTvjjD7/eZoyD8pui/TrLDy44AOXvomdpKj11uylZtIVR1QQ0Fg+xT8PNQk4Nd9WDOFzz6IGwORvOO/Kgqcp6yScwkyFEKpA8NNLuhTSUGJy6zhlYG614BcvTijA2RtMaR/OrBRCGlbviQSy9k+4hZQuqJHQ47reDWY9EFNlATzTbdv55e84NGKl26EJNJGdUPPEcpg60S9c9dOvFAGHy4oiEZe2Z3EsJRIBNvKHkGhoov5pSgB5fB+EYoKrtugXbdqVj8TUMia64ErpmpYRUwXgQstDhyiqOI4gfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoDWaxBdbykYcq3by3bf3Auicqr4/iiesIa6oLYR+Rc=;
 b=VC9a5WSzwcpVdoDiJlj585GzOB9gsdF5owu8JQaJ0kwNmXp9p+hPKJQ6eJqkTpLC0xgE2dG4Hy2I7TL7KLVjs9TNcqWIcR9PYQsqJmwDO0M3AAAGyUszfWHwArWrRlO8AFlrie0KFPTi2V3g/U0tWPGD6uGHDanWSOrFF5bHoPHSQcFQuEllSpAAwao7eW01zdaWHrDYGaS9+1kh/4W2ODWkXe/3TCh5Fg8VU+KHjjQBP22xIb7Rjhf6mS3XAeg01n6+CADYoDsgdsIrIm+tnwelrT1r3KzEu1OP0VZoaAQKDLzWV+/epTzNfcVSqFL2uixf+ynuVu9gVxomAvV35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoDWaxBdbykYcq3by3bf3Auicqr4/iiesIa6oLYR+Rc=;
 b=Vy35jnFCqtDZyI/a7RLl05Xjr+36mUsh3WDzxQ/ZoqM1vuEzasbC299TiiFhkzU9pajOxSi55rkMs+1mp0n73EXG0ZTK8PFZv/oPgFapACYjEapcq0HjdjeYPzFDoHM29IzznPgedyUJmwFFWlAr1F3oaZ2WDTWRsZIRwNWFoqBv+leHKmegEUYQkAHm20/XZGcxc/aosM2k931G+mAVpsL4HrDvhtusQLo5gtAsimosVu9F0zsxsSIEucPG4Upywwt1H7VxKV/tON8Y+Pu3x+DnajZMTWhDSz1cykjP8KdDCMGnE+erSLyUWFiY2gr2F3gwO4bjxyya4Jf3Azlr9g==
Received: from DB7PR03CA0095.eurprd03.prod.outlook.com (2603:10a6:10:72::36)
 by DU2PR04MB8933.eurprd04.prod.outlook.com (2603:10a6:10:2e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 12:19:16 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::f0) by DB7PR03CA0095.outlook.office365.com
 (2603:10a6:10:72::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 12:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 12:19:15 +0000
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.71) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 22 Sep 2025 12:19:14 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GV1PR04MB10560.eurprd04.prod.outlook.com (2603:10a6:150:203::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 12:19:08 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 12:19:08 +0000
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
Subject: [PATCH v6 0/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Mon, 22 Sep 2025 14:18:43 +0200
Message-ID: <20250922121902.88664-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::6) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GV1PR04MB10560:EE_|DB5PEPF00014B8B:EE_|DU2PR04MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 91f758a7-ed80-4a8a-733e-08ddf9d23f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?EcCSg0lOyqrBQI4BZ0QZGD58NauT3/xJhFZvUpSSBz00cwor0KIXmf/1L41i?=
 =?us-ascii?Q?uzdGqj1UpuE2h00EKtPY6PAJgES6w2e7/h1NTtm2EWfLwxHUH/u6JOHriQIs?=
 =?us-ascii?Q?H1AF0UEoEP77numhab/5oTzjqDIWtaRitjQNHUJRkHexukZGsQHI7SfMlnPU?=
 =?us-ascii?Q?pU7jU1SvEUjGIULA9fYwsEuqB/6lZ1J01havJjI6DJ7gdO04DE7uMMx48aNl?=
 =?us-ascii?Q?Njachz9JvremVBy1G0Yz7vb8h9xkYs0s2osPOMo7HBG89yg5qJbxKghGdmVO?=
 =?us-ascii?Q?ChlP8da8rK0xaer6MVSLwDFYJmQYIQ+qj3TiRUxsmIDgQKth8RNbp29Eg0g6?=
 =?us-ascii?Q?ED6u5/Y1YnvPzCYtfxeD/nFjqm4Lnw7rs98P1vOMDWEQtzr/FH5GvLkeL8dZ?=
 =?us-ascii?Q?ltPlO6Im9EjfcjolNymQHZle0TzVFlfJfsM0LkabDXaarV2Yb1EShqQ/ZaOv?=
 =?us-ascii?Q?oWoHC/Dv0qKigXXJY7+K4rrs2AvHpeNZxwqZviqzFsa9NRG6yTvm7i8yRMiq?=
 =?us-ascii?Q?9x1VaxK9DzL4lAf9pKqqEMPJBssF/Vh4qQI7qp3pl+967onm7pUEJ4J1M2CI?=
 =?us-ascii?Q?XaE9EDYZP8UZ0zAkQDqt3VFvXJFp+DG+SQINkg3OP1vaqv4NLRlViPd+dHNb?=
 =?us-ascii?Q?BC3tJnE5J+DRuuPrDh6Aodv+mQGS2S+MZWpFUF/BhwX+8FnrBXLRWDVYhdwz?=
 =?us-ascii?Q?FFPHoXpBVK75nn+oA+Mx/nv62silgIZo4k7rbdpvvaAciHjBoA2uvkR4A5KX?=
 =?us-ascii?Q?+r27bAICaoIxDLwW7OvzXC1U8ANI5I5x3NM8G2ihxyQmpx93wHmx6BDT4Xry?=
 =?us-ascii?Q?dPgrdK5DiECLw9rGiwSu7sjyknnxl7uhsoduvptXMEcYDfffzMu/WrtbT38Z?=
 =?us-ascii?Q?4DZhSo5qYeHUOGGbMyEuGVIbUU9yUxE4Tt0jbLkNEU0ihUiZ+RYzb8s6gm2W?=
 =?us-ascii?Q?HaeFCyM4dLm7IUJuHj9YfPjPRS/N7ppPhfP8qBykpE1NEfDeKUD/pdyA77GE?=
 =?us-ascii?Q?jrZVe3vdR5CVaQjzrtlxoXTwie6DOK2HJ+HkXGk73FAfCQwq1Bl/PSysnOd6?=
 =?us-ascii?Q?ChTf5PphfiGF2oYu7mU7r19lhz/LKrQo6I0nwu3Sfw1y2198xubOyUV4G1Ha?=
 =?us-ascii?Q?+taJEj/rmb4DJ3Y2LHwhp84BKiozHbiKYhRZSQ+fvGHc/gvPWWSByOOhqpA3?=
 =?us-ascii?Q?FQYR0AVxLMSeGAt2j47tnibhIy3MVY54Y2AaXzYEkdWEtBVyCJANNYF3CWf8?=
 =?us-ascii?Q?Pap6xVPzrZtvM8Qn0eTgnuzQiIcHT7zhxSQT/pfOnaMutcWs7TxBKWctV/6I?=
 =?us-ascii?Q?Wmxd4rwrlD9pq7UTX43uNnnARLqwsO1j19E3L6ATWPwrlHUymmaQAzRxgUah?=
 =?us-ascii?Q?APf725Dnp/45rZWjbUSgPTXnKOrMdb2JqmWRLpopsG7Z6FDaS/suoKLly+aa?=
 =?us-ascii?Q?VluNIzi3f2/WUrSf4Dgnf9oww2d1EAx/eNvEsPqzOMh2SuPvvGMnDQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10560
X-CodeTwo-MessageID: b7bd3c63-3290-4c68-a358-673a64fc2851.20250922121914@westeu12-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.28f0984e-19d0-491e-b8f0-87290b72fea5@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 226ecca3-8377-4434-ddb7-08ddf9d23aaa
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|14060799003|376014|7416014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B3n4fJnBY6hAyHa+GP4ACbQWS22cLTQ9ZEOL2SGTHCVmuKNhvOl6mMJUY76D?=
 =?us-ascii?Q?kIEQ08G4HBqtR/Km9ep4xWdwFTuN9Lqs/0tG6gPSicmLeYoBK1iusfhLb1b/?=
 =?us-ascii?Q?An7tSQ36gcRLodhhum+hW1+Jwd/J8GTvYi6auggDw0TKsJ2u9zvcOAaiZPh5?=
 =?us-ascii?Q?hTZX7j6YtWhAuVXtlO04ye+fQMwo9vK4hDoacKe4IshVXKFHUfv2GsbZK4IG?=
 =?us-ascii?Q?oOW7Cctvhsa+JHGkXe9H4jYlZ5t2aYSqzy8IvuuGJPywC/HZNVbjHLm1AIrV?=
 =?us-ascii?Q?xIrPRq8hFJC/cmyr06zGvHQt3bLyXVrkZitFv+/UFH4AoDdfDUISDljt4+Pa?=
 =?us-ascii?Q?943SR9tZVQEYJrb+Y7/6FhDojr1u6/uYJpjfWBN4tA5j0CzzPUOi3fZrQ6BB?=
 =?us-ascii?Q?aK1hx19LgNpBx4gtN7ncFKX4ObWPyRhziXLgUDR5bK40T7cYEL1grywC/dZ6?=
 =?us-ascii?Q?Ya4UgllFwoiBVggu2yuEiMRyp9oX670NJ7ZVUUIs3Ia1fkCUIcFkIgYCNfdQ?=
 =?us-ascii?Q?TxcIN4pLzXOJ/eaFYfXZIiZtUBp4h8lbK4/78TXYbOGOLYXXaqmhxzHN4Vic?=
 =?us-ascii?Q?H7yB45CcjndvG6HT6bxYcGAChT6suwOF/tluWR2+cnS15h1idHwPVXNqV0SV?=
 =?us-ascii?Q?PmkqvgP6UlXr6Nfl5/gLwemmDYog6m98pTI843Oi7NiGjivr7avmIBZzmxEY?=
 =?us-ascii?Q?tVgEGB94rtx4C+BiqKzjK+njZI+NUprjemw1CqIJDeDe33uJY9STs1m/FDIT?=
 =?us-ascii?Q?KtWufdsArANuH2agekRfsdWu8A4ybEgBEkdtKT+I7h6mCGjkjOxKsjZ0mV9v?=
 =?us-ascii?Q?Kqfy7i6glTKxgDUosF/RQrY4gkJ5mFqF+znLaShjFfqhNCrRGEYuy7Za0fqx?=
 =?us-ascii?Q?kcpfVnr4s+7tK55p1zKpz9tpKGkxMj8ol9E/2bblMpJAojCR8/3luQ8Zx9ml?=
 =?us-ascii?Q?F7g58nk83brHTIMa8AfcdSTm4ax+sxmuaNjy5WInInx+JGeUSyoEerMxguHV?=
 =?us-ascii?Q?7VaQZ5U/XXFahQegzHduyfO6qvSnCfuHXaKEO5qpwY9GO97lJPAXOIY9j//W?=
 =?us-ascii?Q?g6oN1xvZS7c6yUTIZ94XASfXx9vDcARPO5kBO5SMRIC1rqTqTSPFqxMSBSDc?=
 =?us-ascii?Q?KlnNY3x3OuhHgnlw3i2tcqzPqcSwQKm1UCkShfmymVTTChCnUhNDQG9dR734?=
 =?us-ascii?Q?4fr15Jwk3hRw2rdmLOWdHZmZISmcQvGKQ7jtTz2J08QiicZ1ET1LB32Td5Zx?=
 =?us-ascii?Q?JH70dNTXYOm+uesgGNM5uLPBe7lci5wzUqXttoLFBDrxLr+lD51jhhr6HgMx?=
 =?us-ascii?Q?B0fm1myvVqc0v7rVTyEagEXOFH5lVwpxY/J8mqD1PKqrTcFsaweSaAZ3zrYo?=
 =?us-ascii?Q?IKCs0XsXHlF6QGkUCJ+5zV+KP52oSRhsyfpCZvqLTZHwdqMrV+u4OTMsdFGI?=
 =?us-ascii?Q?d30bqgT3vRrmsJH9cxwyY5UYin6GGD872q8sw9+UeebEtEqZ0g+i4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(35042699022)(14060799003)(376014)(7416014)(82310400026)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 12:19:15.7812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f758a7-ed80-4a8a-733e-08ddf9d23f84
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8933
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
 drivers/gpu/drm/bridge/Kconfig                |  12 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c           | 427 ++++++++++++++++++
 4 files changed, 610 insertions(+)
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
