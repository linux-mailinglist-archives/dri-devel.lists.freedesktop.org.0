Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C383CC3F6F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 16:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E5F10E967;
	Tue, 16 Dec 2025 15:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="onV7Rr5R";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="onV7Rr5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1A410E967
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 15:34:02 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qPXkRBoBAHepZXIQH9TjQH33bcuItlbnAV30yY/UogMN+gEYsVrVydrqqxI4mtgF2VVFMJtuEww1vbF0mezKHwN+76U16UlVlgB4VtTH+Yu3rR1TMeyUA7HdaIUS5/xZo31snMsJ2oYRRO4LG3QaYVS9V+BPY2GwLcz8r0SmPYiTQOk28bc9MvgFj7Y1leOYXhMPWxJ92eSBHjVICkd4sdBFzm0THWOgZqutUuSZmjCmDT9XimJmGYSXlJuUoDojAY8Z+v8nr90jcp6+yvXda21V+d09L3mSBY6hKmYcF2UUzCbEqLxTWekW4glw07ruwa1TiS1Wh2EfftRBdZ9dtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvXZ4LA7kdreOH37nFpfiyMobwH6NIn+1nvD+soKmOI=;
 b=aU4pXRYyI6K1n5WYnQraTxTn7/bXkeGUljMo6mkXP3t7nzSrzXkd1BjQ5K6J5u8iXrY3anf1IijXTW3/zADp+SbJ73KAhdbel5W6UnvS+or4r68p7EbGg5qcckF1Q8EEOCsHd39BmSNdJ1PtC2NKjNgV86cIlVhhED+M/+DynQqyo2U/AZoXe/J+f087ZYORN/XK38eW5Z4F0wV59Xaxhmw2SabJ61ZiXmmPFub+9ZjH463VGK7vEVplDTdvFpQLdSE3aiLG6CkssswwU4mVOsPLe4rdrHEq0EXG1aqC32lJst9ypHDfATh9Mf5y8+9PK70cTsJdLWifS2b2HCk60Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvXZ4LA7kdreOH37nFpfiyMobwH6NIn+1nvD+soKmOI=;
 b=onV7Rr5RnwO9a254GkFICkF7ImHmYFfBOE1T9rbF0oMdTM6I0OXyrRF7axAGdzU7SjgRd3GccF+5sviQHLl26AqfAsuYV6qhTJj48J7aU874i6n/H03E582x/lFXySVaM9j7ZDKJV/fzKmhrsmqIK4rYznThRgixln0KFIGVb8E=
Received: from AS4P192CA0050.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::12)
 by AS8PR08MB10313.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 15:33:53 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::ab) by AS4P192CA0050.outlook.office365.com
 (2603:10a6:20b:658::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 15:33:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 15:33:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTaaZV2m3L2sh0+HstrlZ9qRFVYKTT2MOXlQnxhM9zHcdGExovV5vOWUsbgHS36QOzfVuLJjbMSEuxYRyDwkbvGzUTxiOjPsydL/mQcCDwyIsbvebGxgL0xmTd2aUY7WWD8Wotg7kOhdwOEdOVLdJDFr9h9t3ZCkqWZa4ZALcZ2aQW+J/rwUJHzu1Yd0KMAT22nZLe6g1t1HGborImnoGYClT49hb/X+dX4m/mb1i0P4Ylg/QjaYd/p/tZoX6ZrG2gU7YU7NXUtyuw2bLeSQAhAXTu+wKYPFb5SYbJgizyVHhgKu4W7haGv4Gi3sDK+9hG5HpoRz1Ia7K78FzA/+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvXZ4LA7kdreOH37nFpfiyMobwH6NIn+1nvD+soKmOI=;
 b=sb5Rs9Ud/6rv30X9aFDOR3Vstx12UwOyrhgG01ZOS6jWaTdWUbpVSyW4q0GPzB/HmTzq3E+5FndhvYBufsXb0hXUxh41oF2cwBlgHy++YK1gUlfEGe7L2y2DsGR0kFAg/Czg0C/Nex0osoIdkbiFcyNX+TcfIQPIBKMjsP0KBZFWW/M3CaJyA79WynZXTS7kqHbrObsO4ZCPTsvQvljaPsfUyLfTlebMx3d6sk1xaidFC9IW6GeO9zOZtp+6nZcPmDxbcS0Btq+3RXwD5hKjKS5Dz7etXv3PPPgVMdQnjvsZ5uGGfTk1rceBCU/dKIX8heVvBcnFpcEIdVqJC1m8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvXZ4LA7kdreOH37nFpfiyMobwH6NIn+1nvD+soKmOI=;
 b=onV7Rr5RnwO9a254GkFICkF7ImHmYFfBOE1T9rbF0oMdTM6I0OXyrRF7axAGdzU7SjgRd3GccF+5sviQHLl26AqfAsuYV6qhTJj48J7aU874i6n/H03E582x/lFXySVaM9j7ZDKJV/fzKmhrsmqIK4rYznThRgixln0KFIGVb8E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS8PR08MB9792.eurprd08.prod.outlook.com (2603:10a6:20b:613::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 15:32:45 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 15:32:45 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH] drm/panthor: Avoid showing imported BO as exported in DebugFS
 output
Date: Tue, 16 Dec 2025 15:32:42 +0000
Message-Id: <20251216153242.1042613-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0534.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::19) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS8PR08MB9792:EE_|AM3PEPF00009B9C:EE_|AS8PR08MB10313:EE_
X-MS-Office365-Filtering-Correlation-Id: b470f8c2-ab1a-4e0b-9ca2-08de3cb88408
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?0N5E8XLRiXnwz0YgNDhmXL8VkRgPbzlYx2+mWdr8mDqEVZAoSg5yTm10/V78?=
 =?us-ascii?Q?i2mwxQz6GHPmBQfbCMXZohuhI4d4VzB9Brj3fiNHIdQvOzHHiKB2PQPau12F?=
 =?us-ascii?Q?Uh59Ybht5fPhsgeE39S04tYHrDAdFTKNqlKQTHUkJ1KK83GGLwCeh0CG5uA1?=
 =?us-ascii?Q?HceP/uNSFSK73DAjvGkmnNfLuVCVgXYjOahj8SM6LCRb5uhLf4KYiIv1lx4E?=
 =?us-ascii?Q?GE0r5jFCXx2B2PtBN/7EujQmiwFvXs1Eo8W/B9uZXnO7G6vej1Zsgme7AZR+?=
 =?us-ascii?Q?XP0YYBeLz9Mv6JmGIbtMyui42HjkM57KUuMOm2Lz2cC0z+06DhoQkyyrAZoH?=
 =?us-ascii?Q?FCogYR6RPXST35kOOd0mzeItORit9Sx05/eaesWUOIupzSZRD/mvyZvFGqbb?=
 =?us-ascii?Q?aqn83nDY/7djW03SP2zDLyB6XPNuzJhiI4im+dSDC5sGAyQlQ7Xx63XZS8T/?=
 =?us-ascii?Q?tCJZ2MT1fx7wGHlSjB5CVmp5gwQV0QgIpCIYs3JY4DiC6DVIdfKi8C9c5BSc?=
 =?us-ascii?Q?Q1rUNhG7lwDHUWLxB11rbUgZTs/NFDlzpdYNK/EpqokFDyZIsjYAUCXkJe9N?=
 =?us-ascii?Q?i70whSPI1+VJtJ27u5VTElnHCyb8FcH69KXaGki2WG4gxXwGfbWO6pCU0jdU?=
 =?us-ascii?Q?gYIxdwnUpPwpLGriRcAgBtW/JfGJV6eBS7R5gqKyyUys/Hhu7qky3mW2mgoO?=
 =?us-ascii?Q?l/Eb7NpnlgeJEdHqqZNvPaLQiBbj2Gx8JGNgCsP3lXoOXKrWUj+vl6NFef5G?=
 =?us-ascii?Q?4sUPoZgihFMCc4at9yd53QdOxC2Jyv/PoDRd4pXZpS/t7S5G3PvDHaBTNgFM?=
 =?us-ascii?Q?MURxSvYQ4eCXsIypB1HorGwRD9fze1cFfJcQD+rpxlCgkZNXL37JxTQ7U+a1?=
 =?us-ascii?Q?4H+8c635IaQtszPnCdiNdPT2ePukDX2Gg9F99tZxjtte3eCnfAyeiEKvbFLk?=
 =?us-ascii?Q?8Gx11BL8XoEjZZZLbFKVRy4S83wxpfRerCrQQuNRJEOWeQSdj1SW7pHjozHA?=
 =?us-ascii?Q?ufdpMysvKAARGVchLiXzqBbecafHnFNxt+iq6ZQrcPSH81e8vRQBGAMHB6gQ?=
 =?us-ascii?Q?Gm3qFp3TX3xPIEdIgr6mzAIRWi7fOUxtOA9XtPZxRaJcAMb1FcV/rrL0qbwZ?=
 =?us-ascii?Q?lU/DIj9x3yDKjHqQo89OwJfexNgtKBIkO4d0ocxn5p8TxntuoLsR/c8XpnHJ?=
 =?us-ascii?Q?AfZLXk7YcmGirCrJs/Xqw/xK1lSZxYH7FUEPRrSvxUUPQNWLFyPbtu1egrSy?=
 =?us-ascii?Q?iwgEFyxPpWaOmFUOaXTTFqrrXQAlOj7ukPDb2nxYHUNzzfIASZUjHEOF1uZM?=
 =?us-ascii?Q?8xNEYtSTeYIIbhwbcTN1/2joujdCUcmZB1GdfZKX5IE0a134L40+HwPcQx6e?=
 =?us-ascii?Q?fHQUqDKIjlxvpOfogcFSoyglZiNT2Jvi1Ftb8xmQ5v/AlM6nK6T8yHgi50tH?=
 =?us-ascii?Q?59ecBDLPgLVxthSWdteLkXQMThp2BcCa?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9792
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f41576f4-a629-4080-6a8c-08de3cb85c4b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|14060799003|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gtIvt6w/08UMWcwcfG11qChoQcBpwFboPtuAWGGqHed4JG7bMBH4gKtP9V24?=
 =?us-ascii?Q?nmOdJiFRwO8VJcIMAIB1Qyj56Fa0kcRS2ZZgHYXOGlJTeyzuKX3+8d3rjJSp?=
 =?us-ascii?Q?Pyqu6PFdKvDYRSzP8Y3uCNrqKt8XUOROMbgQPnlfjoIf13Y/MU+aUPPhE9IF?=
 =?us-ascii?Q?+X/gCnn2q4U3DRXgncemL/2lzxBxWZP+1RPw26dy7/yBHT52S1wZitvkzwI6?=
 =?us-ascii?Q?w4KaPhHSLk65iSX+v1ypy1fghpxvd/PyK3akIBsgkOX17TilUeA1Pk7zUqGn?=
 =?us-ascii?Q?dTD2YvRNR6FcDTN+5NW9CfJWR2xmdMTWPN/jDcZSuWBTPeEuGAgAiPbfgWCz?=
 =?us-ascii?Q?BvBBTeR3A5zJMCggqXgKjk6jH/3ped69e3RdsHSU/h7t3c6PpfW2EnbPvh9h?=
 =?us-ascii?Q?UYqRYwX6WsTBgbxr2Dwg9xBgJvi5wVdy4/l5QYL3ZppWaBqr9zSad6zVGCZA?=
 =?us-ascii?Q?3IDnppHdAGaJn9kFhOEeWSf2i6tXx3t3btj34iySn6raiL07Rw3jM4iHwXrF?=
 =?us-ascii?Q?+si4SYDFnDAdjvpNCzHBuepMAVhyvbKlKLCenJssm9ycGDHHWGOrSHUyKH9G?=
 =?us-ascii?Q?+UO1hezx5zOgGs6taO5hCL2snSmDvDvSHmuID7z15FixnU2m3RiyrBSX+qC8?=
 =?us-ascii?Q?XFlbXJxSWOGX2tT8SqEUUHFaTybDYxB13R0EbGqyYZJcSLzlIlUeVDSVId7m?=
 =?us-ascii?Q?GO0mYcAAROVtJh//f4VAjEJJur9ivMSLirHRBsI5GAhSzD9BPVWDHjY8qNZu?=
 =?us-ascii?Q?JNYictPIoy+JFe2n8fp5qDTDMJucfUvlS83vfGTJSKBWxj7fGFaYHaPt9w44?=
 =?us-ascii?Q?b8W2XdaTgBbxvKGaMpbNY1WgFESMapA24nI5ogi6IgM0zXXgPuSmzt71ov9N?=
 =?us-ascii?Q?OSmSFsg1Ze680M0Ds1UPCGjMsFQeygyrNMgFgHK71oTro2vf6LFj0TrrCHPw?=
 =?us-ascii?Q?hQktorEmeODpwEf9mqYjxFfExAmJK2Cv49/ekb3MLC0bj5pyq/dmMBsuuB/G?=
 =?us-ascii?Q?Ue12dcFgmdpGwy1FzL7oHR1lnDb34mh7Urvr5eepM2UC2Z96Y8WD2/QkA/qP?=
 =?us-ascii?Q?oQcjMt+9RKBrb12Hrxyh6313ilmlcLUE8SgMur/5Zfy3TVjD9dddPXx+JSdd?=
 =?us-ascii?Q?kOoQJksCu5yGqosPyoVenzvd+9BlOHpwlNR+dFckUwOkQxB6o7UoR0yx6wdC?=
 =?us-ascii?Q?AAH3EQisQYE5NKzEKbNrb/2b8E8oDCP58TuzZCmkBp4bZvoai3PmUpNNLiur?=
 =?us-ascii?Q?DwIOs673O3GH9eTr6bpXcZ9XLkEaeV0Wj6akTtqkVtGKUlOVM6ClNJF/OxoO?=
 =?us-ascii?Q?jjgEBN1c/5VXpoPfG+4QUCUb1YUdWQ84DtagN2Lhow4f5MUhoh4oPuu74+78?=
 =?us-ascii?Q?1kQRa5Yh2CNv+8ssQJ6fpLKG4ksNN4/7EM8gvkcGbRYWqCfdzJIWLgBLo0p/?=
 =?us-ascii?Q?6ecYNc2Lak2QPiXrUdj4iZuP3IukwRW+sRVPlGD67ppXiDlI0sDQdSQpDMBd?=
 =?us-ascii?Q?MbEB5kOeSUOXir1bYOOiL4y0zLNf5RwKTrUBZ9XDo7PPUAtIV4bskjtTKaxy?=
 =?us-ascii?Q?+e772tIk46mGmvFVlac=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(14060799003)(376014)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:33:51.9052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b470f8c2-ab1a-4e0b-9ca2-08de3cb88408
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10313
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

The "gems" DebugFS file shows the device-wide list of DRM GEM objects.
It displays various information about an object, including if it is
PRIME imported, PRIME exported.
This commit fixes the debugfs_bo_print() function to prevent an imported
BO from also being shown as exported in the DebugFS file output.
Both 'import_attach' and 'dma_buf' fields will not be NULL for an
imported BO.

Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index b61908fd508a..5dd92cdcf316 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -668,7 +668,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 
 	if (bo->base.base.import_attach)
 		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED;
-	if (bo->base.base.dma_buf)
+	else if (bo->base.base.dma_buf)
 		gem_state_flags |= PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPORTED;
 
 	seq_printf(m, "0x%-8x 0x%-10x", gem_state_flags, gem_usage_flags);
-- 
2.25.1

