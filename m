Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F178962E71
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 19:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B11310E40F;
	Wed, 28 Aug 2024 17:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="kGg8/Kny";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kGg8/Kny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2082.outbound.protection.outlook.com [40.107.247.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94B410E40F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:27 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wCEtUsYMvzCrtd4+HqUO3m91jVJpYsMi++8MVGAKmamtO2QEvHeLCM+e+8E97V/+W0FDJ0URCId4LP7ndt/MUGbpd62fmxsf4XvjrHobqrzo9VBwipBc8P3ceHswqiX08o0muIqeHnlwYrLUiNyPSPKN7ktzu1nYHbO3Dr0SK+y7sF7DBPqHBYs7pHsCgGuQvivA484hrT4LnsKC1Hhiw8dJ4OibHsLIqQZj/64zNFEfu4wWxaFVgGqgtv+Rkay74NuadI1H1JnXe3PCVS2gI8dBUEvF66zcHZ2IuJJhCWTb/NetmFYyTY3Q7cAQAB5g85LCPa+Nk8p+9sPsUtBmdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bISh8gDHA2aB6rJ/FU9XT0iKSAxjuwvzXzNlpSL3RQI=;
 b=PENkHX9E8bbK+qL2GlKtR9CgufJ+QVfCDahQGzoGuwk8B+AGPOWS6F7rizses0+lSysBPjk8hxyRj7OTqsOXzfFRWU8as+GjbnWluVcSMalSF3BPrKjY3STyHdN/i0j1d/xILI5uGnEzRffBFqI6Y8RERYFinfZEUZ2qrLthjsxxtkrACOLUVVdad5v/F5APLzJu3eFWvzA9mtYQJRLdH7I0OhDUgZeCV8XyVrWORb4apwGLPS7kGptLE+sPgm7aHIFmdwcfwPouHLgCqpOtdYDth7U/WkIBPmOvRWAr9UexHf4/kemzYde5u1wZQVAjcOD5t57rW56djNSP6zJOzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bISh8gDHA2aB6rJ/FU9XT0iKSAxjuwvzXzNlpSL3RQI=;
 b=kGg8/KnyBJpeUMmlWzCOQXctJTks+PDmmKatJsjDzPS9AR+1P6TIJIl6Uv5Lc280xIUXilZdjzLB3WP23s99feLbTA15ItyUVnuFZ3N4/bk8/A1mvGl5Ml1AxxxuHqhhoTR14Xc4zTU5NE7lT4E9/W9vEtO0LUfpsKBHG2+Y04w=
Received: from DU2PR04CA0229.eurprd04.prod.outlook.com (2603:10a6:10:2b1::24)
 by GV2PR08MB8270.eurprd08.prod.outlook.com (2603:10a6:150:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 17:27:23 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::13) by DU2PR04CA0229.outlook.office365.com
 (2603:10a6:10:2b1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26 via Frontend
 Transport; Wed, 28 Aug 2024 17:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 28 Aug 2024 17:27:22 +0000
Received: ("Tessian outbound bc251c670828:v403");
 Wed, 28 Aug 2024 17:27:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2eba0d675f59de90
X-CR-MTA-TID: 64aa7808
Received: from L738b975a3c72.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F3E66A33-4DC5-42D8-80B1-9C7B4D8BCA14.1; 
 Wed, 28 Aug 2024 17:27:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L738b975a3c72.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 17:27:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTpGFBU4ylFc7VDxGevQCl71FXDYTAZjlYniIVIix1X0v/cvJvvh1+jrcNI9plYGCez1Wq/4PdZCgVWsGoZzFnkDpr1lCOgYWtvR84+EpQtjSK3KJQj2fUNn+1vBPOEbApjsTxbxtOfGQRoz1WfdpkM0iX5/JLC4jNAe4g1M8/cdF/EKiOHAe5DU7r+ncsv6NgI4771+BinbBAMCjoUARCpEVpOHAYF83Jb8Ah6om7JadYzUvLCdFzc5hKieKxH+F858xRtj0i+F6kuza+7xyr1TEFanwiR9fePN4PRJR6eGn3yC9weQ4IQI88ZBlhzyXFvlCVme+g7SDtza/w9DZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bISh8gDHA2aB6rJ/FU9XT0iKSAxjuwvzXzNlpSL3RQI=;
 b=jy+NCMsX3EkGJR6/Um9e453bV7Wln1h6gzyZQZz037nsZbQWNyHinQlwdQ8434i2dF9As1Kgzu9EObzsmbWiOZphz+lOIp+41EmH2KAHwfeAVod5UwgsWZIRw1Rm6G/aqiWZV7cHVaIyt1FjTaAd0zAh6CSz4aiEzoCYPIVV9vPlc5YB2XKjkZvRvIxt+P/zlBHFW5RvoOFoMGDMKL+czeFFdoMthx36of1NMuA6JoCC0kjBttEIhWdefskMxIpz8173Iq3Xxe9UYLYJJDaz3+295Ng/xDq+RETN8qFDcc5UHKF2LWCml6KzXiet2MCROjpyXEtAy9ibR1DtSxBNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bISh8gDHA2aB6rJ/FU9XT0iKSAxjuwvzXzNlpSL3RQI=;
 b=kGg8/KnyBJpeUMmlWzCOQXctJTks+PDmmKatJsjDzPS9AR+1P6TIJIl6Uv5Lc280xIUXilZdjzLB3WP23s99feLbTA15ItyUVnuFZ3N4/bk8/A1mvGl5Ml1AxxxuHqhhoTR14Xc4zTU5NE7lT4E9/W9vEtO0LUfpsKBHG2+Y04w=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:27:13 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 17:27:13 +0000
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
Subject: [PATCH 7/8] drm/panthor: Add sync_update eventfd handling
Date: Wed, 28 Aug 2024 18:26:03 +0100
Message-ID: <20240828172605.19176-8-mihail.atanassov@arm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240828172605.19176-1-mihail.atanassov@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0596.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::10) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB6551:EE_|DB5PEPF00014B96:EE_|GV2PR08MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c37c526-9a3d-45b2-805b-08dcc786ad74
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?tk43Yx9zNIgKswtzWoTtsvQUXlFt13pQTi07QyUf3hqqW43Wk3mqAuM9NBOu?=
 =?us-ascii?Q?kecATUoBWui0cxKvftvz1GLHtNdfiW5yeVcAU4YG6grP+e4dvAVN5+wQaBVb?=
 =?us-ascii?Q?FZiEqr0/FlretXiU/iPPLTN+tQCzZWg3wDH/m+zeQwpiE4DCGRsn7rbc6yIC?=
 =?us-ascii?Q?Ptxn0f+MoMTnyv8Jz6VjVi4kuUe4OznsXc6txSDT1wog9VUj+b/lTgLj+W2E?=
 =?us-ascii?Q?0pe29zCXj2Gu19PVKbDteE6e7WvHwXDh1HP/Xp0/Ep1ujJFkgajSQvah4Q6x?=
 =?us-ascii?Q?qKjuaI+oPIiD/0rn3R+NIOIzer2jpw4hwob+PZDkzrZ0eO6hWKb80mNR39Pf?=
 =?us-ascii?Q?5B/p5RPNgX7nwi6TmxQcyx91cWGZ8irqdXZuBnriqUtXW1RvlqjNzk+DU+A7?=
 =?us-ascii?Q?rUxSx93pC82Z5agDUJRgwfcv77T1b1zabDmpwolIIvCWxazAAlBwcthiIL8T?=
 =?us-ascii?Q?9ltuBMLAdG+Hsdg40sd0jcA7bbAnVnEOU9GQAUNTtBsQeUl82Abo38ovN3Bs?=
 =?us-ascii?Q?qVyvLW/opSP0sWyB+mbWGR/MvefKSvkM5pTS6nLQj08BElyFeKucZDx8Drvf?=
 =?us-ascii?Q?NoKzqZLJZeHoOJEJbJEgVyi/ziZocVvXj3c4Mi0plzGm2EpUwNvwqFJoc1b4?=
 =?us-ascii?Q?l+sn7gzXiXciQzufuduxQR5ai9A0JWV9qBmMftXbDpEWfMFnoOX12QpqMTa7?=
 =?us-ascii?Q?76O93UzzqenSdXtKGUuoHUAwDBkeRDHvdduJS/wn9ICMsm85FlavitsX22w5?=
 =?us-ascii?Q?4c3yE2Obm5ZJRaM3EgK14R8eoX4ApoufQOWSYna2Kwf1qd7J8sCBmtdTndg1?=
 =?us-ascii?Q?yXlkImY7VNnzXclQJw5UALzZ6kFP9ns9YOrmj51Gfqtur+9+4qTNZmpnSorM?=
 =?us-ascii?Q?HR9/tIJhXziB2F69DIk1DStKn+A8LfTDeumJocbJzuDOCkSnCeyTdt759GD1?=
 =?us-ascii?Q?zwcd6BiREt+N6QG+lIY3PhKICBrw37bT/4yycI7/cBqi5XsWT3RuKe8IujIB?=
 =?us-ascii?Q?BO8hX6LiluZ4gZe27y4dcfQWcoDzmW7/X0cKRC56ofuPHQCfjOWdyXjpO8Py?=
 =?us-ascii?Q?1SZPZSAOUbnhhucShZ19cFgoEPi/CJw6y3gHzf87C1VvxPmOciTjn5/KlKK3?=
 =?us-ascii?Q?kj33TnFkNjy2k6i/Y5iGhtT0f2CF+GE/4GottK7ConNEk305vxImidHnqQOG?=
 =?us-ascii?Q?reHiSY1u3C2UL36+142uEntBevP3iLFD3j3NPvI52qfOJrD5U+eH26wsMcJq?=
 =?us-ascii?Q?PVUbju7BjGDzc7gnfr5GjEfH6S4Fce6OydLmUm2Bk0qXgYtF1tpZ51lUHOgV?=
 =?us-ascii?Q?Jfr8g1NQvV0cvjY3eM+wGp4p3VEzqhMM9w2/jA/hA+8AQw=3D=3D?=
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
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b5e35f7c-6a63-444e-c411-08dcc786a7fc
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|35042699022|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6i2czN1+lGMpqZsXxOkH1VT2HMkuV1Yf3KWyUENYnvZguB1J6cdu5eukSz6I?=
 =?us-ascii?Q?VSRjMbQ081paka9cU3DJWfGQm43g2Q6yNZ1U5Q6qGj44zz+3CMAphqQHT0ZW?=
 =?us-ascii?Q?Ldgry5k0umzG2+06Q4SK+V97iLKew8XmG/kxTMB99rqycFn76+eDwSJ+hD1l?=
 =?us-ascii?Q?uPojgKA50E8bZ4XTO5AVUfHPPkltmzuCDtUzv3TSsQJsiCkAatynOrQgJrL5?=
 =?us-ascii?Q?ioH28hpwWQDYsaS4NzJF4GCbHH3Jr0VZzpx4pv7IljmJmRaRthE6jNnIJWQB?=
 =?us-ascii?Q?sRtbKQPGhe/V0pY9zWB5AAiiRpuHdf8J+LxuHHgdN0dq/7AW05PMpJh5Ovm2?=
 =?us-ascii?Q?SuN8KQBQt7bpRhBDzgmHG6jFv4aKlQzJz2Vw7i3/gqd6qTKPQv2h8ajwK0bu?=
 =?us-ascii?Q?yEpGduvTiI2T7cums2Pdh6r05/+2VBqzm/WUCNcqSAjevrTVpczITOukCocm?=
 =?us-ascii?Q?udrJPxvBh+gZ/yFMdYw9IKsSyG2jAUaZ4RWJ9WuY+/Afmj8reHwpBz8PadsM?=
 =?us-ascii?Q?yyuC1zVEflr/17FpwPnm1hKXYJfxKrnovPALXgBWneIYVeyFcUYbGnv5NC4L?=
 =?us-ascii?Q?o3xAy/YvpodyyYUCILzYK8IJdr/phuUIdPSc9+uOQeioKnyIvUADTgKRxyur?=
 =?us-ascii?Q?+uyQ5oW8/GKALDfRtu9MBMdJzM00q9DxXfbC6yDqXZsx7/PK3FJVWlv2EdVd?=
 =?us-ascii?Q?gLbXhOWc0GuJ/KfJxh31R8XAEl87SsHGhbk0+aiD+tc8zvKA2lYWJYXrJ/32?=
 =?us-ascii?Q?bLX3kQj5QWYPXqFjPOHAJQy0iBQZX75nCe2UUrlCffju2/5S9dyuljAO5Ojh?=
 =?us-ascii?Q?IOoxo/ObIVFA71pwnKt/hyyLVVIyML3G31PchcAMimh8kDZ0Tk4RUVXxEgnn?=
 =?us-ascii?Q?aj56Fjv1Qm8M3FuhfuqKHr2sgrSmeQ5QDk9IirtDZV8D4cesvgCiiyI4hvS0?=
 =?us-ascii?Q?3nLNg41oZnsB/Cmst3P5P3j80aees5/FgxmzHCibafrfhyiNOKx+DGLuvwoX?=
 =?us-ascii?Q?J7Wd308Q0wLEVRZXy9Pp6rfl+UoqHmKrhCdTWpKqpzrwT7lyKBiRGjWSHRVd?=
 =?us-ascii?Q?5ItrkVCjjMqDrmvhVh5h5gvVSeEUizK22uo5YSR3ChawEY5vf9Oz0OXZCiXI?=
 =?us-ascii?Q?VC7Jzq8+FNbd1A+Y+3shtA7ethUDSvaBQvjjkBvuKzFKTVHRzqMh1FK5oHmM?=
 =?us-ascii?Q?DLvmqBBeyxy3Z36gqlx/ZysGqgjZyaszupIbXgaGrqZMgRQjT3tvOb89oKrB?=
 =?us-ascii?Q?qSN9LLZHL1P5lIWpGgczfCrYT7NGWgGPEEcSfIZiOkCKDnmwX7fmAiEfJ1X8?=
 =?us-ascii?Q?RnawzbJv3SGoduKbQv0tPKhSSiYFOd9rJCyfEBwWXieeLjmsLK17s2ntMkaK?=
 =?us-ascii?Q?6Lta+eWThGEnfpzivf04R1YwFUXWAJ14muwA+fs8Y8N13o7IgkgCZAjW9vYY?=
 =?us-ascii?Q?pTxhvz3TroPKv0dDUn4a3kh/u1z/0edX?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:27:22.9093 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c37c526-9a3d-45b2-805b-08dcc786ad74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8270
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

Expose the SYNC_UPDATE event to userspace so it can respond to changes
in syncobj state.

Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 92172b2c6253..67c27fcc3345 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -643,6 +643,9 @@ struct panthor_group {
 	 * panthor_group::groups::waiting list.
 	 */
 	struct list_head wait_node;
+
+	/** @eventfd_sync_update_ctx: eventfd context to signal on GPU_SYNC_UPDATE */
+	struct eventfd_ctx *eventfd_sync_update_ctx;
 };
 
 /**
@@ -797,6 +800,10 @@ static void group_release_work(struct work_struct *work)
 	panthor_kernel_bo_destroy(group->syncobjs);
 
 	panthor_vm_put(group->vm);
+
+	if (group->eventfd_sync_update_ctx)
+		eventfd_ctx_put(group->eventfd_sync_update_ctx);
+
 	kfree(group);
 }
 
@@ -1501,6 +1508,9 @@ static void csg_slot_sync_update_locked(struct panthor_device *ptdev,
 		/* Rerun XGS jobs immediately, as this can potentially unblock the group */
 		panthor_xgs_queue_pool_recheck(group->pfile);
 
+		if (group->eventfd_sync_update_ctx)
+			eventfd_signal(group->eventfd_sync_update_ctx);
+
 		if (!group->user_submit)
 			group_queue_work(group, sync_upd);
 	}
@@ -3204,9 +3214,18 @@ int panthor_group_create(struct panthor_file *pfile,
 	INIT_WORK(&group->tiler_oom_work, group_tiler_oom_work);
 	INIT_WORK(&group->release_work, group_release_work);
 
-	if (group_args->flags & DRM_PANTHOR_GROUP_CREATE_USER_SUBMIT)
+	if (group_args->flags & DRM_PANTHOR_GROUP_CREATE_USER_SUBMIT) {
 		group->user_submit = true;
 
+		if (group_args->eventfd_sync_update >= 0) {
+			group->eventfd_sync_update_ctx = eventfd_ctx_fdget(
+				group_args->eventfd_sync_update);
+			ret = PTR_ERR_OR_ZERO(group->eventfd_sync_update_ctx);
+			if (ret)
+				goto err_put_group;
+		}
+	}
+
 	group->vm = panthor_vm_pool_get_vm(pfile->vms, group_args->vm_id);
 	if (!group->vm) {
 		ret = -EINVAL;
-- 
2.45.0

