Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F09ED2BA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D635E10EBCE;
	Wed, 11 Dec 2024 16:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="W29RHsa1";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W29RHsa1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA13C10EBB3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:51:28 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JOIwpX1aIfrifIC1XWTtNlOxha6vKzKkFvY6cA1DO7OnYjHUKK/GWEExYZoRlSrSFlL+Lj0g67NxB+YLHMXT1fC9kBkK0pn4kv/gdvxxX3g/kN9dsciJkGHqMbvB6JyDPQMIyd69bc+3kOeKA8Nns/eje6kUb1UjhSX5Ts4m1ViO6R+fiptD1DWrV5vvqzZmg1dfERFTelzVUT24DFqpu7lL8NfOltEMGTlXe9UH1gajyy7DYHSDKnBasug0z3GA5P/qisizw4eNirIYAFsT7PnDT86GZWDGruDzlKzZYMm+RLJ1qVGRy+h0hoVv9jUP3JgQa7xMjBSF6G37U2oiPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSnbtu7/4b0xcoVBcmxU4opQ6rHX/5VJgVS4QuzkGCY=;
 b=RndwGbBLiLBLk1yWSqbmcZU9t2Ci1V+B0N/YmQWpPZL3GYAmca4u8NSHFW1C6Whq5vPFUrzIoKIJlkmQYZY+/qndQusBntFw9DEAvuay+DV5LwrQgryiw8QStKAxPa1TDI9mCvn4zddDYUGwCku+COqounepUD7V/OYxlv4AnQXMeiO7tzDace7WkTHPb/YnGQWCu6stVVu0oGMmJbWy/oXUd5F9rk1r71Fuy28Ay9oRm546tRPbEX6w+ZVIn2c2D1Gf2ZsTH+Jt88CcnEbZzWcRyvsTuV19ua33lDYA58ZNklOpEDhP596j89IY1av5Op+6K5jxbDf2QLbgbMbRQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSnbtu7/4b0xcoVBcmxU4opQ6rHX/5VJgVS4QuzkGCY=;
 b=W29RHsa1JUnD8APJJU/Pkjdia1uxOQc7DwIFOYQAZKLBAUbQAQ9nd+8WeR4TY4/0f/h4Qk8E7eUjJbtLaEFmhsmtPRQHaEeLm19MWlo4dju9DOknENvoXCeLSejbVWNUMPmVO19KpN3HJFZofO0R6Q+VeIikGRrtugK2WmnwQ1k=
Received: from DBBPR09CA0039.eurprd09.prod.outlook.com (2603:10a6:10:d4::27)
 by PAWPR08MB10212.eurprd08.prod.outlook.com (2603:10a6:102:369::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.19; Wed, 11 Dec
 2024 16:51:18 +0000
Received: from DU2PEPF00028D03.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::fc) by DBBPR09CA0039.outlook.office365.com
 (2603:10a6:10:d4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Wed,
 11 Dec 2024 16:51:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D03.mail.protection.outlook.com (10.167.242.187) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 16:51:18 +0000
Received: ("Tessian outbound 9c6259131e4d:v524");
 Wed, 11 Dec 2024 16:51:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0cf303c8a12e35c1
X-TessianGatewayMetadata: Erkx3mfIPFDV+UBvGmTwpPGEsBZElLkAyVxmVk9GCqp67IqFZhyBnl7nr7Wtd+KfLBh9wZo4x4WfJ0cQpcU6Y77lJAy9IK5R1sENjUs4CqyBCZKuODKNakRtilROawAPJjHyMJxJjMBpcuOrrWdHKx8ItqW0PQqG/mmdd+CNBzU=
X-CR-MTA-TID: 64aa7808
Received: from L1c19647b0b3f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F35F1243-C2CA-471D-9E3B-B6656E8F2F07.1; 
 Wed, 11 Dec 2024 16:51:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L1c19647b0b3f.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 16:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jubFSn72R58paVuwGhmcbClcor13WMqYVkAg6jPoCa5ev0iT57hR2Hlvrtm0sm7MIBdlh57YHciHk/X+Uoe+S2OkMSdZsUFBd7Ywm6RDKQHmC+GugSmOIMSImeBVLQkEhDYnjwTaomQKyOEjPe5uWP9UalPLxWfR2ZiiGouK1q2MbXTWZRAwkF9tS0rNmJqTY8xTP49hmJDF2ztbir6iFWcryNdY8gTHvJAFHFtR73/gXnPbiBnoxjxswVcPV7LaLiLR7zhQjs2d6XIapbFo+b/qFbqWgRghkcZv+fh9wQSvXIAqH2yk6LVVRPeesUZ1tNwGFkJ+gDvUEJ+0YdVkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSnbtu7/4b0xcoVBcmxU4opQ6rHX/5VJgVS4QuzkGCY=;
 b=lM0R+/7a/OHkHzncTpjM/bPYM3Hvfk7B7cwHWEziVJxb2W6lx5W+wYDm2ChO7Sg4cZSARmAuTnQheGyFmZ7ZX261ueWRNX5YMUyOMsvxkDbEwDNbnSDVC3JIj++uONd3cSnDpK4+Ar4pMghpmyEK3qtp4qCEM0LQasbin0hfO1PkUXfTxfkX896vuhSCqjikW9hsc94jN0YLKl/hIx3phoXZnmxjypSkwQw8ns46YGXz8hkzRnS8h0pKPdHNDLBzK0MgXoIXJG/rfEahREKMoBOV8kTg3wQnfcM0Me+P2TdogE1Rth9uIHXXlsFJoh4b5fS9ERiKMo68BmS22YdZiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSnbtu7/4b0xcoVBcmxU4opQ6rHX/5VJgVS4QuzkGCY=;
 b=W29RHsa1JUnD8APJJU/Pkjdia1uxOQc7DwIFOYQAZKLBAUbQAQ9nd+8WeR4TY4/0f/h4Qk8E7eUjJbtLaEFmhsmtPRQHaEeLm19MWlo4dju9DOknENvoXCeLSejbVWNUMPmVO19KpN3HJFZofO0R6Q+VeIikGRrtugK2WmnwQ1k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28)
 by DU0PR08MB8422.eurprd08.prod.outlook.com (2603:10a6:10:406::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:51:02 +0000
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897]) by AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897%7]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 16:51:02 +0000
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
Subject: [RFC v2 6/8] drm/panthor: Implement the counter sampler and sample
 handling
Date: Wed, 11 Dec 2024 16:50:22 +0000
Message-Id: <20241211165024.490748-7-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211165024.490748-1-lukas.zapolskas@arm.com>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0169.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::13) To AM6PR08MB3317.eurprd08.prod.outlook.com
 (2603:10a6:209:42::28)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3317:EE_|DU0PR08MB8422:EE_|DU2PEPF00028D03:EE_|PAWPR08MB10212:EE_
X-MS-Office365-Filtering-Correlation-Id: 69fda95d-c9cd-4bfe-37e0-08dd1a0408b4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VGJYQnZZNE5ZY1FFZTN0Wm8vMnFDNDhmdUxPcllhMkFTdUNacVJVUUExNWJF?=
 =?utf-8?B?ZFNEbzYzMG5HTjVhaFRsc1Fyb1c5ZU9OSTJVZmE5b2RJb1VjZk9ZcVpBTDhJ?=
 =?utf-8?B?UTlPK1V6cjlxL2J3L2JwZlU3RlBRSDVHQ0tEbStXTWhjRzdPeDF4cG9xUDZn?=
 =?utf-8?B?RndsL0RwbHlDQ20vRnA4YmdQWDVEYzM3Y0dlWHFEUVVJYW1weGlNM0NsSElW?=
 =?utf-8?B?aTMvQTBxc1RpMnhkdWZxQ05ncERqYklqNG4yNytiOXRTaUVHdHlCeTVDdUZu?=
 =?utf-8?B?U3JxN0xMYm1XUHR6Q1l6bVBPenNianVlTnB6RWY2eVVCOGFGM1dKOG1RUC9K?=
 =?utf-8?B?MUdhRXR3a0Zhc0h6YytDMGx6ejdCeWJ3ZGtzQXZBVG1RQXppak9yWmlFN0ZL?=
 =?utf-8?B?VzY2VFNsN0xGOFkrcnZ4K1ppWnJsWkF3S3lPazBGcXFIV1MxVU1VZTRHK3VJ?=
 =?utf-8?B?LzZxL1REYkJOVHh5WVl6WlFMOW42aFlwMGNncldBWHdmZEhHcXdSRGpyNGFQ?=
 =?utf-8?B?VTh2UCtMdkpDK1JyUEJHRjdLS3V3YUtheDNTRkhBQ0xQaTYyZ0JtV2NhU1Nu?=
 =?utf-8?B?bFJ3LzhDTVNZT2RLU3pqcjNkT3IxaCtCVXlocHRxMkdYc2ZLQm5kRmY3V2xr?=
 =?utf-8?B?WG1VWDcxR3EzdVF4RW13U1lITWJGY1B6N01jMHo4QjhzQlhEd2h3SWtIdG10?=
 =?utf-8?B?MnVEL1ZjaGJZcEJJbGJhTGpJQUo2RGIvVGd1UFgxeWNrNitKRFQwaEViK3N5?=
 =?utf-8?B?OUl4SXhudUFCMDNXOFJsSDF5N1NQcVRYa2pEL1lpOTRvWkdHQTRYUWxPemtT?=
 =?utf-8?B?WTRDQVlzUVZTV3hsaXdGaVBRbnlEVm5CaHNpSXFpWUNrcUlzWlNKOUoxWFl4?=
 =?utf-8?B?dUwySHhZWEdyM3Rwb3pERnBid2FnVFIrS0xkMnM3aVEyNitMZDhDbG1IM2w0?=
 =?utf-8?B?V3BQY00xb1dkSkczTy9hN2hUR05vRVA5OXdGbjcrb0k4czJieXIxcmhISlhW?=
 =?utf-8?B?LzdLYWtGZGJxZ0dHdkdHWXJoSnlDZXVYSnJ3SXhwQ2xST2hXZk5KSi9OdGp0?=
 =?utf-8?B?TStjdlNzdG5VNERUOUZDYVZkRzF2MElDeHFyMWNleng4dlIwOUh4NXluaEN5?=
 =?utf-8?B?QkNsQ0ZDaEl2WHRNQmlPVWJ2end1blhOTVJzSVVvT2FIRlg2WW4ydnRJbVhL?=
 =?utf-8?B?djc3YVp1TFEvYU50L0hpeDdoTGRDL0h3UUlhQWQ0K3QzemN4MDE0dmc2With?=
 =?utf-8?B?cDJOdEZJNDFCcW9ma3FBVzQvS0hseDBhS21mOUg0dFJmZWJTaXhYUHV5aXI4?=
 =?utf-8?B?Y3laVmh5Mm1JeGZPbUZTTDN5by9Uc1FZTVIra1NpSzBxL3g1bGM5MFU0aEcx?=
 =?utf-8?B?dkYzUGZ0RlYyRzVoTFFReGlYRXRaR2dpaVZHOHVaY2dvSkZEWjBaaSs5TDVm?=
 =?utf-8?B?anVVaFpjemFBbUN0d0Z2YTBWV2VXVytpUzhqd095azQ2elFHWjFPVTBiSzE1?=
 =?utf-8?B?ZWNRTHpzSjhTLzIyWGx6c0NwSy8xaGtDWDFEbXBVcjdRdTZMbzBmb042c1pl?=
 =?utf-8?B?UVVGV1FJdU5nRUl2cGQxdXhmTXhKQ0tQTjl2U3NtNFN6RXBmVzlUZlQraVpp?=
 =?utf-8?B?RVRGY0Zaa3g0QjlrakJheHVId2hBcFBOMUpRc0dyTUlrNDBSS2MraG9FRWg4?=
 =?utf-8?B?RUVxbldiZVRYL0tkd01LT3B3MG56QUxXQmdESUF1V2kyL1UxaHU1bExZMnk1?=
 =?utf-8?B?WjF3RGFPVDh5cnhrR1J6czV4T0VqeEtvSzA3eTc3MjJTWGo2UnlGeDRBUWdl?=
 =?utf-8?B?cURteUY5SUhTdkZSR3hhUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3317.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8422
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:209:42::28];
 domain=AM6PR08MB3317.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7a7f4b6b-5fc6-4a01-43ff-08dd1a03ff01
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEtuNTRzbHJLL0p5eVVENHZ5UU5aYVNBMU1GREdISmZJNnJpS1lOQzFBSklY?=
 =?utf-8?B?VWFHRjAxVXJtS3A2R05IME1IY1RzbCtrVFNTZ2ppL3VWeTIyZ0t6RlJhd3lF?=
 =?utf-8?B?OXNuUldKMDhtWlNjdUp2WS9KT3lGM251bkJNbG1TRXNqUDBqbW1YWmRsdGdo?=
 =?utf-8?B?V3F0SSttUkFOTmdkak1XdkhzR0xpOWk1L0Z5L3c3VXp2bzhRMHBzcU5kbFBS?=
 =?utf-8?B?Sml3WGxuNVd2M1FKV01YTXRIWEJHSW5mVzdJUmk3V0M0c25PTXNjb2c0Wm91?=
 =?utf-8?B?U1h6d1d2clMyWGxKRmh0elFmOFhNc05aMThhSWZmMklXTVJkUFRSSjR3S0dP?=
 =?utf-8?B?SitFdmE2elFnN1R4aDQ0Z28walMvS3RNenBVL0ZYV0s5M1ZSd1ZmSDF1OTBk?=
 =?utf-8?B?ZWI3ZEVlMTlzbG9INE9rRFdGcUEwaFpOaWxWUStlZWdveWp2RGdVY0ZHSlFF?=
 =?utf-8?B?OUpmYjRNWHJRNityUm1nMkpKdEhSVFIzM3YwL1VVSlNwWWlWV0MybTRkdU15?=
 =?utf-8?B?MWtlM1owK2tUSUdJWElid2hSeVFOcjJTMEhKUStFRWljbElVWlZPSk5sWDVE?=
 =?utf-8?B?M0pJT0ZGMENXT0lJb0I1aWtYQmhWRmZ4YTVHYkFsQ0tlODdTVWllbXd2SWJW?=
 =?utf-8?B?SStDam8ydHlVVER1WERHaHR6bHd1N3A5WjE5K1d6ckNVT3ltWndtTkt4NnV5?=
 =?utf-8?B?ZHNBQUExc0ZCL0pwd0RHTHVieWlVM0JFUlM3dmh0a3dPNU9VdHpnRDlhV2V0?=
 =?utf-8?B?NC9VNVp0UTNTYzBrdHQvaE42WWt4cms4ZExmQjNkM2g0am4ySkg3TnFTckpi?=
 =?utf-8?B?NlJEc01SR25uRWFrMXZhZ0hKL2VpMVVqOXE5OWg3dXBkWlUwSWxiaDFvRVJ6?=
 =?utf-8?B?T1BwZ1dwSENIaFhETzAxRkxTT29LWXJSbVI3RFpoaHI2OWU5ZE1tTjBwRjJL?=
 =?utf-8?B?N1VJSGJmRjBkRVBIblVtTGhIeE40WGxXSkJycHRDWFNuZE15R01IZmFvRURm?=
 =?utf-8?B?c2E1aUx2ZnlGcStwcDRRdXg0V1BvS1QyVzNOUnFBMnBwUkRESmhZeitQS04x?=
 =?utf-8?B?M1lZNXVkTVROQ3NOdCtuMUFwMkRpTXFmbERQVGtSbzh4UlZpa21YOUxpNVRl?=
 =?utf-8?B?NE1rWmhkQ2lxcDAvUFRBWWd2RW5kYmYrNjRvenZMWU1NbmVVeGx0NGV2Tmh4?=
 =?utf-8?B?aEpod1NQUTdsdTkrQnYvVUtmVGpJT2hkd25VbW1QMWF6VHhDcUk2TkR1YVVm?=
 =?utf-8?B?Nk1ja3VsY3Y3dzdCandid0VSK2Q0M1dIa2VJOFRScEVQZlBtMzkxQnozaGJP?=
 =?utf-8?B?M21ENDVQMVB5dmh4SldZYi9OTEtPbW0yaGdKbm1QaElsYm5PQkQxeVhEZDlS?=
 =?utf-8?B?b3U0WFg5N01vblQ1TXRSQTA5Y3ZzclpzZGlNd2R0dUJZUTFWRlA4Rm5BVFdi?=
 =?utf-8?B?MS9VbE5mRHI5SWVsUWZOV0Y2dUxnb0NqaGhpQ05FOXl3RUdEZ1pTelo4LzVS?=
 =?utf-8?B?SVlmbWNnK2dRY1YwSUVROUlTcGVmU2E0TFhKa1ZSYXNTZWhlaitsbFFkMHVi?=
 =?utf-8?B?TUh0YTlGTUc0YVQ5cURvQUtZSWlzbEUvMWIxSWt6bVcyR3U2cmtRaWNiUGZV?=
 =?utf-8?B?UEJlM2dSbGtNOU5CdzNlZWFsU2pKU3Q0aGxUbUR6ZTUzNnJwdUpXWktzVGQz?=
 =?utf-8?B?WEt3SGlPN01QOUtzRDhPaXBjUTNLQ0NTVjF2SUZlOU43bE12bkxtcFlWVVFq?=
 =?utf-8?B?YWtTQnA5TzU5RTQ2RWVRN09MRkt6bnRrVTFlZ2cxOGlJWWRyN2xFaGl6ZUVl?=
 =?utf-8?B?UElkbEZhQWxuVmowQ0pNSVZKblVLRWg4RExySnlCUldlTjlFbk5id0VMNldK?=
 =?utf-8?B?YlcxcjVJbjlDdWtTNVVNdjVJR1BYa3lmcVR6a21YUEtuek5EWDlXdHJQYnhE?=
 =?utf-8?B?eFQyQUo0WGtUWW54WjRWajl4OGdrZHdackFhYnhaa3pmd1lob0VHVjRqejZQ?=
 =?utf-8?B?eWJUb2hlTk5nPT0=?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 16:51:18.4229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fda95d-c9cd-4bfe-37e0-08dd1a0408b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D03.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10212
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

From: Adrián Larumbe <adrian.larumbe@collabora.com>

The sampler aggregates counter and set requests coming from userspace
and mediates interactions with the FW interface, to ensure that user
sessions cannot override the global configuration.

From the top-level interface, the sampler supports two different types
of samples: clearing samples and regular samples. Clearing samples are
a special sample type that allow for the creation of a sampling
baseline, to ensure that a session does not obtain counter data from
before its creation.

Upon receipt of a relevant interrupt, corresponding to one of the three
relevant bits of the GLB_ACK register, the sampler takes any samples
that occurred, and, based on the insert and extract indices, accumulates
them to an internal storage buffer after zero-extending the counters
from the 32-bit counters emitted by the hardware to 64-bit counters
for internal accumulation.

When the performance counters are enabled, the FW ensures no counter
data is lost when entering and leaving non-counting regions by producing
automatic samples that do not correspond to a GLB_REQ.PRFCNT_SAMPLE
request. Such regions may be per hardware unit, such as when a shader
core powers down, or global. Most of these events do not directly
correspond to session sample requests, so any intermediary counter data
must be stored into a temporary accumulation buffer.

If there are sessions waiting for a sample, this accumulated buffer will
be taken, and emitted for each waiting client. During this phase,
information like the timestamps of sample request and sample emission,
type of the counter block and block index annotations are added to the
sample header and block headers. If no sessions are waiting for
a sample, this accumulation buffer is kept until the next time a sample
is requested.

Special handling is needed for the PRFCNT_OVERFLOW interrupt, which is
an indication that the internal sample handling rate was insufficient.

The sampler also maintains a buffer descriptor indicating the structure
of a firmware sample, since neither the firmware nor the hardware give
any indication of the sample structure, only that it is composed out of
three parts:
 - the metadata is an optional initial counter block on supporting
   firmware versions that contains a single counter, indicating the
   reason a sample was taken when entering global non-counting regions.
   This is used to provide coarse-grained information about why a sample
   was taken to userspace, to help userspace interpret variations in
   counter magnitude.
 - the firmware component of the sample is composed out of a global
   firmware counter block on supporting firmware versions.
 - the hardware component is the most sizeable of the three and contains
   a block of counters for each of the underlying hardware resources. It
   has a fixed structure that is described in the architecture
   specification, and contains the command stream hardware block(s), the
   tiler block(s), the MMU and L2 blocks (collectively named the memsys
   blocks) and the shader core blocks, in that order.
The structure of this buffer changes based on the firmware and hardware
combination, but is constant on a single system.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Co-developed-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |   5 +
 drivers/gpu/drm/panthor/panthor_fw.h   |   9 +-
 drivers/gpu/drm/panthor/panthor_perf.c | 882 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.h |   2 +
 include/uapi/drm/panthor_drm.h         |   5 +-
 5 files changed, 892 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index e9530d1d9781..cd68870ced18 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1000,9 +1000,12 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 
 	/* Enable interrupts we care about. */
 	glb_iface->input->ack_irq_mask = GLB_CFG_ALLOC_EN |
+					 GLB_PERFCNT_SAMPLE |
 					 GLB_PING |
 					 GLB_CFG_PROGRESS_TIMER |
 					 GLB_CFG_POWEROFF_TIMER |
+					 GLB_PERFCNT_THRESHOLD |
+					 GLB_PERFCNT_OVERFLOW |
 					 GLB_IDLE_EN |
 					 GLB_IDLE;
 
@@ -1031,6 +1034,8 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
 		return;
 
 	panthor_sched_report_fw_events(ptdev, status);
+
+	panthor_perf_report_irq(ptdev, status);
 }
 PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
 
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index db10358e24bb..7ed34d2de8b4 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -199,9 +199,10 @@ struct panthor_fw_global_control_iface {
 	u32 group_num;
 	u32 group_stride;
 #define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
+#define GLB_PERFCNT_HW_SIZE(x) (((x) & GENMASK(15, 0)) << 8)
 	u32 perfcnt_size;
 	u32 instr_features;
-#define PERFCNT_FEATURES_MD_SIZE(x) ((x) & GENMASK(3, 0))
+#define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
 	u32 perfcnt_features;
 };
 
@@ -211,7 +212,7 @@ struct panthor_fw_global_input_iface {
 #define GLB_CFG_ALLOC_EN			BIT(2)
 #define GLB_CFG_POWEROFF_TIMER			BIT(3)
 #define GLB_PROTM_ENTER				BIT(4)
-#define GLB_PERFCNT_EN				BIT(5)
+#define GLB_PERFCNT_ENABLE			BIT(5)
 #define GLB_PERFCNT_SAMPLE			BIT(6)
 #define GLB_COUNTER_EN				BIT(7)
 #define GLB_PING				BIT(8)
@@ -234,7 +235,6 @@ struct panthor_fw_global_input_iface {
 	u32 doorbell_req;
 	u32 reserved1;
 	u32 progress_timer;
-
 #define GLB_TIMER_VAL(x)			((x) & GENMASK(30, 0))
 #define GLB_TIMER_SOURCE_GPU_COUNTER		BIT(31)
 	u32 poweroff_timer;
@@ -244,6 +244,9 @@ struct panthor_fw_global_input_iface {
 	u64 perfcnt_base;
 	u32 perfcnt_extract;
 	u32 reserved3[3];
+#define GLB_PRFCNT_CONFIG_SIZE(x) ((x) & GENMASK(7, 0))
+#define GLB_PRFCNT_CONFIG_SET(x) (((x) & GENMASK(1, 0)) << 8)
+#define GLB_PRFCNT_METADATA_ENABLE BIT(10)
 	u32 perfcnt_config;
 	u32 perfcnt_csg_select;
 	u32 perfcnt_fw_enable;
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 42d8b6f8c45d..d62d97c448da 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -15,7 +15,9 @@
 
 #include "panthor_device.h"
 #include "panthor_fw.h"
+#include "panthor_gem.h"
 #include "panthor_gpu.h"
+#include "panthor_mmu.h"
 #include "panthor_perf.h"
 #include "panthor_regs.h"
 
@@ -26,6 +28,41 @@
  */
 #define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
 
+/**
+ * PANTHOR_PERF_FW_RINGBUF_SLOTS - Number of slots allocated for individual samples when configuring
+ *                                 the performance counter ring buffer to firmware. This can be
+ *                                 used to reduce memory consumption on low memory systems.
+ */
+#define PANTHOR_PERF_FW_RINGBUF_SLOTS (32)
+
+/**
+ * PANTHOR_CTR_TIMESTAMP_LO - The first architecturally mandated counter of every block type
+ *                            contains the low 32-bits of the TIMESTAMP value.
+ */
+#define PANTHOR_CTR_TIMESTAMP_LO (0)
+
+/**
+ * PANTHOR_CTR_TIMESTAMP_HI - The register offset containinig the high 32-bits of the TIMESTAMP
+ *                            value.
+ */
+#define PANTHOR_CTR_TIMESTAMP_HI (1)
+
+/**
+ * PANTHOR_CTR_PRFCNT_EN - The register offset containing the enable mask for the enabled counters
+ *                         that were written to memory.
+ */
+#define PANTHOR_CTR_PRFCNT_EN (2)
+
+/**
+ * PANTHOR_HEADER_COUNTERS - The first four counters of every block type are architecturally
+ *                           defined to be equivalent. The fourth counter is always reserved,
+ *                           and should be zero and as such, does not have a separate define.
+ *
+ *                           These are the only four counters that are the same between different
+ *                           blocks and are consistent between different architectures.
+ */
+#define PANTHOR_HEADER_COUNTERS (4)
+
 /**
  * enum panthor_perf_session_state - Session state bits.
  */
@@ -158,6 +195,135 @@ struct panthor_perf_session {
 	struct kref ref;
 };
 
+struct panthor_perf_buffer_descriptor {
+	/**
+	 * @block_size: The size of a single block in the FW ring buffer, equal to
+	 *              sizeof(u32) * counters_per_block.
+	 */
+	size_t block_size;
+
+	/**
+	 * @buffer_size: The total size of the buffer, equal to (#hardware blocks +
+	 *               #firmware blocks) * block_size.
+	 */
+	size_t buffer_size;
+
+	/**
+	 * @available_blocks: Bitmask indicating the blocks supported by the hardware and firmware
+	 *                    combination. Note that this can also include blocks that will not
+	 *                    be exposed to the user.
+	 */
+	DECLARE_BITMAP(available_blocks, DRM_PANTHOR_PERF_BLOCK_MAX);
+	struct {
+		/** @offset: Starting offset of a block of type @type in the FW ringbuffer. */
+		size_t offset;
+
+		/** @type: Type of the blocks between @blocks[i].offset and @blocks[i+1].offset. */
+		enum drm_panthor_perf_block_type type;
+
+		/** @block_count: Number of blocks of the given @type, starting at @offset. */
+		size_t block_count;
+	} blocks[DRM_PANTHOR_PERF_BLOCK_MAX];
+};
+
+
+/**
+ * struct panthor_perf_sampler - Interface to de-multiplex firmware interaction and handle
+ *                               global interactions.
+ */
+struct panthor_perf_sampler {
+	/** @sample_requested: A sample has been requested. */
+	bool sample_requested;
+
+	/**
+	 * @last_ack: Temporarily storing the last GLB_ACK status. Without storing this data,
+	 *            we do not know whether a toggle bit has been handled.
+	 */
+	u32 last_ack;
+
+	/**
+	 * @enabled_clients: The number of clients concurrently requesting samples. To ensure that
+	 *                   one client cannot deny samples to another, we must ensure that clients
+	 *                   are effectively reference counted.
+	 */
+	atomic_t enabled_clients;
+
+	/**
+	 * @sample_handled: Synchronization point between the interrupt bottom half and the
+	 *                  main sampler interface. Must be re-armed solely on a new request
+	 *                  coming to the sampler.
+	 */
+	struct completion sample_handled;
+
+	/** @rb: Kernel BO in the FW AS containing the sample ringbuffer. */
+	struct panthor_kernel_bo *rb;
+
+	/**
+	 * @sample_size: The size of a single sample in the FW ringbuffer. This is computed using
+	 *               the hardware configuration according to the architecture specification,
+	 *               and cross-validated against the sample size reported by FW to ensure
+	 *               a consistent view of the buffer size.
+	 */
+	size_t sample_size;
+
+	/**
+	 * @sample_slots: Number of slots for samples in the FW ringbuffer. Could be static,
+	 *		  but may be useful to customize for low-memory devices.
+	 */
+	size_t sample_slots;
+
+	/**
+	 * @config_lock: Lock serializing changes to the global counter configuration, including
+	 *               requested counter set and the counters themselves.
+	 */
+	struct mutex config_lock;
+
+	/**
+	 * @ems: List of enable maps of the active sessions. When removing a session, the number
+	 *       of requested counters may decrease, and the union of enable masks from the multiple
+	 *       sessions does not provide sufficient information to reconstruct the previous
+	 *       enable mask.
+	 */
+	struct list_head ems;
+
+	/** @em: Combined enable mask for all of the active sessions. */
+	struct panthor_perf_enable_masks *em;
+
+	/**
+	 * @desc: Buffer descriptor for a sample in the FW ringbuffer. Note that this buffer
+	 *        at current time does some interesting things with the zeroth block type. On
+	 *        newer FW revisions, the first counter block of the sample is the METADATA block,
+	 *        which contains a single value indicating the reason the sample was taken (if
+	 *        any). This block must not be exposed to userspace, as userspace does not
+	 *        have sufficient context to interpret it. As such, this block type is not
+	 *        added to the uAPI, but we still use it in the kernel.
+	 */
+	struct panthor_perf_buffer_descriptor desc;
+
+	/**
+	 * @sample: Pointer to an upscaled and annotated sample that may be emitted to userspace.
+	 *          This is used both as an intermediate buffer to do the zero-extension of the
+	 *          32-bit counters to 64-bits and as a storage buffer in case the sampler
+	 *          requests an additional sample that was not requested by any of the top-level
+	 *          sessions (for instance, when changing the enable masks).
+	 */
+	u8 *sample;
+
+	/** @sampler_lock: Lock used to guard the list of sessions requesting samples. */
+	struct mutex sampler_lock;
+
+	/** @sampler_list: List of sessions requesting samples. */
+	struct list_head sampler_list;
+
+	/** @set_config: The set that will be configured onto the hardware. */
+	u8 set_config;
+
+	/**
+	 * @ptdev: Backpointer to the Panthor device, needed to ring the global doorbell and
+	 *         interface with FW.
+	 */
+	struct panthor_device *ptdev;
+};
 
 struct panthor_perf {
 	/**
@@ -175,6 +341,9 @@ struct panthor_perf {
 	 * @sessions: Global map of sessions, accessed by their ID.
 	 */
 	struct xarray sessions;
+
+	/** @sampler: FW control interface. */
+	struct panthor_perf_sampler sampler;
 };
 
 /**
@@ -247,6 +416,23 @@ static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panth
 	return em;
 }
 
+static void panthor_perf_em_add(struct panthor_perf_enable_masks *dst_em,
+		const struct panthor_perf_enable_masks *const src_em)
+{
+	size_t i = 0;
+
+	for (i = DRM_PANTHOR_PERF_BLOCK_FW; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
+		bitmap_or(dst_em->mask[i], dst_em->mask[i], src_em->mask[i], PANTHOR_PERF_EM_BITS);
+}
+
+static void panthor_perf_em_zero(struct panthor_perf_enable_masks *em)
+{
+	size_t i = 0;
+
+	for (i = DRM_PANTHOR_PERF_BLOCK_FW; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
+		bitmap_zero(em->mask[i], PANTHOR_PERF_EM_BITS);
+}
+
 static void panthor_perf_destroy_em_kref(struct kref *em_kref)
 {
 	struct panthor_perf_enable_masks *em = container_of(em_kref, typeof(*em), refs);
@@ -270,6 +456,12 @@ static u32 session_read_extract_idx(struct panthor_perf_session *session)
 	return smp_load_acquire(session->extract_idx);
 }
 
+static void session_write_insert_idx(struct panthor_perf_session *session, u32 idx)
+{
+	/* Userspace needs the insert index to know where to look for the sample. */
+	smp_store_release(session->insert_idx, idx);
+}
+
 static u32 session_read_insert_idx(struct panthor_perf_session *session)
 {
 	return *session->insert_idx;
@@ -349,6 +541,70 @@ static struct panthor_perf_session *session_find(struct panthor_file *pfile,
 	return session;
 }
 
+static u32 compress_enable_mask(unsigned long *const src)
+{
+	size_t i;
+	u32 result = 0;
+	unsigned long clump;
+
+	for_each_set_clump8(i, clump, src, PANTHOR_PERF_EM_BITS) {
+		const unsigned long shift = div_u64(i, 4);
+
+		result |= !!(clump & GENMASK(3, 0)) << shift;
+		result |= !!(clump & GENMASK(7, 4)) << (shift + 1);
+	}
+
+	return result;
+}
+
+static void expand_enable_mask(u32 em, unsigned long *const dst)
+{
+	size_t i;
+	DECLARE_BITMAP(emb, BITS_PER_TYPE(u32));
+
+	bitmap_from_arr32(emb, &em, BITS_PER_TYPE(u32));
+
+	for_each_set_bit(i, emb, BITS_PER_TYPE(u32))
+		bitmap_set(dst, i * 4, 4);
+}
+
+/**
+ * panthor_perf_block_data - Identify the block index and type based on the offset.
+ *
+ * @desc:   FW buffer descriptor.
+ * @offset: The current offset being examined.
+ * @idx:    Pointer to an output index.
+ * @type:   Pointer to an output block type.
+ *
+ * To disambiguate different types of blocks as well as different blocks of the same type,
+ * the offset into the FW ringbuffer is used to uniquely identify the block being considered.
+ *
+ * In the future, this is a good time to identify whether a block will be empty,
+ * allowing us to short-circuit its processing after emitting header information.
+ */
+static void panthor_perf_block_data(struct panthor_perf_buffer_descriptor *const desc,
+		size_t offset, u32 *idx, enum drm_panthor_perf_block_type *type)
+{
+	unsigned long id;
+
+	for_each_set_bit(id, desc->available_blocks, DRM_PANTHOR_PERF_BLOCK_LAST) {
+		const size_t block_start = desc->blocks[id].offset;
+		const size_t block_count = desc->blocks[id].block_count;
+		const size_t block_end = desc->blocks[id].offset +
+			desc->block_size * block_count;
+
+		if (!block_count)
+			continue;
+
+		if ((offset >= block_start) && (offset < block_end)) {
+			*type = desc->blocks[id].type;
+			*idx = div_u64(offset - desc->blocks[id].offset, desc->block_size);
+
+			return;
+		}
+	}
+}
+
 static size_t session_get_max_sample_size(const struct drm_panthor_perf_info *const info)
 {
 	const size_t block_size = get_annotated_block_size(info->counters_per_block);
@@ -358,6 +614,520 @@ static size_t session_get_max_sample_size(const struct drm_panthor_perf_info *co
 	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
 }
 
+static u32 panthor_perf_handle_sample(struct panthor_device *ptdev, u32 extract_idx, u32 insert_idx)
+{
+	struct panthor_perf *perf = ptdev->perf;
+	struct panthor_perf_sampler *sampler = &ptdev->perf->sampler;
+	const size_t ann_block_size =
+		get_annotated_block_size(ptdev->perf_info.counters_per_block);
+	u32 i;
+
+	for (i = extract_idx; i != insert_idx; i = (i + 1) % sampler->sample_slots) {
+		u8 *fw_sample = (u8 *)sampler->rb->kmap + i * sampler->sample_size;
+
+		for (size_t fw_off = 0, ann_off = sizeof(struct drm_panthor_perf_sample_header);
+				fw_off < sampler->desc.buffer_size;
+				fw_off += sampler->desc.block_size)
+
+		{
+			u32 idx;
+			enum drm_panthor_perf_block_type type;
+			DECLARE_BITMAP(expanded_em, PANTHOR_PERF_EM_BITS);
+			struct panthor_perf_counter_block *blk =
+				(typeof(blk))(perf->sampler.sample + ann_off);
+			const u32 prfcnt_en = blk->counters[PANTHOR_CTR_PRFCNT_EN];
+
+			panthor_perf_block_data(&sampler->desc, fw_off, &idx, &type);
+
+			/**
+			 * TODO Data from the metadata block must be used to populate the
+			 * block state information.
+			 */
+			if (type == DRM_PANTHOR_PERF_BLOCK_METADATA)
+				continue;
+
+			expand_enable_mask(prfcnt_en, expanded_em);
+
+			blk->header = (struct drm_panthor_perf_block_header) {
+				.clock = 0,
+				.block_idx = idx,
+				.block_type = type,
+				.block_states = DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN
+			};
+			bitmap_to_arr64(blk->header.enable_mask, expanded_em, PANTHOR_PERF_EM_BITS);
+
+			u32 *block = (u32 *)(fw_sample + fw_off);
+
+			/*
+			 * The four header counters must be treated differently, because they are
+			 * not additive. For the fourth, the assignment does not matter, as it
+			 * is reserved and should be zero.
+			 */
+			blk->counters[PANTHOR_CTR_TIMESTAMP_LO] = block[PANTHOR_CTR_TIMESTAMP_LO];
+			blk->counters[PANTHOR_CTR_TIMESTAMP_HI] = block[PANTHOR_CTR_TIMESTAMP_HI];
+			blk->counters[PANTHOR_CTR_PRFCNT_EN] = block[PANTHOR_CTR_PRFCNT_EN];
+
+			for (size_t k = PANTHOR_HEADER_COUNTERS;
+					k < ptdev->perf_info.counters_per_block;
+					k++)
+				blk->counters[k] += block[k];
+
+			ann_off += ann_block_size;
+		}
+	}
+
+	return i;
+}
+
+static size_t panthor_perf_get_fw_reported_size(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	size_t fw_size = GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size);
+	size_t hw_size = GLB_PERFCNT_HW_SIZE(glb_iface->control->perfcnt_size);
+	size_t md_size = PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features);
+
+	return md_size + fw_size + hw_size;
+}
+
+#define PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, typ, blk_count, offset) \
+	({ \
+		(desc)->blocks[(typ)].type = (typ); \
+		(desc)->blocks[(typ)].offset = (offset); \
+		(desc)->blocks[(typ)].block_count = (blk_count);  \
+		if ((blk_count))                                    \
+			set_bit((typ), (desc)->available_blocks); \
+		(offset) + ((desc)->block_size) * (blk_count); \
+	 })
+
+static int panthor_perf_setup_fw_buffer_desc(struct panthor_device *ptdev,
+		struct panthor_perf_sampler *sampler)
+{
+	const struct drm_panthor_perf_info *const info = &ptdev->perf_info;
+	const size_t block_size = info->counters_per_block * sizeof(u32);
+	struct panthor_perf_buffer_descriptor *desc = &sampler->desc;
+	const size_t fw_sample_size = panthor_perf_get_fw_reported_size(ptdev);
+	size_t offset = 0;
+
+	desc->block_size = block_size;
+
+	for (enum drm_panthor_perf_block_type type = 0; type < DRM_PANTHOR_PERF_BLOCK_MAX; type++) {
+		switch (type) {
+		case DRM_PANTHOR_PERF_BLOCK_METADATA:
+			if (info->flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
+				offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc,
+					DRM_PANTHOR_PERF_BLOCK_METADATA, 1, offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_FW:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->fw_blocks,
+					offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_CSG:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->csg_blocks,
+					offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_CSHW:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->cshw_blocks,
+					offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_TILER:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->tiler_blocks,
+					offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_MEMSYS:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->memsys_blocks,
+					offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_SHADER:
+			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->shader_blocks,
+					offset);
+			break;
+		case DRM_PANTHOR_PERF_BLOCK_MAX:
+			drm_WARN_ON_ONCE(&ptdev->base,
+					"DRM_PANTHOR_PERF_BLOCK_MAX should be unreachable!");
+			break;
+		}
+	}
+
+	/* Computed size is not the same as the reported size, so we should not proceed in
+	 * initializing the sampling session.
+	 */
+	if (offset != fw_sample_size)
+		return -EINVAL;
+
+	desc->buffer_size = offset;
+
+	return 0;
+}
+
+static int panthor_perf_fw_stop_sampling(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	u32 acked;
+	int ret;
+
+	if (~READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
+		return 0;
+
+	panthor_fw_update_reqs(glb_iface, req, 0, GLB_PERFCNT_ENABLE);
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
+	if (ret)
+		drm_warn(&ptdev->base, "Could not disable performance counters");
+
+	return ret;
+}
+
+static int panthor_perf_fw_start_sampling(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	u32 acked;
+	int ret;
+
+	if (READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
+		return 0;
+
+	panthor_fw_update_reqs(glb_iface, req, GLB_PERFCNT_ENABLE, GLB_PERFCNT_ENABLE);
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
+	if (ret)
+		drm_warn(&ptdev->base, "Could not enable performance counters");
+
+	return ret;
+}
+
+static void panthor_perf_fw_write_em(struct panthor_perf_sampler *sampler,
+		struct panthor_perf_enable_masks *em)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
+	u32 perfcnt_config;
+
+	glb_iface->input->perfcnt_csf_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW]);
+	glb_iface->input->perfcnt_shader_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER]);
+	glb_iface->input->perfcnt_mmu_l2_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS]);
+	glb_iface->input->perfcnt_tiler_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER]);
+	glb_iface->input->perfcnt_fw_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_FW]);
+	glb_iface->input->perfcnt_csg_enable =
+		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_CSG]);
+
+	perfcnt_config = GLB_PRFCNT_CONFIG_SIZE(PANTHOR_PERF_FW_RINGBUF_SLOTS);
+	perfcnt_config |= GLB_PRFCNT_CONFIG_SET(sampler->set_config);
+	glb_iface->input->perfcnt_config = perfcnt_config;
+
+	/**
+	 * The spec mandates that the host zero the PRFCNT_EXTRACT register before an enable
+	 * operation, and each (re-)enable will require an enable-disable pair to program
+	 * the new changes onto the FW interface.
+	 */
+	WRITE_ONCE(glb_iface->input->perfcnt_extract, 0);
+}
+
+static void session_populate_sample_header(struct panthor_perf_session *session,
+		struct drm_panthor_perf_sample_header *hdr)
+{
+	hdr->block_set = 0;
+	hdr->user_data = session->user_data;
+	hdr->timestamp_start_ns = session->sample_start_ns;
+	/**
+	 * TODO This should be changed to use the GPU clocks and the TIMESTAMP register,
+	 * when support is added.
+	 */
+	hdr->timestamp_end_ns = ktime_get_raw_ns();
+}
+
+/**
+ * session_patch_sample - Update the PRFCNT_EN header counter and the counters exposed to the
+ *                        userspace client to only contain requested counters.
+ *
+ * @ptdev: Panthor device
+ * @session: Perf session
+ * @sample: Starting offset of the sample in the userspace mapping.
+ *
+ * The hardware supports counter selection at the granularity of 1 bit per 4 counters, and there
+ * is a single global FW frontend to program the counter requests from multiple sessions. This may
+ * lead to a large disparity between the requested and provided counters for an individual client.
+ * To remove this cross-talk, we patch out the counters that have not been requested by this
+ * session and update the PRFCNT_EN, the header counter containing a bitmask of enabled counters,
+ * accordingly.
+ */
+static void session_patch_sample(struct panthor_device *ptdev,
+		struct panthor_perf_session *session, u8 *sample)
+{
+	const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
+
+	const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
+	const size_t sample_size = session_get_max_sample_size(perf_info);
+
+	for (size_t i = 0; i < sample_size; i += block_size) {
+		size_t ctr_idx;
+		DECLARE_BITMAP(em_diff, PANTHOR_PERF_EM_BITS);
+		struct panthor_perf_counter_block *blk = (typeof(blk))(sample + block_size);
+		enum drm_panthor_perf_block_type type = blk->header.block_type;
+		unsigned long *blk_em = session->enabled_counters->mask[type];
+
+		bitmap_from_arr64(em_diff, blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
+
+		bitmap_andnot(em_diff, em_diff, blk_em, PANTHOR_PERF_EM_BITS);
+
+		for_each_set_bit(ctr_idx, em_diff, PANTHOR_PERF_EM_BITS)
+			blk->counters[ctr_idx] = 0;
+
+		bitmap_to_arr64(blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
+	}
+}
+
+static int session_copy_sample(struct panthor_device *ptdev,
+		struct panthor_perf_session *session)
+{
+	struct panthor_perf *perf = ptdev->perf;
+	const size_t sample_size = session_get_max_sample_size(&ptdev->perf_info);
+	const u32 insert_idx = session_read_insert_idx(session);
+	const u32 extract_idx = session_read_extract_idx(session);
+	u8 *new_sample;
+
+	if (!CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots))
+		return -ENOSPC;
+
+	new_sample = session->samples + extract_idx * sample_size;
+
+	memcpy(new_sample, perf->sampler.sample, sample_size);
+
+	session_populate_sample_header(session,
+			(struct drm_panthor_perf_sample_header *)new_sample);
+
+	session_patch_sample(ptdev, session, new_sample +
+			sizeof(struct drm_panthor_perf_sample_header));
+
+	session_write_insert_idx(session, (insert_idx + 1) % session->ringbuf_slots);
+
+	/* Since we are about to notify userspace, we must ensure that all changes to memory
+	 * are visible.
+	 */
+	wmb();
+
+	eventfd_signal(session->eventfd);
+
+	return 0;
+}
+
+#define PERFCNT_IRQS (GLB_PERFCNT_OVERFLOW | GLB_PERFCNT_SAMPLE | GLB_PERFCNT_THRESHOLD)
+
+void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status)
+{
+	struct panthor_perf *const perf = ptdev->perf;
+	struct panthor_perf_sampler *sampler;
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (!(status & JOB_INT_GLOBAL_IF))
+		return;
+
+	if (!perf)
+		return;
+
+	sampler = &perf->sampler;
+
+	/* TODO This needs locking. */
+	const u32 ack = READ_ONCE(glb_iface->output->ack);
+	const u32 fw_events = sampler->last_ack ^ ack;
+
+	sampler->last_ack = ack;
+
+	if (!(fw_events & PERFCNT_IRQS))
+		return;
+
+	/* TODO Fix up the error handling for overflow. */
+	if (fw_events & GLB_PERFCNT_OVERFLOW)
+		return;
+
+	if (fw_events & (GLB_PERFCNT_SAMPLE | GLB_PERFCNT_THRESHOLD)) {
+		const u32 extract_idx = READ_ONCE(glb_iface->input->perfcnt_extract);
+		const u32 insert_idx = READ_ONCE(glb_iface->output->perfcnt_insert);
+
+		WRITE_ONCE(glb_iface->input->perfcnt_extract,
+				panthor_perf_handle_sample(ptdev, extract_idx, insert_idx));
+	}
+
+	scoped_guard(mutex, &sampler->sampler_lock)
+	{
+		struct list_head *pos, *temp;
+
+		list_for_each_safe(pos, temp, &sampler->sampler_list) {
+			struct panthor_perf_session *session = list_entry(pos,
+					struct panthor_perf_session, waiting);
+
+			session_copy_sample(ptdev, session);
+			list_del_init(pos);
+
+			session_put(session);
+		}
+	}
+
+	memset(sampler->sample, 0, session_get_max_sample_size(&ptdev->perf_info));
+	sampler->sample_requested = false;
+	complete(&sampler->sample_handled);
+}
+
+
+static int panthor_perf_sampler_init(struct panthor_perf_sampler *sampler,
+		struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct panthor_kernel_bo *bo;
+	u8 *sample;
+	int ret;
+
+	ret = panthor_perf_setup_fw_buffer_desc(ptdev, sampler);
+	if (ret) {
+		drm_err(&ptdev->base,
+				"Failed to setup descriptor for FW ring buffer, err = %d", ret);
+		return ret;
+	}
+
+	bo = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
+			sampler->desc.buffer_size * PANTHOR_PERF_FW_RINGBUF_SLOTS,
+			DRM_PANTHOR_BO_NO_MMAP,
+			DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
+			PANTHOR_VM_KERNEL_AUTO_VA);
+
+	if (IS_ERR_OR_NULL(bo))
+		return IS_ERR(bo) ? PTR_ERR(bo) : -ENOMEM;
+
+	ret = panthor_kernel_bo_vmap(bo);
+	if (ret)
+		goto cleanup_bo;
+
+	sample = devm_kzalloc(ptdev->base.dev,
+			session_get_max_sample_size(&ptdev->perf_info), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(sample)) {
+		ret = -ENOMEM;
+		goto cleanup_vmap;
+	}
+
+	glb_iface->input->perfcnt_as = panthor_vm_as(panthor_fw_vm(ptdev));
+	glb_iface->input->perfcnt_base = panthor_kernel_bo_gpuva(bo);
+	glb_iface->input->perfcnt_extract = 0;
+	glb_iface->input->perfcnt_csg_select = GENMASK(glb_iface->control->group_num, 0);
+
+	sampler->rb = bo;
+	sampler->sample = sample;
+	sampler->sample_slots = PANTHOR_PERF_FW_RINGBUF_SLOTS;
+
+	sampler->em = panthor_perf_em_new();
+
+	mutex_init(&sampler->sampler_lock);
+	mutex_init(&sampler->config_lock);
+	INIT_LIST_HEAD(&sampler->sampler_list);
+	INIT_LIST_HEAD(&sampler->ems);
+	init_completion(&sampler->sample_handled);
+
+	sampler->ptdev = ptdev;
+
+	return 0;
+
+cleanup_vmap:
+	panthor_kernel_bo_vunmap(bo);
+
+cleanup_bo:
+	panthor_kernel_bo_destroy(bo);
+
+	return ret;
+}
+
+static void panthor_perf_sampler_term(struct panthor_perf_sampler *sampler)
+{
+	int ret;
+
+	if (sampler->sample_requested)
+		wait_for_completion_killable(&sampler->sample_handled);
+
+	panthor_perf_fw_write_em(sampler, &(struct panthor_perf_enable_masks) {});
+
+	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+	if (ret)
+		drm_warn_once(&sampler->ptdev->base, "Sampler termination failed, ret = %d", ret);
+
+	devm_kfree(sampler->ptdev->base.dev, sampler->sample);
+
+	panthor_kernel_bo_destroy(sampler->rb);
+}
+
+static int panthor_perf_sampler_add(struct panthor_perf_sampler *sampler,
+		struct panthor_perf_enable_masks *const new_em,
+		u8 set)
+{
+	int ret = 0;
+
+	guard(mutex)(&sampler->config_lock);
+
+	/* Early check for whether a new set can be configured. */
+	if (!atomic_read(&sampler->enabled_clients))
+		sampler->set_config = set;
+	else
+		if (sampler->set_config != set)
+			return -EBUSY;
+
+	kref_get(&new_em->refs);
+	list_add_tail(&sampler->ems, &new_em->link);
+
+	panthor_perf_em_add(sampler->em, new_em);
+	pm_runtime_get_sync(sampler->ptdev->base.dev);
+
+	if (atomic_read(&sampler->enabled_clients)) {
+		ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+		if (ret)
+			return ret;
+	}
+
+	panthor_perf_fw_write_em(sampler, sampler->em);
+
+	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	atomic_inc(&sampler->enabled_clients);
+
+	return 0;
+}
+
+static int panthor_perf_sampler_remove(struct panthor_perf_sampler *sampler,
+		struct panthor_perf_enable_masks *session_em)
+{
+	int ret;
+	struct list_head *em_node;
+
+	guard(mutex)(&sampler->config_lock);
+
+	list_del_init(&session_em->link);
+	kref_put(&session_em->refs, panthor_perf_destroy_em_kref);
+
+	panthor_perf_em_zero(sampler->em);
+	list_for_each(em_node, &sampler->ems)
+	{
+		struct panthor_perf_enable_masks *curr_em =
+			container_of(em_node, typeof(*curr_em), link);
+
+		panthor_perf_em_add(sampler->em, curr_em);
+	}
+
+	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	atomic_dec(&sampler->enabled_clients);
+	pm_runtime_put_sync(sampler->ptdev->base.dev);
+
+	panthor_perf_fw_write_em(sampler, sampler->em);
+
+	if (atomic_read(&sampler->enabled_clients))
+		return panthor_perf_fw_start_sampling(sampler->ptdev);
+	return 0;
+}
+
 /**
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
@@ -370,6 +1140,7 @@ static size_t session_get_max_sample_size(const struct drm_panthor_perf_info *co
 int panthor_perf_init(struct panthor_device *ptdev)
 {
 	struct panthor_perf *perf;
+	int ret;
 
 	if (!ptdev)
 		return -EINVAL;
@@ -386,12 +1157,93 @@ int panthor_perf_init(struct panthor_device *ptdev)
 		.max = 1,
 	};
 
+	ret = panthor_perf_sampler_init(&perf->sampler, ptdev);
+	if (ret)
+		goto cleanup_perf;
+
 	drm_info(&ptdev->base, "Performance counter subsystem initialized");
 
 	ptdev->perf = perf;
 
-	return 0;
+	return ret;
+
+cleanup_perf:
+	devm_kfree(ptdev->base.dev, perf);
+
+	return ret;
+}
+
+
+static void panthor_perf_fw_request_sample(struct panthor_perf_sampler *sampler)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
+
+	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PERFCNT_SAMPLE);
+	gpu_write(sampler->ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+}
+
+/**
+ * panthor_perf_sampler_request_clearing - Request a clearing sample.
+ * @sampler: Panthor sampler
+ *
+ * Perform a synchronous sample that gets immediately discarded. This sets a baseline at the point
+ * of time a new session is started, to avoid having counters from before the session.
+ *
+ */
+static int panthor_perf_sampler_request_clearing(struct panthor_perf_sampler *sampler)
+{
+	scoped_guard(mutex, &sampler->sampler_lock) {
+		if (!sampler->sample_requested) {
+			panthor_perf_fw_request_sample(sampler);
+			sampler->sample_requested = true;
+		}
+	}
+
+	return wait_for_completion_timeout(&sampler->sample_handled,
+			msecs_to_jiffies(1000));
+}
+
+/**
+ * panthor_perf_sampler_request_sample - Request a counter sample for the userspace client.
+ * @sampler: Panthor sampler
+ * @session: Target session
+ *
+ * A session that has already requested a sample cannot request another one until the previous
+ * sample has been delivered.
+ *
+ * Return:
+ * * %0       - The sample has been requested successfully.
+ * * %-EBUSY  - The target session has already requested a sample and has not received it yet.
+ */
+static int panthor_perf_sampler_request_sample(struct panthor_perf_sampler *sampler,
+		struct panthor_perf_session *session)
+{
+	struct list_head *head;
+
+	reinit_completion(&sampler->sample_handled);
+
+	guard(mutex)(&sampler->sampler_lock);
+
+	/*
+	 * If a previous sample has not been handled yet, the session cannot request another
+	 * sample. If this happens too often, the requested sample rate is too high.
+	 */
+	list_for_each(head, &sampler->sampler_list) {
+		struct panthor_perf_session *cur_session = list_entry(head,
+				typeof(*cur_session), waiting);
+
+		if (session == cur_session)
+			return -EBUSY;
+	}
+
+	if (list_empty(&sampler->sampler_list) && !sampler->sample_requested)
+		panthor_perf_fw_request_sample(sampler);
 
+	sampler->sample_requested = true;
+	list_add_tail(&session->waiting, &sampler->sampler_list);
+	session_get(session);
+
+	return 0;
 }
 
 static int session_validate_set(u8 set)
@@ -483,7 +1335,12 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
 		goto cleanup_eventfd;
 	}
 
+	ret = panthor_perf_sampler_add(&perf->sampler, em, setup_args->block_set);
+	if (ret)
+		goto cleanup_em;
+
 	INIT_LIST_HEAD(&session->waiting);
+
 	session->extract_idx = ctrl_map.vaddr;
 	*session->extract_idx = 0;
 	session->insert_idx = session->extract_idx + 1;
@@ -507,12 +1364,15 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
 	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
 			&perf->next_session, GFP_KERNEL);
 	if (ret < 0)
-		goto cleanup_em;
+		goto cleanup_sampler_add;
 
 	kref_init(&session->ref);
 
 	return session_id;
 
+cleanup_sampler_add:
+	panthor_perf_sampler_remove(&perf->sampler, em);
+
 cleanup_em:
 	kref_put(&em->refs, panthor_perf_destroy_em_kref);
 
@@ -540,6 +1400,8 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
 static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
 		u64 user_data)
 {
+	int ret;
+
 	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
 		return 0;
 
@@ -552,6 +1414,10 @@ static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *
 
 	session->user_data = user_data;
 
+	ret = panthor_perf_sampler_request_sample(&perf->sampler, session);
+	if (ret)
+		return ret;
+
 	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
 
 	/* TODO Calls to the FW interface will go here in later patches. */
@@ -573,8 +1439,7 @@ static int session_start(struct panthor_perf *perf, struct panthor_perf_session
 	if (session->sample_freq_ns)
 		session->user_data = user_data;
 
-	/* TODO Calls to the FW interface will go here in later patches. */
-	return 0;
+	return panthor_perf_sampler_request_clearing(&perf->sampler);
 }
 
 static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
@@ -601,15 +1466,16 @@ static int session_sample(struct panthor_perf *perf, struct panthor_perf_session
 	session->sample_start_ns = ktime_get_raw_ns();
 	session->user_data = user_data;
 
-	/* TODO Calls to the FW interface will go here in later patches. */
-	return 0;
+	return panthor_perf_sampler_request_sample(&perf->sampler, session);
 }
 
 static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
 {
+	int ret = panthor_perf_sampler_remove(&perf->sampler, session->enabled_counters);
+
 	session_put(session);
 
-	return 0;
+	return ret;
 }
 
 static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
@@ -813,6 +1679,8 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 
 	xa_destroy(&perf->sessions);
 
+	panthor_perf_sampler_term(&perf->sampler);
+
 	devm_kfree(ptdev->base.dev, ptdev->perf);
 
 	ptdev->perf = NULL;
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index bfef8874068b..3485e4a55e15 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -31,4 +31,6 @@ int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf
 		u32 sid, u64 user_data);
 void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
 
+void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
+
 #endif /* __PANTHOR_PERF_H__ */
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 576d3ad46e6d..a29b755d6556 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -441,8 +441,11 @@ enum drm_panthor_perf_feat_flags {
  * enum drm_panthor_perf_block_type - Performance counter supported block types.
  */
 enum drm_panthor_perf_block_type {
+	/** DRM_PANTHOR_PERF_BLOCK_METADATA: Internal use only. */
+	DRM_PANTHOR_PERF_BLOCK_METADATA = 0,
+
 	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
-	DRM_PANTHOR_PERF_BLOCK_FW = 1,
+	DRM_PANTHOR_PERF_BLOCK_FW,
 
 	/** @DRM_PANTHOR_PERF_BLOCK_CSG: A CSG counter block. */
 	DRM_PANTHOR_PERF_BLOCK_CSG,
-- 
2.25.1

