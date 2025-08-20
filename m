Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98805B2DFB5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E2F10E76E;
	Wed, 20 Aug 2025 14:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="CvSjwcjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023072.outbound.protection.outlook.com
 [52.101.83.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDB510E774
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d90OtgZe6TgXOXjFAug9EVN6xi5di9WqwxXBnEFBEQa5Dty2BAmaQKdKIgaqBZxnBnuD2FAWwNP+mTK68r8WM7jbbIq2UUfDrozwdbtARXv8aWpJSyBKN6AkEug/8THcEmTIxjs38imETzUHiRWvEGuvperWutNz/DQyYcu8Wv3KlTh7FYN/qbgxyu0TFMyOe2w+je7xeQIifSPFKRxQMvAE1uSFf0G5XsAZ3zKd4BEQ4FHxoiu4DpX4YLebwu0ivgr+zQtYh53BxsO7/ZmzzeP0nnZ/vuzzKAcT9nx3zKiDmKdRKBuK6/21QT0g8OoM7H7MC3A51hMPrjMhMu60TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBEDP/VFFWXTL4JZUDPQn1FhKRGXnBrsPw+Oq1j2hLk=;
 b=ulpteLcwCHi3XAKLVdFpe7bOLgWItCcwpKK0uGnSELHlVIzlEN2HcXQWzE31si4bmYpx6qpAUsXqihT7yi9A89trDBYqQxF5lNvSRQQ57q2hNnKEUjjVz8I4SQMf8vzS9Rwb4BPh5+d9ZLRL5FrczE3Akmq7bvRJzvdqJTFSZIalmjPQch0kYoaENuVBq6KSHI4Iy/YBPV1//PZl1drVAo5KKRjHiKQ4x1vtMi0qim5JRn1ShckXwsR+YP3HWZ5eyI84oYgw8ILOI2clk49+oARUpN+OCB3tXxL7TDrmWv30v/2BJAht3X8nAxPjLQIR+wnj5JuMyFfDyeMmtfHHvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBEDP/VFFWXTL4JZUDPQn1FhKRGXnBrsPw+Oq1j2hLk=;
 b=CvSjwcjPETLFqCeR4F7zyTPIEhW5+kMG/+i/6kgiABAJ3T87UxYDpe5T4PYU3FijbScYjqcI5ckY5I6jRFEeO+q783LcjkjKPf9PVoH4LV0j5hBlQVSz3X4lRVNRUpQxtwrpO7/f7jUXaFE3GNjBGemYnKQlaUutU6Cv1aoX+h/wQFCKuvFEWlzRezgZbSWUZX80gPJQpTa79p4Yy+vgWt517H7Vwez+Pm51B6El5OU51EzIUelnvhVKkNnD7jVTV9kbe5Vr5TuZiUwk3cTRcduJEwbtcqW7Lh3zh1wgXqthe9ufcr1sFXPQ0h7hXnbAHG9IagUZDEXvqYXzFQcevQ==
Received: from AS4P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::11)
 by DB9PR04MB9867.eurprd04.prod.outlook.com (2603:10a6:10:4c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 14:41:38 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::c3) by AS4P192CA0016.outlook.office365.com
 (2603:10a6:20b:5e1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 14:41:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.0 via Frontend Transport; Wed, 20 Aug 2025 14:41:38 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com (40.93.64.4) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Wed, 20 Aug 2025 14:41:38 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PAXPR04MB9006.eurprd04.prod.outlook.com (2603:10a6:102:20e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 14:41:35 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 14:41:35 +0000
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
Subject: [PATCH v3 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Wed, 20 Aug 2025 16:40:35 +0200
Message-ID: <20250820144128.17603-3-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820144128.17603-1-mike.looijmans@topic.nl>
References: <20250820144128.17603-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.51b271ba-97e3-4830-97f9-7b6b4e0d202f@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0118.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::35) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PAXPR04MB9006:EE_|AM4PEPF00025F95:EE_|DB9PR04MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5f5a9e-99bf-4b6d-0719-08dddff7abb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?w9X39tAhH6P6JEW6xPGfH3IG38jXetaR6zB3MvipqHQwbiYGVu+UdqaPKC3k?=
 =?us-ascii?Q?SvUROfSZ1/PI8kDpuWquhmXj4xFt6fZoh0RQMkfXszExNfMdsWENUe/R4hYk?=
 =?us-ascii?Q?4Z3LyMvlFtyUHl0/LCUOSIhJn0lFYj53PrzXBoBjj+1TX2Z9JHeqCBNF1WqT?=
 =?us-ascii?Q?wjQ9rVb8F0pRlSWFdSMFT+UrlcFJzDpOSxMMJQcgxaM89F/9RXsEYM/3ms8k?=
 =?us-ascii?Q?OmgnUZ7bnZ3QNCsbB+9BdVZ9zzrzgP4J19xe2pNR8g3/5Xu7ITvADpiDEM35?=
 =?us-ascii?Q?+NJlreSOL20vDUE/oYRLDHDPez96/9Sxp5VQErgV/mGzfD/Fj9WSx1Lc9Tkg?=
 =?us-ascii?Q?1W+ubjBSvkkd8vHV7Ba7rUEjTLVwsRKcoA5G51kcm0kq5mM4fTHT3lVqN8k/?=
 =?us-ascii?Q?ON4mzufdKTI7eDrY1D4TepLTqf+LmF0Pcz2kHQIcvM96l/jwttM+GvRQ5dHj?=
 =?us-ascii?Q?D1sXeeGedWxq4NERxf9IDfu5+F13b+n/YI7J2bG0ykNHPb6T8lieWSQbxTWK?=
 =?us-ascii?Q?6tXOFNda1ZKHNGkspLL4PkvGBp1jqqxZ8ofIh1uRhQDu7CbCu2DCypqmTmCe?=
 =?us-ascii?Q?EUALaX0NDfjw3hfsDJLMpeoghXh+z+AOK9ADXOXZZTUJCTJM2NzZDbmO+V5v?=
 =?us-ascii?Q?F9SsDmrWeH0qgNq6IcyndZEgoVBmd3V+YhTJPHlEVXI4ZDlFzYhbOMWD/Mt1?=
 =?us-ascii?Q?8CLVBz2FMBnbDqHFOw3PHOQw3raxl/Ew5NGW4If12dfzN93WjZQXVhVL2Lf3?=
 =?us-ascii?Q?Y7IdpggvIXXXUaJ/O92/ZBLGat9k/eOT7Suu2tv4qEL+EvstQe0dIEd0BhBS?=
 =?us-ascii?Q?m3vxZzv0syH65MSUySmzRPAsuiwxHOlbdM/KuFqItKUDCRJ7L+uIA9u01LsM?=
 =?us-ascii?Q?w2XH3hMKuF5YWW37rBwCv6GUNCJugXqIM4PqBQ/qMH1a1zEHLXtF97tBmoRy?=
 =?us-ascii?Q?4b5mk6DSz+Yz6bv1zzgG12mJ447e/deSJ5a2KbSpyRMS73N4rdTK6YgAglqy?=
 =?us-ascii?Q?uj9Cdh7NH69U48WWyo9/I/+Y7/gC1IZeThBmcm7iukABhXfTUNSXmVIuynsE?=
 =?us-ascii?Q?YsBYPZQV2x1PyHPDK4qXQJL9JM0YUqn00X6NSGDGzUOWVL8bvAMlqIEIbLkB?=
 =?us-ascii?Q?WRIdI+Qj02ERl3kXIKMcKdwZeoQKhxjPzrjfHz1+4bLuy7d+3PGjtlSxX4Nr?=
 =?us-ascii?Q?nDZulkc/QLPWvLDTc1zoahLCL3v/iLN+7oGAmeFxG/+BP1UaqInBlXIpvHSD?=
 =?us-ascii?Q?BDYnWS+f0+yownW0DzBODjf5eyAKLUEvkHe9RrJc7r+TuoHCZXvvHtk1+nRg?=
 =?us-ascii?Q?r27M4N52cDtB9gw5YFaMq+AYyfJU5EE2hCr+Qqz1OjskHcDLtoa1MfVDdeiY?=
 =?us-ascii?Q?EIAolly1iTmUDADVkyyl0aPnEXWth+GTw8X+JeVs3wmEU6wzvruLSIT49Zj1?=
 =?us-ascii?Q?pm0bw9LBHEA=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9006
X-CodeTwo-MessageID: 49a5e00f-dfe4-49ac-b623-dfd534a98434.20250820144138@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 928dc9bc-d7e2-425d-86fb-08dddff7a9b0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|1800799024|14060799003|35042699022|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+GhMLZeEr9/uWfWCCI1hRZkeplBrAIyYZ9QEL7K+DT8UoeSGVQPiWSCsiIOl?=
 =?us-ascii?Q?Z/LJjGl39feXroh9v8qUPAQayHUx4dojKXgVNUHPKcyRG4zDnCeeVUERugfc?=
 =?us-ascii?Q?IAUEOzCCm8Bglg2kGMASOfHqP9cAsa6p6+DrCPE4AGqy/dRhYgaz100dsUW3?=
 =?us-ascii?Q?igmHEAQO0wAx6y84zd1brVp4jupRcLkL5I+YJIqh2doPut1laWoDr8fdqAGO?=
 =?us-ascii?Q?6t3jm2aS3NEDqJ4gmmetLZkB/qOQqSw4Dtuw80cQ+keCDBUI03YSFd61BaMP?=
 =?us-ascii?Q?sEGqWKlZQqq6Ak7scYcSPz/GE+TEmHFH0GQeyOf8AFu2YL+P1Re5nGdapmAu?=
 =?us-ascii?Q?FF5bzBYpFWRZhDuOFnLVAHbCosroRKtra7PPBODQ/qr4mk9gBzO08K6bAcu6?=
 =?us-ascii?Q?ikURIaP/MS6DlzA9oFH6eAG+0JOTio6Gwl1j9ZFnCze/oILh+ysldXftdExh?=
 =?us-ascii?Q?hxWMlE8rNYfV7kNqKnlhTzaHq/M4Su8TP0xllmGIAHL2Gjh8xTewYYrnDwt5?=
 =?us-ascii?Q?4YPRu5pfHQwziJotCuUdpqYrqeLt9y85J9QDFcIFEXOae+ZYuk+kh5zk0fZt?=
 =?us-ascii?Q?UnS2Pa8Few3jpRkQETa1GTGfm21Sfws8Au3NhrRNcujiBTqlKCTQUWGMgysI?=
 =?us-ascii?Q?UXzY5pYuhKv3dA1Z02neP0IDsls+axpPM+F3JxeafUTGPAenb+AmRMz2TtIK?=
 =?us-ascii?Q?CK6aosgOdpSbtuP2H8+XDTBHabxWGJrq8FWH+0tuveyWbOcrBK25RBX1dMO6?=
 =?us-ascii?Q?tJPfwYTSXslp2w5D2xwjSZQwMX84b/e+i7VCSbz0DwnNaxuw0R88j2girIPM?=
 =?us-ascii?Q?zq9yqsBUiVzMR//+82g15Nqzius0cr5eM5i+usD9u2KLjWzOyjXN4PT0y3J5?=
 =?us-ascii?Q?l2VRBLr+2Zu2Npj3mxNRj6Fj8MR9Gnc9LLmS4EU/xjWTTOC4E/Y+pA4AqPrA?=
 =?us-ascii?Q?LxfgoShYXoz9SKHt7vvPfCKzxpiJ2G2kHSyEft6EDDiWOHp9Y+cYzgQ5zAsz?=
 =?us-ascii?Q?qfy7rIdDsy/HgrNshv+mDCsNlxf18heLlEG7HP3XKZoRErQEOwDYziC4vFb1?=
 =?us-ascii?Q?HaoYazASBO3lh1SgMZ1Ej5dYkvpkpwc9/P/BsmtXLPSqo4WtOUCpHOd9tkwe?=
 =?us-ascii?Q?HOZP0v4Tk6AFhM/0HKEKP6jstZgpAR9qmK19xNIhNdWJj6N536cwQW4QdLiM?=
 =?us-ascii?Q?BeUOB4VETKWPoTybCyzZmjgBO9A7KXCpgO0EJgo8gQguq4fBBPvCREvaTtSY?=
 =?us-ascii?Q?AaB1O07DQYUZG7jAI0Aap3Qbsn6Q+TfgBHZs6GZ/ttVn9uBtsWE7mOwGjq46?=
 =?us-ascii?Q?CnjJYRBCYsURpI/oJ7hJhB2gbnAT5OXfD1mlne6pHWXmRofmLNj5byjes24T?=
 =?us-ascii?Q?myDOXHAB78FqyjC1p5+Ud51J/5gUZ4ucdOuA2VwgxGS1XH843ajtzAL6CXEm?=
 =?us-ascii?Q?Y07r4F7tYEI=3D?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(14060799003)(35042699022)(82310400026)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 14:41:38.6688 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5f5a9e-99bf-4b6d-0719-08dddff7abb3
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9867
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

 drivers/gpu/drm/bridge/Kconfig      |  11 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c | 409 ++++++++++++++++++++++++++++
 3 files changed, 421 insertions(+)
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
index 000000000000..8ac3eb808d5b
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-tmds181.c
@@ -0,0 +1,409 @@
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
+#include <linux/slab.h>
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
+		if (*chip !=3D tmds181) {
+			dev_warn(&data->client->dev, "Detected: TMDS181\n");
+			*chip =3D tmds181;
+		}
+		return 0;
+	}
+
+	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) =3D=3D 0) {
+		if (*chip !=3D dp159) {
+			dev_warn(&data->client->dev, "Detected: DP159\n");
+			*chip =3D dp159;
+		}
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
+static int tmds181_probe(struct i2c_client *client)
+{
+	struct tmds181_data *data;
+	struct gpio_desc *oe_gpio;
+	enum tmds181_chip chip;
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
+	chip =3D (enum tmds181_chip)of_device_get_match_data(&client->dev);
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
+	if (of_property_read_bool(client->dev.of_node, "ti,source-mode"))
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_MODE_SINK, 0);
+	if (of_property_read_bool(client->dev.of_node, "ti,sink-mode"))
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
+	switch (chip) {
+	case dp159:
+		val =3D 0;
+		if (!of_property_read_u32(client->dev.of_node,
+					  "ti,slew-rate", &param)) {
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
+	{ "tmds181", tmds181 },
+	{ "sn65dp159", dp159 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tmds181_id);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id tmds181_of_match[] =3D {
+	{ .compatible =3D "ti,tmds181", .data =3D (void *)tmds181 },
+	{ .compatible =3D "ti,sn65dp159", .data =3D (void *)dp159 },
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
