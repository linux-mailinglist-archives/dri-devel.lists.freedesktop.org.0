Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DAAB2D883
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6558210E6DD;
	Wed, 20 Aug 2025 09:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="o4Jbz7Hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023142.outbound.protection.outlook.com [52.101.72.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1213310E6E1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:37:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3naj06K99SDdjZcuw7toe+J/8PXQKCVnkYRXLDKk/htotmHQayZLgTPyt+kH2n1tDlPiCd2KKVP9qgNQ+sMYT2ThheEElLa9ciJsvQwygCd3oneKe0oQP5LWiVN+kFG9zsrSRvJUdwwPcEg8L/sHR2P9Zdem7wjiyDTWAK340FE2+0KcjxdJZGIdFKh5arwoYTnnyiKi1fLPVJOwXupXVnW+Ivx7xixsqxyZLtZKfxEMK6XjFjFHaog54Tk8cFbuuZZ96AP3SJA5M5wEVW8X3ku8fuuPIAmHgOwa5xiJ4b3dHv8GimpB0/oeJE3D85aWYI6wWpbHsH6MrEwQnUKAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYPyuR3Ji6r3TXudGewJ6mQQhNTWr9G7htRUOahjr5Y=;
 b=mO047KxE47yfV8ATPJWcY5Hy8iQtJPT4PXPRYn3NxSPG4aRumSg8DE3Ce3V0cW/V8FK7jBR7XXeWYiO2YbDof6eekP9rrqfarJG0+ASM7oyfKwnp+ijfYVGWLtS9mK2THhpr7EMN9fZTNC6Fuw3KZRj1HAiBimR293wDMZJuvDLZZKnX3lJfydpcVzHgtWECXBO3vtBlHKVmRkOso8EoGK7szojQuJFHzSMC9RCnq8yJPCgGUrxSnCbCHZIzarlfaAQ3cL/nsqeIOXDRXBXGnBCT6uFzyXjLsZEiF1/0bIUWIh8YAEIffr4o2zQPOHrRlorwb+5RfkKJX+U6fSQTKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYPyuR3Ji6r3TXudGewJ6mQQhNTWr9G7htRUOahjr5Y=;
 b=o4Jbz7Hijn1h1rGTVCbE+l24LDSprL0DLgBjwxRE/BiYOnP4/TWUS2r2eQxy0XL6pFX/bknkrkrAKI5wgr0VVt8juriwPUTeEWZnPp47y5Er1+mf2Ox5jBjAoiMQPqN7Y4fUQApVrFnUK1Lp0LwpodLcnZmLozXZnyU+1y4s0Yhs/pfFmxYf34ekk7PRzRLGnE2bUqq512Z1B+PwTfmUyKzjhvMN9rr7eXELdD0cU9zcBulushag50aoLwA0PKhP2D3BBUMIW2/8PARr/faO8SZ/OrD1oYn1JoGGc0XxHg1iFpCmWfMEDueLyZ4fm8y0+1nB61BDrLabRRjuBmzsCg==
Received: from DU7P189CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::24)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 09:37:28 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::4) by DU7P189CA0009.outlook.office365.com
 (2603:10a6:10:552::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.13 via Frontend Transport; Wed,
 20 Aug 2025 09:37:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 09:37:28 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com (40.93.65.4) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Wed, 20 Aug 2025 09:37:27 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU4PR04MB10861.eurprd04.prod.outlook.com (2603:10a6:10:592::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 09:37:25 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 09:37:25 +0000
Message-ID: <3a4448a5-a01f-4d4e-a890-56eb9357abd3@topic.nl>
Date: Wed, 20 Aug 2025 11:37:24 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250812145256.135645-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3b7d4319-e208-470d-9ada-585343a64822@emailsignatures365.codetwo.com>
 <20250812145256.135645-2-mike.looijmans@topic.nl>
 <20250812-designing-tyke-db85527b373d@spud>
 <f4ec7690-322e-493a-b346-7b9560ac0616@topic.nl>
 <9fba4917-a24f-4fee-8f1a-7509a0bc542e@kernel.org>
 <2d694c9c-704e-4353-8b57-de83eb5a7f96@topic.nl>
 <1b517073-cadb-41e4-b470-54a6ad93dd59@kernel.org>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <1b517073-cadb-41e4-b470-54a6ad93dd59@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:208:55::36) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU4PR04MB10861:EE_|DU2PEPF0001E9C0:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 9448908c-aa24-44b5-97b4-08dddfcd2dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dkhma1h4OEVNQmd5MUZGS0NKZ3dYZmkySkpQUTZwTTFaclUrVmpFSlV0WXE1?=
 =?utf-8?B?cGFENG5YMHRlcVR1RlVvMmlzM2NrMUx3eFllUDlLZFhoMm9oU09PTXEzMS8z?=
 =?utf-8?B?T3ZjNk56VWxvNENyMWNLaXlPVG53cUxPaHZsZkI5UTVqYzlRU1dON2UzRERM?=
 =?utf-8?B?RTVUY1ZSSFZFcWJEVzlaby9aWW5vajZWeGt1QjFxZnR5V0o5VDUreERhdFI2?=
 =?utf-8?B?RHBTdHBWdnFhU0h4SG1nLzlYSHFMazV6L0lId0hvM0tSRnFjSlJoai9wZzB4?=
 =?utf-8?B?MEp4Vmhkc281QWprdlArNDRnL3BlL1RENldFUlZqa1VCOHQ3VXNKMWdKZERS?=
 =?utf-8?B?L1BSQmFCNnlscjd3aGxhYWlZczRZZzRZWmFMS1Z0WTE5eVRwRzB0MkNhNTc1?=
 =?utf-8?B?YmJ2NGtndzV6dDZpVlgwaDZ4UzR1OGxLKzNzT2g3U2Z6d3ZuVHBKUVEzbVNh?=
 =?utf-8?B?Rk5zdzZ0eGVLYzdxSk9hOEpseFpSblJ2KzZpNUZpNTdpWGk5ZmxiT3pxOUp0?=
 =?utf-8?B?bDhyYTY0OW11RTRMc1JzeFgyK1lqc2t2eitRMVhMYmdieWFnL25HQndOZ203?=
 =?utf-8?B?a1FkNmdiWDVaNGFWUEpra1grdlFRWGZYcDhWMWlSc2s4eU9nbW1oVnNVd3BJ?=
 =?utf-8?B?T0FzK0Y2dCt1d2dQd3I0L3lUalBTWnpEOGFkQUZ3dTVGb2V6MlV6WEhYcFQx?=
 =?utf-8?B?RTFWbUNUSWsxQWQrR1BQL2d5cU5ZNG41V2pYZSt6Sk52N3VlR2t4TStaaHho?=
 =?utf-8?B?WjJrVE56TnY0VjFlOG10b2pyWmpSdUoxZXZoTzRzb3pWZjdkUGM2bzJ0NkNE?=
 =?utf-8?B?cUdZdDVWeUFzNGdlRVR6ZE8vNWVwUkZiWUUrOGV5S054MjhhbC9KajlYYVA1?=
 =?utf-8?B?NkhCUDhSZ0RxVld0aldLTmV6K2k5eFZpazdtKzhQUC9QVFZNMGRKNHpZaFdt?=
 =?utf-8?B?L01IOXRkQnFxWGp4dWk1anlJb3p0V2k5L3BqNGpyL0dYOUd5ekJUdlpXSk13?=
 =?utf-8?B?dDU3Y2NzY0VWUTNzNkhiN3JPWVJMR1VzR1ZpS2tQU0I1dVN4M3pHUzJVSHZz?=
 =?utf-8?B?N3J5ZXk4ZWk5WC9xeU1WaGlua0JqZFIrNkxPMXV3YnFrbk1iODZTYmdxK0hj?=
 =?utf-8?B?ZE5PVHJrUHpYSjRVVEdNa21GYzlwYWxMZjJaRTRLNFU5RGUrTWhqVXdnajNp?=
 =?utf-8?B?ZHpIamdjd0h5N3Q5Zk15Rjh0VFdVOFd6RHpyai9ES3NkUFYrdjYvajVtdURX?=
 =?utf-8?B?cU5TRHVDNE5iVUFqQzUzV0tKU3hOblZ4RVQwVXA2R2E2Y2pYQmE0OTJoK3I0?=
 =?utf-8?B?VDMxeXFzUFJlQzVvS3JNdncvRmE0Mmo2S1lEN3VjMHd1YkYzTEcvci82eWpM?=
 =?utf-8?B?WG9WL1R1VE9kT3NYUVRWQWQ5a3BGbUhVVXZ6TVEzajIzWFNkcGtaVjNxaEZL?=
 =?utf-8?B?THpxSHZtZkE5SzBlTXRhMU92QWEwK0N2Ky9ZU2N6Y1h0aFJ2aTNLZllkc1VN?=
 =?utf-8?B?Qk9NcGRnZ0RrcnR1b0o2aU5teDV5RldDeTJlZEIyQjRUb1dZbDFqTkhrWEND?=
 =?utf-8?B?N0pGUG1MOVVQU1o3Zm0xeTY1NjdHdjg5MjNZSFl0NFRjbFFhZ0QwM09HU0tK?=
 =?utf-8?B?WXVkTGcwREY0WTFKRktwWFM5VEhzYWVNS2RmN01HS1pBWDIxaWZYOE9WeHM3?=
 =?utf-8?B?bEFsUklFUU9tcEtQOGVEektaMHVuUlNaT3lDd0tJamZQaStyUFhQWG1nUGhY?=
 =?utf-8?B?eGo4cjNtTHBPclJCZ0ZORWVTaWZOME9FZWdQK2xCVVZNT2Q2cjltMFZSODEr?=
 =?utf-8?B?ZUlkTXQrK3NST2MvTThhbm1wR3pnY3YreVJscUt4em5PVFF3YmRYc3BxRS9I?=
 =?utf-8?B?Z004SVhLbnBGWnZSZFVwNzJwWGE1STYxcVpxTHpnWk5kMlk1R2poODdUZXFT?=
 =?utf-8?Q?VSX13JWtUQs=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10861
X-CodeTwo-MessageID: 0d2c9485-c5b6-48b1-9f9f-17293cebba74.20250820093727@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a5b40ecb-1a44-499d-af3c-08dddfcd2b8e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|14060799003|35042699022|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVM1YUFLVWxZNWRuS0M3Z3RUbitTRkwvR2tEQ1hRcTJ4MEd0T1JPLy83cjBv?=
 =?utf-8?B?VlAvd2JZRldiRVhlczhEWUl1Q29mYkdKQ2QzeVpmOHpXQmZ3aWZodGd4OW5S?=
 =?utf-8?B?L2tjdFQzZFFWQVdraTlmV3VOU2hkRzYwVzBXWmFJbkNCUCtCVUJqLzZpRkNS?=
 =?utf-8?B?cUlUZUw0SUo2bzlTVDEvemJqTFVlUFlSVGdPSFdOc0VVUElFZkdOMUxFWGRB?=
 =?utf-8?B?c2VwQzJFVUNxNFRhVlB6amdzUTMzdkE4eVZVR2dueVNTRVY3bVhuY0ROTk1h?=
 =?utf-8?B?MHlJRWlqZ2dZekNsRHNRc0lXbnAxZWU0Y0hUaWxyQ2VQZ3drdUg2RTlQbkhq?=
 =?utf-8?B?NUh4QzZHblArQWZmNWdMY3lFeGtZdit0Vzh3NHVhU0dnUTlYVTNZaThIMjNt?=
 =?utf-8?B?V01qYXBZUnBNaDcyM1ZoRVl2cWVkblBnOXdmL1NLWlZsWjV6SVo1RWU1d20y?=
 =?utf-8?B?eWlybnZ0ZjhzcE1pU0l4aHFkN0MrU2JEZHFNTm5SWVdRRkJEb3J2TkxQVGhv?=
 =?utf-8?B?dElTSjJ5Z3czWlpVWXNRUXBmYUdaTDEwVng2NytRNmd4RXUzVkdIdjlEMzIz?=
 =?utf-8?B?NTJETGYyOVEwUWZTYStrSUhDLzd6T2E1ekpNeTVKeitKQW01a0p4aWNpdFVz?=
 =?utf-8?B?WGZJL0YwZU5ITXZFQ3NmZ3duRERyREQ3S0pSd05iWDNURlhpWnFnUUJYdmRu?=
 =?utf-8?B?bFUrVEJjL3dHOGdycHBlTFhSQ0FBaU42NjZqdlBSdG54RTczZk42WUxqTlBE?=
 =?utf-8?B?S1hNMFc4d3J2NHVNN1BUY3Jrb3RzMDFJQnNIUmVEcm9kZjlNakdtQ2VWZ3Ez?=
 =?utf-8?B?dm85aHdJcnoxdmxvaGNONnhDeWpjdUkrQzEzUDRxdUswMU5tZmdFZHY2V2h6?=
 =?utf-8?B?RUsxbWZHVk9ZMkdCNk9PaVFhYnpUMC91cUR4NU55Y2krYmFMY2hHRXY0TSti?=
 =?utf-8?B?NExkM2J3aGJpSmkrYmpCb0FpVGJCcmVqeDAvdjU4cXFJT2kwWGpHTVNXNE9v?=
 =?utf-8?B?dXJNd1pKVHN4NHpGMkwzYnJhWHJBMlJjbzJKVFMwellvWEk0OFp5Q0hKaG10?=
 =?utf-8?B?aGQyT0dDK0ZWWVJZV0VFRG9xbzN5bk5LOUJjYyswcktqdkNod0kxdzFiclFh?=
 =?utf-8?B?OUUwZDV2L01LNDRRMDNpVmZNazh3bkFlVThHcWpnSzQ4b3dFMWRKZ3dGRnNm?=
 =?utf-8?B?WG81Y2lKZFVqendBYXNrWi9YMXVYTkQzUW1yUE43RXlvUDBCL0ZkVG5NQjdP?=
 =?utf-8?B?QmxQbTM0Ny9hVmRPTHRWTjRBcmMyWXVyTjlaaGJHZi9zTmhFbHNOdGlTNTc2?=
 =?utf-8?B?bVAwb2VaRExpKzNicHVqOXhLVGZJV1NQNVVPV1l0MWZDTkFtVjIzQ3VmUEhs?=
 =?utf-8?B?ZjgxamltdjgzVTZtWSt0SGZOeHYrOUZUR0IzWWtrS1dCZlJkN1JaU0V3RXZG?=
 =?utf-8?B?ZXVNS2pkdURlUDdJbnNGWDBEL0huNDNMZ0I0ZkE0SUcrc1ZjM3dXbVlKSVlZ?=
 =?utf-8?B?L2xURm1QZEdzNXBaSkFvS3lERUhxSU51aXlKSk8zSE5JSWFOYUNSQlBaZUtK?=
 =?utf-8?B?VU9FK1plRjhrZUJxeHZ2eVphOXUvNHZYZGZrNmVESlRMaktpTjJnZ2p5WU5l?=
 =?utf-8?B?eHFLTkJlVzM0T2U0SGNNOTNXMU1sbGhxcEhIUW9xMkt5UkxYeWpuMGhmWkhO?=
 =?utf-8?B?aUoyY0swR2xTZjVNUDljOVdnU2VaTlFIS0tIN3N6UDRyYWdlVkVQb2xmRmk0?=
 =?utf-8?B?VW5obzhDWkZ1WWRuZEJSS2ZmUVBTdWQvV29ReDBvWVhHNjJYSVpFVkFVeXEx?=
 =?utf-8?B?MDJXRk1oc3lEZmJGWEY0NFd4bVZpcVUybk54ajFkR1EvZHM1bS9oeGFzWmZw?=
 =?utf-8?B?S09xZ2djQXIySXRONFNCRzE4b0QwcGtVOGMwaEhaWWkwVGJ5WGJrc0c4UWhn?=
 =?utf-8?B?b2tYVTUwcG9lYTlZNlRORVlzUGhTVmVEeDZCNXZtS2ZRUUc4NzRyZmgvT2RH?=
 =?utf-8?B?eXk5NkQ5Mm9BPT0=?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(7416014)(14060799003)(35042699022)(376014)(1800799024)(82310400026)(36860700013);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 09:37:28.0039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9448908c-aa24-44b5-97b4-08dddfcd2dac
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
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


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 20-08-2025 08:44, Krzysztof Kozlowski wrote:
> On 19/08/2025 10:26, Mike Looijmans wrote:
>> On 19-08-2025 09:51, Krzysztof Kozlowski wrote:
>>> On 19/08/2025 09:46, Mike Looijmans wrote:
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    enum:
>>>>>> +      - ti,tmds181
>>>>>> +      - ti,sn65dp159
>>>>> The driver contains:
>>>>> +	{ .compatible =3D "ti,tmds181", },
>>>>> +	{ .compatible =3D "ti,sn65dp159", },
>>>>> +	{}
>>>>> so why is a fallback compatible not suitable here?
>>>> I don't understand the question. The two are slightly different chips,
>>> Your driver says they are compatible. No one said the same, but compati=
ble.
>>>
>>>> so it makes sense to describe that in the DT.
>>> Compatible devices should use fallback. There is plenty of examples (90=
%
>>> of all binding files?) including example-schema describing this.
>> Please help me out here, I'm happy to oblige, but I don't understand
>> what you're asking.
>>
>> To the best of my knowledge "fallback" compatible is when you write
>> something like this in the device-tree:
>>   =C2=A0=C2=A0 compatible =3D "st,m25p80", "jedec,spi-nor";
>> Which means that we can use the "jedec,spi-nor" driver if there's no
>> specific match for "st,m25p80", correct?
> Yes.
>
>> I don't understand how that relates to your request, this is the first
>> time I ever got this particular feedback. Looking at say the
>> ti,sn65dsi83 driver, it does the same thing (supports the ti,sn65dsi83
>> and ti,sn65dsi84).
>>
>> Please explain or point me somewhere where I can find this?
> I already pointed out to example-schema.
>
> Also, e.g. first file in iio/adc:
> adi,ad4000.yaml
>
I think I get it. Instead of having compatibles "a" and "b" the driver only=
=20
supports "a" in its match table, and the devicetree entry must be either=20
compatible=3D"a"; or compatible=3D"b","a". Using compatible=3D"b"; would be=
 disallowed.

I actually planned (I have implemented it locally already for v3) for the=20
driver to check the chip type and complain if it doesn't match the devicetr=
ee.=20
If the wrong device is there, the most likely cause is that the input and=20
output buses got mixed up. That would also justify having separate=20
compatibles, right?


