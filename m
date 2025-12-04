Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83363CA566D
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 22:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E74310E21E;
	Thu,  4 Dec 2025 21:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="aQ131xHQ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aQ131xHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB88810E1F4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 15:18:51 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qaNKoV8rgImB78fMzoHOYtEHHxy8ElqoJphieFUPbxQf6c10982J4nrd4u6KyIV7xleZW2559TkpK5VFp8ViDmed/KCU8fJvYgzRVgbOQO37wYQfZCDeYfJIovUZq5P/ZOu3Ad+xFbbBS4zqGY3cjuCNri6so/7mjRwXycZOLtaqwwDW2hX4vSdKUY+DcqnPWFMHZx/SGaemgF6jVCz+JWrWQ0TYgqtBk3nqCJtpHFjk5jTfbpYgmUg2B2JoSKfotS6y5o21chX4OqIQ8Nyxp+9CFQgrT7lVt5Qh9neQST58bhYfOdpbzxg+FEQ6+hQWxBmF3/g07WQVFcDA0GwE/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nU1Ww/l2N0LwNgQKdQLYcms99YcXQnwOeeG8am+G79s=;
 b=fVoBWEXqA+OehQedUK2f1RKvJACz5JgzRWhGVt7Dfb2MonsQbEUwhHUC7PHKZFI1U/8y7jP+UUoWy6Y1vDxOWPX/tioFKeKVhsGVUKMPxwIDU9NSp2VcDYQbHvGh9EgE7l2GD7kG4mQJxKmh0qC/8xedOnMo1RPkTmhAmXOxvPb5OLV+OKAGihZNP2X5K0ECvV1MT4389TAS+QUWb+zzwhBN8OBvG9asD/rcBkvfAD06DQxAquUJy6xqRSGqmnmIfZ+KSMWCrnEkOc9k8WKDZ0XBrFsBVjO40eGocEl0mVpaoU5ilAwNYSUOObqctiU/KjqCekosGT3wYet4ulrFDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU1Ww/l2N0LwNgQKdQLYcms99YcXQnwOeeG8am+G79s=;
 b=aQ131xHQxHSXFhuqQTlorEIVk7COOZb30f92+4A+57ULC/jdrqXw0bgT6mphTCJSk6W/MXp0aXiHLYrLy2OsUiCMHSS37VehxlJQzNJnKN5fR1VQObgwPZoXNeqIL+trLt81aLZyeLwTDly820A8JsblVqMuQOgLvXoUlOtM8YQ=
Received: from DU2PR04CA0090.eurprd04.prod.outlook.com (2603:10a6:10:232::35)
 by PA4PR08MB7666.eurprd08.prod.outlook.com (2603:10a6:102:263::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 15:18:43 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::65) by DU2PR04CA0090.outlook.office365.com
 (2603:10a6:10:232::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 15:18:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 15:18:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfJhcrwPrw3tj8Yi4JAXIF450P3JuXig2ZaynuARM+bfmHX5KkqtKum0rS05EG3hkXx4Wu76hxh1FdUQc8VG7y4DnMRaGOH0124bYG2FLO2iWn8x8lQV9s+752fGSQDsxQeC29bKitzzUTfc8dXb74KrKmUcxycZJsHF4Bxs0DpjRm3qozJqUH2CLDIv8BKRmvkn5r1FPds0lbo/YgkDF54bWVCJbiFRco1pINs0C30sx8huF3MbNHsoZouCfnX1gblwM3e+CijHJmC9HmppWyBeMz3qqm+PUdUpPnWzBu/s3ijzNATVk9geLL/nYWu0a1wYfo9dKpbF2b0NVTfEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nU1Ww/l2N0LwNgQKdQLYcms99YcXQnwOeeG8am+G79s=;
 b=otPGB7Hj9VWA6dSmFgyfwQC04ngO0i2+jfuzVj5RQoCbOeujBsKcUa6hyMZ4KIwWrHKLy9YbACdc3HXe14E+SwZENft5J0TMwzX52hwX+8QJvoH8BnVMA2esHewNRSkehX3t83QbHaAW5IqXcIQKo2wKjq09c69vt+9uEpTR/EbN39jdwYXPcPkxcrMuPSZslhxf+3qlswVOwPaKqzKA8yYbZUA5JJ9N+zTWhPwvdf6NWQMctq3wLQBvLxFpgZNBCM8SVW9IU08FFnkKo/t9LO7ceac4C0xZt6UyHvcFiHeFyj6G5AWKk1SdZfqSKsDuaFrkviv2pIPPprkIbnlBTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nU1Ww/l2N0LwNgQKdQLYcms99YcXQnwOeeG8am+G79s=;
 b=aQ131xHQxHSXFhuqQTlorEIVk7COOZb30f92+4A+57ULC/jdrqXw0bgT6mphTCJSk6W/MXp0aXiHLYrLy2OsUiCMHSS37VehxlJQzNJnKN5fR1VQObgwPZoXNeqIL+trLt81aLZyeLwTDly820A8JsblVqMuQOgLvXoUlOtM8YQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV2PR08MB8368.eurprd08.prod.outlook.com (2603:10a6:150:bb::7)
 by GVXPR08MB11421.eurprd08.prod.outlook.com (2603:10a6:150:2e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 15:17:40 +0000
Received: from GV2PR08MB8368.eurprd08.prod.outlook.com
 ([fe80::f88b:b5a0:3f87:e5a]) by GV2PR08MB8368.eurprd08.prod.outlook.com
 ([fe80::f88b:b5a0:3f87:e5a%7]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 15:17:40 +0000
Message-ID: <a7056322-504a-4923-bfbb-17bb79395f98@arm.com>
Date: Thu, 4 Dec 2025 15:16:42 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/atomic-helper: Export and namespace some
 functions
To: Linus Walleij <linusw@kernel.org>, Vicente Bergas <vicencb@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
 <20251202-mcde-drm-regression-thirdfix-v6-1-f1bffd4ec0fa@kernel.org>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@arm.com>
In-Reply-To: <20251202-mcde-drm-regression-thirdfix-v6-1-f1bffd4ec0fa@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0243.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::14) To GV2PR08MB8368.eurprd08.prod.outlook.com
 (2603:10a6:150:bb::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV2PR08MB8368:EE_|GVXPR08MB11421:EE_|DB5PEPF00014B9A:EE_|PA4PR08MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: aebafd41-c2ce-487f-bca1-08de33486917
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WXp4d1RNMXNMRm9JZk81Uk1ERERmaVZiK1VSRlUrQTlKQmJJL3hyUW1hbXE5?=
 =?utf-8?B?UnpRbU9DZEwxbXZEMmFvZ3pqOGR6THpCeHJZdE5DQTV6Yys0bjJpbkEwaW11?=
 =?utf-8?B?QmtiZFRzMzZzV0gzR1dZN0RmQ2x0M21EbGx1dC9WWmszMnN3Sld2K3lRaXF1?=
 =?utf-8?B?UzAwY0VmMS9YSjlQdmpsMDFJMmhCSlBmdE1DaGhIK3dDbzRodEJaUWcyckRa?=
 =?utf-8?B?NXYvWXB5UVZWWGpxN3J3TjV6aTRnbzA3NEM3K3g1VUd4bndjR0NhRUtSUXBW?=
 =?utf-8?B?ZzA5L0ZlUUQ5RDk2RW5WcDBHamZpd1FtazZsM0hSeUlYQzVjYm5MaFR3THhx?=
 =?utf-8?B?RzI5VnpNZUFrR0FZeWtmL2FlaDUyZHN0SXhwLzhSOGdWVmoxRHcrclpWYUNv?=
 =?utf-8?B?U0E4WENRME5WVFQzdnpNbFdzTzQzOG1NVGU1S3M3aUF6OEd1azltY05QSGcy?=
 =?utf-8?B?bGtkVHhtVTJIQWxsczY0VDdZYVVxczk1Y0pXSmt4Tm43NzBvUUFZaWdWcEJF?=
 =?utf-8?B?cU81cGoyTGFVNzNBTWh3dWMxN2FRc3VqY1dOTitWSlZlQUQvWXAxNmFjb0Uz?=
 =?utf-8?B?ZjVFeDhXaXZhaUN2OXJpY1ZBVUgvZUkxUXZ3K0VNUC9sdWV3Q3FTV1o1OW5h?=
 =?utf-8?B?cUZpMTNnSWt3MTRVQjJwS0RoNjlSOCs1STNtOGxBYWtLSzRmV0dpU1k2Ni93?=
 =?utf-8?B?RnExcWpOVTVuVytKMVpvQVVFbGVFajlmVHYxK2ZOblc4UWUvTjJpL1VsbVRS?=
 =?utf-8?B?UCt3SXU0a1psZTlKek9iRkpzTFlaQ3ZJdTlZYzFXNWJzdklrRDZuMGtsRnkr?=
 =?utf-8?B?eGFQQURZckNOTmlaUFZjNWlLZlF1a2JRTThYNnNVSGlubWFDSzhFNFA2ZU1j?=
 =?utf-8?B?M3VOTC9sdUpSczZrczl5eW8renZaRjFzdjdENThiZjBvbzh0aFQxQytkRFRq?=
 =?utf-8?B?YlRCQktlMW82Q0ZUNCtsZHJqeG15OGsxRU5RblpBZExqUGRRMHV5eWlXNjFy?=
 =?utf-8?B?UnlqQ0JsQVdVWTR6dmVpaWphLzlTZmZtYTZJV3h3eUxvb1k5dkdseFVhQm5L?=
 =?utf-8?B?THJneVdjNUFYNXJ2VUlHakdjYTZwUk4rSjNMWG1jL3RvczZGSktoNFB4emZU?=
 =?utf-8?B?bHpzSTJhU2F6KzcyZldxeU91RW5XZUhYOUVDekRMai9TdUEwRis2bVMySnRU?=
 =?utf-8?B?VFJrM2FPejRIajJpR0x2MWpBM3FYdG8wZ0ZUTnFqTm96bGw4VE5hdFZjNmdC?=
 =?utf-8?B?K3ZIVCtZbUpockFOaC9XYW16Umt2VS85aGVBdGovVitIZmdPckZvMWpvdDJn?=
 =?utf-8?B?VlpDaGVGV1Jrb2dxS1huMFdONmRXcGxYYmE3dnBrK3FSNTVYTEM2OFNlNGZT?=
 =?utf-8?B?bE9rUjJaZDRxNU1vWDIyQkFmOFUzUXpiaGRqZnZQVXdNWjhVNnFxUk52Ym1Z?=
 =?utf-8?B?MjRNOWN6ZVJFS3VxNmxjaUZSQlRHUFlCZ1gyRHJDUWpZU1A2T3JzbTFCSnR3?=
 =?utf-8?B?SkhuVjZMNTZjUkh4alQ5eEJiRDRPeGpiNXZrem1yem14NUdwUWtZYTFtRG9G?=
 =?utf-8?B?R28xSDM5NE1PL29FUklFR3ptbXNyMmRsMkdHSGQ1Nnc0VjdIN2tLVjBSS2JB?=
 =?utf-8?B?dXpWUzJJWFRJNlZEZmsyRHRZem1zdFdXZlhvSVF0REZQTnFIbUc2QVdST0pV?=
 =?utf-8?B?MDBENndEQXloNTFFb2NqbHBNK2kzaFJIVHZVaFlHUW5qb2kvVWxQbEllYWkz?=
 =?utf-8?B?MGh1TXFOMEpNVUErbWhGTzFaVzlCMjhEUDNhVnRJM3dVbWd1eWhBM2s4MFdP?=
 =?utf-8?B?Qm45MFFpcFFzZk5nQTVDY2p0ZGV4YW9TWUQ0ZTQvMFB5Ym1GNHJnOUNYWFNi?=
 =?utf-8?B?eG5oc1VDMlF3aDBFSEFRYnptbk5VNUFFY0pMRW5abldVbnNPMTFyZXRFVEcy?=
 =?utf-8?B?Q2h1OGlualh1K0dpMzNmMzNCWk9leTVvQzM1T0ZuemtxVlVLUFMwZzl4RlNw?=
 =?utf-8?Q?KDZ/WvDtvLEb9JciibvmAm8X7GOJLo=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GV2PR08MB8368.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11421
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7ab5b0a6-91a6-4fb2-a797-08de334843ad
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|14060799003|35042699022|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0FJMkZ4WkZ4U0VHc3c5dlB1VTZNUnBqeHFsWThwM252N2tQVERreERFUVU2?=
 =?utf-8?B?Q2JyWjhkcFdMSFBqS2ppUmM2eThUaFdDaVZka3pYNWR4ZHlvYWdhNzAzVWYy?=
 =?utf-8?B?Qnl6QUQ2eU5oaVRDQnNYYXN0VlhnTGtpMXV0eDJjcUFabUFKalZrVGFuekxx?=
 =?utf-8?B?Q2FjZGV5RldueXVoSUs4R1c1MXJpRjVZVU5jVGVuTGZ6TUI0UXhKenp2SE1m?=
 =?utf-8?B?b3U1WFErUHoyWkJQTmpIbEZMT2o4TU1JMFFSS2liaVZFeXdoUjJEWmxlZVdM?=
 =?utf-8?B?TDJ4TWppOXJlc3cyR1gyQ0V5QWtobVF4WFAvaGQzTEdJOWNCbUNFclpnTWpI?=
 =?utf-8?B?VDAwU2FITGk4WmY0akZ1Rm9SemZ2NjFmUlQzNTVqbXEzUklINXlxQXdvQXQ4?=
 =?utf-8?B?M011N3Y0UnJtWERqVkRLMEZTR2ltOVBOYkQ5ZHUyRUVHSWF1dDFuVWd6NU9C?=
 =?utf-8?B?dXIwMlpzbjJqckZhalBNM1pxWHMxZXJKQjN2V0tuSUVFZHVqSUUyUWlNbmhr?=
 =?utf-8?B?SHpiWERVUmxMMkFCMllleXNUbzV0ZDNpUkxyTWdmN0hvbFhyWTFUMHVUeGRs?=
 =?utf-8?B?UnhHUTAxTDdSaWhJVWtZOXFuTDViQzMzV21CSXEzSWxEaDRvYSsxOVdZWkd6?=
 =?utf-8?B?UzBvaXhRR3hqWURRUmZYVkovN2trR1QvdkkySGdOM0pScjJJeVpsRWNORnlW?=
 =?utf-8?B?NGhhTVpmb1VQd0kvT3NzL21WdHhEaCtLVUpkY042aG54d2UreGJEak1vdDZY?=
 =?utf-8?B?a3JyR2FKZ3dacFhEQmdZUWsxZXhsekgyNWJTb0VvYkEvZklkaGV1dUFvRWhl?=
 =?utf-8?B?dDBhVmdmVTRnaytpaWNCUnRnbnJjNFBkbERqMitqQkxUOFRDOWJCNWIyeG5y?=
 =?utf-8?B?QjZMYkdxQ3IvK2VnSVFBSVBTdk5kYzFCNmt4dVNESWRacVoxRGFsZk56Rm5l?=
 =?utf-8?B?YlVXUUFwcVFicFd6d1RTUU5GajB2TlI1cXBUbU43NGo2S2Z0djFvZGlGempu?=
 =?utf-8?B?RTUvUDhVemJja216OTdLUlZaMk5raGJUenloR2hHYjFva1pGYTdxQm5CLzhB?=
 =?utf-8?B?U3daNVl3R0NqTEs0b1hJQlVUOE1kSnh3cEl1UVpQdGduOWpXM05xQ0V6Skg4?=
 =?utf-8?B?bjA3U0pNV3lPYS9sMGxkUy9Pdm9rOHc5WDBpL3hYMEQyNmRKL0k3aHJkUFZJ?=
 =?utf-8?B?dWFnMXMvcEtXbFo3clpEcnd1TEhaNDZkUjJkbGtHajNVRnliem9BSDk0b0Fm?=
 =?utf-8?B?NHRGOTIzNk1lbjRCWjNraWxFcit2d2x3U1oxWXRKblNyQU96b2VkenB0QWJL?=
 =?utf-8?B?V0YvVmRzV1R3L2JpREpqaVlpQ3ZueFpWSVBPYkJyN2U0T0dZYTZ3ZHBGMFE4?=
 =?utf-8?B?VXF2a0grVEU3dGJKUVZrdmR3N2JNTjlRZTRBdmdGb2QxdkhyWDBJZk5NS0Zw?=
 =?utf-8?B?NS9oVTcyL1FCZ3J2UU0vdXBRMHlwUkNKT1ZEa2pJZnk3NkdFT2N2ZlFGSTU5?=
 =?utf-8?B?cU9qYklCZTIyNXRkNmwra0NZZGgxbitScWg1VVRLZmFnVTB3bGxOWVQ3dXZG?=
 =?utf-8?B?QS9zcDdObDBDQmhKVGc0RjZvTDh4eUhQbUJIOFlHL0FkQzMyMS9mNTlZMStr?=
 =?utf-8?B?MGJYUlZ0SGY4V2JuNUFQNC9jRzZUTHhEQkx6NmNzNk1nNnlkOWlWSU9OQ3RI?=
 =?utf-8?B?K1hJWUdKSE1vdk0xQ09VeS8zeE1kN0pwUVN0dk5pUEFLdGU5UjliRjVSeUhQ?=
 =?utf-8?B?Zjh1NStXdHlINXNvUlpVcmMvc09LYTlvVFNrR1h6WU9ncHJrNjc1QUxIS3pY?=
 =?utf-8?B?eVN3REwzcDRvMVE1ajdtcit6Tksva0pwbEgyRjB2R05tVEZBWXBONGdHMHA0?=
 =?utf-8?B?WmxyUSt3WW5NeGhxRFE1RHNva0VRRngzdFk0TE92UlN3SkVEWUU2M0FNUFA2?=
 =?utf-8?B?RGRURXJDSmw1dDFUNUdFbERhRDBVRDdsdEljaGY5WXBsbjRHMUZTdmwwVzBS?=
 =?utf-8?B?c05OWU1vWVdVNGdKUGU2dXJaZnhKRC9TL2NLclJkK1NuZzhhSHBUN3pTa1NF?=
 =?utf-8?B?Q2V4YVdCV21IY3dRNDA4UWV6VVY1b2tnMkJmMk9ISGNQUWd1QUJBckcyaVJ2?=
 =?utf-8?Q?AhmShuaVJLt9/PwvH+WI/Isja?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(14060799003)(35042699022)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 15:18:42.6037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aebafd41-c2ce-487f-bca1-08de33486917
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7666
X-Mailman-Approved-At: Thu, 04 Dec 2025 21:01:44 +0000
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



On 02/12/2025 21:02, Linus Walleij wrote:
> Export and namespace those not prefixed with drm_* so
> it becomes possible to write custom commit tail functions
> in individual drivers using the helper infrastructure.
>
> Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 122 +++++++++++++++++++++++++++++-=
------
>  include/drm/drm_atomic_helper.h     |  22 +++++++
>  2 files changed, 121 insertions(+), 23 deletions(-)
>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
