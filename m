Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCC2B0C22F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F95910E4EE;
	Mon, 21 Jul 2025 11:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="fdmlpT2p";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fdmlpT2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2871510E4EC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:08:30 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AZHI0D7UkWCCWQlDyv9Y47Q3ZGcVNj9svpOIRmajaX9sIEsWaGWyVPYctwGGKpHz9HYi2353Rdwq+hUV/w726Kp7viVxwcgif3Q0NavUOdF/XzLKCV5GytbfwJAs6Acu6cD1YCDQ9uwO+a86lFR5govpI2vuKcxTIagcTOG4QqS4HJUSi8U6ncI1eNMGwgCn4ccauZ+D6ULgIP5vD1JvqkDxBeLl1AabcJyb+Ux009274c10uCDQ/7rgdrcOHjLxMOIG+Xjx4HIoyD95gcDNMrwOR4N2NHHzaPOc48kVNDDqThd/DffBtCwLJ1Efioro4cfcb2LnJMbKr3PY+S3GoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlBVOSA2uwG0PJ4AtWxlHPkPm47o6l3sglU4RMSnT88=;
 b=OGG2QYC4lY+2VlmOCJfxHz1XE2z+HgWV8qJ2zhT+cvy2L0y9D2yfmK/KCl+zlDHD3cVDYbDEq2Kp4d62S1CkA4BUJZYQGnWe88jgXxindpk8FzopKK05k2HIGO9Zw7WF6ld27nKP30Kphd+o6FeEyo1em4MBErQW7FLjR/Ed/097zUO9Ql3Vq2Pxv1xff/QZ/2j/PeRRgRZvPkF4uVG2/zQWk+uXsgzlxM0YIJYI2yy/JOZ42AYgV4u2x3riW4rNcjIxQOUh4xH5ip6BoId8UdCBSfI/NgmdjQsHc9ZsRdUtc7wxbswFSmAGwipD7iVJZJBhJSW+xGfzPEBPimGDiA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlBVOSA2uwG0PJ4AtWxlHPkPm47o6l3sglU4RMSnT88=;
 b=fdmlpT2p3s0I7GkwVX+C8uxJOnnbK/gf5xt3iqsUm5zIPp0lAUxzn7Zx5pAMaLV0HjLkDhEvxm0boUs/YuW6SwdhdqF+bISXXJERIO2M20IGfbUB4QA6OEKHh5B3kODGWQWzkFbfxtQd9lk9bAvsCPvuuEmbVI23OiTUMb5YjPA=
Received: from DU7P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::31)
 by DB3PR08MB9011.eurprd08.prod.outlook.com (2603:10a6:10:431::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 11:08:27 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::9d) by DU7P251CA0016.outlook.office365.com
 (2603:10a6:10:551::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 11:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:08:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0XZij+k4IvQIqbEBUGUQNI5Yq3MqGXamOiD4918ShRNiEB+XrNioqyprcVuk+4A+2uiDIKIYZrHQZcnt9WyYv7mFaSwISimgCZDGHxLoElqmXXVzNkJmp7E85HIzfzvcqceyXdDZKp3tVZyL04+fVedLbQJtyMRVdwyXPJUB3B5Hp2AgW86Fu9OpwyBjemElXvEThWTrY2/aZXMb2Ay1P/xiI9NX4C/TAfuKaJpMaqL20CI4FUC8JIE9Izjc5mwGG+qpYwJRdxZSD+FEwBvCxOzOY2nfwbuHAPCUQnuqsVZrwxCiLn32GVqaRmIxsh+ecjE85UIV+MHJSw1N6xtzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlBVOSA2uwG0PJ4AtWxlHPkPm47o6l3sglU4RMSnT88=;
 b=j2Cji3z4E/53yHaeLu/+JFCZ5SrpBb7SgzQGhm4EWNapCb7Y4cmtXqQ19j3HsKh7J+OwotxK2TRjZtEGIOHNi0CB1xKK2ZOQUME5aAuql4AZwJiz5Wzfjeyh6+m/f4uYNMtvzb/C7Gw4UBsCzSfzpK1DCE4AkfTpJ2g/AKGDoHPrTb88auPn0jEjEBHsZZZU6hsMa0sckEjyXHLwcJXpmqrr8OC3b6QVJV++Oxm0+OsC/KHMYJpjvz1BqmcgUO7i0FUrkeoR/uAPlqSxs3EZ91KlBuBR1neTwaw1tAQJB35/g/MqNcr44bnSEDNQsOuRR/v/lzmVbly9D1xeiT420A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlBVOSA2uwG0PJ4AtWxlHPkPm47o6l3sglU4RMSnT88=;
 b=fdmlpT2p3s0I7GkwVX+C8uxJOnnbK/gf5xt3iqsUm5zIPp0lAUxzn7Zx5pAMaLV0HjLkDhEvxm0boUs/YuW6SwdhdqF+bISXXJERIO2M20IGfbUB4QA6OEKHh5B3kODGWQWzkFbfxtQd9lk9bAvsCPvuuEmbVI23OiTUMb5YjPA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7904.eurprd08.prod.outlook.com
 (2603:10a6:20b:51f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:07:54 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:07:54 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] drm/panthor: Add support for Mali-Gx15 family of GPUs
Date: Mon, 21 Jul 2025 12:07:23 +0100
Message-ID: <20250721110725.1595387-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721110725.1595387-1-karunika.choo@arm.com>
References: <20250721110725.1595387-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7904:EE_|DU2PEPF00028D03:EE_|DB3PR08MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: 4776eb47-8a27-4e3f-2785-08ddc846ea91
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?a87UlK1BcI3C8Ij5Kw3o9VigmT3VlxPB4huPce2XKZRv69VVjD3LexNqrVBX?=
 =?us-ascii?Q?z6qoyhpPrAWoXUikw+BLP9oYXcwKEbcv8DpRt6ingin0dIshIXUermaRFi6C?=
 =?us-ascii?Q?i0DM36zpPs8B2cjNVDHYdV6uT5TVJY3na6Nu9R5qGUDJzYSsmSgUPVPa0RSn?=
 =?us-ascii?Q?WZ1b+BAm81VGx4g7lNcw6EzPO2/pPb5I52+ljIBcvFsh8ssQmDBFPvCh2WY9?=
 =?us-ascii?Q?lLo0PA95hGCAg39VzOUccWGGB2joGa81hA0ZTBKVtNgvoY2eecy90rSXG2d+?=
 =?us-ascii?Q?yNwl1UQh1AxKCzMX9kGQ3g7etWdCEHJ012LI7ZWZzmWCW0skoC4of+tNMMhs?=
 =?us-ascii?Q?NFLzooSxgeCqxlFOxlpyo+Kwz4QsivNEBViguV90uKGFTnJHldb1iIztv16f?=
 =?us-ascii?Q?JBzAJ4qD5vjicQVedx1zUHka524Bkg1JAblJ5yEdf0/NVUtmiw7IEc1WWufN?=
 =?us-ascii?Q?PPFTqnVRhQ76of8CrAWol5NDLAaHM/uOm3ajhKkmQtIYwoQWwjY8Auw1s922?=
 =?us-ascii?Q?K1yNXo+RLWQqMu+UnNuB8W0SfhwAaW7nmFX+5LV8IWYwuctdSU/sF0cU/7+f?=
 =?us-ascii?Q?z34504Z12g6iNNgkmVaImTvDeRtmtRleLoOfsvHX3qa7oqLlPJW8Ejb9Wjpb?=
 =?us-ascii?Q?LEi1hsC36RmljZhjEHyUy66jKS6M+TmJbob1vXeqSMv1zGLmZGPAyUW0MeBN?=
 =?us-ascii?Q?7ld6oCYlOfXwiVDuD1OoGsgZw8DRhUNesPmjZItl9n1BYvKJgUbkrZTmXrpB?=
 =?us-ascii?Q?KRa9A2gjzUpkwVBYTn/bYeKilF8+bgq4869gOro1RnyG1oCTKKWFzciJsio4?=
 =?us-ascii?Q?zpvfcixkIy3c8w+dMcoSf2il+xeN2pW5YeCzZ3zHbumL5TR5E8j6DoJOZKMo?=
 =?us-ascii?Q?0UYp/+D8TnXgiRhd+ASDUOgkLhSA7GYvnuUe1fYP3Kb+Qu7LJhxFqtS9nRWh?=
 =?us-ascii?Q?X8QbVZ322aE4s1KFFgDhg3J/BYLTWmGx8UPCzD/sKHufWaADXrn0aGc0/IbJ?=
 =?us-ascii?Q?16G/KMSziPi9x8np+6N0nYbOZm+noO7boXiyV5vgE5XyEUsvrydaD5D9K4PF?=
 =?us-ascii?Q?k/epp/rEm0Cqtv0BTFr3Nxfa9GnMdgUE06QfTT8uM1nf6Qs479H36wahcwM1?=
 =?us-ascii?Q?Ei+gY240ose6YSC946R0ZGhD8WHUQS3E/K2ytSBD1aFxOxofRHaRmsInSmeg?=
 =?us-ascii?Q?JfC5fB4pUdYEskIRTRqSUHExwqnQKR/K84ivWjhg5WMGlDUOxG9IBsjO76bT?=
 =?us-ascii?Q?KhcH2fprKdx+Uru1sbyqZuRH4HchghcMcmJIYw82p/alzF+TVDiZAT5csonI?=
 =?us-ascii?Q?66yS9bclRQae823HtQ/9TS7kvO+wKcrtcvToCvZimJEgGksDscH3tvuyP+2Z?=
 =?us-ascii?Q?g/x0mrYEFt9uADDKqymyA7czjHYghZPrCjO05QviameTqa0E4w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7904
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a35e3d48-dfeb-4624-f9af-08ddc846d70e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?My7CK0tzl6UTqpJbzZ0lVotdAsBnbA/SrFRHi9ihyRlD5BVxqDzSYkG4waaa?=
 =?us-ascii?Q?CS4n4TRXbobqgB6vbZWR2My51hZqwPtru/KTpxfqraElxxZb7SkWlmcvg4Jm?=
 =?us-ascii?Q?MAmPoYdbLAuD/NCITjH3FhE0KWRuBCPwRSJ+n3Woi0CGaNuedlD268W8h5Hs?=
 =?us-ascii?Q?1TglmIls77OOFR92/eF+ObHaToP5/DdByJuDuFWr6gjY2LPfu07ko3BXmgQq?=
 =?us-ascii?Q?ZMH6+n5mdg93Q14OaH3JSZWP1l97PEUa2I/AROO9TQXNfymeDL179yqxOflv?=
 =?us-ascii?Q?nyjGAaP/RlHiGM3etIetiFQnlHJGDsxQZNlkQdWrytTNw60KyojsAOiMvwCF?=
 =?us-ascii?Q?koEmBcSEO6d7FY0REt+kjcBFYM70xNDjtEQ//jz14nhxk4TmgJuYrE2f/1dG?=
 =?us-ascii?Q?NOlUfn72H4b35hHcMOyhPB1GLq/U1WlorTiWKcrdh4m8g/a0VcBYYt5QpdyQ?=
 =?us-ascii?Q?yF6N1i5KRS9rx41AvvjvOF61l3gmzENaF4BHfBJaYD717r7s/gYt4MPvEbJE?=
 =?us-ascii?Q?uN8zCPc8mWN9EyrUx1F50SpvU3QCSff/fUdgeMwBFGGwbhaooB/W+WWJcjq1?=
 =?us-ascii?Q?tErKgec0a7AfgQKVZlUhrXEHIGsXo/mDIcXdnUU9X4l+JDD7ZXCzY5Nv+gXn?=
 =?us-ascii?Q?cJeeau66/qNkM4DSQrrfkQWSSDxEv9m06vFICuJjgZSNOwd1gvpVweiWuCWx?=
 =?us-ascii?Q?VYzyArbzPzYSseBGYa0VGTVG+DuzD9w2j9PnuMt1specwdTsBvHNklwl1AXX?=
 =?us-ascii?Q?9p8Q6LCfgrHnooQZzYASbafvTnM5srCNA2mF8Ayy4+O6A5HR2EzxxujdQmxC?=
 =?us-ascii?Q?/za4dh/6Tx2D6nGxa3eZYliN7iS15ZHpUERfXZ4kRufh0y6GH9i/yX+2cTCn?=
 =?us-ascii?Q?C8JqU8GkBbjR5B3d12pGLzlDq/nh/ChlKngmF+MZaziyWBsxk8emc6gHeHxh?=
 =?us-ascii?Q?VbMXeeeR7foQ4U/FgELG+dmpDONUtLn38S+5t+xyxBT/y+gPResNZ3iv3kRW?=
 =?us-ascii?Q?WDcFY2flnRrQVANHzEkPLXmTfvgwF8BE5yVnnqey7gBb75itXEKfrvkNrgBh?=
 =?us-ascii?Q?NE8f9eSV6w+45bwW5ZMDkYmpaJ8/gcZ56Hn1I+v4zq2WxrnqzANTtfsRofZf?=
 =?us-ascii?Q?dPCgQvJ8Ia8Y8o94VcAp4mRSjvSJoc52V79UozCPfrbZcrKomfel+MdFa7yy?=
 =?us-ascii?Q?3TJx6yWZaWwk/4GBy87hN+VtZq5PBZtc4P5X3t4TIdtYMv82FJQ2bOC5X194?=
 =?us-ascii?Q?HhoZkuNQn/TBFOGQXRUC+B4+5uvxaFT+xSFINqdD8jxKp5OxPx+OkhxDY7kN?=
 =?us-ascii?Q?tQG/BLznLYV36yAKJUloyqYSvs56wJWOt/LPZ3xGP6zF9WHkAsKHg6WqGrEA?=
 =?us-ascii?Q?iM5GA+8aLnbIFh8+A4oPQosy78Tt+FGMP7k/WwsumKKzA9smC7ywRowHL16m?=
 =?us-ascii?Q?kDYMzYbI6NByWRbSFTgmFSL6YVHNOcasUv0i6HbAm58sKWw9oMkAjWvsqQMs?=
 =?us-ascii?Q?jeMY+6jDFqimZ1+IitJM7GrjfDNOVuFh/5y/?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(14060799003)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:08:26.4076 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4776eb47-8a27-4e3f-2785-08ddc846ea91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9011
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

Mali-Gx15 introduces a new GPU_FEATURES register that provides
information about GPU-wide supported features. The register value will
be passed on to userspace via gpu_info. It also adds the following
registers that are specific to the kernel driver only:
- ASN_HASH_0~2
- DOORBELL_FEATURES
- PRFCNT_FEATURES
- SYSC_ALLOC0~7
- SYSC_PBHA_OVERRIDE0~3

Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
depending on the shader core count and presence of Ray Intersection
feature support.

This patch adds:
- support for correctly identifying the model names for Mali-Gx15 GPUs.
- arch 11.8 FW binary support

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c   | 15 +++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h | 11 +++++++++++
 include/uapi/drm/panthor_drm.h         |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index b7b454d16f12..fa6e0b48a0b2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 7f138974d43b..a7583342d797 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -13,6 +13,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
 	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
 						GPU_PROD_MAJOR(gpu_id));
+	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
+					 GPU_FEATURES_RAY_INTERSECTION);
+	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
 	case GPU_PROD_ID_MAKE(10, 2):
@@ -23,6 +26,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		return "Mali-G510";
 	case GPU_PROD_ID_MAKE(10, 4):
 		return "Mali-G310";
+	case GPU_PROD_ID_MAKE(11, 2):
+		if (shader_core_count > 10 && ray_intersection)
+			return "Mali-G715-Immortalis";
+		else if (shader_core_count >= 7)
+			return "Mali-G715";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(11, 3):
+		return "Mali-G615";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -53,6 +65,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
 	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+
+	/* Introduced in arch 11.x */
+	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
 }
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..e4c34f70a880 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -70,6 +70,10 @@
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
+#define GPU_FEATURES					0x60
+#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define GPU_PRFCNT_FEATURES				0x68
+
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
 #define GPU_TIMESTAMP					0x98
@@ -81,6 +85,8 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
+#define GPU_DOORBELL_FEATURES				0xC0
+
 #define GPU_SHADER_PRESENT				0x100
 #define GPU_TILER_PRESENT				0x110
 #define GPU_L2_PRESENT					0x120
@@ -107,6 +113,8 @@
 
 #define GPU_REVID					0x280
 
+#define GPU_ASN_HASH(n)				(0x2C0 + ((n) * 4))
+
 #define GPU_COHERENCY_FEATURES				0x300
 #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
 
@@ -115,6 +123,9 @@
 #define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
 
+#define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
+#define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
+
 #define MCU_CONTROL					0x700
 #define MCU_CONTROL_ENABLE				1
 #define MCU_CONTROL_AUTO				2
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..467d365ed7ba 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -327,6 +327,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
-- 
2.49.0

