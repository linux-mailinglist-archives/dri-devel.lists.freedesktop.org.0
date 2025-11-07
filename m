Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACE4C40512
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:25:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0174B10EADC;
	Fri,  7 Nov 2025 14:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="haNhJt4J";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="haNhJt4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6240610EADC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:25:47 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wEMQE1vyb+8vk+FS1sCLmqZQVt5mDXBzeOdfvheoxVJNaeO9T0uVN/S7ZqtboD0Oylf8e0Xwroa4fVFwCNEPpJIO5wJGugXEShfBddHRrGC3rIo/THLIbgmnIgkmx4PGBJJy8Yqp73uCjdY23w26Azt/W7UJivnuPgf/c2APrZo0JX4f2atDOxtJliX6hgABvCbbh2100P1eMfoxK9ooZaW3YyJoqvbQIAGexDFZ1IAstgji4v7JLCHHbDLwu5kWai2NzxrT9WGPSLQyLIFmPAi6sgxQFDhJTlecfYMrmvL1bApIlP8+ur73ehFdekFViZ10+JwxyNuwF6dSP24abQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjs22j7Nj4y52dV3DB1qj3hfZ2YtvS5xIPW/STCpsfo=;
 b=Ut/YMEbKJ9OutddnC3PEg65Gy6jaNvSwa/Oc5v95ph97x+WztL3N0hp0UkSm9z99jsG/1AmQ/ACBpn6hiL1CorDzCMszXRgB8T0pq8Gmwy1MaBThaQl/c3jrmkiHAxbCaJQM1vDV593pSnkcgKr/821lMY9O/aHx8+vNDeglMBxb/4/m6N+NXkK9RLMDGDHTYfn23ffyJ07xIKENJPxxsGBqjhzggohhG0D3mt1kuNApWJDs2nsgj352Ya5YyDlpDr9jbJNB4XAVO1+zE17gMgcPQc+i0iXzShv77gL1Dyjpr5VzABPAsU2GGdIBnljTcsrVdZbvwRQZCQMW0Nd8vQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjs22j7Nj4y52dV3DB1qj3hfZ2YtvS5xIPW/STCpsfo=;
 b=haNhJt4JawLLSldk0QP9Fl6FjuxNxr4MvaxCfQZvKOMNoZ1xgK8m7xkXFanMmwNtWYiCHKQhYGeViBXXjFdQfMkx8YaclE0nXKMzJg2Wm7MogqAmlXojRI3jh2vURkkiUHxyLi4u+DvkWGZo9zqc9/IE7OVD8mZW+MpK5kaODos=
Received: from DU7PR01CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::25) by DB9PR08MB11461.eurprd08.prod.outlook.com
 (2603:10a6:10:608::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 14:25:39 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::64) by DU7PR01CA0020.outlook.office365.com
 (2603:10a6:10:50f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 14:26:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6 via
 Frontend Transport; Fri, 7 Nov 2025 14:25:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1qB5eg/+p6XDG9KFwFiB9+KM6mCCH3r4aB6XMvet6tLhwBEOSNI/VFF3VHbj2llMvRXiLTZBcUnm47bFmFm0XWmm0tq18jeZqYw6IIyn8gI5r3K8eKO9ULlf14WQMIUc+QUFAf8Bv44aBrxcHyE0I4fRfCameC/trqnY5UitpRvdvLe1FHR6RzKdjyYubnrLfm2PpJe272EkiHO8AsiIdjslFUF8XTkr5mSH38v5giLBnOOK5ei3gLvxMPzN+F9UrXgSrDkgtPbNmh5vr2jehfbA1s6nY9RUFY0ofNUIQD0i3/LNUWs9cJi+GGIQKD6OFKrNrEPDFafF27DXMHwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjs22j7Nj4y52dV3DB1qj3hfZ2YtvS5xIPW/STCpsfo=;
 b=EF+XPvjRw974XIfMJ1cCiFikZLGUH2su9EYGsodtN5im95Es5zrO4ni/3o4oYmdcSF8sr2vhiDcvSVlot4m53oGRSh8/crblPSWmqSoYyYcsxALUOZU5p2Pv8I0S1nu5drHZ1YA1UhQfpMUwlK9yWtoipWdTIUlbs7xWvzyku/+ANl2Oh0r6PQa2T+ruzeQs47r9dnkiO43j78byDEME1lJItZVheXAjuqv16bLSWoZjskBCpXAr9kSBjLHZuu2Zvpco+cjx/a8o4xJnxUvmiNAjbl1N91bQB5MVLl/ZJFiT3DFYg/3OUhlG7EiNT85k/KCqCVp4S4mjXrxUBw7UWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjs22j7Nj4y52dV3DB1qj3hfZ2YtvS5xIPW/STCpsfo=;
 b=haNhJt4JawLLSldk0QP9Fl6FjuxNxr4MvaxCfQZvKOMNoZ1xgK8m7xkXFanMmwNtWYiCHKQhYGeViBXXjFdQfMkx8YaclE0nXKMzJg2Wm7MogqAmlXojRI3jh2vURkkiUHxyLi4u+DvkWGZo9zqc9/IE7OVD8mZW+MpK5kaODos=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9682.eurprd08.prod.outlook.com
 (2603:10a6:10:462::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 14:25:07 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 14:25:07 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/8] drm/panthor: Add architecture-specific function
 operations
Date: Fri,  7 Nov 2025 14:24:34 +0000
Message-ID: <20251107142440.1134528-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107142440.1134528-1-karunika.choo@arm.com>
References: <20251107142440.1134528-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0393.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9682:EE_|DU6PEPF0000A7DD:EE_|DB9PR08MB11461:EE_
X-MS-Office365-Filtering-Correlation-Id: 16291aab-7790-49df-f784-08de1e098696
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?/lVnuS8LPZSADJ6Qg1vQ/j4lEaJmimnI9wOtURNCkdJmx7AJN/IvQn3ksRN+?=
 =?us-ascii?Q?eXctyUKLBtv2up4kPkZTPkomTV4Ncu8YihS2fLH/o/XWdJeI+lP0x45Il1fV?=
 =?us-ascii?Q?ClO9gYcnvPSx25KgzNbcxtFmqjroGcZdHjjlq+ZVR4/b7JgT6MU9Umzwm08Z?=
 =?us-ascii?Q?rcdKSQR9Dpb7uESGlk63q0NRbIZNaGMNO0PAfGFsYLQUM4p6HbpPPvQERk6J?=
 =?us-ascii?Q?Gi6O0UQwcKrcWFGq7dVUBiyccpnXj4JPzO/blAw/AhBsAlWoF1+dr34syaf2?=
 =?us-ascii?Q?awRHAu56P6xcHY1WPGx481Z1WxXjtCcjmSzdWM0RaT58Jt7BuGNLNvja3mN0?=
 =?us-ascii?Q?1b8rirTO+m5H21whVRZ6V89eU95PE9k7TyaKdCRQ/SSR8g++no4zPijGdNm2?=
 =?us-ascii?Q?nkeUCRmnrQHYMunmo3+MKTQhFA6zq0jEcwijuJb3fYLh/ux9I6MC9ORv6yh+?=
 =?us-ascii?Q?Yir69KuG98eYefiIB7M25kLFN9SfafFTCLJcA6dt49euZ2HLEvSL7uZ6SefL?=
 =?us-ascii?Q?5xsqv45kCbxBMOA/fCqpWjuHcE39Xu5UjTQ6UstHeLM4qialxLJUrn8cWnrp?=
 =?us-ascii?Q?ZsbA2BmwPpxyAwjD3uRSLRua6KouqtSVDsE6d9dQ/4N8EpLA5LlR8RurIm4Y?=
 =?us-ascii?Q?xKcECreMEMM2SKX21ggTcSzHdDDl1kNvAaYSM9TOzJrG70y1HqYVsdI+vQQO?=
 =?us-ascii?Q?jLMQHDlt8p0qEsaVYHElTo3uuMwla6ekzhWUXWhRkdmsyOralCiNSu6NZsZ1?=
 =?us-ascii?Q?Tk1G4JX6HD2gSpWPd+TlyaJxk8V0TPOdHjWTNi67emMBS0wqn87irwAWDlv5?=
 =?us-ascii?Q?dfRQDcV4Vhmq0BOEb26q5rA7uKlStqzIh4MHAuksf5n5vkOTlf8ANcS4jOyg?=
 =?us-ascii?Q?WQGfNxMZdarVzfBD/X+iwHgla3G55T9gpgIFyzXWr6cSHsrVz4zLUos2JhV5?=
 =?us-ascii?Q?cBasg8lrF7p//l2KmkdyoA39qIs3upVMCkuOwwo97rB+upQH1iSnvo4IIcOE?=
 =?us-ascii?Q?n6CgyJCnPHkColklPIhKkx9Q9BaFrKj2Gxua0e5H8McDK7VFwZgiXBF6oX1x?=
 =?us-ascii?Q?wYJKAd28JQJRD8CHbzyuktQJRi68+yH+X9PDx31ofJuQtFiJ8b6GeKgZ1vuC?=
 =?us-ascii?Q?XI0Kll2tyeS0oHty6C8te3ia6xENil1+/QOYcrfxVF0s0vkrBeb5ghpceW5E?=
 =?us-ascii?Q?9w3AW2EnTkUAwN9V3bsirxMnSH/XgpkAk7BsUiC2KWx/SO4sgHczb5yHsZ4o?=
 =?us-ascii?Q?Ickqj0DjIRAXv3LISB6UVLwdvciQ1Vxr01SP4Goy9x1xtVRNGQL+cptxNd5O?=
 =?us-ascii?Q?hdkMJ3fy+mVH5loSmKyOl0z9L+g37AbDPyrvKCnZ5SSNyn/wvuSIvC08joKn?=
 =?us-ascii?Q?g49xHleG0jf51IHk6Nhm/7owKbDIo94xyKpU6Dr+fLxG/9CW6t48Y/qPSlQC?=
 =?us-ascii?Q?rkDVw//2elPRLTxOLXLV9TUdMyJgk7zL?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9682
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a4423072-e725-421b-24c1-08de1e09731a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|35042699022|14060799003|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2c9NIM+k0fXm4k6sIyJq4ClNiK0gcQmjE54dXp+kocFE2qmc0G6+MLzNKyK5?=
 =?us-ascii?Q?mSQ2xOvhMUHLsq8RjzK+lZkk91LjGLRiScq8XV8Kn57Y5DOTmmdo42cVeiff?=
 =?us-ascii?Q?SX8ddUFeOFc9GjRohDLs5++WTmFfvkSrqBUt3tJAyO7/4FNgB30A0+yyumN1?=
 =?us-ascii?Q?ExrwUghZHF9N6aVdZ5QiDNVCSlBQcR0pyr0QGmy24hjS4FHFv+VTwZCqVKGy?=
 =?us-ascii?Q?HcmGHpqScPXcmTKSpeE9k7oByVQSILSzXZ2bfmLaPufWAgi+lOvl5MxbSTg3?=
 =?us-ascii?Q?bC1Sq/mnL6RM5q+cDlkizjXLhrdiTN44BVlhE4eNbXl+4i6YCDDOqXuI8VZy?=
 =?us-ascii?Q?dvvt5cFRJrq8D1sGtIT3gQxcs1vEl2Bcqp6Rzxkpmz68amnWWxDmZbKeQejo?=
 =?us-ascii?Q?4wrYdSvfzbx/ok9wVIBitwog6jqmiGipYLYISh6ni6qfhmRb7SOlC7VmYzwn?=
 =?us-ascii?Q?8apbKZCgWU5Joq1XgMWMVEQqJVtHgwCs8t2mgtDhYsIxqtHBDL59DrTQSnT9?=
 =?us-ascii?Q?jJLDJD2YtnooNxx7JasO9zA95juQB2ybCugXrYjhkGEDOz5WgREIDC0vnRlu?=
 =?us-ascii?Q?HRHRaOp6T6REa6X4oKvYwxYN9DX1DPCMMT2H/rVshmFMzML2tKzQvxbX9c/a?=
 =?us-ascii?Q?hw5anvkML56/CZ6n1yoMlptnuOe0yNwXR2/KsfTL5lcCFkWMG01N/GBIyqV8?=
 =?us-ascii?Q?uS+FR3ry8ZOMyjh5yD/4XPvRabwy6JpGafKFVpQUBtxXSrELqx5J7rOiXk1R?=
 =?us-ascii?Q?gpoLbvJrkCXKancbRwD+upTzUSY75zr8igSUFh1PmZWFawoXSO7ybXbDc9ft?=
 =?us-ascii?Q?WWuHoIPnzmGjTfllspmAqch2PttIvtEhq63HG9+vUZZe6uq1SHxmAM/qZ27B?=
 =?us-ascii?Q?1vK7YLRfzdN9t2ZEiVdywc0N4/EiPcw9Wj1iItZA/7VBU9V3nIL2pkqRZFDc?=
 =?us-ascii?Q?T7N+7xVGOFgXVJDG9x2EchKd50uH2qfD0hWVmZZrlwLDPvV3kC/FiQHCr+eM?=
 =?us-ascii?Q?5qVl10jUplrYyOz/G9SjjFV2LSh0djZ+g+pudbe5CRWTTzktqgC69AYCjLQU?=
 =?us-ascii?Q?nu+Jjeyw3qSMONFAFh+QinXwGg6p7LpK6VHe5oCZHPONZhN2pRyrwWONlGao?=
 =?us-ascii?Q?3N+itfbpdLXoBs2rjK+f29Llmy3XWRhU6J0RGQ2wqMdHEDXIzInJmnZOQWyQ?=
 =?us-ascii?Q?kxYzfhnWYp1Nno5Ddi+LPAPoX727noIJjUQlwAWODSogGxvSaFpwK6JNR0vD?=
 =?us-ascii?Q?4eP90+U8Z0cSWJkPGP61ytsyKVsxHmDFxqrEztF+t3aSTrKGIKRqxf8SsXJT?=
 =?us-ascii?Q?h7pD4cZm8RG6lhKnkZVnlXcOgXLrpHUjzWnl/hv4jq/gn0MD9G6AM0FVCAxa?=
 =?us-ascii?Q?4TViZ/rveC7NmgP819BZZx1fs3bdOVNrQpOE0WcdW8hxaaewn/w2ETNwxE3w?=
 =?us-ascii?Q?OajgD3CINIOhmfnUcD5VB888FV8ntw1jjh1/fThTW730QWEm/0a+7PtmnjjA?=
 =?us-ascii?Q?/gZl9+uEql3GohTZIvRTkxsjh5kYsL5Zkr51y3QxLuD8aefvpV3TyLgXbUoZ?=
 =?us-ascii?Q?uQ+fo4uctvuGLq+ruSQ=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(35042699022)(14060799003)(36860700013)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:25:39.3566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16291aab-7790-49df-f784-08de1e098696
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11461
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

Introduce architecture-specific function pointers to support
architecture-dependent behaviours. This patch adds the following
function pointers and updates their usage accordingly:

- soft_reset
- l2_power_on
- l2_power_off

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Restored mistakenly deleted forward declaration.
 * Picked up R-b from Steve.
v3:
 * Reverted includes changes to align with the include behaviour of the
   rest of the driver while enabling the definition of static inline
   function pointer accessors.
 * Moved the function pointer accessors from panthor_device.h to
   panthor_hw.h
v2:
 * Updated includes for panthor_hw.h to allow static inline function
   pointer accessor functions instead of MACROs.
 * updated l2_power_off function signature to void instead of returning
   int as we have no way of handling a failure in this case.
---
 drivers/gpu/drm/panthor/panthor_device.c |  4 +--
 drivers/gpu/drm/panthor/panthor_fw.c     |  5 ++--
 drivers/gpu/drm/panthor/panthor_gpu.c    | 12 ++++++--
 drivers/gpu/drm/panthor/panthor_gpu.h    |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c     |  9 +++++-
 drivers/gpu/drm/panthor/panthor_hw.h     | 35 +++++++++++++++++++++++-
 6 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd8..847dea458682 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -141,8 +141,8 @@ static void panthor_device_reset_work(struct work_struct *work)
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
-	panthor_gpu_soft_reset(ptdev);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_hw_soft_reset(ptdev);
+	panthor_hw_l2_power_on(ptdev);
 	panthor_mmu_post_reset(ptdev);
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 9bf06e55eaee..e6c39c70d348 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -21,6 +21,7 @@
 #include "panthor_fw.h"
 #include "panthor_gem.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -1184,7 +1185,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	ptdev->fw->vm = NULL;

 	if (!IS_ENABLED(CONFIG_PM) || pm_runtime_active(ptdev->base.dev))
-		panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+		panthor_hw_l2_power_off(ptdev);
 }

 /**
@@ -1363,7 +1364,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
 		return ret;
 	}

-	ret = panthor_gpu_l2_power_on(ptdev);
+	ret = panthor_hw_l2_power_on(ptdev);
 	if (ret)
 		return ret;

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index db69449a5be0..63ed8c461796 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -18,6 +18,7 @@

 #include "panthor_device.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_regs.h"

 /**
@@ -218,6 +219,11 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
 	return 0;
 }

+void panthor_gpu_l2_power_off(struct panthor_device *ptdev)
+{
+	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
+}
+
 /**
  * panthor_gpu_l2_power_on() - Power-on the L2-cache
  * @ptdev: Device.
@@ -344,9 +350,9 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 {
 	/* On a fast reset, simply power down the L2. */
 	if (!ptdev->reset.fast)
-		panthor_gpu_soft_reset(ptdev);
+		panthor_hw_soft_reset(ptdev);
 	else
-		panthor_gpu_power_off(ptdev, L2, 1, 20000);
+		panthor_hw_l2_power_off(ptdev);

 	panthor_gpu_irq_suspend(&ptdev->gpu->irq);
 }
@@ -361,6 +367,6 @@ void panthor_gpu_suspend(struct panthor_device *ptdev)
 void panthor_gpu_resume(struct panthor_device *ptdev)
 {
 	panthor_gpu_irq_resume(&ptdev->gpu->irq, GPU_INTERRUPTS_MASK);
-	panthor_gpu_l2_power_on(ptdev);
+	panthor_hw_l2_power_on(ptdev);
 }

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.h b/drivers/gpu/drm/panthor/panthor_gpu.h
index 7c17a8c06858..12e66f48ced1 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu.h
@@ -46,6 +46,7 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
 				   type ## _PWRTRANS, \
 				   mask, timeout_us)

+void panthor_gpu_l2_power_off(struct panthor_device *ptdev);
 int panthor_gpu_l2_power_on(struct panthor_device *ptdev);
 int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 			     u32 l2, u32 lsc, u32 other);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index b6e7401327c3..ed0ebd53f4ba 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -2,6 +2,7 @@
 /* Copyright 2025 ARM Limited. All rights reserved. */

 #include "panthor_device.h"
+#include "panthor_gpu.h"
 #include "panthor_hw.h"
 #include "panthor_regs.h"

@@ -20,7 +21,13 @@ struct panthor_hw_entry {
 	struct panthor_hw *hwdev;
 };

-static struct panthor_hw panthor_hw_arch_v10 = {};
+static struct panthor_hw panthor_hw_arch_v10 = {
+	.ops = {
+		.soft_reset = panthor_gpu_soft_reset,
+		.l2_power_off = panthor_gpu_l2_power_off,
+		.l2_power_on = panthor_gpu_l2_power_on,
+	},
+};

 static struct panthor_hw_entry panthor_hw_match[] = {
 	{
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 39752de3e7ad..64616caa6f05 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -4,14 +4,47 @@
 #ifndef __PANTHOR_HW_H__
 #define __PANTHOR_HW_H__

-struct panthor_device;
+#include "panthor_device.h"
+
+/**
+ * struct panthor_hw_ops - HW operations that are specific to a GPU
+ */
+struct panthor_hw_ops {
+	/** @soft_reset: Soft reset function pointer */
+	int (*soft_reset)(struct panthor_device *ptdev);
+
+	/** @l2_power_off: L2 power off function pointer */
+	void (*l2_power_off)(struct panthor_device *ptdev);
+
+	/** @l2_power_on: L2 power on function pointer */
+	int (*l2_power_on)(struct panthor_device *ptdev);
+};

 /**
  * struct panthor_hw - GPU specific register mapping and functions
  */
 struct panthor_hw {
+	/** @features: Bitmap containing panthor_hw_feature */
+
+	/** @ops: Panthor HW specific operations */
+	struct panthor_hw_ops ops;
 };

 int panthor_hw_init(struct panthor_device *ptdev);

+static inline int panthor_hw_soft_reset(struct panthor_device *ptdev)
+{
+	return ptdev->hw->ops.soft_reset(ptdev);
+}
+
+static inline int panthor_hw_l2_power_on(struct panthor_device *ptdev)
+{
+	return ptdev->hw->ops.l2_power_on(ptdev);
+}
+
+static inline void panthor_hw_l2_power_off(struct panthor_device *ptdev)
+{
+	ptdev->hw->ops.l2_power_off(ptdev);
+}
+
 #endif /* __PANTHOR_HW_H__ */
--
2.49.0

