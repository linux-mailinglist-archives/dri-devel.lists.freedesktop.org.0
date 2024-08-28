Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4E9962E6D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 19:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB2C10E34E;
	Wed, 28 Aug 2024 17:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="B1qg64f5";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="B1qg64f5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBEC10E34E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:00 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZqzWhldSCEA6rWcHw+/ZdJ18vONFMddzdChtARzwI+XUGrzDILKEthI3TuEnioAlSm3g21VPeGONTuPksHhdWmehPtDYTV1rbtyA1YhtoiDvlK+EmVc32oWTfhJLxK9+Eoz2KPbtrO20KZs5GvSl4L2HIdzwLCzphyBO48KUu0ZKf5Lvma+X0gqYLdLAOUH6cLzam7deWMvg6WWHB/p8asO6SW7fa4pzHw3/OgDwm5IyuKd1eIFx/Okj+qZvconIW40m03HBIxuv97pCttgm5YjRJxeZ68FNXlSt56iVTIWWTmcMJcCPvYBrHQMSGzC8URaiDjveAW9YPlKNtK4HwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6orZbKeA+ZAkLam0Ko+xKmcpwenNalfbnojri2vJjus=;
 b=WQ4YRFtLjajQrxzEkU/xB58o13hXS02mZAfryIiale8Z2A0poij+GD1jWaQqoosVC/LXfRIUwPCgRL0ywzthqZWoVpGWMTUyAw27v/i9fJJM1dNQUdXFJ2CdZov/kSrH8LQas8M4KLEJ8kCldelge9ONZ3NaPjCogszHEf+hNMF4VhrSGVaoSO2M54h09iDl7wSaR25q7mPoxK8B5B4Qcr+XcYf42fr5i2QPsvi+qvvnTgJAiVnLuE0OegG6dvkJ83df3r4Gp28aU5YAW1GBQnpLXvZfrUiqz2B4hbKHOTiAKlzAt78J9hej/a4m4uyMFIgWlRxeKEyGzNW7sgtNKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6orZbKeA+ZAkLam0Ko+xKmcpwenNalfbnojri2vJjus=;
 b=B1qg64f5fpQAK7QeE+jc/UMWqxIfnULep8MbWkPM8vW6Xi+jgRkrJ5iwaIU4Dmo9+XnobYV7ajOrLea3rYddmZdSgjknzHLZSpk/Nq1YL5FK95vVM7KsT1FL+I4oo56psDplOE2nEPVcf28plhik5YcLPbIg+6ic9oRcgq8cNp4=
Received: from DUZP191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::24)
 by AS8PR08MB9599.eurprd08.prod.outlook.com (2603:10a6:20b:619::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:26:53 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com (2603:10a6:10:4f8::4)
 by DUZP191CA0028.outlook.office365.com (2603:10a6:10:4f8::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.26 via Frontend Transport; Wed, 28 Aug 2024 17:26:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 28 Aug 2024 17:26:53 +0000
Received: ("Tessian outbound 8e666bd17457:v403");
 Wed, 28 Aug 2024 17:26:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b872d9813555bf6
X-CR-MTA-TID: 64aa7808
Received: from L5ae389042c40.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 03390737-02AB-42FD-89D8-CAF50D87C549.1; 
 Wed, 28 Aug 2024 17:26:41 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5ae389042c40.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 17:26:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTj/U41KGxl+XBlTQ2ATU6L6xTDGx1sxNjrIbMQPHRQqDwRCWE7oZRjIRU6imvT94OQcMln2M0EqiTt2T+hvTkTNdQ6cr+4PGueTNJPnpbARYFusytGJv39Gi2PE5IK7QIKl4l4eofGEsS5xws6XZRw+Iw9GWjdhXpwHM0Iu+Vd5rSvzBOStGrSY10AtFt+3IOBmfqgpaDFgW7KRkHvMZYmuNwX/yJ/1c5yUFaHqFBYFCdzClSWqGN87/ljLaUs9aO4udJy3saqNSt/iKvEGSl1yThxB7+fhiKnJUwycLTF84oaqJDX03Q2ddOoET4fGElNeJAxy7rN5Tx85JY8Wzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6orZbKeA+ZAkLam0Ko+xKmcpwenNalfbnojri2vJjus=;
 b=x+D61ChCtx23rvxtwuzmSC/atblBrPn6lmZKLYUkrov0sYUHXthpltbSVMOoH+x1pNaPeNIfQ9ykbSgrW2X/VQhWEEoRXJ46kyEY5AlGZ/Tv70ijOl/6S+tI4vX59arxOwF8TbQA0vaFav7BrrU7CqD+8DK46pPzagHgQyT+ZS2hV5aOAbzVv/95nDui2OM30RxoIjmqjQNNaE+wfiMxmrikc6xGT8t2YsI0h8UfsyL917Z4PlaJtl9n7si7lYn0dHgb0Iqred2u1lJQribefWkZvvXIkOa04+kmBd5fHZE5uVBnRg/JAImoE6WQgTAfZTpJbt82BcfUWdER1yubRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6orZbKeA+ZAkLam0Ko+xKmcpwenNalfbnojri2vJjus=;
 b=B1qg64f5fpQAK7QeE+jc/UMWqxIfnULep8MbWkPM8vW6Xi+jgRkrJ5iwaIU4Dmo9+XnobYV7ajOrLea3rYddmZdSgjknzHLZSpk/Nq1YL5FK95vVM7KsT1FL+I4oo56psDplOE2nEPVcf28plhik5YcLPbIg+6ic9oRcgq8cNp4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:26:38 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 17:26:38 +0000
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
Subject: [PATCH 5/8] drm/panthor: Factor out syncobj handling
Date: Wed, 28 Aug 2024 18:26:01 +0100
Message-ID: <20240828172605.19176-6-mihail.atanassov@arm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240828172605.19176-1-mihail.atanassov@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::10) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB6551:EE_|DB5PEPF00014B8C:EE_|AS8PR08MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f8a603-12c6-4f6a-d61d-08dcc7869c00
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?qfUxHBytr7mLBBJKwDvvr4SWTv/JicsftDfdX3Yy6ZL2ORZtK8VP36AyV0KY?=
 =?us-ascii?Q?gCyk57/nmRLI2kBlM9DgRpPaBoczOQx1nX33F8Y7Lws+ahFiFLMh4XGsFXDk?=
 =?us-ascii?Q?0YeBsWRO3kEwq4R/wlTTic2xLAL7hubg+Yv+AjBltfZM+czCndeCx1kBXwCP?=
 =?us-ascii?Q?BBBvA/yPBhCxz/0feuLsDQEq9a4N+yFdFzhQGi4PFokEsTCu0xUGOQOBg/nM?=
 =?us-ascii?Q?lWl1pATYS5MFsc9pS3C36CXyMsDiG5wed4RWYmWCe9otdsMfILCITqm59lgm?=
 =?us-ascii?Q?cQt6yhxyq3vWWziXiBAgRtmfo+g7fX0s5q1nc4t+rmy1gDWKAUH4Rr46Yb6L?=
 =?us-ascii?Q?8M2DHbTlwx8G1GlDdMfadDkrGR1cg8eeFFWpEx3sWIuRcryENyI5FOh194ad?=
 =?us-ascii?Q?nBt+FFYIPt9jKffzIpUIhx7eAut5PSV4rFwBvHeysPq9c1sA0Rj0CdNAznve?=
 =?us-ascii?Q?cB/yYKFyIOUkYxZq6f3V/2OuX/oqvcQlinXTIKkJVxRWn5fNm+hzxiC19QFj?=
 =?us-ascii?Q?ObOz05UnrErxFMha4atJCUFF+AoB9B23pU4PP7I7QY053pWqQOxnVNFG84uZ?=
 =?us-ascii?Q?LZgY6RJdUCBoicOxgkEeadfH8l9w0QLmE2yIiVlzDZ1gq0xVxDAI55xS8mf9?=
 =?us-ascii?Q?+V6Jpl1B/Bxc42XjviXzrLEfWx/j34TE7YFrk/6QVyguB0xjE5dXNeerUXY4?=
 =?us-ascii?Q?Krg7n780sEFPpgvXln8obsLVyqOV4j/oSNxplIs06FptRkAeUh9IfVDQHnTJ?=
 =?us-ascii?Q?xd30NyEwJeQ/iYwUh9Ef4pcTqb/PX7KVVe/YScHwRRAawL1i1z/5hsohp+XI?=
 =?us-ascii?Q?ZODzpxA+qI2zINVmMvZc8SL0urOyYH7TTGXq+N6JVvfL3YQ3Nd1JiQ0XIbO2?=
 =?us-ascii?Q?IksQv1GCIjSY/ZbIgVJZkWFojzNYCpOaVvmkwjoAWSQrk52XA1O67GydOqyk?=
 =?us-ascii?Q?m++1pxS1YxmVgrbrGxZazfmausdlffVO/3xYleSdWUXODRz3N8lXnjjqIzmH?=
 =?us-ascii?Q?BLYAi/0AoKumDZ/zuUQy//mLsERB2SZq9rBuRJX2e0m6+t8CPY4up4FtT32o?=
 =?us-ascii?Q?k85MzHciYmhYfxEg7J/yuvz2FKKhts8bBVksvoRG+aT0FL0+4OUT/qa9dNHw?=
 =?us-ascii?Q?w7x8JdKojtzivs0pDd4I7RD4+9U3oBAVLu3xkHGVbFhG8vqkEUVd9c6xHoc/?=
 =?us-ascii?Q?EhPqsM9lSybo1/KnFHLyhRMAbYmBpcQ6WKfNM3wp+yl+4R6BigGxgdSm9A0I?=
 =?us-ascii?Q?+B4t7Mz0ca3NA4v5Ie5bNPyDMMywN0Wj2SKtX+wAM2c6nukY8IraqEF0QNX8?=
 =?us-ascii?Q?XsHSfTwmoPY/MKPntZ8YxFAYU7wn6OtFp1cGocDxBw5y8Q=3D=3D?=
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
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 01395da6-af7b-4ad3-76df-08dcc7869285
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|35042699022; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4pqHZUfVOhTmGUkDGydq4uSFXCZnuSNlu4w4/+ndPDBw9lm0YgOsElBxOvgM?=
 =?us-ascii?Q?AZPuQUOcjJnVnxcffzkvpxVbGAqBp3uzot8WfbRb3FVrrgJDV4CfSRqjS578?=
 =?us-ascii?Q?1X+9JJpG/7biMhOgXpo3Cox1j9w+j6vc0892jE3/W4hG+W6NwpGAY6E5gqhC?=
 =?us-ascii?Q?gsg6yTAzGpywQYkTjc1tL9GeyEpaWC6c2UUad//6h8RH16TXKcTdinVSUsNI?=
 =?us-ascii?Q?243OqD8RxzICH7UM7ei2OldSPxSAEnj4SMQvP3FTS+GF6gHd7B9doDR9zXf6?=
 =?us-ascii?Q?HIgysNsIJ40ITqemd0sZjyYojvCzgsby2rnFDCqj/AS77XlVmK6MPng2qwIf?=
 =?us-ascii?Q?Mg9qcDDHun8HTHIy9mhgGwCs67vGKqRV1oAydMBZ8W47x9HBjccfRneJuHdh?=
 =?us-ascii?Q?e8eeWSuER9ww2h9ofN0RqG2ZHxM073t/nCYa2eOs64z4p9aK5uebVYPH++1i?=
 =?us-ascii?Q?eDSOg1rBXCc+BCWRPG7/bnLQraBG8rc9u8zh9CK8gS21uS8/fw5uNfOdd7Im?=
 =?us-ascii?Q?J8hHmsf1LHRJSxoW+GVBUTyDE8eoek+txxsm03IF3w7hD0qwjayrpWVhSp+/?=
 =?us-ascii?Q?lzUzACFSl6fKQOIMxXTD3LvueIDjedMh660j7ZpgvVjUO9PIQ1Sdj2SFmpwJ?=
 =?us-ascii?Q?l971niDTkUPndPNFGYmk5qX+b+v7LSMhdPuAlD8AtNBvyX1fbA++yrVaUvlX?=
 =?us-ascii?Q?txWMqaaClzzbhZnebKwDZO3tfrRrpsvy3YZE5mqgRid2c21NgUyoF2CfvsM9?=
 =?us-ascii?Q?nRddWblrVUxw+tax34vYHLruUCyAg4O9FIS1dmTIEMRLu1XkQ+ccx7LNl+Wc?=
 =?us-ascii?Q?iq80VqMp1XCl+FqGYZHqcXpnnHCX9tHaqeikVCOfc3ta3o36oxQMYQioa4gs?=
 =?us-ascii?Q?KyEapEXVLdZSzT2u9BF9lNz2WqgDynD8si7Q9mtcVSSMLGh3KjG9B7NQ+IIk?=
 =?us-ascii?Q?0iX7P8LNUkced5sjiIXv1z3j1sm7LcSjWutHlxwO+LSZVtY1bUEAOwiYhm2m?=
 =?us-ascii?Q?mVdm/hgTyCNQKuCZc4iLo3Hm40KXwpxciC0yKlPQrUa0bQb8pPLsuj+F2nYJ?=
 =?us-ascii?Q?O0gB21y22QbeVXTpTj3ZPKhIMGywUQMPGWYcIxhXCMMqox9eE7Mv7Ce9vfz0?=
 =?us-ascii?Q?ETBrd0NY51vUJVMqESenZL9uo5/ddluQ2NTgktJWOV80+oaGbRY715g/4RPC?=
 =?us-ascii?Q?qo1Jc5faWdG5b3JcRmsxpp4jSo+kSAJ85fRcSEvucyPJjLxKbm6yYIAtiKAh?=
 =?us-ascii?Q?40vdsHGRIScWkyjtBCw0Qg0usK/HHzmL4nSsyeC4mgyHxVr2zw8jagnW9CSR?=
 =?us-ascii?Q?XopxbgFAFOnHdn3kpsItc6Mj59pPDOfVErYjrWAA+ZAwwZiwZUBu0eMxXkyY?=
 =?us-ascii?Q?MLr9ByP+ItLbqY0xzDwE2BkXYVy7cSfD0qvkbpNWRS/h4xFJooJCDZMUq55h?=
 =?us-ascii?Q?pJBy4u67kIiMXDkmjOBXEaLeaClxV59A?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:26:53.5988 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f8a603-12c6-4f6a-d61d-08dcc7869c00
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9599
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

From: Ketil Johnsen <ketil.johnsen@arm.com>

The code is needed both for the existing kernel submission path and for
implementing cross-group sync (XGS) queues which link between
drm_syncobj and the HW syncobj primitives.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/panthor/Makefile          |   3 +-
 drivers/gpu/drm/panthor/panthor_sched.c   | 154 +++++---------------
 drivers/gpu/drm/panthor/panthor_syncobj.c | 167 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_syncobj.h |  27 ++++
 4 files changed, 234 insertions(+), 117 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..0af27f33bfe2 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -9,6 +9,7 @@ panthor-y := \
 	panthor_gpu.o \
 	panthor_heap.o \
 	panthor_mmu.o \
-	panthor_sched.o
+	panthor_sched.o \
+	panthor_syncobj.o
 
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 3b56526a4b97..f272aeee8a8f 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -31,6 +31,7 @@
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
+#include "panthor_syncobj.h"
 
 /**
  * DOC: Scheduler
@@ -318,39 +319,6 @@ struct panthor_scheduler {
 	} reset;
 };
 
-/**
- * struct panthor_syncobj_32b - 32-bit FW synchronization object
- */
-struct panthor_syncobj_32b {
-	/** @seqno: Sequence number. */
-	u32 seqno;
-
-	/**
-	 * @status: Status.
-	 *
-	 * Not zero on failure.
-	 */
-	u32 status;
-};
-
-/**
- * struct panthor_syncobj_64b - 64-bit FW synchronization object
- */
-struct panthor_syncobj_64b {
-	/** @seqno: Sequence number. */
-	u64 seqno;
-
-	/**
-	 * @status: Status.
-	 *
-	 * Not zero on failure.
-	 */
-	u32 status;
-
-	/** @pad: MBZ. */
-	u32 pad;
-};
-
 /**
  * struct panthor_queue - Execution queue
  */
@@ -445,17 +413,8 @@ struct panthor_queue {
 		/** @sync64: True if this is a 64-bit sync object. */
 		bool sync64;
 
-		/** @bo: Buffer object holding the synchronization object. */
-		struct drm_gem_object *obj;
-
-		/** @offset: Offset of the synchronization object inside @bo. */
-		u64 offset;
-
-		/**
-		 * @kmap: Kernel mapping of the buffer object holding the
-		 * synchronization object.
-		 */
-		void *kmap;
+		/** @syncobj: Wrapper for the syncobj in memory */
+		struct panthor_syncobj *syncobj;
 	} syncwait;
 
 	/** @fence_ctx: Fence context fields. */
@@ -794,53 +753,6 @@ struct panthor_job {
 	struct dma_fence *done_fence;
 };
 
-static void
-panthor_queue_put_syncwait_obj(struct panthor_queue *queue)
-{
-	if (queue->syncwait.kmap) {
-		struct iosys_map map = IOSYS_MAP_INIT_VADDR(queue->syncwait.kmap);
-
-		drm_gem_vunmap_unlocked(queue->syncwait.obj, &map);
-		queue->syncwait.kmap = NULL;
-	}
-
-	drm_gem_object_put(queue->syncwait.obj);
-	queue->syncwait.obj = NULL;
-}
-
-static void *
-panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue *queue)
-{
-	struct panthor_device *ptdev = group->ptdev;
-	struct panthor_gem_object *bo;
-	struct iosys_map map;
-	int ret;
-
-	if (queue->syncwait.kmap)
-		return queue->syncwait.kmap + queue->syncwait.offset;
-
-	bo = panthor_vm_get_bo_for_va(group->vm,
-				      queue->syncwait.gpu_va,
-				      &queue->syncwait.offset);
-	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(bo)))
-		goto err_put_syncwait_obj;
-
-	queue->syncwait.obj = &bo->base.base;
-	ret = drm_gem_vmap_unlocked(queue->syncwait.obj, &map);
-	if (drm_WARN_ON(&ptdev->base, ret))
-		goto err_put_syncwait_obj;
-
-	queue->syncwait.kmap = map.vaddr;
-	if (drm_WARN_ON(&ptdev->base, !queue->syncwait.kmap))
-		goto err_put_syncwait_obj;
-
-	return queue->syncwait.kmap + queue->syncwait.offset;
-
-err_put_syncwait_obj:
-	panthor_queue_put_syncwait_obj(queue);
-	return NULL;
-}
-
 static void group_free_queue(struct panthor_group *group, struct panthor_queue *queue)
 {
 	if (IS_ERR_OR_NULL(queue))
@@ -852,7 +764,7 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
 	if (queue->scheduler.ops)
 		drm_sched_fini(&queue->scheduler);
 
-	panthor_queue_put_syncwait_obj(queue);
+	panthor_syncobj_release(queue->syncwait.syncobj);
 
 	if (queue->ringbuf_offset)
 		drm_vma_node_revoke(&queue->ringbuf->obj->vma_node, group->pfile->drm_file);
@@ -2065,7 +1977,6 @@ group_term_post_processing(struct panthor_group *group)
 	cookie = dma_fence_begin_signalling();
 	for (i = 0; i < group->queue_count; i++) {
 		struct panthor_queue *queue = group->queues[i];
-		struct panthor_syncobj_64b *syncobj;
 		int err;
 
 		if (group->fatal_queues & BIT(i))
@@ -2086,12 +1997,13 @@ group_term_post_processing(struct panthor_group *group)
 		}
 		spin_unlock(&queue->fence_ctx.lock);
 
-		if (!group->user_submit) {
+		if (!group->user_submit)
 			/* Manually update the syncobj seqno to unblock waiters. */
-			syncobj = group->syncobjs->kmap + (i * sizeof(*syncobj));
-			syncobj->status = ~0;
-			syncobj->seqno = atomic64_read(&queue->fence_ctx.seqno);
-		}
+			panthor_syncobj_ptr64_signal_with_error(
+				group->syncobjs->kmap + (i * PANTHOR_SYNCOBJ64_SIZE),
+				atomic64_read(&queue->fence_ctx.seqno),
+				~0);
+
 		sched_queue_work(group->ptdev->scheduler, sync_upd);
 	}
 	dma_fence_end_signalling(cookie);
@@ -2461,28 +2373,32 @@ static void tick_work(struct work_struct *work)
 static int panthor_queue_eval_syncwait(struct panthor_group *group, u8 queue_idx)
 {
 	struct panthor_queue *queue = group->queues[queue_idx];
-	union {
-		struct panthor_syncobj_64b sync64;
-		struct panthor_syncobj_32b sync32;
-	} *syncobj;
+	struct panthor_syncobj *syncobj;
 	bool result;
 	u64 value;
 
-	syncobj = panthor_queue_get_syncwait_obj(group, queue);
-	if (!syncobj)
-		return -EINVAL;
+	if (!queue->syncwait.syncobj) {
+		syncobj = panthor_syncobj_create(group->ptdev,
+						 group->vm,
+						 queue->syncwait.gpu_va,
+						 queue->syncwait.sync64);
+		if (IS_ERR_OR_NULL(syncobj))
+			return PTR_ERR(syncobj);
 
-	value = queue->syncwait.sync64 ?
-		syncobj->sync64.seqno :
-		syncobj->sync32.seqno;
+		queue->syncwait.syncobj = syncobj;
+	}
+
+	value = panthor_syncobj_get_value(queue->syncwait.syncobj);
 
 	if (queue->syncwait.gt)
 		result = value > queue->syncwait.ref;
 	else
 		result = value <= queue->syncwait.ref;
 
-	if (result)
-		panthor_queue_put_syncwait_obj(queue);
+	if (result) {
+		panthor_syncobj_release(queue->syncwait.syncobj);
+		queue->syncwait.syncobj = NULL;
+	}
 
 	return result;
 }
@@ -2887,16 +2803,22 @@ static void group_sync_upd_work(struct work_struct *work)
 	cookie = dma_fence_begin_signalling();
 	for (queue_idx = 0; queue_idx < group->queue_count; queue_idx++) {
 		struct panthor_queue *queue = group->queues[queue_idx];
-		struct panthor_syncobj_64b *syncobj;
+		void *syncobj;
 
 		if (!queue)
 			continue;
 
-		syncobj = group->syncobjs->kmap + (queue_idx * sizeof(*syncobj));
+		syncobj = group->syncobjs->kmap + (queue_idx * PANTHOR_SYNCOBJ64_SIZE);
 
 		spin_lock(&queue->fence_ctx.lock);
 		list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
-			if (syncobj->seqno < job->done_fence->seqno)
+			u64 value;
+
+			if (!job->call_info.size)
+				continue;
+
+			value = panthor_syncobj_ptr64_get_value(syncobj);
+			if (value < job->done_fence->seqno)
 				break;
 
 			list_move_tail(&job->node, &done_jobs);
@@ -2928,7 +2850,7 @@ queue_run_job(struct drm_sched_job *sched_job)
 		       ptdev->csif_info.unpreserved_cs_reg_count;
 	u64 val_reg = addr_reg + 2;
 	u64 sync_addr = panthor_kernel_bo_gpuva(group->syncobjs) +
-			job->queue_idx * sizeof(struct panthor_syncobj_64b);
+			job->queue_idx * PANTHOR_SYNCOBJ64_SIZE;
 	u32 waitall_mask = GENMASK(sched->sb_slot_count - 1, 0);
 	struct dma_fence *done_fence;
 	int ret;
@@ -3289,7 +3211,7 @@ int panthor_group_create(struct panthor_file *pfile,
 	if (!group->user_submit) {
 		group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
 							   group_args->queues.count *
-							   sizeof(struct panthor_syncobj_64b),
+							   PANTHOR_SYNCOBJ64_SIZE,
 							   DRM_PANTHOR_BO_NO_MMAP,
 							   DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
 							   DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
@@ -3304,7 +3226,7 @@ int panthor_group_create(struct panthor_file *pfile,
 			goto err_put_group;
 
 		memset(group->syncobjs->kmap, 0,
-		       group_args->queues.count * sizeof(struct panthor_syncobj_64b));
+		       group_args->queues.count * PANTHOR_SYNCOBJ64_SIZE);
 	}
 
 	for (i = 0; i < group_args->queues.count; i++) {
diff --git a/drivers/gpu/drm/panthor/panthor_syncobj.c b/drivers/gpu/drm/panthor/panthor_syncobj.c
new file mode 100644
index 000000000000..337f75bfa648
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_syncobj.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2024 ARM Limited. All rights reserved. */
+
+#include <linux/iosys-map.h>
+
+#include "panthor_device.h"
+#include "panthor_gem.h"
+#include "panthor_mmu.h"
+#include "panthor_syncobj.h"
+
+/**
+ * struct panthor_syncobj_32b - 32-bit FW synchronization object
+ */
+struct panthor_syncobj_32b {
+	/** @value: Value field. */
+	u32 value;
+
+	/**
+	 * @error: Error status.
+	 *
+	 * Not zero on failure.
+	 */
+	u32 error;
+};
+
+/**
+ * struct panthor_syncobj_64b - 64-bit FW synchronization object
+ */
+struct panthor_syncobj_64b {
+	/** @value: Value field. */
+	u64 value;
+
+	/**
+	 * @error: Error status.
+	 *
+	 * Not zero on failure.
+	 */
+	u32 error;
+
+	/** @pad: MBZ. */
+	u32 pad;
+};
+
+struct panthor_syncobj {
+	/** @bo: Buffer object holding the synchronization object. */
+	struct drm_gem_object *bo;
+
+	/** @offset: Offset of the synchronization object inside @bo. */
+	u64 offset;
+
+	/**
+	 * @kmap: Kernel mapping of the buffer object holding the
+	 * synchronization object.
+	 */
+	void *kmap;
+
+	/** @ptr: CPU ptr to synchronization object */
+	union {
+		struct panthor_syncobj_64b sync64;
+		struct panthor_syncobj_32b sync32;
+	} *ptr;
+
+	/** @sync64: true for 64-bit synchronization object, otherwise 32-bit */
+	bool sync64;
+};
+
+
+
+struct panthor_syncobj *panthor_syncobj_create(struct panthor_device *ptdev,
+					       struct panthor_vm *vm, u64 gpu_va,
+					       bool sync64)
+{
+	struct panthor_gem_object *bo;
+	struct iosys_map map;
+	struct panthor_syncobj *syncobj;
+	int err;
+
+	syncobj = kzalloc(sizeof(*syncobj), GFP_KERNEL);
+	if (!syncobj) {
+		err = -ENOMEM;
+		goto err;
+	}
+
+	bo = panthor_vm_get_bo_for_va(vm, gpu_va, &syncobj->offset);
+	if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(bo))) {
+		err = -EINVAL;
+		goto err_free_syncobj;
+	}
+
+	syncobj->bo = &bo->base.base;
+
+	err = drm_gem_vmap_unlocked(syncobj->bo, &map);
+	if (drm_WARN_ON(&ptdev->base, err))
+		goto err_put_gem_object;
+
+	syncobj->kmap = map.vaddr;
+	syncobj->ptr = syncobj->kmap + syncobj->offset;
+	syncobj->sync64 = sync64;
+
+	return syncobj;
+
+err_put_gem_object:
+	drm_gem_object_put(syncobj->bo);
+err_free_syncobj:
+	kfree(syncobj);
+err:
+	return ERR_PTR(err);
+}
+
+void panthor_syncobj_release(struct panthor_syncobj *syncobj)
+{
+	if (syncobj) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(syncobj->kmap);
+
+		drm_gem_vunmap_unlocked(syncobj->bo, &map);
+		drm_gem_object_put(syncobj->bo);
+		kfree(syncobj);
+	}
+}
+
+u64 panthor_syncobj_get_value(struct panthor_syncobj *syncobj)
+{
+	return syncobj->sync64 ?
+		syncobj->ptr->sync64.value :
+		syncobj->ptr->sync32.value;
+}
+
+u32 panthor_syncobj_get_error(struct panthor_syncobj *syncobj)
+{
+	return syncobj->sync64 ?
+		syncobj->ptr->sync64.error :
+		syncobj->ptr->sync32.error;
+}
+
+void panthor_syncobj_signal(struct panthor_syncobj *syncobj, u64 value)
+{
+	if (syncobj->sync64)
+		syncobj->ptr->sync64.value = value;
+	else
+		syncobj->ptr->sync32.value = (u32)value;
+}
+
+void panthor_syncobj_signal_with_error(struct panthor_syncobj *syncobj, u64 value, u32 error)
+{
+	if (syncobj->sync64) {
+		syncobj->ptr->sync64.value = value;
+		syncobj->ptr->sync64.error = error;
+	} else {
+		syncobj->ptr->sync32.value = (u32)value;
+		syncobj->ptr->sync32.error = error;
+	}
+}
+
+u64 panthor_syncobj_ptr64_get_value(void *syncobj_ptr)
+{
+	struct panthor_syncobj_64b *syncobj = syncobj_ptr;
+
+	return syncobj->value;
+}
+
+void panthor_syncobj_ptr64_signal_with_error(void *syncobj_ptr, u64 value, u32 error)
+{
+	struct panthor_syncobj_64b *syncobj = syncobj_ptr;
+
+	syncobj->value = value;
+	syncobj->error = error;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_syncobj.h b/drivers/gpu/drm/panthor/panthor_syncobj.h
new file mode 100644
index 000000000000..018cfc87cdaa
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_syncobj.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2024 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_SYNCOBJ_H__
+#define __PANTHOR_SYNCOBJ_H__
+
+#define PANTHOR_SYNCOBJ32_SIZE 8
+#define PANTHOR_SYNCOBJ64_SIZE 16
+
+struct panthor_syncobj;
+struct panthor_vm;
+
+struct panthor_syncobj *panthor_syncobj_create(struct panthor_device *ptdev,
+					       struct panthor_vm *vm, u64 gpu_va,
+					       bool sync64);
+void panthor_syncobj_release(struct panthor_syncobj *syncobj);
+
+u64 panthor_syncobj_get_value(struct panthor_syncobj *syncobj);
+u32 panthor_syncobj_get_error(struct panthor_syncobj *syncobj);
+
+void panthor_syncobj_signal(struct panthor_syncobj *syncobj, u64 value);
+void panthor_syncobj_signal_with_error(struct panthor_syncobj *syncobj, u64 value, u32 error);
+
+u64 panthor_syncobj_ptr64_get_value(void *syncobj_ptr);
+void panthor_syncobj_ptr64_signal_with_error(void *syncobj_ptr, u64 value, u32 error);
+
+#endif
-- 
2.45.0

