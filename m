Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1722BD397E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D27310E46B;
	Mon, 13 Oct 2025 14:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="ERN5HLOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020138.outbound.protection.outlook.com [52.101.69.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498F110E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:37:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSYG84BfkrjtMmgeIXonkCKjXJGBmuy7rZtA7GBGm29ZmjGqCD9mlM6saBPnNbE/aP8Ksb7O0SdJ5IWgmiSTrwBiZvTKI8T42wu+DMWUgtBhYPiSOtJt4Jv2fRrkwXt+QRFdBLc3IuV2zfeMkPcetzW3ZfryK/+2p2Uap0Ze6O277p+6L61ExGy8FPgR6fjO95AkPmZoQgmJFTOITKC+Z5g+Plz10J0rIOUWia4v/76bdamUWj79D0CyyNcXuzrgOt0ZIbUagcXa/Id2gn/yWixvnmS/BIyIRko+EH+WpuemBpqqgZ6LtMZdjVr+vBkFEydxcAty+BLgtchim++kug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRdrOAdYJXS7SyTnrYB24qfeYEqo0J5siK52ge60AhM=;
 b=SsxklXh1DN8JRTLBmz6TLEXT2IQfbGOpVtR0evdaDZSGuOxoJ2BbxeMggg4cKIh1kQqIegXpH2l1PI96TRZuonu4dS3wKt88OOEiFmLsEbqQ27oKekhD4mr/VDhPMa2d0/5CR7xVTgNKvCFoBtMKQD2xC3p62O9sNiWZ8NzgXqxLueylbw+6xG509yqQrcax73kLMxRa2KmRShSF60Rv6uz3izIxS6j4xSfvLYTBKG+p4JzESkDPdzIFIiSpA9oTYh9od4a/MviPOY7HErdUSfnAcNogn9YFuB60uudeycZd+sXkFWuLkMx+lubK5pDWbZXT5gQQu2XfILkIWXvAUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRdrOAdYJXS7SyTnrYB24qfeYEqo0J5siK52ge60AhM=;
 b=ERN5HLOg1zyDVe2IZL8Gnrlau+fOSSnfaSGh9R3GA+IptDHPXyIkbEXNFM0VwS2W9kEmch8gDyEXzAB8BulU20DzCYlrp19bYMebiEAvcrkUTsfa2rC1JC4jyVcwj1Jtbok2d864tJhqnPf+GR6aqQN3DsCJGBW4dKmoOn0SgNDPFgkiUQboJCzuo+nz5jqBrhfJisU3h4ADfNOmOLrmQSvTdA6JA5+v9na9rNV8NZvHu1OzrKwKzXedjE8zPAmUdvQTCmRHUPe4AcV6UXeNXWy2K5MCpHxOVww37bVnNd2ryss4M88yeNzwWBY//6/0LCYG3bS4Mr1fLN7DasA64A==
Received: from DUZPR01CA0194.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::19) by VI1PR04MB10075.eurprd04.prod.outlook.com
 (2603:10a6:800:1d6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 14:37:11 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::d5) by DUZPR01CA0194.outlook.office365.com
 (2603:10a6:10:4b6::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 14:37:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 14:37:11 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.52) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 13 Oct 2025 14:37:10 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GV1PR04MB10195.eurprd04.prod.outlook.com (2603:10a6:150:1a8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 14:37:05 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:37:05 +0000
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
Subject: [PATCH v7 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Mon, 13 Oct 2025 16:36:50 +0200
Message-ID: <20251013143658.25243-3-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143658.25243-1-mike.looijmans@topic.nl>
References: <20251013143658.25243-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.b5126fec-b83c-46dd-9f18-6b82f3894607@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM8P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::7) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GV1PR04MB10195:EE_|DU2PEPF0001E9BF:EE_|VI1PR04MB10075:EE_
X-MS-Office365-Filtering-Correlation-Id: dcab0208-f4a4-433b-1eac-08de0a65fea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?XverQuEKaVdhLUuJqdKQ/lw3IcNkz9HLnPBJPRgJShfgME4Qk9K9JV7zxP7D?=
 =?us-ascii?Q?f7hvRZc9J1hNnvl7FL0z5aiyf5ZHsXG0CYEUS//TtbYilNzxA40NvE1Lldp1?=
 =?us-ascii?Q?bNOiIjhPi58pdH376p7zdv3b9ZIgVv+DrYm/ZUiq2Z/P2blmq75cmE88b627?=
 =?us-ascii?Q?S2aLcPxrcgRDxZis8BVKRWp8AVXrNZ7LEdSug4+0FA/S1So0Pm+DOuadsE4Z?=
 =?us-ascii?Q?9eChMuNx9nL4pZ4N5xze3d34KST5gWiZIRMGcUlIV9dIBF00zDZi61iyjr77?=
 =?us-ascii?Q?wunjpS099l7ImjSCMQJuftX91pyvpX7h4P/NehZQZXRw3hCm1LqM9s7F9xag?=
 =?us-ascii?Q?h6EvmBt9ZkYtM243MNKnID13a02tsSncOmJxhcEQVJfohTPHV2FtMnF+Op9+?=
 =?us-ascii?Q?8YFYwI2gkW9bZ5A8IZnNRUetq0cKOpaKBs7ZQMXoR11U2Q1K1oLM14YfH+7k?=
 =?us-ascii?Q?Xm7uHXcSb1k+kKa/624Wjqe0fhNaC1lJdVgk2Dq6SdonLHYV4C3FAdxtFS7/?=
 =?us-ascii?Q?kYd1/D3RaVQkWdy6j8KwynYDiuZuS/SaWQAbHvrAznoUclbrBiHRNbMIWuRn?=
 =?us-ascii?Q?7faXCbFT6lfcDujXa5KznoZVhD626GENWpxPHjOREQ2qgvQZ+BsCHeRNED43?=
 =?us-ascii?Q?WUFCAAICSmcyptNee1skWN0TIW3/eiU1tcuBYer5+KhOjJc8/P/qOUIJWzzh?=
 =?us-ascii?Q?q5p2XSy4aiLRmgtAnnAJcdkeWJQqStdN4YbGkjHO5CMYjAKhZVvFVSsH5Kqd?=
 =?us-ascii?Q?JJyGsz/bjZRjtkr2/hTqcnnVzrXaXvuhuchd4qAfbSlO+AnGfmpYTTIe/AiG?=
 =?us-ascii?Q?pbUEkhLNAgNvA+g2rGea12R2ITS3vgz2kSJpmvDlKMD5eTz0flVlH2+UtVbR?=
 =?us-ascii?Q?EG/j70riozDKRQhfBZteFZsgU3F7EztNPkwsLmN/CuhIcRP2jHUQ48yrC0+M?=
 =?us-ascii?Q?uMf8IYM7BdBQqa1FYXwMADE+5Ph+W63cpGnp5h0+AopX7V7c2o62RKTzCjIs?=
 =?us-ascii?Q?O1OfSF5BNFKA7iu9ejmUm+dw+JZ7p7r8Txl4TcBT7ubqtNGskbqbHCl7qJbu?=
 =?us-ascii?Q?wh5k7hfqzq22oA5R1gWMJ7Ir6mHoz45rMWVtd7qQKbXy85L9aCbtyRyEMMAi?=
 =?us-ascii?Q?aD8D6VSf2l+QmmO+QI+u1V7Bgaf6uGqjuOZ3q6xvx2er9yEuZAbrMWm37yhI?=
 =?us-ascii?Q?JLaZ2A3M/kk6EX/WpDcd8anALqPW5oG1jrxVwV1wUEfOUKrcObcQS9hg1G6w?=
 =?us-ascii?Q?69I1WTpvN7Czk5kBWhq6PeqfVz5fEmrdG5/jv3ftezaTWK1JJwGvE0R0VJHP?=
 =?us-ascii?Q?RDdmBDioXu4dGKhn+OBr22IMn7S1+Lay92RbFngqFTYmuZw/zElrC/dyBhGJ?=
 =?us-ascii?Q?P+WgYSnVFYkT3Xf/MLAHPaDg4QK7jbTDW3NJKc7xQFeSCI6GetcTPxyBohBs?=
 =?us-ascii?Q?cKxLPLV9UrhevD8k9x/LWtVEt4rnNa/h?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10195
X-CodeTwo-MessageID: 1cd43b99-4966-4db8-abf7-df50ead0d274.20251013143709@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8ac0c0fb-c4f0-44ea-a513-08de0a65fb30
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|35042699022|36860700013|82310400026|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JIIl3ATzcnpkTHofTztOz86gMjiKPwn351CARHal+bIqwWGOP6LQIO4J+tbg?=
 =?us-ascii?Q?+LMBNQ4avFE6xzLZpOjWJnC1NzXw6BGUTRJ3n1irqY+iqtYOIgXQlnaPi4IZ?=
 =?us-ascii?Q?PuQ7YIT1tIYv2f422Yqj4OF2oH2Y+QkhsPa5MlCmAYFXknFyf4OCmARHToFP?=
 =?us-ascii?Q?GKrtOxX7+Vhidoc0V/bpOmhptiZmpi+g6I3Lx1WryHvOmOt0rQDfggfOcWb3?=
 =?us-ascii?Q?XCabSDUv4Nuh9XZFGQ/3Aur3ZH8h6Em59a9iw8MgYmfZlKIN+zYeancH2EHO?=
 =?us-ascii?Q?65NO7JIbJvNjkI2a3IIirjEY64rnUT80K3W5Nc9xNYGZBfcobxba7aJ9nJ7G?=
 =?us-ascii?Q?Ik9EI7fszpnO5nLDQ9+EZExQ0ucGqJnN7IJtva+lYB1E/aFlPjSSCu0r3wBm?=
 =?us-ascii?Q?70P3tfbauoVtYKH9F1ihdnLWxY5KSgjErJKTHcMXjj2X23szVctsON1tem05?=
 =?us-ascii?Q?JL0nYBHPAWbNdn1rxlu8S5pPRuOqZLGzdTCzTpFRU+omGymfKTBdzR1nLuSB?=
 =?us-ascii?Q?qkdYhh1TDBok73i19U4/9S+w9ETEFHt/tIYbWJQqVaf8qK1rPfuqFnPhbRX5?=
 =?us-ascii?Q?JLwttoQ7dFqdDfJ9mr55be9ZeoUgIUNsvxUv/1s+JuqQKwe5XlVHAVSE4q4n?=
 =?us-ascii?Q?RlhofYW5OGrEJ9j1dNRWB779tQwQTDq7Crp4yQBjUgqLRPZBzU3r5kk8hVT6?=
 =?us-ascii?Q?4zWnIXiR/evE9PzQJ2qex915QTJy2bt6D9vCe3O6b/nnceTFRF15NydgM1wv?=
 =?us-ascii?Q?zS1mqW1fhZhKb7W/ZcPmQ3S0BPtth0xXkACAbojw7FOXVILDMQWFoYz04+hP?=
 =?us-ascii?Q?AGfEO3GZ7G/QNMDMk1dgiU9iDPGFdNg5LM+sANTMXM62hzb+b5hX3X4ctiAu?=
 =?us-ascii?Q?WovL4T9ueHLFT8/EDv0PswRadxt6omPuDlVGxZLinG6627iPf0HTtfDHC9YX?=
 =?us-ascii?Q?Ui+eXTn6b/Wa1P/9gqNnnXAJ9v+aVnqa8z4RGO+SlbeM4N6GqP/ywViXAgdH?=
 =?us-ascii?Q?E4LW9mwG1if6p9gcK9lB4V1fABgsBWa6RO0HIu0eshmFwz/zn1VGc1mzDAJ1?=
 =?us-ascii?Q?hyZBo7YXrHdcZQfeZLfuQpDFHtVVjybPhSkQlWIse1C+nRPlgOZ0PVgXl0tu?=
 =?us-ascii?Q?DQU4jZKOzqk23+u7vEigxYdZsm+JDPN8KnDwg1iWc+VzNfPxYxHU5UPcAuSm?=
 =?us-ascii?Q?ci2e5BZQxU81PW6XYMKgq/+ceU5S1D7Ydf5HqnhU+nAnfswQhyBfkvmScDkR?=
 =?us-ascii?Q?9UosYl3eQE/2mFe70ERyFy7TG9RfcXKsQO8TZ3iHiDF5Qk1Nt8YFhuAYlhW6?=
 =?us-ascii?Q?vk0T7guAG8ozAC2oGUTu1goumB1EMFpNvKPEZCZG+Nap1l6NPQ/cOGlvMrR4?=
 =?us-ascii?Q?cS0xuAX63FPRXNakls4cdWDxaD0oCIWKV2xWNAjLfM050tJ6MNZPvYS0VoCq?=
 =?us-ascii?Q?zPoTyc2f/UC/BvieJC0er1suVHc8YccAVy8PL22Xs5CjuhNYxGqmirY3KIr8?=
 =?us-ascii?Q?f6NBXN2ujjgmZwQ=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(35042699022)(36860700013)(82310400026)(14060799003)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 14:37:11.0383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcab0208-f4a4-433b-1eac-08de0a65fea0
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10075
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

Changes in v7:
Add DRM_DISPLAY_HELPER to Kconfig

Changes in v6:
Add DRM_DISPLAY_HDMI_HELPER to Kconfig
Change "ti,mode" to "ti,retimer-mode"

Changes in v5:
Really added vcc/vdd regulator support
"oe" gpio is now "reset" (reversed logic)
devicetree enums ti,equalizer and ti,mode
Always disable HDMI_SEL (formerly "dvi-mode")

Changes in v4:
dev_err_probe, this_module, of_match_ptr
Use fallback compatible
Add vcc-supply and vdd-supply

Changes in v3:
Lower-case hex values and use defines for EYESCAN registers
Remove equalizer code (unlikely to be used)
Remove attributes (no longer useful, undocumented)
Fix build for 6.17 kernel
Use devm_drm_bridge_alloc
Sort includes and add linux/bitfield.h
Check chip type and complain on mismatch

Changes in v2:
Use atomic_enable/disable
Use #defines for bit fields in registers
Allow HDMI 2 compliance
Filter modes on clock range
Use cross-over pixel frequency instead of manual overides
Devicetree bindings according to standards

 drivers/gpu/drm/bridge/Kconfig      |  13 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c | 427 ++++++++++++++++++++++++++++
 3 files changed, 441 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfi=
g
index b9e0ca85226a..34696e5efecd 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -430,6 +430,19 @@ config DRM_TI_SN65DSI86
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
=20
+config DRM_TI_TMDS181
+        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
+	depends on OF
+	select DRM_KMS_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_DISPLAY_HDMI_HELPER
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
index 000000000000..cda2d20e4990
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-tmds181.c
@@ -0,0 +1,427 @@
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
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/display/drm_hdmi_helper.h>
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
+#define TMDS181_REG_CTRLA	0xa
+#define TMDS181_REG_CTRLB	0xb
+#define TMDS181_REG_CTRLC	0xc
+#define TMDS181_REG_EQUALIZER	0xd
+/* EYESCAN registers don't appear to deserve separate names */
+#define TMDS181_REG_EYESCAN_E	0xe
+#define TMDS181_REG_EYESCAN_F	0xf
+#define TMDS181_REG_EYESCAN_15	0x15
+#define TMDS181_REG_EYESCAN_17	0x17
+#define TMDS181_REG_EYESCAN_1F	0x1f
+#define TMDS181_REG_AUX		0x20
+
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
+};
+
+static inline struct tmds181_data *
+drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct tmds181_data, bridge);
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
+	unsigned long long rate;
+
+	rate =3D drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+
+	/* Minimum clock rate is 25MHz */
+	if (rate < 25000000)
+		return MODE_CLOCK_LOW;
+
+	/*
+	 * When in HDMI 2 mode, the clock is 1/40th of the bitrate. The limit is
+	 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
+	 */
+	if (rate > 600000000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static void tmds181_enable(struct drm_bridge *bridge, struct drm_atomic_st=
ate *state)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
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
+static void tmds181_disable(struct drm_bridge *bridge, struct drm_atomic_s=
tate *state)
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
+static const u8 tmds181_id_tmds181[8] __nonstring =3D "TMDS181 ";
+static const u8 tmds181_id_dp159[8]   __nonstring =3D "DP159   ";
+
+static int tmds181_check_id(struct tmds181_data *data, enum tmds181_chip *=
chip)
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
+		*chip =3D tmds181;
+		return 0;
+	}
+
+	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) =3D=3D 0) {
+		dev_info(&data->client->dev, "Detected: DP159\n");
+		*chip =3D dp159;
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
+	case TMDS181_REG_EYESCAN_15:
+	case TMDS181_REG_EYESCAN_17 ... TMDS181_REG_EYESCAN_1F:
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
+	.max_register =3D TMDS181_REG_AUX,
+	.volatile_reg =3D tmds181_regmap_is_volatile,
+};
+
+static const char * const tmds181_supplies[] =3D {
+	"vdd", "vcc"
+};
+
+static int tmds181_probe(struct i2c_client *client)
+{
+	struct tmds181_data *data;
+	struct gpio_desc *reset_gpio;
+	enum tmds181_chip chip;
+	const char *str;
+	int ret;
+	u32 param;
+	u8 val;
+
+	/* Check if the adapter supports the needed features */
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return -EIO;
+
+	data =3D devm_drm_bridge_alloc(&client->dev, struct tmds181_data, bridge,
+				     &tmds181_bridge_funcs);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	data->client =3D client;
+	i2c_set_clientdata(client, data);
+	data->regmap =3D devm_regmap_init_i2c(client, &tmds181_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	/* The "OE" pin acts as a reset */
+	reset_gpio =3D devm_gpiod_get_optional(&client->dev, "reset",
+					     GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio),
+				     "failed to acquire 'reset' gpio\n");
+
+	/* Enable power supplies while reset is active */
+	ret =3D devm_regulator_bulk_get_enable(&client->dev,
+					     ARRAY_SIZE(tmds181_supplies),
+					     tmds181_supplies);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable power supplies\n");
+
+	if (reset_gpio) {
+		/* Need at least 100us reset pulse */
+		usleep_range(100, 200);
+		gpiod_set_value_cansleep(reset_gpio, 0);
+	}
+
+	/* Reading the ID also provides time for the reset */
+	ret =3D tmds181_check_id(data, &chip);
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
+	if (!of_property_read_string(client->dev.of_node, "ti,retimer-mode", &str=
)) {
+		if (!strcmp(str, "source"))
+			val =3D 0;
+		else if (!strcmp(str, "sink"))
+			val =3D TMDS181_CTRLA_MODE_SINK;
+		else
+			return -EINVAL;
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_MODE_SINK, val);
+	}
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
+			   TMDS181_CTRLA_DEV_FUNC_MODE, 0);
+
+	/* Default is adaptive equalizer */
+	val =3D TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN;
+	if (!of_property_read_string(client->dev.of_node, "ti,equalizer", &str)) =
{
+		if (!strcmp(str, "disabled"))
+			val =3D 0;
+		else if (!strcmp(str, "fixed"))
+			val =3D TMDS181_CTRLA_EQ_EN;
+		else if (!strcmp(str, "adaptive"))
+			val =3D TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN;
+		else
+			return -EINVAL;
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN,
+				   val);
+	}
+
+	switch (chip) {
+	case dp159:
+		/*
+		 * Disable the "Adaptor ID block" on the DDC interface, which
+		 * could conflict with this driver.
+		 */
+		val =3D TMDS181_CTRLB_HDMI_SEL_DVI;
+		if (!of_property_read_u32(client->dev.of_node, "slew-rate",
+					  &param)) {
+			if (param > 3)
+				return dev_err_probe(&client->dev, -EINVAL,
+						     "invalid slew-rate\n");
+			/* Implement 0 =3D slow, 3 =3D fast slew rate */
+			val |=3D FIELD_PREP(TMDS181_CTRLB_SLEW_CTL, (3 - param));
+		}
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
+	/* Find next bridge in chain */
+	data->next_bridge =3D devm_drm_of_get_bridge(&client->dev, client->dev.of=
_node, 1, 0);
+	if (IS_ERR(data->next_bridge))
+		return dev_err_probe(&client->dev, PTR_ERR(data->next_bridge),
+				     "Failed to find next bridge\n");
+
+	/* Register the bridge. */
+	data->bridge.of_node =3D client->dev.of_node;
+
+	return devm_drm_bridge_add(&client->dev, &data->bridge);
+}
+
+static const struct i2c_device_id tmds181_id[] =3D {
+	{ "tmds181", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tmds181_id);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id tmds181_of_match[] =3D {
+	{ .compatible =3D "ti,tmds181", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tmds181_of_match);
+#endif
+
+static struct i2c_driver tmds181_driver =3D {
+	.driver =3D {
+		.name	=3D "tmds181",
+		.of_match_table =3D tmds181_of_match,
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
