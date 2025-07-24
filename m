Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27625B10A79
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 14:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D82310E201;
	Thu, 24 Jul 2025 12:43:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="iORKPoKd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iORKPoKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC0E10E201
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 12:43:15 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cATgplGemO66p7mcfkrQGIqUybRLpleo0r5fiFj5VB8Xu15AC/63CMeEeaO2R604V2EL+vRAWfAfvcMKHzI9DDm9w4mW/J6eBVXYgVxYoWfXXAAvwsUqb8y2GaN4wLkkPZScK+sXCRNojaQ/YOMdj3DLIoLFZFIaNOFD9BsLJKV4T8K2hRzS6QgX+fl/mThZSzrv828VxqaYVDJhGdRNUkR1faA4ga7c6hu4JAOSeVhMS/9usl5JgSXIuZCsC+ALn1NcFrrpq8JBcZDpC72PcSYVHS7ARl6saOFmwuMWCnbb2+7MhJdnGJvtpdfAHKKOXFA0IhxunzsfaqLk2t9P6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+G6jj668AdE7CkGyJ1kq5ZjJKQBUGx1RaErErL/EeE=;
 b=VKu6haKpI3vfvTGSL3ZeararNNw+XfsJGOe7RElmxmKI0n7xLiMexAUbbNnudhDqcTsCUoBeF/MScXRpyC47yeJIxhqq1rPEtmVDoP7n8jRbi9PdPagYq8ivqvll9bq9cf/x4D+2/35LLABfAJTHmNaPMJCg7jevetKqyWeiyYIQQY91Q0FDLEBU3PIXI2aFZct35M1Qjb/vAYXrDTLUoTPbJc118iCt1zbXTcwDusF4/KqB4I9NqqZAvYhOrnLdrEqmGvpVyMpLZRYVVSDJC/dp3NJSNlhK6MnyvVfiwuiGPgiIwMVyEH4hX9eBXysxpCIAWBY7GAZa6iDnVnY1Rw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+G6jj668AdE7CkGyJ1kq5ZjJKQBUGx1RaErErL/EeE=;
 b=iORKPoKdsRtp+613ofpAd8JkalzaWqXqyaOm8SYu8KVNhzT5xAcsafCLYLCFiVqkKxQav1lkkLKSpnRz32JEpIdDHPjH/0Qu3gCAT8qh1Fh9K1Lknjwp+hNS/L5orG68oE+0OxbtNhe1PgzSnTI/886FQTPert1b3CIY54xx9cE=
Received: from CWLP265CA0408.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::21)
 by AS8PR08MB8946.eurprd08.prod.outlook.com (2603:10a6:20b:5b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 12:43:04 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:400:1b6:cafe::5e) by CWLP265CA0408.outlook.office365.com
 (2603:10a6:400:1b6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 12:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 12:43:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttGa1n71EE+twW2n2FHoLpgk8W3ZyRQS439mD6mNioX0jsUxvTbr3Cq5EcWIJL1k//r6KTDTk2vlSVTOVAQl1KJX2dbypiRhmx/0Hb6X2FhM08kPiiNf8jQH0HpYFY9Gvl1lhpIEz2wJrfmevKaG+WoCp4gS/4GJrHrnBtjLffUNd1d3UDN+ve7EoX4lH0ATY2BNVaQn3JtpEzNAifm9R8AVEiM4RvL7u1JBngRMyJ6OCRVq5jH62GOVGEggkYjA2FiQtMDaVwmblqrtmXjxOdplboVLUMxQAQRdgGSMpeJqJR4cCntYDACeZdVR87RHJ7ePZqhKj5fds+TL2O1zzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+G6jj668AdE7CkGyJ1kq5ZjJKQBUGx1RaErErL/EeE=;
 b=Luk8xts2cIhZUZuv0B/mgECzeqk8pvA77oLj3MTC5kVjF3TDUjgCC8BTSYlqg5J56R+Jrz10iExujIm2if3BDeZlnI4BtVo9mg6peF9zENCf72E09bORggsUIGjniALwlXI6fp2qw7vC/ymi/DdZMmyvFtO5PY1EmpxKffF2z1wF4LHbRfO8SBCgWppcvbrUTeAhkoKgQ+GPCK1flSskreSX7UlJnq1iUZu0UTfDIt1+BhmYIbYU2w7U4KrF4ZVhZau2MYJ1K0gOpOOe/ilHhDE3VIBL5EpFIXrruZlpAZUxrVX8f12HZCsLwVwnVl5hZ1JpjgginFygUPIqy9i6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+G6jj668AdE7CkGyJ1kq5ZjJKQBUGx1RaErErL/EeE=;
 b=iORKPoKdsRtp+613ofpAd8JkalzaWqXqyaOm8SYu8KVNhzT5xAcsafCLYLCFiVqkKxQav1lkkLKSpnRz32JEpIdDHPjH/0Qu3gCAT8qh1Fh9K1Lknjwp+hNS/L5orG68oE+0OxbtNhe1PgzSnTI/886FQTPert1b3CIY54xx9cE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16) by DU0PR08MB8496.eurprd08.prod.outlook.com
 (2603:10a6:10:403::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 12:42:29 +0000
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90]) by GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 12:42:29 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v8 1/6] drm/panthor: Add panthor_hw and move gpu_info
 initialization into it
Date: Thu, 24 Jul 2025 13:42:05 +0100
Message-ID: <20250724124210.3675094-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724124210.3675094-1-karunika.choo@arm.com>
References: <20250724124210.3675094-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0006.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::12) To GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB11183:EE_|DU0PR08MB8496:EE_|AMS0EPF00000194:EE_|AS8PR08MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2b1c25-96b0-40a2-2d75-08ddcaafa1af
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?zHSpzlE97KBi8j16Ne/jr5aFwqzfb2SdJEF0BtGTCo00FVyUxxTwR2XiHo3e?=
 =?us-ascii?Q?J78q6XczpD4VlZHk+661lgWYHUKogOeboMLNp+xxjJbEsfdIvpm1+8dpNtSV?=
 =?us-ascii?Q?0kW/rRmyhvh1cUPk4L2hUlrJKaQyJ5aRqQzo93t64P/qzUsZnK7JJLbcgVil?=
 =?us-ascii?Q?b+fjT38GscM+wdghLVO2w8O5MV4nDkpNGphkrcXMrSc6NupE5oD2jBQVR8c6?=
 =?us-ascii?Q?Gicy3mHcRGKVqZZ1tYPR/MjHtKl+qGTBfpSY2hGLGfug2DxGAh96Gb6l1PMz?=
 =?us-ascii?Q?im6upEItuVldh3DrLkjT2Olj3X0ZusxUFysl2B6Pgcz+n7B80+HDLguih5X4?=
 =?us-ascii?Q?obim4DVw+OeoexZx0LIZZUZczewsSaVLKCQ5GDj0udInnq8YSWl9XuUcfmWD?=
 =?us-ascii?Q?02DvestkwzUNPPBt7VQm98JDk8UuM1MwbXVgxnfhWo5+biXB0wbwb7do5Tmw?=
 =?us-ascii?Q?UZt3wrtL2YQYPwK+pvD+FXnn/6/nw2QQP6W9dEHDAW6LfdF9LfaKIC5MArf+?=
 =?us-ascii?Q?CD0D/sPqclYMN63KxUbibCsW/qKG3c4/YY0+mUxFZGwEaZKAa8sP3dsiswoa?=
 =?us-ascii?Q?QOQVknw5Fx5mJaLRcFjzUFJP40E+bJNGD6uUYC/Fc3t9adaPBMwzu3uCckFQ?=
 =?us-ascii?Q?KkgLvjMY5x68qpoPsobQnZAGQThVrABpKdbhKxEHtsWDJvef+jj3rJNta1/F?=
 =?us-ascii?Q?OngsTlPpqC5xG3r5YzbEeEqLEo78ls1KrZqlWMqvyzc41mwhFWD9k3f1WB7P?=
 =?us-ascii?Q?RgHckxbJJ+u3zIwgDne6e0rgYR12X9xEf7EvT1oNjqm3X6465P0foKxK27JU?=
 =?us-ascii?Q?hVD7R9FqEwSLC7DKZ78nv3+22bYn+0bcX7fKZnKRf+2f/VaOvjiy9zarVT66?=
 =?us-ascii?Q?lSkx0FKmWILn7jKI0L9bpl9Kf/20xiMKLDSMaa8mJG2WUDWt2ZfPtPQ5pusb?=
 =?us-ascii?Q?ppioO8F8YpzDiUmcJPw5jioN3SVL7r1cQCuOv6XTVTLgEhGcTad1LTVqbkay?=
 =?us-ascii?Q?45Ukw9fioOJcJxI1K9dZX/m7EP+7sG37Fe1Nh+Dpq9ehrBotZcfT47nlWes9?=
 =?us-ascii?Q?JHgh8wMJMdCQDMG9qbnRkr/daYsBjCze2x+863ryJUNZ5K4ZgEwQeIgrZqkQ?=
 =?us-ascii?Q?8S7CTEfRSSbdJUQwhR+1io91Az3jJQS6ICQteabnhevjhk5Nwef7zDp2Ykd5?=
 =?us-ascii?Q?PN/X00dK8Hwq22XurvbvJ2lD/ThGbOWezFGpGy4bhvax5rKIt1Z0Iso4y4us?=
 =?us-ascii?Q?LM40w5VQAxmAiUATerMye9FkGRiQKkgR8/+CkgbhJunIv1UprmVWjuiHVPHC?=
 =?us-ascii?Q?9vpRApixeNgqJwQx8vQsfyDoNs2SyYG0ZIDuRubdUygCsYZUIQ8ThpOwjxmg?=
 =?us-ascii?Q?HmZN48G+5Dald07amWrHwlIjm5pYYu77ThXq7UTQkRt8SfbCgV9ENSvPvHYd?=
 =?us-ascii?Q?vSmgeqWTuPQ=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB11183.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fbe17768-437d-4f8c-7b47-08ddcaaf8cf7
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|14060799003|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qkSXKljRrhVfqMMlj+VQzPCg3RmSQ/B3Yjf5YAVWCYX9INYF9IGpELIh0dxD?=
 =?us-ascii?Q?o78wBmqdkeQzFXNKy0q1FLNbT3M23pQJMxv052Bmen4WWT1bkh8nXWoZ/5P0?=
 =?us-ascii?Q?nm6OWrN7cEIMWozyp8poyykHgN6goM+PN4Cw4j0TO2Lr0uwwXRclZHi39K/W?=
 =?us-ascii?Q?dg/Xs1TPeOHzkoyk6mOSEocsQMmwkvM16Eq5xO+pf0VD4RChQbXEGPXUvxoN?=
 =?us-ascii?Q?zmcQJ2BqMeBtkcL5x30RZgnYqdmm80edEpa2/zwZoUE6n0xKxr8AtNVfMhAs?=
 =?us-ascii?Q?cLnVSOU/q413Ta1Mb/2Pb1tysw/d6hg5/xQU3+aaDNT29FKCMofoJqOw0iN+?=
 =?us-ascii?Q?N1zxjZSsDnZ0n7qWcu5fhH6NQbTo0wGJaAKBU26drseixzbO7rsL74/3JLbk?=
 =?us-ascii?Q?PMU43ajmD/XENiJ6iJ8D8RbUGSKMX+wNjjjGHF3ZybfitgvXDEdtQ554zckk?=
 =?us-ascii?Q?BxKmD5xHrEcfl9dVuZ9RD4OEN0Uzns8gu7kHtvWawmw8lHTJsIQuiZBztgZk?=
 =?us-ascii?Q?b8kPGDcaPxAq5VkdEO2RXDtBL9gmaiDLem5jhxeF5TVmtuxscDg1/rAD1dxl?=
 =?us-ascii?Q?bOU+epFSLjCYMBqAG6C6LKQsomI3dxznTOjShxxf8KRdV7pUR57xHoPSM4lK?=
 =?us-ascii?Q?mOiIlBbG+xwxiZSAw+QGyz2njasFx3pC/9EUcmdaMm6vjqoLixFL/N9NbIwN?=
 =?us-ascii?Q?YLhFvKJ7ZuRe6xWri3RXAqicHpOMdFpDLmuUMN4THx6fCLnaT6oziHz+DI0c?=
 =?us-ascii?Q?Ce4TP46sLYIyswki8Smn4Qk3tQEyvfW3ZEhgU3p0cmvayEMc8QlOt1I4BguM?=
 =?us-ascii?Q?Z/MEAdIvasbWnlKIRDJc52qOctyxznvpi/Deddse5mNJs1spKmNdQCtcotID?=
 =?us-ascii?Q?QTrfzzEfLgBFICgUSfcOnU171rFC3DxpR0SAEKCTYtQexqwO7W/2t6rgZ5Vj?=
 =?us-ascii?Q?XCa7K/tPe8OK2lwL1jzVwJvU8hQ9ltrWw1pP4NVWducUvxWf+hSGU9pL75Pt?=
 =?us-ascii?Q?xwtKQPm9aa1Nwk5I0g8OuHpVaUn8XsYjA6x4vnL5jtMkU1TvBQHDUzym3oi8?=
 =?us-ascii?Q?5dToNm/2LZEaENFBz8Vvpne7AI5LW3YgYxiPI9QQ3oIpdP1FO5WGF1ZPyhHW?=
 =?us-ascii?Q?xkdVuGS/wNghC2WhAvmDeeOdx4zA0gky6ci8GhRYVK5HBuWCj9YICgN4u4Ey?=
 =?us-ascii?Q?r8VWEjrmbn1XsoWkF6q7g8KbSJVL5BBSYwAdTWOTRUDB2AcPvyck9/zRAUK6?=
 =?us-ascii?Q?GBtpfXgAfa7OdJt3zBEYT/mbROAM4AYuQOOYYsceBew+jxmGht+KXIukfcb1?=
 =?us-ascii?Q?4hOnzE3p2jBUqutZBHIrNWBXs1fzc5WpSlx/+r6IrDrHjNOV0YpaxFzN/uqu?=
 =?us-ascii?Q?DZClFfxirNXiawf4FFxF1VljpkGiiXRpPzhbZKlG0GTo279zDvUPK9qn1366?=
 =?us-ascii?Q?u+UsxMflHuPs0PcO9ZnfkE8uTmqJP03Fl5n2HxCa8HaXDUg6Ru2VOrNgZWSt?=
 =?us-ascii?Q?wQTlwBD7cf72yTxb6BCjowfm8dXX+ay0b4vW?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(14060799003)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 12:43:03.5992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2b1c25-96b0-40a2-2d75-08ddcaafa1af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8946
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

This patch introduces panthor_hw and moves the initialization of the
gpu_info struct into panthor_hw.c in preparation of handling future GPU
register and naming changes.

Future GPU support can be added by extending panthor_gpu_info_init()
with the necessary register reads behind GPU architecture version guards
if the change is minor. For more complex changes, the function can be
forked and the appropriate function will need to be called based on the
GPU architecture version.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -------------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 113 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 +++
 5 files changed, 130 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..02db21748c12 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -8,6 +8,7 @@ panthor-y := \
 	panthor_gem.o \
 	panthor_gpu.o \
 	panthor_heap.o \
+	panthor_hw.o \
 	panthor_mmu.o \
 	panthor_sched.o
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..81df49880bd8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -18,6 +18,7 @@
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -244,6 +245,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 			return ret;
 	}
 
+	ret = panthor_hw_init(ptdev);
+	if (ret)
+		goto err_rpm_put;
+
 	ret = panthor_gpu_init(ptdev);
 	if (ret)
 		goto err_rpm_put;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index cb7a335e07d7..5e2c3173ae27 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -37,40 +37,6 @@ struct panthor_gpu {
 	wait_queue_head_t reqs_acked;
 };
 
-/**
- * struct panthor_model - GPU model description
- */
-struct panthor_model {
-	/** @name: Model name. */
-	const char *name;
-
-	/** @arch_major: Major version number of architecture. */
-	u8 arch_major;
-
-	/** @product_major: Major version number of product. */
-	u8 product_major;
-};
-
-/**
- * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
- * by a combination of the major architecture version and the major product
- * version.
- * @_name: Name for the GPU model.
- * @_arch_major: Architecture major.
- * @_product_major: Product major.
- */
-#define GPU_MODEL(_name, _arch_major, _product_major) \
-{\
-	.name = __stringify(_name),				\
-	.arch_major = _arch_major,				\
-	.product_major = _product_major,			\
-}
-
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
-
 #define GPU_INTERRUPTS_MASK	\
 	(GPU_IRQ_FAULT | \
 	 GPU_IRQ_PROTM_FAULT | \
@@ -83,66 +49,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
-static void panthor_gpu_init_info(struct panthor_device *ptdev)
-{
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
-	u32 major, minor, status;
-	unsigned int i;
-
-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
-	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
-	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
-	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
-	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
-	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
-	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
-	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
-	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
-	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
-	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
-	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
-	for (i = 0; i < 4; i++)
-		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
-
-	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
-
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
-	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
-	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
-	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
-
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
-	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
-		 major, minor, status);
-
-	drm_info(&ptdev->base,
-		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
-		 ptdev->gpu_info.l2_features,
-		 ptdev->gpu_info.tiler_features,
-		 ptdev->gpu_info.mem_features,
-		 ptdev->gpu_info.mmu_features,
-		 ptdev->gpu_info.as_present);
-
-	drm_info(&ptdev->base,
-		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
-		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
-		 ptdev->gpu_info.tiler_present);
-}
-
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -205,7 +111,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
-	panthor_gpu_init_info(ptdev);
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
 	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..94f170a8e5c5
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_regs.h"
+
+/**
+ * struct panthor_model - GPU model description
+ */
+struct panthor_model {
+	/** @name: Model name. */
+	const char *name;
+
+	/** @arch_major: Major version number of architecture. */
+	u8 arch_major;
+
+	/** @product_major: Major version number of product. */
+	u8 product_major;
+};
+
+/**
+ * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
+ * by a combination of the major architecture version and the major product
+ * version.
+ * @_name: Name for the GPU model.
+ * @_arch_major: Architecture major.
+ * @_product_major: Product major.
+ */
+#define GPU_MODEL(_name, _arch_major, _product_major) \
+{\
+	.name = __stringify(_name),				\
+	.arch_major = _arch_major,				\
+	.product_major = _product_major,			\
+}
+
+static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g610, 10, 7),
+	{},
+};
+
+static void panthor_gpu_info_init(struct panthor_device *ptdev)
+{
+	unsigned int i;
+
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
+	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
+	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
+	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
+	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
+	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
+	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
+	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
+	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
+	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
+	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
+	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
+	for (i = 0; i < 4; i++)
+		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
+
+	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
+
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+}
+
+static void panthor_hw_info_init(struct panthor_device *ptdev)
+{
+	const struct panthor_model *model;
+	u32 arch_major, product_major;
+	u32 major, minor, status;
+
+	panthor_gpu_info_init(ptdev);
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
+	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
+	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
+	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
+
+	for (model = gpu_models; model->name; model++) {
+		if (model->arch_major == arch_major &&
+		    model->product_major == product_major)
+			break;
+	}
+
+	drm_info(&ptdev->base,
+		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 major, minor, status);
+
+	drm_info(&ptdev->base,
+		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
+		 ptdev->gpu_info.l2_features,
+		 ptdev->gpu_info.tiler_features,
+		 ptdev->gpu_info.mem_features,
+		 ptdev->gpu_info.mmu_features,
+		 ptdev->gpu_info.as_present);
+
+	drm_info(&ptdev->base,
+		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
+		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
+		 ptdev->gpu_info.tiler_present);
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	panthor_hw_info_init(ptdev);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..0af6acc6aa6a
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+struct panthor_device;
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_HW_H__ */
-- 
2.49.0

