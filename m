Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9C29F8108
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 18:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE30510ED49;
	Thu, 19 Dec 2024 17:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ZCP4gAbb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZCP4gAbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEE210E217
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:06:01 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jBpqdmyVCiyMOdI31g5cusi6rQzlZb7zBXpOtGflhtePIx/EXF2SCVWqhv8u0z0eSCv7ao1ZYU/JBgKy3U8DxrJn//jvYLdRRor9u8DHiAQNHjfyfabGntebDs7MESLc66WtofbmsOvJ3m6OXx7jmll7D0agyJ3dQL6ynjdOCCgf+ghNEeMtV5w/Ut/vsLBa6MsfOqM4zi6i8HdmSXSvqVhoyXrRKlA28yzdj2rikLeEfY2CEa97h1v5yG4D4u7pYpCDiDO8dALxRcLaKq1/u4ymRwYNwgPTWhzkq2WUcgCW3BqrGaDhd00VMH9d1qIAf8obLTCE50wHvDuHb1TQ3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfk1R7JlEZrO+jq1m13lBa7PpiEkiI2lHDGzswTHYu4=;
 b=wz2ousoroD09hqf5jGwz9zPs5Pko8euN6d+/qc1h/7MGh8fwu4eYv0TvG+mk18QEfZ8hvmPTQJqq8GzzLVWdbaVJV/Y/79zc8zzH0dhsQp54bYmqSzRH7Ih1iP3m+Ea0eb/NNWWNQBqB0z0wxWDiYs6SFoPA+gakOW79eyXXzxmHluZgrbEabOphpHYjJWGyWePtAMhxgNKUp8gNkDZ2DuySTKhXVhU/6i7IJf/8jlH73Bgn04EeOzNz5wld2sJQVhxyBru2MXWtTjxA59WNQvK1y/npRH9RKhON7qMvwOhTNww/7K5JeEWX/VNzmYy95zaobqQfX0feOLq8hRd7hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfk1R7JlEZrO+jq1m13lBa7PpiEkiI2lHDGzswTHYu4=;
 b=ZCP4gAbbUX0ExZZlHILGS/RLHITXen2ZmTIv0urBFIWbuVUpb7Z7AgI3nDxmztx7ChEhBJBUFB9PKGH5Ikfc+n+CdVgfdzQCVWuCGEyHNxteLntpJX7rQAkjGCw3DRd7CId1+CsBFvFpWwNPLY8BEOfN2SIuRe1NdUxVDHTHCj4=
Received: from PA7P264CA0166.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:36f::17)
 by DBAPR08MB5589.eurprd08.prod.outlook.com (2603:10a6:10:1a2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 17:05:55 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:102:36f:cafe::fb) by PA7P264CA0166.outlook.office365.com
 (2603:10a6:102:36f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Thu,
 19 Dec 2024 17:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Thu, 19 Dec 2024 17:05:55 +0000
Received: ("Tessian outbound a83af2b57fa1:v528");
 Thu, 19 Dec 2024 17:05:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f65668693b8e44a
X-TessianGatewayMetadata: DLWguZjAEK9JDWwTlA8GkD4179bsmK2c8VAym1TUb+J4BN8VHw19rSaRSPcziTBhns/ACaL0cIijF02i0amqhv6FlRWXOLzOl1h1mylqR4jYvQNZv9Hvrn83aEbOPHAbrRc7rlAJnMnS8kZUgIci88ybmJWbUp8EoLGR44yV3IM=
X-CR-MTA-TID: 64aa7808
Received: from Laeb471f382c8.5
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C3D1BE1-A0EC-42C4-B816-7FE3A35D9C48.1; 
 Thu, 19 Dec 2024 17:05:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Laeb471f382c8.5 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Dec 2024 17:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roqaZZibvVJRP1Zpdp4eHmmRG7IyMsu2rukByN6o+gj+aEP4i5/VqV94CZTRxC+0AYiJ9J+I2aWSI7UFblkJm7e1dtKNdahKQwXWg+9D+tn4lcozMHSs9RrBs9r8LEcx/rWjK3sg8DhJk2F0gtQZmJ5kBhkt7YU82r7vDqlF7YZ8xIAiqIpaiUGt1NqI2KTLKgkwYJePrRp3YXk1ghaZ9rhytCCb9eeD6iZJVMhOWWB+pKOx3nR1bJUIHEwuG2lK0v+DbcYiVpzRDbG/OBk4CeiTuxmFW6qVwiYk9l1eKVdUxLbREmBEKBLeLM5h6gDtJkMR/97ug4P7K+PRs6ugdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfk1R7JlEZrO+jq1m13lBa7PpiEkiI2lHDGzswTHYu4=;
 b=qQBWdAt9W5M1kNHn5o6bqGDRbcOwOgGtTUAviTEqTwn3fAsrWH5Ng69zfGdKkCyLoIxJQTKTc4XTfKkbkcjqYHGWu46QM6eOQbXHITiGsnD1KkI92gwrppdpe4GwkC6uq/feB7fZNpLd8+47EDVeIdN1fvBd3SFaL3bpGGZCoS/ppRusIbo6muszQ4Ww5W5+qx8APU2I++75eIlaXDGHC/fBBXhfvGY5fO2I55QHOZbHDPQtbQmHP2Lr38S1zWP8FKbTUZWAXEd/3wmnH2mj03dD4Bsas8G1iIF04GT5+hf5VHaYmO0fQ52PJ0nvtXLJhYXw5mkKqORctGeVZ44sYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfk1R7JlEZrO+jq1m13lBa7PpiEkiI2lHDGzswTHYu4=;
 b=ZCP4gAbbUX0ExZZlHILGS/RLHITXen2ZmTIv0urBFIWbuVUpb7Z7AgI3nDxmztx7ChEhBJBUFB9PKGH5Ikfc+n+CdVgfdzQCVWuCGEyHNxteLntpJX7rQAkjGCw3DRd7CId1+CsBFvFpWwNPLY8BEOfN2SIuRe1NdUxVDHTHCj4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB9109.eurprd08.prod.outlook.com
 (2603:10a6:10:430::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Thu, 19 Dec
 2024 17:05:35 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 17:05:34 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/4] drm/panthor: Add parsed gpu properties
Date: Thu, 19 Dec 2024 17:05:19 +0000
Message-ID: <20241219170521.64879-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219170521.64879-1-karunika.choo@arm.com>
References: <20241219170521.64879-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::11) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB9109:EE_|AM1PEPF000252DF:EE_|DBAPR08MB5589:EE_
X-MS-Office365-Filtering-Correlation-Id: 030d9f0f-4a18-4f04-62e8-08dd204f6688
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?eHybJMUst4M1Rj7mmGpke03D1LZ16wy9KqRPXiLkEKmWx8Ksq2cFu7G7GsVo?=
 =?us-ascii?Q?ay//iOSI2f7IzpGDw+9oJw+KWe9qTjl0Cy9C3Xx8ctWkuvMCZKK+i7fCOYPP?=
 =?us-ascii?Q?2gSN5Gi/iW4eFyrk+orGYM8oGvZL2wse2FwtPqKen8Xu/OikH+T/RfoJHqMs?=
 =?us-ascii?Q?7gQRSI8/C1pbhPGITxhbHRLNWs4L42K+rwfR0BMFOTJDwOnid2DoTS2uypr5?=
 =?us-ascii?Q?QDXwnZLSTajferHPa/KHSWb14uG/u3S4RFg8XteF/k10nw8+DDkEZpTNZAhQ?=
 =?us-ascii?Q?kGnjIEVk9Nw5lmSo7XiuDazpWpkLUQ1pgZkuWzyZIy2hn+cwMZku+9Qm8Uyr?=
 =?us-ascii?Q?HD6cwTpucZjoXZpOlLLTZb3CxRHJ5XL8GByxkBAv1y7q0qnrKNe7fNVClRX5?=
 =?us-ascii?Q?pv650YzyxcgNnNA+Xu0CGgOU60Pg3Wj+AfAyJ/CHUpAg6mqmwZErsNoCGLzx?=
 =?us-ascii?Q?aG8kAe2cL19TJ2zQ7vmxKE2+C8Bc3hVjCMiG046YhGRQZTDuQxtxv+sW77a8?=
 =?us-ascii?Q?aPhDAFD0Kl7kOIDCTLUvYfcvA6UJ/evA8w6SokYi5GgsBCiuN2ET1Sd2IXT5?=
 =?us-ascii?Q?J/A9NByURFdZ7mOnV/k4Zz5EVcDE7k9mtqkmO7LRMlTRr0dx+FAIHflfegar?=
 =?us-ascii?Q?P5Lo3rMBEtwbDdCcFGyQ5UafgGrqrlptW+MtM8tH+twZUTjlwnXcn9EPTObM?=
 =?us-ascii?Q?PPRe634e68ldZhaALaZCBsxh9Q/d+gxV9z5qAoflTal7rPPe5bEIkf8AkJzo?=
 =?us-ascii?Q?anDR7avnTihVBoCNGfIU3FFDqCDPLbK8dpEaMMhnvFR+JLpfu3mR/Ay1hvPD?=
 =?us-ascii?Q?qwDc0rjF6dr/ENe/OLo1ya+de9YRVQrbNNFJaW5BXLgeCidZxIO4DEwP/n2+?=
 =?us-ascii?Q?VTNuaqBK0Llume8YBQsUnOsRm2pZATzBeQ4bnhSm7bEMMRpEaJH/k/2AGoId?=
 =?us-ascii?Q?cll0nxw5iWwVSFwDx4I2d7GbBzIJ3OMUvUksVCGrSVeqBxVGEJdrL4cliSdB?=
 =?us-ascii?Q?wrUiy1B63ZwLl8D8dVu+y+8c0bOEpaScKC7Q383d8zQMdISwDs8VfHZQgbGK?=
 =?us-ascii?Q?Icawy+kmnb+ATQeFtfKq7IYj/QlGaKsZIwPtCKfQvXF9dpYkFmvg0Cnx9vah?=
 =?us-ascii?Q?8vkEMCXHu4FuJCbuQVAF4CwflhMJBy7RuknUsFgot82qNXL1CvLHw57NWkUL?=
 =?us-ascii?Q?a5YQwCd6WhvT1bX5GxJPEf7ukbDrW6iIwCUzkPGfFeD5rwySjFLHi4+Hho1U?=
 =?us-ascii?Q?cG+ipKkKfkqNWwhllZOydrouEyDmGDUJl6cMYCOFDcxVNq1Yu1Ue0o/66ZLx?=
 =?us-ascii?Q?t+VO6UBiwGpvBMpqm4axLjiOAC/lE7KVmysmnT7aLI8pSb9KMUgqbW0u5Hdi?=
 =?us-ascii?Q?79yhe1DXuC+8Q5Cco8GGzEnGN1YP?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9109
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d1bcc7d7-b846-4a0a-7cfb-08dd204f598c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|1800799024|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WTK/OkThREA+LVkfUuWuY9UuYsu5vPSLrn216N1QM2Ncv2imK5HWRp1bM8n4?=
 =?us-ascii?Q?DyqMBugTy4ZCAbB4iPgvRwtugRdT0Ssat2A6WJwKJLeUwuKsOQ3mJToP+m7F?=
 =?us-ascii?Q?4lDWusNaAx+QhPoOBdqt2Xrk2xokPWbKO0SnRO3DQI/+d8UkXmVWZTtFgK20?=
 =?us-ascii?Q?0oevUpwGj7Mqk5LLaEJJFgB7LjFwI5W2j3rkXuFdiyEeIcSqXDqFcCP1l1Xd?=
 =?us-ascii?Q?Xa3Djk5xZTkxduGJbPfsUkbqwrXfSStlM5VL+38LCsDlott4+LGCaohzh6lB?=
 =?us-ascii?Q?JSLB0Fz9VCCoIuuwZ6aBbQflsP93vKpFMP0VR1s8ZvPwv0j+B1bO96KfjfU3?=
 =?us-ascii?Q?dbq4zumQVq9Jv/xTB1+tjASj+Y/WQixqtbfaEX5lQ3P0LEjlUlLrf+JRW1L0?=
 =?us-ascii?Q?v/yeoe1yJ5kK1lUNhxPC6QOVcxtNTq4G0D5zHEWb4eE/HGhxdFko69bxv0Qm?=
 =?us-ascii?Q?pkUN+jURY5+CDeiJUIxncy2MIN8R29L1npZhWsxYrGd0MJGzcLZfDh6aQM/e?=
 =?us-ascii?Q?E1zyLbn76zsEhCPOHk+TazmN7PdpnQD/A+A2/sIAXPGCjetYN1qmTfC26O05?=
 =?us-ascii?Q?LwHZntkiBL7jvh8AkvK6akcLXIDVR7CtXa3MKb76OkLHNaH/gNSeW9fujQdi?=
 =?us-ascii?Q?HPO2d//+Z9uP56Dkft2iwK13ZaDHKUMDGYLai7RaxlKopwYN9ll8ro7o5lST?=
 =?us-ascii?Q?wVS7rgWZv9ODk9kCly7pqww66bCNuo1mYdftr1cwleG7ZwdLZorWsODVdM4r?=
 =?us-ascii?Q?JMSaRCT24RCZNNpvsZ7wCbcWL0hThXC8uSPznTz7/O36mwM9bSt3gnz+zH2k?=
 =?us-ascii?Q?RWFp8rGCa4jIUGA1oxoTdRb9/kv4PssmQbhfan4YOPHl9pa5XT0FkN7B1sA5?=
 =?us-ascii?Q?rObcVNLZQFvg9eP4zWwtoiJjsPc5jXQWTCOCCAuVuBfLid4pv4L1PJna+TZl?=
 =?us-ascii?Q?I9AahRrhQfRvJeiJTE2ezv4uDw2plSTABId8BmppNhdJBbwItp1di0swFflD?=
 =?us-ascii?Q?doZB/gMag2FXXEOwW6Zx3fILmL9v4fv6cRmlCTp7NnsHghGdVW7n/m4QgF6Q?=
 =?us-ascii?Q?AG1mFkIneRndwrOicDqt0OeE7Q8oi1yAc4HNVAYsrN8rfb8pRDy7pzKd5y2R?=
 =?us-ascii?Q?UuwnAq8vzlF9S6QhlaOCMtMKJwWyb0UYOEMxHH30uUgvxcDlyXWGIBZCclC0?=
 =?us-ascii?Q?SS9Ev/XrYKjLlf9/gK8ALKouCBD+VD+acx/20ZSKSvloSH6JzZKQ84J7bf1a?=
 =?us-ascii?Q?sV/RryFQ3sqsPga2JTJLG83b8VoDf1nwtD7vuulVRFB8qQSgJeNowWOOCPF7?=
 =?us-ascii?Q?bksZJ0bN1Ka7RCNjmxD/+P9rMimXfyQk0GkgY6N0KBtO8lswKAV2OQS1t6GF?=
 =?us-ascii?Q?y4fV/WDYw7wgIJoafdCxALdwsArreiwfoFkdjkwuKMT5PLk936b3dCQE7qmZ?=
 =?us-ascii?Q?kCdSiFpWIVuPb6CcuKdCcn9geBUSu+nHiu8+Uoat1yNP2Z4K3ukxSRDkxRoZ?=
 =?us-ascii?Q?ip4i+dFElGpeFLM=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:05:55.0416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 030d9f0f-4a18-4f04-62e8-08dd204f6688
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5589
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

This patch adds parsing of GPU register fields on initialization instead of
parsing the fields each time it is needed.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   1 +
 drivers/gpu/drm/panthor/panthor_device.h |   4 +
 drivers/gpu/drm/panthor/panthor_fw.c     |   5 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 105 ++--------------
 drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  21 +---
 drivers/gpu/drm/panthor/panthor_props.c  | 151 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_props.h  |  70 +++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |   5 +
 drivers/gpu/drm/panthor/panthor_sched.c  |   6 +-
 11 files changed, 252 insertions(+), 123 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_props.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_props.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..ab297637d172 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -9,6 +9,7 @@ panthor-y := \
 	panthor_gpu.o \
 	panthor_heap.o \
 	panthor_mmu.o \
+	panthor_props.o \
 	panthor_sched.o
 
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 0a37cfeeb181..0b74dc628489 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -19,6 +19,7 @@
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
 #include "panthor_mmu.h"
+#include "panthor_props.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..60c9a67fb4a2 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -26,6 +26,7 @@ struct panthor_group_pool;
 struct panthor_heap_pool;
 struct panthor_job;
 struct panthor_mmu;
+struct panthor_props;
 struct panthor_fw;
 struct panthor_perfcnt;
 struct panthor_vm;
@@ -117,6 +118,9 @@ struct panthor_device {
 	/** @gpu_info: GPU information. */
 	struct drm_panthor_gpu_info gpu_info;
 
+	/** @props: Parsed GPU properties */
+	struct panthor_props *props;
+
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 8f1b9eff66ef..51b63d258c7a 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -22,6 +22,7 @@
 #include "panthor_gem.h"
 #include "panthor_gpu.h"
 #include "panthor_mmu.h"
+#include "panthor_props.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -746,8 +747,8 @@ static int panthor_fw_load(struct panthor_device *ptdev)
 	int ret;
 
 	snprintf(fw_path, sizeof(fw_path), "arm/mali/arch%d.%d/%s",
-		 (u32)GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id),
-		 (u32)GPU_ARCH_MINOR(ptdev->gpu_info.gpu_id),
+		 ptdev->props->gpu_id.arch_major,
+		 ptdev->props->gpu_id.arch_minor,
 		 CSF_FW_NAME);
 
 	ret = request_firmware(&fw, fw_path, ptdev->base.dev);
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index a7d5022d34be..ec1780fe2638 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -18,6 +18,7 @@
 
 #include "panthor_device.h"
 #include "panthor_gpu.h"
+#include "panthor_props.h"
 #include "panthor_regs.h"
 
 /**
@@ -37,40 +38,6 @@ struct panthor_gpu {
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
@@ -83,66 +50,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
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
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
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
 	if (status & GPU_IRQ_FAULT) {
@@ -193,7 +100,6 @@ void panthor_gpu_unplug(struct panthor_device *ptdev)
 int panthor_gpu_init(struct panthor_device *ptdev)
 {
 	struct panthor_gpu *gpu;
-	u32 pa_bits;
 	int ret, irq;
 
 	gpu = drmm_kzalloc(&ptdev->base, sizeof(*gpu), GFP_KERNEL);
@@ -203,11 +109,14 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
-	panthor_gpu_init_info(ptdev);
+
+	ret = panthor_props_init(ptdev);
+	if (ret)
+		return ret;
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
-	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
-	ret = dma_set_mask_and_coherent(ptdev->base.dev, DMA_BIT_MASK(pa_bits));
+	ret = dma_set_mask_and_coherent(ptdev->base.dev,
+					DMA_BIT_MASK(ptdev->props->mmu_pa_bits));
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index 3796a9eb22af..995649081a66 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -10,6 +10,7 @@
 #include "panthor_gem.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
+#include "panthor_props.h"
 #include "panthor_regs.h"
 
 /*
@@ -101,10 +102,7 @@ struct panthor_heap_pool {
 
 static int panthor_heap_ctx_stride(struct panthor_device *ptdev)
 {
-	u32 l2_features = ptdev->gpu_info.l2_features;
-	u32 gpu_cache_line_size = GPU_L2_FEATURES_LINE_SIZE(l2_features);
-
-	return ALIGN(HEAP_CONTEXT_SIZE, gpu_cache_line_size);
+	return ALIGN(HEAP_CONTEXT_SIZE, ptdev->props->l2_line_size);
 }
 
 static int panthor_get_heap_ctx_offset(struct panthor_heap_pool *pool, int id)
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index bed13089bbd4..2b6d147a2f0d 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -31,6 +31,7 @@
 #include "panthor_gem.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
+#include "panthor_props.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -695,7 +696,6 @@ static void panthor_vm_release_as_locked(struct panthor_vm *vm)
 int panthor_vm_active(struct panthor_vm *vm)
 {
 	struct panthor_device *ptdev = vm->ptdev;
-	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
 	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg;
 	int ret = 0, as, cookie;
 	u64 transtab, transcfg;
@@ -756,7 +756,7 @@ int panthor_vm_active(struct panthor_vm *vm)
 	transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
 		   AS_TRANSCFG_PTW_RA |
 		   AS_TRANSCFG_ADRMODE_AARCH64_4K |
-		   AS_TRANSCFG_INA_BITS(55 - va_bits);
+		   AS_TRANSCFG_INA_BITS(55 - ptdev->props->mmu_va_bits);
 	if (ptdev->coherent)
 		transcfg |= AS_TRANSCFG_PTW_SH_OS;
 
@@ -1456,8 +1456,7 @@ panthor_vm_create_check_args(const struct panthor_device *ptdev,
 			     const struct drm_panthor_vm_create *args,
 			     u64 *kernel_va_start, u64 *kernel_va_range)
 {
-	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
-	u64 full_va_range = 1ull << va_bits;
+	u64 full_va_range = 1ull << ptdev->props->mmu_va_bits;
 	u64 user_va_range;
 
 	if (args->flags & ~PANTHOR_VM_CREATE_FLAGS)
@@ -2258,8 +2257,8 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 		  u64 kernel_va_start, u64 kernel_va_size,
 		  u64 auto_kernel_va_start, u64 auto_kernel_va_size)
 {
-	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
-	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
+	u32 va_bits = ptdev->props->mmu_va_bits;
+	u32 pa_bits = ptdev->props->mmu_pa_bits;
 	u64 full_va_range = 1ull << va_bits;
 	struct drm_gem_object *dummy_gem;
 	struct drm_gpu_scheduler *sched;
@@ -2688,7 +2687,6 @@ static void panthor_mmu_release_wq(struct drm_device *ddev, void *res)
  */
 int panthor_mmu_init(struct panthor_device *ptdev)
 {
-	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
 	struct panthor_mmu *mmu;
 	int ret, irq;
 
@@ -2722,15 +2720,6 @@ int panthor_mmu_init(struct panthor_device *ptdev)
 	if (!mmu->vm.wq)
 		return -ENOMEM;
 
-	/* On 32-bit kernels, the VA space is limited by the io_pgtable_ops abstraction,
-	 * which passes iova as an unsigned long. Patch the mmu_features to reflect this
-	 * limitation.
-	 */
-	if (va_bits > BITS_PER_LONG) {
-		ptdev->gpu_info.mmu_features &= ~GENMASK(7, 0);
-		ptdev->gpu_info.mmu_features |= BITS_PER_LONG;
-	}
-
 	return drmm_add_action_or_reset(&ptdev->base, panthor_mmu_release_wq, mmu->vm.wq);
 }
 
diff --git a/drivers/gpu/drm/panthor/panthor_props.c b/drivers/gpu/drm/panthor/panthor_props.c
new file mode 100644
index 000000000000..0a379feaf12d
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_props.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2024 ARM Limited. All rights reserved. */
+
+#include <drm/drm_managed.h>
+
+#include "panthor_device.h"
+#include "panthor_props.h"
+#include "panthor_regs.h"
+
+static void panthor_props_arch_10_8_init_info(struct panthor_device *ptdev)
+{
+	unsigned int i;
+
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
+}
+
+static void panthor_props_arch_10_8_parse_props(struct panthor_device *ptdev)
+{
+	struct panthor_props *props = ptdev->props;
+	struct drm_panthor_gpu_info *info = &ptdev->gpu_info;
+
+	props->shader_core_count = hweight64(info->shader_present);
+	props->mmu_va_bits = GPU_MMU_FEATURES_VA_BITS(info->mmu_features);
+	props->mmu_pa_bits = GPU_MMU_FEATURES_PA_BITS(info->mmu_features);
+	props->mmu_as_count = hweight32(info->as_present);
+	props->l2_line_size = GPU_L2_FEATURES_LINE_SIZE(info->l2_features);
+
+	/* On 32-bit kernels, the VA space is limited by the io_pgtable_ops abstraction,
+	 * which passes iova as an unsigned long. Patch the mmu_features to reflect this
+	 * limitation.
+	 */
+	if (props->mmu_va_bits > BITS_PER_LONG) {
+		props->mmu_va_bits = BITS_PER_LONG;
+		info->mmu_features &= ~GENMASK(7, 0);
+		info->mmu_features |= BITS_PER_LONG;
+	}
+}
+
+static void panthor_props_arch_10_8_get_present_regs(struct panthor_device *ptdev)
+{
+	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
+}
+
+static char *panthor_props_get_gpu_name(struct panthor_device *ptdev)
+{
+	struct panthor_gpu_id_props *gpu_id = &ptdev->props->gpu_id;
+
+	switch (gpu_id->product_id) {
+	case GPU_PRODUCT_ID_MAKE(10, 2):
+		return "Mali-G710";
+	case GPU_PRODUCT_ID_MAKE(10, 7):
+		return "Mali-G610";
+	case GPU_PRODUCT_ID_MAKE(10, 3):
+		return "Mali-G510";
+	case GPU_PRODUCT_ID_MAKE(10, 4):
+		return "Mali-G310";
+	}
+
+	return "(Unknown Mali GPU)";
+}
+
+static void panthor_props_show_info(struct panthor_device *ptdev)
+{
+	struct panthor_gpu_id_props *gpu_id = &ptdev->props->gpu_id;
+
+	drm_info(&ptdev->base, "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 panthor_props_get_gpu_name(ptdev), gpu_id->arch_id,
+		 gpu_id->version_major, gpu_id->version_minor,
+		 gpu_id->version_status);
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
+int panthor_props_gpu_id_init(struct panthor_device *ptdev)
+{
+	struct panthor_gpu_id_props *gpu_id = &ptdev->props->gpu_id;
+	struct drm_panthor_gpu_info *info = &ptdev->gpu_info;
+
+	info->gpu_id = gpu_read(ptdev, GPU_ID);
+	if (!info->gpu_id)
+		return -ENXIO;
+
+	gpu_id->arch_major = GPU_ARCH_MAJOR(info->gpu_id);
+	gpu_id->arch_minor = GPU_ARCH_MINOR(info->gpu_id);
+	gpu_id->arch_rev = GPU_ARCH_REV(info->gpu_id);
+	gpu_id->product_major = GPU_PROD_MAJOR(info->gpu_id);
+	gpu_id->version_major = GPU_VER_MAJOR(info->gpu_id);
+	gpu_id->version_minor = GPU_VER_MINOR(info->gpu_id);
+	gpu_id->version_status = GPU_VER_STATUS(info->gpu_id);
+
+	gpu_id->arch_id = GPU_ARCH_ID_MAKE(
+		gpu_id->arch_major, gpu_id->arch_minor, gpu_id->arch_rev);
+	gpu_id->product_id =
+		GPU_PRODUCT_ID_MAKE(gpu_id->arch_major, gpu_id->product_major);
+
+	return 0;
+}
+
+void panthor_props_load(struct panthor_device *ptdev)
+{
+	panthor_props_arch_10_8_init_info(ptdev);
+	panthor_props_arch_10_8_get_present_regs(ptdev);
+	panthor_props_arch_10_8_parse_props(ptdev);
+
+	panthor_props_show_info(ptdev);
+}
+
+int panthor_props_init(struct panthor_device *ptdev)
+{
+	struct panthor_props *props;
+	int ret;
+
+	props = drmm_kzalloc(&ptdev->base, sizeof(*props), GFP_KERNEL);
+	if (!props)
+		return -ENOMEM;
+
+	ptdev->props = props;
+
+	ret = panthor_props_gpu_id_init(ptdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_props.h b/drivers/gpu/drm/panthor/panthor_props.h
new file mode 100644
index 000000000000..af39a7c7433f
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_props.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2024 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_PROPS_H__
+#define __PANTHOR_PROPS_H__
+
+struct panthor_device;
+
+/**
+ * struct panthor_gpu_id_props - Parsed GPU_ID properties
+ */
+struct panthor_gpu_id_props {
+	/** @arch_major: Architecture major revision */
+	u8 arch_major;
+
+	/** @arch_minor: Architecture minor revision */
+	u8 arch_minor;
+
+	/** @arch_rev: Architecture patch revision */
+	u8 arch_rev;
+
+	/** @product_major: Product identifier */
+	u8 product_major;
+
+	/** @version_major: Major release version number */
+	u8 version_major;
+
+	/** @version_minor: Minor release version number */
+	u8 version_minor;
+
+	/** @version_status: Status of the GPU release */
+	u8 version_status;
+
+	/** @arch_id: Composite ID of arch_major, arch_minor and arch_rev */
+	u32 arch_id;
+
+	/** @arch_id: Composite ID of arch_major and product_major */
+	u32 product_id;
+};
+
+/**
+ * struct panthor_props - Parsed GPU properties
+ */
+struct panthor_props {
+	/** @gpu_id: parsed GPU_ID properties */
+	struct panthor_gpu_id_props gpu_id;
+
+	/** @shader_core_count: Number of shader cores present */
+	u8 shader_core_count;
+
+	/** @mmu_va_bits: Number of bits supported in virtual addresses */
+	u8 mmu_va_bits;
+
+	/** @mmu_pa_bits: Number of bits supported in physical addresses */
+	u8 mmu_pa_bits;
+
+	/** @mmu_as_count: Number of address spaces present */
+	u8 mmu_as_count;
+
+	/** @l2_line_size: L2 cache line size */
+	u8 l2_line_size;
+};
+
+int panthor_props_gpu_id_init(struct panthor_device *ptdev);
+
+void panthor_props_load(struct panthor_device *ptdev);
+
+int panthor_props_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PROPS_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 269c2c68dde2..bad172b8af82 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -22,6 +22,11 @@
 #define   GPU_VER_MINOR(x)				(((x) & GENMASK(11, 4)) >> 4)
 #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
 
+#define GPU_ARCH_ID_MAKE(major, minor, rev) \
+	(((major) << 16) | ((minor) << 8) | (rev))
+#define GPU_PRODUCT_ID_MAKE(arch_major, product_major) \
+	(((arch_major) << 24) | (product_major))
+
 #define GPU_L2_FEATURES					0x4
 #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 77b184c3fb0c..209fd9576969 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -29,6 +29,7 @@
 #include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
+#include "panthor_props.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -3832,10 +3833,9 @@ int panthor_sched_init(struct panthor_device *ptdev)
 	num_groups = min_t(u32, MAX_CSG_PRIO + 1, num_groups);
 
 	/* We need at least one AS for the MCU and one for the GPU contexts. */
-	gpu_as_count = hweight32(ptdev->gpu_info.as_present & GENMASK(31, 1));
-	if (!gpu_as_count) {
+	if (ptdev->props->mmu_as_count < 2) {
 		drm_err(&ptdev->base, "Not enough AS (%d, expected at least 2)",
-			gpu_as_count + 1);
+			ptdev->props->mmu_as_count);
 		return -EINVAL;
 	}
 
-- 
2.47.1

