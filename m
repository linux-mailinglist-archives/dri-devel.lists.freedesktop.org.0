Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D31B9117C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D9610E452;
	Mon, 22 Sep 2025 12:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="vW7L8SYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021113.outbound.protection.outlook.com [52.101.70.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA11D10E45B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 12:19:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klT1fApj3TsxTRzvN+EYsTAFEL1i7XhAjK5Xy+zvf90xUSLFdpji0bpRX1nwAkGlPTEgkfPG5RXiD+fhyJ5KOCybouoajLELiDC/Y7JgVTXNKss6SwTxGW0du/rbvM0Q3mRLzkzbUDvRiV5KK8WZJG54wT8vNk7fQw9tOZYlCdEaZ7sQ0r/EhGe5QA/bCIUVKcd1elbBn9p4qyGPJX6sSYThf0owEM7HdEu/84k248YrRj4yTsXp90hyOYeAZTWBQP57kLxiU+iXV013fn5R9O+pDHUG4sX4t4EIxzAT6cramNStCKZXRhJXRK/xKaCT81PNJESQIWzpYW5013Ya0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OP9HZchA+ZgNUDnBUKoC3gdue3U24OGWKgFDLRodIk=;
 b=bVKgOS1efcDKJTXuq/Sa6ZPRT1Aeapzy1evojk4vW4omi18Q22l295EMHiT2dSZopG0rbrACgyNJ5WH6cUBBLlLiPpaGXmieblOi4w0HVEIG+7ehZMdQE0lesSXiH6RTVROZn9rSEzOjpyEVE5dHpVLdjKQ9KOM2wHyEyhfAHljJ27kxCUBa4crQuurzrN5oL1WKPP22vO5DqbkyofHlrko3NnuugA/SoBiyfvFoDvfUjiZeSnR8mcwiaFbXsbuXpYv2jAIAOjdrWvwgI8NbMxIn7SXOV6J+cp1um92itOewQScB6b/ctqMMRseOLRe/gm4LzEszyjFY2AVn2UWu1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OP9HZchA+ZgNUDnBUKoC3gdue3U24OGWKgFDLRodIk=;
 b=vW7L8SYIRDqZNeCdXco6qtos4rONkzgQC8JJUm6WxtnWmuxCrYSfwz2MR+fMwjc8Yo2QsJ3bTB5QUiA9+bwwELBudyxmVzdm4kTJeyrrNRT6YUUG6hjSk9VS6KZiuhEmYOuZ1YrPL9P4LT334bKpx+Zwh7bOkO0/xDoAwGjn4ttFbV9sqHL7xFAr+9whGlnpcPgpTymvNOTtCFuXNoix+hEaQpL0bO3SH0KR7eoqYC6vZ2DUI+XffhYQEmEr8Vrx7xyIBm8jUr2iFhaXN72qWG5KHEfjTo/UZQXNihYPRKJflLGqdYzMQ/D1FCDpVVRQ7Pqx2k11Q0zmel+T+KLdDw==
Received: from AM8P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::8)
 by VI0PR04MB10589.eurprd04.prod.outlook.com (2603:10a6:800:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 12:19:17 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::b6) by AM8P191CA0003.outlook.office365.com
 (2603:10a6:20b:21a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 12:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 12:19:16 +0000
Received: from DUZPR08CU001.outbound.protection.outlook.com (40.93.64.71) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 22 Sep 2025 12:19:16 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GV1PR04MB10560.eurprd04.prod.outlook.com (2603:10a6:150:203::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 12:19:09 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 12:19:09 +0000
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
Subject: [PATCH v6 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
Date: Mon, 22 Sep 2025 14:18:44 +0200
Message-ID: <20250922121902.88664-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922121902.88664-1-mike.looijmans@topic.nl>
References: <20250922121902.88664-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.0c2f242e-bdcc-4862-a215-2a988591f8cc@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::6) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GV1PR04MB10560:EE_|AMS0EPF0000019E:EE_|VI0PR04MB10589:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6d2430-deb9-481e-4c55-08ddf9d23ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?QCRRO1UxyLDY3UNX6jc6ILHHuI7EmYFEtGUsIYWs9k1rmNj7pAgk7pdVzcAX?=
 =?us-ascii?Q?e+67FYY5TXv4vlw6B57ay+aFHRUgSEzmzG84RslLFYSBP1n6C3RSjhs4dNAF?=
 =?us-ascii?Q?loXhkPXvX9i3yih0/YGNAKo92wqoUztSx36ddmBNATevVzn6rT0D1/VrEtVw?=
 =?us-ascii?Q?u4jWHFjkZ3xCAziRo0jbYS4pnlAgJ+8S8YJ4zkrjXeWWeOkBM4T/sM4r6cQ0?=
 =?us-ascii?Q?9z/NWlHZjZChqCHGIJZcAseEMiYCDFqp7VzNsDQz9I+Atu30pg2aWTc9xi+B?=
 =?us-ascii?Q?JTJaK0LEiJ0BxCvBxd/D7l1vUoI6iY6r9E+UPISbHFUfAKXHWX6WcRSqkLF7?=
 =?us-ascii?Q?WJWHcfVp9JfQJ5CBf7agKAQXsRU4taNN2E/z4hk94KTRvP5dpXUiKlHXV8z4?=
 =?us-ascii?Q?ZjXzOHpv+sdTjMXmIBJxOz7npSGqtrZZgyTF1j/nHkGXWutE/u5FojolE0VN?=
 =?us-ascii?Q?RqH5lK9O31qNIThOt7QHHryn7SgvF5R8hZjpxQ+tFr5cQbful/GXJh61PylW?=
 =?us-ascii?Q?aHV9Kfu8M6eCl6eO8j4F8a/CCx7q6BpxriFIBzMaY+hpkYSg3mP0W32fUSTb?=
 =?us-ascii?Q?q9sPGYz4p3k7ghblpFyJZfpxlXKNk3O1XDmo3oJIfb9ajo2/J7TxRrCqa94I?=
 =?us-ascii?Q?ptt7GGzidP9Zi08evvz0egKpDrsM7NNj05nEHg8xC7Ye1VUCGY9qA5mVZvEN?=
 =?us-ascii?Q?qvTUxr/7RNMqPLfOaTT3pk9BjRhFrAdbpANpRZQu3NsJvZEZY+nLjQzu8XyW?=
 =?us-ascii?Q?IIOCHFoGIUZhnGiGZnm93mbEEnHPLK28MssCvR7dt6fsg8C5DcgVSSCbetZy?=
 =?us-ascii?Q?KhhQiMBjQS+hKIIFJpiLiC4D8wBbQSdoEPflZMv3xxCITHUBI0lKUliwJh84?=
 =?us-ascii?Q?ZCpfmRtqK/3zsh7MlYUx8NwUxYNkqdM+qTsmyH0+yPt9hZsJN9WFWpFXHwV2?=
 =?us-ascii?Q?lV19mL6jNML3oDCmwlwLddd+1fKdnMUlhDPeeg5lwo1lXeWE943m3pumDClV?=
 =?us-ascii?Q?SRXMuCnI14ZBwnuGJIcCHS1jy660cVnRGuftYMm4U8sHPmOGeJiygM6KR1EC?=
 =?us-ascii?Q?HAhg4wemc2eFQimn0iLr1gh3sEOGtX6UX5IZhmWzgYq0gl6CvfsHAFob7IvQ?=
 =?us-ascii?Q?RU9OGrNrxwcYqd6ux1igdIdvR/dVBPezQIa1PSw5KVXAniVbxtD8hdfoAjlx?=
 =?us-ascii?Q?kNB7FpwUFfcQqG0Fp186kdW7iQT23lSw2H2cGKHSMjPBj0WzhPre3HQjMK1z?=
 =?us-ascii?Q?pu06DWfjXqxOZAOUaNhEHdOsBu/T9S4LHoKmykQImD9cYiTG5BFaidY0ax3w?=
 =?us-ascii?Q?LWUOud5h3VPqrGwE/XzFnLq5dV/2exZ22wuQDJbtaz4BlgoS2qpp0aGjtT2n?=
 =?us-ascii?Q?PEp05kVb1Tfw2AUQtFnvKFsLb21IS+hf5FKf0PKxhRRBAcbQBmcSFChhf9W1?=
 =?us-ascii?Q?JxdTL7xR0l0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10560
X-CodeTwo-MessageID: b3e4fd7c-ae25-4605-a2c4-2ad9683ce60f.20250922121916@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e4135cb5-23ae-4ff0-df94-08ddf9d23b18
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xVc9KoNhfCNqlKrNnghz1SlgQXJwLvolY3IUIuBwHpMbIPhbm9FFhco8/8xQ?=
 =?us-ascii?Q?bxnyTIF5oD6A3xTNlyxN46TRmyP6D2NKukp0ZOhOMph4PN4jM/VRFA8ou4OZ?=
 =?us-ascii?Q?KfDsyCFnMpxPI/KBrGm8IzJpn2E2lKJyTvizQmRhYzRn9ZOOytTnDnlQ+5h3?=
 =?us-ascii?Q?E8vNd7IYZeQ69YHj2BN2z/prclK9+rZpRRKf2PS3fH/lEmHIe6LGR2ZdMdJB?=
 =?us-ascii?Q?ixRWbD9PREGsKfzj70DLhXJX0GgmkMHwTd/InPqOQdPmW8ytIerwaApQrRx+?=
 =?us-ascii?Q?9Hl03T2cEv/Jzdfvj9+ZbziQzwfBFIxJrfmx9R+gEbNvlpLacYpLpZ+BEnhh?=
 =?us-ascii?Q?mvPNgI3ZyL47J2c+a3Cqu6pjfYlzmK9VXHmfP4e54n6EL9zfaB1E2R4M92Y7?=
 =?us-ascii?Q?iWtUsyhk5OC9sRcO5iGTFxQJF20/9ZfQIwY+R3YzBNLK4GXXI0angUVxxoXg?=
 =?us-ascii?Q?IgLV1D6zrNp011ekEdHaFCuJ/6ZFKXIDQeH3RP69ciHRDUGECoav4DnmjFIE?=
 =?us-ascii?Q?0qK+EVxzv2wwLPllifCVbZZjDzHPU9nXdCFsyoiwLVjUo8lnEG+fL1D9SIbn?=
 =?us-ascii?Q?cskHkV3FsUsWq32u168jXrhMMjhv6bDVXZ+tjBqhjeKT8UNg7MCpwqRk7zUg?=
 =?us-ascii?Q?baQmHuwY1eMDuNGeVrnCTY9eoEp9+2Ucueaj+LA2getIaPWHVraPBOFqW0yT?=
 =?us-ascii?Q?a4fffe5+hTMHz+h194K7SXANH2ePgGK5pt2ZKUw0gK62REMbhKD3Wn1Q5vXB?=
 =?us-ascii?Q?0qXGspROz0o5xxoTuXz66p3nkAyw/SGtp7wMt9yBWM2VuKXUF8oRlFx5t6WC?=
 =?us-ascii?Q?+MGN/0buWpmldIh09E/46gSMydf5yxNVvOUkG46Zh6S61E0FMo4N8O1Z+pAE?=
 =?us-ascii?Q?aTxE0NRSflfiC+MBfJplvKYjdK8Wcp5PpkGAzTyIqQGyc4T8MAJSphNpBKg+?=
 =?us-ascii?Q?qyn1QpYMwY6XAfEIbVYu52iKBUjwXGzgXJQMG/4wDxYxujq1q37EFQq4OIRS?=
 =?us-ascii?Q?8F29IrAtzMBmkwZo9LiDHZvVOWD0ThxG8i8H1/fUc3cCNdS1bej65mlEcu1N?=
 =?us-ascii?Q?MCInbuAXbdNnnlcUwDTWSTONPfDv7pYZSYTgTh406MSZjiPEtH+8sXoAta1U?=
 =?us-ascii?Q?UILJoMb6d7Bewyy8xM18mBg1YIjQnHDMWwpXGne5tWUVz3J52SFasQdFoNcW?=
 =?us-ascii?Q?8iPn97VJyywYz5nqg0OX8QhU083ITyt1a4M+1LkhIb0564Nnoyu5OcK29XN/?=
 =?us-ascii?Q?0DotAKhp8e0qYbSYygLaKd4vVrKZ1HA+HiYRCPRUpjVGblC0F2dJysY60Kwg?=
 =?us-ascii?Q?G9vkyNFMJRZvzzU8U9n5A6LS0HiZ6T6KxTy/ak4xra7HqDXCrX0sYEi+KZ0j?=
 =?us-ascii?Q?BjtQOpdZemR+itNT5/1G3YHkfBCUKzG6yPBrdgiaVABs9pC8+S6BNHRBp8O/?=
 =?us-ascii?Q?HXRR2YHqUDjitify1WssY8xHmmE3dGdNoZCQMFNrUcBWx35VpqWrSw=3D=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(35042699022)(14060799003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 12:19:16.7422 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6d2430-deb9-481e-4c55-08ddf9d23ff6
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10589
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

Changes in v6:
Rename ti,mode to ti,retimer-mode

Changes in v5:
ti,equalizer and ti,mode changed to enum
Rename ti,slew-rate to slew-rate
Make properties conditional for DP159/TMDS181
Remove ti,dvi-mode (always set to avoid conflict)

Changes in v4:
Use fallback compatible

Changes in v3:
Fix duplicate links
Add vcc-supply and vdd-supply
Fix missing type for ti,slew-rate

Changes in v2:
Document driver specific bindings like slew-rate and threshold

 .../bindings/display/bridge/ti,tmds181.yaml   | 170 ++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181.ya=
ml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
new file mode 100644
index 000000000000..9b23221634bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
@@ -0,0 +1,170 @@
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
+  When I2C control is enabled, various pin strapping options like equalize=
r and
+  slew-rate are unavailable. These can be configured through I2C using the
+  properties defined here.
+  A common application for these chips is to convert AC coupled serdes out=
puts
+  from an FPGA or SoC into HDMI compliant signals.
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
+  reset-gpios:
+    maxItems: 1
+    description: GPIO specifier for OE pin which acts as active low reset.
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
+  ti,retimer-mode:
+    enum:
+      - source
+      - sink
+    description:
+      Force chip to operate in "source" or "sink" mode.
+
+  ti,retimer-threshold-hz:
+    minimum: 25000000
+    maximum: 600000000
+    default: 200000000
+    description:
+      Cross-over point. Up until this pixel clock frequency the chip remai=
ns in
+      the low-power redriver mode. Above the threshold the chip should ope=
rate
+      in retimer mode.
+
+  slew-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 3
+    description: Set slew rate, 0 is slowest, 3 is fastest.
+
+  ti,equalizer:
+    enum:
+      - adaptive
+      - disabled
+      - fixed
+    default: adaptive
+    description: Configure the equalizer
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,sn65dp159
+
+then:
+  properties:
+    ti,retimer-mode:
+      default: source
+
+else:
+  properties:
+    ti,retimer-mode:
+      default: sink
+    slew-rate: false
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
+            vdd-supply =3D <&vcc_1v1_reg>;
+            vcc-supply =3D <&vcc_3v3_reg>;
+            reset-gpios =3D <&gpio2 1 GPIO_ACTIVE_LOW>;
+            slew-rate =3D <2>;
+            ti,retimer-threshold-hz =3D <350000000>;
+            ti,retimer-mode =3D "source";
+            ti,equalizer =3D "disabled";
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
