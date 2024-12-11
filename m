Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110619ED2B5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB09510EBB7;
	Wed, 11 Dec 2024 16:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="f/lRgIB3";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="f/lRgIB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5304C10EBB7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:51:20 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kZHQToOu52yG+SNHsUoWICXyTjR2/3R/bGZTeCDG6X9GowhL+iKAETrmI1kQJfLDibJH7XRgHEPQEC+Y4w7bOWPcp0ANdDJGs4RgHp6sYZ3R6ZF48RhCsz3J7z8ZbMgZiDUr3towC2sZkhCWpEceUKRpZ+BZSJfIqOzTXZtF+qXFMopm4DwPr9AqN+9+hy26AXvETWtffuyX6PblldSDxIVB6Thbr8vyE+JxDdRfwtlDWW/bbh5IClCJtn419GL9Ovf1KadRHZu76dIP+ZWkNIV5+esFmjnTiEi/ezGOf8tUyhh06ElJDrlbzcjqLTLcHo1bpoEIXqR5QxSH/QMcQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKg/67rYZmh6NYjhU9gjQ53VEeK6A3Xe2GXQM/vg0RA=;
 b=mI17xF+CrgDTW3nH2n4GEFeU6GSqZj6cPFWxjiH1uOzShBOok01pNZRR922HlOmk9qlon2jFNsBujBOFKEunXMpSlYkJRKVUYRfg1uxsni/dxfLl3TIKtaS/TkQRGQkBIK+HEuCGXMi8thc6aOw8ndcle5wBLwK9fdNWgDD+z5V2ZqHm4WoGY7jN3ZHWNQYLp/OpairMrxBCopwQtZ84FAzAl03dN3a7PyWtcPACphVjmpQsBsmoXv/SYzeo2bgJ/x5w+fPdEjdCXDM81rtjgHoI92wp3uc8VfVDGbirglmnR2IqYKRo36YMVsFZ3Ro2jlM2igDujM6v+JpEywa2hQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKg/67rYZmh6NYjhU9gjQ53VEeK6A3Xe2GXQM/vg0RA=;
 b=f/lRgIB3WwsDA92oUJsLaYiFWDCc3Lmk4rMMtmnJwRl08lIZme1i1/i5O8UgbOF/gSQQDvpkcIfQJZyJTkE6MnyApG206yASckrBpfgPiJfnzeglB6oeci5zUCxMDQaodsMOi5S4ahdO7nWlYc1d0TAXV0KahF9SnUwhyRvGRL0=
Received: from DB7PR02CA0035.eurprd02.prod.outlook.com (2603:10a6:10:52::48)
 by DU2PR08MB10016.eurprd08.prod.outlook.com (2603:10a6:10:49e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 16:51:14 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::f2) by DB7PR02CA0035.outlook.office365.com
 (2603:10a6:10:52::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Wed,
 11 Dec 2024 16:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 16:51:14 +0000
Received: ("Tessian outbound 2d228e31de9a:v524");
 Wed, 11 Dec 2024 16:51:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e164a7827162b85c
X-TessianGatewayMetadata: wxMRNHlx9L39bHspbKxLxr3AW2TQwIOmcja+JkZbt6ndO7KrG6k7fbFn9JAVIFINwvb34QoJWgMk0+f77oTF0BCt/g562l/FRzjcvr95SyoAxnFTloAhkO29/FYta8QOeKVapRv/IPWKjaj6s25sXFY2/PQenyogqGHc+MkZSXw=
X-CR-MTA-TID: 64aa7808
Received: from Lf4c2a157c311.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 213540C7-8374-4E74-9716-3B02186A3045.1; 
 Wed, 11 Dec 2024 16:51:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf4c2a157c311.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 16:51:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yF9QsjirKIV4mkm8N0xCPNHQzMBC4X35fdg1bEpzQARAW++4jBiXwkMCdIX0aYHOGmiFLGY6bNwVY4LJ+DBfqfyStLLt1MF9/i58wsfP/aZgaTya7saUDkoVB14DsYgR+dWyTG0Pw973H2waq76bceTa7ztw7JsnPz9nvq4F3f8lzYAEIrIbublMlMCTl4aEI2Pw3Y6oo82F9YDQqEU+ViHTbTi2SYiiFkaDAQw5M2frAmtxXYrPZajaqXxgMKs8nAX+mQ/w8OvM2msuixIcNazB7uCOyTDWhWm17wTTz+FJtS8P8I4/Kg3x4cTknnLds7SdOOn6IrkJ2begyhyKcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKg/67rYZmh6NYjhU9gjQ53VEeK6A3Xe2GXQM/vg0RA=;
 b=rrY0Ptvf4H2LzMAIEExGZjXFrBbTk3RFGID0Bha3+olL+MOBnhNStUIvP21r5rhMiU7aH6Aj1n9vQ296B+hMso8thTV2GpA+3tAByp7wbWFv36/GSRKajOjJGBrFyNH6oGEXfrDa5D36pTMoXFPVf85wBRSA8Culfy6B9SDzCvO4KEQo1WPdbKg7dLGc+ojMjgYVxIz+fhDoZp99ce9mLVr8UqsN0UYuA68ooIni3tyMoMVUCdgqmPigGbWfAUlnispVtriQZrSz/uWFK7uTsZ9UfPN2JRlSx/IM0FBV6jwX7o8HS9Fd3ytmD0IyLvLn62KBiy77yNTj1nNfXESCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKg/67rYZmh6NYjhU9gjQ53VEeK6A3Xe2GXQM/vg0RA=;
 b=f/lRgIB3WwsDA92oUJsLaYiFWDCc3Lmk4rMMtmnJwRl08lIZme1i1/i5O8UgbOF/gSQQDvpkcIfQJZyJTkE6MnyApG206yASckrBpfgPiJfnzeglB6oeci5zUCxMDQaodsMOi5S4ahdO7nWlYc1d0TAXV0KahF9SnUwhyRvGRL0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28)
 by DU0PR08MB8493.eurprd08.prod.outlook.com (2603:10a6:10:406::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 16:51:04 +0000
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897]) by AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897%7]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 16:51:04 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [RFC v2 7/8] drm/panthor: Add suspend/resume handling for the
 performance counters
Date: Wed, 11 Dec 2024 16:50:23 +0000
Message-Id: <20241211165024.490748-8-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211165024.490748-1-lukas.zapolskas@arm.com>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0218.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::19) To AM6PR08MB3317.eurprd08.prod.outlook.com
 (2603:10a6:209:42::28)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3317:EE_|DU0PR08MB8493:EE_|DB1PEPF000509FE:EE_|DU2PR08MB10016:EE_
X-MS-Office365-Filtering-Correlation-Id: 87883752-609a-446e-369e-08dd1a040672
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Q4MaBE183tweZDq/aeTaI4GBfoVDzQYgCcL6URYthgYr9aJdUtHpxI2NXw8/?=
 =?us-ascii?Q?ST7wYEQGv3GQ4y6izI7a1OxBzRLLctAJnApYuyMGQRtNmMtLpaq8JvGReL0Y?=
 =?us-ascii?Q?9EzbTLTDjNI78wvxFQ+E/dKTwZLLSUQ2yrhDSCVa3U6DgJ9Iw10rpGOkv8YP?=
 =?us-ascii?Q?1WKwowaYoazePZ3S2d/DfEcAZ+6IuX6MtF//je9USC2GhW5ScvdXsXww9NQv?=
 =?us-ascii?Q?RrzDJ/Rc/UbTrOro/Q5HMVGJ51ksMsoJ6NhnT6d8mdG+T636ap4N+J/ucuWf?=
 =?us-ascii?Q?ZVCVwdUxn3QyV0Xh7LnlZz5aqcFEycQLkwAQYmFwfSZPTiRZUC88dn4xRu8U?=
 =?us-ascii?Q?4eGaN2Rmy+G66WgaksB7v2K3VMd9BrcSwJJCvXBnARMJ4ymVqHc333HLJxEU?=
 =?us-ascii?Q?nlF0IVkPMCuBfo663b5RGCPFbaeqvDywN2b8EMMrNl0NMY6Af9e853v0D9GV?=
 =?us-ascii?Q?wl3486c+9vfxPZJm79SXn8KNv3S/71ZCOcZy0a0XIW0BC14mbBSmkpG7Nw0R?=
 =?us-ascii?Q?QJYUYqDctkwzdye1NIiXCXWMNwt54vhWxAwBOQshDehF69qUXy1It9rAoIjA?=
 =?us-ascii?Q?5VjLr83sFohuWPNnC//yUAcX66bkxyU9HjAPfN+3qJOE3Q9UYUtjxk3tIRvz?=
 =?us-ascii?Q?hPenQJz555Aqsv10P+Hn+1309GAu8VEuFUI5+SkSaT3hy8P9OMgp06N2StFG?=
 =?us-ascii?Q?h81q+IoEuV+E/ITzCntayMKBmOh4dg4VZLTGTqgcXJnRLACoesVfwWuWscu1?=
 =?us-ascii?Q?9CcsFdqaGbKILvnoDIDYk2oW4RjX5DoOJcH58IjRVkPh4+gj8qvZEH+6ibdh?=
 =?us-ascii?Q?Lmi7juAt1IG1nHZyQeMgfwNCmzEo6NbKnsBCth107EmUu/CZ4wXweT89y1Og?=
 =?us-ascii?Q?blooTyT2sk7VePS9aXjsbY8owj1dxnntcV0d84Q65lQnU0Xf3hzUwT5g52xC?=
 =?us-ascii?Q?88L3l0WQ2sY/6vuspOArhHsIqERKJznmYVKLLFRH7D7F3ZM9qRoqR8JSbUfv?=
 =?us-ascii?Q?iy4+eD7iApGtk/Lp/OLUAZQ3S78wGniitHx2YQVr4J5C66wRXwXiYEmKP5Dh?=
 =?us-ascii?Q?ujIRQc23ln5ddgP50BiGGIzoQ5e0gHDFmBK0oDb1qFp8+EwkMJ0wWCA9WmTw?=
 =?us-ascii?Q?6pMM6lpgoCCyaSoWU4g9wRp/hMJY8OxiyH32eH07y/SaL4aw091JWxg2JAvT?=
 =?us-ascii?Q?iN67f6kUMYDakQW+pRldQgRCOufThLnYunI1WtTLtKB/911x1pb7iJ5BHnQ3?=
 =?us-ascii?Q?Bsrl1Lc4YqhverYR0fdJxPcAsWGWk9xJ7J/EpUXTnSnuEidswqmpTevk3gnj?=
 =?us-ascii?Q?uNM3iqv/o2AvZN/9M3qTHp8asy4+w+XUp8cVPoNn6glwjQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3317.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8493
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:209:42::28];
 domain=AM6PR08MB3317.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9f9ca443-e79e-4f73-1fd8-08dd1a040060
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|376014|1800799024|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ftl9stvA/xA6OCZdmwHj3nDgN4TWCJa7Ebh/CRBmvJkrl0AwapI6PjUO7la9?=
 =?us-ascii?Q?o8REFHY3u1iuUoNU4TmVzuFcL82iMu8GJ3FYqqdQfVgGJQICkvKqvtwxb37l?=
 =?us-ascii?Q?xZWBemzWG5D/HO6wrAMoyyBbZ+xWZWE3DZ1NfU6Fw+Y66q6xlxXDXX+qR8vM?=
 =?us-ascii?Q?axrBVDkUXMISrX/xPiVZfTeoyxhUeI1kQvewPzgkDurImpxjbzGA8Y8gm+vI?=
 =?us-ascii?Q?Q2p+lF3fxZzBVlSGgnWD0TXUOLawijlaeDCQNrR3ELvStG0xPhf52ErkcE5C?=
 =?us-ascii?Q?cTY/1kXe4tKsskyu0G3e7OH0R5/ofsAWUHdqQJnfJOneXDqMD2h8dVHWAz6j?=
 =?us-ascii?Q?JwZVPj1qPgS2K4WTko5B0HGx2yUAUCEOnlXrK7DpWyY+RHzb+SvmCaL6a3bX?=
 =?us-ascii?Q?BsL009VGlD3381k97b/IpPwQsDdPJhx4L1RvV5PKLT02vm0OcSROOGCttfx5?=
 =?us-ascii?Q?S/JqY9tnPDhzUFWjCq2aUJJXmPQtGu4nPgIyJVoKUuy/wHX31HK2pORXn9bq?=
 =?us-ascii?Q?BnbKYVSu9O3GLM64hX+EZ4ObOBtr4GApXpvM/JZiwjjIpV+89aBGcbur+B7o?=
 =?us-ascii?Q?IWWJAiRLEy8egaxOo98CFyQDoiltck+MR8fzi9c8GOItJIUdxzhnP3ypGfus?=
 =?us-ascii?Q?8SbDUsVM5xMHkgGmzBcqnG6StvBR8GAIEbMtLqR2sVIbbcFtqRbsz+mlLur2?=
 =?us-ascii?Q?7Y7VkxLqnh8DfytIAG1D1aHB66GOYVh06a3aoIUkJynzvuvA3yuWIDk3+vPB?=
 =?us-ascii?Q?A2Hoq4KQ6iUcPvibD6rnYpuUfsZdBzkaXEpIzziqAjoRWXJKHEBdlavtou/t?=
 =?us-ascii?Q?D6P+MuFgsailQyDgp6r28yM2gUZIKKt3kMqBVPSH24HxBm8XPyjibhiLtAq9?=
 =?us-ascii?Q?dqW5iiZTtuoZO0yN0BYK9Iw4pkZ+jGleCgkDc3k5RvqLK6+xH1Nm9S0EuPKE?=
 =?us-ascii?Q?o1zsSNBrqYq9FCi2GW1HwE4pB2Db7mRVUYUdZBGQcG0zb3NEnxcAzFspVR3F?=
 =?us-ascii?Q?81UPZH6cmcM9bI+Dh85piZ0lXmQI1iinGlZj+jRX7qcWbU2XX6hQ+2Wyhpdk?=
 =?us-ascii?Q?4RiNnALd5BN53mww9Fh3QMf3d5a2eBQnf52rbmHpzgTI7qXgtCFySbCbrAFp?=
 =?us-ascii?Q?XkMTemcj5Cdhz8hNiSP21usSl+ax4lDtEZwWPU4mHO+8N6KDGahlNJGZlund?=
 =?us-ascii?Q?zCqRKwATojP6aecZQGolm23yxfcM/rzD/WBTg1kL7LjXtpi8U9jYHFmbOSMK?=
 =?us-ascii?Q?IRUkc2hYyngofZA8nbjg9AsrkXrLot7OaXAWnVl8x+Cis3oUGzWuhfPH6tCj?=
 =?us-ascii?Q?jJ3JEE0zj9srTUFQyKZNtNOG/QddGE/5sXb+nZ+lGWmiZjh55vn72PR/hgAW?=
 =?us-ascii?Q?WIUp6gZwQkddKopn6Z0+uBlp3nk9wczvt94KC7dyrysFZN/YjFOCmW6qdwjk?=
 =?us-ascii?Q?tFaAeiyWCOI036xXjH83Vqx7wbTvQzhS1zlFQuOg67y5UAHW+r5i+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(14060799003)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 16:51:14.6349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87883752-609a-446e-369e-08dd1a040672
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10016
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

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  3 +
 drivers/gpu/drm/panthor/panthor_perf.c   | 86 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |  2 +
 3 files changed, 91 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 1a81a436143b..69536fbdb5ef 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -475,6 +475,7 @@ int panthor_device_resume(struct device *dev)
 		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
 		if (!ret) {
 			panthor_sched_resume(ptdev);
+			panthor_perf_resume(ptdev);
 		} else {
 			panthor_mmu_suspend(ptdev);
 			panthor_gpu_suspend(ptdev);
@@ -543,6 +544,7 @@ int panthor_device_suspend(struct device *dev)
 	    drm_dev_enter(&ptdev->base, &cookie)) {
 		cancel_work_sync(&ptdev->reset.work);
 
+		panthor_perf_suspend(ptdev);
 		/* We prepare everything as if we were resetting the GPU.
 		 * The end of the reset will happen in the resume path though.
 		 */
@@ -561,6 +563,7 @@ int panthor_device_suspend(struct device *dev)
 			panthor_mmu_resume(ptdev);
 			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
 			panthor_sched_resume(ptdev);
+			panthor_perf_resume(ptdev);
 			drm_dev_exit(cookie);
 		}
 
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index d62d97c448da..727e66074eab 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -433,6 +433,17 @@ static void panthor_perf_em_zero(struct panthor_perf_enable_masks *em)
 		bitmap_zero(em->mask[i], PANTHOR_PERF_EM_BITS);
 }
 
+static bool panthor_perf_em_empty(const struct panthor_perf_enable_masks *const em)
+{
+	bool empty = true;
+	size_t i = 0;
+
+	for (i = DRM_PANTHOR_PERF_BLOCK_FW; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
+		empty &= bitmap_empty(em->mask[i], PANTHOR_PERF_EM_BITS);
+
+	return empty;
+}
+
 static void panthor_perf_destroy_em_kref(struct kref *em_kref)
 {
 	struct panthor_perf_enable_masks *em = container_of(em_kref, typeof(*em), refs);
@@ -1652,6 +1663,81 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
 	}
 }
 
+static int panthor_perf_sampler_resume(struct panthor_perf_sampler *sampler)
+{
+	int ret;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return 0;
+
+	if (!panthor_perf_em_empty(sampler->em)) {
+		guard(mutex)(&sampler->config_lock);
+		panthor_perf_fw_write_em(sampler, sampler->em);
+	}
+
+	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int panthor_perf_sampler_suspend(struct panthor_perf_sampler *sampler)
+{
+	int ret;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return 0;
+
+	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system is suspending.
+ *
+ * This function must not be used to handle MCU power state transitions: just before MCU goes
+ * from on to any inactive state, an automatic sample will be performed by the firmware, and
+ * the performance counter firmware state will be restored on warm boot.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_suspend(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return 0;
+
+	return panthor_perf_sampler_suspend(&perf->sampler);
+}
+
+/**
+ * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system has resumed. This must not be used
+ * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
+ * @panthor_perf_suspend.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_resume(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return 0;
+
+	return panthor_perf_sampler_resume(&perf->sampler);
+}
+
 /**
  * panthor_perf_unplug - Terminate the performance counter subsystem.
  * @ptdev: Panthor device.
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index 3485e4a55e15..a22a511a0809 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -16,6 +16,8 @@ struct panthor_perf;
 void panthor_perf_info_init(struct panthor_device *ptdev);
 
 int panthor_perf_init(struct panthor_device *ptdev);
+int panthor_perf_suspend(struct panthor_device *ptdev);
+int panthor_perf_resume(struct panthor_device *ptdev);
 void panthor_perf_unplug(struct panthor_device *ptdev);
 
 int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
-- 
2.25.1

