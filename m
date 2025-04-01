Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1442A77F73
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC0A10E602;
	Tue,  1 Apr 2025 15:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Brc2ZYea";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Brc2ZYea";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011028.outbound.protection.outlook.com
 [40.107.130.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4118910E608
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:49:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QJt6iez8VxLCsoRMyTwrAqfT4ZggtBoMWCORHIODnAiQhSor93nlHr+i2B7rZT8tU+UQHK2NPp5lx09SWHXsg4qjppP0wu42Dvc+rX6i+FUuol8dLR8hpiqOl5hy1bHw5EEZXOVZEMWPi3kTNK9XXc2n013LaOTC52LrC3cnmDNq2hwEasbq7hn91uMU6rfyELRzj8zFim132yMdTvc97DvnZonkIK5v1nKrFMOMNyCa6dM22R+9zOp7+DtQpcz9ZGyW8Wxh53iUlw6Dh/Iz6eAFGqVEJYIVqNVy51qNR7UR0bEhektZPfurUhixd/E2Rp/HvIUevQTH9RWLt13y8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=Wk8IUMfYXSF6xzlO4cqR//mbthzvuWmI/zifl9xddDg3D/mcBXPg77TVlVCNllTJaBIm3x+vFV71P7HA5AZ0q/etWvpqxiMMeD6r+WX+SFBOwRuOs2Mf9AEr+RrlcBiG1kPui/rOMzgd12g32o1/VtVlFPA63RJzlMVqwckJ3CtEAeQp7vPUz+18sohp03uw1rCioIoYDHj0oe5/cjf2biwUD0q8rwWINvCqrbm8PV/wO7XJF1gdmIj7OfWUvXU3iy9GxgtchBDKmDVZZJGYcMzTVoTkENmOXekkECqHzVj0i/96l7tBlnVI+enxgSpmqGNFKLknhAUtPHZLdLeqVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=Brc2ZYeawqTOE4b0ZRYihd13CtrWN9bW953r+DXsJJ1nCFK/dcN/rAfPwV9/0dqcDqb4sB7XdhHXD9694xtsucPybid+YeQ2VaGDurMSw/yIoKocZzAjfOHZowKPULk2mFKs9UdpRLMNVCKnKzNGJQh/FnXc8ISFUWE9O3zI3gw=
Received: from DB8PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:10:120::35)
 by PAVPR08MB9063.eurprd08.prod.outlook.com (2603:10a6:102:32c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:49:03 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::39) by DB8PR06CA0061.outlook.office365.com
 (2603:10a6:10:120::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Tue,
 1 Apr 2025 15:49:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:49:03 +0000
Received: ("Tessian outbound eb3c789b7dfa:v604");
 Tue, 01 Apr 2025 15:49:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 054820aff8357f30
X-TessianGatewayMetadata: V9GQzal8YZ2Ke0O9w0rhnllqJQWy0U0aVPUNZ/GoNGOHAeXOg2xgPreGwImCkDXf2Bgx65yR9Tyo0bB2GoesCYCzE7bSgsRb/bynKuu+DdaO/TJnUFUv9avSuWu+76DvvbEjMY06N2qYsHMfJMxyIhf/qDJ73fGFwFaPZKvwsm+8UxEEsxMpQOHMutL+Iuz/sq/oDgZdHyt6Dol/n0GL5w==
X-CR-MTA-TID: 64aa7808
Received: from L09bc3a1ed403.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF6A9144-F857-42B2-841E-E4C600CA087C.1; 
 Tue, 01 Apr 2025 15:48:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L09bc3a1ed403.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 15:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyAB7QIyXG61lgi9Xaz0bX++huN4J08+PIyBPl3ZIm6WIjAxzz9j0xtnIhotRGaZoOtYRfBAqzng2o2PJueKD3fhid8AK6MK+wKrNBmLfoBEJulgJyLNqoC5tTtKLWiYUvp5VATUss0W7aKQgqikHdW0utogjqf4xoMIITbxnOtVK+KSbOvggVfyyo+VPkNRdlOMYzOHlEsBVem3sPmSVpqFNX18TYGnkh1aMV7ld6EW4ARSHReFGgkHxaDxGCdKHy5o8d2HApIuJt+rzR5v770mBaLg2oWf7+Nn1lgkULt2Cv+LbLCmM7nQ+tMw/y5u+3NyLnLRKphUg51g30IhWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=ftUvpiqY9W5jR4nV5qVcwagxv0jCXX3EliNqmORytGAFfbNbDhgj5LhDEevkME7gERxc9S/mWHyVZFF9V0HA4BU1xBmpF6UEf1+3YjW+W/NFOirrpCeUgoJR+f2Krfd658HmXXNqg2P1K4+z0d3G3U2zBT5UT0gqK3ZaFtaDVQ8Pgw/7cmYRPXEGQ3nRAlR9/AhFQS2NNazfCk1eGw0IA8Kbco/gsbJ/MBYIxA2KypmChmD0bBi/3N6TMEqA3uVPsKcqs34obZelEvtluhiw4mEIfRWMpUpYi9pQRtwEwgV/ljUeNGd7RfJHlpktjYjFPUAVntjix24aHssOY0LPGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZotHG/NiHZdV7jEQZVPj2JqaAhiLixdocbppNgllw8=;
 b=Brc2ZYeawqTOE4b0ZRYihd13CtrWN9bW953r+DXsJJ1nCFK/dcN/rAfPwV9/0dqcDqb4sB7XdhHXD9694xtsucPybid+YeQ2VaGDurMSw/yIoKocZzAjfOHZowKPULk2mFKs9UdpRLMNVCKnKzNGJQh/FnXc8ISFUWE9O3zI3gw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:49 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:49 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v3 7/7] drm/panthor: Expose the panthor perf ioctls
Date: Tue,  1 Apr 2025 16:48:22 +0100
Message-Id: <1db5077232173ec63bb16e953422c55efcd41e69.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1743517880.git.lukas.zapolskas@arm.com>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0584.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::15) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|DB5PEPF00014B95:EE_|PAVPR08MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2bcda7-6c45-404d-5b89-08dd7134ba7c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dVZ5VlRWS2F2bVQ0RW5PMEprKzFOY0g0eCt5eGFQdENhMW1MQlArcnJGclI4?=
 =?utf-8?B?a3BqNGFrNWZpeDVqdWFhV2lnbUlnbmZ0clJOT0JxVGhRd3JmTWRjMUpsK1h4?=
 =?utf-8?B?aURqTDYrZDk3NGtzWitVVlJXeU1vT0JZdndsZWp0S3F4UnNtekR3Y0JDc0xY?=
 =?utf-8?B?akxCR3VRWmgrVk04UG4yb2xOenp0U0dJR1gvOURZTmI2RmYrdVRhVElqejhv?=
 =?utf-8?B?N2p3aXRxenJjN2xUdVo1Yi9oWGRaRGhuZWFTYlJiaGtIK1AvNXhrenZkRlRs?=
 =?utf-8?B?cUR6ektCWHlVTjNHYWYwQjlESERZS2t6bVdxaXh4TS8xWlFFYldCdCtJaEky?=
 =?utf-8?B?UTJHdmpKQnB2OFFUR0d3bnBBTlA0bmVaNW1tTzBXMGtVNEhJdFY1OVphdm9x?=
 =?utf-8?B?R3NzcWtDeFVlYUx1N00zM05ESUlmUTR1YS9jZ25IMGw5QWNla2xGVmxKQ3ZX?=
 =?utf-8?B?WFhxdnBQSFF1WkFMK2h3aEJrbmw2NEg0N2V3cDN1dmNLUm5CNGYrV1A1bnpF?=
 =?utf-8?B?a2kzbDFuSXFEK0FKLzNFS0o5ZkJVYWhheW1xbDkxbGVFVHFVeHBHaU5GU0F4?=
 =?utf-8?B?OGlxWldaMkNjbE1xc2szTVByajdWbEJlNVBJM0dUNmJYZ1lhVC9mblN2bytF?=
 =?utf-8?B?bG56SDJmRUdLSXRWVVozYnJRb0IzaVlld3pNa3RrOHRSdXJTZFNQU2JhalZN?=
 =?utf-8?B?bU1xL0NVWVZiNFJ4cGtVR0RLeHJRYTk5NUhsZ2hpbFR0MVZKTWVyWUg0QTNh?=
 =?utf-8?B?c3kzeElocTU3YzRKbHhxK0tqSUNrRFBnY3pUa2RBdDIxUSs0QW5Pd1ZSV24w?=
 =?utf-8?B?QXRadWZnNlhXYVQ0VUlmVU9OMmVsSldCOG5RWkZIcmp2YktoUHF5d1grOWVt?=
 =?utf-8?B?MnozVG5KVDlVcXpPRkZVU3BKTnhpS25vSEg2NGplNW13REx1cnB0cnJIZXpM?=
 =?utf-8?B?aGRPRHBwSWl2NUhBU1VmYVZadVRpS3dPK2NScG9pblkwcEwzaXFLK3hDcWt3?=
 =?utf-8?B?Umg3RDIrWWcrZ1dLRmdnRVlYTkVUa08rNEEzWmZXQ3ZHNm8rZGxMNDdkc0Y2?=
 =?utf-8?B?R21IS2R6eUw1ZFJ2bTdyR3RnTUV3alMvL1JEbzN2S3BtK256UktyS0txeHFF?=
 =?utf-8?B?VEVqZFcydDBuamZYSkN2YmhqelllaE03NTZIZjIxS3FMZlliRnhqR0pjeGhM?=
 =?utf-8?B?a3dTbU1FSktIRUkyVW9NT3hjRGpiaVdDV1BoZVBDVC9uZzhiQjZDZHNoeFBO?=
 =?utf-8?B?MWoyMm5PK3Vsdy9CalpWSENFWmRMK0FkVlptMWRyUWZXTjlBbEhzSXB1RS9j?=
 =?utf-8?B?R0IxbktrMC9oV25MVHNsVFVNK3BVRzIrSFMwdnVRcllRUTdzdEtqeTBzaDBa?=
 =?utf-8?B?cDF4WVpvcURBSy9xT3h6SmcrR05uVXgxZ0tUZllMcm1lUEN6ZmVpL1BRRkJI?=
 =?utf-8?B?UENVNWRZbTIrbUxCTS9pL0FxaHl1ajhjV0ROZFB1Ujg0OVRxNEFZbjhtNEZk?=
 =?utf-8?B?Y25rcmNtSG5xVTJsR252aUNFbDAzell1amExeCtrdWhWZHZ3Y2ZPckNtdVhv?=
 =?utf-8?B?WVI5bVA0ZmFtMUJEK2NqTmVQOTNyeHJ4a2c0ckZzM3RPT0ZoVkYwS0c4a0hL?=
 =?utf-8?B?cWpQUVJ0V3VmZmcvODd6ZDlxV01VZ21JRWRkZHZYd1QxVEJpNnVFUExMejhv?=
 =?utf-8?B?K2c3cDJRV0dJM0hja3FsRUlkOEFTaVczVFlkdnhBejgrZ0cybXNjTnpHdCta?=
 =?utf-8?B?b0hHVUdwbU4zZ2dScjlXTS9oNS9lSytpTSszR21Qc0w5bmJ4M2pCbTB1L3Nz?=
 =?utf-8?B?NlVNV2F6T1MrZHB4cFpwdUd1RU9Pa2tIaG9NS002L1RzMnh5MTg2ODVWVkdC?=
 =?utf-8?B?ck1Edk9pclk1Qkd5dWp5am5WMWZDT0tNeDBsQTE1VFowWk1lZXpzUXQ4UFR3?=
 =?utf-8?Q?UeHQ81MNJEg=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 73bd0a7d-bf87-41c5-2a3e-08dd7134b21d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|36860700013|1800799024|82310400026|14060799003|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEdYdXIzNmcrZHVWY1cyNDBXcmY4UmU0R1VtMFpFdzJlVkkvL1drTzFCNzdM?=
 =?utf-8?B?enVweGlmTDJjUnNyMElKM0p2anQxbDliVFlpREMwM2J0dzBqc0hlWFBxLzRu?=
 =?utf-8?B?cXpvVzk4QmZvOVF6bWp3ZFZ3K3BNWXpCNUIvVnhLb1k5eHVUb3lJS0hRMWNY?=
 =?utf-8?B?elNYclMxTmo1UmphRm9xYjhHdUFTWlI4b1hHQnBtR3ZWdUpOV2dCWnU2NlhI?=
 =?utf-8?B?QjBLN3VlRUZQQlFaSHRHeU44OVd0bDhoRURVemU2amZEclhMemFzUE1jd1h1?=
 =?utf-8?B?Q2Q1Vy8xMVErcnhvS0FtdEpRTWxhMWQ3Q3RORllzSTlKZDVHQzlHMEI5dXZI?=
 =?utf-8?B?eGR4VEh5ZjBqSGxqNHozcWIrUkFmMmVyaXBvOXRGVVlvOFVXaHB1aFBqYzVH?=
 =?utf-8?B?VjNlZlhYWk5MZ2hhM0wvZDFuVWgrMEtWMFFwd3U4Yis5TE5uRU5PMThLajV2?=
 =?utf-8?B?dXRKeUZGVnhkbVNrd0RLa0FmVGcramp3MWdpbXYxcExjZGhIKzJpcTBnU2t2?=
 =?utf-8?B?cVNsc29XZWYrMUwzSkJ4dUh4U1l5emNmb0pYS0RXaktKeDI4QVFQSzE0MVhY?=
 =?utf-8?B?YStob25BT2crVnVCMVNDa3VicDQ5Q3R6RmFBb3U5NTJPR3k0dVB1QkdVcDZ2?=
 =?utf-8?B?engyQVV6dkwxcU1Yb2hqUXN0ZWN6UGlwUFg3M3NsSVl1K1kxUnhRaGFvTHNa?=
 =?utf-8?B?dVJFSlpSMFhSdGRTb3hFZTlyV1NBV3U3SmJNYWc2a05seVJTaUJpRm5zUzha?=
 =?utf-8?B?WEduWkc4U0N6b2Vzcy8xbEROYXBLVThQcTRvOVprRWl3NTNBTVIwMDM1T0po?=
 =?utf-8?B?bXZ2MkRBVDBURlhyT0tDN0xWRDBSK1B6c2wyME9nMU55clk1Tyt4b1NIUnE3?=
 =?utf-8?B?SUIxd2lmVEs4ZzhSYURkK21kN2s5U2tZV1RGSXpIdncvd0hvSVpyVHdPd2px?=
 =?utf-8?B?MS81UUNjUGNheUV3MVdEd2ttWFNQek80VGl0Vy9sUDZxV0lTM1lDSTM0WW92?=
 =?utf-8?B?TFJnSTgyaWRITmlHbXM4eGZWeVFrZ2xVN0FseWM2VjdodEU5Rld0b0drV2FR?=
 =?utf-8?B?L25oTGFadUdBNWNJN091bGNESFNyaVhQSUQ0OVVOQXAxV1RCNUJGcll1bHZr?=
 =?utf-8?B?S0tWMDBEZktCZGg0TGh5a1ZKQkEyQjhqMzBlVDRvRlJEMmxkb2piRzVmM3hY?=
 =?utf-8?B?eG1DaGh5Q08zS24wM3BYcEN2Z2VKd3g5RlNTSng3dC95RzVvdzBzSnk2NHdG?=
 =?utf-8?B?aTFIS1FSNzkyTzFVWXI5MFU5TVpFTVJKTFV4dkZnOFZ5Wk5acG5sZUQ1ZE1x?=
 =?utf-8?B?MHk0RkJWNFpiQWhvTnlOMng0dE1WZGVTdzBzWFFSWmRjaXFzZWpNME45ck9q?=
 =?utf-8?B?WkROcG1XbmZScUdkOVhObForVzZrS1J6Z1dITU96Und5clExaTRJMG5MWlcz?=
 =?utf-8?B?MHRyRjMvLzhHZnRoczNoc3BiclNLRS9yZjRZc0pERHZWdkNHbmsvdnMyWVBx?=
 =?utf-8?B?WU56b20xMkZVKzhSVHFkVy9tTmtWemkycEl5ZERZVVdzUis4Ukw1K0V0dVBh?=
 =?utf-8?B?TkNSR0h3L21UQ3U4anR0MzY4Nktjcm9kYjVqQURrd0dkNGgyV0ViWVlzL3Rz?=
 =?utf-8?B?QXliZ2hON0srK3c2R3pmZUlBSWVsaExER2xiNm1vMnBPemEvcDhsL2dtcWpC?=
 =?utf-8?B?NzNCTkl3QSs1a05CazA0UHlyUFd0dzBLYXZ0UUt4ajVJT1F3NTVjV0Z6WEcy?=
 =?utf-8?B?TU5rbkxIWk1zKzBtMWJ1aFR1SnlnNGU1ODNSN29qUWo5Zm0xa1hUS3IyT1Ar?=
 =?utf-8?B?d0dBemN4dHh0Nk1sSjFvSHg3UDkyUTVjYmRNd2pEVnd3QTNwRERwUnd1TFJH?=
 =?utf-8?B?WFMyQXRKUjhncmZwM3JOZVdjaWZWeVFHY3hmZGlVNTRJQWVXQmx5SGNyWS9q?=
 =?utf-8?B?WmxCbUVkYnhoSFRTNjVkSFVmTVlNenZvZFFiamZQbUl3c1I1c2pDMzBGaGdM?=
 =?utf-8?B?OWF2Q3JUVGUrWmpwTmZtVk1tY2xkSGZSTld3U0FCdDMxbWcvU2xydnBVc2FZ?=
 =?utf-8?Q?gJs7Le?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(35042699022)(36860700013)(1800799024)(82310400026)(14060799003)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:49:03.7272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2bcda7-6c45-404d-5b89-08dd7134ba7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9063
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

This patch implements the PANTHOR_PERF_CONTROL ioctl series, and
a PANTHOR_GET_UOBJ wrapper to deal with the backwards and forwards
compatibility of the uAPI.

The minor version is bumped to indicate that the feature is now
supported.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 141 +++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 4c1381320859..850a894fe91b 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -31,6 +31,7 @@
 #include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -73,6 +74,39 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
 	return 0;
 }
 
+/**
+ * panthor_get_uobj() - Copy kernel object to user object.
+ * @usr_ptr: Users pointer.
+ * @usr_size: Size of the user object.
+ * @min_size: Minimum size for this object.
+ *
+ * Helper automating kernel -> user object copies.
+ *
+ * Don't use this function directly, use PANTHOR_UOBJ_GET() instead.
+ *
+ * Return: valid pointer on success, an encoded error code otherwise.
+ */
+static void*
+panthor_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size)
+{
+	int ret;
+	void *out_alloc __free(kvfree) = NULL;
+
+	/* User size shouldn't be smaller than the minimal object size. */
+	if (usr_size < min_size)
+		return ERR_PTR(-EINVAL);
+
+	out_alloc = kvmalloc(min_size, GFP_KERNEL);
+	if (!out_alloc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = copy_struct_from_user(out_alloc, min_size, u64_to_user_ptr(usr_ptr), usr_size);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return_ptr(out_alloc);
+}
+
 /**
  * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
  * @in: The object array to copy.
@@ -176,7 +210,12 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
+
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -191,6 +230,24 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
 			 sizeof(_src_obj), &(_src_obj))
 
+/**
+ * PANTHOR_UOBJ_GET() - Copies a user object from _usr_ptr to a kernel accessible _dest_ptr.
+ * @_dest_ptr: Local variable
+ * @_usr_size: Size of the user object.
+ * @_usr_ptr: The pointer of the object in userspace.
+ *
+ * Return: Error code. See panthor_get_uobj().
+ */
+#define PANTHOR_UOBJ_GET(_dest_ptr, _usr_size, _usr_ptr) \
+	({ \
+		typeof(_dest_ptr) _tmp; \
+		_tmp = panthor_get_uobj(_usr_ptr, _usr_size, \
+				PANTHOR_UOBJ_MIN_SIZE(_tmp[0])); \
+		if (!IS_ERR(_tmp)) \
+			_dest_ptr = _tmp; \
+		PTR_ERR_OR_ZERO(_tmp); \
+	})
+
 /**
  * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
  * object array.
@@ -1339,6 +1396,83 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+#define perf_cmd(command) \
+	({ \
+		struct drm_panthor_perf_cmd_##command *command##_args __free(kvfree) = NULL; \
+		int _ret = PANTHOR_UOBJ_GET(command##_args, args->size, args->pointer); \
+		if (_ret) \
+			return _ret; \
+		return panthor_perf_session_##command(pfile, ptdev->perf, args->handle, \
+				command##_args->user_data); \
+	})
+
+static int panthor_ioctl_perf_control(struct drm_device *ddev, void *data,
+				      struct drm_file *file)
+{
+	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_panthor_perf_control *args = data;
+	int ret;
+
+	if (!args->pointer) {
+		switch (args->cmd) {
+		case DRM_PANTHOR_PERF_COMMAND_SETUP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_setup);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+			args->size = 0;
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_START:
+			args->size = sizeof(struct drm_panthor_perf_cmd_start);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_STOP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_stop);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+			args->size = sizeof(struct drm_panthor_perf_cmd_sample);
+			return 0;
+
+		default:
+			return -EINVAL;
+		}
+	}
+
+	switch (args->cmd) {
+	case DRM_PANTHOR_PERF_COMMAND_SETUP:
+	{
+		struct drm_panthor_perf_cmd_setup *setup_args __free(kvfree) = NULL;
+
+		ret = PANTHOR_UOBJ_GET(setup_args, args->size, args->pointer);
+		if (ret)
+			return -EINVAL;
+
+		return panthor_perf_session_setup(ptdev, ptdev->perf, setup_args, pfile);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+	{
+		return panthor_perf_session_teardown(pfile, ptdev->perf, args->handle);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_START:
+	{
+		perf_cmd(start);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_STOP:
+	{
+		perf_cmd(stop);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+	{
+		perf_cmd(sample);
+	}
+	default:
+		return -EINVAL;
+	}
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1409,6 +1543,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1518,6 +1653,8 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
+ * - 1.4 - adds DEV_QUERY_PERF_INFO query
+ *       - adds PERF_CONTROL ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1531,7 +1668,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 3,
+	.minor = 4,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-- 
2.33.0.dirty

