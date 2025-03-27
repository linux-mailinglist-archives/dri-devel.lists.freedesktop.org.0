Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744AAA72BF2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEDD10E88F;
	Thu, 27 Mar 2025 08:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="UTbEanaA";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UTbEanaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013051.outbound.protection.outlook.com [52.101.67.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E3F10E88F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:59:15 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X+50rXiYbYYI9CXgfrD7xtY7iO/mEPp0zLXBLTl/ANNfHxuhbAPYTiY85Q2BjRejdN/ZlT0ynpsq8zyCVq/TPOLz1Qhd/5CD3U9SiMN4DQG6U+88dnB+T0EmuyAwiBvM+hEvnFsSxh+XSC7mATPeNNpVUAP7l8Zh8+ApX8LQNfM7Fo3D5Uy6edv3ea/gnbouV2uMyO3STf5c9woH8wFh/Nns59FEttsiGUPLjRvUhNyc3DbIMdZJS2UlUVanz71w0CrGt6Hpp+G9yrdkeS77HlBT/3ac3Irg0xCGcwWI6PxrOvYbAU33fcpXAMvvoDmEtpD/o8rF0rgpCaZkn7FmtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+joEiBWcZdqoa7PjbjpHs/1Z33X6ppbboOt7jJqG3M=;
 b=rSV3fPsg6qN7JylOkS1+TYC222nATKzg0JvVMR71bD5H6weZRqXgyTIDCz2hTD/4KigRoCfL4B2vvnUeZVRwylg+fJOMX7GyghoX0+7Y/uwBEEoopG/WV+FGFURadgTN6vpzGf+JN86QPKz+6BUwCbnZ2oAg2zEuB46Os3sd93eGnrCEdqgRmSVtmmb1SHVNcTA0Kh6Nm6cfBEKDk9UIbcRJIxvLH8Kx3cpp968C6ASDHfrhzz9Dop1ubDn4V5pZo3VWm99O5ue9RA2DjgCzs1HnQRqrtHWZV/F4OtPhcwLDUjXrvi1j8gvpdZsOh/kDXkKhMNetgNQH5d8G72vibA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+joEiBWcZdqoa7PjbjpHs/1Z33X6ppbboOt7jJqG3M=;
 b=UTbEanaA1BDUAlaBcVVsVK5GM4bRUd0LOO2JXMAKqEAOBtCzASLj/gP6y9wQEUCaNJLVk9afFcnp5I7yhtF9dIzZ/TTpiC5ynLZ/nO3i0ZKyuEzsbZXA8fpDGN7T6UiTsV5U9ec5LRG2Zht4tmxIh0jRdlyM4fQRXoa+iZMCVwY=
Received: from AS9PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:20b:495::20)
 by AS2PR08MB9500.eurprd08.prod.outlook.com (2603:10a6:20b:60c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:59:11 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:495:cafe::c6) by AS9PR05CA0184.outlook.office365.com
 (2603:10a6:20b:495::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Thu,
 27 Mar 2025 08:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 08:59:11 +0000
Received: ("Tessian outbound eb3c789b7dfa:v604");
 Thu, 27 Mar 2025 08:59:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a4e8bf8b5289c3a
X-TessianGatewayMetadata: X/8koUvNfL6FDTQo5p6wpjRRelgUG6xThIlNgPWdL7NlhBOBCZN7+NG6In2jeckGcPoP9XLmkK45akIDcmj3QShnyuxSFdr9Du4BmXuRBzNaC9KSbV9H4nOFNwMME99u9p34b79Cbrkm1JT2rjRVUN+mCKa8CKttqSqLwkpU8GU=
X-CR-MTA-TID: 64aa7808
Received: from L5a367fc766c9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 043813FD-3B65-4747-86B2-37459C618CB3.1; 
 Thu, 27 Mar 2025 08:58:59 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5a367fc766c9.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Mar 2025 08:58:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cj37wNwV4Ui0sZL8niGbkNFcwVDb1+YuI9FLYN/uUKCcygUw3TjY18LRag04zcfAkm+5s+UYXQ86ZQlAu3suxWSxOcx6CPvCoz/rk75f+ys/JWKi9d/DLUfMOW8dbKlPSmafPUjdHIs0eYgp9TWdKVaQRDlQ/YRmO/SMfCpthVi/8UFO+J4EvC6mSIsLNG/iyzLMehB4TdEQEID+7YyybEhZ+mte6pBtyxYJ+4YSBe5hPrGauSh2DAeaS2mNTXCyuQFYsdNYP79cLADmIOal2piZSj0JuUpeeUqNbv5wONoBbczwoea0EcjS9ZslBapgAM0ViTuBPcJpieFhxf30Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+joEiBWcZdqoa7PjbjpHs/1Z33X6ppbboOt7jJqG3M=;
 b=rtcpBdO2uHcqXudI47zR1sljC55GnLhbEJPlE/DnATThtk3atboxrjgvf4hLw7soCP9tRqVCHMdGuWUeKRj7/jxWBKbMpa8SnMLd+Y1h7oRwfQAovCoAtZzHD/mOqXTTH+VHd8MMUEB6n5pls5JW8Yp4tvB3z/uBB//CNf+aJvmUvEnu+ynaTfVeBjFzXph8zK5PR7x4h6UdzuS9Wzq335ndNbIR2hpv7Yfh+NhD4Ne6ZaA7GgFaMyoDpPxQvHC+ki0PidxiezKluW1WzvARk5aQHYcRhF0RqDTLCiU6NF3WnQUhmGAD/pVivZw5x48iCVLnLsRM2Xut92fm+nooQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+joEiBWcZdqoa7PjbjpHs/1Z33X6ppbboOt7jJqG3M=;
 b=UTbEanaA1BDUAlaBcVVsVK5GM4bRUd0LOO2JXMAKqEAOBtCzASLj/gP6y9wQEUCaNJLVk9afFcnp5I7yhtF9dIzZ/TTpiC5ynLZ/nO3i0ZKyuEzsbZXA8fpDGN7T6UiTsV5U9ec5LRG2Zht4tmxIh0jRdlyM4fQRXoa+iZMCVwY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by GV1PR08MB11025.eurprd08.prod.outlook.com (2603:10a6:150:1ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 08:58:55 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:58:55 +0000
Message-ID: <33a9bb1c-136f-40cc-adfb-9f94365158ed@arm.com>
Date: Thu, 27 Mar 2025 08:58:53 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 8/8] drm/panthor: Expose the panthor perf ioctls
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-9-lukas.zapolskas@arm.com>
 <ym5gk6uhwteiv3p4kvjjvpujval3rfjsv2lnzzgmq3cvnmfv5o@qbwtvgnqyyui>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <ym5gk6uhwteiv3p4kvjjvpujval3rfjsv2lnzzgmq3cvnmfv5o@qbwtvgnqyyui>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|GV1PR08MB11025:EE_|AM4PEPF00027A6B:EE_|AS2PR08MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: ae89ae0d-ddd1-42da-2fe3-08dd6d0da43f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WlcrdGU3L05iRkJPL1lMb29IdS9EelI2REZqWms0VTR6VldkR0F3YThhZVcx?=
 =?utf-8?B?THJYbFZ5bWdvYmdTbHNyMUtvK2VXUlpEeEF1QkZXUjFNemNOYkIzYXNlQ0lR?=
 =?utf-8?B?Z0FBRmZQbkkyTmtYV3ZPSEtpVXJHWE1JZktBUjRKcUtlWUVua05IZjZjKzA4?=
 =?utf-8?B?WEMwOVRRUzlVcWdiZGdlaHpHc2RDYWw1dFk5UGN5dGNMNjAvMDdnR2U4NkNP?=
 =?utf-8?B?Qlprb3dENWFIUmhlazhmKzh2UTdYMC9DK0NVdUxxSVZkc00zcllYZ09hWHhj?=
 =?utf-8?B?Z0xCNjVpZWNvODRSRlhtaGtjSWNRTDQ2MVNQdGtJOWJaWWovcGYrUHB3eUg3?=
 =?utf-8?B?Q2RZQWhobjFyQWJwRzZEZDIxS2p2SHRnUENOR1NFcThsUTVwQTV0WVpleVYw?=
 =?utf-8?B?K1FuRVloVnRrSEhBMWhCYnl0WjNWT1NlZldxS2Y0Z0JobjNWSlhVV0tqSDBu?=
 =?utf-8?B?V0xqWTFyZERiK1NLZnQweXZxVVI4bXVzaWVtcWs1NURSVDVWdjAvY3pqbTNi?=
 =?utf-8?B?LzVJMVYvRDMxS1Z2RGRwVUJHdUNmbnhlanVJMXZsMHIrclUwb0RGa2wrcFUy?=
 =?utf-8?B?NkU3ekovVDAvaytpaWtBMVZHNE9LeWVwTzJyQU9JK1FZYXowdW1LMmFSYnZk?=
 =?utf-8?B?ZTZFLzlPTmF3cVBIajFNNm5MNXpRc1ZXSHBYbnd4b1FlM0NQRFBrQVZjOHov?=
 =?utf-8?B?bkxZTWx0OVJhcVdEUUFUb0NRRUxNN2hsZlRQV0ZKVTZBV3BRbC9kQitmc0ZJ?=
 =?utf-8?B?NC84WGUrcEp0TEliY3pMUDJVNm55YUlMaDNreDFxbHIwMHphVkF3cURVRHhq?=
 =?utf-8?B?dkxKT1o2bVgveGh2OEtORHJiYnBTMkREd1gzZUZlVjRZRkwxWkNab0U3cnFj?=
 =?utf-8?B?c2xhNUJ2SzdtYU1GV05mWHRIeDFvZXA0RzE0bmh5TzZraStyK1VMdWVURUhE?=
 =?utf-8?B?WGRCWjlhbnpxUUkvK2N3VStCWVIwdTQzMGsvWUVabDBOUHN3M0laZzRKc2g2?=
 =?utf-8?B?YVR2RE5JaUV0dTRjQm80am5MMzEveDFCYml4S1d0RTVqblN0d3A4UFFpMml6?=
 =?utf-8?B?amNONEZvMW1XeEVjQktJOWlWcWRhWkc5V0pLaTA2ZEQzR0FHbVZqMkN6ZWdq?=
 =?utf-8?B?TnQwUjNKUXNmUmI1KzhjT3V4d2M1ZXVLRjZNQWxoSjRiazI5NEIzWTh3blhS?=
 =?utf-8?B?RHNWbFVsVXEyRkFrZHZDM3dnNnh6bEZEYys5aXRxdGhYRkR6dkE4Z1pQaW9N?=
 =?utf-8?B?bXBudUFrMXhETXdrd243SDFETkZJdTdsSVV5T3JaT3dNYW1GSDJRcUl6ME9Z?=
 =?utf-8?B?ZTdOY1p3TGZQV1lQT29hNkF0bjl6Q1RFUFl6bi9XMTRicC92alFhQnNyK0Y4?=
 =?utf-8?B?WEVQVGVSWHlnWHFLelJ6a29obkM3RDRkTncrdVVkLzArWEJIRHEydDl6L3RX?=
 =?utf-8?B?OVljUmZoSzN3eWxxVjN0LzVscTdNTExZNkt5RkJXb3dsSmVzeFZMdWZibExw?=
 =?utf-8?B?V3VDOUNTV0RQNjhLYmVmQ0RpU1M4R01ReGlCak02Z1lFRTcrWWZtekpjZU5n?=
 =?utf-8?B?YVBzOG9CUFBqMnY3YXZzcFVpRS9jRVdKOTA1RVJQUlA5cVdlTFBvNVgwbFdp?=
 =?utf-8?B?NUNEQWpGU1hSSk1nSWhVU3B0WGd0Mmtna212TEw5YWFGbVhwQ1FCeDJVOWRl?=
 =?utf-8?B?Q2VodjlabWk1a0NlUGR4WDVOWEM5M0dBT3FHd2VHcHlYOG5YeVlScDhQZStr?=
 =?utf-8?B?bWpzUTFDV0J1QUtBc292bk5MZWRMQmhBOCtORzJxMFpoTlllV01JTUk5VVZE?=
 =?utf-8?B?V0Z0dE5MS0ZKbFR2L3psaFU0ZU53ZHlSTFVWZFIzOXl3c1lOdHNWWk9SSHJp?=
 =?utf-8?B?NXgzMnFaWTduRUhlTk1lNk81OSt1T2xWWmhUTFg3VWdQdWxSZHp5OUR2UUhX?=
 =?utf-8?Q?MI7ulAero3c=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11025
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 08b7b1ba-7882-4e93-ecd3-08dd6d0d9a2f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|82310400026|376014|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekNndWZQTlhXU040bCttVkdNeGdjUytQL3BIMTBLZEJYaU4zWG9tMGlnOTk5?=
 =?utf-8?B?d1BNWGw4WU0zRjFQaDU4ZVI0Z1h2RDZhYkVpRE5WT1l0SlI5SXc3UlhxKzFF?=
 =?utf-8?B?aHp1WU9ielhpalNwVkRBd054Y3lGV3djSW5NNFVQYWtWaXFpREpGZFdzaFRO?=
 =?utf-8?B?RVJJTTZqdStjTFB2R3E4a2lnVUVTV2hXTTNWNldSUDNrS2x5ZU5pUDZBR1FH?=
 =?utf-8?B?dHQzQmVXeGFOR25TTWZMK1FNZERoTkNvWE5kZnU4RmxqU2ZpazlYR0VVNnQr?=
 =?utf-8?B?ZWNKeVZKclp6Q2NlMm9LMTR5Q21zMGFnUFh2WFN0RDZiTHhzTXFqbnRnbm9Q?=
 =?utf-8?B?NVVKOHBjWElLcU9iQXlsOGZ6am54akJqWEVoY3N3QzlFRGZhNGVBL2JUNjJi?=
 =?utf-8?B?emp3N1UvSzVRY3FLTUgxVmZ0Vjc2VFFIYzBmSTNJTEp0aktmMmNTTDdxODdw?=
 =?utf-8?B?QnJDZHJhOHJWL2RHOW13VmdqSFgyZ2dQNnUxYXlORnpJdDRHK1ZhL3RqbmRZ?=
 =?utf-8?B?UEpEM0EyNUhwMVpnam5EcVpPVUdwMlNBWUwrSXdoQ2ZXSFhMb0UwR1k3dDFw?=
 =?utf-8?B?WnhLZ0pNR1RmOXNuMXo3anhBMXhQM2ladVRnVmk1WWd0WDNybm1kcDIzTzBL?=
 =?utf-8?B?QUJST2Z6TGVWbjRpMG5QMTJpUFZtMklIa092NVhZM1pvcmk2SFlyVTFzSEhQ?=
 =?utf-8?B?azJGbkphcVNXc1BKa0VHWVVOSlZtZkQwV3JGSlZpdGluaVJZRkhCZS9XcFdk?=
 =?utf-8?B?cXBzYjkvQ1hUYlVKT1hVQ3RoRFZObUoxS2dZR09SS2RrUTZEVDUyY2pNRXI2?=
 =?utf-8?B?QVFZN2wzWkhYWS9EeHFOTWluS1YzM2dkdWFZUjZMU0FqYk9MdzNWWUN4aWVD?=
 =?utf-8?B?SzMrMXFWNzQ5cmZrQ095dGZNSDYwOWZZTS94VVZrNXFKSnpnWXVxaFdVQnp3?=
 =?utf-8?B?M2JMQSsrTzhpMGFzb0hia2hjTC8yWlpLZWZVQ00rKzJtdHJFeUFzL00vcWtV?=
 =?utf-8?B?a0FLQUNrYjFlVk5WYllDZzJDME9NMElDSXJCa2xCOFlCaXhkdjhpMHhCcG8z?=
 =?utf-8?B?am9PVVU0UUsyVGlTajNrZ0h4RjgvQ2JMVkk0dVNNamhBamJQWC9YT0kzVHFv?=
 =?utf-8?B?Y3dSMFNWTjVuV2JLT0U1Q1dzOVJTdU1UclA0VGxTU2ZhQVRWck52OGxtWDRF?=
 =?utf-8?B?SzJGWFRobHBQU1o5aUszVUg0Z0o5YVBXTXlnanAzYUNFclBvWTNMZUZOZ3k3?=
 =?utf-8?B?N0VWYkJtV3N4Uldrb09xNFduMWlUNzBndk1velRNOWVFZDZUeGxRMWcwVG8z?=
 =?utf-8?B?OTdtdFR3UUZsYTdGSmRKUnd0YTJvVUVtaGtUWFl6U0Q4dDdic0s4YlhFYzND?=
 =?utf-8?B?ZjYrb1ZiVjdaa3FJL0c4RlRxVlpEMlJyVTZjb0szT2NzbVA4SXhJZkJRV2hj?=
 =?utf-8?B?cHJXQW9mUXdONktRZUpoV21XNW5NdGQyK21xTXJsdEZCVXdrQzdTais0RjNW?=
 =?utf-8?B?Y21rd0JPV1Rna1RLbWk2SW1Cdkk1KzM5eG5UaDFNMGQxejI0dWRIeVByTjVr?=
 =?utf-8?B?THIxMHB4cDQrRExPbFVQLzRpNkFoblVSUTFBWWpFU3ROTFFYT0wrejhPSzhM?=
 =?utf-8?B?aVZLb1BlbHY2Tm8reEYzY3R4cEJONGM2aFlFdFlWa2hqOWI4QnM0T0E4L0VY?=
 =?utf-8?B?eXhQNDZwTXZkUzZHRHhac3NrVS8ra25LbXB5WUppWk0zWVlkZFA0bkNWbk9M?=
 =?utf-8?B?Yk5WOUo2V3huOFVreHFiWjRoUnFZWGpvU2J2cnBibkhqVHg3LzNUT2tNWkp2?=
 =?utf-8?B?ZURoUnArS2tRTUh1anFneFVxRTZpc1lLb3hFWlFLUzVQUEdCVFNZWEZYdkov?=
 =?utf-8?B?cWVLQ0J0MnZKYVRBd0F4dmhXL1lmcDYyRkRsbWlhdm9JT2t2a3pJTzlScTE0?=
 =?utf-8?B?dEFMVm43MFpPZU1JR0ZRbWVnQ1h2blAyRjREeVRxNG9TQytYUkVwTkJMMmRH?=
 =?utf-8?Q?fV+i/wYihaCZ941fM+wG9aPOyk+Dd0=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(82310400026)(376014)(14060799003)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:59:11.3616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae89ae0d-ddd1-42da-2fe3-08dd6d0da43f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9500
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



On 27/01/2025 20:14, Adrián Larumbe wrote:
> I don't know what the usual practice is when adding a new DRM driver ioctl(), but wouldn't it make
> more sense to add the PERF_CONTROL one to the panthor_drm_driver_ioctls array in this patch instead?
>

That does make more sense, I'll shuffle the patches around.


> Other than that:
> 
> Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> On 11.12.2024 16:50, Lukas Zapolskas wrote:
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>   drivers/gpu/drm/panthor/panthor_drv.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 2848ab442d10..ef081a383fa9 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1654,6 +1654,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>>    * - 1.1 - adds DEV_QUERY_TIMESTAMP_INFO query
>>    * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>>    *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>> + * - 1.3 - adds DEV_QUERY_PERF_INFO query
>> + *         adds PERF_CONTROL ioctl
>>    */
>>   static const struct drm_driver panthor_drm_driver = {
>>   	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
>> @@ -1667,7 +1669,7 @@ static const struct drm_driver panthor_drm_driver = {
>>   	.name = "panthor",
>>   	.desc = "Panthor DRM driver",
>>   	.major = 1,
>> -	.minor = 2,
>> +	.minor = 3,
>>   
>>   	.gem_create_object = panthor_gem_create_object,
>>   	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
>> -- 
>> 2.25.1
> 
> 
> Adrian Larumbe

Thank you very much for taking a look! I'm working on addressing
the comments you left and hoping to get a v3 up soon.

Kind regards,
Lukas Zapolskas

