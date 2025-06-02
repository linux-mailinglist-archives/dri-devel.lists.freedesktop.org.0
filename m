Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8029DACB2A1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F6C10E53F;
	Mon,  2 Jun 2025 14:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="MoRaI0yl";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MoRaI0yl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD89810E53B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:33:59 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JK1Jb8uQi3EFwws2Uw5Dkx7oKT5YKEBB4argIqITtrDBj17hq2zaUm4xqI/PgWJ+xBW96dlMJBtW9sQlCFAIJwINXmHFYAuPSzgONeH6/XONMMqZXOeC11jAzOpSU+n7cjgLrKMv0llZEtzSgttCfMns8UYDEfExBf4rd1DlQyYMT2BHtTOtGPjd2HN4nNDnRyhIV5RYb6MPNVzCN0MnOZMtJawgcYeG9Lf1E7Y2CoyYSCbgHBt1vlG98qfUsjCdeoQc9W2NUksJeBtj5Hu2X1NQsPam6Cj79rOr/7UZSZoyjqDYskbrKCRLVjZ7QJoFa0u0UZlgLluy0yeVoK7oIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVVLrqVeaW6kxWoPxTsHJPkp4beyND9FA1VU9K1vj6A=;
 b=MTvJGlZWYgw8hFkwgC9umimk3BnBHWpQPZeI7BEOLXMH33eMu6X5/HifjVi7sbKUv7vXFInOhr5x2Za+OPjQga/8+le/VB0ZuuPULYpk1ebE1ib0awdtlv2bXNtt75PbG5asFxIcF89BYYDxje+qiTcCkPut5LQ4G5OgCl0+Fri4iEypczb6CVBlSGaQEO4eqMw969ATiSxIuA9VYemvdoEu5UDxYAlpCf2GFKiYZJwRNVOLiT3uzwz1rVEQjwDTz5ZjGOA6SdekJo8uCzL3ttGN3PbW4JcOgSlTH4UKd3B85Pz3Mu5xoO3ZW8JSQe2kVMlRqI+UQFEeYngpzTqsdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVVLrqVeaW6kxWoPxTsHJPkp4beyND9FA1VU9K1vj6A=;
 b=MoRaI0ylmmY2HYc32GyLaXlrKTUrBpufWfy6O6RW6IL+9rrY3ZjqU1pLK4Jd5WHVQe3yo0sinRmNj8yRqwXYiAPwnA6QfGztV3rpRR1yYYRaHF/t6/gMqk6Pmwd8d0OYf9/IBXeZvtzz3Ji6rjkhtV6jCVuHL4KIjGH+NbNnEqw=
Received: from DUZPR01CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::8) by AM8PR08MB6450.eurprd08.prod.outlook.com
 (2603:10a6:20b:317::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:33:54 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::d8) by DUZPR01CA0100.outlook.office365.com
 (2603:10a6:10:4bb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend Transport; Mon,
 2 Jun 2025 14:33:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:33:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4KB/rdzWJQwqCFsklKqbMzszdoOXp+LIEIHb4iZ7o5MAM3YF57qCpo14jEm1Y9WLtOyTZuP+PFiQGcnUwf/TtYVSvQ40+gbA9DTbNRCA9NTe3rGTDVJREgMaBhS5r4slTlQyvPeYMeQc22/4ezph0+Fe+1p+qFW1kwDu5zBi9sXr9X76Giw7mrIlFWV3vCyFceMvdhDtuu61naTnwbRcIlK25HjThGees2A0gzvpmSNemknvcTVj120VRHd1PwWfpJltRj12hsIS9LhRIib+wam1or6bwspj4J+DU1JqAs8Ab0vVc1RAk+deH2Ry3ucigHKbUI9YGj/DgW+J8O1Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVVLrqVeaW6kxWoPxTsHJPkp4beyND9FA1VU9K1vj6A=;
 b=ME1mYIB7P73O6G7Fpi0pIeqSVkykolOAy8oj0PjsOERezV4n9D8cLchSas28OI6JhCBvizBFRCy1HGUBrcvUZuDeG7yvHl4vxYv7NMj3sEy4HtehZIa4WLj6T5XsYV8Ir1c82crHrfYCrsUfhfDigND8gfPgQjG95WykBCmUqFDTmzWC131wccK8eOGGqM0WBf4+39vt1JvfCLK/G5ySQqFJ8aRPrZD5XYqvh1XaBzBfrIXeQVOr3gxPtAi7vA6AZXFu6Fc9hScm9wi6jlTllHTJcC9Z6fdi3RU2uUN7+TcSVSKQMT0/yJjeQprBVmYsHdPrFnjfi7ItVe0l8btc5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVVLrqVeaW6kxWoPxTsHJPkp4beyND9FA1VU9K1vj6A=;
 b=MoRaI0ylmmY2HYc32GyLaXlrKTUrBpufWfy6O6RW6IL+9rrY3ZjqU1pLK4Jd5WHVQe3yo0sinRmNj8yRqwXYiAPwnA6QfGztV3rpRR1yYYRaHF/t6/gMqk6Pmwd8d0OYf9/IBXeZvtzz3Ji6rjkhtV6jCVuHL4KIjGH+NbNnEqw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PAWPR08MB9640.eurprd08.prod.outlook.com
 (2603:10a6:102:2ec::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 14:33:20 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:33:19 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] drm/panthor: Support GPU_CONTROL cache flush based on
 feature bit
Date: Mon,  2 Jun 2025 15:32:14 +0100
Message-ID: <20250602143216.2621881-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602143216.2621881-1-karunika.choo@arm.com>
References: <20250602143216.2621881-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PAWPR08MB9640:EE_|DU2PEPF00028D0C:EE_|AM8PR08MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 897fe687-6346-4c50-131e-08dda1e27fb9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?clmMWHYMDPTEaIYFw63IAIP+Ya8vLM3NOKNdcNvjg1NIUvRNyVuMytMTaMpD?=
 =?us-ascii?Q?QyQQ2CH9ZJNkTdXNCy/WjFWIBIx4uUfQK42wQLPl3KQOfV9QLoewzTEJ7PoS?=
 =?us-ascii?Q?H+1+MLDUViLUefRqaWoHIkRyFX4LG7O18yty3WXjq1HuXaX56dBt/FdwIsaW?=
 =?us-ascii?Q?MtAvs95HOX9JejQ6Y1Xpp3xTyka2mgnob3/BtCrMkdxtbBA3KC1gsNQCGuCB?=
 =?us-ascii?Q?0N4XrVgZ9SjXGdbKMgSt4TbNdTNeNNgHqpOx/xT7wnT9Por4fzV65SVhmDOT?=
 =?us-ascii?Q?MLN8Q2hzZRz/02t4cLitCb0CMPoGZIBGegQCr/44gZOyu/R0k286SubFvSJo?=
 =?us-ascii?Q?FOwhqUR3uck1qRaZknXTQoc+FU7/QkNE2OPHwqwuBk/vFEhy51ovA9DMvNNe?=
 =?us-ascii?Q?fidWtebrbr7kwdRmKj0jl/pTEUD01790CGfGTyqGI+5TQuXb1WVko1p7EHfT?=
 =?us-ascii?Q?aebI5ifWtVpWGhFcN8sGiIZGl6KnLQRaW3MXjcMKqgZ2TH9U8uYL9PrP5ZwH?=
 =?us-ascii?Q?QgcI1D1AbOPqHUgeN5AipG1psAbhH4dZmg+nzhTd4X5E7Ka9YZ5qm/6yGlPd?=
 =?us-ascii?Q?89D3esFenBZ3gVP1ewhLer348/D4SVwIHvIydkduXxlann3Scnqf9ei9UWad?=
 =?us-ascii?Q?ryCqZjRI1OZgYnckWuthSOXt3dp4hzkFar0+wAoKf3T02wwZl6HgIFChocCU?=
 =?us-ascii?Q?xHR19TvS/sRVpsX8zChGatMwgBD/YjzyS8zbi6TxU2a31ibKkg+BEUqXU9eS?=
 =?us-ascii?Q?MnPOapQAgmOJU9i/E3hUX59GBaaVTBIIudOiclonXFSeqOLZMGz/k3dgRhRN?=
 =?us-ascii?Q?yZYoqGvjnhPChC7pQVD6LIzgTBt7Gd+YG572xZ/XqHnxsd6DPAblcvyvg43w?=
 =?us-ascii?Q?8UI8tlPXfAbsU6Cwv1gIzrw/vAltd7d9i6HYzKtZ520EcNSZ4paWKXlElAEE?=
 =?us-ascii?Q?Wa16iyyNS7uB/YxT4d71efKury2LWwTTdlmIm9oRO8e30pJt6omXKTHoW02m?=
 =?us-ascii?Q?Fw3U3APWJlaYsGka3yuHr+1YqG0FgRvukuvBJHpTaGRYfjSEXimDsbXe2J71?=
 =?us-ascii?Q?hFLaRacUNrW0xCRLhHC3a7tC2DXKnKJjRNEV+YdJbXepFEgcrdJuKRg4KDWV?=
 =?us-ascii?Q?N1mbu8lyEYashM7ju+74nFQCB/T8GFQ4uHDcnCXtB8Tn6a/6AcakqG+eU+Jd?=
 =?us-ascii?Q?Kvltj0PtM0kytq40ecTCTdmR8uC/Bfm85UGgt2SMbir+7fR/sGCCOfgAfM//?=
 =?us-ascii?Q?qckK1J1rnsHtKLJv/Zn44uTFHR4fl52yIr+uYMxslqpRvVOYJLedpBwjjH8A?=
 =?us-ascii?Q?FCajpuh0gTK88fNMrbqZJ555IwlzbHoharOsvSR28tRAs1Xwr/iTsW7QmLIg?=
 =?us-ascii?Q?I3u+J80sJZKAJTEcJjbhiTl5htpJg6VG/qwr6vCf16pAw3XwTNWwcGPLCB68?=
 =?us-ascii?Q?p4MJDPOQra0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9640
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fd8c531d-330c-4964-4a89-08dda1e26ba4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|14060799003|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4pXUnabyA3w/ge4pW5oUE0VTdthW+Qp7NX/H9RE9tVQRPs6E0oabQJmHQuhx?=
 =?us-ascii?Q?B7terS0R9OtV2VgX+GdmjyJ9d22Mp0QAP4diEsW2w9f0gcXsFunIsljOfVOq?=
 =?us-ascii?Q?YpltPe2MGICf9FxKfWC3AHG/hMjvtJzRoV6aInVntXKXQALXTizFmKi9I/DL?=
 =?us-ascii?Q?raegUOgRYUf2wGI6DzAs0d2f1rFpEYM7c7BocJj1Z70tp5jrK18IheYKItAY?=
 =?us-ascii?Q?f5jTnmLsZVbT8hZl5eeUJUHXDHXqno4BV1hJ44m7mkx5Y9XIF1hr/agoytUy?=
 =?us-ascii?Q?0sgOH6J/l7mgla+UAbp3xxNR2GJAoOJdT1pU7o6HklvDaHr/S02LyggkGRqC?=
 =?us-ascii?Q?3BGd0X6/VaBc4hAAy3Sb1rGY9AueHBCI/Q0z9F04lDA6mEejKrY/ZY8eYry4?=
 =?us-ascii?Q?xZ2WFbste6eJ6qYlM7qs2iLY+zCn3BSMwl4ajrZPNo7B07ST7B2m/BGYMWz8?=
 =?us-ascii?Q?MB+zp6ibXzMrVd8QOyepHE+InCzeeBsC8JCbglg+RRrK++2lespa8OiD+uts?=
 =?us-ascii?Q?r39rW5gj2AOwbZBCa32mHP5CKEj5amtScxXZRUZ7FZ3jog10TBGoIBCB6pzd?=
 =?us-ascii?Q?Cwc1LZApoApTq37komypYQG4mJpDMYmEMrSDJvgWSe9Q5hLPq8EDPUJz3cVw?=
 =?us-ascii?Q?JKmgUiCQlyKUdqEyJ0wTbVbcajZMgMPUz83uC8rT57ObUfSSOV47kbRbBWq/?=
 =?us-ascii?Q?wXzsusK2A0chdW32XB+rmQ1gQ9B3LKiZgRzxyWoDQ0bwNO4Pyc3arh8e3VSx?=
 =?us-ascii?Q?sbAnLOYyYaA4QkZwfLA71ulw4727vyIU5m/j7eX4EH2fg/tKQwf56zaWxyaJ?=
 =?us-ascii?Q?tj8VLwFfKXbqNfJzna0lhLP9EnC2OUtxYzxqFW+EOHR54oJ0r7br6bVEHTe8?=
 =?us-ascii?Q?MJFV2bzhdTgpRZsvSmXtPXDrkWQANNCaOs0qWMHKuxJNB8SY3pHtt5xhHLT5?=
 =?us-ascii?Q?H5tEAD08ypK0V2G7NtcBV4G69utKRR4svziMfu9r8p0nPa5TQtVFpRco7ssZ?=
 =?us-ascii?Q?u1rCl9Jimy/f+jWJE91/mCTrcCKJPVvWrQNRyaNr3Kawd91UaFIrF+s4y/Tx?=
 =?us-ascii?Q?VI+dEhBvOf3kuQ5RD5+iEBSsoxEFB/hv8JXR+S02huAtGYfjcWAwdir4q4Wr?=
 =?us-ascii?Q?k1H3xrCZKnXUwdAIrGVKHMrXJSE1rC80yqNgDKNTv2duE8L6Y3NP9JIrn2VZ?=
 =?us-ascii?Q?GL61vg6ER0lSdaCBpjS9oD8nIGSDLXQVsMOwf16I0b5kJQyZzzbHDzmoVIK+?=
 =?us-ascii?Q?Z65aqeYmbwuNVwup+Obb984UXkRElUytpl0dytZBxqs9fEHi6jAuzzD7MY9R?=
 =?us-ascii?Q?2cZEuGGCP6pkvhecqYZJSDG8+FWR81KTzw6Sl0IVICkIr2ef+cId9J+8icN0?=
 =?us-ascii?Q?89AqfPQS8VrNn2gMQ1ocv8RTwFc5O5vWsU2ye3CVjEMdkSB0ZqVAD4irlx1m?=
 =?us-ascii?Q?vifqnqwICKUhFwNjRKmxr7DC05PlNmL174a5dk/6a5nm9hV4IqaAqbQlxZMD?=
 =?us-ascii?Q?gwvj4gfnGzR+LJsITLkiauxsAFjgHslNhRnQ?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(14060799003)(36860700013)(376014)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:33:53.2804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 897fe687-6346-4c50-131e-08dda1e27fb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6450
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

As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
Mali-Gx20 onwards, this patch adds support for performing cache
maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of
FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
feature bit.

This patch also enables cache maintenance via GPU_CONTROL for Mali-Gx10
and Mali-Gx15 GPUs for consistency.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c  |  6 +++++
 drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
 drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index f5127a4b02dc..5ec9d7f28368 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -99,9 +99,15 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 static struct panthor_hw panthor_hw_devices[] = {
 	{
 		.arch_major = 10,
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
 	},
 	{
 		.arch_major = 11,
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
 	},
 };
 
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 1a3cbc5589fd..2bb372fe9d4d 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -16,6 +16,12 @@ struct panthor_device;
  * New feature flags will be added with support for newer GPU architectures.
  */
 enum panthor_hw_feature {
+	/**
+	 * @PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH: Perform cache maintenance
+	 * via GPU_CONTROL.
+	 */
+	PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH,
+
 	/** @PANTHOR_HW_FEATURES_END: Must be last. */
 	PANTHOR_HW_FEATURES_END
 };
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b39ea6acc6a9..f9ccc8627032 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -29,7 +29,9 @@
 
 #include "panthor_device.h"
 #include "panthor_gem.h"
+#include "panthor_gpu.h"
 #include "panthor_heap.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -568,6 +570,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
+				       u32 op)
+{
+	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
+	u32 lsc_flush_op = 0;
+	int ret;
+
+	if (op == AS_COMMAND_FLUSH_MEM)
+		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
+
+	ret = wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Explicitly unlock the region as the AS is not unlocked automatically
+	 * at the end of the GPU_CONTROL cache flush command, unlike
+	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
+	 */
+	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+
+	/* Wait for the unlock command to complete */
+	return wait_ready(ptdev, as_nr);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -585,6 +616,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
+	if (panthor_hw_supports(ptdev,PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH))
+		if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
+			return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
 
-- 
2.49.0

