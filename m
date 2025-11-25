Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD2C850C2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4609010E3D3;
	Tue, 25 Nov 2025 12:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="pDYxJ1Zh";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pDYxJ1Zh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEDD10E3D4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:57:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NcaPc+9Uz7exfPe2gjVy/x4NXGxSV90dlzFB8KQlYMcoOX8md9ggJQB8E+Na5JGNRwGptKwsLUzBEAXmk7yQTCsKbDQQwPuneEGZVsJWAT2N2IzT2YUQOxXNqsutlNhVDVF9vqJVRbx2a2hVxxc6lWIpB/Y9vZGpcN8NggVbiZ3jojH97mCMjJzoO9j+zBQgELFCQPZNnjDR9OXVFufTvyuFWgdPJeHFsPw1bj+bAMUfaVfJllqtc9E2fK/bfojtIyi7Eyv89t8kogWyV+MF3Kno58BqQpzx27XrJqx/vQyA5X659tbgLmVL4b0E/dKcHT3uBfLU/X6UVk+FKvbOLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMFPGt4N5ACZ5UO3NOOkC12mjKn+FZeeABbrRbdYPSY=;
 b=nJZXsPAH5baadePSljHMGKbAUhTldwgHTQL8AVwuvSmcr8VgH2geQuky7ON5S89Ikk7VVptwupYMHr08olkeSqkDafufwwZQOGeK3yr/kM/Nmvg7aXsXhpDRj0h9XwfhSg85a2OEtLPKEJg3X7Tb2bc6ZnIUMGArFqLl7ViIUKa7mIRiq6aPD/EkU4aXjAtf9FKCmF1WNF/pnMSrrnJagAjsTG8BNGXOOGzYbxP31bWivztt7/B0+pNDMTFAIr/mvQqTVAeZYu5h5dEEiwc5MdZ78/HvMYeQhDrKG+sQUjd5a9a1J8hcQyAsCtkRvdruHxz+Arw+NR2Jdne5XD7d4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMFPGt4N5ACZ5UO3NOOkC12mjKn+FZeeABbrRbdYPSY=;
 b=pDYxJ1Zhc86+F0l9o2ZXXUSkqxfRf/S6n6Z2ZSdr7wyn3WnyZqrtWQOM06Tbi+MpEYuTZ37P9Jxmq7jP/tJnJ+KBvPW60jF+6dBFaqXxG0uYGrW+t3i2J+t0PHVuy5MNjxw8EBE78XVpMw2uQErvDtK0SPzky9PlvIQ3v3sRzE4=
Received: from AM8P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::24)
 by VI0PR08MB11514.eurprd08.prod.outlook.com (2603:10a6:800:2fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 12:57:15 +0000
Received: from AM4PEPF00027A66.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::83) by AM8P189CA0019.outlook.office365.com
 (2603:10a6:20b:218::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Tue,
 25 Nov 2025 12:57:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A66.mail.protection.outlook.com (10.167.16.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 25 Nov 2025 12:57:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyNJBHtKox84Uv8Cc1A9nZpynM7jJaRdw7JHfl9cM+Y0N95r/QIvVagLSIwDfv9fKsX8u1AU5QTD1Y99/roF96WwVm4SU5T0C7g1LlGcqQR0a+yVkaRksWKxUhlgD1qbloHNcc+e/1WjR2ZPLqezmILhH72ZqdIVDbKTPWofc8xnrD4rkUpDXH2hLtySsGTV8YNgfxdIjVHlvN9D8EFmUY+PXzvmgvTmcbBrThPspd/QXLkN0/Th5l4BiV3MfY/zcZX2nIrE9nkOWYByVnnj3zeRgapesW+McDQCHvqcTcvbzo292dNKflyyTALCSNK2HCGTv2vtem45oa/uHfM41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMFPGt4N5ACZ5UO3NOOkC12mjKn+FZeeABbrRbdYPSY=;
 b=UewIRgjHQTBKtP4DyNxL/CmJUNqc2vn1L/acmjzY6cxTRgqdGkkfCFbIJGbKh7m4vH75ApEnVFDZzvq/3bHhscAWhGgKZ9ZnnXI6uOjgSKCclV+gViiCrDUeNvdjJYl77lEyychWkxuRrx+9Etf1MQwWrgb5QP+rjvIswzMLVH4EM2IUZfWhOc7NY8DxsduPFZLAd8DcvDjgz85qaYdYPKpSldVj5JN6Ge7DhkIWECiCVrn1MeSF8pGpaiQ0tzSk+TdI38Sx7SpRARWy7R5ECwFtlAR7yM+dnPLjxKq2CzlPplmqlXq2ldcm+1cHs8EI9RnpzWBEtVmgtRJDWJOBmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMFPGt4N5ACZ5UO3NOOkC12mjKn+FZeeABbrRbdYPSY=;
 b=pDYxJ1Zhc86+F0l9o2ZXXUSkqxfRf/S6n6Z2ZSdr7wyn3WnyZqrtWQOM06Tbi+MpEYuTZ37P9Jxmq7jP/tJnJ+KBvPW60jF+6dBFaqXxG0uYGrW+t3i2J+t0PHVuy5MNjxw8EBE78XVpMw2uQErvDtK0SPzky9PlvIQ3v3sRzE4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB8937.eurprd08.prod.outlook.com
 (2603:10a6:10:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:38 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:56:38 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/8] drm/panthor: Add support for Mali-G1 GPUs
Date: Tue, 25 Nov 2025 12:55:48 +0000
Message-ID: <20251125125548.3282320-9-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125125548.3282320-1-karunika.choo@arm.com>
References: <20251125125548.3282320-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB8937:EE_|AM4PEPF00027A66:EE_|VI0PR08MB11514:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a73ceb-675d-43c6-3255-08de2c22286e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?WZTc3WAowDl3zXy4d3AvceFUXZLIjZ27YRImb8x3BxQzJ+McLLKlO45+ZgfL?=
 =?us-ascii?Q?RJs90slUhERc04ttE39Et+T+BYthBZ2g5aVL6NCg3qnghtgvVIGwLZeWKjo6?=
 =?us-ascii?Q?N4ulZdH9bG5aZi+tbBktpa2Okzv0/2l4l5qeoPpUJP5gd951bptXBvensy7V?=
 =?us-ascii?Q?PlI2ggPRj3hAKuMPcz80Nc+U8jMNRidqc9Tjdjz2mvUydiJ/qjmy9yWZ8d6q?=
 =?us-ascii?Q?dxbTuWAqL1Bg49Hn1sUSYHMMbAfUOIwCXxm+sMINQGfHGgnTCzrsTQuS4tBG?=
 =?us-ascii?Q?NL5PtGmdqs/wNYAtxf0WTO9uxL134YWGXq7lE02IJM93MbosYUXOiZwl1zoV?=
 =?us-ascii?Q?ayAVJroSyWIBCTH3n3frT+kHj0P3qDD+s8QJPsiTRMtNbmF3pR8EBf4V83iu?=
 =?us-ascii?Q?pXXT42eynw0BM3+eQJkXhYuO4VlpYVilQ5pvR/cOzH0J0z7ZDOitGOsFMvua?=
 =?us-ascii?Q?TRwvkioZCE1979o5m0sucKGkIbc3DSpoC2Hc9o0BNQ0bWfzdtxfrhoe13ROW?=
 =?us-ascii?Q?T9zUPp4a9Ykk4tX24xh6P6g76fQtR4GNIzUdkVSVM2Zp/Sr2t2CS0sIhyEa6?=
 =?us-ascii?Q?vT4nYh4KWX1G+c91RN1CE7cz19S2E+VuyqsAbZO9DLyksqIueZ9aA6W1ywTy?=
 =?us-ascii?Q?OLqd8jZxzgkNuxtAHa/LZ0ujfA9R0Equ+tjKRBqkvvSm8Kvx6qXNdMCjLXLk?=
 =?us-ascii?Q?5PVFpJsnjeE6XVRVZX4PFM3csikglbpldHewNPqgUKXTaE3OCQKn6dCT1E7b?=
 =?us-ascii?Q?koG60uaWH7GdnrXbgvXcjChE4WT6OUNNLjzY2Y/IYJVrkahse5YMidtjIAkl?=
 =?us-ascii?Q?hyfUDBLfnR8N+N/ptMx0vguCiyPf2Q0NvVVbkd1gHq8p3dkzMx3Sf4DOkawv?=
 =?us-ascii?Q?U++DW/r3mrKeFB5OjIkGn+W4zKnFUUqhS1kueWKMo37UPp01zxfhvYvHox0a?=
 =?us-ascii?Q?TRuWdWBlklx7hPHKbfmkMI4kcDQA87dWJunYjTcLHoyvgYAnQwgm/tjsHsGr?=
 =?us-ascii?Q?Bq4WaWiAlp1S06w1AWIkFPQcmzfeSAPnVdgC1QUwpF+yms+htwhGmuwT54ir?=
 =?us-ascii?Q?9CK2It/nF1Yb3/k8IBogasQ6NBEXmcyho8QiGpyFqwBi75ZUqzvsaIXq9lMF?=
 =?us-ascii?Q?fbpuwhutKVvLN8oJPqwUwqFa4rc5u1+J2w9jPp0slveXN44DB/hLBSAjvkeg?=
 =?us-ascii?Q?ePFdofmnju+cVMr3PUwi9l6wnEepk3OL+ayDnUOVTZFlmiPakelV5ijKQIZw?=
 =?us-ascii?Q?Qa7nvHMVAbZNqlUu7y7dyiKm3AIJJdk2YkR9m86cLtB7lzrAlCq5pBwTfU7D?=
 =?us-ascii?Q?e5kLNRjakSnSW2u1xvP6lRAzshZo4AAq0IFzAybP9SPSG3XBVALQCJ/gK3/0?=
 =?us-ascii?Q?KjJNJhGVqxbiAU8DAleZjYeTSTBhj4ywrf0EPWflWFDs3PG8fiwoT+o8wmdj?=
 =?us-ascii?Q?lcCBvKzA/2RnLZVeRYoK+aKd5UZdXrno?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8937
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: aaf4f314-e7e1-4750-40de-08de2c221224
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|36860700013|14060799003|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NxmAzCveAIvbZBLZKt7mgGnHdqL/K9iRPuX1turZOuE7+nnsSJQh+QIIbtVI?=
 =?us-ascii?Q?Pj1ur9yJDHYUN9Gd3nZyaFF/SSRAl88E25HuZ53Pcor2YzL5T/uRQBzwjUDl?=
 =?us-ascii?Q?CutEyEStsxJWc747w1R/3d6HiY56guIQ6pxphyiBqJ1F4+4R86j5h0ONyWh+?=
 =?us-ascii?Q?cHue0dhYVr2NTrpnajMLWHSk7IDlB5N5rZ0op7QWHz5adGbyklmhDwZwKaYf?=
 =?us-ascii?Q?alANtQiqafeUz+ZoL0S0oI7JwldZBXmP3H7BB6dRXv+5a3F9QKgENEtBLw9r?=
 =?us-ascii?Q?tv3E3Zoqq1C8Od7PiWB83HJsHa+sirQOlZ05xFn20azkfe1N2uNlT2dyTqe4?=
 =?us-ascii?Q?26Sfbsdy5kSJjjI80eynmPRvRyqphdRffaunh2Yqkw3fB70DoyVh8+BZROKM?=
 =?us-ascii?Q?ocn3W7Nzd/x0mO7MY0pDi9FjD6tkS/UR2etZ+qmydeZeEI5w7Rl1muodbY+g?=
 =?us-ascii?Q?JaOrRTNW01GPCkl+gEuqVMJdPLo0rYgn6JZfArDi/azQhBc534MdyeF8Dy/e?=
 =?us-ascii?Q?mCB0Y5F1dVvx4j+fG59KItqLQvqbPs+J9A7CG2CR4zkxKMy8PdISeCj3521+?=
 =?us-ascii?Q?tTcsHIet3BhsEEq6n9g1TCug1tdOsYDsuiXjeN3ECUJsgHk7Led60EenW7Nw?=
 =?us-ascii?Q?0raDFprbHETgkAajcDlvPP+eaXPIaelpgF25TU1h3/YrZdwAINVImBs24lCR?=
 =?us-ascii?Q?rh5qrmc9rUoX6zMiR4eqtyN0sts6OscsVoOOARvONY3fPBawYzfbbBG4yqvX?=
 =?us-ascii?Q?aPbdH1K98HRNP45weJe707oiJ0OOSylSVY5+riKZMHJGsEpXDYwdB6sroK8M?=
 =?us-ascii?Q?Hh8JvEUOgQcBwOXY7vsFKgduN/Tng1FvdVgospUzXJhlIzdZPBIZsFayvOcd?=
 =?us-ascii?Q?T4jDdtHLL92928cnlL6WzKh29wHmooOuKi8WkC2tfpBWmX48XX3d0E7EHD/9?=
 =?us-ascii?Q?7zGvC8QPPh5EnM93KPNh1CqZSOgGDUlyQlYDNvwcpG3I1W5o9TuCopdEgl+L?=
 =?us-ascii?Q?LXFb/yGjgc62xSEOkSdOUK9Q+phswFFhBLP4+SEhGuqz3SJgXMdJckOWFACb?=
 =?us-ascii?Q?tu0BY8Zvd9SgBN4npqNzp2OSfKk+K9mt2sjzbMSNnPHW55JrWvT5Ihr4UeuF?=
 =?us-ascii?Q?lUeqcN+6kzZ2DAnyPZZ6eKU9FvJsxBCmx04OtroiaO2+UpD3Uqg3vMo3rBW0?=
 =?us-ascii?Q?2utqSNyqD8LrHevQFF5ObuvZJDtYf8L2G+KiXPtQnRZ/NZFbE1ktBWETmaMz?=
 =?us-ascii?Q?ZJdLnaC0m7864TRjccWz6B85q25G6fKY3Vkqg3W/pmnoAD+q6yhcPcn8m8tb?=
 =?us-ascii?Q?EqNX3t7AU3pxDAgn7GuMsHX2LahOEDeDexkXrnXgcWU1RtUcqVVZ9m3a0c/k?=
 =?us-ascii?Q?aJ9VUxhOxkp17CngrANsvDzkErdi1rTnsn2aIqyloFjPfCs8oaL6GJngqObN?=
 =?us-ascii?Q?5cFNH8CPQp6DVWL028LL9mJGbLUliX+TRJuMM762iconJk6hJU7JhjWBeBqp?=
 =?us-ascii?Q?EodjYo7TWNzorIxYDcNnQG0zbRBBsBZlBdys1rbR41+YHqmgXwfzSKza+KDy?=
 =?us-ascii?Q?LwqEPi6fv5i+dWXOmeg=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(36860700013)(14060799003)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:57:15.1065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a73ceb-675d-43c6-3255-08de2c22286e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A66.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11514
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

Add support for Mali-G1 GPUs (CSF architecture v14), introducing a new
panthor_hw_arch_v14 entry with reset and L2 power management operations
via the PWR_CONTROL block.

Mali-G1 introduces a dedicated PWR_CONTROL block for managing resets and
power domains. panthor_gpu_info_init() is updated to use this block for
L2, tiler, and shader domain present register reads.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v3:
 * Fixed some includes.
v2:
 * Removed feature bits usage.
 * Check panthor_hw_has_pwr_ctrl() to read the correct *_PRESENT
   registers instead of reading reserved registers on newer GPUs.
---
 drivers/gpu/drm/panthor/panthor_fw.c |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c | 35 ++++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0fb33489069a..1a5e3c1a27fb 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1503,3 +1503,4 @@ MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch14.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 5d220a0e2c22..87ebb7ae42c4 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -6,6 +6,7 @@
 #include "panthor_device.h"
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
+#include "panthor_pwr.h"
 #include "panthor_regs.h"

 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
@@ -31,12 +32,25 @@ static struct panthor_hw panthor_hw_arch_v10 = {
 	},
 };

+static struct panthor_hw panthor_hw_arch_v14 = {
+	.ops = {
+		.soft_reset = panthor_pwr_reset_soft,
+		.l2_power_off = panthor_pwr_l2_power_off,
+		.l2_power_on = panthor_pwr_l2_power_on,
+	},
+};
+
 static struct panthor_hw_entry panthor_hw_match[] = {
 	{
 		.arch_min = 10,
 		.arch_max = 13,
 		.hwdev = &panthor_hw_arch_v10,
 	},
+	{
+		.arch_min = 14,
+		.arch_max = 14,
+		.hwdev = &panthor_hw_arch_v14,
+	},
 };

 static char *get_gpu_model_name(struct panthor_device *ptdev)
@@ -84,6 +98,12 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		fallthrough;
 	case GPU_PROD_ID_MAKE(13, 1):
 		return "Mali-G625";
+	case GPU_PROD_ID_MAKE(14, 0):
+		return "Mali-G1-Ultra";
+	case GPU_PROD_ID_MAKE(14, 1):
+		return "Mali-G1-Premium";
+	case GPU_PROD_ID_MAKE(14, 3):
+		return "Mali-G1-Pro";
 	}

 	return "(Unknown Mali GPU)";
@@ -110,12 +130,19 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)

 	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);

-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
 	/* Introduced in arch 11.x */
 	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
+
+	if (panthor_hw_has_pwr_ctrl(ptdev)) {
+		/* Introduced in arch 14.x */
+		ptdev->gpu_info.l2_present = gpu_read64(ptdev, PWR_L2_PRESENT);
+		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, PWR_TILER_PRESENT);
+		ptdev->gpu_info.shader_present = gpu_read64(ptdev, PWR_SHADER_PRESENT);
+	} else {
+		ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+		ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+		ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+	}
 }

 static void panthor_hw_info_init(struct panthor_device *ptdev)
--
2.49.0

