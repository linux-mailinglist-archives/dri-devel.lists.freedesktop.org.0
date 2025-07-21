Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2625B0C266
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E6310E503;
	Mon, 21 Jul 2025 11:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="IUppSjcx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IUppSjcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010018.outbound.protection.outlook.com [52.101.84.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F4610E502
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:14:33 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Lt5SF68ZZ34N9v3+vw1kMjQWJBmH3vxWF43SnonmJYdqJaVvTF9QbNCETsI5qjNDnHNnDSfiNvhpzOAEFepn88xYqQUiVPBUIS4AenZI/8PzuP28SgGzf2mjyDQnVnoV+PAMTVEEQGa4DEQSM28kBdvzKkKlV5BLAodFi96j7jXnD+X1iK8yyFUj0sxjoJSGWETK25mX+DtCk+XdAdCR3ihitn4Ft5HtHuL9IW46eu5zbddq4rEX5ZgslfRFoxMG0uhaDLASasmJa56xOuHaiSybJ4A/VB1HxMVhNSLcLOWE0k0ICFDwYoGXU1zDHalpgyAMTM4mmmBlG2Ssv6cOSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM5+fugmiQHI7E4QjvxGZm2+KpAK9BiUHTWRJ5WDZxU=;
 b=YMvcHBE96wfa4BH2A/9gvq/DuJDkBYIq699TiDFXc2ZRRf2AjUoXV9AmflbL+eDekB2h2QbVYhfLh/7UaJRtkrb2YCKYcDzPsuz7P3ewNzT1OHt5HrDiEuy0nZJEEACPoQ2x/nAxga3gxKdDv7wmnEJuoOa2CUiIRmXZabEa/GU83Lr+Lwdm3EB6wR2Tc67UyfYaMUpTd7DGeBo4iO8GYGkclXAIBlObApMJrgoitPfDEqQzfWNPDixKuhWu/ofUllkU3CnjW4Fk6gokKcH9MWFNRgTRh/1qA2f3BwR6o59nMxoqj0hLrEnIvtPV1gO4jR7iGJF0Gys8e6FscLR4XA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM5+fugmiQHI7E4QjvxGZm2+KpAK9BiUHTWRJ5WDZxU=;
 b=IUppSjcxKWnYdWKAaWLGHrM34Rdilc0qzcUGOeKd/gQggEmhS3FVZeB3Wob3sDq/ztZ3dBxKiEiXlYmyJrYzONM4Xz1qqV0Tr8GtQ79bFxEmomCs2vB3QlSFQ2xP+NGcxtatfbABcEjOSYcG8nTzkorUorlnXsbEW1vZgnh41Ds=
Received: from AS9PR05CA0272.eurprd05.prod.outlook.com (2603:10a6:20b:492::25)
 by DU2PR08MB10066.eurprd08.prod.outlook.com (2603:10a6:10:492::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:14:28 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:492:cafe::51) by AS9PR05CA0272.outlook.office365.com
 (2603:10a6:20b:492::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:14:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYchCRBefqNJdYxHkDq1hqooU7LS327YvDuil8LDqXUKS4knTylfX6wXApCyAM/PQRiiLgjRoGzYycwUPK+gpzy+dY5YJnPgiqDcFK+Jc3lpgA48m1Ieg6loeeCJdxMV8XLJ+WXstJyJxqZE4M6vhHgitArMEfM9JkQ2FIw00Dib4sK8Kxq0dgBhDIcBbxFTMntkDI0zfZzGSPew624Fy5YZUfsk7QKrctmhwxfZTymtxsKcVDxWh75oFdxYvqyOERf8DWMiwuxvhCyG8bKl/uxGrSyqEH+7wcmFvc6FTf++aUV1au4P5bweHfuoh/yw4/QeheZNUmuT/0TE3UU6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM5+fugmiQHI7E4QjvxGZm2+KpAK9BiUHTWRJ5WDZxU=;
 b=yoG5JH37iVW+EP3nM5ELBXk93AH6YTT5JcrFt01bQ9xlSRwoSyEPUt3eu5aEwjUCe/V7gLwSVZvRG0exuFztodm9EYuaEavO3eDrUnszClsTb1d1aoEd+DWatd4E57nfhLtd9jJb3X8duFPX3heIqP2/eTk2s+grt7iFm3nis86MEfs2D4twpM8oa6JMRzQMurxBZ12Oaf7bAk+BrUFxrOX5hl+S4daosloHbysWaSoqXTs48uqRKYTKBc0pIb29HYX707TaE0TlkpUwwJlZCYmVNPGB3FkP6IhSZUK0xyFJCKbu+m/XrExx3QqmiDtcEVyjs6liQZn6NZOqrujRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM5+fugmiQHI7E4QjvxGZm2+KpAK9BiUHTWRJ5WDZxU=;
 b=IUppSjcxKWnYdWKAaWLGHrM34Rdilc0qzcUGOeKd/gQggEmhS3FVZeB3Wob3sDq/ztZ3dBxKiEiXlYmyJrYzONM4Xz1qqV0Tr8GtQ79bFxEmomCs2vB3QlSFQ2xP+NGcxtatfbABcEjOSYcG8nTzkorUorlnXsbEW1vZgnh41Ds=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB11012.eurprd08.prod.outlook.com
 (2603:10a6:150:1ff::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:13:51 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:13:51 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] Add support for new Mali GPUs
Date: Mon, 21 Jul 2025 12:13:38 +0100
Message-ID: <20250721111344.1610250-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0343.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB11012:EE_|AM3PEPF0000A799:EE_|DU2PR08MB10066:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ee6026-0ad2-43af-7405-08ddc847c19d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ZdDsc7nHjSAQZ9Et33Mskafoyz5dbBjZ3J1nvlq4Cg9UIHKFc0Bo2QjhORrr?=
 =?us-ascii?Q?3VCsPyRmSIBJZufpwSJoG5T/+ui2kAf9GWM2Ua7WQys6vKVf3VUj40CG1DkW?=
 =?us-ascii?Q?Ct4zSz2TPS8tSmo2SK2bH3hDl57oanFbNHGt7Z33JZUchIwztyWPaB2lOm50?=
 =?us-ascii?Q?ZJLFBQBzGniIQWNgjJmPyGLlwtq4oRpVpCehuP8EnuXz5mkTPjr9uR5iDlJh?=
 =?us-ascii?Q?f6vHg06BOaQG+yVSwyWQGqix8sFTHH/f2E0Egcxr7G2GdqBFK68wWiwZE42s?=
 =?us-ascii?Q?64XFWClRXRx/Xk/FLO1/O5oy2f9bOCWYA95988AEv7aHVC7G0O9IC2jwshhd?=
 =?us-ascii?Q?z+PdhRzISdFP8FIucpWI7SlgANomWHvBLrUnqAvw5TeOUYtJat8INtXRGR2E?=
 =?us-ascii?Q?fUlXu5NB5iOmGaIOjI6nnBvFNUyvV1NAdaLny0jDnJ0dsw0u5DTA0LN4488q?=
 =?us-ascii?Q?CpzPEL0hXrr///F20tMYD2BuPMNNAOXOkPyNwFhk4DG//v7YHgs8nEANMfA5?=
 =?us-ascii?Q?QzCOxVAGuzyjqeJFtjpJVnlyak/BfZ7knBDsmhXN8j3az7/yBFdb/hfylwkj?=
 =?us-ascii?Q?MRqTQfOS1rSKO2YGe8VyEZqU/qJWG8kQdhbC1nCu9IzadQSX0BH3jllR0yoS?=
 =?us-ascii?Q?KfXKhcdbTu78BzNJ+SnoASRgbXI01F1BT5J44UvFJdAp/34ibmTfd2PvkXGm?=
 =?us-ascii?Q?crXCQ+qXzgb0COqActm2bjNTaqw/PSjWNH+16tUtmrSRPGFrbkpfJMQPb0fV?=
 =?us-ascii?Q?0u8AKxMgBp7g03zslQEL0PgYfhoaCxMEBbZ4QdlmNT6TMvnjwWCBcgWQXdgC?=
 =?us-ascii?Q?vQeBsMsQwzEuKw4Tlolxcl7F5Sug7KCVQ/vopwMTRIa7v4We0gKAX16KPnPh?=
 =?us-ascii?Q?LtoX4TfvNn4WHkxq/UMauMa1T0KsTwap9dQR+vUGZTxvelxDT8plhS9BArFQ?=
 =?us-ascii?Q?MNgfU89EjO6AltSQ5UYIWHr7+iDyWOyNH1GTnPmHANTaBZBuaMcqhO3SAgbt?=
 =?us-ascii?Q?DayVYoxktMevSeuTTrXRzWhT/OZWRJ77/d28DJkR0DoeOq0lGzpCGeowrACl?=
 =?us-ascii?Q?FaAC51siy0af5lkXf5wDgyQpM+wBkmcuILgnmVGFyZydxyT5VxpSI7EhBPUQ?=
 =?us-ascii?Q?vwmhkZEaq93bB4JBuGgq00cCWy4CojhcehMWPiGR0xEOFDKZMdNW9O2ZoBvz?=
 =?us-ascii?Q?tdaEB0wqmgAvYtMeT4Q0WNih3o0SMm+DMYMWXYePbP/toP+oLhhH3phrs5TX?=
 =?us-ascii?Q?lF49RZ9TDO5itO/HBTsIYCGWJgEwqxk+QtZM9zViSu0NoKyGTs0D8gN3+Bqh?=
 =?us-ascii?Q?CVN3M2qpYF1epXJXTyVAsIUNhVsKJp2epiGA2GMxyO8jfWgvFyfnS8H36RN6?=
 =?us-ascii?Q?HhMEKQCZnYId4ClKudOtv/3zW1XTNGOJ4TysYzUYdpSFOz4PvzRxLkojfYkV?=
 =?us-ascii?Q?2QuQikdkzqc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11012
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 436924a9-dd08-42e8-dba6-08ddc847ac20
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|82310400026|35042699022|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ci1jeCKpUHF9gnnHmODxbhEuw8JhwtlsoT6EfTZ4dmy9yD769gYAAD8Plqf2?=
 =?us-ascii?Q?zsy99dIwHqVJsyiXs10iCe8hTml9kBiVxxYY3GUHjfpCT5M/WCc8fOwdkRnq?=
 =?us-ascii?Q?A5ekTSHjkz1TNrEZxuctZOVFipAxbFmgP3Ksgsjo/LfxIUVjUSCsuHMzC2rs?=
 =?us-ascii?Q?o8ck1oTD5cVejRys8JNlpdpAYRWfH6eaA6RWZ4RXEjQyHycMb9ZUGY1ph7oN?=
 =?us-ascii?Q?shY5cOHxC0aXeX4+feWkmbJSWJVpyexHtPwqnbZBmtldWenLaIrQNHX7wMSK?=
 =?us-ascii?Q?8zxqXJSAU+C/oVkEGXYD7hiNHUjzw0ziYIOdxQnzD2d75jDsAn+VBUlDV7GL?=
 =?us-ascii?Q?Q6IfZb//ONi+i+RbxWYYlesRxyfTinwMZ4F2b4eTUyBUjAu9hqZsPVCpxN1H?=
 =?us-ascii?Q?rTC7qIHMMzJgv8pnDkeKcZTCH6S9mh9VGyzSADhJypWcUA/OSnbcYsf3nRbL?=
 =?us-ascii?Q?2Q64ev35UwNIFDPJ6ABW4dVdZHyXPj19E6VUllBcS6ZlPZP8q2CMxypVVBdX?=
 =?us-ascii?Q?wty3hKkGlpyxTHhVOQyAQZHQh+QC+vqsHXXjoDtY5uSR7ZvNVCqs3aHU9Kl/?=
 =?us-ascii?Q?nIMYZQs693NwdgJSJEC4/yrW0fbWoQWRuLzuApKCD8nF4a8dnBMoVNKLKhAm?=
 =?us-ascii?Q?dIa616r6acCdnJBzP5VFBdRsp4ZY+WdKXiFpqzxHaujehLUvi0ZmaTdVut+3?=
 =?us-ascii?Q?nKzrySSAO7uD4DiP3Sz8mJK8Topg3xb2jQ5RdQ7f4LnOtigsq3WoHwKpN6l/?=
 =?us-ascii?Q?B/aSnGeceXwV/L1wJasJvwQpUwJxqbxMbU3NmvHeHwwO8aV9gD9OMfeJj/Cx?=
 =?us-ascii?Q?e65YFcsIqVR+Uie+zTDNjEuHMHoaRckTN4U89UWT06OOEz5Z03Q3ZfvcRKYl?=
 =?us-ascii?Q?DSAedmVzw6tVXdWWaqY+2ufSLVohtZzxR8hffYvKmboPcl5TFbrddxhZYtY3?=
 =?us-ascii?Q?t2rGdnYebX0WTJ1txuoWlG+lpq21AvwdxX82EbsO7teiZ8w/1o6phgP+UZc/?=
 =?us-ascii?Q?cGHrAaLDjM9TmjPaQvrgeEOiv+Ior/pS/Fy+eaQUfC3Glj0c3N3oGfuf+X35?=
 =?us-ascii?Q?qXs+JH4GV7IIiYkEB0Iibmk6e3l5513Tlweg+DJmgNwCBzhWNTB/pa7SDISU?=
 =?us-ascii?Q?jHPpsJ5jeOvW6uqCzhtA+dh1JC4wee2OX8OxPItDjloWBm9utYewcWjkC9zS?=
 =?us-ascii?Q?ad/yc8OnO4P7WBYQN5KL4ZKNh9OTtDYEsVNptfoXKoIPwiH5lxhnq0ElUV6K?=
 =?us-ascii?Q?U5uaYJBxJrg0XYnopG2Q8xUX/fbgtiey3F+Nzijk0MPQgE3lQGrgtxchvgbn?=
 =?us-ascii?Q?il+46ufDlQECFAP62tpv0wIKMM09ZRg6jxRy7VXYp/F8ZZNth+n5xthLkmdR?=
 =?us-ascii?Q?AyDBEs5DiqyrrEDgXcTV2kYX4fhGO9+iY9BHAIG43vZ5OC64HNMN6ST+ytgl?=
 =?us-ascii?Q?5cdWzUZaZ44+xhXJh+nxeW67tcHRyjYC4s06bVpGxjkRDSUORzXDbp46rklu?=
 =?us-ascii?Q?3t/NYMLLK7+ODKmlbPC4S3zYye9rUVn9BDwnd7RjG0d0vARK2c//QfYfVQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(82310400026)(35042699022)(36860700013)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:14:27.2091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ee6026-0ad2-43af-7405-08ddc847c19d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10066
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

This patch series introduces some minor refactoring to enable support
for new Mali GPUs.

Key changes:
- Addition of cache maintenance via the FLUSH_CACHES GPU command for all
  supported GPUs in place of FLUSH_MEM and FLUSH_PT MMU_AS commands.
- Added SHAREABLE_CACHE support for GPUs from Mali-Gx20 onwards if
  coherency is enabled.
- Fixed minor issue with the setting of the coherency protocol.

Firmware for these GPUs can be found here:
https://gitlab.com/dliviu/linux-firmware

Patch Breakdown:
[PATCH 1]:   Adds panthor_hw and refactors gpu_info initialization into
             it, laying the foundation for subsequent changes.
[PATCH 2]:   Simplifies the method of determining the GPU model name
             while making it more extensible.
[PATCH 3]:   Adds support for Mali-G710, Mali-G510 and Mali-G310.
[PATCH 4]:   Adds support for Mali-Gx15 GPUs.
[PATCH 5]:   Adds cache maintenance via FLUSH_CACHES GPU command due to
             the deprecation of FLUSH_MEM and FLUSH_PT MMU_AS commands
             from Mali-Gx20 onwards. This feature is extended to all
             previous GPUs as this method of cache maintenance is
             already supported.
[PATCH 6]:   Adds support for Mali-Gx20 and Mali-Gx25 GPUs. This also
             adds SHAREABLE_CACHE support, in addition to fixing a minor
             issue with setting the coherency protocol.

v5:
- Removed all of the GPU-specific initialization boilerplate as it was
  not being used.
- Merged [PATCH 1/7] and [PATCH 2/7] into one.
- Fixed issue with getting model name before the gpu_info struct is
  populated.
- Merged AMBA_FEATURES and AMBA_ENABLE into GPU_COHERENCY_FEATURES and
  GPU_COHERENCY_PROTOCOL registers respectively. Reworked the fields of
  GPU_COHERENCY_FEATURES and added SHAREABLE_CACHE support.
- Link to v4: https://lore.kernel.org/all/20250602143216.2621881-1-karunika.choo@arm.com/
v4:
- Split 64-bit register accessor patches into another patch series.
  - link: https://lore.kernel.org/dri-devel/20250417123725.2733201-1-karunika.choo@arm.com/
- Switched to using arch_major for comparison instead of arch_id in
  panthor_hw.c.
- Removed the gpu_info_init function pointer in favour of a single
  function to handle minor register changes. The function names have
  also been adjusted accordingly.
- Moved the patch to support Mali-G710, Mali-G510 and Mali-G310 forwards
  to [PATCH 4/7].
- Extended support to perform cache maintenance via GPU_CONTROL to
  Mali-Gx10 and Mali-Gx15 GPUs.
- Link to v2: https://lore.kernel.org/all/20250320111741.1937892-1-karunika.choo@arm.com/
v3:
- Kindly ignore this patch series as there were duplicate patches being
  included.
v2:
- Removed handling for register base addresses as they are not yet
  needed.
- Merged gpu_info handling into panthor_hw.c as they depend on the same
  arch_id matching mechanism.
- Made gpu_info initialization a GPU-specific function.
- Removed unnecessary changes for cache maintenance via GPU_CONTROL.
- Removed unnecessary pre-parsing of register fields from v1. Retaining
  current implementation as much as possible.
- Added support for G710, G715, G720, and G725 series of Mali GPUs.
- Link to v1: https://lore.kernel.org/all/20241219170521.64879-1-karunika.choo@arm.com/

Karunika Choo (6):
  drm/panthor: Add panthor_hw and move gpu_info initialization into it
  drm/panthor: Simplify getting the GPU model name
  drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
  drm/panthor: Add support for Mali-Gx15 family of GPUs
  drm/panthor: Make MMU cache maintenance use FLUSH_CACHES command
  drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   7 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    | 103 ++-----------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 125 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  33 ++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  22 +++-
 include/uapi/drm/panthor_drm.h           |   3 +
 9 files changed, 214 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

-- 
2.49.0

