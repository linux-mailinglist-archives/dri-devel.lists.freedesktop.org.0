Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6004B2B8AD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 07:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3247210E208;
	Tue, 19 Aug 2025 05:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="byCWTSLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021108.outbound.protection.outlook.com
 [40.107.130.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC7710E205
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:32:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWZaayDIXyxlwL7UOenLycLTnbZdK17Pqm/kR9U/EW/bFXcsHEs9vaWf5sUOpoIJatKIdhahMeZuGyltt94YPcklVzZZoREcf89bUMLM7BI7ly4P+sGvKH1UE0GUBxN/hzcJ0ltf2/TjBpYbP2SXalD3i508PPVSJnL1VoeO6MSQjS57bgM17e7Xo3DX4Ctxc9mkq0uL35yrpHji6rg6jm78Gs/H1uevFcRCZY61sHS3cVqOA0Oax8sq8vbmFox6TQbad4yt8f4RbcS0U2djahF+G0z8JFjXIzwAZtr7ztnZCJSCHoV3WpEHMDvLSOvgy29yR2k6aahoFjb/e6Oeag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5jaA8PyI2V0OfuUew+Df47Vx+s5hQmkhRUk3WYrnZ4=;
 b=Juh0P7smi0nPzvRxuxgcDeQNUFXV15OIANcl0c7f/nTdSMm5ZxK2PZTl8E+3YAlMycwVffWIrfoc900gbFGn+JGTHQk5Ert5JouBrnpF0Q68wMCaxp8w3eB2YsVxIh1K8EhDUdiV+8BIqDsA+/k8Ro4NwTeFGulWPHzBkt95aNx4lZ14zBFZvr4/c2/zPDWdiOnt/dSvPDAutJfkbPErG/00b3n6LNLkdesG/VEMEs0l0W3Rt0W8cXk1txVLhc5Dl6uLbqCseTZa32QSkHwk6GAmVGw7kIU4q2tPkaros56orQ9Rs2658fCpm52F5Vxdic8AUDeGKVTTPXrkASLDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5jaA8PyI2V0OfuUew+Df47Vx+s5hQmkhRUk3WYrnZ4=;
 b=byCWTSLZadOzTvrf8+Pi+3aH+opSlyiKTdK2BkImqtx8OFWak5HvX7HUc4FFTiSjvIE+nI+xRoTY7zKHDlHhM6JJ1T8qnn5KFTUtxDSl25f48nwjnU8k+wfhYmVzcDSrpVyNWi8x4cBVuQvmOvMCbXtJTA4hmeAKIyUdU56w+aAOjju0N8Y8bQ+gv6RE0FjZBbWgv4us/IPU5qYxZ2fwc0KnK3QDurzmTr4oMmzxS0GZDV0j/KaJze9S2bxpajHM8gdE/yo5TV/3rAbFeS4CdFUVYF8e0s6ViL2XF2ATzPLAtutby8SKEK6U7giWxQAIacpjl+XrgKQCP/hUtwVLxg==
Received: from DU7P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::17)
 by OSKPR04MB11463.eurprd04.prod.outlook.com (2603:10a6:e10:9c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 05:32:16 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::6a) by DU7P251CA0014.outlook.office365.com
 (2603:10a6:10:551::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.22 via Frontend Transport; Tue,
 19 Aug 2025 05:32:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 05:32:15 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com (40.93.81.79) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 19 Aug 2025 05:32:14 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DBBPR04MB7851.eurprd04.prod.outlook.com (2603:10a6:10:1e1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 05:32:12 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.012; Tue, 19 Aug 2025
 05:32:12 +0000
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
Subject: [PATCH v2 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
Date: Tue, 19 Aug 2025 07:31:14 +0200
Message-ID: <20250819053205.9976-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819053205.9976-1-mike.looijmans@topic.nl>
References: <20250819053205.9976-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f1878466-8551-4b5d-bf2e-1706e377d436@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::35) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DBBPR04MB7851:EE_|DU6PEPF00009527:EE_|OSKPR04MB11463:EE_
X-MS-Office365-Filtering-Correlation-Id: 359172c8-d8b0-4f5d-835e-08dddee1c1f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?tJ+SiqN1qzpXvrfwB5KHEDkjk8tRAkHky+VtkqSiFkY29Vek7YIicdGWvwQi?=
 =?us-ascii?Q?zA06xxkJ4xDu0glVef+zq9wKJ2dtoYUc/wa2mvCr9tmMWrrVfFYG6H65Q15d?=
 =?us-ascii?Q?+xe2+g1sNPCCNdwjL6ypGorNGau+wCAUUmmisszTfGtu8xvlc6jiYoKRBCIY?=
 =?us-ascii?Q?EVli43yLz7XZXcWLvYPwFdMUPBwPY184yyLa/Okq6AljB9/bteHm72CtBU0p?=
 =?us-ascii?Q?zgxkjrTbRAts4f9kD+Nol9i59/8w+n9HSL84kFZ46fUsh7hrP3gxGkygHVWu?=
 =?us-ascii?Q?RRgkV+q+A951AQV5eAn01hsgNZrYdfgs9yKvwjZXef5eYiC+VwZV29Q39lc2?=
 =?us-ascii?Q?hpNlzGi6veE/qpMgtw8R/8ZcLqJuwF1r+PxL02Wmn+0kLcMl1/pQmZA0FkcW?=
 =?us-ascii?Q?U4dClAcoXGUZ6qqe6rBut2DE8/fJNo+0tAFNwGYynOENeCX6w4sf67sqdwO8?=
 =?us-ascii?Q?JErOJh/7BOvCGABFk9iZg5o0AAhtjb35J3yMAaKKXrEbYvIoYght/E5G7/sV?=
 =?us-ascii?Q?oahNyXPQUro3pshhk1oosRFpp2qBYoOwyQ/WRvk0QO4hJDri/G8srg5Pdyo/?=
 =?us-ascii?Q?m+lwxYuug8wGvkczqwrMI0/mnSjrjj/O0gtRm2hR92bERW84jjxaexu+hk7Q?=
 =?us-ascii?Q?k2IF2gVzWBIvYnWNRx39WFQxuMhPwnw8UDV4RnORuRhoLRHN1iRDp5gJwYeN?=
 =?us-ascii?Q?m07mT2AKFQ7BPHvDohgKo8PNC61lTd2t9VdqKxKqW0gScuIk5dHKpCa1cSOW?=
 =?us-ascii?Q?/ffI1Z8ZfogrxrGOioUTHal98fQ9ZFwqrH7mfcB8XyyxRBGL0ll/016x6aTk?=
 =?us-ascii?Q?Padf79iJkQW+2fQz0JnmpTvwK7iwUXd5hd440hgGSSUXFKjpsx2i25G8RV4G?=
 =?us-ascii?Q?YvK7Jn7lVzS0IM/45XGT/p92a5zTtFd7Lh/1Xxpe1sLaoQBjbDyQ1Ql3iBji?=
 =?us-ascii?Q?5AYwwIQwJJlDAdCUMc1iWVxqm8vL1MN2NviDrl8dA918UP98I/z3c473H+ua?=
 =?us-ascii?Q?GCIO6X10dkLARgiAWRdkX/ITEeIsRIkCrGi4/rLLj89ffosXcnP1F7NTy3y2?=
 =?us-ascii?Q?3lt7I5z/n/E5wlatNevbsLunRwRkhh51NUR49OqgcpMRtNUa7Cs+jTcUu1DU?=
 =?us-ascii?Q?KcXsubYot2JhY7gvv9fIK0nrgbC5VDxct+o0OoeZVoLcG3SPrRWfsOrkcD+S?=
 =?us-ascii?Q?aQmdZj4rztDzm+gcFrNY6QVO9Zys9rik28text9wGoweH2Q3dtJAeTvtwcF8?=
 =?us-ascii?Q?vI0kqLR/+k0CbxuFidt/BnGgW/EBg70/AQi7x0n8YvOlt2eh5ATH/VqCgZY8?=
 =?us-ascii?Q?Y0eXsGBQq9xvBYaPTza4VwIbEqlEDs0+0Eib+0n0GnKTKbjsbeyL77Aji0Jq?=
 =?us-ascii?Q?8ldospGGrsYFI25hh9EQGcBvYb2VYs0svzo85lbTWfAlvIvVjRayY6wIm6dq?=
 =?us-ascii?Q?IjU4JsyUGek=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(13003099007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7851
X-CodeTwo-MessageID: f6e29f90-a4f4-40cb-938b-6782a2a18211.20250819053214@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ada017f7-3680-492d-e891-08dddee1bfc8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|35042699022|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QU2UT/gejaeMjufD6GVa0fBzKIl0avR6mbQzMrbjhkOVqthxXkozpwqvwdqf?=
 =?us-ascii?Q?rueomSPTnGY3/BwSTyX2JbnYRj+E8i81h1KzgawQiK4Qo7j9lRiMuDdzbHnA?=
 =?us-ascii?Q?qwP42hUaEvsK56p5gMUfU/QDcJ4UCODLDJBEY9B2kfbcHYdSBf/fUkBztsIk?=
 =?us-ascii?Q?7Puz+cb3kL3fUfi0049hEZUtI5U9k8Mla7bbqdi9TzKXB8yQP+/ExHaRbHSV?=
 =?us-ascii?Q?NGLnyWtIQ7yoTJU3+6DcQgEJfGvzBMuiWpr6FArBZuDTu0G87STmZRYwxRQB?=
 =?us-ascii?Q?dE8queH/WLg2dJkv9VYUSyy8b74J/gJvkrWdgthics5UA7F7+lhs+KXVZfzC?=
 =?us-ascii?Q?7WhB5bEx0nTSbkuMmA407S7eQJKwAUN4rtfmlSPkLRYrsDQcJLULZ1cc7izn?=
 =?us-ascii?Q?wzZrOUAOZY2JoDK7mQ3t9qnV6pCW4GqtgPWdHhJKGCwSqAarXn1RDBby7YME?=
 =?us-ascii?Q?vHtZVzLROnQOMbo0ZRuWwmvv/+j80R8UfcMywTMWVGjtcr9aZu4dphSCgIeB?=
 =?us-ascii?Q?XEzup3WFuNTVbfg6Q+dOIQM6QAkJuR00zliOHjGCdKNRDmVXXcjYaac1xPfd?=
 =?us-ascii?Q?Nxw26Z+Gn1Zm2xgt55ctWrkOZxTg+21mvMdNxXTISoL/iBX7xJobz8ZgLknv?=
 =?us-ascii?Q?+V4OV1eaJmX7sCvLr+6lh4AjcxMONLohW40h4glRQK78H8fMvio/NIa5W+FV?=
 =?us-ascii?Q?6EmSnoYwFRabtXC8hZyg9FaGNdJHmvAuML/stxJGoS04LSq+K5hSm19MpamC?=
 =?us-ascii?Q?QS7pHWJKpiz6QFmEtUc0leZbAdwAc7FpcLCD3IKw/C8N14jH/e0ltAd0woar?=
 =?us-ascii?Q?oabLAGCU30T2jXr0+rNFePr7fFvl3GKVAc3VqIuY2pL/nqbsIUjhsuXufkXu?=
 =?us-ascii?Q?rU108ojdCuox6DGd3to0RH+woWj2dcggOZ95VzcDkQUJRyJ7meFAjf8OYs6X?=
 =?us-ascii?Q?7ry9Jv1fIfWiDbGwPXmHrVdRm6WWrXPV952AZUdxU/JaEZN9qxysdd5Z3o1n?=
 =?us-ascii?Q?tC6Kwm5TmCZ5NjlBjwCfydUbrpCIk5ligQP1R/5NnwUVjC+LCdWan/k6EBZ1?=
 =?us-ascii?Q?/YwZmuOVyHz53aK4J+wvJQeLgxZkDVPw324nuEw6Lb2SI7uxFMe9ml6xcS+p?=
 =?us-ascii?Q?u8B+ZXT5fL0nfpuWfbh4bvpxqYyCjGRmGdvOgMfFfmpFIDi7NB+HD5/pYraG?=
 =?us-ascii?Q?AhMYX3uNR29XLSGtt6DZQ91ilMZTgFUd4ujkifoLNeS/Zsoca4TXDiLUjlYn?=
 =?us-ascii?Q?ZG4KrH2/rPvG5BN2kqgPq4wQGTtZLEkmzXaFVEBmlkPIx0YbKlWwmM949Fvl?=
 =?us-ascii?Q?fSJKlbdPucIfn+a1FrAegGr3pOm3Fi7Gm/UqMjP4ln+ItgFRJTHzlkzuj/M5?=
 =?us-ascii?Q?O/qGymQPu3tG6EuVWjoxAsyhIcbn3YsYQcQkvMD89KDet5Cxqd7Vn4e8yG6X?=
 =?us-ascii?Q?dguprUj8efouXoJTDSYmSAOKGzJYQdqvFcBwH6e9r/preE/WlRHs4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(35042699022)(14060799003)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 05:32:15.6862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 359172c8-d8b0-4f5d-835e-08dddee1c1f5
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11463
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

Changes in v2:
Document driver specific bindings like slew-rate and threshold

 .../bindings/display/bridge/ti,tmds181.yaml   | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181.ya=
ml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
new file mode 100644
index 000000000000..816bea54846f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
@@ -0,0 +1,143 @@
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
