Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA970B12075
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 17:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B13810E20A;
	Fri, 25 Jul 2025 15:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="c7ujuyhL";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="c7ujuyhL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013064.outbound.protection.outlook.com [52.101.72.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE8C10E20A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 14:59:59 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rYWLQKaxmdwmKVVsEFhNbNE8aepMcV6Pm71Aa2i4+KDBQJaJVweVgLKb0kGbPvrTTIuxz1YR5WjvVWO8q4rK3aCkOL6vGk8EpR+0NEWkRRtdaMHU01/RPgP3y0NarPYx9/piBIKk/ARFyS/CNtCePOFpyTNxXnWFsGlex/sz2ILZoVRF6wrh2paDy/Ey/LvRab10d5T60v+B3px6yLMaCr42HTF0A2te7V96uPdIWdD5FzvNeh7bOUqS73ZqA06Xn3gnwyKXmUoq9CyG3Oer0BU8rLNywW6bGHiDmC3nqpa3HRIeVZkOIqLlMDfvKPW5TxMCRSQZ62ajujFM6sfQIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wx6gnth2/MWvfrNZ17Z9+k8zaXMcbso4/cA6U4is9G8=;
 b=A82xz/0zFKFdTIjn5GN/vn0mBe5gD/wrxflEMa/k+4jRrp+LIPR7o5ehWZiBHXPwJiKCIC0vzWMjuRSXoFqbb+1R/pZ6561dzAcsezVacHyBKRo3m3KEII+SUdozJ6PKzEtmQ7W2VepaGFxQUYEfbZBIIrdfNjn65rlkoZZzRuM1x+UYNtUT1qxEQ92uvJKT7sHF3yf5RC5Bwv8bN0pKcCChGTZnw1/S++4J7e01E77iSqlaFSkTmt0XzpYsTWjXnnSilLa4Jyjb4USShbKim01PmK/hfUcQzzJPZ6glPya6OIdQPoT2DZuieQDG2Y1klxcvXo7A2RkJnRHLvi/Sfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wx6gnth2/MWvfrNZ17Z9+k8zaXMcbso4/cA6U4is9G8=;
 b=c7ujuyhLJDLv0GwI6Cw5ML8GXrBMNiru++tBEAOdvhpSq133GXaWgCJErVljPHVyKliHTYtUrRaXfttkA4eGmEfkfxOT0r0j2XLsyveoJaOKE9qlSk6UDYG6vTC8xmZ0HO6GQSzC9AtC2Sjxpm3Qp/xX2/g/+UnsqINAdL/jUcQ=
Received: from AM0PR04CA0047.eurprd04.prod.outlook.com (2603:10a6:208:1::24)
 by AS8PR08MB6328.eurprd08.prod.outlook.com (2603:10a6:20b:33e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Fri, 25 Jul
 2025 14:59:56 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:208:1:cafe::2e) by AM0PR04CA0047.outlook.office365.com
 (2603:10a6:208:1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 14:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 14:59:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDPPq459uYb9ec6iY27oXH98hHv2hGdVA/uZMrRYIuKIXwUE+gIvmp2uv8umcWrgc5gKmhLNbAh7W+N0oesUAFDFT4sRvM7+ZyRGcOnBVjeA8VzbQBD3kFOCkEn51oR/yMcqubtIDnzBo3vE6i+3wNp4kbjnd+/lwg2TWlUTn+RC+ZsGmNVNKroDw3rjOqneHxoBXBsWg9VFy4/XE8evHZC72jDdiqV+fJoJGE8xiqUPoHWmHtgz8/juaEGGbDKHhLbyt6Gy+nFIahs8xnoHFHu8UtXo78rnAmSqln9TO2kGiOyKW0K4bbQMmNACZk25L0JDFo8GgrnQVWYpYH950Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wx6gnth2/MWvfrNZ17Z9+k8zaXMcbso4/cA6U4is9G8=;
 b=LGYkl00wQfz4tLK6VFyJOnvb5FWj2WlbQlQX37gsy+iLIEYvcZzaRYOo/6wAotF12G061phqLxr/eZqtMp5L+ldhhWPtQfclXgXts1OUlinYlx62+GuCUFh9bl5AX8KlYII30jDbA5TKROtDFqsP5ch5UnHQSJrKB7GNd3g/a09wX0H4DutL3PkBlfSXnyhHr4TOgOFokviJMiyHjD1zyVepD+paMtJR2tuYtpDzU/CsuV43Rxp917WqZ+KjlFzvZcG3ivEOn0DZ8AW9MR3QhsaL7J2exMgIWfyMLGFA0UPSRGswhx8O/4eFc/tTFhSge6LYyj9boqsbbCv+IWRoPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wx6gnth2/MWvfrNZ17Z9+k8zaXMcbso4/cA6U4is9G8=;
 b=c7ujuyhLJDLv0GwI6Cw5ML8GXrBMNiru++tBEAOdvhpSq133GXaWgCJErVljPHVyKliHTYtUrRaXfttkA4eGmEfkfxOT0r0j2XLsyveoJaOKE9qlSk6UDYG6vTC8xmZ0HO6GQSzC9AtC2Sjxpm3Qp/xX2/g/+UnsqINAdL/jUcQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:59:22 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 14:59:22 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Subject: [PATCH v5 1/7] drm/panthor: Add performance counter uAPI
Date: Fri, 25 Jul 2025 15:57:52 +0100
Message-Id: <f8d45068a7d602872e7ced6953619e1abf5edb3c.1753449448.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1753449448.git.lukas.zapolskas@arm.com>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0189.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::14) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|DU0PR08MB8471:EE_|AMS0EPF000001B7:EE_|AS8PR08MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: cd05f81b-e85e-4d65-0f3e-08ddcb8bea22
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?kCGl23Q2ls584wwkLIxAIB2g88xhihCKxQRj8NVaj/12qqQyQhvU0dRqejbP?=
 =?us-ascii?Q?54n/Aw5+vszAsusUHlY6GKmHeYN4X3AQLxBN+fiVxdS+fuxWkn1qkmLU8cbg?=
 =?us-ascii?Q?/ZRfypXdir01WBt0LhJZwP4RoZT9B/5uaK82mO2Az01iRL/rg65A25MSLXOF?=
 =?us-ascii?Q?GdM2/S1wKSlIs3o8jt9inzbej+gNGYaVOACrO6MwVmGQnasyT9GQgSjPlI8u?=
 =?us-ascii?Q?LTmdvxafBtElu73r0bNlK27dkGpv60oQJSCNR8U3gcWYP1t/LDKsqe55vEGV?=
 =?us-ascii?Q?zxz2q92cm03FLEZbTpkwEpI+r5wMEybzhvb/u68z1P0dwX9vlWjWdxvlCoBi?=
 =?us-ascii?Q?k3uh6bXIa/tZpAZrTZyn5NAk1qGAKodaBmxpjZ2laRQTu/5CnwCPRIFB2NmN?=
 =?us-ascii?Q?jitR+spZaHI7yDIivzW6Hnz6ga5cdjzMMfSdGt9OhW3t42u5tu+k8iD8auns?=
 =?us-ascii?Q?ZmcvsSPyg6w2RWCrHnzKqTZNObwCVQZ2xgn4McHryhWJekEIshtqPRGnEuvg?=
 =?us-ascii?Q?nRL8it2iuOdogNLo4hZg3wkaxFWaXsLH2nsSnjIS+ji7Orv6cLOnUiOGKwmz?=
 =?us-ascii?Q?FPwXaI6yx13VAlz3eLqp4Q1/7zRLV2NBSUA8ha2PrWwzV5BfNK+50FGHB0CN?=
 =?us-ascii?Q?KRzzjxITlbZerdlI8y1cj+DdlDKVRlFPk71GaJcjuKiyPXzoSIuFbhLGk/qU?=
 =?us-ascii?Q?2SIKVAtlvFuWpakgQCp8wUWCe4FzvEkmOI0IYqCTLWDwJN9lxihFILt5EK/2?=
 =?us-ascii?Q?oM2GOOwbeR0QSPCUwk1JRuJ8VaLq39TSUQFfmGmXj/ykucc+6bhB3P3lNJoB?=
 =?us-ascii?Q?PadF8+xqMPEa9jXfxc6d7Bb2Ejj/AcfrNPFFKIWPtepgqHy0nKGeQCx8/4Ga?=
 =?us-ascii?Q?Us8r0Xrfwl+ABQddTPVQBdU9Zw6hAwH4DEm0c4nB4TiW9haoN3IVIcnTzclX?=
 =?us-ascii?Q?sebRWUnPB0OQvL+qLL6ddn5BA1emis4l9BkIIzXULsyhPP8eq/BodlKMrWBw?=
 =?us-ascii?Q?fVFytZpMMp+RRBLW9jnBJRnVZ3A8W61uXZcP/QB7uEbfAN0dPXPORBih2cQ5?=
 =?us-ascii?Q?u/NfjjItZs+riW67kw0uT/AG6DTDYUQiFeBTKtM6zbLa2n/oJNhV8NdBTCVZ?=
 =?us-ascii?Q?3ZhyPVdpYaVnRNjrfKIReISykXUHXkBsQ6jkKvxmOP21+Q2hwxTYRQRg0Ypx?=
 =?us-ascii?Q?FKYefWALUO1N2cM6PmYn03AJK1TKVh7lvotOG0XFUTRjU4GFULA+euicYqQq?=
 =?us-ascii?Q?V+8ktQYS8G6s1RkZeCumeG4KlXR5oGe+vrZ5KjaPONC6IbYd0/rD6UGSvoFO?=
 =?us-ascii?Q?lFcBWeBgtmpQ+DXVLrBfPDNCt5y6ZlQrVeveUnWCu4cQ1OYx4FGR0+yVhoW9?=
 =?us-ascii?Q?vumpGdw0pINjNQIImDR48pF4smMyNSUcKBj5cRf/yiAxYLKMYhSAm/6qJqAA?=
 =?us-ascii?Q?r500hAYnoN8=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6ff54ffa-601e-433f-b2bb-08ddcb8bd6b1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rrGpBL4IsbvlFCfegKZsKjFE/GiVhC08nwuxpZBe3FP8i/41I3FonSnUppea?=
 =?us-ascii?Q?9dgnO3iMj6cPVVlH8C5IY4errDY+Y8wLKZcv9XkSEi++TeE7lEbBhPWHzV+D?=
 =?us-ascii?Q?HCdLZfAwH3If67B8J7GU6dE1hMpuJ4CWfYOtnS6cKq1JZL5KRT/gQVPj6ktm?=
 =?us-ascii?Q?1jt4C/LMVGs409sQS9jzjrtTyqlpJ6Yw8gzzVL+0E2zL1+VtOC1PfN9PwAkk?=
 =?us-ascii?Q?6r5Wq49usClBBWvtOz/wi8xft05Ha1tDUDBzOijq2BaLfdWHRzoeOA69St6O?=
 =?us-ascii?Q?RMrCifPJzAVn/SrE8HaZvLT0myxLQEFP+KPbWbsNtjtCwQTf6eZqsiAtJRIw?=
 =?us-ascii?Q?2j8sTtGH3kZSUj67qEnJ+4g5m+5bhSd8HYUbMpFh8644SpkeetQARXb3S/l0?=
 =?us-ascii?Q?WXUyskNu+rBY67enqprVe+4j9WkX5tOwIRhZYm2kiKTaXkdX2xsY89Puj05U?=
 =?us-ascii?Q?k1vVBKradFqsrih7NfcrXfBe2nzTJwO3qhPTQGSgjrgoH/4JH0LaaG9M6qUM?=
 =?us-ascii?Q?tG5i8fnY0hcuc1CdS9x/JsTqnv+/XBNfsb7wm8GagIpTkaLnD8hZmfPw2uAH?=
 =?us-ascii?Q?1XlRp8Oni8diA/I2fdcowUL8fawNbB293T3mkfNsZXRJfJYmeWosU1HWSqJz?=
 =?us-ascii?Q?1jOMZFU4OdTBufJ9ZUdJxouMQbCoyxsxG4QRZbIyEHrtm8HmptuqPDXd7PKt?=
 =?us-ascii?Q?z9p7s4K6i2KzI5USLea7fL6DpxdDdxPaHJu4zc82cnEiZFr8Ei7IK7T4PDPK?=
 =?us-ascii?Q?5QmKmqqzjK3GaBmqQlMEMexS7f1pXKJM+aO/lTkrn+F7g3MGLrxRmHSxjl2p?=
 =?us-ascii?Q?dQJcvl0tMQieuJ8ChcTV8U2/61I7rLt0olt0/WmE9/DwtApaHkAKP7zqMqx5?=
 =?us-ascii?Q?wv66GNy4FdSa4AJCLADK0uSvPfTk2D6+IqUL6aNlPPDaFuYLv3uPVzw0TY2X?=
 =?us-ascii?Q?AAT0Qi296PFtVjlQAzUdwfP9eKm0+E5DzyShxcIKa7iLX/pxPBj9wQuwksT+?=
 =?us-ascii?Q?FIhGvdC/pOnq0HK4gBvljBsGABJBjZRRTj1jLrZpqRX2aclolnhjyFD5+289?=
 =?us-ascii?Q?cXN/VV+W9y46jZ4XQIhpcJVN92REC7UKkecKLTycer3aZa17jGDM5J6ay+Ra?=
 =?us-ascii?Q?NWeAQGzCMYoxLbHFMMoqHgx4LD5WIXjLfddwDspAGEzKqxuhHeprDIVN7EMw?=
 =?us-ascii?Q?uXUVVS+1MMpOaA+mHxLzF65IUZplEsrM0SKULRuTO2kR3H0lkgmc+Bxr/H3D?=
 =?us-ascii?Q?K1vjpEs5b5Z8U9f23UXfLNwzWmVJ1ZPWdjMSvlIxxZucU8uid7frI4objpDD?=
 =?us-ascii?Q?pZcM0j1fugvg2ic9NGRo07I+G8rqgAxsCIz6L4cL6kgfZwckKQLgbX1ZqK0Z?=
 =?us-ascii?Q?5ScIPmvABqm+YZeEN9S8E5QJ0ufWSCp+ojBlbuEJBlIHfoiTu87ESlmi5nR9?=
 =?us-ascii?Q?FlhllgP6UJ+WFFG9KjWVM5oCfFwh2OwQhhQNHLcesvRwV61S/EluunVCpdel?=
 =?us-ascii?Q?QQZVCBUo5zZrL4R+4BpYQCqdL/xHmEuDaBCLNj1BDlKSqumhnP1AbJHS6w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 14:59:54.4264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd05f81b-e85e-4d65-0f3e-08ddcb8bea22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6328
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

This patch extends the DEV_QUERY ioctl to return information about the
performance counter setup for userspace, and introduces the new
ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
performance counters.

The new design is inspired by the perf aux ringbuffer [0], with the
insert and extract indices being mapped to userspace, allowing
multiple samples to be exposed at any given time. To avoid pointer
chasing, the sample metadata and block metadata are inline with
the elements they describe.

Userspace is responsible for passing in resources for samples to be
exposed, including the event file descriptor for notification of new
sample availability, the ringbuffer BO to store samples, and the
control BO along with the offset for mapping the insert and extract
indices. Though these indices are only a total of 8 bytes, userspace
can then reuse the same physical page for tracking the state of
multiple buffers by giving different offsets from the BO start to
map them.

[0]: https://docs.kernel.org/userspace-api/perf_ring_buffer.html

Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 include/uapi/drm/panthor_drm.h | 565 +++++++++++++++++++++++++++++++++
 1 file changed, 565 insertions(+)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..f05e4757de0e 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -144,6 +144,9 @@ enum drm_panthor_ioctl_id {
 	 * pgoff_t size.
 	 */
 	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
+
+	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter session. */
+	DRM_PANTHOR_PERF_CONTROL,
 };
 
 /**
@@ -243,6 +246,9 @@ enum drm_panthor_dev_query_type {
 	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed group priorities information.
 	 */
 	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
+
+	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter interface information. */
+	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
 };
 
 /**
@@ -399,6 +405,135 @@ struct drm_panthor_group_priorities_info {
 	__u8 pad[3];
 };
 
+/**
+ * enum drm_panthor_perf_feat_flags - Performance counter configuration feature flags.
+ */
+enum drm_panthor_perf_feat_flags {
+	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block states are supported. */
+	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT = 1 << 0,
+};
+
+/**
+ * enum drm_panthor_perf_block_type - Performance counter supported block types.
+ */
+enum drm_panthor_perf_block_type {
+	/** @DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
+	DRM_PANTHOR_PERF_BLOCK_FW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
+	DRM_PANTHOR_PERF_BLOCK_CSHW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
+	DRM_PANTHOR_PERF_BLOCK_TILER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
+	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
+	DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_FIRST: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_FIRST = DRM_PANTHOR_PERF_BLOCK_FW,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_LAST: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_LAST = DRM_PANTHOR_PERF_BLOCK_SHADER,
+
+	/** @DRM_PANTHOR_PERF_BLOCK_MAX: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_MAX = DRM_PANTHOR_PERF_BLOCK_LAST + 1,
+};
+
+/**
+ * enum drm_panthor_perf_clock - Identifier of the clock used to produce the cycle count values
+ * in a given block.
+ *
+ * Since the integrator has the choice of using one or more clocks, there may be some confusion
+ * as to which blocks are counted by which clock values unless this information is explicitly
+ * provided as part of every block sample. Not every single clock here can be used: in the simplest
+ * case, all cycle counts will be associated with the top-level clock.
+ */
+enum drm_panthor_perf_clock {
+	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
+	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
+
+	/**
+	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, responsible for the MMU, L2
+	 * caches and the tiler.
+	 */
+	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
+
+	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
+	DRM_PANTHOR_PERF_CLOCK_SHADER,
+};
+
+/**
+ * struct drm_panthor_perf_info - Performance counter interface information
+ *
+ * Structure grouping all queryable information relating to the performance counter
+ * interfaces.
+ */
+struct drm_panthor_perf_info {
+	/**
+	 * @counters_per_block: The number of 8-byte counters available in a block.
+	 */
+	__u32 counters_per_block;
+
+	/**
+	 * @sample_header_size: The size of the header struct available at the beginning
+	 * of every sample.
+	 */
+	__u32 sample_header_size;
+
+	/**
+	 * @block_header_size: The size of the header struct inline with the counters for a
+	 * single block.
+	 */
+	__u32 block_header_size;
+
+	/**
+	 * @sample_size: The size of a fully annotated sample, starting with a sample header
+	 *               of size @sample_header_size bytes, and all available blocks for the current
+	 *               configuration, each comprised of @counters_per_block 64-bit counters and
+	 *               a block header of @block_header_size bytes.
+	 *
+	 *               The user must use this field to allocate size for the ring buffer. In
+	 *               the case of new blocks being added, an old userspace can always use
+	 *               this field and ignore any blocks it does not know about.
+	 */
+	__u32 sample_size;
+
+	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
+	__u32 flags;
+
+	/**
+	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
+	 *
+	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
+	 *
+	 * For the same GPU, different implementers may have different clocks for the same hardware
+	 * block. At the moment, up to three clocks are supported, and any clocks that are present
+	 * will be reported here.
+	 */
+	__u32 supported_clocks;
+
+	/** @fw_blocks: Number of FW blocks available. */
+	__u32 fw_blocks;
+
+	/** @cshw_blocks: Number of CSHW blocks available. */
+	__u32 cshw_blocks;
+
+	/** @tiler_blocks: Number of tiler blocks available. */
+	__u32 tiler_blocks;
+
+	/** @memsys_blocks: Number of memsys blocks available. */
+	__u32 memsys_blocks;
+
+	/** @shader_blocks: Number of shader core blocks available. */
+	__u32 shader_blocks;
+};
+
 /**
  * struct drm_panthor_dev_query - Arguments passed to DRM_PANTHOR_IOCTL_DEV_QUERY
  */
@@ -1037,6 +1172,434 @@ struct drm_panthor_set_user_mmio_offset {
 	__u64 offset;
 };
 
+/**
+ * DOC: Performance counter decoding in userspace.
+ *
+ * Each sample will be exposed to userspace in the following manner:
+ *
+ * +--------+--------+------------------------+--------+-------------------------+-----+
+ * | Sample | Block  |        Block           | Block  |         Block           | ... |
+ * | header | header |        counters        | header |         counters        |     |
+ * +--------+--------+------------------------+--------+-------------------------+-----+
+ *
+ * Each sample will start with a sample header of type @struct drm_panthor_perf_sample header,
+ * providing sample-wide information like the start and end timestamps, the counter set currently
+ * configured, and any errors that may have occurred during sampling.
+ *
+ * After the fixed size header, the sample will consist of blocks of
+ * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block counters, each prefaced with a
+ * header of its own, indicating source block type, as well as the cycle count needed to normalize
+ * cycle values within that block, and a clock source identifier.
+ */
+
+/**
+ * enum drm_panthor_perf_block_state - Bitmask of the power and execution states that an individual
+ * hardware block went through in a sampling period.
+ *
+ * Because the sampling period is controlled from userspace, the block may undergo multiple
+ * state transitions, so this must be interpreted as one or more such transitions occurring.
+ */
+enum drm_panthor_perf_block_state {
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block was unknown during
+	 * the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for some or all of
+	 * the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off for some or all of the
+	 * sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was available for execution for
+	 * some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was unavailable for execution for
+	 * some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing in normal mode
+	 * for some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
+
+	/**
+	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was executing in protected mode
+	 * for some or all of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
+};
+
+/**
+ * struct drm_panthor_perf_block_header - Header present before every block in the
+ * sample ringbuffer.
+ */
+struct drm_panthor_perf_block_header {
+	/** @block_type: Type of the block. */
+	__u8 block_type;
+
+	/** @block_idx: Block index. */
+	__u8 block_idx;
+
+	/**
+	 * @block_states: Coarse-grained block transitions, bitmask of enum
+	 * drm_panthor_perf_block_states.
+	 */
+	__u8 block_states;
+
+	/**
+	 * @clock: Clock used to produce the cycle count for this block, taken from
+	 * enum drm_panthor_perf_clock. The cycle counts are stored in the sample header.
+	 */
+	__u8 clock;
+
+	/** @pad: MBZ. */
+	__u8 pad[4];
+
+	/** @enable_mask: Bitmask of counters requested during the session setup. */
+	__u64 enable_mask[2];
+};
+
+/**
+ * enum drm_panthor_perf_sample_flags - Sample-wide events that occurred over the sampling
+ * period.
+ */
+enum drm_panthor_perf_sample_flags {
+	/**
+	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains overflows due to the duration
+	 * of the sampling period.
+	 */
+	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an error condition during
+	 * the sample duration.
+	 */
+	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
+};
+
+/**
+ * struct drm_panthor_perf_sample_header - Header present before every sample.
+ */
+struct drm_panthor_perf_sample_header {
+	/**
+	 * @timestamp_start_ns: Earliest timestamp that values in this sample represent, in
+	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
+	 */
+	__u64 timestamp_start_ns;
+
+	/**
+	 * @timestamp_end_ns: Latest timestamp that values in this sample represent, in
+	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
+	 */
+	__u64 timestamp_end_ns;
+
+	/** @block_set: Set of performance counter blocks. */
+	__u8 block_set;
+
+	/** @pad: MBZ. */
+	__u8 pad[3];
+
+	/** @flags: Current sample flags, combination of drm_panthor_perf_sample_flags. */
+	__u32 flags;
+
+	/**
+	 * @user_data: User data provided as part of the command that triggered this sample.
+	 *
+	 * - Automatic samples (periodic ones or those around non-counting periods or power state
+	 * transitions) will be tagged with the user_data provided as part of the
+	 * DRM_PANTHOR_PERF_COMMAND_START call.
+	 * - Manual samples will be tagged with the user_data provided with the
+	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
+	 * - A session's final automatic sample will be tagged with the user_data provided with the
+	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
+	 */
+	__u64 user_data;
+
+	/**
+	 * @toplevel_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the top-level clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 toplevel_clock_cycles;
+
+	/**
+	 * @coregroup_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the coregroup clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 coregroup_clock_cycles;
+
+	/**
+	 * @shader_clock_cycles: The number of cycles elapsed between
+	 * drm_panthor_perf_sample_header::timestamp_start_ns and
+	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader core clock if the
+	 * corresponding bit is set in drm_panthor_perf_info::supported_clocks.
+	 */
+	__u64 shader_clock_cycles;
+};
+
+/**
+ * enum drm_panthor_perf_command - Command type passed to the DRM_PANTHOR_PERF_CONTROL
+ * IOCTL.
+ */
+enum drm_panthor_perf_command {
+	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance counter sampling context. */
+	DRM_PANTHOR_PERF_COMMAND_SETUP,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance counter sampling context. */
+	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on the indicated context. */
+	DRM_PANTHOR_PERF_COMMAND_START,
+
+	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on the indicated context. */
+	DRM_PANTHOR_PERF_COMMAND_STOP,
+
+	/**
+	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on the indicated context.
+	 *
+	 * When the sampling session is configured with a non-zero sampling frequency, any
+	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be ignored and return an
+	 * -EINVAL.
+	 */
+	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
+};
+
+/**
+ * struct drm_panthor_perf_control - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL.
+ */
+struct drm_panthor_perf_control {
+	/** @cmd: Command from enum drm_panthor_perf_command. */
+	__u32 cmd;
+
+	/**
+	 * @handle: session handle.
+	 *
+	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
+	 * It must be used in subsequent commands for the same context.
+	 */
+	__u32 handle;
+
+	/**
+	 * @size: size of the command structure.
+	 *
+	 * If the pointer is NULL, the size is updated by the driver to provide the size of the
+	 * output structure. If the pointer is not NULL, the driver will only copy min(size,
+	 * struct_size) to the pointer and update the size accordingly.
+	 */
+	__u64 size;
+
+	/**
+	 * @pointer: user pointer to a command type struct, such as
+	 *            @struct drm_panthor_perf_cmd_start.
+	 */
+	__u64 pointer;
+};
+
+/**
+ * enum drm_panthor_perf_counter_set - The counter set to be requested from the hardware.
+ *
+ * The hardware supports a single performance counter set at a time, so requesting any set other
+ * than the primary may fail if another process is sampling at the same time.
+ *
+ * If in doubt, the primary counter set has the most commonly used counters and requires no
+ * additional permissions to open.
+ */
+enum drm_panthor_perf_counter_set {
+	/**
+	 * @DRM_PANTHOR_PERF_SET_PRIMARY: The default set configured on the hardware.
+	 *
+	 * This is the only set for which all counters in all blocks are defined.
+	 */
+	DRM_PANTHOR_PERF_SET_PRIMARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_SECONDARY: The secondary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will
+	 * have the UNAVAILABLE block state permanently set in the block header.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_SECONDARY,
+
+	/**
+	 * @DRM_PANTHOR_PERF_SET_TERTIARY: The tertiary performance counter set.
+	 *
+	 * Some blocks may not have any defined counters for this set, and the block will have
+	 * the UNAVAILABLE block state permanently set in the block header. Note that the
+	 * tertiary set has the fewest defined counter blocks.
+	 *
+	 * Accessing this set requires the calling process to have the CAP_PERFMON capability.
+	 */
+	DRM_PANTHOR_PERF_SET_TERTIARY,
+};
+
+/**
+ * struct drm_panthor_perf_ringbuf_control - Struct used to map in the ring buffer control indices
+ *                                           into memory shared between user and kernel.
+ *
+ */
+struct drm_panthor_perf_ringbuf_control {
+	/**
+	 * @extract_idx: The index of the latest sample that was processed by userspace. Only
+	 *               modifiable by userspace.
+	 */
+	__u64 extract_idx;
+
+	/**
+	 * @insert_idx: The index of the latest sample emitted by the kernel. Only modiable by
+	 *               modifiable by the kernel.
+	 */
+	__u64 insert_idx;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_setup - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
+ */
+struct drm_panthor_perf_cmd_setup {
+	/**
+	 * @block_set: Set of performance counter blocks, member of
+	 *             enum drm_panthor_perf_block_set.
+	 *
+	 * This is a global configuration and only one set can be active at a time. If
+	 * another client has already requested a counter set, any further requests
+	 * for a different counter set will fail and return an -EBUSY.
+	 *
+	 * If the requested set does not exist, the request will fail and return an -EINVAL.
+	 *
+	 * Some sets have additional requirements to be enabled, and the setup request will
+	 * fail with an -EACCES if these requirements are not satisfied.
+	 */
+	__u8 block_set;
+
+	/** @pad: MBZ. */
+	__u8 pad[7];
+
+	/** @fd: eventfd for signalling the availability of a new sample. */
+	__u32 fd;
+
+	/** @ringbuf_handle: Handle to the BO to write perf counter sample to. */
+	__u32 ringbuf_handle;
+
+	/**
+	 * @control_handle: Handle to the BO containing a contiguous 16 byte range, used for the
+	 * insert and extract indices for the ringbuffer.
+	 */
+	__u32 control_handle;
+
+	/**
+	 * @sample_slots: The number of slots available in the userspace-provided BO. Must be
+	 * a power of 2.
+	 *
+	 * If sample_slots * sample_size does not match the BO size, the setup request will fail.
+	 */
+	__u32 sample_slots;
+
+	/**
+	 * @control_offset: Offset into the control BO where the insert and extract indices are
+	 * located.
+	 */
+	__u64 control_offset;
+
+	/**
+	 * @sample_freq_ns: Period between automatic counter sample collection in nanoseconds. Zero
+	 * disables automatic collection and all collection must be done through explicit calls
+	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will disable manual counter sampling
+	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
+	 *
+	 * This disables software-triggered periodic sampling, but hardware will still trigger
+	 * automatic samples on certain events, including shader core power transitions, and
+	 * entries to and exits from non-counting periods. The final stop command will also
+	 * trigger a sample to ensure no data is lost.
+	 */
+	__u64 sample_freq_ns;
+
+	/**
+	 * @fw_enable_mask: Bitmask of counters to request from the FW counter block. Any bits
+	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
+	 * corresponds to counter 0.
+	 */
+	__u64 fw_enable_mask[2];
+
+	/**
+	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW counter block. Any bits
+	 * past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
+	 * corresponds to counter 0.
+	 */
+	__u64 cshw_enable_mask[2];
+
+	/**
+	 * @tiler_enable_mask: Bitmask of counters to request from the tiler counter block. Any
+	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit
+	 * 0 corresponds to counter 0.
+	 */
+	__u64 tiler_enable_mask[2];
+
+	/**
+	 * @memsys_enable_mask: Bitmask of counters to request from the memsys counter blocks. Any
+	 * bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored. Bit 0
+	 * corresponds to counter 0.
+	 */
+	__u64 memsys_enable_mask[2];
+
+	/**
+	 * @shader_enable_mask: Bitmask of counters to request from the shader core counter blocks.
+	 * Any bits past the first drm_panthor_perf_info.counters_per_block bits will be ignored.
+	 * Bit 0 corresponds to counter 0.
+	 */
+	__u64 shader_enable_mask[2];
+};
+
+/**
+ * struct drm_panthor_perf_cmd_start - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
+ */
+struct drm_panthor_perf_cmd_start {
+	/**
+	 * @user_data: User provided data that will be attached to automatic samples collected
+	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
+	 */
+	__u64 user_data;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_stop - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
+ */
+struct drm_panthor_perf_cmd_stop {
+	/**
+	 * @user_data: User provided data that will be attached to the automatic sample collected
+	 * at the end of this sampling session.
+	 */
+	__u64 user_data;
+};
+
+/**
+ * struct drm_panthor_perf_cmd_sample - Arguments passed to DRM_PANTHOR_IOCTL_PERF_CONTROL
+ * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
+ */
+struct drm_panthor_perf_cmd_sample {
+	/** @user_data: User provided data that will be attached to the sample.*/
+	__u64 user_data;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1083,6 +1646,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
 	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
 		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
+	DRM_IOCTL_PANTHOR_PERF_CONTROL =
+		DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
 };
 
 #if defined(__cplusplus)
-- 
2.33.0.dirty

