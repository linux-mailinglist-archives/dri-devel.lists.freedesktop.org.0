Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E23BC8148
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 10:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BDB910E971;
	Thu,  9 Oct 2025 08:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="AoEZjoOZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AoEZjoOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B459410E971
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 08:42:46 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=abh4/XRsuUe9+2mxE02QtDrPa1OP65YxXx6F15E4HDMF/UtjewsFmQ9HIerD+hYZT2jrD98trVjUxTOs/FVDbujtUbsyHCJYHsGa7w7atPlg1M9QJYdFpJwYK23ZRi2aGs6MX/EwSQcAiBB8lxhk8wPh7MqV904RuWvxB0C6wvQ0bBpAfelnj+z/LSqfZqQbZ7UylweSGWfxV6/hdD8l0JKFslnuzhf5xmXYrqxKUwzmdyosEpzRy07SpVxaVl8MjlRPyb0ONm+b4fNgaWL2MYdaFqtkW8ytodeHDFjq+Cmvoz1LJSBi81ettK1N30Tw/Yzt7MiW2555PgrWpm344A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yU4uJt9j41SLvb6L7EJ37X5xSXxKF+TQ9ypPj2QJ+/M=;
 b=M9JgTQWAjzQol8Pgx4w3QhQeDrZbCkF6RMRx2JTkU01h60RnnQJxIqx3Jqwq0oVrAlMtE/n1/jJW5BMTwKtr14x7D8MClRfJBm90/aEPrMaiGewMbzP4RTagUjFq1jUH8TOP6bOy5LtYtcusnym3hn5tfY/BUnhh7+Z1D5to1ozba5Vhu1gE0QMwftT7IreSXp/RduiwVjEFZt5Qg0qDDcSNeZWpZKQ4QGom2JsroophHMQwOK2SuEB/Fte3T8L/1RMPYkl3eb5IQt0pmKm5WIp5vD3ajBKqpy0POonvy8x5Yf/0HxRZJTG3+HfIeQFXwOd6pEd9rqnS1nLt2SoP+w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yU4uJt9j41SLvb6L7EJ37X5xSXxKF+TQ9ypPj2QJ+/M=;
 b=AoEZjoOZtWH+EaLzW/P7HiDLE/iCQvaXC3Fmo0uhSRv63z61e7DMVHklrCV4dCOBwlYhayRq0j3uxc0esrsf4WgLHr4uxJG16ddLMLW+PGNEs5TiqDQBJCB3nKxHqKY9QRz5X75GiNbX5xeBi/VsJ/oz8oEGe3305apQW8D1POc=
Received: from DU2PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:10:3b::15)
 by GV1PR08MB8402.eurprd08.prod.outlook.com (2603:10a6:150:a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 08:42:43 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::c3) by DU2PR04CA0010.outlook.office365.com
 (2603:10a6:10:3b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Thu,
 9 Oct 2025 08:42:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Thu, 9 Oct 2025 08:42:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvlBmCiQQdDMdt6M1EVQaLZX+80l0DckM/+vC7LpxbLlzBxirHVWpkc5LTlYZ1mzNN+NcfehOOLIGynfYkKU8iruxMNTHeTK/vjC9JfPIoRu5mf90osepGUh25YRtF1gdZXowmrFtrrHVDreu27dzPzO3A6H2yTp3CD7+1lxGfs59TGXbQzenXPLyAtttmUy2B3D7jiUaziLng/wyzCTkNQ9aVr33jAKJ17hYkIVkUMWx4RV9nZvHgj5c6eKT2B2HM/vdr3OjJgrHIh3pehpfaP6lq8yDRgcfsIwQkDOFzYGt8ILSmnyBThCXj6+IjBsa0/v5J3Eki4+Fzta6F2Tew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yU4uJt9j41SLvb6L7EJ37X5xSXxKF+TQ9ypPj2QJ+/M=;
 b=qTEGeMDxeO2lpy9BVUYSrIEchs5lZN7MxfJHNMI/mxx9XfCzw2xl4HBrPwvZYjS/kmuGm74Hq6nvXPH1T/059N3bqZCmgXqEmibGb2D10fmhiMkKYnbenbzr1aIUrAovvzcQ2eCNMhYnFw1XY0MmZ+OSlg/RGofbxcKSlJ5fGIlUQrgVaOqob6xfO2BRNqVPKZtRpai897hgluhGbi/FXFfaQHYRyWpz5CHupC++TY1MBlSTnZRQfr/AyhReSM4DDJOBm4l3dBT1SDeGKCtliSmS87jzdtqJiCclXcRQjR8uq0YSwTd3ywp+z0mcOYYdJmYu41n9aRN8PLnjTid4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yU4uJt9j41SLvb6L7EJ37X5xSXxKF+TQ9ypPj2QJ+/M=;
 b=AoEZjoOZtWH+EaLzW/P7HiDLE/iCQvaXC3Fmo0uhSRv63z61e7DMVHklrCV4dCOBwlYhayRq0j3uxc0esrsf4WgLHr4uxJG16ddLMLW+PGNEs5TiqDQBJCB3nKxHqKY9QRz5X75GiNbX5xeBi/VsJ/oz8oEGe3305apQW8D1POc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PA4PR08MB7619.eurprd08.prod.outlook.com
 (2603:10a6:102:260::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 08:42:10 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 08:42:09 +0000
Message-ID: <30b8b782-1bf9-43bd-9022-67851ccef7a6@arm.com>
Date: Thu, 9 Oct 2025 09:42:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Ensure MCU is disabled on suspend
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nd@arm.com
References: <20251008105112.4077015-1-ketil.johnsen@arm.com>
 <20251008133235.0407cc9c@fedora>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <20251008133235.0407cc9c@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0316.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PA4PR08MB7619:EE_|DB1PEPF00039233:EE_|GV1PR08MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a5ba6c-1826-4f3a-753a-08de070fd00d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZVZUL1ZsWHpoU1FEb2xvb2NleXFKWVAwS053ZTBDSm1FWDFBOWFhVTAwYVFJ?=
 =?utf-8?B?ZEQvSTE1Nnc5czBxVmFmWnhUK1UzUmNQUlI5S0NLSnRrOWk2WkJ3MklSaUMv?=
 =?utf-8?B?Y1hHSTRqYXd5cThMcHM2UEgrdzVSUFJnUHBTSjlZL0g1dDJnMWV3bE9aZFlF?=
 =?utf-8?B?bWw1b1VEbE95MWZaWVZJMXlHcGxVRUJCNGZ6MmZCUVRzL3puU0VTT1hxWEtH?=
 =?utf-8?B?OGNPWUtNRmg1M3kxRCs5Q2NEVjlFdDNaTFZjVEFBc2xsdUdsMGo5UGRUdUNX?=
 =?utf-8?B?QmI0UGdzdDRvRGxsMVkxQzRMZE4rcEFKeStXMkJBWDdrK0pvYzEybFd3NHJY?=
 =?utf-8?B?L005K0FsMTdWWGxoNmU4Uzd0VU1zWTR5aGczdU5YRnl0Y3NXNnRzVUhpNFc0?=
 =?utf-8?B?T3ZRVDRXNEVsTWxxTmU3dWRvWWpVRHFzdVVXdUhCWFBMTnhxSVFZQTBjNElB?=
 =?utf-8?B?L21meXcwck9OaWNVSW1pVXRHV1d6eHRjWXNOL2hSc3llSHFZbjE5S3hna29H?=
 =?utf-8?B?M1hHRDFMM1B3VkhiM28xY1dMWXl3V1RRWmxtSUw3N1hDWEhKS2tIRHVaYjhY?=
 =?utf-8?B?TVI5UnNnL0ZsbndLaGNkQnBiOTVwT2x2R2srY21KRm4wdEhRdjJXWEJUUjZu?=
 =?utf-8?B?cnhMbEh1RWNUVjNxZVphV0ZkK2Jxb21qbnNnRjRTd1NiR3Y0K2RSWUlGSEgr?=
 =?utf-8?B?Y2RvUHM3TmxubGJIWkdMSEJ6Z2w5T1BraWlpZW0vbVpUeG05a2VTaVdiZFJt?=
 =?utf-8?B?ckhYYUN4SC9TTkVUelNnK3B4K3pYcWhwNHladDVyR3Z2Qk9nMUJITEFPRHRH?=
 =?utf-8?B?VkFneWlUYlA1bm9ESlgySWtBZkJTREhUOUJoWGFpQXdOdUZXQzhQS2t2N0xh?=
 =?utf-8?B?R0x3cTNqbWlmRWowdysxa1laSllUdXFZMEpUWmU2VnFKSzNFOHQ4aXZxY3hn?=
 =?utf-8?B?TG1ock43K3IyYUJsSFo2NTRLU1NtZm40YUQ2RmQySUZMTTJCOG5FT3MzZVRt?=
 =?utf-8?B?cGRTY3pzK3k4KzBNa0xsSUNSOVFZUGJrLzYwaG00K3haUzhvanlielFaNkY2?=
 =?utf-8?B?cS9UVmZlV1gyZFJyMHFJRXpmODduY3pxMlBCazhFbFRKeDc2SkE3c1lpbGVz?=
 =?utf-8?B?OEtwUEJnd1ZRVEJPWmRtcHRUVTFYWkhoSXhoR2xRa1RFNDNvczBaS2lqVCtE?=
 =?utf-8?B?dEpheXNaWGlrQXZFTWovNG1pYWJXUDB1aXlCc2JReEF5VmI4OGVKNzhmVFln?=
 =?utf-8?B?ZTBxeERvcWdIOEREbkk3NndUU0lTVE0xNHB3cVVaUW1KeFl2L3ZJa0NDc1NN?=
 =?utf-8?B?R3d1VlR0T3dEdEN3T24za0NTbHVXMWFoLytGaVpRcHJzZkY2L1ZzTzhqM2VF?=
 =?utf-8?B?TFlOOEU2dHlCdnhyaVZHYkRXSTFMem5icUYwRDUxaDE5ZlJXYUUzeWxkS3U1?=
 =?utf-8?B?akxpOVdZWDdMWnhCOE51K0VORkhkVVNoRFVtdFV1MU1PS3poLzA4V0FETUFY?=
 =?utf-8?B?YjIwWDJOTHhNdktJWlQzNEFXbnAzSnFMWXp1b3dYZmxheUI2MlF2aHFyNGI1?=
 =?utf-8?B?Wk4xamNtdkRRZHkzbHJRa2lpZDF3OTJnWlJUMjhueGxRMml5MVZsdFpMbWlU?=
 =?utf-8?B?d3c0ejUrUEU1eTRoRXZtUVFRVi96SGFoUlJRTWU2VzM5L1dDS3pkakNOcXg0?=
 =?utf-8?B?VHFXeHY2aFlubURLNkU4TFFGNkVEVXlzN0pneTdUM3BBQ20vMFBIRHJBMGVX?=
 =?utf-8?B?dVBkdXZHMjZDNTZGdERmaVZWU0lpRGxnR0prVSt5ck4ySmNvSjVXbTRrTklH?=
 =?utf-8?B?R2RJUld1bWFuZWg1VkFCZDlaSTBUMUhqMTIxTXQrSkwvZ3RpUjkzc01hZ1RR?=
 =?utf-8?B?bXAwWXdtQ3o3TmNuZVhjYmRVcGJJQno4SDVRbSsrNVhJeWR6dThwOHdYZnh6?=
 =?utf-8?Q?lrFuLVvFbaBS2ZNf3gjTvt7+wkRbIRAI?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7619
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6961642b-9f68-4863-6978-08de070fbc24
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2owRndmT1FkYktLN0t2T0hScjdJSWJCd0FBK2JCSi9xTGhBNDlJQnZGSTJZ?=
 =?utf-8?B?WFI5WGtyZGJ0WUhqMEhiVzR4enlORGlsRDRZbGtqRElJOXdXOFphdmh3Ympo?=
 =?utf-8?B?ZWRxeUpxeDQ1Z1o2TVFpSXI1cFc1eUY1dnJTT3VRMDgyNGJIdEhFczVpOERp?=
 =?utf-8?B?QVI2Vmg4ekhSZ2VuUm0zUUJYVm1UNXpWMGJlYkNIamp0U1pFSUI4Tm9XVHFq?=
 =?utf-8?B?cFgyd2JQL2prR3ZXVVhmUEF1UEtRZHUvWXkyTkVwWFVZdmhwSFh4N0ltNlg3?=
 =?utf-8?B?SDMyNkVOQ1laVUxLa016UElyRXdKNldzNnhsZ2pBZGVLQ1FrZXdHUHVKaXNI?=
 =?utf-8?B?UGZ5aVBjM2kzTjBIdDJtYk1iOXB6K0R5bnJIcFh5ODRUL240b2lUV0Q4d2Vi?=
 =?utf-8?B?b0w3UGl0aFNGeWptcGhHeG1wUDFuakh6bW5PZHA4NEx6MDd1UEUweTVVWGg3?=
 =?utf-8?B?bEJpYXJubzgvUmtabk5PYmkwYzg3eVZ2bzhvR2QvakR1SCszMEVKUnRDQTd4?=
 =?utf-8?B?UHNxMXIxUzR4RmJTSS9PYXBkSnpBQnlzeTM4MmZsQ1cvdWw2UVdyeVlFUHpt?=
 =?utf-8?B?b3d5emFxeEJkUlhTeFVlTi9IRWdYZzNNUHdzSUFKTUlnTFRNWTcwUWZNN1Jn?=
 =?utf-8?B?TW4wdVFjN3ZXeGlpY2FDYVlLSlp5R0htNTJTaWVORGJWVVVuc00yRDRVUW9H?=
 =?utf-8?B?UzRhQ0NRSzQ1QTU2d1g2VHpTc3ZYRzdmRTJrZU00Wk83R21jUVdjNGhWTmZH?=
 =?utf-8?B?cEVpUC90Wk15eXI2RlVYaDBnMEVnNWZlY05vYzAwbWNJYXUwT2VRbDdaZldu?=
 =?utf-8?B?T3EvektqMU9UV00rWGZWL3p4VkVkNWRuOWMvQ2tDTWoycW9KSVFmZ2JoeDQ0?=
 =?utf-8?B?aWNaWWxiQjJwYlVoVDJSRVdNeU80My8yWlRsTUVwcVBmc1VwcTcvK3dYa2Fy?=
 =?utf-8?B?MDdQL3BFeUk4TG43bGE1MTZ2RTJrQWljOXpBb3BncG44c0luNTVaN3N3Y0J3?=
 =?utf-8?B?ZFRXOGQ1cFcvSlNJWHpJMVZCOHl4Vy9pbFRNNHlydGYyS3FGQXFTclhRSVMy?=
 =?utf-8?B?OTc4S3daNDhNV3ZmdWRyeEdIckM3U0JDSG4wSDlrU3RDYVNQd2JUenVKNE90?=
 =?utf-8?B?aXgxOVlEZFhUSFFUbWNvcnNhYXBrK0xKblJQNEw5bFdUR2UzclRpSkhVTm5Q?=
 =?utf-8?B?ZkpZS1hkMGR4Zjd1MkwycU5RdzhUM01UYWxSaXRyeHBvc1lYQkUvRHB1TTNT?=
 =?utf-8?B?a2EyT2dEVGN6Z0ZFQmUwUzNzYm5SeFBzRC83TWhnSmhVUFd0MFZNVTZKQXFF?=
 =?utf-8?B?N0dDZDIwcThHZmd4c0VPcFJIQm9FS2lPaEVRZS9BV2VvemhwN0VWcEJ0Uncr?=
 =?utf-8?B?YWQvbzNqbXBYb1QrYXhVUU1LeGc3dEMvMzExQXh5V3NXUVhldElnamh3aWM1?=
 =?utf-8?B?UUpYZWJwcjUyV0xMYzRvelY0dzRHVDdKZnFWbFhwc01TTU0zMmNhamlPd0x6?=
 =?utf-8?B?SWx2RXI5clFNeXdWNHd0STc1QXpxZURkb0xsMk5rRlpCK0xZenM5K05UQXYz?=
 =?utf-8?B?Mi82ZW4zRDVoQkhzUE1MUEw3bkM0eTlOSk9BZ0ZwSFl2aWRNVk1CVndLL29C?=
 =?utf-8?B?eDVDWGdnQWluN0NkNnNnSUwvNzF6MWlQano0a3RoUkxuNGtFWGZQeXdYN21o?=
 =?utf-8?B?blNKYXFJYXhGQm1naWhLcUFQamFCZmZPWEM1UW9qTkRlWXdUOHhQSXl4MHhk?=
 =?utf-8?B?aGFGdFlNM1pUS2R0SlVtVlVHUzlBRWo1K0EwYWNKL2lFcG1DY0k0WDRjZjMv?=
 =?utf-8?B?STVMMytEYnRucWtsN3gvbGg5LzlSMmQrSXltMHpQMC9KQUkwZGYrWjlpRWN0?=
 =?utf-8?B?b3NmbnVzZ1hUTFhRYkhKT1pkUkRwdzZ6VGhUMmozb3pEdDBtTTR2SGllczU5?=
 =?utf-8?B?ZW5NNHNtT2FRam50UU81TjB3WUlZTmw2TGJCaHk4UFg1RE51bGFmdGZvM2Ex?=
 =?utf-8?B?RmZHVXUrTW1YMXZ2a253ZXdvS3VuUFNLMzZsZWRoRStxUDZnY0hJcEg5VEh2?=
 =?utf-8?B?emI3YmZRUkkyVy9iNE05bHBINC9CLzkzOE1LQnFSMk11ak90b3MrSTJmeTRk?=
 =?utf-8?Q?wZzo=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(14060799003)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 08:42:42.8663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a5ba6c-1826-4f3a-753a-08de070fd00d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8402
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

On 08/10/2025 12:32, Boris Brezillon wrote:
> On Wed,  8 Oct 2025 12:51:11 +0200
> Ketil Johnsen <ketil.johnsen@arm.com> wrote:
> 
>> Currently the Panthor driver needs the GPU to be powered down
>> between suspend and resume. If this is not done, then the
>> MCU_CONTROL register will be preserved as AUTO, which again will
>> cause a premature FW boot on resume. The FW will go directly into
>> fatal state in this case.
>>
>> This case needs to be handled as there is no guarantee that the
>> GPU will be powered down after the suspend callback on all platforms.
>>
>> The fix is to call panthor_fw_stop() in "pre-reset" path to ensure
>> the MCU_CONTROL register is cleared (set DISABLE). This matches
>> well with the already existing call to panthor_fw_start() from the
>> "post-reset" path.
>>
>> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_fw.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>> index 9bf06e55eaee..df767e82148a 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>> @@ -1099,6 +1099,7 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>>  	}
>>  
>>  	panthor_job_irq_suspend(&ptdev->fw->irq);
>> +	panthor_fw_stop(ptdev);
> 
> Is this not preventing fast resets? My understanding was that
> MCU_CONTROL shouldn't be touched if the MCU was halted from the FW, but
> maybe I got that wrong. If it's just for the MCU crash case, we can
> have:
> 
> 	if (on_hang)
> 		panthor_fw_stop(ptdev);
> 

Hi Boris, I think as long as the FW is properly halted, we can safely
disable the MCU. In fact, because of the ptdev->reset.fast tracking, we
can call panthor_fw_stop() in both cases, as the flag allows us to
handle the resume path correctly.

As per Ketil's commit message, if we don't clear the HALT bit on L2
power on, the MCU can start booting the FW with the bit enabled, which
in certain cases can make it fail to boot. So this patch fixes that by
gating when the FW is allowed to boot.

I also believe this behaviour will be better aligned with the expected
behaviour from the FW of newer GPUs (Mali-G1 for example).

Kind regards,
Karunika

>>  }
>>  
>>  /**
> 

