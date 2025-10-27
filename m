Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B30C0F33C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FA210E4EB;
	Mon, 27 Oct 2025 16:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="LDG8AQPn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LDG8AQPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E950E10E4EB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:27 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mlm+4pnd8NvjT7tx2B9SzqBft1w5NLghahjQGMGIrT2er+e7ozSwqHu+PzUM7uxHIF1zGUSDydUpAbvY7anZSAHehv/STblfcZh57qscgjcb4rltbTTTlX75El8V+TNYhUItF896jHQr5EFcpiJyKx0SMHlFvZOK+tABCKEpZxXEZ1WmM3HailYLDQkdl0CulkEhs6lNa89kdgZMR7wZNQV5RwfptbexE3Ov9bMlp20oksLdswDhO4HJIzECQwU7Zu/HAdZLaXPFgiUa86KXYWwszrVy2fEvK7/U8DEB6crGx+qzlUTgNyHcNk6vjoOw98R4Zq5jXOR0hx5lVuXHvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=073dmoQyCBmUJ5GIUZOG2iMhR4Fpx1H+fasVOmFD+yY=;
 b=n8KPgI5Z1GusTxd5FMZNVECdajoxGv6x45q4Efxa+L0+Nhae4xCy3Ql/97rj+M2JrdYWHJxPmAeYIy0GD9SYotg/gg9e62beWTk82CYdJDTGW8w1zfangkIz2BcwiV3nOFlMlime84RyTRLqPDGl5sUebzU0yjJV+Osh/hjgQd9l4JwHdgguYomO7SDDTJkQaAYlOxv3KZ3AgTeni1clRijqwIs/QXSdAkf0W+Hu/D+cd/Qga1cwNA6BJPTduhwfR5kv9Aq+lOmGuFF6hGVCPWrKparwSVfiv7OTjlgn83PSENmnbkPCo0Y1E2U+tmoRLdE/OZfCu2YMGs9rdXDHmA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=073dmoQyCBmUJ5GIUZOG2iMhR4Fpx1H+fasVOmFD+yY=;
 b=LDG8AQPngIzS7LuPW3rHlB/edR9BVIEftEAF2r1jsUwDcNyCYyJc49Lk7wl0iwDWpQeKth1UPyz/jorAITK8hwSKSb2g5kkrQKlB70LMUyvhBOzQZRoZNw/408KtXabFH6b23zJGu/LCNge3ZVAEboggLaD9fKb19aZtnzfwzOY=
Received: from DU2PR04CA0152.eurprd04.prod.outlook.com (2603:10a6:10:2b0::7)
 by AS2PR08MB9941.eurprd08.prod.outlook.com (2603:10a6:20b:550::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:14:24 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::c6) by DU2PR04CA0152.outlook.office365.com
 (2603:10a6:10:2b0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 16:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10 via
 Frontend Transport; Mon, 27 Oct 2025 16:14:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBuvZDtc0KqFfGzehK2U3/NydguIFCVWb+jdxLA8FVOvxFN98ruD8OjrYkfBDyv3Qz84mwV7BQ/yF+lJdWeVHlXmRwQhCWYriwvnAb1mBs0UZ0bed+zZ4JZdnDOnGWE9n0Qz6zZbeQZ7yLyqCu6iR4GTQN8yU6TZglxlcuP79366vagPlkJR7bTodzWcN3ZGQ9W1Y7HZGpubxZLEjkO3mYYamEEqr5UZjQL1dVDcprIdkzIk6jAtYXyVr2CVz8YzCzD3vdQQ+mD/tlHSt/U3HyWTFDhushm9zhvq8TuqsvRX6J2S730nGi2RGjhleu280wQk/7x/MWe/gpHTaaeDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=073dmoQyCBmUJ5GIUZOG2iMhR4Fpx1H+fasVOmFD+yY=;
 b=IRDSrMk3+nxdJ0pkb5cPh08jFa8A+XekTx2XnfahymiJtwWCfUhAwHdlYcu8dY7LTDoxwAs+Q8gInHoXRLC/3uZv+65SH69HJGM+nZyGdArx7kUmm3bh+t0dvOX0h2VjOPjOilnDJ3ObWpVIstgII2JqwZ4k8eFdaaCNIYe6o28uBdvfdudfuM2LBGuf3G79jh6Lxf3/+Iyoe7t50QG0ldQ6xLodjyy/zl6Ml24QhP/Do2kgNkTryKtRvLrezXhmKLV6aqA+6v1kmY1uKYooNTk+K7EjlCbBi4jW3qb2L6WwTCQ5E7kuOJ/eAHYLDaAFHtgfaSvgrTSaRCsr+XudaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=073dmoQyCBmUJ5GIUZOG2iMhR4Fpx1H+fasVOmFD+yY=;
 b=LDG8AQPngIzS7LuPW3rHlB/edR9BVIEftEAF2r1jsUwDcNyCYyJc49Lk7wl0iwDWpQeKth1UPyz/jorAITK8hwSKSb2g5kkrQKlB70LMUyvhBOzQZRoZNw/408KtXabFH6b23zJGu/LCNge3ZVAEboggLaD9fKb19aZtnzfwzOY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB8498.eurprd08.prod.outlook.com
 (2603:10a6:150:82::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:13:51 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:13:51 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] drm/panthor: Add support for Mali-G1 GPUs
Date: Mon, 27 Oct 2025 16:13:34 +0000
Message-ID: <20251027161334.854650-9-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251027161334.854650-1-karunika.choo@arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::27) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB8498:EE_|DU6PEPF00009528:EE_|AS2PR08MB9941:EE_
X-MS-Office365-Filtering-Correlation-Id: c50ba9c0-8ebf-46a2-9eb9-08de1573e4aa
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?XYUUii27KXNgPp9OqxaH2SJGtAuXCcw5FKzeCBLrj89EASyJgESMMUzYLTtQ?=
 =?us-ascii?Q?VFRLWa0zuDrbUfYmAaJi22KHGF04JA3i9TXW95Tydvj3koQFSBM25gCtfecn?=
 =?us-ascii?Q?C//nY2wFYuTx+HcrqHwAfuSRLXu+Nu2fHf16irNOoOOxlN9rVy2t6/JMS9EZ?=
 =?us-ascii?Q?P8z3/CMCZvduDVImOC7ELpEcM5QAeF32v1J/09ajjyOMRcRKHlGDP38LwrOE?=
 =?us-ascii?Q?yS1USzm+Mb6t8GM/4VDbzFgcbLamUZmsGeiNdsDj69CTODNeMxST8Uo5Of7x?=
 =?us-ascii?Q?kvD1zoEgA5X8qsbLanxde/UpVjGTjo5EAbKJHpTZjmxO2k+7vXJFtSf9sYj9?=
 =?us-ascii?Q?LNFS8Nv4/B0mjVlfS56GcQ15Jv7kI/8Dq/lP2gNVv50HZumuXWB8I7qd674s?=
 =?us-ascii?Q?EVc2YSi6vJJQ5/UzVGV3iREjAWDLoEl2Jp4CX7uXOYz9Ukl9Y2lVprjWaZqF?=
 =?us-ascii?Q?rU0q1TFw+kdPJErcip+Ei7YSWkSwaA+Gf19/jLVQCyD7omqChuBokx6GqMGe?=
 =?us-ascii?Q?mvZYH7za43dv8Qsi96wzl71pL5J8GcL8JKjB/hYZCNdjJMJRsHatg14f04Z3?=
 =?us-ascii?Q?OGZy3BJKLfusXTZM8yLc7y5lnvQhRJU179JnK+DKcosRhefhoOzwhPSI1ysK?=
 =?us-ascii?Q?eAu33v7AHWGR8Lm1iJSaGSfPHry0gZOg+oeOA/jpIEFILPRwTOkFZDLUUf+d?=
 =?us-ascii?Q?LcnFLH//eIyCBileReJRD2Zas0bgMJ6QFfYy21xqwiA5NikD8+qjyz0gdsNS?=
 =?us-ascii?Q?w1I34yKbStxKLZ0BnRK7LBW40EL4ZK5Dzwg8i7MaD8E1CtdcFouYger+G0A1?=
 =?us-ascii?Q?qiUnYhIyUEiyFgrGjNjhb9aQyv0ZDyI+Za7//ptoEUK3EA5IZ//rl+xyWHVm?=
 =?us-ascii?Q?kBMfIusItGPO+glRUV4sf+j2OolovTsEgpFANn6dMZA5VQPCWGmlxn9gBhES?=
 =?us-ascii?Q?ZuFVhia9deI2gTSnGOv2Plt0ilOHr61uOmBjhIYQ7vfvNfWWeCoOM5K2U7wR?=
 =?us-ascii?Q?wkkPycQH40onlqiiaZgyrRO6guEFYtppDNaNEC0K3C7BMuwaVSGLyLVOkWf7?=
 =?us-ascii?Q?DY9ljMrKacEt6IR/bpYB9Jmyc7OSs1pqggvozG1K8r3W/BQKhQU0OtncIfk3?=
 =?us-ascii?Q?BidZXgzElsfCNohJXwTWiu2crRoot7uSaqX6lon3lrXEuCSz9bW1WOsCcS2m?=
 =?us-ascii?Q?LoNJCv/mWRMXDJNBPpBwe1LAOwDGj1dloPpGzCATA8eLxFKAWiZOPQ0YOJEl?=
 =?us-ascii?Q?8nFaWoC2jvSsFnFRRvKacpU7hvuvO+TQPaGUWjMTC0MqKbW2FFZBqT4RsEIO?=
 =?us-ascii?Q?4d8yLCCrZQYzeRUnjh+re/jus1d8RyxFWpl4R0Q/gLdyv1A7vAPOPwpxsKVn?=
 =?us-ascii?Q?KH04LNz2LdQT+sZG2W1VSPqLSYCKsdPkiCukGonIJIjolS+hrpVTY6NN2aGY?=
 =?us-ascii?Q?lzyhayl/Lnha5UPjuJFV4kK/2rng0Xxz?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 937d8bd5-e3ea-4afd-3bba-08de1573d0b4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|35042699022|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pwy7gu++13qIoQzORPUoSBxEtHo55cVTzLZFzSsSrA4OYj4ah9d3ObwU4t2L?=
 =?us-ascii?Q?050Nb3k1e6xQjT/eglGqoSYW5zeRTGAkgDtGnCom+fOuTPQ2gmJ6K3O3pwVE?=
 =?us-ascii?Q?XOFhE2RSRXoJD7gD3wAx5GCsbalZBTVsTZhzUeKX0vdMEY153FtyDtQcdXu+?=
 =?us-ascii?Q?wwfvgEaiLDduvOf9se0E3A67QhUk+jTmQcHmYyEuHNNrXcsGuE7QPJMd/fXF?=
 =?us-ascii?Q?jJ1kDD/W4YZqdk4iDM/KEaUaibEDyTfuysr4j5H4FISYwSBa7Q7yk3pM7pxT?=
 =?us-ascii?Q?/BEsD40KLEXmSMAwWrcyCWo5lZxrPpwHsLU5owUX/Y3rpyXxyK6fNMKyHldt?=
 =?us-ascii?Q?GRAKhanP0jcY62/wlSrZd2DNs2oQBm0L3HF84npcOf22J85p5WYXlKZl6bMY?=
 =?us-ascii?Q?1d5G+EicX7wDsGAcwMPlJheR+2Bhz+QNdc35KcIXNwr1/rYFPcCZ9ULmzYYm?=
 =?us-ascii?Q?doIHrniBwsxNHLyRHCZ79emSpTYoVu292hdLWSwtbL+PzY/b1kXesQv+DZMQ?=
 =?us-ascii?Q?JHQPi0aQcwaDV4kS1yto7ecoMDzxnF6K3X7QnvrdpbfJ+UYMiRr2+mQd6x+B?=
 =?us-ascii?Q?yD/5rF0tcpTN+rZ189orh66hF/lGYHsf6rlM/zsS8N3rvrTJv2KDgmTvky+H?=
 =?us-ascii?Q?tUGs/srifi/ickmYXDxLfSpauX1qvaVX+gUCBs8HjJ1n4Sz8mGNny9z/RGJ4?=
 =?us-ascii?Q?n2s37lD65atlURvNlQYmRbks/wDZ/yuX3g9iaGz70QoKweKw05tB00S5m2sC?=
 =?us-ascii?Q?bGNg0bvaZAagiqwtuQZVtC/7rcreHOE29lTMrwBJmvLXwbNm3PMvGKrIpT/8?=
 =?us-ascii?Q?FhxpqHC0eeAg5bASUV7/6CPdCYuywyhLoEQAi4jfUYQog59a94UlseOsgBMc?=
 =?us-ascii?Q?leEZGyYVbpQV+zTFCVw8siuemIA2kL5i9Gf1bNE2H2CpaUFVm/KjS3mElmAc?=
 =?us-ascii?Q?gPaApcZSb6C6kQ3+ewhBpnfaljta0X88Vs9IagrX/9n+GnIvQPCHsWMcJ80P?=
 =?us-ascii?Q?rFdaItzCMiggyMWjytVvXIR+mxMTLaRA1i4ZWnJb1x6ajpb4YWRyrQbmPagE?=
 =?us-ascii?Q?JiWijJNPIBgOu44dKKgkQsSVfMnD3T1TnIfWpdVgzPEMaA2jH9AxiXy612w4?=
 =?us-ascii?Q?nf8CEXDb7fhS7gtGOM2USE+XsOzjK+Tw4y9BhxamYm7JN2AeGhEPcrMZ5RM/?=
 =?us-ascii?Q?EeEOQ5wvrNiZENmC4mw8V2uRYmhgR4+vlAXk41PedMDwCuhBV2Gr6LWIYSNh?=
 =?us-ascii?Q?d4A2f1n+4I3UkClGAoRvhZQGJrEbxp7I3+j24lMESJntU4gIiyNuGS1biv8f?=
 =?us-ascii?Q?rrN7ggjkUvw12x31Gdxiu2hhs5F8YmehwDPsDjiRvbfNdy5sPD37Qwb/HR6l?=
 =?us-ascii?Q?2ksJz8ZbSQeCm9ewEYyq1QiH7VK8yria7z2gRWiy+mQWTrdOkzEWUH4GCYfG?=
 =?us-ascii?Q?H43ZCSnBEZQk+atg2Ca3jn/8c8LQW4go4SkeAwTk/LxP/lsd1OiY4fsf5xyn?=
 =?us-ascii?Q?ahcHO3CiCwD84H7Nnbd0deqp7bm2ZYuPb1mpvSQZxBJDJ2V5nsd54AWGzC2a?=
 =?us-ascii?Q?WNGLugyK//WzUvc3NqI=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(35042699022)(1800799024)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:23.3999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c50ba9c0-8ebf-46a2-9eb9-08de1573e4aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9941
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

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
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
index 2ab974c9a09d..9450a917e66b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1501,3 +1501,4 @@ MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch14.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 1041201d83e5..263d4a525686 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -4,6 +4,7 @@
 #include "panthor_device.h"
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
+#include "panthor_pwr.h"

 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
 	(((arch_major) << 24) | (prod_major))
@@ -28,12 +29,25 @@ static struct panthor_hw panthor_hw_arch_v10 = {
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
@@ -81,6 +95,12 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
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
@@ -107,12 +127,19 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)

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

