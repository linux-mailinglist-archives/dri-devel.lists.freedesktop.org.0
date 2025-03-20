Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821E9A6A4C0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:18:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD74E10E5F3;
	Thu, 20 Mar 2025 11:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="CcFjqyVJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CcFjqyVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D1810E5EF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:18:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jnLGo+0wXvCUt7iAOk0o+6YhcWM84AO7FPqd9TRBIgg0spzFEoWPt1HihWJvWDezmSoxhqhg+DC/5+zD1jRh1pX+EbPOINVanDtaDX8oKkwQiiYW74u5EfQ+Ubbh7k5UsU4Ry6VmE1kHIolfDNe+OoWMzEYp9N8XyOoAREr0Q6FXoiCYo3Kjq7U7j+o7r+QUo4ucnQ1eGgTsQQnHyjbCApF7GXdFoJIEhaoxL/igG5sQ155hvPgMxSHHKMiI7ddFefZ1XTHngeYw7O4UBL8pC8Owe1D3HqIiRIrCeB3ClzMSFhS0Ta6xOILnSQShARrIHprl6LmRYqpbCMVKtrHTsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Bnw053aUIxoIZ2hReqrjV90YEfLdhIBB6Lq52201z4=;
 b=czDeeFv2jYKx6oGH4mb1PEleGWnJXMzdRQ7NaQR9wFMBDlVfCTos6zMuYOkSSwmct42x2jS9ktdbE3Namfyr4oPcFO+f0IrkZvFjamEsgfek/+jVi+gTnq+x1bItuuvBJsQdTJWSX6XMeKsn0hk7FpUdXfjQFOaUc4L3L967il9lw8b3qRnBtU7mas6KimFd2FxytOw74jzc8Z4JceQ4Zkfeluv9DhDiUzrG431Gsorb91ZJFnbewILH8NMpsIjhxPfYX11L6R3SvkU8quuJKucENM1U6l69PvhS4D+xtAsZGGdvOKmbVr+GHszN2JihpAxqnwwRopPrQ5G3WfgUzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Bnw053aUIxoIZ2hReqrjV90YEfLdhIBB6Lq52201z4=;
 b=CcFjqyVJdgkBiFfSWOSfRRr2omfVI28uFr80A4lBJ/eQuDmuHSAWVlsGSj9aq4Sh1MG/oBQ04PnlzQL1burJCGf+bWDp+gDM/zzKrzvMXMyxiFhn9zAw9IbXyhklhSQvZf5mnv0BAT4/W0HGZ8gE/fzGdH+8TKWfQfSi5x/sqAo=
Received: from AM0PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::25)
 by DB8PR08MB5516.eurprd08.prod.outlook.com (2603:10a6:10:f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 11:18:14 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::a9) by AM0PR10CA0015.outlook.office365.com
 (2603:10a6:208:17c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.35 via Frontend Transport; Thu,
 20 Mar 2025 11:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 11:18:13 +0000
Received: ("Tessian outbound bd61b317aaf8:v597");
 Thu, 20 Mar 2025 11:18:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa0367ad0e6e02fa
X-TessianGatewayMetadata: 3wa0q/rxh+M0ZXsaU/mywWls7WintqNFtj5PhMcUrxHRtkPBuD3PFCighYyGB2fx+sN0wyD/1/UeQYqClsXvS3C/1U8AJJGWPSMwBfyJZMNhIbhie/5DY8ywpstbZg/1ytrAlW1r8sGyQRpmQ3hitKoVbCgrWl3+y9+xxYGTe3U=
X-CR-MTA-TID: 64aa7808
Received: from Lb15e4ab9bcef.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD7D6E4C-D087-4CBA-88BD-91453FECAE6F.1; 
 Thu, 20 Mar 2025 11:18:06 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb15e4ab9bcef.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 11:18:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSUxE54DBesUcvqasb1wM7ur1lu5ww9AsxZXBUWq5CxpUvU+l6xgftmgNWBEw5EY8Av0C1/taENoQzfpr3V+bLdQ9oK2WOn9dyRpSsrZi9CJYDPL6nW3XYw2u94zjXobyBnQwsDjr6Fsvv3oG93xeuwaz5sRBypfyoHVOE6rOPJNh3FO5t9qvapJvvL2X+9cPgNWBrQzMA7xv2B19t9yZhMAXmYMeNAYPT19VrRhBd9GEz8pv7Ctt0ZHSi13XWcsnonY6w4fV97W1gRfjWI30enC4C9H8deFTRt8pkw6WgVS+6cF4LLmfhce3c42fojTlMH+L+j6Z8hRg9uXYgv6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Bnw053aUIxoIZ2hReqrjV90YEfLdhIBB6Lq52201z4=;
 b=LmuCYUrC8yrdJY9dc8gX/TteQvKqtcYyl5QHmz3t9ZGXYVahcJQdy88M4VgQlv/TCp+rahKIbJF72tA98pyBeVSIwPyP9AEOtOVynsmzHebVJ5bfmmE1WN7THBipGdO/mTwfJe/QHbQU0wj9Ei6HKSIUC6FibRwrQFHqKH0/2aJtkgpZnqgxnWhJ6kc3H6JpxBM8m8c7dhwrtSWr/T4GAaFyblib0pH57XFEogKg+WypH4L89Nlqg54RzTEDQYBHB7tYGuw8DFIGCJieCWzeNQ30NSchfC5q5Z07ve57K/a/FA99GWlodQBvFfVlRKR9tM3W/frLeeMH1ZLMPQds7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Bnw053aUIxoIZ2hReqrjV90YEfLdhIBB6Lq52201z4=;
 b=CcFjqyVJdgkBiFfSWOSfRRr2omfVI28uFr80A4lBJ/eQuDmuHSAWVlsGSj9aq4Sh1MG/oBQ04PnlzQL1burJCGf+bWDp+gDM/zzKrzvMXMyxiFhn9zAw9IbXyhklhSQvZf5mnv0BAT4/W0HGZ8gE/fzGdH+8TKWfQfSi5x/sqAo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB6715.eurprd08.prod.outlook.com
 (2603:10a6:10:26f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 20 Mar
 2025 11:18:03 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:18:03 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] drm/panthor: Add support for Mali-G720 and Mali-G725
 GPUs
Date: Thu, 20 Mar 2025 11:17:40 +0000
Message-ID: <20250320111741.1937892-9-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250320111741.1937892-1-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0221.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::20) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB6715:EE_|AMS0EPF00000195:EE_|DB8PR08MB5516:EE_
X-MS-Office365-Filtering-Correlation-Id: ec58d75c-c24c-4734-c75f-08dd67a0e7de
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?EWZGNRYN0iU7Ab+60Bpzn1rH8BlhaowB8ZRuJqP+ap6O2Zd5WXWRg0Fa+hGk?=
 =?us-ascii?Q?Y6iR1DN1XPKtAMeho6EGVLa0KDyuMsmivg1ZG6oQxaVI2hsCB/s8+gl4QcjY?=
 =?us-ascii?Q?6JbBqyns2lmqSqYmEvgp+vgPJAyLtd4x0zU74iUgFhy4t6fcPIl5mNm0e3bW?=
 =?us-ascii?Q?5vkKRx+E7ivNhpAl5AdJV9Z1WNnjv4QCPtNR1coMbdQVxTay6siDEpqj8fWp?=
 =?us-ascii?Q?Gs+5odGqEarCZfFCAhGQdhC/3UxVKJZwSg0TkG1PL5lOu2lemNIGbc0KuO90?=
 =?us-ascii?Q?7w+6EM6MZnfJHJ4oTgCZA9C07gJ9HFutghD/YC9o4fhhgyb2Z4xCeGmiTEFQ?=
 =?us-ascii?Q?1C+rGxc2pIEEVbNsoAVkTB1CNZ8Tlhq12DugXVfkuyFM7Gr0zum/FTBQOU5L?=
 =?us-ascii?Q?iE80zS1hIyRIHy66zUKQUTpVFmpA8slcfXl06J1cnasIp8dNBtF1k3K+sQUe?=
 =?us-ascii?Q?2K7ZsT9HBw3ixAb81DzdQAf6U36NShyWzFS2CVETLp4B9SZ8V3dBn8A0lF2h?=
 =?us-ascii?Q?4U4RQZom9iaIWbBq3TGAed0/aR7FtKyNeTiVzuZVxks1xCJAyfMwvvqxMGW8?=
 =?us-ascii?Q?ft8fpzdQxzaZ2Xa1QmIPcs6cwlP9f1yj7ssTkXoxtjOjNX441uhCjfHkTMN7?=
 =?us-ascii?Q?01/ftQ0k4w39b6gk69DXP34CjW83TxGNP48agMnADTRoEO4EL2sROM91jWzh?=
 =?us-ascii?Q?UnGuB9ARlP1ijEeokazCDkQWwzYLkUXe5SsSqXxH5GIc4mUGFTTDsOkn6HeG?=
 =?us-ascii?Q?cDR10XcvpqyfFq6tIJs0BF6No+3/VtaCECBvB5D/aR12QWSWcyBQjpWWhGuB?=
 =?us-ascii?Q?nuQQ4r3w9CmMhf9qPaD6uxWteDsHI0cHgbJ00gtkvel7Ula40U8sX3/T7++B?=
 =?us-ascii?Q?t77J1wZvABXBWc+9/inDVHB7VIR9jmxubcTSbnmeT6+6JWB2AC/+yoURwRUm?=
 =?us-ascii?Q?sIhIcs53S64fEXTo43GBit1SCjPa7FoaQ/3BxSw7XN5AjiEHzv0QOiZEnNnb?=
 =?us-ascii?Q?8LX5aJTjnT+UZc1IqbEG3qFu1D68rkDlJtlkTPkiyxiUFCt1DNmMZQzQqkv4?=
 =?us-ascii?Q?CLi++oXqi86cQ9WE88C+7JdbIKkf7O9WAbUdy9NP/DGPzBAKqTEI9GZWgDfT?=
 =?us-ascii?Q?NIa2aNJGbXnVnyUA5P/IrbXJJdHq1398rEGa6+Pf23SLkhrVz4YgF0YUazZY?=
 =?us-ascii?Q?8yJLDSQMytFS//kyaRe47wZyTt2OCz6Y9dlManP5HfI6MHLdlF9AEH2NGLbO?=
 =?us-ascii?Q?hvic79AVbgo2/uAri1sxHq956/L1C8Ui0RdZ0oosRDNA7Vace6x01CHQPHOo?=
 =?us-ascii?Q?h7xzBFGOW82cJNbTv0w6gaUBNACVUCVmyZAtpmymCC2YFW7MonnAadh/kibW?=
 =?us-ascii?Q?ChQVnaOTt1is6n48plOgWG+4DM/m?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a81907cf-2cfe-4051-596d-08dd67a0e1b5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|82310400026|35042699022|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jnpR8SmutkIkSBXGvgpYRrdCC4YUghbSZ9HY9sQWBFJulzRSN5XOil5r6lDY?=
 =?us-ascii?Q?fA00Uy+viuMu2Wl7FEA6Q+lUYEYZhoVnnDxTBH/9A1BIisrHC881VWHSH9zQ?=
 =?us-ascii?Q?CGhpSC40f8xDy86kaxcp3Ectzt/WVpPNzPbiUpikuQ3X+KfMSFDrULeN4hCb?=
 =?us-ascii?Q?iYbKNWdCFmPIwgs9ddcqmlJHqlHNgEdytff8mYGTJuhMwc3vqygvOsMCNT4O?=
 =?us-ascii?Q?qGWNUlw4oso7u3FOJag1DoU/EQsMC1plF8idA+ILGTzcOymDKXaj12r4neUN?=
 =?us-ascii?Q?SpxxFeg6LJP/xAA9/4hSnd4IlBzVNIYBOaY4TlPuDH7GeKm/urbt3mdW1oc7?=
 =?us-ascii?Q?9o06TDfM5s/CZKNSv3hQ0gkRYwsnS+sCoXhdnobGvl4YRlYD1dG7HIP7uFGt?=
 =?us-ascii?Q?DoDUtpOsNyag3DarZ8LzlD4XpT94IZCKnuTj5vbCiOK02ioknCdGFcQoaUlY?=
 =?us-ascii?Q?KhNCDhFAG3EI/YJGNoicob033z8jrNVxuB/I3XpPneBRSNu631iObHLegYvP?=
 =?us-ascii?Q?yLn6ECFAjXArllPpE23uE14Q3C98Omm9U7eRkz0CcN4spPCUI7fQE8L4pRUt?=
 =?us-ascii?Q?1h3NnGMUe2eM/k5UGgWG8UbaZZAT0tRAh82fZJ6aahWkZXha4Luc5frZ4Yk+?=
 =?us-ascii?Q?KgeZ5gthsYlVl/iJm/2nc+eA0D/7offKBUWI6RZzBt4XE7ibyqKbGZRotCoW?=
 =?us-ascii?Q?76+61D00h6xYB1FUly/9AH9tWrSCHBqK6HIEQUpGcmc4CZjlPEvgRSfzqVpk?=
 =?us-ascii?Q?eY+wpUar45I3Oe+XpMy94lX76WZtae74eIF2q2DWC8uIyLoC2B3Mrx5YgzT+?=
 =?us-ascii?Q?7nyPlvDJ4I3k+sDD7zLFxZfhQ1UvmaEh+YXffrB/I4zY4odVOKVbJLr3s/G4?=
 =?us-ascii?Q?ZOP8E+9rVHVRdjf6/QtjXirJ1bmi/h/kJGOiaDFfTGoz0RcWJ2K6DYgTT2Ga?=
 =?us-ascii?Q?rFALaYtOVilzGnJMFli9lzygbOH3YAB7sZ/XuGBVdebmlYMt7Dm0pQQZ1kEr?=
 =?us-ascii?Q?YUpj7DumEAecWeKdyx0LV1VBXB7d0FdHM0RHjsl8tR4UucAjcjXpDLXPBbDc?=
 =?us-ascii?Q?qelzzRVc0mGPUNsb7rQ2yi68xDz1HtEwTpCHXDwBExfWqpt9aKhKMsvQIae1?=
 =?us-ascii?Q?vHZl683RvSQPk/tW1aXxPZqQo7HSh2dDwl3UKrwyDCLWWV6p+63InsS50EwP?=
 =?us-ascii?Q?lQroXTJTqOiU/PnInpOD55Wd4kXJQwnQbQTO/5vuA3ZGkS2gOKTq/m8rIRIx?=
 =?us-ascii?Q?54azwD1CCz+gR/SpGCJHidRrAzLxkH6U9H2+M/lhvL+6/nCOaZPwUExCiwED?=
 =?us-ascii?Q?RnFX5ZwDjCiLCsojP0Lzo4Gj80KQ8K286o0irW/sR+PP5Gf1p/sLDCvMwmmi?=
 =?us-ascii?Q?V8g8yTZDNxOro3DSg4e2w0PgaOmIiDz3d4whDT4TWI2WF3k2xHmHw1c5zYts?=
 =?us-ascii?Q?euayGCN2GDklUW0/FstWiR2g4FdgmmeA2njcKfzW/RjRnfj7HNPbgbO720uP?=
 =?us-ascii?Q?8/q0R70uD0f/NV4=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(1800799024)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:18:13.8262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec58d75c-c24c-4734-c75f-08dd67a0e7de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5516
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

Mali-G720 and Mali-G725 deprecates the use of FLUSH_MEM and FLUSH_PT
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
 drivers/gpu/drm/panthor/panthor_hw.c   | 38 ++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h | 13 +++++++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 0b3fab95f26b..8a967af0e2b4 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1399,3 +1399,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index d04c8723ac98..e6354304bbef 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -60,6 +60,24 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
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
@@ -110,6 +128,26 @@ static struct panthor_hw panthor_hw_devices[] = {
 			.gpu_info_init = arch_11_8_gpu_info_init,
 		}
 	},
+	{
+		.arch_id = GPU_ARCH_ID_MAKE(12, 8, 0),
+		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0xFF, 0),
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
+		.ops = {
+			.gpu_info_init = arch_11_8_gpu_info_init,
+		}
+	},
+	{
+		.arch_id = GPU_ARCH_ID_MAKE(13, 8, 0),
+		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0xFF, 0),
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
+		.ops = {
+			.gpu_info_init = arch_11_8_gpu_info_init,
+		}
+	},
 };
 
 static int init_gpu_id(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 7bc2d838e704..283e758ac86f 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -95,6 +95,9 @@
 
 #define GPU_DOORBELL_FEATURES				0xC0
 
+#define GPU_COMMAND_ARG_LO(n)				(0xD0 + ((n) * 8))
+#define GPU_COMMAND_ARG_HI(n)				(0xD4 + ((n) * 8))
+
 #define GPU_SHADER_PRESENT_LO				0x100
 #define GPU_SHADER_PRESENT_HI				0x104
 #define GPU_TILER_PRESENT_LO				0x110
@@ -111,6 +114,8 @@
 
 #define SHADER_PWRON_LO					0x180
 #define SHADER_PWRON_HI					0x184
+#define SHADER_PWRFEATURES				0x188
+#define   SHADER_PWRFEATURES_RAY_TRACING_UNIT		BIT(0)
 #define TILER_PWRON_LO					0x190
 #define TILER_PWRON_HI					0x194
 #define L2_PWRON_LO					0x1A0
@@ -149,6 +154,13 @@
 #define   GPU_COHERENCY_ACE_LITE			1
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
 
@@ -162,6 +174,7 @@
 #define MCU_STATUS_ENABLED				1
 #define MCU_STATUS_HALT					2
 #define MCU_STATUS_FATAL				3
+#define MCU_FEATURES					0x708
 
 /* Job Control regs */
 #define JOB_INT_RAWSTAT					0x1000
-- 
2.47.1

