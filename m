Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E32C850AA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F5B10E3D1;
	Tue, 25 Nov 2025 12:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Z7e5dii6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Z7e5dii6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D55B10E3D1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:56:53 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LTuNkmmP1zqxuS85D+hkaY67dUzfPMeW1jG+oYNVtgg8t7P0uIyvbLbhuz4M73+rbXNEeXIwrybFldoLGq9CQ0USXW8gMqmHNgFDihLaB7Yf6S4Z0rs2kG65M7uJ6+ZO3OlCvj4rt+ebPD3t2VRE4XDabYBaeuinj/ebE5iRUfAxEkMOXzv6QjIpjnn/ZDCXNwlqQl4pxA3gr3MDCwPcIoBf1EzddiC6g8s0BS92tz/PMIq7oULv5Fz4tMMDG8e066BeiDX+D+noqCgNuq2LFXl7o7KzcUQC9byshn48DRktUIX28YXL7ZxRoroCsbgHsc9jMN/31Xs0ytm0kqX6sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKDmgjfd4L9QeLr77TvdrYHtok+xXxjBTbn9Qqr4pZA=;
 b=pPsyOUxqc9yoyGmSKcVRYhmXyX3faX5dqMJH6qqxnTU+KvV5/0yzGlCC5MqjCffQDWwWQeq+ZyJ0HafZcq6kTYhQgfwfCkvKphgLNoHtl4rdgXut9Iywbf/o80PiRBjaqTbxErO4a1ySLMkDff53woer8sGFP49bBmgLJ1BfhrMcHYosoqhT0PKPVtgVIt+6K0ITnbOIbfl86F8K4U0MEAxeWDCd/YiaQkuz94/V+CGeWHb1E/rjNm3j7e7f9XurshjnDlCLFXLTwM4V2MVy8E3K81qsUZvMNyPTweyv/0JXUaYKsQFB6Fgc192LyRYKRYSFrq78I1S01DFGrdKpCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKDmgjfd4L9QeLr77TvdrYHtok+xXxjBTbn9Qqr4pZA=;
 b=Z7e5dii60GSVFbYQ7nlXOXKOXz90d/s31Ow8QdSRvJKo6W+dh8Q2oOzTFk1VFPxSpvWW5B3lEouwrF9slkzEnyOJdtvvHZ3KLHBJSO1uRkHUtjdCMUUniIQ7DoqU4H9+Fvw9FxyLBpTAO8oC9ndVviaiQMCzpNTBxWVNP5MzOCw=
Received: from DB9PR01CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::26) by GV1PR08MB11027.eurprd08.prod.outlook.com
 (2603:10a6:150:1f5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 12:56:45 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::be) by DB9PR01CA0021.outlook.office365.com
 (2603:10a6:10:1d8::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Tue,
 25 Nov 2025 12:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 12:56:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxsaO8ZRWWUYKpA+uG3IR4XYWEK4jRNc9MqZ0Jj85gyhYRavQ7wSyA18yhLJ/gdBMj/y+Epty4fCyHOPKEYnF8Ud2yzihVe/z4dlxojqq4dXnrfKsJi+HXy94MzvHrn7mK5ce0HEdvKpUZGdIKqS/Yrad+FyWPjgSoiJITXY+JbG3Ijci6xDkGqnyFGw2ZwxxJhCsAMhODlDwDJ8ISs9fwRnG96kvrZei0jqGbCm4VOqydQ1/THceAhZ55ccyzlT9ygTCaBoT/0wB6hXQuigU+rDOp3LtnKO8BucB9vi0+TvqGd3gs66wV1bGz4IfpIxU9eFPzfMJwDHuk3F7fJgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKDmgjfd4L9QeLr77TvdrYHtok+xXxjBTbn9Qqr4pZA=;
 b=XzGpI/aRSLEcEJX/rhWIw402MIIp1Zsoj76+JO7g96GYjQ330tBLXq6ThTKrsTy0xRN3hbTKKtGPFfFel0a0Ld7yfsEyEii9xvVSdGvRbNaxPcFix075o/HqgVThNEpCDbSsefM1SEvbLxTagd3CwLCgDTtgEvQYOk19YvgVAhSRcoJKdc1f26EaONorfJNtX6ovr2BdJY7bAa1j1Z2HCU0W0VckvMB5u+whypM5Ab3oj9O56GtkYT7xDoADtsdlDI18GK60VdOILZ7bnDdT/EVffFJp3hJnlWofZ27GRWgowgSpKQd5fNWduiFbTrKc0WVE3xlr7WXpboxRKChM9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKDmgjfd4L9QeLr77TvdrYHtok+xXxjBTbn9Qqr4pZA=;
 b=Z7e5dii60GSVFbYQ7nlXOXKOXz90d/s31Ow8QdSRvJKo6W+dh8Q2oOzTFk1VFPxSpvWW5B3lEouwrF9slkzEnyOJdtvvHZ3KLHBJSO1uRkHUtjdCMUUniIQ7DoqU4H9+Fvw9FxyLBpTAO8oC9ndVviaiQMCzpNTBxWVNP5MzOCw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DBBPR08MB6108.eurprd08.prod.outlook.com
 (2603:10a6:10:1f4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:12 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:56:12 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/8] drm/panthor: Add arch-specific panthor_hw binding
Date: Tue, 25 Nov 2025 12:55:41 +0000
Message-ID: <20251125125548.3282320-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125125548.3282320-1-karunika.choo@arm.com>
References: <20251125125548.3282320-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DBBPR08MB6108:EE_|DB1PEPF000509E3:EE_|GV1PR08MB11027:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2b4e2c-ae70-4444-f352-08de2c221628
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?FD5juwKdp6Y5JE+/iKqYG6kMyRSHM60iug6B88rCShJJsYS9GqPdyAmmIJQJ?=
 =?us-ascii?Q?4HAILL7T8axM0Mfx5miikOqFbU1BtaFqKnkucPZOirOSVJt2Q36wRjWoAjXz?=
 =?us-ascii?Q?+JV/sCMXOz3a08HxOmugUzru89+3r0RcAngfgBdWibvwNZ66UbmzVUB8qSK1?=
 =?us-ascii?Q?ELEqBx4TdgfnY3m9o4NtHt7MGVBELmu8QEGKtlY0zLDD8+ygo8kA8GnvH3ET?=
 =?us-ascii?Q?qbz0H37iZ5X+zkDxGaAfBVj+Sm3mc+yu/Ymgua+g0848zsq1WNSbkJNgcy3x?=
 =?us-ascii?Q?Jd/KgiWm6SJZsJKILKEUWSADZa+VsnIzIi8tYQ77aYuoQEEXBSV9JBn1k+9R?=
 =?us-ascii?Q?1YzFgIYwz0RJIKKV+mh6qkPSVOCbKA2Ah5f+/lefKBAk0qtV8rZSpayWAvfT?=
 =?us-ascii?Q?mNLsaprV0A3BnAtP1JdA2CL40Q1qmDAZSqLzxz7wmx616jw+HIlWGf38BkGk?=
 =?us-ascii?Q?CdpOHKtWG69MZod3r1A9k2Pl4eHl+k5MppbQqjL1oHgpdoVqobJnqZMc1idN?=
 =?us-ascii?Q?opWWMJRkjlGz5sHZQ8eKLFxsdTUOtOzh6netJ9la4t3jcWKlQzPavsyKp8hL?=
 =?us-ascii?Q?BBvZ/Xf4nmJVB0FWXyLo0CoqJKy6skTWwm5FfuGRTwH5MgMQy5kQWwbnEyrG?=
 =?us-ascii?Q?8HNm1pL9ipLJTEhaNJ4kCVY1+tWlFiiYvI2d7Ce3UgMx6fMHEdSyHQhMeQn4?=
 =?us-ascii?Q?wohJOhxExYN8UJOrW9wT0QflugdB3jkhOTmNE279vp7YXMS7MizjVPwxE8wk?=
 =?us-ascii?Q?RnRPZfBepQCaoPN+Vo11xeWMuH/Tqk2PbBlN+dGh71PlkssNZi70RFrM22tg?=
 =?us-ascii?Q?aTc9UeSg6mroYRdxqS+pz25r2fA4svdkh8tKkXpHugm1r8Sltwvx8JieOvw7?=
 =?us-ascii?Q?Kr58QvrBPyLZc+5VYU4eZAYDEl+hsiy4b3VrvDDD02Bly6lGNKzU75QGNTYg?=
 =?us-ascii?Q?DYcJtYrybheViKiiLA3Vv49EaIhFxenjMe+Enczs8V9OoxJ1JEUHG1kClOym?=
 =?us-ascii?Q?s51y8Y+y6Lo8NHbKNYcrKC607h+f868uyMo7FUUdpypwhNZBj8ysgxxmrGMb?=
 =?us-ascii?Q?7tU5NfXQw0zURChrRXqOrG9PXRAAuJCpY4KzMyYPtaVaKmu+Ms4YnD7irJU/?=
 =?us-ascii?Q?/5nuSlWLs6OpIQj8ccCHAZ0Vqgb09Ttc6DlsgK6WmTpTGSk8RWi6UwuztFuX?=
 =?us-ascii?Q?STkiq9x0E4+kRP3oQ6uKs8Zx2Xi22L+688VGek6Mf5kwbiBQkzHLv+KwlgQW?=
 =?us-ascii?Q?OWvTVXVwlEdktydqbqR1wY6o7XxaxN6gDYxblvd5Oe/8V5GjcGgwKbwRexUZ?=
 =?us-ascii?Q?I5akjflBZTmEhBBhMne2Nwx0IBHrwZjFseHD+r15RmKrKIFkjGUPSrN1ajJB?=
 =?us-ascii?Q?+0ZhwgfuEUsULM9+CQLkSLAi9qJNMvt5qj2RkX2qHaEpBZi5Vk4nNtUmDIcv?=
 =?us-ascii?Q?1pZQ0p5H21vUofuR7BHCFcYQsZTy+vx5?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6108
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 43d06f3b-d792-49cc-dade-08de2c2202e2
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|36860700013|35042699022|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gNOKtXvsFprZKsy8+oPH1cnoesZlo3q3HaqPC/zfmtRdF8fi+v+MBfpqw8lF?=
 =?us-ascii?Q?s6fXhu+KUnTX20XKDrpoSvmvvHzT6SgdX5J1yT3r6WW1tWluqkTmcXKDncBM?=
 =?us-ascii?Q?qHxjQxiHGlho22E+B28wjPOFOFsxbHy3BylQVWUvL1bDW3fESRfqBCdgKyd3?=
 =?us-ascii?Q?eVJf66YPTlwN02hgypqK6dB+ESdHki9NG3sUpT00S+X/tFAwXBt5/5GKawAS?=
 =?us-ascii?Q?52cskikKeN7pb9UN5NG9QjwoOa92qZ3TrKhvUukRqGIZrjJydh0ze7VptUIu?=
 =?us-ascii?Q?teToPlCnMmgHdFWDaei8N1Lw/5NXKQwXDMki6DyxeCnw8V+gu7QgwXFOLeSp?=
 =?us-ascii?Q?9fpJyIQqLqK8SWFP3D30Ln8PrG/zqQ8hAf8j+mNQxiaXoPhRIOr8hDSZ8tHP?=
 =?us-ascii?Q?DBHumxbBxmMvniaGHZhZm2G815um+DT7c43OtSCIVWJF1tIT4pRrILWbB2zh?=
 =?us-ascii?Q?TFO3Uz6XCdXZE6fPwPiJKSy+WWbJ+I94FyaKuRS/reoJP36m/VJHZCbKxxd1?=
 =?us-ascii?Q?W+Q0oqpqTGIdN1u3b3DR9D1UIZ+2EUHArHnWTYkVTzjG8WrEBvd57nEi5IBu?=
 =?us-ascii?Q?GI68nzmQk0dYg5okSHsRSwXcTuMG/2wYATrNLaCpNzJVntF6dRZ91YwipSZO?=
 =?us-ascii?Q?lyccfw/zLYkV6Us9eMSkw3jIHs0kwewg3ujMXJzd3CD6+WwTkhaHHBxvyR+J?=
 =?us-ascii?Q?tPNwNnlKKwJiMvQ6mi8/3/dI2rRIgUvJRHLkKfP/O31euEYrP2wvBKclV16q?=
 =?us-ascii?Q?4m5SLR4TJdDjqOk+AVpt7aBpSqPvv0Zk5nfNhux2KfoSRssckXMCh5NzOEwt?=
 =?us-ascii?Q?yWln9ktVUe+Adb0hXYPmI0kkb0wG7OpC/mlSBUSf5vk9XO5inntBFYt6B92C?=
 =?us-ascii?Q?PpfNs1MPY/q+bqv8pGl0EXKVRSf/44B8OFnbJavf+DWS5bStY5glPx71HHQ5?=
 =?us-ascii?Q?Abhg9IIRCt9HduZUAEaWk5EYeGPtW4zq5SErSu4fHNWWlXXELAVc/+oZ8p0R?=
 =?us-ascii?Q?96Ir980D9Q4iAKc8+L7RASc/ed1GASBHtBKYHh78sDa3Tz8uj2NXBI6qBzRs?=
 =?us-ascii?Q?3xfV+Es8WcVK1K/6EgYQsIIZvfuaex0yVkJ+WObOaJHu0Otp9joYtGuiH2Xs?=
 =?us-ascii?Q?MARj3WGpm39XkygZEwMSJLShoeh/bHyzklvlYBq2eGe7uEd1gL0FUtK5Pb+X?=
 =?us-ascii?Q?DSqzOM9vcf+tMW2QMLfcqPSOzF9zEyQ4FbAKEXXSRCPkHBO7dHmCMpBveLFT?=
 =?us-ascii?Q?US4J/4+5TcO2SZfL0CopBWmpZWrwMolGQhFVO2zLIT5FcKHDwvC1KET9DFtc?=
 =?us-ascii?Q?Ed8QvMEn7rEKYnsZrEdHIvga9BHrOgPMq8x4qlmnRNcNIFrfqOc6540hrWQM?=
 =?us-ascii?Q?2xFv/8e5b5lybrt2QJ5+CIndaDP/+hZgibwGBD9NqG/5r7ehhjWpECxNNwx0?=
 =?us-ascii?Q?ydkODmhpQvusxqUjwLwbqJC+/R6f9l0RmcY3dOLJjsrJq73Ini3eJo3K90iJ?=
 =?us-ascii?Q?cLc38aBRCwCMoHl3TwNh905zPdUln8qjbG/6hHX0N7sRoeE7XOpuUqwfIkUx?=
 =?us-ascii?Q?KVHmV2pCSCATpKCiKUA=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(36860700013)(35042699022)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:56:44.4345 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2b4e2c-ae70-4444-f352-08de2c221628
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11027
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

This patch adds the framework for binding to a specific panthor_hw
structure based on the architecture major value parsed from the GPU_ID
register. This is in preparation of enabling architecture-specific
behaviours based on GPU_ID. As such, it also splits the GPU_ID register
read operation into its own helper function.

This framework allows a single panthor_hw structure to be shared across
multiple architectures should there be minimal changes between them via
the arch_min and arch_max field of the panthor_hw_entry structure,
instead of duplicating the structure across multiple architectures.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v2:
 * merged GPU_ID refactoring patch with the arch-specific panthor_hw
   binding patch (PATCH 01/10 and PATCH 02/10 in v1).
---
 drivers/gpu/drm/panthor/panthor_device.h |  4 ++
 drivers/gpu/drm/panthor/panthor_hw.c     | 65 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_hw.h     |  6 +++
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index f32c1868bf6d..f0b143732ea0 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -24,6 +24,7 @@ struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
+struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
@@ -134,6 +135,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;

+	/** @hw: GPU-specific data. */
+	struct panthor_hw *hw;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index c44033a0bba8..5b5a82e15f86 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -10,6 +10,28 @@
 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
 	(((arch_major) << 24) | (prod_major))

+/** struct panthor_hw_entry - HW arch major to panthor_hw binding entry */
+struct panthor_hw_entry {
+	/** @arch_min: Minimum supported architecture major value (inclusive) */
+	u8 arch_min;
+
+	/** @arch_max: Maximum supported architecture major value (inclusive) */
+	u8 arch_max;
+
+	/** @hwdev: Pointer to panthor_hw structure */
+	struct panthor_hw *hwdev;
+};
+
+static struct panthor_hw panthor_hw_arch_v10 = {};
+
+static struct panthor_hw_entry panthor_hw_match[] = {
+	{
+		.arch_min = 10,
+		.arch_max = 13,
+		.hwdev = &panthor_hw_arch_v10,
+	},
+};
+
 static char *get_gpu_model_name(struct panthor_device *ptdev)
 {
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
@@ -64,7 +86,6 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;

-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
 	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
 	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
 	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
@@ -119,8 +140,50 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 		 ptdev->gpu_info.tiler_present);
 }

+static int panthor_hw_bind_device(struct panthor_device *ptdev)
+{
+	struct panthor_hw *hdev = NULL;
+	const u32 arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	int i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(panthor_hw_match); i++) {
+		struct panthor_hw_entry *entry = &panthor_hw_match[i];
+
+		if (arch_major >= entry->arch_min && arch_major <= entry->arch_max) {
+			hdev = entry->hwdev;
+			break;
+		}
+	}
+
+	if (!hdev)
+		return -EOPNOTSUPP;
+
+	ptdev->hw = hdev;
+
+	return 0;
+}
+
+static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
+{
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	if (!ptdev->gpu_info.gpu_id)
+		return -ENXIO;
+
+	return 0;
+}
+
 int panthor_hw_init(struct panthor_device *ptdev)
 {
+	int ret = 0;
+
+	ret = panthor_hw_gpu_id_init(ptdev);
+	if (ret)
+		return ret;
+
+	ret = panthor_hw_bind_device(ptdev);
+	if (ret)
+		return ret;
+
 	panthor_hw_info_init(ptdev);

 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 0af6acc6aa6a..39752de3e7ad 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -6,6 +6,12 @@

 struct panthor_device;

+/**
+ * struct panthor_hw - GPU specific register mapping and functions
+ */
+struct panthor_hw {
+};
+
 int panthor_hw_init(struct panthor_device *ptdev);

 #endif /* __PANTHOR_HW_H__ */
--
2.49.0

