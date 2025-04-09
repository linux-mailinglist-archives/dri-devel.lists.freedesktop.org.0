Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A7A82593
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3778710E87B;
	Wed,  9 Apr 2025 13:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="DAHwR91d";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DAHwR91d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011066.outbound.protection.outlook.com [52.101.70.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA70010E87B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 13:07:35 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ulqhFHbXVs7DmGFX1TNgUrlVjiijQQwArjHZtmWvu86n1FSjqJUyZVnrYgQavpAUlAHW3pJk2cGP86wwO+pzg95rASq0ufH4wLPP3v8+I9QXc3jOUw2BezahUa9tXRGYZTnK/UcF9eFJ7NMkpKly5pk9NPz4jJuvykne/dlY9tVgNVHxTPe99t5CuCtPD1/3/03vHG0DDXGJH0YgYwsh96p6DMWlRlztDlDW0Yi+BHKyxngnCv+5BdNso1pis06WyCmwBDdCZ2s5D/fX21LM/oiIU0A6vlxL0dcJAly+dlpNkaoZlqpixAq9ui3CrBrvyN9r8EQH6fqGXr41zhopxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks7oEgdQTOwY36AHvyUSLHAAT7DZurHqyJ7CciasPX8=;
 b=VTMWj9kiIIaDsB66HDUugjdCWR9cX8+/MX2FxFS12GeVCSMzwSaSYo5n0tFHpg9ZRS5Mqqm5hZb8n3DV3buIlcyIYQYBM8d63jkz5n8m2Pl83+Yqg6Uq5tUNVaYWWH5F9fSSLhTmBGmNgURJ8DcPk1glzM4mZl2E1zUTD6v2lKfoOESm4PLPp3YgrAKxFYRm3GYDTGKfNRLyhzDFyHGopVsW3aBAxh0tLwJhbu8p/xskqlgWa1dCd806UgOdVTkxRtgZ1W/NxH9v8t5pMlnyifqliMcTu6L3nkMb6DNpt1X5Kk52ONZk9e1/wp/Ma6OAEDg0fTI2P2J6z20hfTa2WQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks7oEgdQTOwY36AHvyUSLHAAT7DZurHqyJ7CciasPX8=;
 b=DAHwR91dQp09qOS+MY4C9e5fSF8wPdSo0gh71/lmpOezwezf6ugydsLOvWXoBrXZJkQMdYSv+z6RBawS34cgaaIzcRjbzqLYhP3F+87yg5O8psQPV2Ejp5abFubuilLPVy6YVdfwNN7S6cAKuFYYah16twBprZ2C5ehg4OP7iuE=
Received: from DU7P189CA0014.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::21)
 by PAWPR08MB10134.eurprd08.prod.outlook.com (2603:10a6:102:35d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 13:07:32 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::ad) by DU7P189CA0014.outlook.office365.com
 (2603:10a6:10:552::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 13:07:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22 via
 Frontend Transport; Wed, 9 Apr 2025 13:07:32 +0000
Received: ("Tessian outbound ef9f95d5bce0:v605");
 Wed, 09 Apr 2025 13:07:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 651ebdd7a159c37a
X-TessianGatewayMetadata: /qATlKxW4R3hwfW/mAPGyyd/xRaWuxqgUuAgd1YSkhwpotShWcYclUdl0azLtDQSOhs1e8uA9+ITVNr1u9u+GH2upEy4LkFt6tUPndOw8JK2H/YTSl09TePkJ8SlRZWlne+Kw0ZiGXwGcQK82xDRiwZjkUa0ivGOwv+gJI9LeCM=
X-CR-MTA-TID: 64aa7808
Received: from L92e7aa4ab00c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 69E1B1BE-108B-43D1-BD6E-3B00D00BC685.1; 
 Wed, 09 Apr 2025 13:07:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L92e7aa4ab00c.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 09 Apr 2025 13:07:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTOY6G/3b21+P0ffkXhzcRFfV2In7MfFuBLYlIuDPsmAKKZLTHvoZlfV9Vgb6htZ2vVbG/s1ne1ZB7NXKhlgChVb9xI5SN6yOWdqJeq5QRQcCL94cmjgkyONjvRWkmyWm+pPw8AARx5qxFfCIqnfpWElMRxDh9OUlgB+0uT4YXv3wO0AparhDAFZc7ZgaAFRakJakHQsXhyGGCYCnZTSZXuXF7JdIv+3MKf21zxxCMs2r7naUJ5C9+GE77E5ZhaFYmWKSWNA8VdAbQRd3CcWcBJSurqd9a1t5Rq7cbSvRl1bIDABFR2jqnJbs34MsmDD9YZ7BCs23gepJIT9ntvZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks7oEgdQTOwY36AHvyUSLHAAT7DZurHqyJ7CciasPX8=;
 b=f00KKSWXjUanSiE34o18j5U1YJPaEpZ46NC01s6iMJeHWor3DQw+ydHT17dBybq+fnVST/Pweu36tuElBG5CBAK1JyprtSnZiJlXrZ93FW0fkHYQCLjTb1irZ++lZF9DM+8ELma7Kiu5sXT9zTF4hRE6X7Qv7J1EDiwSifjrFyW0iYhOBUHmfmBij7HwLpYrM/mkp0DfRzMOpbiZbRpKflbNbo0nWXmZWX3Oyj/SN0VwF4xtbsaV3IPiOGaDtHwHB6/OzEH0r07Uf9yWMIJ+kFzC1ncQEAQ4jMLXV9UA7gNl1oba4gEzp8hrHij5khrEja8XdPXjClCWo0iVCUW2mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks7oEgdQTOwY36AHvyUSLHAAT7DZurHqyJ7CciasPX8=;
 b=DAHwR91dQp09qOS+MY4C9e5fSF8wPdSo0gh71/lmpOezwezf6ugydsLOvWXoBrXZJkQMdYSv+z6RBawS34cgaaIzcRjbzqLYhP3F+87yg5O8psQPV2Ejp5abFubuilLPVy6YVdfwNN7S6cAKuFYYah16twBprZ2C5ehg4OP7iuE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB10639.eurprd08.prod.outlook.com
 (2603:10a6:150:14d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 13:07:21 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 13:07:21 +0000
Message-ID: <d8fb496d-7bb3-42ad-8af7-200f393b4a73@arm.com>
Date: Wed, 9 Apr 2025 14:07:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] drm/panthor: Use 64-bit and poll register accessors
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-3-karunika.choo@arm.com>
 <20250321085306.0d79ec5d@collabora.com>
In-Reply-To: <20250321085306.0d79ec5d@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0681.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::15) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB10639:EE_|DU2PEPF0001E9C4:EE_|PAWPR08MB10134:EE_
X-MS-Office365-Filtering-Correlation-Id: 128c8848-dd4f-4771-f721-08dd77677d2e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Yjd6Qjd1ekxBN3dwdlpoOXkzODJaY0JOVXVpeVMrdStGR0UxTzIxcXcxY2cr?=
 =?utf-8?B?TzRnS1RUWGJ1L0lMZ1llUGUrS24vTXBEaGRTQkVwTmppZ242NXN6Vno2Qm9K?=
 =?utf-8?B?YUVTZjJSdVBqVk5MYW93d3NmcVgrQkM2Y2NSd3g4TVlzSU8zUmVqZ0gyTDVL?=
 =?utf-8?B?OXljOVNFZnBXVEtJNHZ1TkhHZ0Yvak5HT3FNWUNma0ZxNzFQVzFiRmhnSmFp?=
 =?utf-8?B?czBnQ1Fpb1lUUGxML09jdjlOb2MvY2NFSkRtTDYxZkZ6WitCMFhXODM0ckdE?=
 =?utf-8?B?bjFBL1lNSnFpSGFuclAzLzM3ckRHSitKRzRKOU0yZStpOUFkOTNySG9hbEhM?=
 =?utf-8?B?RHdZeWNWMGRBK29oL2IvdUI3eHRoQkI5bVR6TWVzc09XZTlIbnlHTEFSdDQ3?=
 =?utf-8?B?NzExSEFXcGdDdzlyRjAvSFArVzlDbWIwbExmMkplRmJlbXhmUVF3UWRjN1Bv?=
 =?utf-8?B?WkNKRlgrSHVBN0diRmppaVhSTUhzYnROcStSQzRLaXlZVDloekFSZ1hwR2h0?=
 =?utf-8?B?SHNRTmdhc2dKNzZhOGJ0WDdBSEczSWtKZ2FCTU5XWmYwK210QzZXUUFGcjlz?=
 =?utf-8?B?YmdHaWs5M29SNTFoamVFTXJjUjVSN2V4N2JlWkZXMldiYlZjS0ZsK24vVTFp?=
 =?utf-8?B?ME1XRlQ1UUdsVVU0c3BSMlNyayt2Ky9MZFJXYUZTTHRtd3BHLzhDbEp4RE5k?=
 =?utf-8?B?TzRYMWJEdlRoYUZqU1hXeVhrcEZGcVJtNGIxRHRxNDZaWVV3RFlIWTFva1Fn?=
 =?utf-8?B?TklZSUVKeDlsRE9wRU5Ca2R6bmd3SlBhcENhMUdzdy9tUzlWYlBSRVJQbDht?=
 =?utf-8?B?ZDh2RDNveDQrS2RSRkZFMWVzekE0d2JNUlhVbnBVR3hRUXJPUDBhc0tNaVhy?=
 =?utf-8?B?bmUrMjNMSGN5V2tiV3BhZ1RUZVg2ZUlGYnY3aDNGeTFFZ2J0aWdhZUJZcWtw?=
 =?utf-8?B?Y08wOVBqVHpPUVMzbW5tV1JIeEJWTmd2L0Z4b2Z6K3lSVWpvUTVDZDJZcjE3?=
 =?utf-8?B?UlJWbm0vTURtT0RNa0NiNTZpRmJOejFvUmFTSnhzclNxaGs3TU9oL3E5MzJV?=
 =?utf-8?B?NnkrZUlJT3RDQnM4R01DZXdvN3hBYnNRSndlcU9jelZKY0JtckJpQ3luQVdI?=
 =?utf-8?B?ajlyTnlNbHFqYjIzQjJnVHVuYkE0SzBwN2dSMWhXQ0g4bVFQYzlUNEg1amQw?=
 =?utf-8?B?MjhUeVZlZDZDdW9pOXhnb1RYV3BpVzljbS9kY2lEdHlXT2EzN1RZZC9LbmE4?=
 =?utf-8?B?akc5NTFvUXFXNU5XWStNUVVYaG1ScTViVHVOVlNJM2h3b3ZzZkhUR0Zyb2l1?=
 =?utf-8?B?ZC9IYWduUzRpYiticTFBSkt3Wk9NekdWSzlRVXAzTHlxT1g4SFdBbU5aemN4?=
 =?utf-8?B?RmFxdnI2dnBwK3JZdUMxd3dhVHorUGlqRnprRU9qU3lyWXFCclYvcG5Fc0hP?=
 =?utf-8?B?WXV0bFp3dlh0cTRhVUJEVGcxY0dOR2QwWENGZXpiYllVZTMzOTY1TitwcWVT?=
 =?utf-8?B?ZEpnN3BoSWUxVmllYXNNUkNyV0h2OTNDS2R1SG9HcWo0cjFSSTdrYjdLRTdV?=
 =?utf-8?B?ck5SdEthWWRyRHZMRG9qUElxcTZmdHV6OGxoekZNemxXaDRYZWd0M2JJVGhp?=
 =?utf-8?B?aW11dW1WTUQvdTVxcEVYRlV6bHZhdmF1RUwvY2NEd2s1cGNlcWRyK0JNMEIx?=
 =?utf-8?B?TDhXUExVczdtMHdyUTR3NWV1TEtPcWNza25TTktpaGlqbTdBcWREN0RxN05S?=
 =?utf-8?B?TWljZFhxVzFIWUZyYlMxeFJjQTV4VGQvL2lPMWFYUG81WlpZTithSDFVYmxI?=
 =?utf-8?B?Unc5ZVpKMm9wR3g0bkFJWW1iOXAxaURqNkVnUjdHdCtabDQ2eDRCZHlUQU1L?=
 =?utf-8?Q?vinlfSd5jCibp?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10639
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 90457e65-c131-4e02-67dc-08dd776776d5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|82310400026|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXQ2Q2xHY1hIRkJKTFdJWUdnTUVBc2tjZXlENGRYT2Mrbk05MnZxa1VMNjM4?=
 =?utf-8?B?MkZpWm1pQzdRY09wdE9IKzhMQ0pVMTlQeXIycVpZdjltYngxYjI4azUrVU5u?=
 =?utf-8?B?enJzSmh0cFZmRkRFazVIcE44YmJhYm1hZUtGRlhNNnRTdDN2NU1hQ0c0a2VV?=
 =?utf-8?B?TEF2UGQyL016bTB3TEtRY1lweHVXR2NKV1hJZmJQK0VHYTM4TU1leVVlVUpS?=
 =?utf-8?B?ZE4weGFuTHhWNitONzhIaHZrRkRTWWlRN2hxMCtEL3VQM1YwWlJXL2hDazRl?=
 =?utf-8?B?S00ya25TMTRIeHYxaDBpaEdXOUhtN2lRVDMvRGJXSE13Z1MxYXlDUHBkUE1Q?=
 =?utf-8?B?d21pQ2N5b2d6L0VvS2NrV09DbXprRjQrMHNOUDc2Q0VwVVNiNkExbisxR1Rv?=
 =?utf-8?B?SnZKQ3NwR1A4YWJacHZKMHZZNlZRWm13ZXp0Y3g2QWY5b3ZGSmtsTGtSQWhm?=
 =?utf-8?B?NGtpbmg3eXd3eExaakNlY0FNOE1CcXdGNzd0TW9zRVBtV2ZZNjdpREZCSTNv?=
 =?utf-8?B?TlJJclg5c1lndm1IVVN5R0JjVjZYUi9kVm9wZUF5WUM0dDdDLy9HQWcrTTda?=
 =?utf-8?B?MkYrejFuMHVDZFc5M2o2OS9vNW5oK2tjdmIzNUpzbnUrMU9hU3N1THRRRlgr?=
 =?utf-8?B?bmFyU2xNMzFrcDhrbUhMSDlmVHhEdDd4aHNZd3o1NkFGUVJUbWhhYzkyNEUv?=
 =?utf-8?B?M1ZXc2VPWlFkbUJkZG5MTnNVUG9Da0o0QkJwc0xDTXVsT2xUa0RXU05QWURR?=
 =?utf-8?B?aU9veHNYUjBWb2E2Y2hkUVJIUkJaOVpDQ2tLeHMvZjNHUU1sbFpaNmszbEFY?=
 =?utf-8?B?V3FWU1ROMWxUbVJSUjNTcjdHV1NTd3FwazEwZ1VQSXJGQU1adU44OUhvN0dO?=
 =?utf-8?B?TzBoc0JhbDcxeXpBd1IyK3NFMVNvWlI5YXVubHdDOUhEb29kUlBlOXY5RzdQ?=
 =?utf-8?B?ZkNBb2c4cnFuamF4eUtudi9wWE1kVGdwMHFLTTJJQzB5cjlwM01sczBvcVB6?=
 =?utf-8?B?KzdVYngxNzE2a1MxSHVXa212a05WUzh0WkQ4YXNSQzdMenMyNE1aWEU5QlV3?=
 =?utf-8?B?dEtQVXNoQ0RvT2RlQjZYUzZRVExPTmJnSFNXMGIzVTd2bVZJeldLZGIzdHg3?=
 =?utf-8?B?Mk1qTzBCemJGVi8rN2FlWGEwc0c0RzU3ZGl0ekx4Z1N4eG9jbDJBdmhneUpL?=
 =?utf-8?B?Q2lmTStjTEZBZFZrRng4WW50ZlBuTTBncnlHcXVFdkpXbUhBZmdHV3k0cjls?=
 =?utf-8?B?ck54WGNQeTRIUW1CdGFjQndRLzgwTjY0UFg3OW42MjFVTHBkaWFKL3lUdDNF?=
 =?utf-8?B?QnVQNFJ4MThQWjZLeXc2dVJxMU8vaGtZZGZzbTV5WVhpV1RSSXd1Z0c4K0NM?=
 =?utf-8?B?SjFiaE9hRkdSdVMxMjRqWmhuWGtxVTZQL1lTL0ozaUZvWklQdW1oQnd1Y2sx?=
 =?utf-8?B?RG1JY2lMckFIWGVodWFZKzVtMjhKamVpVlM0RjFOQlJManlvUzkxRWF5SVlB?=
 =?utf-8?B?c3dGakx1N3VTaWF4ZGhoNnBObWtkd0pabVZyNXNZVjU5blBsMGoyejUrRTlJ?=
 =?utf-8?B?SmxvSHNvRE5kaHExL0VISEFKZ1ZrbjRjYnJ5T3N6L3B5Slo5N0dGYUlGWHJR?=
 =?utf-8?B?L1BWS3pEdEVRSFV3bXlmZ3NjS3hLOGJLSlNtVGcxYTlrMXZ4b3NjZFZwcE9k?=
 =?utf-8?B?UU1aNHVzeGpuZjV3ZG4rckJDakZoVDRjWFFvQm81RlYvbWR5QVlOeHhwZm1t?=
 =?utf-8?B?NkFJWmpiZkdwaGRrU3hTMEcvYXBySktEOUw4NkZEWnNoWm83d0dEUk54bEUz?=
 =?utf-8?B?QUJBSkFML3lNRUhkTWE1NW85dVdGR0VuSG4rNWpKdVVNNG1DS3FnWDhaei92?=
 =?utf-8?B?MXllY092YkRlVUU5RWg0QnFKTURvaWE0SXoyOStYa0EvVDNMYlN2SkJhMmtR?=
 =?utf-8?B?dDBuZXlMWWNNdGdib3ZZZGNWSVJ4Vks0RkQ5azErYVJFMTg4TXFrRWJKRjJt?=
 =?utf-8?Q?vVbScPncTUsjMzd+qOLIa8YEAQlHoU=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 13:07:32.2045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 128c8848-dd4f-4771-f721-08dd77677d2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10134
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

On 21/03/2025 07:53, Boris Brezillon wrote:
> On Thu, 20 Mar 2025 11:17:34 +0000
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> This patch updates Panthor to use the new 64-bit accessors and poll
>> functions.
> 
> nit: I don't think it makes sense to dissociate the introduction of the
> new helpers and their use. Could we squash this patch into the previous
> one?

It was previously requested that I split the patches into two to ease
review. I can merge it back into the previous one in v3.

Kind regards,
Karunika Choo

>
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_fw.c  |   9 +-
>>  drivers/gpu/drm/panthor/panthor_gpu.c | 142 +++++++-------------------
>>  drivers/gpu/drm/panthor/panthor_mmu.c |  34 ++----
>>  3 files changed, 53 insertions(+), 132 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>> index 0f52766a3120..ecfbe0456f89 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>> @@ -1059,8 +1059,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
>>  	u32 status;
>>  
>>  	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
>> -	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
>> -			       status == MCU_STATUS_DISABLED, 10, 100000))
>> +	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
>> +				  status == MCU_STATUS_DISABLED, 10, 100000))
>>  		drm_err(&ptdev->base, "Failed to stop MCU");
>>  }
>>  
>> @@ -1085,8 +1085,9 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>>  
>>  		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
>>  		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
>> -		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
>> -					status == MCU_STATUS_HALT, 10, 100000)) {
>> +		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
>> +					   status == MCU_STATUS_HALT, 10,
>> +					   100000)) {
>>  			ptdev->reset.fast = true;
>>  		} else {
>>  			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
>> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>> index 671049020afa..0dee011fe2e9 100644
>> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>> @@ -108,14 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
>>  
>>  	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
>>  
>> -	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
>> -	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
>> -
>> -	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
>> -	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
>> -
>> -	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
>> -	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
>> +	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
>> +	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
>> +	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
>>  
>>  	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
>>  	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
>> @@ -152,8 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>>  {
>>  	if (status & GPU_IRQ_FAULT) {
>>  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
>> -		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
>> -			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
>> +		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
>>  
>>  		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
>>  			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
>> @@ -244,45 +238,27 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
>>  				u32 pwroff_reg, u32 pwrtrans_reg,
>>  				u64 mask, u32 timeout_us)
>>  {
>> -	u32 val, i;
>> +	u32 val;
>>  	int ret;
>>  
>> -	for (i = 0; i < 2; i++) {
>> -		u32 mask32 = mask >> (i * 32);
>> -
>> -		if (!mask32)
>> -			continue;
>> -
>> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
>> -						 val, !(mask32 & val),
>> -						 100, timeout_us);
>> -		if (ret) {
>> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
>> -				blk_name, mask);
>> -			return ret;
>> -		}
>> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
>> +					      100, timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base,
>> +			"timeout waiting on %s:%llx power transition", blk_name,
>> +			mask);
>> +		return ret;
>>  	}
>>  
>> -	if (mask & GENMASK(31, 0))
>> -		gpu_write(ptdev, pwroff_reg, mask);
>> -
>> -	if (mask >> 32)
>> -		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
>> -
>> -	for (i = 0; i < 2; i++) {
>> -		u32 mask32 = mask >> (i * 32);
>> +	gpu_write64(ptdev, pwroff_reg, mask);
>>  
>> -		if (!mask32)
>> -			continue;
>> -
>> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
>> -						 val, !(mask32 & val),
>> -						 100, timeout_us);
>> -		if (ret) {
>> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
>> -				blk_name, mask);
>> -			return ret;
>> -		}
>> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
>> +					      100, timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base,
>> +			"timeout waiting on %s:%llx power transition", blk_name,
>> +			mask);
>> +		return ret;
>>  	}
>>  
>>  	return 0;
>> @@ -305,45 +281,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>>  			       u32 pwron_reg, u32 pwrtrans_reg,
>>  			       u32 rdy_reg, u64 mask, u32 timeout_us)
>>  {
>> -	u32 val, i;
>> +	u32 val;
>>  	int ret;
>>  
>> -	for (i = 0; i < 2; i++) {
>> -		u32 mask32 = mask >> (i * 32);
>> -
>> -		if (!mask32)
>> -			continue;
>> -
>> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
>> -						 val, !(mask32 & val),
>> -						 100, timeout_us);
>> -		if (ret) {
>> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
>> -				blk_name, mask);
>> -			return ret;
>> -		}
>> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
>> +					      100, timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base,
>> +			"timeout waiting on %s:%llx power transition", blk_name,
>> +			mask);
>> +		return ret;
>>  	}
>>  
>> -	if (mask & GENMASK(31, 0))
>> -		gpu_write(ptdev, pwron_reg, mask);
>> -
>> -	if (mask >> 32)
>> -		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
>> -
>> -	for (i = 0; i < 2; i++) {
>> -		u32 mask32 = mask >> (i * 32);
>> +	gpu_write64(ptdev, pwron_reg, mask);
>>  
>> -		if (!mask32)
>> -			continue;
>> -
>> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
>> -						 val, (mask32 & val) == mask32,
>> -						 100, timeout_us);
>> -		if (ret) {
>> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
>> -				blk_name, mask);
>> -			return ret;
>> -		}
>> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
>> +					      100, timeout_us);
>> +	if (ret) {
>> +		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
>> +			blk_name, mask);
>> +		return ret;
>>  	}
>>  
>>  	return 0;
>> @@ -492,26 +449,6 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
>>  	panthor_gpu_l2_power_on(ptdev);
>>  }
>>  
>> -/**
>> - * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
>> - * @ptdev: Device.
>> - * @reg: The offset of the register to read.
>> - *
>> - * Return: The counter value.
>> - */
>> -static u64
>> -panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
>> -{
>> -	u32 hi, lo;
>> -
>> -	do {
>> -		hi = gpu_read(ptdev, reg + 0x4);
>> -		lo = gpu_read(ptdev, reg);
>> -	} while (hi != gpu_read(ptdev, reg + 0x4));
>> -
>> -	return ((u64)hi << 32) | lo;
>> -}
>> -
>>  /**
>>   * panthor_gpu_read_timestamp() - Read the timestamp register.
>>   * @ptdev: Device.
>> @@ -520,7 +457,7 @@ panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
>>   */
>>  u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
>>  {
>> -	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
>> +	return gpu_read64_sync(ptdev, GPU_TIMESTAMP_LO);
>>  }
>>  
>>  /**
>> @@ -531,10 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
>>   */
>>  u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
>>  {
>> -	u32 hi, lo;
>> -
>> -	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
>> -	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
>> -
>> -	return ((u64)hi << 32) | lo;
>> +	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
>>  }
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index 12a02e28f50f..a0a79f19bdea 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -510,9 +510,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
>>  	/* Wait for the MMU status to indicate there is no active command, in
>>  	 * case one is pending.
>>  	 */
>> -	ret = readl_relaxed_poll_timeout_atomic(ptdev->iomem + AS_STATUS(as_nr),
>> -						val, !(val & AS_STATUS_AS_ACTIVE),
>> -						10, 100000);
>> +	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
>> +						   !(val & AS_STATUS_AS_ACTIVE),
>> +						   10, 100000);
>>  
>>  	if (ret) {
>>  		panthor_device_schedule_reset(ptdev);
>> @@ -564,8 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>>  	region = region_width | region_start;
>>  
>>  	/* Lock the region that needs to be updated */
>> -	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
>> -	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
>> +	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
>>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>>  }
>>  
>> @@ -615,14 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>>  	if (ret)
>>  		return ret;
>>  
>> -	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
>> -	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
>> -
>> -	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
>> -	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
>> -
>> -	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
>> -	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
>> +	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
>> +	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
>> +	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
>>  
>>  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
>>  }
>> @@ -635,14 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>>  	if (ret)
>>  		return ret;
>>  
>> -	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), 0);
>> -	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), 0);
>> -
>> -	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), 0);
>> -	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), 0);
>> -
>> -	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
>> -	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), 0);
>> +	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
>> +	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
>> +	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
>>  
>>  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
>>  }
>> @@ -1680,8 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>>  		u32 source_id;
>>  
>>  		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
>> -		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
>> -		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
>> +		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
>>  
>>  		/* decode the fault status */
>>  		exception_type = fault_status & 0xFF;
> 
