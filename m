Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA3BB2B8B0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 07:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4094210E205;
	Tue, 19 Aug 2025 05:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="SmpR/MDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023118.outbound.protection.outlook.com
 [40.107.162.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8484910E205
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:32:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBwwfGqIdvYGvplZi8dGXJY5aeoRmlLodgQ6hofq2Y/xUwijwl/1g6Xf94q6L7mvu5xySlhpo+Kn9MvIxjGZZZIi11a/h7QePD1UbuaRjQIlxonlXz4G9oPRQ8lcTRriZi9IuryK0VwXXEsuSE27ss1uAoxnPIUiAigr/1jEtFptEkXA8blDBuXDKDZGsovp1zkRw5nL8gdL2D5Dkzp2SxWbfYSWQS8t0lEe47k9LkNDz8UyhQHZ3ZSdXJNCOEBGUDO28GgZzIHpC4/VmyapC8ibOy5LjM6ZaeRmu4rtg16TxsthyBDLHWIPSKht8b4WxKTTI4SoDhh7K41T1ziixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwOJK77zTV78BUz0IA8p7xLxnD3pZX3YrZGI0qRmVDg=;
 b=Ae3fzWth/mABZh8j6xbOYY3HgsaLEX7fJbps8PkDdVtEbi+m4zNRfqDTDAYWJ635SRmlglpQ63FfhZ8m3gEWWiiYi+vR1vi3UKTTHC4KOAMlqMWMCYRl0PdVDuP5oR/dx0+fN++7pQoT6bZDzYzu8iqJbPhGZ9kduAZ4elUrBotHUzFnjm9wU9pZtaWwY4EPuV7ffmF66CAI4Nlinb+TAJTKndSeRzmVx+7rxBcC9N21rJVAci+X2EoV7hvKUOCxoDgOYHd1YLDA2mxC+rkV9d3MXlIXyo5OiMCGPDA7Hn4zphwP3A2sGgE/tJgxOusWIawtb+Yi2rVvVSIGSIf3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwOJK77zTV78BUz0IA8p7xLxnD3pZX3YrZGI0qRmVDg=;
 b=SmpR/MDXvLSaoxXEbo31HALkv1LvvSH7FdxwICP8HjgVVSZkV0YT4pSbb6B2LD8oSzJObbmOtH4lvNGpbKYM+N7h0CCMJQlMQZj2a5pclskNz+ZEwuekGaceTECl4DWasx8hvUuPFp+HgFbD9zFklsdWt+3pB//nkrvXIxD4ubGeie+p/Jhj/fqmz8bjaNjAfm4u7T5CmWqU1zlMw4qiRg0WxTuQgDQd+hsrZcMs/rKNVrNWxxpAPLWzZMqzmO6fVGjCHspFHDcLSZfRKj98WP0oKPNznJa1tFzYSZteZTG0eb69dbB4NdRtmB9zzFO7hx3+cGGcJrrnUI4B4VNK3Q==
Received: from PA7P264CA0028.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2df::7)
 by PA1PR04MB10358.eurprd04.prod.outlook.com (2603:10a6:102:453::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 05:32:18 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:102:2df:cafe::1c) by PA7P264CA0028.outlook.office365.com
 (2603:10a6:102:2df::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.24 via Frontend Transport; Tue,
 19 Aug 2025 05:32:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 05:32:17 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com (40.93.81.79) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 19 Aug 2025 05:32:17 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DBBPR04MB7851.eurprd04.prod.outlook.com (2603:10a6:10:1e1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 05:32:13 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.012; Tue, 19 Aug 2025
 05:32:13 +0000
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
Subject: [PATCH v2 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Tue, 19 Aug 2025 07:31:15 +0200
Message-ID: <20250819053205.9976-3-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819053205.9976-1-mike.looijmans@topic.nl>
References: <20250819053205.9976-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.9365be0b-205e-4d59-ad18-c1924bf45277@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::35) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DBBPR04MB7851:EE_|AMS1EPF00000042:EE_|PA1PR04MB10358:EE_
X-MS-Office365-Filtering-Correlation-Id: bdbf76fe-485f-4144-a5ac-08dddee1c31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?LqxmhTuNlSk7RXCjF6nQre5eD8AEQ4uCTwg32gNZMLxqAs3PEOMYYMLSWGam?=
 =?us-ascii?Q?kSkR2+uyfk5ks7TrYIamTCGY5hdQj1i81mCHNozS2LVFg932TWK/Ky7qBUmA?=
 =?us-ascii?Q?uzq79PEB1KGurTWKfk6ayv5Ebk6C1ahzsJ3ZsvKdgiy0C+CPoyp0OqHjEUlX?=
 =?us-ascii?Q?qRiHWcU9AbVssvsAJ5f9Q6O1XR4dxMfetiXxyrwocKq1CgK3LQQcr6GkacWq?=
 =?us-ascii?Q?jJNDlFOoq8R52hWDeWgcxzqPxne52n+xRkTFOcJMTF0DjPuoeYejy7ajCHb4?=
 =?us-ascii?Q?umVrB25+6W7zUA69HNLQgqNn6yCJsOIyvs7+rh3JpUX7/KiY/9j0acJTPuov?=
 =?us-ascii?Q?NuCepuCs7Ze1HrmdTdm25rJN0yiAEVouSBQO3D92PDY0J3anHxGDQIc8Np1F?=
 =?us-ascii?Q?GTAGCNukq2UALlgp1u4Te8FLthi3luLS1qjdMXIXPMtP/vA7hAk76OCws718?=
 =?us-ascii?Q?flF4a8h5VmSszaTHVR17/HBy+KntHMjTq+59CRaEFQ1QRMhfXsjsM1YWNJDV?=
 =?us-ascii?Q?rflTdA6WPeTRgX+DcVEtVbizDC9wJ7iYWPkxkPEwiRqIlJ6pEngGrXkEw99k?=
 =?us-ascii?Q?XyZT5r0S14m/OwT2xbuD6Sbee44svHqUIG0tU+JgJQ/S2KtosiBHwnAswqGv?=
 =?us-ascii?Q?yybhopMyAYIX8WgzB1NgetJh/fak1b9UsZCS3D3iEuwd6NP5HirH8G7RUcf1?=
 =?us-ascii?Q?gL2HeqAJdJDf06uI8UydZOV6fyeph9wifR7+XEdOPfRLmtrMMomkscwDHs7l?=
 =?us-ascii?Q?bwQRKYLRIMuZwgcv6B9IQnaVhgn1Od4kLRD06ZS17uqakCnUtWRbqbjEAK24?=
 =?us-ascii?Q?jlTgPmHRv5/R+TGAeskoJQ2sRrwXgL7IF+s3Fiwk0KLfh57o+drzZFKhIieC?=
 =?us-ascii?Q?cZbEO7lsdes7L7lLRiZLwC2gS3JFV0XihxrG5GPWe+9GR+HYWYu3flwBeypl?=
 =?us-ascii?Q?pnzIUfW5wNJzlTpLQGKo7Ky6K2fdT4DLk37VXuaMJGsIJGdHWduE+0t5VUNg?=
 =?us-ascii?Q?FITYxcHampP2D37JzPxEOpwnwjaWSt/jMtGWeHzYhYnmqFiXteMh33eoN+JZ?=
 =?us-ascii?Q?TKuVOD/vtnxVHHNn6i2/W5ppk8orFBT63rw2xWqtVxRkQE3/zWaMJ2xHotCu?=
 =?us-ascii?Q?Ld5WXMNBDhtUeRQgPgPTLU2kPFEW/N9PYCyZxMCyey3D+4fKekZwIECIjeJV?=
 =?us-ascii?Q?e4zIvN4CYk83n1kejDG0lYXf1RlsKbBs+RlygJQPbzzSY9nZG1GPt9zyWxYo?=
 =?us-ascii?Q?JAf5O7uBftNaL9DmrnO3fakgzHqYcBjFZ1Ekhcclp6gFaKlaBLS0HKZn6tjG?=
 =?us-ascii?Q?F5rOVystHf05gDsP2SOVjnmUjywSoYVXM2tcTrWyj/GUzLuZjsUf/pwleKH4?=
 =?us-ascii?Q?YMvXVR4bZJ8wL+xZiWiM/OrpUMv4WtiltMWrvRYsf4pXD22frUtq2q6vbVBW?=
 =?us-ascii?Q?FfdlutUMfyA98E9BVvWoRHFcZBkhQh+mvo15bUC62rvdhr79E72IlQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7851
X-CodeTwo-MessageID: 86e1b5c8-cacf-4b2f-bb7c-ecf7768926f2.20250819053217@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f385d8ab-a938-434d-e902-08dddee1c020
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|35042699022|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9mdA+dq1LAiRuq8LpF+4J4gAsIg4hh8L1h1H8Kj6GTLjfNuPPP6PBOfFC9pY?=
 =?us-ascii?Q?p/2isXCdhqFUfFiOkLs6WMA8JuHhvLiGumeawBKtJDfuW3YGFOLySW+kCYAM?=
 =?us-ascii?Q?2LzGMVrMbKvjOHataS8hcjtmg+cOv96pC/YEDBqO8ZwlvxhLtUqHSxNlc5Cv?=
 =?us-ascii?Q?uvMjfyhgpHLACJa1Uqvz15lrty9DhkvRgiW92jtHVQ/4GjZcScSKgNQZv1CQ?=
 =?us-ascii?Q?02lfwVX6CMpR6EsJIe6slwaDeG0LrmFXUyPbtYImcbZqAx4qWV9oheYP5k3r?=
 =?us-ascii?Q?enGE6D5h4PU7HeEOv1gV5pt0wSymV1DLTgt0yOSPaq1YDmFqE7zgv3XUVvgx?=
 =?us-ascii?Q?aKCsZObI0UEjcw/8tY3PLnQ7z1d7OmowbpUGFhKCSdWh7SbkGq3VPjySR/BD?=
 =?us-ascii?Q?FYoJmmrE9ND2m80TtAOEsfFsgN1Fb2Zk1mNh0/1E9Zy/IEJKC6R78/kFMuYW?=
 =?us-ascii?Q?S3oOVKc9jhbSh4emajXBrNVMrXVpA6CSE0aN3ByheMgkYE+X+yg33HJF+X3R?=
 =?us-ascii?Q?LTvz7qd1IQc2e+d6pwPqMI1xhaLGNdzPOkDafUlCFB6ZpqdNAWaGpYnb1xFM?=
 =?us-ascii?Q?6CP+Ma6hz+OW0huED8PQRXmYIwsbXi5NmAgvd0oJ+mC0ZP46SjHLkZ6xoTJa?=
 =?us-ascii?Q?g01lRPYoc3csAyRmtuyh11PG5MLMyjN3OE7V49bVf1NoLYvW51t647R7489p?=
 =?us-ascii?Q?ZQ6/+CKNwSdRU0wvxZ6JW/EOGXA1dQ0RE1OGkrNY0cRDZOsVizANysiOKPj9?=
 =?us-ascii?Q?wPk7U2iMP+/CHcdIHvX0ujOiAP39uRHRoXSScJ3uYIDOy4bWu/xDmeWQaAol?=
 =?us-ascii?Q?CTdo/Bo4US3Q3dAjjlEbshCRvzSFGJqNvpj7G8C18FD6cBBlaCTEPhD6o0ij?=
 =?us-ascii?Q?Dn7H+cFe/5cquetLbjJQBZzo7UDMhOjiuMN8FAQuOf+CM1nqS0BGiyOP/QTP?=
 =?us-ascii?Q?xY6mDOKfu4JSahIxjCPJJP90/3cjEx8lKTlHOcMBoM65O/7tLHkCOJwuFFK0?=
 =?us-ascii?Q?+2PKOZdyj6hsfCEWsri0CD01XGf9sguLJaWhU2sNE/1FBFH7ThnUb3qvAW5b?=
 =?us-ascii?Q?HJlhA8yVEAwpLHuYNKcoAppVBoOJoBLgrA9CMheJrJwpgdQJ1AadZsZidYk0?=
 =?us-ascii?Q?4R270qp9wf1GgSRsBSVPDQv0EsvUzt8ltH0whguomHD3HEfw9c1paNDYWzX5?=
 =?us-ascii?Q?5TUzYPXgke1jlxymNZ5nu95/SwX2ad4cjt8Qc/RD6fWZ4yjXZpd08LUp4SbF?=
 =?us-ascii?Q?v99dFjyB6lZEMULcJmRd/fi6n/NCW/iDrPXfhFOLFG1iwN5knV2Iegm8UlA+?=
 =?us-ascii?Q?N8jpYot+3kE6UnZAP8DtQkHwhDImzALw2jTMIjOV5G03A1WTl0lQsluw7iGO?=
 =?us-ascii?Q?Pb75kvFlYwLWzKpslh96YT3RvEUShnUj6VYkTtBWFltaDLZssDOjS3ykENph?=
 =?us-ascii?Q?gFrFKnNSolOo2+OtPhsEUbHrUdstUzyV6x8P0NIs1MML0o1TC7urV9FXyP7X?=
 =?us-ascii?Q?hB93NX7KaT6b+RQG/90pavualFO4wXHjWwbo?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(35042699022)(14060799003)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 05:32:17.8361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbf76fe-485f-4144-a5ac-08dddee1c31a
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10358
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

Changes in v2:
Use atomic_enable/disable
Use #defines for bit fields in registers
Allow HDMI 2 compliance
Filter modes on clock range
Use cross-over pixel frequency instead of manual overides
Devicetree bindings according to standards

 drivers/gpu/drm/bridge/Kconfig      |  11 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c | 561 ++++++++++++++++++++++++++++
 3 files changed, 573 insertions(+)
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
index 000000000000..34cbdb066820
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-tmds181.c
@@ -0,0 +1,561 @@
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
+#define TMDS181_CTRL9_SIG_EN			BIT(4)
+#define TMDS181_CTRL9_PD_EN			BIT(3)
+#define TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE	BIT(2)
+#define TMDS181_CTRL9_I2C_DR_CTL		GENMASK(1, 0)
+
+#define TMDS181_CTRLA_MODE_SINK			BIT(7)
+#define TMDS181_CTRLA_HPDSNK_GATE_EN		BIT(6)
+#define TMDS181_CTRLA_EQ_ADA_EN			BIT(5)
+#define TMDS181_CTRLA_EQ_EN			BIT(4)
+#define TMDS181_CTRLA_AUX_BRG_EN		BIT(3)
+#define TMDS181_CTRLA_APPLY			BIT(2)
+#define TMDS181_CTRLA_DEV_FUNC_MODE		GENMASK(1, 0)
+
+#define TMDS181_CTRLB_SLEW_CTL			GENMASK(7, 6)
+#define TMDS181_CTRLB_HDMI_SEL_DVI		BIT(5)
+#define TMDS181_CTRLB_TX_TERM_CTL		GENMASK(4, 3)
+#define TMDS181_CTRLB_DDC_DR_SEL		BIT(2)
+#define TMDS181_CTRLB_TMDS_CLOCK_RATIO_STATUS	BIT(1)
+#define TMDS181_CTRLB_DDC_TRAIN_SET		BIT(0)
+
+#define TMDS181_CTRLB_TX_TERM_150_300_OHMS	1
+#define TMDS181_CTRLB_TX_TERM_75_150_OHMS	3
+
+#define TMDS181_CTRLC_VSWING_DATA		GENMASK(7, 5)
+#define TMDS181_CTRLC_VSWING_CLK		GENMASK(4, 2)
+#define TMDS181_CTRLC_HDMI_TWPST1		GENMASK(1, 0)
+
+#define TMDS181_EQ_DATA_LANE			GENMASK(5, 3)
+#define TMDS181_EQ_CLOCK_LANE			GENMASK(2, 1)
+#define TMDS181_EQ_DIS_HDMI2_SWG		BIT(0)
+
+/* Above this data rate HDMI2 standards apply (TX termination) */
+#define HDMI2_PIXEL_RATE_KHZ	340000
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
+	u32 retimer_threshold_khz;
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
+	return regmap_write_bits(data->regmap, TMDS181_REG_CTRLA,
+				 TMDS181_CTRLA_APPLY, TMDS181_CTRLA_APPLY);
+}
+
+static int tmds181_attach(struct drm_bridge *bridge,
+			  enum drm_bridge_attach_flags flags)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+
+	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
+				 flags);
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
+	 * When in HDMI 2 mode, the clock is 1/40th of the bitrate. The limit is
+	 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
+	 */
+	if (mode->clock > 600000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static void tmds181_enable(struct drm_bridge *bridge, struct drm_bridge_st=
ate *old_bridge_state)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+	struct drm_atomic_state *state =3D old_bridge_state->base.state;
+	const struct drm_bridge_state *bridge_state;
+	const struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
+	unsigned int val;
+
+	/*
+	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
+	 * from the bridge to the encoder, to the connector and to the CRTC.
+	 */
+	connector =3D drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
+	mode =3D &crtc_state->adjusted_mode;
+
+	/* Set retimer/redriver mode based on pixel clock */
+	val =3D mode->clock > data->retimer_threshold_khz ? TMDS181_CTRLA_DEV_FUN=
C_MODE : 0;
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+			   TMDS181_CTRLA_DEV_FUNC_MODE, val);
+
+	/* Configure TX termination based on pixel clock */
+	val =3D mode->clock > HDMI2_PIXEL_RATE_KHZ ?
+				TMDS181_CTRLB_TX_TERM_75_150_OHMS :
+				TMDS181_CTRLB_TX_TERM_150_300_OHMS;
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRLB,
+			   TMDS181_CTRLB_TX_TERM_CTL,
+			   FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, val));
+
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
+			   TMDS181_CTRL9_PD_EN, 0);
+}
+
+static void tmds181_disable(struct drm_bridge *bridge, struct drm_bridge_s=
tate *old_bridge_state)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+
+	/* Set the PD_EN bit */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
+			   TMDS181_CTRL9_PD_EN, TMDS181_CTRL9_PD_EN);
+}
+
+static const struct drm_bridge_funcs tmds181_bridge_funcs =3D {
+	.attach		=3D tmds181_attach,
+	.mode_valid	=3D tmds181_mode_valid,
+	.atomic_enable	=3D tmds181_enable,
+	.atomic_disable	=3D tmds181_disable,
+
+	.atomic_reset =3D drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
+};
+
+static const char * const tmds181_modes[] =3D {
+	"redriver",
+	"auto1",
+	"auto2",
+	"retimer",
+};
+
+static ssize_t mode_show(struct device *dev, struct device_attribute *attr=
,
+			 char *buf)
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
+static ssize_t mode_store(struct device *dev, struct device_attribute *att=
r,
+			  const char *buf, size_t len)
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
+			val &=3D ~TMDS181_CTRLA_DEV_FUNC_MODE;
+			val |=3D FIELD_PREP(TMDS181_CTRLA_DEV_FUNC_MODE, i);
+			break;
+		}
+	}
+
+	if (strncmp("sink", buf, len) =3D=3D 0)
+		val |=3D TMDS181_CTRLA_MODE_SINK;
+
+	if (strncmp("source", buf, len) =3D=3D 0)
+		val &=3D ~TMDS181_CTRLA_MODE_SINK;
+
+	if (strncmp("eq-", buf, 3) =3D=3D 0) {
+		switch (buf[3]) {
+		case 'a': /* adaptive */
+			val |=3D TMDS181_CTRLA_EQ_ADA_EN | TMDS181_CTRLA_EQ_EN;
+			break;
+		case 'f': /* fixed */
+			val |=3D TMDS181_CTRLA_EQ_EN;
+			val &=3D ~TMDS181_CTRLA_EQ_ADA_EN;
+			break;
+		case 'd': /* disable */
+			val &=3D ~(TMDS181_CTRLA_EQ_ADA_EN | TMDS181_CTRLA_EQ_EN);
+			break;
+		}
+	}
+
+	/* Always set the "apply changes" bit */
+	val |=3D TMDS181_CTRLA_APPLY;
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
+	return scnprintf(buf, PAGE_SIZE, "%u\n",
+			 FIELD_GET(TMDS181_CTRLB_TX_TERM_CTL, val));
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
+	val &=3D ~TMDS181_CTRLB_TX_TERM_CTL;
+	val |=3D FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, newval);
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
+static const u8 tmds181_id_tmds181[8] __nonstring =3D "TMDS181 ";
+static const u8 tmds181_id_dp159[8]   __nonstring =3D "DP159   ";
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
+	dev_err(&data->client->dev, "Unknown ID: %*pE\n", (int)sizeof(buffer), bu=
ffer);
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
+	/*
+	 * We take care of power control, so disable the chips PM functions, and
+	 * allow the DDC to run at 400kHz
+	 */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
+			TMDS181_CTRL9_SIG_EN | TMDS181_CTRL9_PD_EN |
+			TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE |
+			TMDS181_CTRL9_I2C_DR_CTL,
+			TMDS181_CTRL9_PD_EN |
+			TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE |
+			TMDS181_CTRL9_I2C_DR_CTL);
+
+	/* Apply configuration changes */
+	if (of_property_read_bool(client->dev.of_node, "source-mode"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_MODE_SINK, 0);
+	if (of_property_read_bool(client->dev.of_node, "sink-mode"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_MODE_SINK, TMDS181_CTRLA_MODE_SINK);
+
+	/*
+	 * Using the automatic modes of the chip uses considerable power as it
+	 * will keep the PLL running at all times. So instead, define our own
+	 * threshold for the pixel rate. This also allows to use a sane default
+	 * of 200MHz pixel rate for the redriver-retimer crossover point, as the
+	 * modes below 3k don't show any benefit from the retimer.
+	 */
+	data->retimer_threshold_khz =3D 200000;
+	if (!of_property_read_u32(client->dev.of_node,
+				  "ti,retimer-threshold-hz", &param))
+		data->retimer_threshold_khz =3D param / 1000;
+
+	/* Default to low-power redriver mode */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+			   TMDS181_CTRLA_DEV_FUNC_MODE, 0x00);
+
+	if (of_property_read_bool(client->dev.of_node, "ti,adaptive-equalizer"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN,
+				   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN);
+	if (of_property_read_bool(client->dev.of_node, "ti,disable-equalizer"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN,
+				   0);
+
+	switch (data->chip) {
+	case dp159:
+		val =3D 0;
+		if (!of_property_read_u32(client->dev.of_node,
+					"slew-rate", &param)) {
+			if (param > 3) {
+				dev_err(&client->dev, "invalid slew-rate\n");
+				return -EINVAL;
+			}
+			/* Implement 0 =3D slow, 3 =3D fast slew rate */
+			val =3D FIELD_PREP(TMDS181_CTRLB_SLEW_CTL, (3 - param));
+		}
+		if (of_property_read_bool(client->dev.of_node, "ti,dvi-mode"))
+			val |=3D TMDS181_CTRLB_HDMI_SEL_DVI;
+		break;
+	default:
+		val =3D TMDS181_CTRLB_DDC_DR_SEL;
+		break;
+	}
+
+	/* Default to low-speed termination */
+	val |=3D FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, TMDS181_CTRLB_TX_TERM_150_=
300_OHMS);
+
+	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
+	if (ret < 0) {
+		dev_err(&client->dev, "regmap_write(B) failed\n");
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
