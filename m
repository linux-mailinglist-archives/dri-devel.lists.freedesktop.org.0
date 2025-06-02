Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2CACB2A3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCCC10E53B;
	Mon,  2 Jun 2025 14:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="YMGMKeOW";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YMGMKeOW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012015.outbound.protection.outlook.com [52.101.71.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B84010E545
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:34:01 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iSYNxvDR6JufRrGMRyInR/KKlJBBwqQS5ClD4n5h7pKQFA/E73B6X9SZA+5lHdcmkpLmgunSAaGAAv1K8rE54w05gTw9VbWunhZKEiU8y2dPxqDwVZAhe9+Niriz40go17Q+hgv6FHcjlFLEwYQwJVHieAWUjGQ1V5JjKgDb/oo4u/eiN5V1zgTt7Td/cf9RtWOW9y0efj30KQ54279QDZpfjw/XLGhkA7soPDxI+apoLQwBLL9YBNfhum/B6KJoj2zvD3o+zl6WD9InG+VysT9vYgkRzn8mlUamy6sDtxYxS9oWTxoipIRD4Q4aJuLB9HqK8xc97E5sGuR6mf+E9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79EUByVuJzVYOwLMmM+wLUXT8WRloN2obWZl7Q4M5AA=;
 b=nkKcXGZHpQBDtqycVFQTvaUBEjSgFcXsZUQBZbyNNvuI8F+Qvv50Qx47nfk6ifH83bcgJPVr6s0+rXN9A+Q9ES+Wg+gkiijcz0DHLzZ9HEjk9NShbafsQYoktLcaYSVhg1OCXp3CUAesdFnpAdciUMOEgydmyA3PamXw4jnWtAM5riDaCaTkEYTGl5jRcXGE7m1W9LZtkcDdjvytSEkgnghY71u3Y0r1IAqMxUziS532J44jl4ItV43euVDJ8E70N+idZRNX5AaVlnzNUiERK7U+/6RR1OsjDVWe/WGR1GHATG3C+xGDTBcA+I6tFNuSfBA8oAgSAkldJs4wFq1f2g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79EUByVuJzVYOwLMmM+wLUXT8WRloN2obWZl7Q4M5AA=;
 b=YMGMKeOWJyPr94EwRNVG3cOEAg9huNBF9J+h+ekn6TTpi11meE0lFwTRQyViAuPHq1o6L4VPuh84S1Ev3SDq9i7rUKxTwVVa2QkcUT5JxXDr+Q6klPYrf+keocT9Txqfm0YgklXMgt+Yya7sL5M8PgLCSaEgbvqR2aXODR4q4Ns=
Received: from DUZPR01CA0164.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::18) by PAXPR08MB6478.eurprd08.prod.outlook.com
 (2603:10a6:102:159::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:33:58 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::a7) by DUZPR01CA0164.outlook.office365.com
 (2603:10a6:10:4b3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Mon,
 2 Jun 2025 14:34:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:33:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMRuVK90PMpB0t1FeEvg31NT1eKo5YbFq7qBDu6L7XEol3dHZJM/P527ABSBfM4GeHWILzhE9JPaHACKQhNvoY5DnmMVAQfVsxfcLGdYycS/JWSBE+lzLHnEgCz90/sbwN9cc6Y/LX3dTFzTlu+zJ9N6o22nRXz3K8BkP6R+Tgzao+wUf2GbCbCRx+eGNCJA/naH6lC6OmZV3usICiDMK6xoRPt9MpVG+w3lzSzRIreI5JPW8mHT5Qkmjl0awhqggbbejE7WLYRP5Hv202uURleWVdOb32fqKbWbNkc+jlFuo0Yzjg4yWUXbm61/thrImGIk7wJpyu7jVyAzKFG8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79EUByVuJzVYOwLMmM+wLUXT8WRloN2obWZl7Q4M5AA=;
 b=R0+rloC34QVnSeSNSHYivqLliZbYU6xFj1nJTiMHmL5eQ8TXm9O4pBYm2nuHiXuwcMEpWj3ibWiPrmWWIQIVpgCmmEz0L8UqkmoeVfkNAhDeJv14T/a2NyEyCYGueCCvgmLtxgIJlHhMGCYlDQokVRYJwBdsQQkXYYP03aSIVeM/IiT64VDGfNV1/NAxYeQDgIqoQRp3EChounMr3+3nQR90kOWltfTsekBTLJY8OJMY70sex3dOKScDtrCjtSs0vZQ3cZp3OKfSi1seFH9Mr/fxlGUKqsLiwhasy0vlmljyEOOzCsOsKs0KXCj749TFjNltxL5X2Z+jdRpkLsSYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79EUByVuJzVYOwLMmM+wLUXT8WRloN2obWZl7Q4M5AA=;
 b=YMGMKeOWJyPr94EwRNVG3cOEAg9huNBF9J+h+ekn6TTpi11meE0lFwTRQyViAuPHq1o6L4VPuh84S1Ev3SDq9i7rUKxTwVVa2QkcUT5JxXDr+Q6klPYrf+keocT9Txqfm0YgklXMgt+Yya7sL5M8PgLCSaEgbvqR2aXODR4q4Ns=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PAWPR08MB9640.eurprd08.prod.outlook.com
 (2603:10a6:102:2ec::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 14:33:25 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:33:25 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/7] drm/panthor: Add support for Mali-Gx20 and Mali-Gx25
 GPUs
Date: Mon,  2 Jun 2025 15:32:15 +0100
Message-ID: <20250602143216.2621881-8-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602143216.2621881-1-karunika.choo@arm.com>
References: <20250602143216.2621881-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0335.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PAWPR08MB9640:EE_|DB1PEPF0003922E:EE_|PAXPR08MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d951d8-e9e2-46a1-d4a6-08dda1e2821b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?TPTSs5+DxgVZ3niSGIwDJ3jstF+vTuQk0CeFefCzXownnnf8cBRt70Ke61Dg?=
 =?us-ascii?Q?Rd6eoRs5/HErUl5ueRi/zOJWwoHdRI+67Mbc604nJUxsKwkqc5nyDC9dDiEy?=
 =?us-ascii?Q?lyJzdnuv8s5v3ySPJNmdbweO9XLMW5zfK5SCKx2uHwxO6I6VR3wvI9KUDo+f?=
 =?us-ascii?Q?GsznyNykSgMvqxZc8pgCp4UgKhlmkpMFCNn0JVm3rN18szZOJwJtmjGf/581?=
 =?us-ascii?Q?9OCg1iTa4ddoK06MPIMXcNaMZ7tNKmRJoCFtECrnGMRgA9L/oQTQAczrGtbe?=
 =?us-ascii?Q?6ptdkjdtm8TVzjG+1SZiEaoFOJT9Is14nq8HJy+eEFvEagpytPG7HbNGyAY8?=
 =?us-ascii?Q?xj3fYZvo1UNdnGL+bKwc8WNz5ZnAt06lR5q4j1OlgHJhNQfdJmfx9jR65LL8?=
 =?us-ascii?Q?65L+IScTaTckopC786t5++o1W4/O6uVxzB7r1foCh6kBKq9z28awMjUselmE?=
 =?us-ascii?Q?/NLddXvBEBervQOF0EQ2EvOXW2knRnvbtwDF8eR9H+cb2VGxA0XaAtkthuyd?=
 =?us-ascii?Q?neXEIDtQ1uo+cT0oluInFm24YchqqX+BRlTtzeW4FRTg7MTaG5QHvNS2eP5t?=
 =?us-ascii?Q?0QjFW4D5MyHuxo5D8uDI1q8tsNL+HmpDn7hsHEMny7JFeNpcCLQUDyoPb1xQ?=
 =?us-ascii?Q?0SpVwISdPNBl5gym5vfnXfO68BozJ6RAWNWYFoypjiWIB8SliUumBb8w++p2?=
 =?us-ascii?Q?RwgXu4W5GdPhzVtUzROPIxIOcmgGAu1f6FYC5bAiZ7+bsxanV9cZL4O7XQLR?=
 =?us-ascii?Q?BH+dnMphdsrds2SMcFcPqrL144ckbmo/U8r2rwWfAzzMm6R5AGMjmoFKs9ut?=
 =?us-ascii?Q?+kymgsQtYeZH1YPkxQu82cmDYnBStj52jp0r7/pxqSADR4IwWWjtdhdrjrwY?=
 =?us-ascii?Q?w06VKK7/SVqOAUAymiBAhhbyqTFLG4Q1McKoVzfZ+JQ6yU9T5cd5bxMrDr9d?=
 =?us-ascii?Q?/029wyrAuwZRQSdRBCoKRaUDHraSMI+Vg4dYmtbDapZBhuPknNlILeBQAaYL?=
 =?us-ascii?Q?Io8JHxLloPW/l41EsiF81IKDaZ87jKx8xEA9BMXL5U8t+UgsRgsQEHFj7Cne?=
 =?us-ascii?Q?rAjqNF1/rw2Zg7mjhIu1XLDq70wvrvB8/b61pbMj0Fv1vyeJ9KfOR4l4uQYp?=
 =?us-ascii?Q?5M+2KamdpgVCtBfy0cf5/+NNRAa704Hoe3IKpmRejRMP0JPIzN5Q1v5aO4EE?=
 =?us-ascii?Q?8InSz4VzkDp8u5zWmJFFEy0zyZ9LJOO2yJor6fNdJpafoV745ovdcdZYwY0v?=
 =?us-ascii?Q?sx53NzMw2e4742gCVyRmqbw3msS+anfLHmqLpGzcFWkJPm+GeavifyxdRwUx?=
 =?us-ascii?Q?gIXQ8JffqSiiUpQ6s0UojKstFtnmL48kGrDyfuFOa9gOwQcSb7h1mXyxji0M?=
 =?us-ascii?Q?+QUGqGJhFGU69UB9nZ50mZe00hNC85fmRATPH92tluZVGeCe3DP1GdLuYwxo?=
 =?us-ascii?Q?6xi2bV0lcyc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9640
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9c83c168-b6a3-482b-6e25-08dda1e26ea1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|14060799003|376014|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xFSwvgkGFchTa2SrpMlzWICsYqRB7bpV2c+SvxJefE/lZdSLNk9TwzCttfD1?=
 =?us-ascii?Q?lNe9l4WO9RBRTwO1gBcDfM0Ata3p4tKKUCsawuk1h/Y6UH03Q5OwD+qxM/+7?=
 =?us-ascii?Q?NQQ6Vo0eEPYZiWJHCvNzTOU/QoXAO+c9m13hWpXD5iKVJXMNhtLWyQfrzUCl?=
 =?us-ascii?Q?tdbFDvPSXJ/OfLNT/hiRlNmH35yhnMMpGLw1XVkzOTpGohHNBj8Knz60DKs4?=
 =?us-ascii?Q?6eZOa4PLLSu3PSXDU1eZHx3CmmWsTAIwr9m70J3GcMRt4CMVahbg3ycwtlqt?=
 =?us-ascii?Q?dWiUG5Dil8gEnNakghosiVCxwP7N/eZ1NpOKj4OjTBr78SEO3toF7vcnQaMj?=
 =?us-ascii?Q?ORx8vOodbhbtTUKV8zIVXD7Qq8UBHp753DAFiq7LpumqNnJpUig+PrL7ONvJ?=
 =?us-ascii?Q?k/K1q8VhgU2/S5mdEHlDsBW76DicUSyFs/o8NTzXL1x472SzjaQF8WxXXuhn?=
 =?us-ascii?Q?Iyi4v8p6cKJjfppwG8k8M4ybgopPxWxi8aWZRXwGikC+ZIU4Cs8zuHplhga9?=
 =?us-ascii?Q?gIZxj1orplyrangS9mHysSIMcABqGtwva1zmKea5C1/ZFLomnO0Tm8UOhACj?=
 =?us-ascii?Q?WHPfY6IQpWwmk9OwYOS9P/wzJC5+5lZDW31D9rHl5+29gR6D6aBpRHgW6EHa?=
 =?us-ascii?Q?wjOxj5je6W6JzId1n0Vwnw2np6vpRY+AobEMPvg+fYTKobiDEGWSAiMxbQvP?=
 =?us-ascii?Q?9tNBcHfW4Zxqzg00rpdP3dY/LPsEj5HkBb3l/rgL9LS5NePABFZa+VKJEffD?=
 =?us-ascii?Q?kBPsumYT2LKVuRbThNedqZfFsIWP1Jp1F757wby6+Hp3CvkL2RPDLNWl3Cfy?=
 =?us-ascii?Q?8Zc42lBTOXIqaLr3yhDZecIJ2974Xl6cQT7+VLsBm+trPrOdjzD8nlZtCCwo?=
 =?us-ascii?Q?0oUL6xdNXyqiX3kwQu3bYduyH4w/YiCsYLWbBHyD1KFliBQ7fXFoovlYeSDk?=
 =?us-ascii?Q?WWrf3tVPfdm+Afx9Kobh92C4QWsnXJC4HV1mALMFTM1aYtvKOvzdwy/5vGGY?=
 =?us-ascii?Q?IrTDPMdmlDOdd2MjSJS5NyTfBPBkgFcZRzsOm0FZe9uYOJMzv44CPcyctdm0?=
 =?us-ascii?Q?egcjxIzumRae7zs41eqgFiK5jklhey1sFeIjRRG465OLHU9BSEJOHYnQpL2i?=
 =?us-ascii?Q?zHgoM72cJO0FIx81RX/B/qIzscnsPnPF0Y1vh1VYb+HiP7oh96UY9bkjqwwT?=
 =?us-ascii?Q?9v54L4oaaJjzqpn3H3jackgEkM3gqgeBrEsPL9ARaqJ9Iv4l8uHbH+9BZVxn?=
 =?us-ascii?Q?YrMyi3xQDSEiSD1Uq2Ecu4Omm0uee5V2HGuALA9dB6ufpBzucX78BkziWzze?=
 =?us-ascii?Q?21QP6riuBapNzgQZIpMJw5+4ojCn59lOUAVtP/TKf//kxIppjCsAq69XbxV+?=
 =?us-ascii?Q?46RT3hYI0tkItWZCRtWPTseT+5609jzqTTAnPKMELFjWeZmnvM+QwmdkVqZC?=
 =?us-ascii?Q?VQoz3qd1OPlJFI6rRV+P0wEqbtSeAAWthP9hFQ1miVDcV1XAWawU4JuOVgi7?=
 =?us-ascii?Q?R7UkAW6IlVpg4TNN+RFoOnH8EL3/AbbdSThN?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(14060799003)(376014)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:33:57.3060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d951d8-e9e2-46a1-d4a6-08dda1e2821b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6478
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

Mali-Gx20 and Mali-Gx25 deprecates the use of FLUSH_MEM and FLUSH_PT
MMU_AS commands in favour of cache maintenance via
GPU_COMMAND's FLUSH_CACHES and FLUSH_PA_RANGE.

They also introduce the following registers:
- GPU_COMMAND_ARG0~1
- SHADER_PWRFEATURES
- AMBA_FEATURES
- AMBA_ENABLE

This patch enables FLUSH_CACHES for both families of GPUs via the
PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH bit until FLUSH_PA_RANGE support
is added. It also adds the aforementioned register definitions and
firmware binary support for arch 12.8 and 13.8.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  2 ++
 drivers/gpu/drm/panthor/panthor_hw.c   | 30 ++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h | 12 +++++++++++
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index fa6e0b48a0b2..9bf06e55eaee 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1405,3 +1405,5 @@ MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 5ec9d7f28368..281d86c4715e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -61,6 +61,24 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		fallthrough;
 	case GPU_PROD_ID_MAKE(11, 3):
 		return "Mali-G615";
+	case GPU_PROD_ID_MAKE(12, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G720-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G720";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(12, 1):
+		return "Mali-G620";
+	case GPU_PROD_ID_MAKE(13, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G925-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G725";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(13, 1):
+		return "Mali-G625";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -109,6 +127,18 @@ static struct panthor_hw panthor_hw_devices[] = {
 			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
 		},
 	},
+	{
+		.arch_major = 12,
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
+	},
+	{
+		.arch_major = 13,
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
+	},
 };
 
 static int init_gpu_id(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 4eaa2b612756..8e01440f8743 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -89,6 +89,8 @@
 
 #define GPU_DOORBELL_FEATURES				0xC0
 
+#define GPU_COMMAND_ARG(n)				(0xD0 + ((n) * 8))
+
 #define GPU_SHADER_PRESENT				0x100
 #define GPU_TILER_PRESENT				0x110
 #define GPU_L2_PRESENT					0x120
@@ -98,6 +100,8 @@
 #define L2_READY					0x160
 
 #define SHADER_PWRON					0x180
+#define SHADER_PWRFEATURES				0x188
+#define   SHADER_PWRFEATURES_RAY_TRACING_UNIT		BIT(0)
 #define TILER_PWRON					0x190
 #define L2_PWRON					0x1A0
 
@@ -125,6 +129,13 @@
 #define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
 
+#define AMBA_FEATURES					0x300
+#define   AMBA_FEATURES_ACE_LITE			BIT(0)
+#define   AMBA_FEATURES_ACE				BIT(1)
+#define   AMBA_FEATURES_SHAREABLE_CACHE_SUPPORT		BIT(5)
+
+#define AMBA_ENABLE					0x304
+
 #define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
 #define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
 
@@ -138,6 +149,7 @@
 #define MCU_STATUS_ENABLED				1
 #define MCU_STATUS_HALT					2
 #define MCU_STATUS_FATAL				3
+#define MCU_FEATURES					0x708
 
 /* Job Control regs */
 #define JOB_INT_RAWSTAT					0x1000
-- 
2.49.0

