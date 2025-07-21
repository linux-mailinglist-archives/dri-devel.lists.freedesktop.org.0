Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B8FB0C2EA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D76F10E4F8;
	Mon, 21 Jul 2025 11:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="SQYTSDax";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SQYTSDax";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203A810E4F8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:29:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s5bvBmR5x24hD/AqedYSIq52qubZytIXJG867FPC2Qe+vl8xudMIEl8ybargA2t/u0WPinl4Nb5P8oDLBGcwRJhMhdQbvntUQ83Z6BNChN6EIonUoMg82Vs1g7NHaGWYu/VvgVePWBr+ejHcsVkPepE2ORpezfHL1bAwRE2ZlNj7q9p/1b1rkHnDNXib+nAwBBvaVdDK8NDDegyfNahQTrU1rbwsvYgSWBbpKZ8pqapWAI0wpcXSx3Hx/JDXEeSZSEWu1hfA+cJBogES4YNb1BaXblAhu8vU5ouBzyI6TmAOXbp6vMv3YznRuRuaKE3Ht1f6G0paoM3Qh/AcyXEM8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qi43eSbaBB0fL4U/42ZyQXVFl2zn+0AZP6W9eORzDYE=;
 b=mytolZusGTQVEoVtqDcKQ6uJmLCWGnl0t968Z7fMGQtuGMvmdkBoKRjrLtcO+qO7uDnS+aqspUfcB3J5Xqhnqz3MhpZ1Jwi94vGNQrMz145gFDGat4VJhl0HGLXMCAidW95W2ANEeIMmwoq9v2GLujRm8+dAAhlYESE1r/nyvuQkcYT7Jc24jAV+Og+7dRcCzFJGjDnJNaagWTvIKroemtj0Cj85a4nBxPX+/WndwQ1EEMi8dvUAJjoMlKoLG4ipYzgLXlAEEfNWuChhMVKW/xaYSk//wlHvuQkdvNuLtUosrFlWqHE9/aEuuzOLoNGpM4jPiFaYOFKHuaf0YWsQSg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi43eSbaBB0fL4U/42ZyQXVFl2zn+0AZP6W9eORzDYE=;
 b=SQYTSDaxzVhTlfj2OTsEAJB0LCkOymjUB/M0FypjkZFH7j5rLpXzug3yn4Z/cQ8g7MJF+lfmTIuuBVTNZoX3Ob6bHhCQlj/VlzUlAj9AWvGynVZqneasNsj4iQwUk3l7UyR3NKkmbYqrOXX0nSrQPCk7XK/FYAr11vjUoVRxVlM=
Received: from AM9P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::30)
 by AS2PR08MB10295.eurprd08.prod.outlook.com (2603:10a6:20b:647::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:29:00 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::e4) by AM9P195CA0025.outlook.office365.com
 (2603:10a6:20b:21f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 11:29:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdjuJ6liKkEE6+7VHJTW2Jt2GTABopzAnIngcjSRkfGwQ9jbcG3r0QiqYFUZVp7A+G7AhWORcADMHXB5KsNyCorFhZvL3X6ytWJY7XTiKaUY2h0HbP8sNctQS8/Vx3dPDvcNgePp1sN0g2DhoHZtuR91zG6PecqNhrQ3Imjw47oXixKJWcFA9Sd1YgADJBRp/ZY+mCbMTkD+2Jp6AlHc8OVLp7lW1atv+GcXS97SJKAE3cu1Yav4v63QkzMBuKoqU1XIaNM9Y0L5wnHbPA9T1QHwZ9j6CP4MbKE8fHjVGRZCANPntDZaKtZ4CvstOBlwySKBC1swGOO8t1qOki9QHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qi43eSbaBB0fL4U/42ZyQXVFl2zn+0AZP6W9eORzDYE=;
 b=Sp9aulsyEcs2O/Vqo5qtHrY1cvSNDftDQeidrOFMa2Vb2a9ONnlOoa+SknOtdfgC0l2TRfMuqIunV/AxbYI10Fzfdlkz4BRlFxB1Ic7hTERwFig9FWSD418W34I26OOQA+pY9evkFG0iWfnqEQBhVkqQOrpR08Q3cgAZ6OrYcmdt0PM3aMgG8cVObcok5N86lDagKX4nt0A99n76BJMRhu+3pt3tHXxx/7WJP/Wx5ugHWABySbyvKMBFaRw6jrse3D9aDd7ZOg+C4K3K/z6DtwBZNGXVqK5A8S/q5+TZTy+aWs4QFtuI+/HqOu6TXdy+BrYOnVNYkw53Aj19dnc9VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi43eSbaBB0fL4U/42ZyQXVFl2zn+0AZP6W9eORzDYE=;
 b=SQYTSDaxzVhTlfj2OTsEAJB0LCkOymjUB/M0FypjkZFH7j5rLpXzug3yn4Z/cQ8g7MJF+lfmTIuuBVTNZoX3Ob6bHhCQlj/VlzUlAj9AWvGynVZqneasNsj4iQwUk3l7UyR3NKkmbYqrOXX0nSrQPCk7XK/FYAr11vjUoVRxVlM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by VI0PR08MB11063.eurprd08.prod.outlook.com
 (2603:10a6:800:24f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:28:24 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:28:24 +0000
Message-ID: <e509e1a1-a9ca-4b16-82ab-916ad735a67a@arm.com>
Date: Mon, 21 Jul 2025 12:28:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/panthor: Add GPU specific initialization
 framework
Content-Language: en-GB
To: Chia-I Wu <olvaffe@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-2-karunika.choo@arm.com>
 <CAPaKu7TbzqjF+q7McOS3JppiKfg=zKFr4aYQZGsmvOnR+jEN3g@mail.gmail.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <CAPaKu7TbzqjF+q7McOS3JppiKfg=zKFr4aYQZGsmvOnR+jEN3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|VI0PR08MB11063:EE_|AM4PEPF00027A60:EE_|AS2PR08MB10295:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a3c88f-e4c0-41cb-d924-08ddc849c968
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZExTT21wRnovR1JrVUJxYlV4ZjFLKzRWeUswU2hHdE9jamk4d2grdi9rVjRm?=
 =?utf-8?B?K1k0Ui9WK2lVemFxYVhuSUlWSTVQRUdBZmd6ZVdESHBDUHlkMnFEOTRsZ0NH?=
 =?utf-8?B?VGlISDhtLzVzU2hTS0N4eCtZN2djaDVpZHlYcFVWTW4vcGdsbFg5VzQ3UFNh?=
 =?utf-8?B?YzdjN3h5ZDdHREJVeHphRUVockZpd1FJNW9nYXRMd0xKWGR1cVhrcUNaN3pY?=
 =?utf-8?B?aDBwYmRTT2VNOEJxSHNTUi9teXVjc3NvcUtnMElaSjZOOHE3bW1DdFc4NlNz?=
 =?utf-8?B?UFk2VTA2OHVYNWI4SlVjV1BBM2VLNXJPZWcvaDkyMmg4aFByc1pEZzZybjY5?=
 =?utf-8?B?anR5QU5TS25qTXN3MmdkZm5JZms5cTF1aTdpVTJBUmEvOWEyOVJ4THltelpu?=
 =?utf-8?B?U0xRQWx4MGV3TnUwanlOK3pJYTlUY04xZnNaV1JWRXdnVDZaSUNaUGkwTHdy?=
 =?utf-8?B?Q1dRbnJkazdTbUp0SlBWbGs3dGJyeHYxcFlzMmVlRzdPb0ErUXUrdm9aRzc5?=
 =?utf-8?B?SXY1N2VKRUIzQUdyU3cvYmVvWnkrOXVaYnVDbThVWExmTHNqaEloa1Z0S3pa?=
 =?utf-8?B?OXA4L1h3UzhvYmdLeVBnbFgwSGdBbDdQV3JIRmVXMnBUNEhuM1ppRW95UzVh?=
 =?utf-8?B?dWE3TlpOMHB5ZXU0K2ZHSjQzQjhJUEZDeVROR25PWVRvTDJoM1hUcG8zK1R0?=
 =?utf-8?B?VEsvQjY1cDRuNlJBSkQ3U3VLSkZDZUM3NGF4VWFSamNRSllNaktjUFcvbTh1?=
 =?utf-8?B?U0hSRWRFSUNodkQvL0RuSUdTdU0zaVJHbmdaNWFkL2Y0VDdUcnp2U2ZuVVRT?=
 =?utf-8?B?UzFFU3BQcjVGZ01DV3pHU0JpbDZnRk1jUFlabmVsRzZOWExwSk1MRXE2d1hR?=
 =?utf-8?B?L1VCWXZzaCtXci9JL3NkMFJHRzU0TkNnQUs1c3NaUkt0VHFYa3NteExKcWJX?=
 =?utf-8?B?MENkZXBmV3dKR0JPUSsrQWxYVnlya0xXWDNvbElZdDMwZ3RYaFZSYjZDOXBr?=
 =?utf-8?B?YTFkbEtlTE8wRGkzUkZiZlJ1eXdyZnpFSUZtZlBEMCtiZFQ4blZpV3FZNXRP?=
 =?utf-8?B?aUl6M25xRys5NGVlOWVvTkJIUFpnVHErck1qdkZUTm9kYXlVKzU5N0NqZ2RK?=
 =?utf-8?B?NWJkdmlNMDJIMG5NQkduOGplL1REcXh4ZlNxdmEvM1d0TFRTT0xBbTJxWElF?=
 =?utf-8?B?bG04Uk92cGZreEk5VE9adEY1Ry8wQkFIbjNrQkJVbjljcVk4WUxtNUpWMTQv?=
 =?utf-8?B?RHdaMkFQSHhWZ2l4cWF4elNjbW9MUlBGemJxNDFUazhTM3ZrK3ZaM3A0UnhD?=
 =?utf-8?B?TjY5UmFWOFF2TjNZb0hkTTFMOWwxN0VDNjlTVnlKMGVpc0NUU3J5QWcxQnVi?=
 =?utf-8?B?aytZQUZXVnVvTHNzbTZRRUxIS0c5UWtjUnRFRXc4RGxUMkJqckxETVJNODJy?=
 =?utf-8?B?NTNOS1R0MzdsZGdjMm0zMm9rS0ZyRVkzb2s4L1owMmFibVdhT1dZMjMyN1Nj?=
 =?utf-8?B?YWt0K3dFcTIzaWtvMnJwOTRNTFNtSTl4QzZMNjZOVy9XYm5aeWkyb2d3UWJk?=
 =?utf-8?B?VE44djhoekhQbDFkOGpJK0lPbHZuOXJ3bjBaMiswNnJ3RjAyb1JDY3oyS25h?=
 =?utf-8?B?NzNoVUdOR2hzZVNSWlJnSERKc21YQzBTeit5Z0tpVzBOd3BROGR2NU9sQ0dF?=
 =?utf-8?B?eVZOVGFZUlEyRGNEbzdWMkdmVmtLUUs2c1VpeGFhS3pzdUppejkyYVpHUmxC?=
 =?utf-8?B?S21MSEhKUGtNYUtnZCtkcnJocERQOEVuSFNIOFB4MjBxZWVIWUx1UEJzRjdk?=
 =?utf-8?B?TkdFN1pEbjdMbHY1SFNJejlNSzZqTDdUYXdSR1h3dlBmWUhZVzJPWGxDaUpS?=
 =?utf-8?B?akFEY005c2xlVXVYd0tSMmxndkpBQzhMNHR0ajNLQzJTZHJyN2dVNnhnUkpE?=
 =?utf-8?Q?AxbgpJqzTyc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11063
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d2529c7a-a374-4143-ec78-08ddc849b470
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|14060799003|376014|35042699022|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTFDNXFDdE5wNHBUSjNySHVvc0lSOXhHbmUza3NQWDVnbE4rOXo1NVNJSzlh?=
 =?utf-8?B?aXpVT2lJNGZnaWNpZm5qTkJpeDVoMEVwd0tKcWcranNNMWY1Wk5jVVUrTDBN?=
 =?utf-8?B?YldYSjVNT3dvTnBoN2xIQm04L1N1WDcvQlRlejk4bUM2eERwakdmS0JtdlV3?=
 =?utf-8?B?K09EMGN4RDZVTlVCT2pvZTVFNEdxbTdyWDZiK2V2SkFYVGgvbDRUd0RYQlJy?=
 =?utf-8?B?bXI1VDNhZ0RrTTJWSUh5WHI4cmxHZmxaVWZRb3hkVWs3NVlUQjRybGZUd0Iv?=
 =?utf-8?B?Qjg0SXpxYmVUNDBaQ1VoWWY1U0prWTc5akhzOFVWb1V0WVdObDYzeGtyaVpN?=
 =?utf-8?B?MGdzQkEzN0x1a2VKRXMzTHVReWhLWVpWWTI1OHhFbEY2NmVFc0xLWG5kK21a?=
 =?utf-8?B?cnIxZmlPL0wxdnl1VHVpMi90Qm1pTDJEYUtEQ200ejNKQUZ5VFA2YzZBRXc2?=
 =?utf-8?B?KzNseFdoMWIxUzBmNzZIZmovZHFEbUc2RUFBWFE1UVIxNHFlMjhEZTNFQWNF?=
 =?utf-8?B?Yi9qMGhZVERPVi9tcGN6VjFwWVFOeEY1b3crTzhscGlQOSs3UUlIdzI5NURF?=
 =?utf-8?B?SzNMblBuRmpvclByRE1XaGJFNGRkTVBISE5wd09XSk01N0kvaUV0QVZHQURt?=
 =?utf-8?B?WnJ4WXQ3cm9ycjJUcHVuSFRVK3VpT3AwaTkyNzloOVljeG5acmljZ1VoL1ly?=
 =?utf-8?B?VXF0OGROVXlUMEFPM2J6TEUyUkREWWpzclB1bGFYa3FTaHNDN1JIS3VrMXMy?=
 =?utf-8?B?NUhrL1B0VjVOYVFPek1IQ3dTSVNJckNuWUluV25RZUdtQTBSc0ZxNjFESU40?=
 =?utf-8?B?Qi9Nai8xSm1UZmNDR1JaN0xoZ0lHUHMrdU1KWlJpMS8yN1VCVDhZVmh0TDhO?=
 =?utf-8?B?WWdEa2ROazZ1ckdGN1M2VTBOdG4xRkRJSnlscmEzSkJoR1JnOTNvRzRqdkVC?=
 =?utf-8?B?Y3B0M3dIU3lXRkg4MDFJQ3BlVFRBRFBZVkpaSEdQYnBWMG96bVhTaHlZRThX?=
 =?utf-8?B?T0RNNnl0dzg2UkpvWDBQampTZ0x1dnJYQ1JXRnVNSE5hTlJoWThpTzZlQjd3?=
 =?utf-8?B?ZmxGUDdMQys2TXEveE05N2doS0tlczBLR0VrNWl5aXM4ZXF0U2c5ZVlPclZm?=
 =?utf-8?B?RlExT1gvSDdBMHNzSDUwSDlIcEFNYzBia0wrek1tUGlLOWI1STduaFVIcUlQ?=
 =?utf-8?B?dThEb1Bwb0lZcEVUZmtBV0lpQUltRmJVNEZySGNJVnlzTE1kM0hzdWI5empY?=
 =?utf-8?B?UlJmTHhoOUkrTnltaVlqYitobEVrSTZRN1d5aElqQSszN3NyaEQwS2VZYzRv?=
 =?utf-8?B?VHl0aUdWZXFGQ0VJeC9WSGVZRDdjek92SC81dEN6NUdRNzR6SGNzM0dmMk8z?=
 =?utf-8?B?U3dVVGV1KzI0UG9aelZsWG16M3VIdGp1bE55dG41KytiUjFNMzh3R0lrM2VZ?=
 =?utf-8?B?dmtMM3h4SEIxb0VlS0d4M2hyTytxSnRYQkFwK3B0c0FlOTdHMmNpV05Bb3Yy?=
 =?utf-8?B?M1FCME92azg4QXRvWE0xVWEzbHpkd0NOMTFJSC85MmRIaEZKZnFENHlZOWpI?=
 =?utf-8?B?QkkrVGNiNzdlMzBIRVJZOVk2SVVXYTZnQlFqenFhc2N3YmVyWGY4by9jd3Q3?=
 =?utf-8?B?YWpheVRibVQrMzFQSnRaMy9lZ05tWG1xK0FkVGYvckdNWmVsVnd3eGZoOEtQ?=
 =?utf-8?B?eUE4Q1BrdHAyd1lBS1FUQjdnQzZoUVlFVnY4SW1pbzY1a2R5ME1lcERIZk9v?=
 =?utf-8?B?NkNjM2REbVpNOENlMXFlRU5QRHlnQjNhNVJVNnNIY2hKM1hMUDNYb1BTVi9s?=
 =?utf-8?B?Y0ZScEZTcktxbUVZTlVQdFE0OUJydFJ6NFhSdVp0U0l1M1dTQTNUSm1sQnVZ?=
 =?utf-8?B?cVRJdFJDS3g4bTMrZUZRU2RlNEZsSHBySmZnTWJGb2xZRDQxMFp5N2M3WnVS?=
 =?utf-8?B?WkF0MHRMWnlOL2kzb2J0WGZhcDlRSzE3cGNhTnhPYWpEeDN0MmtXd25wWkdq?=
 =?utf-8?B?azJzS0Z2NzkvZ3ltdW51OW9haC9OTEpBdDlURWFBdHRUcUZEMGI2MElqaWF3?=
 =?utf-8?B?THczblJOdVlhU054akJpK25yVG5DNWpoTTQ2QT09?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(14060799003)(376014)(35042699022)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:28:59.2842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a3c88f-e4c0-41cb-d924-08ddc849c968
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10295
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

On 11/06/2025 00:12, Chia-I Wu wrote:
> On Mon, Jun 2, 2025 at 7:33 AM Karunika Choo <karunika.choo@arm.com> wrote:
>>
>> This patch provides an initialization framework for multiple Mali GPUs
>> by introducing a GPU support look-up table. Each entry contains, at
>> minimum, the architecture major version of the GPU, and may optionally
>> provide feature flags and register offset overrides.
> <snipped>
>> +/**
>> + * struct panthor_hw - GPU specific register mapping and functions
>> + */
>> +struct panthor_hw {
>> +       /** @arch_major: Architecture major to match against */
>> +       u32 arch_major;
>> +
>> +       /** @features: Bitmap containing panthor_hw_feature */
>> +       DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
>> +
>> +       /** @map: Panthor regmap */
>> +       struct panthor_hw_regmap map;
>> +
>> +       /** @ops: Panthor HW specific operations */
>> +       struct panthor_hw_ops ops;
>> +};
> None of the fields are really needed even at the end of this series.
> 
> Can we merge patch 1 & 2, introduce just panthor_hw_init and nothing
> else, and let panthor_hw_init call panthor_gpu_init_info?

Hello, I have tried to address this in PATCH 1/6 of v5:
- https://lore.kernel.org/all/20250721111344.1610250-2-karunika.choo@arm.com/

> 
> 
>> +
>> +int panthor_hw_init(struct panthor_device *ptdev);
>> +
>> +bool panthor_hw_supports(struct panthor_device *ptdev,
>> +                        enum panthor_hw_feature feature);
>> +
>> +#endif /* __PANTHOR_HW_H__ */
>> +
>> --
>> 2.49.0
>>

