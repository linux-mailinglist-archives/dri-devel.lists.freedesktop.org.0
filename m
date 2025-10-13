Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4BCBD397B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E497810E48F;
	Mon, 13 Oct 2025 14:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="muJO2YD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021119.outbound.protection.outlook.com
 [52.101.65.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426E110E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0GPl07CVINhP+GrF5320XwJKATmtlCfjzVUrt28I65te7Ipi4/KxWzv3UqDsg3XMXqcdH7YQLN7PRGP0YCwVwdnPa4fjp3UILLNx3MGCc2BuHMphSGp5NPjsOIhdHYB7WB+MCOY+W7z6kTtPxV2jJUPRAMl9eLyy2mPnAorv9SQmciGr2aDzIB4i81OYVp5pDyJfoaAnNh7Fjiej9YRr5a8R/PxLi0XDvPfsIA+JriFaTs1BlcB+Og3RzJPAoRcVMBzVR0z0zRusbhZL88iHjC9YvMVVEC55VmcC7yuuojPzECkGKlVfRLcrtUSznA80J9m80Eck0kO/OxcM8rxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoH7rEqkfMgvYHIbRXaXJ3OakwA/k683+EYu6LAstYs=;
 b=Gg8MFicKbpm5R3SrqKFaktvk5MbQUdAA40lx+FW58YFGwzuL/1nGd7hpCjBx2mXrbteWPXAFS1LcV1sFSVdWL1eI1M7EHNAYuRtS4LkxwGEYgy97cAwrkQwQtei1/iriFzU7wT9kLgc50WAfPsvbdSkzcDz0UqxD0di+Fah01irq7J1A3r8XatkxTpRIZimeWw9GsgQLEUEh8COBJ6A2r5ceslysZs9lKFNpD/MqLox2i22W4AU90BLrMVNs/HIg6WBudLApQX627qB+DXdJbev1OK9oH5ml+Tqg3cZXHeHMtuP86nDJTzP78IadCMGisFRs/4saq4g2RnWAQklbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoH7rEqkfMgvYHIbRXaXJ3OakwA/k683+EYu6LAstYs=;
 b=muJO2YD+69PZpc8Jj/Gjq+AjAXFG6mbNRy1P5LnGETIDZckWtcBlObRPZ/iMbUa0Fq7D0Dnj6Hh7XsYKOnyNHUK8AcrpU6oYWxvOAfJOD2fpBN0q061BdT50BdzPD8JrUNuwPjyHkH2MfPq1J37DMCXtvee27i2XSIAgdHFKaxKwT4uRRTkoMOpGNE20+CPEpJg3pA/6hiA5NShsABwlGKQhnJyb8PP0uH6aDGJ/LI0qq1SNgAa5BISEfB9mFOp59EBotZ7xnnePJhxITNuZZ+B5/6FkdSoM3FJnwz9qg9zsmSJaSV889IJYkB6ZhdtEx1iuMtOyq/vn2SWRdqovkg==
Received: from DU7P194CA0030.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::21)
 by DB8PR04MB6826.eurprd04.prod.outlook.com (2603:10a6:10:11d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 14:37:12 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::d3) by DU7P194CA0030.outlook.office365.com
 (2603:10a6:10:553::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.11 via Frontend Transport; Mon,
 13 Oct 2025 14:37:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
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
CC: Mike Looijmans <mike.looijmans@topic.nl>, Rob Herring <robh@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
Date: Mon, 13 Oct 2025 16:36:49 +0200
Message-ID: <20251013143658.25243-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143658.25243-1-mike.looijmans@topic.nl>
References: <20251013143658.25243-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.a4ff037a-0de3-4531-a2a7-8d13aa9ee036@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM8P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::7) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GV1PR04MB10195:EE_|DU2PEPF0001E9C0:EE_|DB8PR04MB6826:EE_
X-MS-Office365-Filtering-Correlation-Id: 3922b3b9-5d47-47d9-0721-08de0a65fefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?5oVRxyQ1kM1GBDaySz7w8t8ApO9fBa+j5xMpRC5tpQecx7Dgwit6U4BLnYSs?=
 =?us-ascii?Q?5Y7fH84SnKEUM9F6KNeBtVLAMeCSTvEJxrTY2e9L4/qi5m+GmjTyd00Fjxce?=
 =?us-ascii?Q?McOdhlNA0i3TJVsC6i5X9FApTgTF4NxIEMdS5SwMUe7uRbjc7yNqp2dR2Vlr?=
 =?us-ascii?Q?epA/OIM3ZHoLbsym/RR7Chvq27fDjXIqFTn+og2bWGDFxwqi43HIPtIaCuwZ?=
 =?us-ascii?Q?Hd+XMJkIpxcbVjWweXDhqf81D/aw4Vo9up0vP9mZ879fD4LC+wJ/DFgVb3jC?=
 =?us-ascii?Q?Ye+DBjU5c/buBXez7HIzWCh1tmNt7RFK6yG61ZM5uekyoWwJIYRuYvWU2GIq?=
 =?us-ascii?Q?LkN9x/7wcM61c/Bd2We+0Jtui22S4fnyjDQBcODxiTK9QjFUDFFvP5AjNB8a?=
 =?us-ascii?Q?JSKVa0ug0xuIEC17EOXSIUnjmqkbPDCirZaJv8sOYAK9HasDlQjt37pELT2S?=
 =?us-ascii?Q?oNwMUHgxwPpvm129YZ9vEA0I2Yv/te3zyz1xynN3/iE+ZwA2ycSsrt1vvvmF?=
 =?us-ascii?Q?yidx1PNOMIyiEn1iLmze+49vUYh87BfQy0E7A53cvhd648Of5Ymb4bed+8AG?=
 =?us-ascii?Q?CVwwYYR1WyttxBzSnMOSuga6+7VaHYQaKP6mWjOnf1jK0WCH6sqbIMlk3/hJ?=
 =?us-ascii?Q?H8Oy+dNJXXxraDOuQGBsxN5oLvsz7qbhOgYWMul4KmvhlIscgijJHsWoER5Z?=
 =?us-ascii?Q?a3E4Wj9sSyqptPo92xKnaQW1GkjkBtfJ9Mr23Ojxm7uofM3h3180h7tCp/aY?=
 =?us-ascii?Q?4A+Wa/sG2hLX4CAIrQAOTinzwcdRimPNT9zlrK7+ApbrCVJVb7NmZnYGUlJM?=
 =?us-ascii?Q?kzXpwAoEt92iB0inUSOWtssRV6HkEQpaCJRB5BbgvexE7GPRgeqgiHyrb2ZV?=
 =?us-ascii?Q?kHycuwAhZbwa/ilFTMRzOd4tBpCLsaau5ud1xg97BM7BRobIYtPI5y7epANb?=
 =?us-ascii?Q?x51yl7dprKPXhKGZQi5id8Crp2y8y7OsLoYPlQ3xi18O/nHcu9WifZlur2PO?=
 =?us-ascii?Q?j1gJPZG86fZWDCTLF99FuInQaM8KYoPDdnt1Ikv+ceYKyTUIoD5UyiVpKE2T?=
 =?us-ascii?Q?4M8dRMd6N/Dh6ViLrc7FUjqatOp7mMUzs7cjykebKFWYj1qOJTx854kz+cWK?=
 =?us-ascii?Q?jfTMzUvvdSzjGlaY5CISkx83ziD/US4120lBv3iuB/8pDhNGR1ZuqAk8KRbX?=
 =?us-ascii?Q?RLyIsqHgCTGilg94VTUwBQMxuxObJF3gImg8G+GG+tX5wqTIeGg4TriXlbPL?=
 =?us-ascii?Q?PoD7PkVPs47y9oJ+ZdNo2Z0hI9tZm4QnZyqCXsGh81m0S0iNBlId5HrDuMj3?=
 =?us-ascii?Q?EdrkYIj5n3ZaO7XS4M5FbEWH+uqqwlrhRo1OccbXdFg5PglCKGPZNnPKa8rw?=
 =?us-ascii?Q?uhIEV7MeCo5UhWBOMOhxee+pphi+Zpu+NTRvx6XNPl8KjugMpT66055rb0BY?=
 =?us-ascii?Q?qK+IFsd7paZyTnk3p4lfoywSsfZW8eXRilfwAPVEGhOuBWFApLJdXQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10195
X-CodeTwo-MessageID: 3ab7ec44-5ac4-45de-a389-2b998c1dd8a5.20251013143710@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cbd11c2b-3bc2-44e5-005d-08de0a65facd
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LuEXCK5hoFXa4Du/Xoy9RJGfMLZG8obFkIthnHGT5anjsDpGxxI0cz0vZjmA?=
 =?us-ascii?Q?P0hMCATd2OC1DssN6eVC/TtGlqSLDaZrVAp2uUInlVBfiAxqvz72DY90c7KL?=
 =?us-ascii?Q?eiBUdNpbRNDzo79S+zlnrWjLkHymJ4KcPwywXVdAXhQfR7ogkU2cGx6uq6CO?=
 =?us-ascii?Q?fKmkkhfeHEsIOH636bH1dEDdZ2+h4ONICdFr30c6HFsO+8pF6ECMHFTJRZ5m?=
 =?us-ascii?Q?ThJ6THWyVK3Hz1WhJZTmuCz6zntAOwGKgW/GXVofE9dkiNtgCCMvV7pyCnVY?=
 =?us-ascii?Q?UQBeLfa3GH1TjTkqJ5b6X1cJMzGRNQbfcktJP7q57VyHbzghG9O/jbYdShCM?=
 =?us-ascii?Q?8nGbumwW7SwGQZukiB4JokQWGyZY0X7a0mfYqD0M2PwNCrB4jYnsHS5Zdi19?=
 =?us-ascii?Q?J6cWiccuquL1JxmsfXEJz5h5R9RdOPEURS8gVjictAeSu9AkN7WmaHBI1bu/?=
 =?us-ascii?Q?dpw9b6akgrga6Izdg2LF3gQhxJlN9CtsLangJ/e7gZoWFXf5TSbidY3XGorz?=
 =?us-ascii?Q?1qc9SA+vF+6Uzp17MFqOZe1jzH3uEh7MX+ojKOrigcH607fi0VxSAj1PYvs6?=
 =?us-ascii?Q?Ko+EGf1DpkcYrn94sRTra2ENbN4SqnjA2+Ct6ICTW7mXm79qmR9U8dLwYuJH?=
 =?us-ascii?Q?IjxhMejO99DOYnqAtc5R+2r/HPtTlphvdYNY7R7rTgEZ6mDwXiZmYKQmZ97L?=
 =?us-ascii?Q?NOHnZBqxdxoBr5DZO7GbX2Jo2BCoEIQEfp92RkQr4Ljsj0Jcf3FHfJmc7XMW?=
 =?us-ascii?Q?xSXdcLQBogI1OPEuzl9QZBGlCemQiR3sXNYHcQUuAgkLYt1UVwO5ZmrW49gW?=
 =?us-ascii?Q?GFxrxvcPUu7O2ar/407PKDJffLXb0sk7cJXQN8KwCqPYSp+8uAq1IxyAVKqx?=
 =?us-ascii?Q?7LJyF4tXyK2TWexDbML2XmqmNTF1vmYP3A7g+5yPS3JMvdBDn490lbqGmr/o?=
 =?us-ascii?Q?wghMv6WFZpJ2ii10J2hdoOUReMBO0mJXnHrqf24du7V2hNjB+JkEETopTm/G?=
 =?us-ascii?Q?g92oOu5HC+hdttnmtBzXwy9esh+W7I69JUXpspJg/tRe2msLltHl7M3473+t?=
 =?us-ascii?Q?vV20yNNSNbS1ej6Pr2iv1zKrI4L8eyxKp8qcJ9mF5QwdNkTfKEh7fn+NjiOa?=
 =?us-ascii?Q?m3zzTyssEtGH0608NnxlUxnZE6UtrL304rT2nxIxoU16iKwzQGO8yxo5TWDh?=
 =?us-ascii?Q?h/euMRhCnhbxXQORXHmqN+7BgtZfpFv/SqKzz24oNUdsW9rYQ3fx9tYBWPcV?=
 =?us-ascii?Q?ME+NG4pDoHT1BojSzZI/uSYM8grJCm04nf8q2D7JYe+GTI2pRQDzyV7uL931?=
 =?us-ascii?Q?69cx8tAj3ljTJTj2oHZ44nfddibphCkLf5QOnsobm00YYTD+6l/vmw0dw8cj?=
 =?us-ascii?Q?+YG9FQt/2e/aae+SWKQF8R7lXb5inbCPJFI5j2MgW4JDDKKxU1N1Pj4zMbhY?=
 =?us-ascii?Q?YeziPqmMvQlMCSA1DimyH432pOXRBUEOB4jhHjLqNdBh0SURBH0EnFw4wujQ?=
 =?us-ascii?Q?gS9Nxt4nTiNBS2c=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(7416014)(36860700013)(1800799024);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 14:37:11.6258 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3922b3b9-5d47-47d9-0721-08de0a65fefe
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6826
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

---

(no changes since v6)

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
