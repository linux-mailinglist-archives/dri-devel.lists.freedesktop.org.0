Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A0E962E74
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 19:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC50910E54F;
	Wed, 28 Aug 2024 17:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ReNAqNPO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ReNAqNPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E93E10E54F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:40 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oPxHgNWI0kwsbhCqHzlrI4xIF8bBLhR8xDQQ6TYXelG9Jn3RIEPswQ1qxVZll/iF6jHl7Ao40evZjhxjtZFL6mWbMARoAJMkAxzBT7TjO/tE9iZrWfrbyDl+fZkJjdk5wT663n3LYhcCLQTISc0jcBbleTF2/EupvTJP1pwlXcviBctIELu0dI63b6Ef8/fnd74RHk3rOfmBKJaeHrixmdJy2fjR9yUF0VKqVyX5LkpJCg+HtCdKr6dqvwcdxo7Czs40D74ss24enPX/pISWXmyW00qQRzzTS1F8nUwJTqCTyBzPFHmyGZHiz0AcRhukDLUtTZI3L7C74bLfOpbdug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmd1NFhAixuB392WGGWTY8mLiA3VFQLMI4H/ONrGpqg=;
 b=XAjqMnHleOthmJGMwo1k/8DQzQrfBYZg/trcrQjN6rniAh6F+GBdRffPbRU6cioHoCDAGcIY7KicOcfXrTRCIgi7R9sMzmVu3zZqupaVK1HRLMsGnrMzlkwh2XmLUnwCCXk6WtgKZP0DGHs3PC7o4C/oAVl3ySAGWwNLKdOyGaiwzZbrnVyAEeh3Yw21uOQUuMR5XLEDEJmQO9ByG2CChyiHy9Jms6rc8Qz59kY7wp3v9RElfWoNzuGRJ91p7UAfQ6TRg02HFLABMMySewz/BR0WcBLRR8FbD6zAG0Qm4O3N1jDycR5NXyKY0/i3njFCDN1BHVKbwVzenInoI9C65A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmd1NFhAixuB392WGGWTY8mLiA3VFQLMI4H/ONrGpqg=;
 b=ReNAqNPOE7cdbb9VUK/pHTuj9qwoPp4TDxQT+7vFZV6lEX3Hz5IfIIqoDy8uRq7A4INWIMOiiSER32mE0xw8nTq9LeidSuE3SQoDPr21LO94/Q668c5USkt97qFqZtG2QvB2UqlVsvvhJkl23NcqMYGV3JoAXCldEHnafK3Jhac=
Received: from AM0PR02CA0218.eurprd02.prod.outlook.com (2603:10a6:20b:28f::25)
 by AS8PR08MB8971.eurprd08.prod.outlook.com (2603:10a6:20b:5b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 17:27:33 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::96) by AM0PR02CA0218.outlook.office365.com
 (2603:10a6:20b:28f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Wed, 28 Aug 2024 17:27:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 28 Aug 2024 17:27:33 +0000
Received: ("Tessian outbound 8e666bd17457:v403");
 Wed, 28 Aug 2024 17:27:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b771c889ed2d3c06
X-CR-MTA-TID: 64aa7808
Received: from Lf6cffd2a39ab.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9D0A480D-8F3E-4EF8-8850-1258E836B2E5.1; 
 Wed, 28 Aug 2024 17:27:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf6cffd2a39ab.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 17:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCk1B2iPLFOXzijNMUu6RGNhNI1BWyQfOyM9LfXOxlTA0WRuSNf7WEqyG8q8+lleVnYhl9/55nff/hxNpuwCVrwTfbPjxrgVnaeNqyl8KgWsQo6ozK5jPcTx6fBp3UIB9voy/HFaExpW65Pzgtio+t3/1gSLpbOC7GPguCGeQwW4IBog0hWRG7ijLgA3lkyWuyAOaib2XoJH+iLNzW3hGurRwfQrhFuCe0fcmBsv0fXS70BDnKNC3Y2+7ypHv09wzqL9etPZVTKuo4V/G8CGYtD7ub17J6e2sj9dkqxQeJZuyq49/Uw7uwEX17oEO0qkLqTSL4Yodf9a/KM0kKxinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmd1NFhAixuB392WGGWTY8mLiA3VFQLMI4H/ONrGpqg=;
 b=JXij3Fp6F+yNFiWV+RREEWvtZRVk0mmBjPzfhwCQrtbU7I8EvmHmtXBoYkG9+hrsdZUhnEuRLEwyvn9gLUArDkPMS9YxQE+72ZpnaELrlShcWZYIXOerQnKKuUAVeapibukzetxV71BLLGOpO+s95jrFkum+LBoY6iXl4Py3OIFHCPzv/ToSDbRLhR/7lhxCd+KtcQkZtwcfZcqY4um0pL+Ay9eRrcOYxRjzQc7F8BFRsG635UU2oOlcVHtfdcrVrsGfUAwC6PmKaM+MMIm6akJsUM4HNecMcyIJoIkQunU+hAJRAf3RmowGKQPGS79KBn3jDWmsJtmQNdc/fUBQOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmd1NFhAixuB392WGGWTY8mLiA3VFQLMI4H/ONrGpqg=;
 b=ReNAqNPOE7cdbb9VUK/pHTuj9qwoPp4TDxQT+7vFZV6lEX3Hz5IfIIqoDy8uRq7A4INWIMOiiSER32mE0xw8nTq9LeidSuE3SQoDPr21LO94/Q668c5USkt97qFqZtG2QvB2UqlVsvvhJkl23NcqMYGV3JoAXCldEHnafK3Jhac=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:27:19 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 17:27:19 +0000
From: Mihail Atanassov <mihail.atanassov@arm.com>
To: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [PATCH 8/8] drm/panthor: Add SYNC_UPDATE ioctl
Date: Wed, 28 Aug 2024 18:26:04 +0100
Message-ID: <20240828172605.19176-9-mihail.atanassov@arm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240828172605.19176-1-mihail.atanassov@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0029.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::17)
 To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB6551:EE_|AM4PEPF00027A63:EE_|AS8PR08MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c33e526-45e8-46f4-cdda-08dcc786b383
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?5d+T0opbfSDpM2cNxak+5DFUXzVYC6ahjTEXKIb/tweqt2GCYhoN6ydFYcIz?=
 =?us-ascii?Q?X7OhTbvHtJmFN1fokjJzyqN8HqNNBoOyPq4MbSlUxWd9XOUeZmo06IWZYl5Y?=
 =?us-ascii?Q?iIrpN9LfmOZNGemHjTPh0DxrznWo+rN4psuPqbIGPs3kpD7GxS/vZGIMbEi+?=
 =?us-ascii?Q?lAR/49S8q0aHZssSEeMM61qARaUC2KBY6dzqkN6kcZ7mW5YQoBFR9qoH84js?=
 =?us-ascii?Q?vflRNpmGVtPOyM4kfCNRcP8UH9k1xteUXB2ZyW6kOxSYCqOh7z62rm6ozqAG?=
 =?us-ascii?Q?4ErJxV+gu8MXrY79/+1+9mnfat7T6U6rx1rdQZvg/h34bfZNNZSU8ZfA00sq?=
 =?us-ascii?Q?PvvDCGihMaEBK9Pdw81dM2h0moB0aHogg5bIXwDeWnAbQ+kkAXRhf6Mh3IBG?=
 =?us-ascii?Q?vJhSteRXshJyN0WUu8nvgAdqPhnHikvCKJagMToqzSYOfFD4M8AOEZeVPafL?=
 =?us-ascii?Q?P5t55SD0SRRnBvWFef3I8BpbIaW0rDkQXV2Bj/rTuaUw/JeKMKh9tzeCV3PF?=
 =?us-ascii?Q?H3ZL1DTh1ofYN+2y8Zv3+sVXWzgYYj2rk9X28yeAfA6Os5CnVhemZrtukCdz?=
 =?us-ascii?Q?U40VFAaf0P0HPt7cAvABdHdmMAHfGswq8VFiS+65ezGx6u0RxkWcaQcx6dne?=
 =?us-ascii?Q?hq6VjgCt9Vv6cpkBUzw1W1+z5q4AG5I2EkHcA3JUZPsfaR5KJQc3/qERQy0M?=
 =?us-ascii?Q?moocQMksCUiodu5uaFgvqDW3+uXff/zt+2N/6XMNPVQQeXQ2udSQGWixgC7h?=
 =?us-ascii?Q?dU8mUxzqbN+QjyadzNPiyirbQfTkMR9njTuCOU4mtoDmwjqBTjkyOduFl0lG?=
 =?us-ascii?Q?7jPDZ81CIcKgdkVTIKfnk0UCLNhj4+AX6s8fYhxYnLj2krdqHIPN7KVFqQ4E?=
 =?us-ascii?Q?nh+dvIHLoYQbTT/aKTjJ0sdx87vNPCcW52vFlUnfeOTN8U0RLKR0zpB0Uw92?=
 =?us-ascii?Q?OF3Fq/8+deFk6ksD0+HERnGJkv6vs2zzlIbMuXBDrOjoeq4QmljkdUONHw9A?=
 =?us-ascii?Q?i0MAhhBLN1I9r9Wh6Tfu2eytt9NPelpdjVL/X7tytyhH7L5wBquwYaXGLh7C?=
 =?us-ascii?Q?tQe2q26UJKtTD3HB/CMFQqbL73usv+Ur7whjV/Idy4qkBHehxyP4AmNstsC5?=
 =?us-ascii?Q?uPQLSICDONODms1Df4717LWKAjqKkr66eNV43lnqU/EbDgW14im0ra9My+n6?=
 =?us-ascii?Q?padRS28I1qBCtIgnYzyd55TbwXNAt1+r0GFuapmvVwKx0hPWrJAwECoiuRVc?=
 =?us-ascii?Q?kt0M3iaXMGsOOD7EEOi+gNXIXkpvdEcPsgUACRCZ2/oUlvLfeFwmHRIUaewd?=
 =?us-ascii?Q?I3LEkhVjz8dHjDwr8mh2DAFypGzI97VEbRG25rQivxYB7Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 561ef853-d6ec-40da-b0e7-08dcc786aac5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|35042699022; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J1EASqi362yTYo+jiE3QOqQbL2h7Y+eyGfFbitva1IvwnSaEzX/9R1qgqXI8?=
 =?us-ascii?Q?o4yySiJXvsCAi9Mu5ZJCb3l0Sx2lLVdl65MMf4XEwCx89CHv+1RczL8p7xQW?=
 =?us-ascii?Q?14Mfb6u8lSNFppbsmgg2itwpT48WgDYgSLujIJ4Me20r/7VKy9slf4Au/Vuh?=
 =?us-ascii?Q?PZVMk5HdeadTB9jTUUufnJ8lL16kKIe0vS4HRemprfxoEloNPgIh+dY13SLT?=
 =?us-ascii?Q?8Two3p59Q5VPKWw8f0Jb8Qj0Qy0jDltcDnH7SiFQk54Xpo1BiHPcj2O+GTAJ?=
 =?us-ascii?Q?nVY49fO7KCwJb+cSpN56KzTxFm1ugRr4jhgS2b6z4Mc0QSf5o0TYzqfdXB8E?=
 =?us-ascii?Q?j/CUJSnhg0dX6z0v/BUCntxei+953ibZ+5sJV81ppzREvsnXJi1MlUaSLSGU?=
 =?us-ascii?Q?cer7hCWjBqIIr3E+tH5qsy2JnNYWx8bec9NTXDRfLFTsHwZe3x/OTlN7ybkD?=
 =?us-ascii?Q?FvhV86Lq7GdmfeJEu+iBJGQVEx8WneSqPqMuxYHpTx1ddrRrJilf443OPLjK?=
 =?us-ascii?Q?ENhFrylKoN5ig70JDfzW6DLUNask0LHO7UCVaAXhNuEcKiIvoqkMiG56PkMI?=
 =?us-ascii?Q?w8NRMJvKvX16OMZ99mZZs06gFuRlm01OT7Ux/GR2Gr4Z+tDBZEpGX87gzu1A?=
 =?us-ascii?Q?ejFfwwsDw/uZ0KYE1ifbRIIuHuh10izwyirRZcb2GlQpH2XhJMUwnzK3O3Uy?=
 =?us-ascii?Q?bEUPq7OeDqa/178eTAhqDca7Wag4EytSBmUBWZ4IEkR2Is/betMLr13PbJ2S?=
 =?us-ascii?Q?0WBS8YLXba0VQryenk7j6OC+bWIFEO9/gO3T2AeQStxo7rGo+AD/vayNA/Dd?=
 =?us-ascii?Q?arQVqB2bLbEE3SQVoC0X0gb6iYwne4Nn0n7WCtkWCfMOlOZQYkoxulM7NZJk?=
 =?us-ascii?Q?Pa/0fyn/q9NV39eR5yDYga1FA+7DCW0AfU4g4SeGK7tf1pQNcGMMkhiULVwg?=
 =?us-ascii?Q?fTMla6LtIaOt3X+elJAxRq4JQcdmyao3EZ0dP7ecFO2EUvn8pzJ9S/QJoTp6?=
 =?us-ascii?Q?XTPDBLTgg7hLHCCf3xWuMa3TkQJAXPco4Oe+OndFxiFmheZ98F8UU6jL9Wby?=
 =?us-ascii?Q?j1Q1iLIR8zi1B2jz00/4hBgNKOcMZs9aXfr8BLSoO43cDnCMtBfVq9pp4yIE?=
 =?us-ascii?Q?msIrAKx+NUVN5L+VBZuc9/17USj3qbbufUNs+C4eTvwsUkwHlMgM/bHmX+dF?=
 =?us-ascii?Q?8ui3pxJSjD7dblostvs9GRNveBAWI//ITthux8TomLqcB9y0+f1VFd7iG7h+?=
 =?us-ascii?Q?gNQDb7TDXrJEc6uqm7bLzDYuV2kJ17a52jfo2u3ZMFnDexJYT51O8KstVUQz?=
 =?us-ascii?Q?RAKe3jPQ4hS4J3zpZtTOmeScqndCPhUdv7rmGmSEOg5tjmUi7Ga2oYPniM95?=
 =?us-ascii?Q?S1OObC+wih11EZDjy+b1SCfDmjv/IREacK/5eFU5mEfVfc8ymPOPhK0qG6gH?=
 =?us-ascii?Q?b6tVMKDWic0gbKdKQ5p/de2A5Vi914q8?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:27:33.0603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c33e526-45e8-46f4-cdda-08dcc786b383
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8971
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

From: Ketil Johnsen <ketil.johnsen@arm.com>

Similar to how the kernel driver notifies userspace about syncobj
modifications, the reverse notification is also necessary to let panthor
re-evaluate any queues (GPU or XGS) that were blocked on wait
operations.

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 681ac09b6343..1734a52dc3b5 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1426,6 +1426,28 @@ static int panthor_ioctl_xgs_queue_submit(struct drm_device *ddev, void *data,
 	return ret;
 }
 
+static int panthor_ioctl_sync_update(struct drm_device *ddev, void *data,
+				     struct drm_file *file)
+{
+	struct drm_panthor_sync_update *args = data;
+	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
+	struct panthor_file *pfile = file->driver_priv;
+
+	if (args->pad)
+		return -EINVAL;
+
+	if (pm_runtime_get_if_in_use(ddev->dev)) {
+		/* All sync wait ops will be re-evaluated when we ding the global doorbell */
+		gpu_write(ptdev, CSF_DOORBELL(0), 1);
+		pm_runtime_put_autosuspend(ddev->dev);
+	}
+
+	panthor_sched_sync_update(ptdev);
+	panthor_xgs_queue_pool_recheck(pfile);
+
+	return 0;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1508,6 +1530,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(XGS_QUEUE_CREATE, xgs_queue_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(XGS_QUEUE_DESTROY, xgs_queue_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(XGS_QUEUE_SUBMIT, xgs_queue_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(SYNC_UPDATE, sync_update, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
-- 
2.45.0

