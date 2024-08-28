Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F7962E6B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 19:26:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978ED10E3C0;
	Wed, 28 Aug 2024 17:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ggRj+YrF";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ggRj+YrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7B610E319
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 17:26:54 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s1w/G77LbjF1xAC1m8XXlnH9EBnGKLPuKRz//GGfNUtP2jte5kdBhI7k0ryAnDgs0tVrIRx14qNMwI6OVhmE3xV8fnykXmUNjRhmp6LmuhxswgSQwMVgLSZ0AZrDtpM7o05ps6ycBTgrSu4G3nV6wC3xc07JSu7F55KrDDWqeL8g49CszOBUY1Lu0MI9wdST4Y3qcneVkW5B/edVWp8udG/tHShpTjmBWYS1HBkVwscq6wXO3H1uVsO8799NKIm1+kZlR09QC7tPnVAc6K/Yy7VnhOxU2QSQi4NAZPKe8rubTskhTA3M64eXWM5RXAdeHSlIXRo2nquZvRgI3aSQZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbc6k7P+ygVSSbukIIpWKOMTxID22PkF6F3NAlV5wnI=;
 b=SR5XC5EGEwNhPwvOO97d4/CyUQDUovGyqAd0hEIJCXdCkfN5YEeleDnNX6YGSLhPrQlJdMLyW95JTX9HZGY/0GjZXTQkM360F/Dl+IehbU+xpwqN/a2NIoNPkO3DSlOupE6G/QHgb3x8eHmKOEFqwaj0iQG2EDNO4j4kkFPqTlp0+t1QT+6ddh+kiuvdO9uFoOpF8CkoRw4EB29u5Bs6hQKJNTaZFUu4nAFAsVpdma5jDP1yDizHA63yV9zT0IaZlaDnxCqQ0l0loHCGUznqoRreHSbKb7AAUVr+SVFScPzabPeUSb+tlfdkY7/s6zllBFJZ5xVj7eaXpJDfu4fH6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbc6k7P+ygVSSbukIIpWKOMTxID22PkF6F3NAlV5wnI=;
 b=ggRj+YrFThahcZTCq2UGeJRsyhpxUpRi3k4ni0IQnPgROUatUDzOZ7Waon+BdGmVdvtvZN0F9Rh7VwHiSqSZLGt8FrzJA/QKb6OBY2LX2KS7zVu2UG7GbK8dTwbfGFAKTyVaJbVDWbsTpXzC5jk/T6LVfHChRH8W9cC9/rwLy04=
Received: from AM0PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:208:55::33)
 by AM8PR08MB5826.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.17; Wed, 28 Aug
 2024 17:26:44 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:208:55:cafe::d8) by AM0PR04CA0128.outlook.office365.com
 (2603:10a6:208:55::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.33 via Frontend
 Transport; Wed, 28 Aug 2024 17:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7939.2 via
 Frontend Transport; Wed, 28 Aug 2024 17:26:44 +0000
Received: ("Tessian outbound 71990416b08d:v403");
 Wed, 28 Aug 2024 17:26:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8086614d8e878064
X-CR-MTA-TID: 64aa7808
Received: from L86e926b1e659.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63E635E0-75D2-4366-93C9-C6EE02F97793.1; 
 Wed, 28 Aug 2024 17:26:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L86e926b1e659.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 17:26:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5cNVFECF1wdmtJV7eBZuNIIDSTxOolLgVBKUAYOR1zQMy+rngOBO3jMii2YiLUoXsO2TakEBXYcxAD94TUUjZLOkYnoE0lR5sI3vCYwlMVFpkLwmNV2QpDv0LwXWgzwqkKsH3DV1V5kSxmzhuocThu0N3NnxYm7sTOfblMe3jHaeC46951YBtKCPSxzJ2DNLaj6qYwh97htfTQJ8i1gC3/lr0saU3ZGb7w8Ekr0lBlhFYHIx44tpRHLOHoKm3cCKdFzenpavSnwCu3+5ESXJxj5+FbagDm6w3Jy/NcjEuMdU40VXJ7LjKXIJmvXZVegFfZs09NHNuqCFf/E4VboUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbc6k7P+ygVSSbukIIpWKOMTxID22PkF6F3NAlV5wnI=;
 b=kZEhlGrE7qV93GrZ9GipWGGLj1CfgHzWZJ7uMtQvyjLihEIuV5wchIApdCneyCTMXG039ivHLhjTDXUg/7cNvi7nglng0UTLtoChlBnsknsDQilbEya9RMKdoOgesR+qg+92TWI1AH7Sv3jn7Lu0BZOfm9mcv31uI0Cjzd7wOfTT8K+sF7/nHM1Ogr0vTRwBVOHxOiPD9N8XvEoIN4myIFwnyLvrFq1O3FCAGzaO+qozYMOiIPX8BZYR0e+EeQ2L12oIhf9FS/p+ZuCTOrvPG6ajx+tbLHWe3AsDpK6ySEEoCMth9xkJqwB/aBnXAbT0CzkXK86v7YTn4oEIFZhVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbc6k7P+ygVSSbukIIpWKOMTxID22PkF6F3NAlV5wnI=;
 b=ggRj+YrFThahcZTCq2UGeJRsyhpxUpRi3k4ni0IQnPgROUatUDzOZ7Waon+BdGmVdvtvZN0F9Rh7VwHiSqSZLGt8FrzJA/QKb6OBY2LX2KS7zVu2UG7GbK8dTwbfGFAKTyVaJbVDWbsTpXzC5jk/T6LVfHChRH8W9cC9/rwLy04=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:26:29 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 17:26:29 +0000
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
Subject: [PATCH 2/8] drm/panthor: Extend GROUP_CREATE for user submission
Date: Wed, 28 Aug 2024 18:25:58 +0100
Message-ID: <20240828172605.19176-3-mihail.atanassov@arm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240828172605.19176-1-mihail.atanassov@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0109.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::6) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB6551:EE_|AM4PEPF00025F95:EE_|AM8PR08MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b5d66a-4d9a-44ff-5b1f-08dcc7869680
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?jQIXgOjVcv0e2P1DEXvHz7rjGnvI5ZCcKqop232TPx8EHHqTO/p7nWau3E36?=
 =?us-ascii?Q?1idcXka2kRI/rY2SfJkgIncmGQdNyOnSppIZhipYyB9ekv6yw+oQ/rBsfNJR?=
 =?us-ascii?Q?n3ZdxNe6/jokvV3uoRv8tlbCN+Mf0XSwTl85U2M+TzMmQTCimDPbikdEaCf1?=
 =?us-ascii?Q?sEdMvPnxinflk1+e9m/Z5pDEtgJdIl8xEBv6ZlJ0ZQwStH0QGBLeAQ1OZ3Ah?=
 =?us-ascii?Q?ijyAmPCBZnef9Rt3L4Tqzo3EDyANa3N4cSr5/KjZvaGtYB0Xd9Dji8AoJhFy?=
 =?us-ascii?Q?SsMTguaUAY/QCC7QDhoWA1o1314HwHnbj2SExlrNcLxNldOjfNzn/LwvgpaC?=
 =?us-ascii?Q?OfxUpJDIb5yq48OhuXIoDP6vkNL4Lyov6fSOdjkhAK4xEPYlF2TcpZ7h+HGC?=
 =?us-ascii?Q?2sfhu6y2mPYs8LP38LVMK6awcRp+bkGmiSK+pNCyz3Ngb72SdEbVKGMUa1ID?=
 =?us-ascii?Q?R/zxx578OUupV0C9r3Tj0fu1+YMoM24t2pHJoxUCGoPVY0UP87wD96s5vHGS?=
 =?us-ascii?Q?f4YMvYsFfdk5BGxQvhtZ250yzhQMSUY27GnFLGYSRARfXmi2Wv3HOPYX2l7g?=
 =?us-ascii?Q?4FxULH0EwlbqiTj0Zx15Dkd9xRFo/xrfm/2kHYttx21ht7xe/jUu1n0ynRg+?=
 =?us-ascii?Q?3L4pNcLEAR3wloa0bfu+ssXAqVEwVv0q51r7vgV1LntxCz32WyoLZxQWds64?=
 =?us-ascii?Q?r4aPMRGB5Lft3Dv/ms92+uUaMduMqFw6MtcaJhEr7UFPZ3rb/k9J+UnQytQ2?=
 =?us-ascii?Q?rXU5LAe9D2PSLvj7clg92rKInQec0h+jmPRKUh36ntwvGzMRMl2dMrx0one0?=
 =?us-ascii?Q?Rhlp74wNRjO9ht09cWDhmoqnBnQpXMgdPnwey3cBruSpjVMAgCgO4s8poKwH?=
 =?us-ascii?Q?z1zQVvcqFI3qvfn+kU4/6qxufdWzd4A2Z7n7DZX3wIj4C4tR+yTAUkXppVTC?=
 =?us-ascii?Q?qrBe5WNwFsS4H2OH5XNA6G5TyMe6xWXQW9Rf/fxD2EdGsv0PAZZRT3E7RFLn?=
 =?us-ascii?Q?QmuTAyRH1oFpJScKT9Bzz90aS+caOS27dlraI85kHnbefCsNeHdvpvaQKQM1?=
 =?us-ascii?Q?lC/Bs9yr3IlLYpxLUm6jIs3EhqDUKjpikKs8tSsyfdEeT2mZAiZgDnEOctOJ?=
 =?us-ascii?Q?7Yc1uf9IavW3gB46z4jZjR7zJ26VKsnCzHViQJjd2PVndqk/JEWh8DNVgqmJ?=
 =?us-ascii?Q?+w3rM23YiPzzwM3+4uhyn/yy2DeBl3+AijKjGqlgd1yuL2kfCSybwyVIkMUA?=
 =?us-ascii?Q?sAhI1tfubJKQuOzxjj3/gFkjwTPS2oP8WnoA9390LT+QsJB9uaeD6nPA2cnB?=
 =?us-ascii?Q?f6LUeS/nP4SPo6T8RhoGwfCovbKh32O28MQcdLUKGK4dcQ=3D=3D?=
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
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 26b15f1a-173d-4bc5-7777-08dcc7868d82
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6KVzaap0Qu4X/56snWXWKWCzo/SdZFWOGDWEfo4nq8RtMCEECnhYlRqMUvuU?=
 =?us-ascii?Q?eqwsXzX9qNl/MF+grJLu2te1R50jC5Kf5m3bk7rG4wmfBhc2+JYA1c+huXYF?=
 =?us-ascii?Q?uWMUQ3RPolNEv//WcrQMnJNkgBtlKVjkOtcDKjmPVEWP1Zs+OyI48fxwTa0f?=
 =?us-ascii?Q?eqROPEqAomY6evIgNco+9duWoAwM9nEtbGIhXo83k94TD3VnYs/kFeVJsrYq?=
 =?us-ascii?Q?Wb5R15x37wVc0Xgln+wUbL1CC9KZkHBOtDii7nztdxKzdqKVWkwClSEShMYx?=
 =?us-ascii?Q?hUwsfPR/UUTohBd0PB2DdJIjo5WiLo8I+RIrrI1ZcVV3PIgUHMyX68ZjPaxf?=
 =?us-ascii?Q?sWHl98xd9KjMzYXVF8ZtnrEWIHF4LmCEg8kcLCvJuQlbZtbmAy8PB2pQ+o5S?=
 =?us-ascii?Q?kc7emkViij/6EpaFHs5LF/cVqyiTx9VOOKaWcM/v0CnRbMP4brLlGYdwX7dT?=
 =?us-ascii?Q?PQ55JupjypsAT6vgnjGRWQGU7of1IU/k9cFtd28t766J+aIZ8OkTTRaVTm9G?=
 =?us-ascii?Q?qvsxhE1DimMWuPvA405aJZfWqIKV4SHlFQMPwUKN3USIOtyN1oZlOoejjC5N?=
 =?us-ascii?Q?AhUeHSNwV9l41FgE8e+ityRFKUGnkWzc0iAtKqmUX2xzz4tDBX0ZWXBozN9z?=
 =?us-ascii?Q?oXX6bFnfmjjM4uQRl3fv8NlwyJv7Ozdqx1h1lkOwHtlnxpue/ctJnj6Q7K4m?=
 =?us-ascii?Q?1NimG2E0yUgpXAf/dl4rNHAfr927l1uF4pt8Kdp6JjSGlzAyIJeWw9S4AbIH?=
 =?us-ascii?Q?9xBlXq9gIRRng7r2FMuGXMSOH52jaD1snGsy0VFV69y+y9nCI6Tw8YSpwBuz?=
 =?us-ascii?Q?pOm8dkmb+i7tFnecWkB7PBtZSJu05shm2ZFPHpiEmBSSEvcBtY+U8Q9oOpZt?=
 =?us-ascii?Q?XDmm/xNjpt5fZJ4kmlK72/OGhRAFk/o7Em3s/TlmnboMchD07hIEthVvg03+?=
 =?us-ascii?Q?5fM/fwvmx2kKTzFP/8Irp+tlltOxQUREcztVhpyoyQI0iPY0Ykv/esEfeB/W?=
 =?us-ascii?Q?QMd3LT8sZkZ9C1M/TIg2KN/gxsRhyYgn4bEH4tZuscJrJZE7xnxVPErLC7uI?=
 =?us-ascii?Q?mycM7nFXJXNnXsu11rXDzPGFJYokShqQxBijMhxZFqMAvn2gXrt+AFYpHtJS?=
 =?us-ascii?Q?EMb9RnSGqsJKC9KHWjmU1oZidtdQV/dZVC+FdTsZQJVDw93O6q5x0QzNfDNj?=
 =?us-ascii?Q?qiE1i6u4R9MuUuUHxXpjz1zWDkQHdOICMOq2bXNbTHtWCe9ziXIiuef1x80N?=
 =?us-ascii?Q?5oow43Xf15AYhRLO7fqGmB0rtRCHprJgEMKl/ZzISM/CPd6aZV2YYUHuFmvl?=
 =?us-ascii?Q?iicrR6kLKRTOt5bGuSfYOz2hYTeIgHZr+8P4g6PnQW5YfzNibkEsRPW7a+Fh?=
 =?us-ascii?Q?sjzRC/gTudEM58axRujYHon3fQR93q9mTd7lm56bPeRLC/UTcnyVN9bLpuVO?=
 =?us-ascii?Q?8ksn4dFzVBcweLhZETmMYGk2A13n9WTS?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:26:44.3525 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b5d66a-4d9a-44ff-5b1f-08dcc7869680
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5826
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

Allow userspace to mmap() the ring buffer, and the doorbell and user I/O
pages, so that it can submit work directly to queues.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
Co-developed-by: Akash Goel <akash.goel@arm.com>
Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |  24 ++++
 drivers/gpu/drm/panthor/panthor_drv.c    |  69 ++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.c  | 151 ++++++++++++++++++-----
 drivers/gpu/drm/panthor/panthor_sched.h  |   4 +-
 4 files changed, 209 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index e388c0472ba7..7c27dbba8270 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -171,6 +171,9 @@ struct panthor_file {
 	/** @ptdev: Device attached to this file. */
 	struct panthor_device *ptdev;
 
+	/** @drm_file: Corresponding drm_file */
+	struct drm_file *drm_file;
+
 	/** @vms: VM pool attached to this file. */
 	struct panthor_vm_pool *vms;
 
@@ -353,6 +356,27 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
 					 pirq);							\
 }
 
+/*
+ * We currently set the maximum of groups per file to an arbitrary low value.
+ * But this can be updated if we need more.
+ */
+#define MAX_GROUPS_PER_POOL 128
+
+/*
+ * The maximum page size supported by the driver, when running with a smaller
+ * page size only the first page at this offset is valid.
+ */
+#define DRM_PANTHOR_MAX_PAGE_SHIFT		16
+
+/* Carve out private MMIO offsets */
+#define PANTHOR_PRIVATE_MMIO_OFFSET  (DRM_PANTHOR_USER_MMIO_OFFSET + (1ull << 42))
+
+/* Give out file offset for doorbell pages based on the group handle */
+#define PANTHOR_DOORBELL_OFFSET(group) (PANTHOR_PRIVATE_MMIO_OFFSET + \
+					((group) << DRM_PANTHOR_MAX_PAGE_SHIFT))
+#define PANTHOR_DOORBELL_OFFSET_START PANTHOR_DOORBELL_OFFSET(0)
+#define PANTHOR_DOORBELL_OFFSET_END PANTHOR_DOORBELL_OFFSET(MAX_GROUPS_PER_POOL)
+
 extern struct workqueue_struct *panthor_cleanup_wq;
 
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 4f1efe616698..0bd600c464b8 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -67,6 +67,54 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
 	return 0;
 }
 
+/**
+ * panthor_set_uobj_array() - Copy a kernel object array into a user object array.
+ * @out: The object array to copy to.
+ * @min_stride: Minimum array stride.
+ * @obj_size: Kernel object size.
+ *
+ * Helper automating kernel -> user object copies.
+ *
+ * Don't use this function directly, use PANTHOR_UOBJ_SET_ARRAY() instead.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+static int
+panthor_set_uobj_array(const struct drm_panthor_obj_array *out, u32 min_stride, u32 obj_size,
+		       const void *in)
+{
+	if (out->stride < min_stride)
+		return -EINVAL;
+
+	if (!out->count)
+		return 0;
+
+	if (obj_size == out->stride) {
+		if (copy_to_user(u64_to_user_ptr(out->array), in,
+				 (unsigned long)obj_size * out->count))
+			return -EFAULT;
+	} else {
+		u32 cpy_elem_size = min_t(u32, out->stride, obj_size);
+		void __user *out_ptr = u64_to_user_ptr(out->array);
+		const void *in_ptr = in;
+
+		for (u32 i = 0; i < out->count; i++) {
+			if (copy_to_user(out_ptr, in_ptr, cpy_elem_size))
+				return -EFAULT;
+
+			if (out->stride > obj_size &&
+			    clear_user(out_ptr + cpy_elem_size, out->stride - obj_size)) {
+				return -EFAULT;
+			}
+
+			out_ptr += out->stride;
+			in_ptr += obj_size;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
  * @in: The object array to copy.
@@ -182,6 +230,20 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
 			 sizeof(_src_obj), &(_src_obj))
 
+/**
+ * PANTHOR_UOBJ_SET_ARRAY() - Copies from _src_array to @_dest_drm_panthor_obj_array.array.
+ * @_dest_drm_pvr_obj_array: The &struct drm_pvr_obj_array containing a __u64 raw
+ * pointer to the destination C array in user space and the size of each array
+ * element in user space (the 'stride').
+ * @_src_array: The source C array object in kernel space.
+ *
+ * Return: Error code. See panthor_set_uobj_array().
+ */
+#define PANTHOR_UOBJ_SET_ARRAY(_dest_drm_panthor_obj_array, _src_array) \
+	panthor_set_uobj_array(_dest_drm_panthor_obj_array, \
+			       PANTHOR_UOBJ_MIN_SIZE((_src_array)[0]), \
+			       sizeof((_src_array)[0]), _src_array)
+
 /**
  * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
  * object array.
@@ -1012,10 +1074,8 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
 		return ret;
 
 	ret = panthor_group_create(pfile, args, queue_args);
-	if (ret >= 0) {
-		args->group_handle = ret;
-		ret = 0;
-	}
+	if (!ret)
+		ret = PANTHOR_UOBJ_SET_ARRAY(&args->queues, queue_args);
 
 	kvfree(queue_args);
 	return ret;
@@ -1262,6 +1322,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	}
 
 	pfile->ptdev = ptdev;
+	pfile->drm_file = file;
 
 	ret = panthor_vm_pool_create(pfile);
 	if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index b2cf053b3601..ad160a821957 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -384,6 +384,21 @@ struct panthor_queue {
 	 */
 	u8 doorbell_id;
 
+	/** @doorbell_offset: file offset user space can use to map the doorbell page */
+	u64 doorbell_offset;
+
+	/** @ringbuf_offset: file offset user space can use to map the ring buffer
+	 *
+	 * Only valid when group is created with DRM_PANTHOR_GROUP_CREATE_USER_SUBMIT
+	 */
+	u64 ringbuf_offset;
+
+	/** @user_io_offset: file offset user space can use to map the two user IO pages
+	 *
+	 * Only valid when group is created with DRM_PANTHOR_GROUP_CREATE_USER_SUBMIT
+	 */
+	u64 user_io_offset;
+
 	/**
 	 * @priority: Priority of the queue inside the group.
 	 *
@@ -524,6 +539,12 @@ struct panthor_group {
 	/** @ptdev: Device. */
 	struct panthor_device *ptdev;
 
+	/** @pfile: associated panthor_file */
+	struct panthor_file *pfile;
+
+	/** @handle: integer value used by user to refer to this group */
+	u32 handle;
+
 	/** @vm: VM bound to the group. */
 	struct panthor_vm *vm;
 
@@ -548,6 +569,9 @@ struct panthor_group {
 	/** @priority: Group priority (check panthor_csg_priority). */
 	u8 priority;
 
+	/** @user_submit: true if user space controls submission */
+	bool user_submit;
+
 	/** @blocked_queues: Bitmask reflecting the blocked queues. */
 	u32 blocked_queues;
 
@@ -708,12 +732,6 @@ struct panthor_group {
 			mod_delayed_work((sched)->wq, &(sched)->wname ## _work, delay); \
 	} while (0)
 
-/*
- * We currently set the maximum of groups per file to an arbitrary low value.
- * But this can be updated if we need more.
- */
-#define MAX_GROUPS_PER_POOL 128
-
 /**
  * struct panthor_group_pool - Group pool
  *
@@ -836,6 +854,12 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 
 	panthor_queue_put_syncwait_obj(queue);
 
+	if (queue->ringbuf_offset)
+		drm_vma_node_revoke(&queue->ringbuf->obj->vma_node, group->pfile->drm_file);
+
+	if (queue->user_io_offset)
+		drm_vma_node_revoke(&queue->iface.mem->obj->vma_node, group->pfile->drm_file);
+
 	panthor_kernel_bo_destroy(queue->ringbuf);
 	panthor_kernel_bo_destroy(queue->iface.mem);
 
@@ -1552,7 +1576,7 @@ static void csg_slot_sync_update_locked(struct panthor_device *ptdev,
 
 	lockdep_assert_held(&ptdev->scheduler->lock);
 
-	if (group)
+	if (group && !group->user_submit)
 		group_queue_work(group, sync_upd);
 
 	sched_queue_work(ptdev->scheduler, sync_upd);
@@ -2019,10 +2043,12 @@ group_term_post_processing(struct panthor_group *group)
 		}
 		spin_unlock(&queue->fence_ctx.lock);
 
-		/* Manually update the syncobj seqno to unblock waiters. */
-		syncobj = group->syncobjs->kmap + (i * sizeof(*syncobj));
-		syncobj->status = ~0;
-		syncobj->seqno = atomic64_read(&queue->fence_ctx.seqno);
+		if (!group->user_submit) {
+			/* Manually update the syncobj seqno to unblock waiters. */
+			syncobj = group->syncobjs->kmap + (i * sizeof(*syncobj));
+			syncobj->status = ~0;
+			syncobj->seqno = atomic64_read(&queue->fence_ctx.seqno);
+		}
 		sched_queue_work(group->ptdev->scheduler, sync_upd);
 	}
 	dma_fence_end_signalling(cookie);
@@ -2785,6 +2811,9 @@ static void group_sync_upd_work(struct work_struct *work)
 	u32 queue_idx;
 	bool cookie;
 
+	if (drm_WARN_ON(&group->ptdev->base, group->user_submit))
+		return;
+
 	cookie = dma_fence_begin_signalling();
 	for (queue_idx = 0; queue_idx < group->queue_count; queue_idx++) {
 		struct panthor_queue *queue = group->queues[queue_idx];
@@ -3021,6 +3050,9 @@ group_create_queue(struct panthor_group *group,
 	if (args->priority > CSF_MAX_QUEUE_PRIO)
 		return ERR_PTR(-EINVAL);
 
+	if (args->ringbuf_offset || args->user_io_offset || args->doorbell_offset)
+		return ERR_PTR(-EINVAL);
+
 	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
 	if (!queue)
 		return ERR_PTR(-ENOMEM);
@@ -3046,6 +3078,20 @@ group_create_queue(struct panthor_group *group,
 	if (ret)
 		goto err_free_queue;
 
+	if (group->user_submit) {
+		ret = drm_vma_node_allow(&queue->ringbuf->obj->vma_node, group->pfile->drm_file);
+		if (ret)
+			goto err_free_queue;
+
+		ret = drm_gem_create_mmap_offset(queue->ringbuf->obj);
+		if (ret) {
+			drm_vma_node_revoke(&queue->ringbuf->obj->vma_node, group->pfile->drm_file);
+			goto err_free_queue;
+		}
+
+		queue->ringbuf_offset = drm_vma_node_offset_addr(&queue->ringbuf->obj->vma_node);
+	}
+
 	queue->iface.mem = panthor_fw_alloc_queue_iface_mem(group->ptdev,
 							    &queue->iface.input,
 							    &queue->iface.output,
@@ -3056,6 +3102,21 @@ group_create_queue(struct panthor_group *group,
 		goto err_free_queue;
 	}
 
+	if (group->user_submit) {
+		ret = drm_vma_node_allow(&queue->iface.mem->obj->vma_node, group->pfile->drm_file);
+		if (ret)
+			goto err_free_queue;
+
+		ret = drm_gem_create_mmap_offset(queue->iface.mem->obj);
+		if (ret) {
+			drm_vma_node_revoke(&queue->iface.mem->obj->vma_node,
+					    group->pfile->drm_file);
+			goto err_free_queue;
+		}
+
+		queue->user_io_offset = drm_vma_node_offset_addr(&queue->iface.mem->obj->vma_node);
+	}
+
 	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
 			     group->ptdev->scheduler->wq, 1,
 			     args->ringbuf_size / (NUM_INSTRS_PER_SLOT * sizeof(u64)),
@@ -3075,11 +3136,9 @@ group_create_queue(struct panthor_group *group,
 	return ERR_PTR(ret);
 }
 
-#define MAX_GROUPS_PER_POOL		128
-
 int panthor_group_create(struct panthor_file *pfile,
-			 const struct drm_panthor_group_create *group_args,
-			 const struct drm_panthor_queue_create *queue_args)
+			 struct drm_panthor_group_create *group_args,
+			 struct drm_panthor_queue_create *queue_args)
 {
 	struct panthor_device *ptdev = pfile->ptdev;
 	struct panthor_group_pool *gpool = pfile->groups;
@@ -3115,6 +3174,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	group->csg_id = -1;
 
 	group->ptdev = ptdev;
+	group->pfile = pfile;
 	group->max_compute_cores = group_args->max_compute_cores;
 	group->compute_core_mask = group_args->compute_core_mask;
 	group->max_fragment_cores = group_args->max_fragment_cores;
@@ -3130,6 +3190,9 @@ int panthor_group_create(struct panthor_file *pfile,
 	INIT_WORK(&group->tiler_oom_work, group_tiler_oom_work);
 	INIT_WORK(&group->release_work, group_release_work);
 
+	if (group_args->flags & DRM_PANTHOR_GROUP_CREATE_USER_SUBMIT)
+		group->user_submit = true;
+
 	group->vm = panthor_vm_pool_get_vm(pfile->vms, group_args->vm_id);
 	if (!group->vm) {
 		ret = -EINVAL;
@@ -3152,25 +3215,27 @@ int panthor_group_create(struct panthor_file *pfile,
 		goto err_put_group;
 	}
 
-	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
-						   group_args->queues.count *
-						   sizeof(struct panthor_syncobj_64b),
-						   DRM_PANTHOR_BO_NO_MMAP,
-						   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
-						   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
-						   PANTHOR_VM_KERNEL_AUTO_VA);
-	if (IS_ERR(group->syncobjs)) {
-		ret = PTR_ERR(group->syncobjs);
-		goto err_put_group;
+	if (!group->user_submit) {
+		group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
+							   group_args->queues.count *
+							   sizeof(struct panthor_syncobj_64b),
+							   DRM_PANTHOR_BO_NO_MMAP,
+							   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
+							   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
+							   PANTHOR_VM_KERNEL_AUTO_VA);
+		if (IS_ERR(group->syncobjs)) {
+			ret = PTR_ERR(group->syncobjs);
+			goto err_put_group;
+		}
+
+		ret = panthor_kernel_bo_vmap(group->syncobjs);
+		if (ret)
+			goto err_put_group;
+
+		memset(group->syncobjs->kmap, 0,
+		       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
 	}
 
-	ret = panthor_kernel_bo_vmap(group->syncobjs);
-	if (ret)
-		goto err_put_group;
-
-	memset(group->syncobjs->kmap, 0,
-	       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
-
 	for (i = 0; i < group_args->queues.count; i++) {
 		group->queues[i] = group_create_queue(group, &queue_args[i]);
 		if (IS_ERR(group->queues[i])) {
@@ -3188,6 +3253,21 @@ int panthor_group_create(struct panthor_file *pfile,
 	if (ret)
 		goto err_put_group;
 
+	group->handle = gid;
+	group_args->group_handle = gid;
+
+	if (group->user_submit) {
+		for (i = 0; i < group_args->queues.count; i++) {
+			/* All queues in group use the same HW doorbell */
+			group->queues[i]->doorbell_offset = PANTHOR_DOORBELL_OFFSET(gid - 1);
+
+			/* copy to queue_args so these values can be returned to user */
+			queue_args[i].doorbell_offset = group->queues[i]->doorbell_offset;
+			queue_args[i].ringbuf_offset = group->queues[i]->ringbuf_offset;
+			queue_args[i].user_io_offset = group->queues[i]->user_io_offset;
+		}
+	}
+
 	mutex_lock(&sched->reset.lock);
 	if (atomic_read(&sched->reset.in_progress)) {
 		panthor_group_stop(group);
@@ -3199,7 +3279,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	}
 	mutex_unlock(&sched->reset.lock);
 
-	return gid;
+	return 0;
 
 err_put_group:
 	group_put(group);
@@ -3390,6 +3470,11 @@ panthor_job_create(struct panthor_file *pfile,
 		goto err_put_job;
 	}
 
+	if (job->group->user_submit) {
+		ret = -EINVAL;
+		goto err_put_job;
+	}
+
 	if (job->queue_idx >= job->group->queue_count ||
 	    !job->group->queues[job->queue_idx]) {
 		ret = -EINVAL;
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 3a30d2328b30..55b6534fa390 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -19,8 +19,8 @@ struct panthor_group_pool;
 struct panthor_job;
 
 int panthor_group_create(struct panthor_file *pfile,
-			 const struct drm_panthor_group_create *group_args,
-			 const struct drm_panthor_queue_create *queue_args);
+			 struct drm_panthor_group_create *group_args,
+			 struct drm_panthor_queue_create *queue_args);
 int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle);
 int panthor_group_get_state(struct panthor_file *pfile,
 			    struct drm_panthor_group_get_state *get_state);
-- 
2.45.0

