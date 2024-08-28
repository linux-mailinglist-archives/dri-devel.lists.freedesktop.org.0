Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F59F962E73
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 19:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41C710E42E;
	Wed, 28 Aug 2024 17:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="WuShEUxk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WuShEUxk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2070.outbound.protection.outlook.com [40.107.241.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BA110E42E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 17:27:35 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AY543w3StQghhKnYbLrDQT78o02fGXSWNzknML0BcHbcLfDS/9pFPoPeOHfstK3J9FbJA22hjaB/z6V25EvHLB5JKq1gdeCDBxJqYx53znaT/6FtMQgs3+8eBLxeiUSu17mTokA7NhvUOC5Y9M13OT6lMNKtzq3Lb8qqas5DJuK1v5VCyzdh2tTiMG3a9BHfFBEe6/ASCKfpiNsajs+5pE18TuL1Z9QRTKuQo4ZMonUhp4vP+MrTSYOhrKF3fyqxrmWrrPq7nk7l5lKRR6N7nKYKUPzztjCO7nmKO8ZgphaWnPUoBVi5x4GZ3jnSapjYJi1i9FXj5XElIDGYvy+CQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXCyxG0usG7a1DvzITihDgiGfgG7tlcbmCP4nOK6SOU=;
 b=VY+BgVJtpo9iG8IyTxW63oO5+YuHzKAaDyeBAyZ/GrJi/qmEAdJdP5Xjjxw63FnM87F0CbfH/7me11M0f9ovoO/QYPAKYIoBh4wOb63caMeu8qkicSO1raCgMtr7Gj1V5TW8q8/wn2TtLwTvuhw2fsseHo6FTvUs+8RNYxkIzN6GpXxS2D2WEQvdk9ytD+HAC9qrd8uX9clkv6SdA69L5FKyTHR36WsZf8hgUEoWPVRA+PetC/NOAk1zrrrDsJHL48sJtwB3ZyDBnhMyIgzGX84waJbw+xBDDcKMn5DiUZQA0Q8izaR5TYFwa1d4w6/i1IgNe1jXhtODCC1EjIpLkQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXCyxG0usG7a1DvzITihDgiGfgG7tlcbmCP4nOK6SOU=;
 b=WuShEUxke3VcM9YUWmmeOJchJspauP6QSO9BonEJPHoXi2jui6sYS+KkADHd7ajZ+wHfJEXSUcC6RZU+6RRn6ii4axyxfrExKSu3aMiREn2r3wpJ6gtwv46lGRRg/j6UsMAvXlwKwoev4RWuOWygCClgTuP7lifswR/FZJRLi/o=
Received: from AS9PR04CA0064.eurprd04.prod.outlook.com (2603:10a6:20b:48b::17)
 by DU0PR08MB9799.eurprd08.prod.outlook.com (2603:10a6:10:444::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 17:27:25 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b:cafe::47) by AS9PR04CA0064.outlook.office365.com
 (2603:10a6:20b:48b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Wed, 28 Aug 2024 17:27:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 28 Aug 2024 17:27:25 +0000
Received: ("Tessian outbound 22f8cf4ed816:v403");
 Wed, 28 Aug 2024 17:27:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7dcc06a3ee0b256
X-CR-MTA-TID: 64aa7808
Received: from Ld28cb033b529.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8BE817FC-9AF7-4D39-81D2-0CA4EF7A4BA4.1; 
 Wed, 28 Aug 2024 17:27:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld28cb033b529.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 17:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJoHzw2uPJI4Hz97/kVLRzflYYUFyfdpMZW7XN7Bqx2iX9rnFMnvLcQ6Mj3FA/keHoWtKttFg5f05b1aRehk3zQHM7ejr6+9AoByro3ucwt5IHb9RnM0iUY61Sn8JygqWM7uO+phbE5uh1DvYJixnjf7PDNGrGzN+0M3wJJ0TRKreYjrJvmxD2oov0F62ww1MsyAFHyLe9lgKfEl4BdhyBiYHqj4bhJuAkZn/HYrhCZH11HIN1u6vIB6wIPc9/P1PKdQ1giUI/e/mrjCPcVQfppFu/wBKDY3WlDM95Zcp7yrE5S1Z3ZZ47uRTRjZOMnPRGdUR+sUB9SGGXdajKthMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXCyxG0usG7a1DvzITihDgiGfgG7tlcbmCP4nOK6SOU=;
 b=YhGAC4Sez9vTNH2l4dSuHiEKIeqeineNJylJndc6JF61K8qA1OUqymigNpt8UtUHqgmBaf9+a2PqjiyAB1mDI4xRPrOkCq3c28cNjfIcOcrwKjWf1v6ZhAV/ODszrdSuhe+G74tBdRgB+vGoXB3qSSTb1zDg4w6reV/YDMWcUj463wZlqJdy41ko0FaaMXbG7chcJ3oOk2g2dz99R4N16j8NDfR7H/9qEz/N9TlxL5sUcytVdsNGN0BAJuKNWjhEE+u4+8o8azhfZnfdRJMySAccWdc2AL829cxo8fe+ncafyl43XPA6aOiAlqEY+kqyTDi6oKa6vjVlulRPort5uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXCyxG0usG7a1DvzITihDgiGfgG7tlcbmCP4nOK6SOU=;
 b=WuShEUxke3VcM9YUWmmeOJchJspauP6QSO9BonEJPHoXi2jui6sYS+KkADHd7ajZ+wHfJEXSUcC6RZU+6RRn6ii4axyxfrExKSu3aMiREn2r3wpJ6gtwv46lGRRg/j6UsMAvXlwKwoev4RWuOWygCClgTuP7lifswR/FZJRLi/o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 17:27:11 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 17:27:11 +0000
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
Subject: [PATCH 6/8] drm/panthor: Implement XGS queues
Date: Wed, 28 Aug 2024 18:26:02 +0100
Message-ID: <20240828172605.19176-7-mihail.atanassov@arm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240828172605.19176-1-mihail.atanassov@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0395.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::22) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS8PR08MB6551:EE_|AM4PEPF00027A5F:EE_|DU0PR08MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: fe604c47-6f40-4711-bf3e-08dcc786af35
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?6kUYDRjAH4PXf2RC0CF71iA5l/hQr6WSfZptPkfmel0TISpaGs5R3YTQsvLN?=
 =?us-ascii?Q?IrM1Rw4VrOCXZDCty7H/EdyhqWsc5405MdW9deU5nv5iTKgqRBAE5J+m6Ru+?=
 =?us-ascii?Q?jgDNqZb19fFJV7c6NiyiKvCeEmDJiS2m9YohxYiUroMddVC7REiBcl9XVAnO?=
 =?us-ascii?Q?bENwJ9H/kOtYi/RmCOrMUWvx7sKDpDJZdwrqNYf75ojtT34q4hDrv83Do4SV?=
 =?us-ascii?Q?DnXBSVaEVIgE32Bqnm3E4DGAjOVor/WkWorH8KNUDrZN9pJqeN0Rd1Q59+sC?=
 =?us-ascii?Q?fiWYXziuIiN7JAZTqpun5Djrny8aF33/FeyRx6HcrnepOocIPUertUoeXRKY?=
 =?us-ascii?Q?zW0G43azu6ik5UpExfKyui39Dhj5215oElaANY390yy6yeydiLOZ/+S6b8XM?=
 =?us-ascii?Q?5cexlZqIKZJLqUAMxSn78mlNgsjsi9oohUxN8q4wTwroHOqA/VJFGarsgXHs?=
 =?us-ascii?Q?o6Y/i2HC1JCvhFAoQ+ayjPwQ2ZW/cu3UmYqRhe+M8av0scGo5ttrOQo/i04l?=
 =?us-ascii?Q?rzFg0TNaioRZSuZnJFjehROO7ycccBTkFrYDJWmoPiEjHeUhkkdJa/2xb1jJ?=
 =?us-ascii?Q?ORrUsIsUjjMK5BsbJAIPQX5cXkikQQhXi+6XON5lAtuldiOT3BlbpT5iR0Mu?=
 =?us-ascii?Q?VLUXJPijEF+CMF4k62mLTiWsxefX8NVcZEEOphZnqkPM0x0hETZy0tXBLGNQ?=
 =?us-ascii?Q?PLvLOWx28w7mjEeQT4DIYclD3Kl+8umZbKQxE2ra8Bt8B+1t9/l2aSd7PkKc?=
 =?us-ascii?Q?59eeVZxKWUfciyTZC8kRyOR2j8sI2NtEB09iu4GJLSeNYnDKKPk69JlsulmW?=
 =?us-ascii?Q?CyAaMWee13P+Isa9m6apiwXijZTUjcMEf2sCHe+YRWc9anJscqMREQ2MFgR+?=
 =?us-ascii?Q?krILxGO9Z0BmFDxYCHsfZQboE+bUlcD9YSS8eyNPjB1qeUOmSIpiA0nXiefo?=
 =?us-ascii?Q?QxYxikPqDQGJIL/6fq5REESB4CO5vYPoZJGTAm4orzkm+iHE5sUtLliQLV8r?=
 =?us-ascii?Q?5sqDONIDLjqSVPHLqdiM19VZ3VH0u29dOTYx7VodwuY3kXWSrX+WRaZcc3t3?=
 =?us-ascii?Q?8Y/f7GtJ4F7ocxys5BVn9SO+2z9v5xDkvQ0j4mroBYmK80myjxbQuUUN3jQS?=
 =?us-ascii?Q?wx0vrwhu7BbEm1+e9y/zwBNbBdombRLKCIlpL2ZTToLijym9+CVNSeyH01qO?=
 =?us-ascii?Q?wlsyneekbowrpvfg83bDZnrvFix89vVAA9i+S8NMuly14SBcY+mZ4xnaORCP?=
 =?us-ascii?Q?sW/oMPrt2Jz7UE1dcfQOOfQeO21WdGS1Ckp8wGWLPLwHu0o6meMXBTPkoWyl?=
 =?us-ascii?Q?xu53FePPyJJZ5C1FDeeJWXMjytHIKn57f5duF6i4RVPveQ=3D=3D?=
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
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 58034394-4022-4958-eba0-08dcc786a69b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|35042699022|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dBaa900R7Bs9GHyzYSh4Xw2WwG7eKnzEE4UfIfymtDQj7JAae6YCsQYgXO7C?=
 =?us-ascii?Q?usswvSoW0xf6LjOmypDTW2IRO2gE2XWgMMGUEJqI6cvYzs9X+7f5M63DJvGP?=
 =?us-ascii?Q?bN2XT5VMxBX+2L/By3GK84vaAKz1rzHov811j2Y3gmaNDUMNnf+WcMQ0/Gpo?=
 =?us-ascii?Q?kSsL7NdZ7p23XuRbO4CJIDh+t6I1mhIdNivzFRiZ29aFbIJ1aoQBpG0TbPfg?=
 =?us-ascii?Q?JSL2fhHHujdIZdMOCQ8pd67KzMogxBn3+8ftgnECqa6XGonPBfYQE30iZ4mh?=
 =?us-ascii?Q?ybb71qD1weT1cUmKWXzhuvF4oMNTLC+Nlm6O3Pp+Ucr2u0xPO4fEpLBbMfuY?=
 =?us-ascii?Q?7abU9fng7EHva4SfQYU7CJIfceg/qIxb2UkROA+f6zW/e1SMOtAw3fYm3qN0?=
 =?us-ascii?Q?MUn1LuPFlrCvLCyLBS7Hau+eYCgDDbH/sH5caLDgC/3tUq5/1hWCRWgrPKsu?=
 =?us-ascii?Q?HKYLkvDDV6vHVMIVY/rwbmCq1C6uMPFaPsxNpRmb9iSbK19kKEKoKXKbfc5y?=
 =?us-ascii?Q?vRwHS3xQf6BzT0Ig5bZ4BzI/M7uD9hqytGlR1jkj6FkpFZe+FiOx0myYrbMb?=
 =?us-ascii?Q?sgQcg/ywbGgcllU8L2RS5IiT9KSjnJP6svWX155v/60lxFpIAv6+udy9e4Px?=
 =?us-ascii?Q?IQsaS3jYF6NPw7dZEV/tYhrg6wG/TRu5T9RhMM1afbvJ1FYiMtORTAwV3rCk?=
 =?us-ascii?Q?ib1u9V/ptFcgXbcLmwTFDxzHhNonnkwJDUssn/7zWRmUCbUlMKimbHzqA10H?=
 =?us-ascii?Q?9nAJKQPKl413kf1Z5VJXbM1+e9wttGD0rnOLSpne5lzDzF7DgNPHXRCkNq+F?=
 =?us-ascii?Q?xh1tqvjsfskz+70wnvff5g5bW58p74lnRJ8LkHK2VUSzycTuowBnhHy7Cau0?=
 =?us-ascii?Q?a+JUzZcRT0+Kydqt/p8jlnDyiWBnnNj8zk5v+Nh6hrhw/8cmTlglD+CLFI/S?=
 =?us-ascii?Q?Gs/6n6NtlS+odoP6mD4OHZ8qtcyndUkTtGb9jbT7O4UN7YXb66Cdj0gjlbO2?=
 =?us-ascii?Q?72v49fxhiVu3XFUMtC6+Ttct6twArT9aoIplHCtdD+xBHE1PY0X3/AFKV1EZ?=
 =?us-ascii?Q?GsL9zwcY9b639x1zb1sE9tG/a5KH0Y3hk2DyQ8RPMdvzwE/ED0xQtfQoplu3?=
 =?us-ascii?Q?4JqckcaIU+StK3WAbkhC0FdT1hHV+sR8OnhM6p0WjRtzTZOfPLukRqlQREDE?=
 =?us-ascii?Q?VTmBXXM4+e2g/+2ZD4+X6bJo3Bc1gwusqDwRgusN1tNPVG/4floQN4B6uFR8?=
 =?us-ascii?Q?UyRr7GqsZgvp1+duOl3DJQ7WkwWrTXmehqRlvf7oRUocU8aMWacjiqC9W1pN?=
 =?us-ascii?Q?IwgEjdwNmorUXRNRb2Nzkg9rCaKs+i+/kPQ6OTsqPjauydQYTpEVViee3qtN?=
 =?us-ascii?Q?yJ3QOxegKNsvfMi+s67q4k+NQ5RyqGoKCx/7HV6aEFNtbIfYOFYlS8qJvdNK?=
 =?us-ascii?Q?1XWCRY6z9g41J9306slGfv44nhYkPvfq?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 17:27:25.8066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe604c47-6f40-4711-bf3e-08dcc786af35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9799
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

Synchronisation between GPU queues in groups from the same VM is
achieved using either 32b or 64b synchronisation objects (see
panthor_syncobj.(c|h)). They are also the mechanism to sync between
a queue and the kernel (or the user application). To allow for the
latter case, introduce cross-group sync (XGS) queues. They are a drm
scheduler-entity pair, associated with a VM, which runs XGS jobs --
WAITs or SETs/ADDs on those HW syncobjs -- to enable a userspace driver
to do CPU-to-GPU (and vice-versa) synchronisation, and link that up with
DRM sync primitives.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
Co-developed-by: Akash Goel <akash.goel@arm.com>
Signed-off-by: Akash Goel <akash.goel@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |   3 +-
 drivers/gpu/drm/panthor/panthor_device.h |   4 +
 drivers/gpu/drm/panthor/panthor_drv.c    | 123 ++++-
 drivers/gpu/drm/panthor/panthor_sched.c  |  25 +-
 drivers/gpu/drm/panthor/panthor_sched.h  |   1 +
 drivers/gpu/drm/panthor/panthor_xgs.c    | 638 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_xgs.h    |  42 ++
 7 files changed, 832 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 0af27f33bfe2..7637bae47e26 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -10,6 +10,7 @@ panthor-y := \
 	panthor_heap.o \
 	panthor_mmu.o \
 	panthor_sched.o \
-	panthor_syncobj.o
+	panthor_syncobj.o \
+	panthor_xgs.o
 
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 87cce384e36a..1e98d2a856b7 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -17,6 +17,7 @@
 #include <drm/gpu_scheduler.h>
 #include <drm/panthor_drm.h>
 
+struct panthor_xgs_queue_pool;
 struct panthor_csf;
 struct panthor_csf_ctx;
 struct panthor_device;
@@ -182,6 +183,9 @@ struct panthor_file {
 
 	/** @groups: Scheduling group pool attached to this file. */
 	struct panthor_group_pool *groups;
+
+	/** @xgs_queues: XGS queues attached to this file. */
+	struct panthor_xgs_queue_pool *xgs_queues;
 };
 
 int panthor_device_init(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ce2fdcd3fb42..681ac09b6343 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -19,6 +19,7 @@
 #include <drm/gpu_scheduler.h>
 #include <drm/panthor_drm.h>
 
+#include "panthor_xgs.h"
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gem.h"
@@ -215,7 +216,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_xgs_op, pad))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -1316,6 +1318,114 @@ static int panthor_ioctl_group_kick(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+static int panthor_ioctl_xgs_queue_create(struct drm_device *ddev, void *data,
+					  struct drm_file *file)
+{
+	struct drm_panthor_xgs_queue_create *args = data;
+	struct panthor_file *pfile = file->driver_priv;
+
+	if (args->pad)
+		return -EINVAL;
+
+	return panthor_xgs_queue_create(pfile, args->vm_id,
+					args->eventfd_sync_update, &args->handle);
+}
+
+static int panthor_ioctl_xgs_queue_destroy(struct drm_device *ddev, void *data,
+					   struct drm_file *file)
+{
+	struct drm_panthor_xgs_queue_destroy *args = data;
+	struct panthor_file *pfile = file->driver_priv;
+
+	if (args->pad)
+		return -EINVAL;
+
+	return panthor_xgs_queue_destroy(pfile, args->handle);
+}
+
+#define XGS_QUEUE_SUBMIT_FLAGS (DRM_PANTHOR_XGS_QUEUE_SUBMIT_ERROR_BARRIER_PRE | \
+				DRM_PANTHOR_XGS_QUEUE_SUBMIT_ERROR_BARRIER_POST)
+
+static int panthor_ioctl_xgs_queue_submit(struct drm_device *ddev, void *data,
+					  struct drm_file *file)
+{
+	struct drm_panthor_xgs_queue_submit *args = data;
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_panthor_xgs_op *ops_args;
+	struct panthor_xgs_queue *queue;
+	struct panthor_submit_ctx ctx;
+	struct drm_sched_job *job;
+	struct panthor_vm *vm;
+	int ret;
+
+	if (args->flags & ~XGS_QUEUE_SUBMIT_FLAGS)
+		return -EINVAL;
+
+	if (args->ops.count) {
+		ret = PANTHOR_UOBJ_GET_ARRAY(ops_args, &args->ops);
+		if (ret)
+			return ret;
+	} else {
+		ops_args = NULL;
+	}
+
+	queue = panthor_xgs_queue_pool_get_xgs_queue(pfile->xgs_queues, args->handle);
+	if (!queue)
+		goto out_free_ops_args;
+
+	ret = panthor_submit_ctx_init(&ctx, file, 1);
+	if (ret)
+		goto out_put_queue;
+
+	/* Create job object */
+	job = panthor_xgs_job_create(queue, ops_args, args->ops.count);
+	if (IS_ERR(job)) {
+		ret = PTR_ERR(job);
+		goto out_cleanup_submit_ctx;
+	}
+
+	/* handed over to the job object */
+	ops_args = NULL;
+
+	/* attach sync operations */
+	ret = panthor_submit_ctx_add_job(&ctx, 0, job, &args->syncs);
+	if (ret)
+		goto out_cleanup_submit_ctx;
+
+	/* Collect signal operations on all */
+	ret = panthor_submit_ctx_collect_jobs_signal_ops(&ctx);
+	if (ret)
+		goto out_cleanup_submit_ctx;
+
+	/* The group already have a VM ref, so we don't need to take an extra one */
+	vm = panthor_xgs_queue_vm(queue);
+
+	/* We acquire/prepare revs on the job */
+	drm_exec_until_all_locked(&ctx.exec) {
+		ret = panthor_vm_prepare_mapped_bos_resvs(&ctx.exec, vm, 1);
+	}
+
+	if (ret)
+		goto out_cleanup_submit_ctx;
+
+	/* Add deps, arm job fence and register the job fence to signal array */
+	ret = panthor_submit_ctx_add_deps_and_arm_jobs(&ctx);
+	if (ret)
+		goto out_cleanup_submit_ctx;
+
+	/* Nothing can fail after that point */
+	panthor_submit_ctx_push_jobs(&ctx, panthor_xgs_job_update_resvs);
+
+out_cleanup_submit_ctx:
+	panthor_submit_ctx_cleanup(&ctx, panthor_xgs_job_put);
+out_put_queue:
+	panthor_xgs_queue_put(queue);
+out_free_ops_args:
+	kvfree(ops_args);
+
+	return ret;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1343,9 +1453,16 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	if (ret)
 		goto err_destroy_vm_pool;
 
+	ret = panthor_xgs_queue_pool_create(pfile);
+	if (ret)
+		goto err_destroy_group_pool;
+
 	file->driver_priv = pfile;
 	return 0;
 
+err_destroy_group_pool:
+	panthor_group_pool_destroy(pfile);
+
 err_destroy_vm_pool:
 	panthor_vm_pool_destroy(pfile);
 
@@ -1363,6 +1480,7 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
 	struct panthor_file *pfile = file->driver_priv;
 
 	panthor_group_pool_destroy(pfile);
+	panthor_xgs_queue_pool_destroy(pfile);
 	panthor_vm_pool_destroy(pfile);
 
 	kfree(pfile);
@@ -1387,6 +1505,9 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_KICK, group_kick, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(XGS_QUEUE_CREATE, xgs_queue_create, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(XGS_QUEUE_DESTROY, xgs_queue_destroy, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(XGS_QUEUE_SUBMIT, xgs_queue_submit, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index f272aeee8a8f..92172b2c6253 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -22,6 +22,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include "panthor_xgs.h"
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
 #include "panthor_fw.h"
@@ -1496,8 +1497,13 @@ static void csg_slot_sync_update_locked(struct panthor_device *ptdev,
 
 	lockdep_assert_held(&ptdev->scheduler->lock);
 
-	if (group && !group->user_submit)
-		group_queue_work(group, sync_upd);
+	if (group) {
+		/* Rerun XGS jobs immediately, as this can potentially unblock the group */
+		panthor_xgs_queue_pool_recheck(group->pfile);
+
+		if (!group->user_submit)
+			group_queue_work(group, sync_upd);
+	}
 
 	sched_queue_work(ptdev->scheduler, sync_upd);
 }
@@ -1691,9 +1697,15 @@ static const char *queue_fence_get_timeline_name(struct dma_fence *fence)
 	return "queue-fence";
 }
 
+static void job_fence_free(struct dma_fence *fence)
+{
+	dma_fence_free(fence);
+}
+
 static const struct dma_fence_ops panthor_queue_fence_ops = {
 	.get_driver_name = fence_get_driver_name,
 	.get_timeline_name = queue_fence_get_timeline_name,
+	.release = job_fence_free,
 };
 
 struct panthor_csg_slots_upd_ctx {
@@ -2431,6 +2443,10 @@ static void sync_upd_work(struct work_struct *work)
 		if (unblocked_queues) {
 			group->blocked_queues &= ~unblocked_queues;
 
+			/* Sync updates from XGS queue could happen when we are not ticking */
+			if (sched->resched_target == U64_MAX)
+				immediate_tick = true;
+
 			if (group->csg_id < 0) {
 				list_move(&group->run_node,
 					  &sched->groups.runnable[group->priority]);
@@ -2788,6 +2804,11 @@ void panthor_sched_kick(struct panthor_file *pfile, u32 group_handle, u32 queue_
 	group_put(group);
 }
 
+void panthor_sched_sync_update(struct panthor_device *ptdev)
+{
+	sched_queue_work(ptdev->scheduler, sync_upd);
+}
+
 static void group_sync_upd_work(struct work_struct *work)
 {
 	struct panthor_group *group =
diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
index 18fb7ad0952e..2cb58c66b8ac 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.h
+++ b/drivers/gpu/drm/panthor/panthor_sched.h
@@ -49,5 +49,6 @@ void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
 
 u8 panthor_sched_doorbell_id(struct panthor_file *pfile, u32 group_handle);
 void panthor_sched_kick(struct panthor_file *pfile, u32 group_handle, u32 queue_mask);
+void panthor_sched_sync_update(struct panthor_device *ptdev);
 
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_xgs.c b/drivers/gpu/drm/panthor/panthor_xgs.c
new file mode 100644
index 000000000000..a900badb9224
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_xgs.c
@@ -0,0 +1,638 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2024 ARM Limited. All rights reserved. */
+
+#include <drm/drm_drv.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_managed.h>
+#include <drm/gpu_scheduler.h>
+#include <drm/panthor_drm.h>
+
+#include <linux/iosys-map.h>
+
+#include "panthor_xgs.h"
+#include "panthor_device.h"
+#include "panthor_gem.h"
+#include "panthor_mmu.h"
+#include "panthor_sched.h"
+#include "panthor_syncobj.h"
+
+#define JOB_TIMEOUT_MS				5000
+
+/**
+ * struct panthor_xgs_queue - Scheduling group object
+ */
+struct panthor_xgs_queue {
+	/** @refcount: Reference count */
+	struct kref refcount;
+
+	/** @lock: Lock to synchronize access to this queue */
+	struct mutex lock;
+
+	/** @handle: integer value used by user to refer to this queue */
+	u32 handle;
+
+	/** @ptdev: Panthor device for which this queue was created */
+	struct panthor_device *ptdev;
+
+	/** @vm: VM associated with this XGS queue */
+	struct panthor_vm *vm;
+
+	/** @eventfd_sync_update_ctx: eventfd context to signal on XGS set ops */
+	struct eventfd_ctx *eventfd_sync_update_ctx;
+
+	/** @scheduler: scheduler instance used to execute XGS jobs */
+	struct drm_gpu_scheduler scheduler;
+
+	/** @entity: Scheduler entity with XGS jobs */
+	struct drm_sched_entity entity;
+
+	/** @fence_ctx: Fence context fields. */
+	struct {
+		/** @lock: Used to protect access to all fences allocated by this context. */
+		spinlock_t lock;
+
+		/**
+		 * @id: Fence context ID.
+		 *
+		 * Allocated with dma_fence_context_alloc().
+		 */
+		u64 id;
+
+		/** @seqno: Sequence number of the last initialized fence. */
+		atomic64_t seqno;
+
+		/**
+		 * @in_flight_jobs: List containing all in-flight jobs.
+		 *
+		 * Used to keep track and signal panthor_job::done_fence when the
+		 * synchronization object attached to the queue is signaled.
+		 */
+		struct list_head in_flight_jobs;
+	} fence_ctx;
+
+	/** @destroyed: True if queue is marked for destruction and should not be used */
+	bool destroyed;
+
+	/**
+	 * @release_work: Work used to release XGS queue resources.
+	 *
+	 * We need to postpone the queue release to avoid a deadlock,
+	 * otherwise "free_job" could end up calling back into DRM sched.
+	 */
+	struct work_struct release_work;
+};
+
+/*
+ * We currently set the maximum of XGS queues per file to an arbitrary low value.
+ * But this can be updated if we need more.
+ */
+#define MAX_XGS_QUEUES_PER_POOL 128
+
+/**
+ * struct panthor_xgs_queue_pool - XGS queue pool
+ *
+ * Each file get assigned a XGS queue pool.
+ */
+struct panthor_xgs_queue_pool {
+	/** @xa: Xarray used to manage XGS queue handles. */
+	struct xarray xa;
+};
+
+/**
+ * struct panthor_xgs_job - Used to manage XGS job
+ */
+struct panthor_xgs_job {
+	/** @base: Inherit from drm_sched_job. */
+	struct drm_sched_job base;
+
+	/** @refcount: Reference count. */
+	struct kref refcount;
+
+	/** @group: XGS queue this job will be pushed to. */
+	struct panthor_xgs_queue *queue;
+
+	/** @ops: List of XGS operations to execute */
+	struct drm_panthor_xgs_op *ops;
+
+	/** @ops_count: Number of operations in the ops array */
+	u32 ops_count;
+
+	/** @done_fence: Fence signaled when the job is finished or cancelled. */
+	struct dma_fence *done_fence;
+
+	/** @node: Node used to insert job into in_flight_jobs list of queue */
+	struct list_head node;
+
+};
+
+static int panthor_xgs_try_run_job(struct panthor_xgs_job *job);
+
+static const char *xgs_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "panthor";
+}
+
+static const char *xgs_fence_get_timeline_name(struct dma_fence *fence)
+{
+	return "xgs-fence";
+}
+
+static void xgs_fence_free(struct dma_fence *fence)
+{
+	dma_fence_free(fence);
+}
+
+static const struct dma_fence_ops panthor_xgs_fence_ops = {
+	.get_driver_name = xgs_fence_get_driver_name,
+	.get_timeline_name = xgs_fence_get_timeline_name,
+	.release = xgs_fence_free,
+};
+
+static void xgs_queue_release_work(struct work_struct *work)
+{
+	struct panthor_xgs_queue *queue = container_of(work, struct panthor_xgs_queue,
+						       release_work);
+
+	if (queue->entity.fence_context)
+		drm_sched_entity_destroy(&queue->entity);
+
+	if (queue->scheduler.ops)
+		drm_sched_fini(&queue->scheduler);
+
+	panthor_vm_put(queue->vm);
+
+	if (queue->eventfd_sync_update_ctx)
+		eventfd_ctx_put(queue->eventfd_sync_update_ctx);
+
+	kfree(queue);
+}
+
+static void xgs_queue_release(struct kref *kref)
+{
+	struct panthor_xgs_queue *queue = container_of(kref, struct panthor_xgs_queue, refcount);
+	struct panthor_device *ptdev = queue->ptdev;
+
+	drm_WARN_ON(&ptdev->base, !list_empty(&queue->fence_ctx.in_flight_jobs));
+
+	queue_work(panthor_cleanup_wq, &queue->release_work);
+}
+
+static struct panthor_xgs_queue *xgs_queue_get(struct panthor_xgs_queue *queue)
+{
+	if (queue)
+		kref_get(&queue->refcount);
+
+	return queue;
+}
+
+static void xgs_queue_recheck(struct panthor_xgs_queue *queue)
+{
+	struct panthor_xgs_job *job, *tmp;
+	int ret;
+
+	mutex_lock(&queue->lock);
+
+	list_for_each_entry_safe(job, tmp, &queue->fence_ctx.in_flight_jobs, node) {
+		ret = panthor_xgs_try_run_job(job);
+
+		if (ret != -EBUSY) {
+			/* completed or failed */
+			list_del_init(&job->node);
+
+			if (ret)
+				dma_fence_set_error(job->done_fence, -ETIMEDOUT);
+
+			dma_fence_signal(job->done_fence);
+
+			/* Ditch ref we took when adding it to the in_flight_jobs */
+			panthor_xgs_job_put(&job->base);
+		}
+	}
+
+	mutex_unlock(&queue->lock);
+}
+
+/* Internal flag to mark operations as completed. Avoid clashes with drm_panthor_xgs_op_flags */
+#define DRM_PANTHOR_XGS_OP_COMPLETED (1 << 15)
+
+static int panthor_xgs_wait(struct panthor_xgs_queue *queue, struct drm_panthor_xgs_op *xgs_op)
+{
+	struct panthor_device *ptdev = queue->ptdev;
+	struct panthor_syncobj *syncobj;
+	int ret;
+	u64 value;
+
+	if (xgs_op->flags & DRM_PANTHOR_XGS_OP_COMPLETED)
+		return 0;
+
+	syncobj = panthor_syncobj_create(ptdev, queue->vm, xgs_op->addr,
+					 xgs_op->format == DRM_PANTHOR_XGS_OP_FORMAT_U64);
+	if (IS_ERR_OR_NULL(syncobj))
+		return PTR_ERR(syncobj);
+
+	value = panthor_syncobj_get_value(syncobj);
+
+	ret = -EBUSY;
+
+	if (xgs_op->op == DRM_PANTHOR_XGS_OP_WAIT_LE) {
+		if (value <= xgs_op->value) {
+			ret = 0;
+			xgs_op->flags |= DRM_PANTHOR_XGS_OP_COMPLETED;
+		}
+	} else if (xgs_op->op == DRM_PANTHOR_XGS_OP_WAIT_GT) {
+		if (value > xgs_op->value) {
+			ret = 0;
+			xgs_op->flags |= DRM_PANTHOR_XGS_OP_COMPLETED;
+		}
+	}
+
+	panthor_syncobj_release(syncobj);
+
+	return ret;
+}
+
+static void
+panthor_xgs_signal(struct panthor_xgs_queue *queue, struct drm_panthor_xgs_op *xgs_op, u32 error)
+{
+	struct panthor_device *ptdev = queue->ptdev;
+	struct panthor_syncobj *syncobj;
+	u64 value;
+
+	if (xgs_op->flags & DRM_PANTHOR_XGS_OP_COMPLETED)
+		return;
+
+	syncobj = panthor_syncobj_create(ptdev, queue->vm, xgs_op->addr,
+					 xgs_op->format == DRM_PANTHOR_XGS_OP_FORMAT_U64);
+	if (IS_ERR_OR_NULL(syncobj))
+		return;
+
+	value = panthor_syncobj_get_value(syncobj);
+
+	if (xgs_op->op == DRM_PANTHOR_XGS_OP_SIGNAL_SET)
+		value = xgs_op->value;
+	else if (xgs_op->op == DRM_PANTHOR_XGS_OP_SIGNAL_ADD)
+		value += xgs_op->value;
+
+	if (!error)
+		panthor_syncobj_signal(syncobj, value);
+	else
+		panthor_syncobj_signal_with_error(syncobj, value, error);
+
+	panthor_sched_sync_update(ptdev);
+
+	if (queue->eventfd_sync_update_ctx)
+		eventfd_signal(queue->eventfd_sync_update_ctx);
+
+	xgs_op->flags |= DRM_PANTHOR_XGS_OP_COMPLETED;
+
+	panthor_syncobj_release(syncobj);
+}
+
+static int panthor_xgs_try_run_job(struct panthor_xgs_job *job)
+{
+	int i;
+	int err_wait = 0;
+	struct drm_panthor_xgs_op *xgs_op;
+
+	lockdep_assert_held(&job->queue->lock);
+
+	for (i = 0; i < job->ops_count; i++) {
+		xgs_op = &job->ops[i];
+
+		switch (xgs_op->op & ~DRM_PANTHOR_XGS_OP_COMPLETED) {
+		case DRM_PANTHOR_XGS_OP_WAIT_LE:
+		case DRM_PANTHOR_XGS_OP_WAIT_GT:
+			if (!err_wait)
+				err_wait = panthor_xgs_wait(job->queue, &job->ops[i]);
+			if (err_wait == -EBUSY)
+				return err_wait;
+			break;
+		case DRM_PANTHOR_XGS_OP_SIGNAL_SET:
+		case DRM_PANTHOR_XGS_OP_SIGNAL_ADD:
+			panthor_xgs_signal(job->queue, &job->ops[i], err_wait);
+			break;
+		default:
+			/* unknown operation, assume this could be a critical error */
+			err_wait = -EINVAL;
+			break;
+		}
+	}
+
+	return err_wait;
+}
+
+static struct dma_fence *panthor_xgs_run_job(struct drm_sched_job *sched_job)
+{
+	struct panthor_xgs_job *job = container_of(sched_job, struct panthor_xgs_job, base);
+	struct panthor_xgs_queue *queue = job->queue;
+	struct dma_fence *done_fence;
+	int ret;
+
+	mutex_lock(&queue->lock);
+
+	ret = panthor_xgs_try_run_job(job);
+	if (ret == -EBUSY) {
+		dma_fence_init(job->done_fence,
+			&panthor_xgs_fence_ops,
+			&queue->fence_ctx.lock,
+			queue->fence_ctx.id,
+			atomic64_inc_return(&queue->fence_ctx.seqno));
+
+		done_fence = dma_fence_get(job->done_fence);
+		panthor_xgs_job_get(&job->base);
+
+		list_add_tail(&job->node, &queue->fence_ctx.in_flight_jobs);
+
+	} else if (ret) {
+		done_fence = ERR_PTR(ret);
+	} else {
+		/* job completed immediately, no need to return fence */
+		done_fence = NULL;
+	}
+
+	mutex_unlock(&queue->lock);
+
+	return done_fence;
+}
+
+static enum drm_gpu_sched_stat
+panthor_xgs_job_timedout(struct drm_sched_job *sched_job)
+{
+	struct panthor_xgs_job *job = container_of(sched_job, struct panthor_xgs_job, base);
+	struct panthor_xgs_queue *queue = job->queue;
+	int ret;
+
+	mutex_lock(&queue->lock);
+
+	list_del_init(&job->node);
+
+	/* Ditch ref we took when adding it to the in_flight_jobs */
+	panthor_xgs_job_put(&job->base);
+
+	ret = panthor_xgs_try_run_job(job);
+	if (ret)
+		dma_fence_set_error(job->done_fence, -ETIMEDOUT);
+
+	mutex_unlock(&queue->lock);
+
+	dma_fence_signal(job->done_fence);
+
+	panthor_xgs_job_put(sched_job);
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+}
+
+static const struct drm_sched_backend_ops panthor_xgs_sched_ops = {
+	.run_job = panthor_xgs_run_job,
+	.timedout_job = panthor_xgs_job_timedout,
+	.free_job = panthor_xgs_job_put,
+};
+
+int panthor_xgs_queue_create(struct panthor_file *pfile, u32 vm_id,
+			     int eventfd_sync_update, u32 *handle)
+{
+	struct panthor_device *ptdev = pfile->ptdev;
+	struct panthor_xgs_queue_pool *xgs_queue_pool = pfile->xgs_queues;
+	struct panthor_xgs_queue *queue;
+	struct drm_gpu_scheduler *drm_sched;
+	int ret;
+	int qid;
+
+	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
+	if (!queue)
+		return -ENOMEM;
+
+	kref_init(&queue->refcount);
+	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
+	INIT_WORK(&queue->release_work, xgs_queue_release_work);
+	queue->ptdev = ptdev;
+
+	ret = drmm_mutex_init(&ptdev->base, &queue->lock);
+	if (ret)
+		goto err_put_queue;
+
+	if (eventfd_sync_update >= 0) {
+		queue->eventfd_sync_update_ctx = eventfd_ctx_fdget(eventfd_sync_update);
+		ret = PTR_ERR_OR_ZERO(queue->eventfd_sync_update_ctx);
+		if (ret)
+			goto err_put_queue;
+	}
+
+	queue->vm = panthor_vm_pool_get_vm(pfile->vms, vm_id);
+	if (!queue->vm) {
+		ret = -EINVAL;
+		goto err_put_queue;
+	}
+
+	ret = drm_sched_init(&queue->scheduler, &panthor_xgs_sched_ops,
+			     NULL, 1, 1, 0,
+			     msecs_to_jiffies(JOB_TIMEOUT_MS),
+			     NULL, NULL,
+			     "panthor_xgs",
+			     ptdev->base.dev);
+	if (ret)
+		goto err_put_queue;
+
+	drm_sched = &queue->scheduler;
+	ret = drm_sched_entity_init(&queue->entity, 0, &drm_sched, 1, NULL);
+	if (ret)
+		goto err_put_queue;
+
+	queue->fence_ctx.id = dma_fence_context_alloc(1);
+	spin_lock_init(&queue->fence_ctx.lock);
+
+	ret = xa_alloc(&xgs_queue_pool->xa, &qid, queue,
+		       XA_LIMIT(1, MAX_XGS_QUEUES_PER_POOL), GFP_KERNEL);
+	if (ret)
+		goto err_put_queue;
+
+	queue->handle = qid;
+	*handle = qid;
+
+	return 0;
+
+err_put_queue:
+	panthor_xgs_queue_put(queue);
+	return ret;
+}
+
+int panthor_xgs_queue_destroy(struct panthor_file *pfile, u32 handle)
+{
+	struct panthor_xgs_queue_pool *pool = pfile->xgs_queues;
+	struct panthor_xgs_queue *queue;
+	struct panthor_xgs_job *job, *tmp;
+	LIST_HEAD(faulty_jobs);
+	int err = -ECANCELED;
+
+	queue = xa_erase(&pool->xa, handle);
+	if (!queue)
+		return -EINVAL;
+
+	queue->destroyed = true;
+
+	mutex_lock(&queue->lock);
+
+	list_for_each_entry_safe(job, tmp, &queue->fence_ctx.in_flight_jobs, node) {
+		list_move_tail(&job->node, &faulty_jobs);
+		dma_fence_set_error(job->done_fence, err);
+		dma_fence_signal(job->done_fence);
+	}
+
+	mutex_unlock(&queue->lock);
+
+	list_for_each_entry_safe(job, tmp, &faulty_jobs, node) {
+		list_del_init(&job->node);
+		/* Ditch ref we took when adding it to the in_flight_jobs */
+		panthor_xgs_job_put(&job->base);
+	}
+
+	panthor_xgs_queue_put(queue);
+
+	return 0;
+}
+
+void panthor_xgs_queue_put(struct panthor_xgs_queue *queue)
+{
+	if (queue)
+		kref_put(&queue->refcount, xgs_queue_release);
+}
+
+struct panthor_vm *panthor_xgs_queue_vm(struct panthor_xgs_queue *queue)
+{
+	return queue->vm;
+}
+
+int panthor_xgs_queue_pool_create(struct panthor_file *pfile)
+{
+	struct panthor_xgs_queue_pool *pool;
+
+	pool = kzalloc(sizeof(*pool), GFP_KERNEL);
+	if (!pool)
+		return -ENOMEM;
+
+	xa_init_flags(&pool->xa, XA_FLAGS_ALLOC1);
+	pfile->xgs_queues = pool;
+	return 0;
+}
+
+void panthor_xgs_queue_pool_destroy(struct panthor_file *pfile)
+{
+	struct panthor_xgs_queue_pool *pool = pfile->xgs_queues;
+	struct panthor_xgs_queue *queue;
+	unsigned long i;
+
+	if (IS_ERR_OR_NULL(pool))
+		return;
+
+	xa_for_each(&pool->xa, i, queue)
+		panthor_xgs_queue_destroy(pfile, i);
+
+	xa_destroy(&pool->xa);
+	kfree(pool);
+	pfile->xgs_queues = NULL;
+}
+
+struct panthor_xgs_queue *panthor_xgs_queue_pool_get_xgs_queue(struct panthor_xgs_queue_pool *pool,
+							       u32 handle)
+{
+	struct panthor_xgs_queue *queue;
+
+	queue = xgs_queue_get(xa_load(&pool->xa, handle));
+
+	return queue;
+}
+
+void panthor_xgs_queue_pool_recheck(struct panthor_file *ptfile)
+{
+	unsigned long i;
+	struct panthor_xgs_queue *queue;
+
+	xa_for_each(&ptfile->xgs_queues->xa, i, queue)
+		xgs_queue_recheck(queue);
+}
+
+struct drm_sched_job *panthor_xgs_job_create(struct panthor_xgs_queue *queue,
+					     struct drm_panthor_xgs_op *ops, u32 ops_count)
+{
+	struct panthor_xgs_job *job;
+	int ret;
+
+	job = kzalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&job->refcount);
+	INIT_LIST_HEAD(&job->node);
+
+	job->queue = xgs_queue_get(queue);
+	if (!job->queue) {
+		ret = -EINVAL;
+		goto err_put_job;
+	}
+
+	job->done_fence = kzalloc(sizeof(*job->done_fence), GFP_KERNEL);
+	if (!job->done_fence) {
+		ret = -ENOMEM;
+		goto err_put_job;
+	}
+
+	ret = drm_sched_job_init(&job->base, &queue->entity, 1, queue);
+	if (ret)
+		goto err_put_job;
+
+	/* take ownership of ops array */
+	job->ops = ops;
+	job->ops_count = ops_count;
+
+	return &job->base;
+
+err_put_job:
+	panthor_xgs_job_put(&job->base);
+	return ERR_PTR(ret);
+}
+
+static void xgs_job_release(struct kref *ref)
+{
+	struct panthor_xgs_job *job = container_of(ref, struct panthor_xgs_job, refcount);
+
+	drm_WARN_ON(&job->queue->ptdev->base, !list_empty(&job->node));
+
+	if (job->base.s_fence)
+		drm_sched_job_cleanup(&job->base);
+
+	if (job->done_fence && job->done_fence->ops)
+		dma_fence_put(job->done_fence);
+	else
+		dma_fence_free(job->done_fence);
+
+	panthor_xgs_queue_put(job->queue);
+	kvfree(job->ops);
+	kfree(job);
+}
+
+struct drm_sched_job *panthor_xgs_job_get(struct drm_sched_job *sched_job)
+{
+	if (sched_job) {
+		struct panthor_xgs_job *job = container_of(sched_job, struct panthor_xgs_job, base);
+
+		kref_get(&job->refcount);
+	}
+
+	return sched_job;
+}
+
+void panthor_xgs_job_put(struct drm_sched_job *sched_job)
+{
+	struct panthor_xgs_job *job = container_of(sched_job, struct panthor_xgs_job, base);
+
+	if (sched_job)
+		kref_put(&job->refcount, xgs_job_release);
+}
+
+void panthor_xgs_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *sched_job)
+{
+	struct panthor_xgs_job *job = container_of(sched_job, struct panthor_xgs_job, base);
+
+	panthor_vm_update_resvs(job->queue->vm, exec, &sched_job->s_fence->finished,
+				DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_xgs.h b/drivers/gpu/drm/panthor/panthor_xgs.h
new file mode 100644
index 000000000000..fa7dd5e5ef83
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_xgs.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2024 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_XGS_H__
+#define __PANTHOR_XGS_H__
+
+struct drm_exec;
+struct drm_panthor_xgs_op;
+struct drm_panthor_xgs_queue_create;
+struct drm_sched_job;
+struct panthor_xgs_queue;
+struct panthor_xgs_queue_pool;
+struct panthor_file;
+struct panthor_vm;
+
+int panthor_xgs_queue_create(struct panthor_file *pfile, u32 vm_id,
+			     int eventfd_sync_update, u32 *handle);
+int panthor_xgs_queue_destroy(struct panthor_file *pfile, u32 handle);
+
+void panthor_xgs_queue_put(struct panthor_xgs_queue *queue);
+
+struct panthor_vm *panthor_xgs_queue_vm(struct panthor_xgs_queue *queue);
+
+int panthor_xgs_queue_pool_create(struct panthor_file *pfile);
+void panthor_xgs_queue_pool_destroy(struct panthor_file *pfile);
+
+struct panthor_xgs_queue *
+panthor_xgs_queue_pool_get_xgs_queue(struct panthor_xgs_queue_pool *pool, u32 handle);
+
+void panthor_xgs_queue_pool_recheck(struct panthor_file *ptfile);
+
+struct drm_sched_job *
+panthor_xgs_job_create(struct panthor_xgs_queue *queue,
+		       struct drm_panthor_xgs_op *ops,
+		       u32 ops_count);
+
+void panthor_xgs_job_put(struct drm_sched_job *sched_job);
+struct drm_sched_job *panthor_xgs_job_get(struct drm_sched_job *sched_job);
+
+void panthor_xgs_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *sched_job);
+
+#endif
-- 
2.45.0

