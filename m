Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EDDA7186B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF7D10E6E8;
	Wed, 26 Mar 2025 14:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="FaksMitk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FaksMitk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158EE10E6D9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:25:06 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a6Jar3JQ0f9DQfqOQRdQha2qYKGs+wLvfXOVQQ3UY8VrDbqNj9uBVL9bNWTYwVeFER7xf40szVlfAJ0ck5s51/o3XomOCYj0eoU5RcziMEX2ruFvtztgWzlmhkrKcQ9Jo0CJYIx0kLiWaCUJGmfHcoX4LPU6jJ7IRC9euidmBzKR7KLJ84FMmKNIKovFd0Z463hGBkX43cR0GlGnerryi9JrI0A9XpN3WafDhGzr8BQ53bgOR5WVdi+0T7xgvv9/wxZbyCKztYJAckjOnLHRa0XcC0X+DaurAs+8eyCknobLHwK3oJOk17HUJHC4cZJa2RIxUh0PBrdPlFgVhYzxdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8rPTcJZ1KjLjSRqqdOYFN1ixN1W9nalDc5lP/DKyBg=;
 b=e62DZ4kqSdQYMAMv/CyKjAR5r2n5TG9SChm8o6Os5rIiKuPQjuZ23aCp10srFVkW263goLkcuI+He7btrPP7+04OdSNkKQkH4SXROKJaG944vIsoZVyhZVxcTnPvsJ3TPaxEtSb7g0rlFR3n0ynZZsZs9MirNSch7oa63oF5X2QOZt+r/uHAMDue7IUfcy38WBoidcte0+K/yiBHQdlX4CSP6lnSM/7EgEv3+r8HZ4vSMR4qBEBEgWJOCxQq4JmCxhRd1aHdbVTwt6cCGOpFIqzsFcRRNWKaHmjbCKKVPN7ZdlH99XdZUeNh2+0lNkuqJ5pi/6eF02l4htm4jtFDxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8rPTcJZ1KjLjSRqqdOYFN1ixN1W9nalDc5lP/DKyBg=;
 b=FaksMitkLkycLq35G7yjDRrnJn3RMHVcrYvvDCv4yaIxOlkRibFJzFYm+hTomV4HeYIMsnzBJdmu6raPy6CsqioNMKL2jpdhrZ8BMMMIRmGP1aVR1WaUvVKZcshNgVoM9zw4lCEM1oWiMts/4EXw3uPr5C0+tnnxkOi9WbAAHXQ=
Received: from AM0PR02CA0134.eurprd02.prod.outlook.com (2603:10a6:20b:28c::31)
 by DU2PR08MB7358.eurprd08.prod.outlook.com (2603:10a6:10:2f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 14:24:59 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::52) by AM0PR02CA0134.outlook.office365.com
 (2603:10a6:20b:28c::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 14:24:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 26 Mar 2025 14:24:59 +0000
Received: ("Tessian outbound 8df300e92501:v604");
 Wed, 26 Mar 2025 14:24:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 72196f31463e88ff
X-TessianGatewayMetadata: AKlsRK2sLlVt+ul+Okr/0Jcn+BzHQZphM04+igPrMBULNaapTKMRi0wfEN0Llevm9D1tYweBsGg0vRkHFJWfd16QoEjFjlbEp4e7H1MOBMdr6xTD07ymGtQLeYIydIfH33DJuTzoIfYBtx5xphHki4dvuXdBI5OdTUVc0jIzT5M=
X-CR-MTA-TID: 64aa7808
Received: from Lc15ac7b9c156.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 605E2D19-5C8B-4818-983D-6F403AA7A351.1; 
 Wed, 26 Mar 2025 14:24:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc15ac7b9c156.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Mar 2025 14:24:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENYDgUbiNx0ghcbSQoZmGiBe75831WP6y+lGleYD0sbsmXGMshp7bCkLLqt6x0BNfMuXCtpktMYZOj/K+uDXVIh0VcDFU7VBO/fQTgpC8axTuZUGx0hsOmOPUEdEcRYhtqwSxn2zA7Pl2BDWuOd6chkmAq8wXJtYr4R0UtrUD0eNVD1loH8v0iHnRl0IBzEuvSufqGyprjVPgqFq8MYs1EDWDzpGW5A0jCpasJzAqbiKjYmcePiZdTS4zmDEMyxiCKuK11zl+TVddI9e0FQS0VEWPo/6gJcpf7YXQniPdY/EEUbIG5TfRSyJkEICNYC1fic+IMxxXRDsA5gDGSovdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8rPTcJZ1KjLjSRqqdOYFN1ixN1W9nalDc5lP/DKyBg=;
 b=KxJrg4OynR5w0gbBsgvVBiYCNnazKnZbMF9VpFHEDeiqcJHEOuybkABK0RLSupw6TdMioxbfrsQ+HeIb071Pv9iRmuImPMh6R0HOW2iYywl/JgW7PscgTwt5bUac6eigUGmD7e4PunBk03u7Oyh4LGfgtXAX4xYRhLG/HLyl/VJUz6wB8XDIz1jPuAMLbvZkOPUciIwvM3koQ3Sfn25yeKbiqMvbBWw4en1w2+br8nNLr8MxIv9PZtk7srBiRQnZzZ655aNsbxX5Fg7b8kGenQuU3KMS3PIwv28/nAFG1lhiWTTXusM2oFbJYIIrYTJ+o2xTLQXomGz6aie5Rdr9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8rPTcJZ1KjLjSRqqdOYFN1ixN1W9nalDc5lP/DKyBg=;
 b=FaksMitkLkycLq35G7yjDRrnJn3RMHVcrYvvDCv4yaIxOlkRibFJzFYm+hTomV4HeYIMsnzBJdmu6raPy6CsqioNMKL2jpdhrZ8BMMMIRmGP1aVR1WaUvVKZcshNgVoM9zw4lCEM1oWiMts/4EXw3uPr5C0+tnnxkOi9WbAAHXQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8304.eurprd08.prod.outlook.com (2603:10a6:10:40c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 14:24:49 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.042; Wed, 26 Mar 2025
 14:24:49 +0000
Message-ID: <55fb6aa6-89dc-404c-89fc-5c56d15d8c98@arm.com>
Date: Wed, 26 Mar 2025 14:24:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 1/8] drm/panthor: Add performance counter uAPI
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
 <20241211165024.490748-2-lukas.zapolskas@arm.com>
 <zxvkqrvhoewt5oj34h6f4hhguxxkpl7ljbm6tkh7yac4uuipyh@vmfmvtdx375h>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <zxvkqrvhoewt5oj34h6f4hhguxxkpl7ljbm6tkh7yac4uuipyh@vmfmvtdx375h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU0PR08MB8304:EE_|AM3PEPF0000A78E:EE_|DU2PR08MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: ab095f4b-0191-4341-91b8-08dd6c71fd72
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Sk43bUcybkM3bTNEMlErTDA0UjJ3MlN3cjhGaU9nWndpN0F0UmFyT0xlbUNS?=
 =?utf-8?B?bHM1NG5ZSjF5UzU5OWRkYi82QjRDRHViOTYwa1ZGNlh4QUdISFZPOEtMSGEw?=
 =?utf-8?B?dEtEM2VjV3VPSXVKbDBUaTBISXpHVVJaREpRNzRjN2xtWW1pdG1oN2RSdG9H?=
 =?utf-8?B?TTdpSENsMTMzVGZBNVpyU2FvU0VRMk9YaThtSGNTb29xWUovOGRHTHR1d201?=
 =?utf-8?B?cElhZDhjLzRKN0JGcU5zU1E0RTB2NW85aU1kMHUzTzdtMzk1UVdqbmFTMDh1?=
 =?utf-8?B?dURSN3lkK1VQVG80SmYxWTczTnZmSUxsanl6Uks3Y3A4OE4xeHVBMTI3NGor?=
 =?utf-8?B?c2NLVDFZenFqelUrNTZyaDk2ZTVva3oyU21VMzI0dVFTMkh1ejlyQ1ZsOHRK?=
 =?utf-8?B?aUJQcHVtSWUvZWZuZzNsSDlDeE5ib1lhbzk2RWhQM1h5OVRvRTd4R1E4T3lO?=
 =?utf-8?B?NlRHbXNnbktoMlBUMnk5cDJ3Mml1NG53YXZWK3dhT1JBVFN3WEVZL25ibFdO?=
 =?utf-8?B?MXVSLyt2V1draVNVK2JqTE9xb2pPcU5icnYwK0hscWllVXV5UjNYamRQVGNh?=
 =?utf-8?B?d0MxRHczRHZwTDBWaFVQV3UvTUprOENGQXZ5M0szT1pSMFRESFVBVjNSZFhQ?=
 =?utf-8?B?aHdWYWtEeVZtaytWUU1ibGhIcVJJaHZtZ2R3cFlGREpMcmxjS3NrY3BiNkN0?=
 =?utf-8?B?cFZXVDdsQzZsSHJER0dYSzUvc082S0xKbHlRQmJVeXhaaitMR0dJM1JhVjVm?=
 =?utf-8?B?RkZnYmIrVE1RTStqMXMxUTA4RzdWUVJWbWt3cHJDSXBURUlxTGF3ZmlVWllj?=
 =?utf-8?B?OTIwSFMxZ0FseW8zQVlOQ1dFVVdFNUROSTNXRzA2M0d3akoweW9vdXAzbkpI?=
 =?utf-8?B?emV3ZHAxOUNBRWdGbDhSK255aThSR0F0UjZWTFZ6enJSMmxLVmRHalRsc2w0?=
 =?utf-8?B?MHFtR3NTMGZCWVdQTWZoaXpnTVZtYmNOQk9iYnhwYkJGQURqcWx4TTgzTFlE?=
 =?utf-8?B?YmMzbUQ3N280QjZJblFSUTBZK0xHR0gyZ0ZINThQZlBmbVVCWEJaSytYeXcv?=
 =?utf-8?B?STdLbnRnNlNuOGNKZUJTbjNrSlhwQWY4cW1NVmQ4MlNLMzE0MXdDTVAxZzZK?=
 =?utf-8?B?NFJsejNaRzJ0dy9EUi9YSzNpTTcwQ1hxbW16dlFXaXRDSWJOU2FmTUZMa0U5?=
 =?utf-8?B?Wk1tZmhqUk5Oa0V1RmREeENnV2pIYjNqdDJIa25pZ0tJcnpoT3E5aFdRMDZR?=
 =?utf-8?B?ZUNpWU0xZjRJUmphWTlvSjlqdGkzdUtid0NobE1XK2swWFFubDFCbUlXaDdN?=
 =?utf-8?B?UzVYVi9rRW01dlNndkVSSTJGaUxuVkZmaHEvVldPQVFZbjVEN3d4enZQVXl3?=
 =?utf-8?B?cTBkOHdaMVdZdjBiUXV1azhTcDBLNEd2K2xSais0ajRNZVhpdkw0YmJhb0xq?=
 =?utf-8?B?ZER3eE94VXZCNytuMGsrem5vRno0YkpxbjhGTllzZjVPcUw0WXh6NVZaMmFL?=
 =?utf-8?B?L0VCemRBby90SGN1UlMrNE8vZDdTbHFmYm9xSnBPa3ZBWWd1a1duK2NPdlZY?=
 =?utf-8?B?Yk01ZDlkTnBvRktERHM0L3k1VWFFNi9lUlZWbUJVZ3YwWGh2UWV5U2J4NThN?=
 =?utf-8?B?ZGFNamxBVWdENWFyZ25ZVWxXSUNBZlpESTJQdFg5aUM1c1h0Y2hlZUtvaHo4?=
 =?utf-8?B?STlFdWNpWWkxOG5IcmZ1NDRycnd5L29iR2o3c1hPaHdHS1JWWUdKUVRmUkVp?=
 =?utf-8?B?aWtMZzZOZmtzMWMzQThuMkNucS95UEY1OGlLMS9hcWZyVkEvL251VitzVjZq?=
 =?utf-8?B?LzB4cVg0VzRBVzUrcEFjTzNtMFFtY0VrM3g1TkFDOXRIdFV3SDJYTGFnN2xI?=
 =?utf-8?B?d1A2NUphTm4vWC92ck9DYnJveEU3Q1VlcWpyNytyekFBS3AwVDdWeGM1cUZI?=
 =?utf-8?Q?Kq+yHwpe548=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8304
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3e173259-8a0e-446e-895e-08dd6c71f712
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|1800799024|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OU5ELzVvdEl0R3NnT3BxeG9SbTkvdnljeisyWXZaMWpFZlFFY3U4R3c0SE1w?=
 =?utf-8?B?d01rQ2RGdk1RTzBieHBqaHQrdEtycjNLVmxhdVRQMnEvcE1OanM2VGs3aHB1?=
 =?utf-8?B?TU9LRXlxdWQrUlpWVGxzUFMxMFNWUmxxUHpsZFJQMkNHZUV0TzZlMW1rSHFh?=
 =?utf-8?B?bE5seSswN01veHpFK0FHRFgrVEIwVGpna0tXNEVqeHJsTVoxQjNLSnlKZkpN?=
 =?utf-8?B?MzRYWDZ2NVFoamtvNTliS2tRMG02eVVmQnpwSCtTMlpjeGNidXUxZUhKRGVa?=
 =?utf-8?B?RGJEM0p3VWppMGt2Y1JkR2JVMml4WCtPS3Qxamc1cEFjaUpYV1JwZlBCVU9w?=
 =?utf-8?B?Q25leHc5Q0R3djZqQnFDSWhtQ0tDbDR4M0FwWDVaVy8wWW9QVDFPblJyNUhN?=
 =?utf-8?B?cXRtSTZid0R3TzNia1hPMDV5TEs2a1VOUGlvbTlBdkJlaEgrUVpXMEpKNmE1?=
 =?utf-8?B?ZVdGVkp2eWNvWGp0c0dMVFpTTklybGlQZjNNdFo2Q0R5NWlIRStlOHlXVEdn?=
 =?utf-8?B?aVF2ck5jQ2F2MHAvenBHcjNiK29zeWEwMVB5RDRqMEZwZXk2U01GNnM2TFYv?=
 =?utf-8?B?cTd4NHVWd2QxTERmc2ZTenR2MTI0VjNvUmluSGVCNFh1MzhLY1c0ZXBGZUhZ?=
 =?utf-8?B?VjF2T2lSTHZJL2ZGRkNFUFo4eEthWXFJSW5WRlAyMTMrMTRnWDErYlNrWCtv?=
 =?utf-8?B?b3M5MDJJQmE4SG9UbVZGajZmUzM2QXJqVFV2OXRIVFlCMzFmWEhoRGVuNkJP?=
 =?utf-8?B?dUx5YU1BMVNyeUxXczE4ZHRnMm90ci9Mcms3YkFSUWEvUm1NTFBXQVoxUDJl?=
 =?utf-8?B?TGx6Y1RZaEc0K1VtdGhqeEc2ZXVjQUJNWHhFaFpNc2h6OUs1bUNpbEptNG9y?=
 =?utf-8?B?QjY0Z0hBb0hhZnYvUnhmdkE4WFpXeGpXWDAzUUUxNnJqdWh2T09HTWFGb1hL?=
 =?utf-8?B?OCtlSnFNQ2FpTFc3WVdIYml1UDdIRGVFU0kwb3p0T0g3USs1UkNNa2cvTmJD?=
 =?utf-8?B?SUFlMTR6TXgvZWZjbVUvdXJOVEhrNVV2Wld6Vmh0RTNFWHJEb0hlVnpsQTNj?=
 =?utf-8?B?TlA1L1pqcVNxYWVtSzNMVk1DYzh0MEpKOGRxVklCa25PY2JnbEFzZnNSVjRB?=
 =?utf-8?B?MHIxcEpzbEppbEh4YmVQM1RyWDdta2ErWWhHNW85RHpJQVFsTWp1SXVydmdK?=
 =?utf-8?B?eldHaGhWSUorL2pTemt4S3hMZHQwdExkWlRjZ3NZbUZUSWQyUzVGQWhyNTFU?=
 =?utf-8?B?R2dVaXRuY1JlNWh2RE9iallDa05RcmhGL0lCbkFkVkVjV21kcXAzd21SZkFm?=
 =?utf-8?B?SG5VUWgwVWtmWDlaWWtKb1R0ZTMwNEs5K1dzRkdnSDVuUlNSbVdnQ3pRMEkz?=
 =?utf-8?B?ZzJsbStRYXQ1R1A3c1Rzc2lrbngxcmswb3J2cWpQOHhHNjlvakx0Zzd1OElC?=
 =?utf-8?B?aTZMM1k5NUtFWmxna2JkbHg3RDNFaVBlMUtIT3BpSXFTbU9aakVwdis5RGp3?=
 =?utf-8?B?aHF0WHdEVzJNSUZSeEJybm9ickp5dHNlT0RXNFJ4cHVUYVdENTRncnJCRlRL?=
 =?utf-8?B?Nm9zNnNTYkNLYkxqWjlYSHJwamhadVg3dk5MQWFxT1RWcDZ5MUVHeWtRdklY?=
 =?utf-8?B?ZTRUWCtKNkpMUUxYMkg2cWxLV1RhRDEzQ2l2VWQxVlp1aWtRTDYrZVJ3NytD?=
 =?utf-8?B?aVMwVm04NVA2NWdDYWpRaWo3cFdpYVFybjc0amNLR3dZOTlKeEg3SGZja2Iy?=
 =?utf-8?B?QXZrUkVpNGUvRXFPYkN0NUxLd3dGV2tDYnVPVlJLaDJyMVY3UStuc0pCQVNs?=
 =?utf-8?B?WWRBNzBLSTlFZTlXVDNzL1Z3RkUzbWlPS281VHc0MjhYK2MvYVdPWWE5TVU3?=
 =?utf-8?B?YW9zRUZEM3h6aisyakpFclRVZm9qaEI4ZzRCR2Fac0VPOFA4N1BGQnl1Ty9q?=
 =?utf-8?B?WENRTVlHSGcvRmJrVVRJdHhSd0FaNmNDKzRjNnRFbW1NdTVtakdpM3RkUDNV?=
 =?utf-8?Q?1vepDit/SxbY4m88LARnQw1KQRMKiE=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(1800799024)(14060799003)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 14:24:59.5101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab095f4b-0191-4341-91b8-08dd6c71fd72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7358
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

Hello Adrián,

Thank you for taking a look. I'm currently working on getting a v3 ready 
for this and to drop the RFC tag, and am going through all your comments.

On 27/01/2025 09:47, Adrián Larumbe wrote:
 > Hi Lukas,
 >
 > On 11.12.2024 16:50, Lukas Zapolskas wrote:
 >> This patch extends the DEV_QUERY ioctl to return information about the
 >> performance counter setup for userspace, and introduces the new
 >> ioctl DRM_PANTHOR_PERF_CONTROL in order to allow for the sampling of
 >> performance counters.
 >>
 >> The new design is inspired by the perf aux ringbuffer, with the insert
 >> and extract indices being mapped to userspace, allowing multiple samples
 >> to be exposed at any given time. To avoid pointer chasing, the sample
 >> metadata and block metadata are inline with the elements they
 >> describe.
 >>
 >> Userspace is responsible for passing in resources for samples to be
 >> exposed, including the event file descriptor for notification of new
 >> sample availability, the ringbuffer BO to store samples, and the control
 >> BO along with the offset for mapping the insert and extract indices.
 >> Though these indices are only a total of 8 bytes, userspace can then
 >> reuse the same physical page for tracking the state of multiple buffers
 >> by giving different offsets from the BO start to map them.
 >>
 >> Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
 >> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
 >> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
 >> ---
 >>   include/uapi/drm/panthor_drm.h | 487 +++++++++++++++++++++++++++++++++
 >>   1 file changed, 487 insertions(+)
 >>
 >> diff --git a/include/uapi/drm/panthor_drm.h 
b/include/uapi/drm/panthor_drm.h
 >> index 87c9cb555dd1..8a431431da6b 100644
 >> --- a/include/uapi/drm/panthor_drm.h
 >> +++ b/include/uapi/drm/panthor_drm.h
 >> @@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
 >>
 >>   	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
 >>   	DRM_PANTHOR_TILER_HEAP_DESTROY,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_CONTROL: Control a performance counter 
session. */
 >> +	DRM_PANTHOR_PERF_CONTROL,
 >>   };
 >>
 >>   /**
 >> @@ -170,6 +173,8 @@ enum drm_panthor_ioctl_id {
 >>   	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create)
 >>   #define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
 >>   	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy)
 >> +#define DRM_IOCTL_PANTHOR_PERF_CONTROL \
 >> +	DRM_IOCTL_PANTHOR(WR, PERF_CONTROL, perf_control)
 >>
 >>   /**
 >>    * DOC: IOCTL arguments
 >> @@ -268,6 +273,9 @@ enum drm_panthor_dev_query_type {
 >>   	 * @DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO: Query allowed 
group priorities information.
 >>   	 */
 >>   	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
 >> +
 >> +	/** @DRM_PANTHOR_DEV_QUERY_PERF_INFO: Query performance counter 
interface information. */
 >> +	DRM_PANTHOR_DEV_QUERY_PERF_INFO,
 >>   };
 >>
 >>   /**
 >> @@ -421,6 +429,120 @@ struct drm_panthor_group_priorities_info {
 >>   	__u8 pad[3];
 >>   };
 >>
 >> +/**
 >> + * enum drm_panthor_perf_feat_flags - Performance counter 
configuration feature flags.
 >> + */
 >> +enum drm_panthor_perf_feat_flags {
 >> +	/** @DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT: Coarse-grained block 
states are supported. */
 >> +	DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT = 1 << 0,
 >> +};
 >> +
 >> +/**
 >> + * enum drm_panthor_perf_block_type - Performance counter supported 
block types.
 >> + */
 >> +enum drm_panthor_perf_block_type {
 >> +	/** @DRM_PANTHOR_PERF_BLOCK_FW: The FW counter block. */
 >> +	DRM_PANTHOR_PERF_BLOCK_FW = 1,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_BLOCK_CSG: A CSG counter block. */
 >> +	DRM_PANTHOR_PERF_BLOCK_CSG,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_BLOCK_CSHW: The CSHW counter block. */
 >> +	DRM_PANTHOR_PERF_BLOCK_CSHW,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_BLOCK_TILER: The tiler counter block. */
 >> +	DRM_PANTHOR_PERF_BLOCK_TILER,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_BLOCK_MEMSYS: A memsys counter block. */
 >> +	DRM_PANTHOR_PERF_BLOCK_MEMSYS,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_BLOCK_SHADER: A shader core counter block. */
 >> +	DRM_PANTHOR_PERF_BLOCK_SHADER,
 >> +};
 >> +
 >> +/**
 >> + * enum drm_panthor_perf_clock - Identifier of the clock used to 
produce the cycle count values
 >> + * in a given block.
 >> + *
 >> + * Since the integrator has the choice of using one or more clocks, 
there may be some confusion
 >> + * as to which blocks are counted by which clock values unless this 
information is explicitly
 >> + * provided as part of every block sample. Not every single clock 
here can be used: in the simplest
 >> + * case, all cycle counts will be associated with the top-level clock.
 >> + */
 >> +enum drm_panthor_perf_clock {
 >> +	/** @DRM_PANTHOR_PERF_CLOCK_TOPLEVEL: Top-level CSF clock. */
 >> +	DRM_PANTHOR_PERF_CLOCK_TOPLEVEL,
 >> +
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_CLOCK_COREGROUP: Core group clock, 
responsible for the MMU, L2
 >> +	 * caches and the tiler.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_CLOCK_COREGROUP,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_CLOCK_SHADER: Clock for the shader cores. */
 >> +	DRM_PANTHOR_PERF_CLOCK_SHADER,
 >> +};
 >> +
 >> +/**
 >> + * struct drm_panthor_perf_info - Performance counter interface 
information
 >> + *
 >> + * Structure grouping all queryable information relating to the 
performance counter
 >> + * interfaces.
 >> + */
 >> +struct drm_panthor_perf_info {
 >> +	/**
 >> +	 * @counters_per_block: The number of 8-byte counters available in 
a block.
 >> +	 */
 >> +	__u32 counters_per_block;
 >> +
 >> +	/**
 >> +	 * @sample_header_size: The size of the header struct available at 
the beginning
 >> +	 * of every sample.
 >> +	 */
 >> +	__u32 sample_header_size;
 >> +
 >> +	/**
 >> +	 * @block_header_size: The size of the header struct inline with 
the counters for a
 >> +	 * single block.
 >> +	 */
 >> +	__u32 block_header_size;
 >> +
 >> +	/** @flags: Combination of drm_panthor_perf_feat_flags flags. */
 >> +	__u32 flags;
 >> +
 >> +	/**
 >> +	 * @supported_clocks: Bitmask of the clocks supported by the GPU.
 >> +	 *
 >> +	 * Each bit represents a variant of the enum drm_panthor_perf_clock.
 >> +	 *
 >> +	 * For the same GPU, different implementers may have different 
clocks for the same hardware
 >> +	 * block. At the moment, up to four clocks are supported, and any 
clocks that are present
 >> +	 * will be reported here.
 >> +	 */
 >> +	__u32 supported_clocks;
 >> +
 >> +	/** @fw_blocks: Number of FW blocks available. */
 >> +	__u32 fw_blocks;
 >> +
 >> +	/** @csg_blocks: Number of CSG blocks available. */
 >> +	__u32 csg_blocks;
 >> +
 >> +	/** @cshw_blocks: Number of CSHW blocks available. */
 >> +	__u32 cshw_blocks;
 >> +
 >> +	/** @tiler_blocks: Number of tiler blocks available. */
 >> +	__u32 tiler_blocks;
 >> +
 >> +	/** @memsys_blocks: Number of memsys blocks available. */
 >> +	__u32 memsys_blocks;
 >> +
 >> +	/** @shader_blocks: Number of shader core blocks available. */
 >> +	__u32 shader_blocks;
 >> +
 >> +	/** @pad: MBZ. */
 >> +	__u32 pad;
 >> +};
 >> +
 >>   /**
 >>    * struct drm_panthor_dev_query - Arguments passed to 
DRM_PANTHOR_IOCTL_DEV_QUERY
 >>    */
 >> @@ -1010,6 +1132,371 @@ struct drm_panthor_tiler_heap_destroy {
 >>   	__u32 pad;
 >>   };
 >>
 >> +/**
 >> + * DOC: Performance counter decoding in userspace.
 >> + *
 >> + * Each sample will be exposed to userspace in the following manner:
 >> + *
 >> + * 
+--------+--------+------------------------+--------+-------------------------+-----+
 >> + * | Sample | Block  |        Block           | Block  | 
Block           | ... |
 >> + * | header | header |        counters        | header | 
counters        |     |
 >> + * 
+--------+--------+------------------------+--------+-------------------------+-----+
 >> + *
 >> + * Each sample will start with a sample header of type @struct 
drm_panthor_perf_sample header,
 >> + * providing sample-wide information like the start and end 
timestamps, the counter set currently
 >> + * configured, and any errors that may have occurred during sampling.
 >> + *
 >> + * After the fixed size header, the sample will consist of blocks of
 >> + * 64-bit @drm_panthor_dev_query_perf_info::counters_per_block 
counters, each prefaced with a
 >> + * header of its own, indicating source block type, as well as the 
cycle count needed to normalize
 >> + * cycle values within that block, and a clock source identifier.
 >> + */
 >
 > At first I was a bit confused about this header, because I could not 
find it anywhere in the spec.
 > Then I realised it's been devised specifically for user samples. Is 
it really impossible for
 > user space to be able to pick up these values from the FW sample 
itself, other than the
 > timestamp and cycles values? I think as of lately some of these can 
also be queried from UM.

That's right, this is done specifically for user samples. Going through
all of the fields, the only one that is easily obtainable from userspace
would be the timestamp_end_ns, since it will be present in the counter
header (after some adjustment).

Starting from the sample header, the flags are a catch-all if we want to
indicate to the user that something has gone wrong, and there is no
separate mechanism to report this.

The block set is technically known by userspace, but not reported
anywhere. Having it as part of the sample header allows for simpler
userspace parsing.

The user data is effectively a way of tagging a sample. Let's say you
make a manual session, then sample multiple times, and stop it. The user
data gives you a way of attaching some user-relevant data to each of
these samples in the ring buffer. This could be something like the frame 
number, or even a pointer to some userspace data. The kernel does not 
interpret this in any way.

Together, having the block set and the user data allows for context-less 
parsing: upon receiving a sample, you can read the header, obtain the 
tracking structure, and then walk the sample looking at each block 
header to gain full context of the data you are trying to read.

For the cycle counts, I haven't seen a good way of knowing how many
cycles elapsed over the sampling period from userspace, given that the
precise moment the sample was taken was controlled by the firmware, and 
devfreq may have kicked in several times while sampling.

Looking at the block header, the block type also facilitates doing more
context-less parsing. I see that you've commented on having the FW ring
buffer handling in the kernel on another patch, and the rationale is as 
follows: we have tried doing something similar with one of the earlier
performance counter interface in mali_kbase with the vinstr interface.
Implementing the userspace for it was very difficult, and the interface
was not at all flexible to changes in the arch spec, the underlying
hardware or the firmware.

However, for CSF, we have had three new counter blocks added to date. 
These are tied not to the HW revision but to the firmware. Having the 
kernel be in charge of interpreting what blocks are available and their 
offsets allow us to not break existing userspaces when this happens, 
along with decoupling userspace from the layout algorithm. There is no 
good way to indicate to userspace when the layout changes in 
non-backwards compatible ways.

Not to mention, the kernel already has to do some interpretation of the 
spec in order to do spec-compliant sampling: the PRFCNT_EN must be 
zeroed after a FW sample is consumed, so we need to know its offset. If 
the metadata block is present, the sample_reason must also be zeroed to 
signal the same. And finally, for the user to get a useful timestamp, we 
have to adjust the MCU timestamps to the GPU timestamps, so we need to 
know their offset too.

Minimal kernel interepretation of the data also allows us to do certain 
optimizations with the memory layout without having to change the 
underlying layout algorithm. We can ignore the effect of sparseness on 
the shader core counter layout, which on platforms like the Rock 5B can 
lead to significant memory savings.

And finally, perhaps the weakest argument is that we have multiple 
userspaces, and moving a lot of the complexity to userspace may cause 
more problems. We cannot regress libGPUCounters [1], which is used as 
part of external projects already, and having two independent 
implementations increases the risk of divergence.

Hopefully that clears up the major reasons for the uAPI design we have 
chosen here

[1]: https://github.com/ARM-software/libGPUCounters

 >> +/**
 >> + * enum drm_panthor_perf_block_state - Bitmask of the power and 
execution states that an individual
 >> + * hardware block went through in a sampling period.
 >> + *
 >> + * Because the sampling period is controlled from userspace, the 
block may undergo multiple
 >> + * state transitions, so this must be interpreted as one or more 
such transitions occurring.
 >> + */
 >> +enum drm_panthor_perf_block_state {
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN: The state of this block 
was unknown during
 >> +	 * the sampling period.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN = 0,
 >> +
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_ON: This block was powered on for 
some or all of
 >> +	 * the sampling period.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_BLOCK_STATE_ON = 1 << 0,
 >> +
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_OFF: This block was powered off 
for some or all of the
 >> +	 * sampling period.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_BLOCK_STATE_OFF = 1 << 1,
 >> +
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE: This block was 
available for execution for
 >> +	 * some or all of the sampling period.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_BLOCK_STATE_AVAILABLE = 1 << 2,
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE: This block was 
unavailable for execution for
 >> +	 * some or all of the sampling period.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_BLOCK_STATE_UNAVAILABLE = 1 << 3,
 >> +
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL: This block was executing 
in normal mode
 >> +	 * for some or all of the sampling period.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_BLOCK_STATE_NORMAL = 1 << 4,
 >> +
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED: This block was 
executing in protected mode
 >> +	 * for some or all of the sampling period.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_BLOCK_STATE_PROTECTED = 1 << 5,
 >> +};
 >> +
 >> +/**
 >> + * struct drm_panthor_perf_block_header - Header present before 
every block in the
 >> + * sample ringbuffer.
 >> + */
 >> +struct drm_panthor_perf_block_header {
 >> +	/** @block_type: Type of the block. */
 >> +	__u8 block_type;
 >> +
 >> +	/** @block_idx: Block index. */
 >> +	__u8 block_idx;
 >> +
 >> +	/**
 >> +	 * @block_states: Coarse-grained block transitions, bitmask of enum
 >> +	 * drm_panthor_perf_block_states.
 >> +	 */
 >> +	__u8 block_states;
 >> +
 >> +	/**
 >> +	 * @clock: Clock used to produce the cycle count for this block, 
taken from
 >> +	 * enum drm_panthor_perf_clock. The cycle counts are stored in the 
sample header.
 >> +	 */
 >> +	__u8 clock;
 >> +
 >> +	/** @pad: MBZ. */
 >> +	__u8 pad[4];
 >> +
 >> +	/** @enable_mask: Bitmask of counters requested during the session 
setup. */
 >> +	__u64 enable_mask[2];
 >> +};
 >> +
 >> +/**
 >> + * enum drm_panthor_perf_sample_flags - Sample-wide events that 
occurred over the sampling
 >> + * period.
 >> + */
 >> +enum drm_panthor_perf_sample_flags {
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_SAMPLE_OVERFLOW: This sample contains 
overflows due to the duration
 >> +	 * of the sampling period.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_SAMPLE_OVERFLOW = 1 << 0,
 >> +
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_SAMPLE_ERROR: This sample encountered an 
error condition during
 >> +	 * the sample duration.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_SAMPLE_ERROR = 1 << 1,
 >> +};
 >> +
 >> +/**
 >> + * struct drm_panthor_perf_sample_header - Header present before 
every sample.
 >> + */
 >> +struct drm_panthor_perf_sample_header {
 >> +	/**
 >> +	 * @timestamp_start_ns: Earliest timestamp that values in this 
sample represent, in
 >> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
 >> +	 */
 >> +	__u64 timestamp_start_ns;
 >> +
 >> +	/**
 >> +	 * @timestamp_end_ns: Latest timestamp that values in this sample 
represent, in
 >> +	 * nanoseconds. Derived from CLOCK_MONOTONIC_RAW.
 >> +	 */
 >> +	__u64 timestamp_end_ns;
 >> +
 >> +	/** @block_set: Set of performance counter blocks. */
 >> +	__u8 block_set;
 >> +
 >> +	/** @pad: MBZ. */
 >> +	__u8 pad[3];
 >> +
 >> +	/** @flags: Current sample flags, combination of 
drm_panthor_perf_sample_flags. */
 >> +	__u32 flags;
 >> +
 >> +	/**
 >> +	 * @user_data: User data provided as part of the command that 
triggered this sample.
 >> +	 *
 >> +	 * - Automatic samples (periodic ones or those around non-counting 
periods or power state
 >> +	 * transitions) will be tagged with the user_data provided as part 
of the
 >> +	 * DRM_PANTHOR_PERF_COMMAND_START call.
 >> +	 * - Manual samples will be tagged with the user_data provided 
with the
 >> +	 * DRM_PANTHOR_PERF_COMMAND_SAMPLE call.
 >> +	 * - A session's final automatic sample will be tagged with the 
user_data provided with the
 >> +	 * DRM_PANTHOR_PERF_COMMAND_STOP call.
 >> +	 */
 >> +	__u64 user_data;
 >> +
 >> +	/**
 >> +	 * @toplevel_clock_cycles: The number of cycles elapsed between
 >> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
 >> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the 
top-level clock if the
 >> +	 * corresponding bit is set in 
drm_panthor_perf_info::supported_clocks.
 >> +	 */
 >> +	__u64 toplevel_clock_cycles;
 >> +
 >> +	/**
 >> +	 * @coregroup_clock_cycles: The number of cycles elapsed between
 >> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
 >> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the 
coregroup clock if the
 >> +	 * corresponding bit is set in 
drm_panthor_perf_info::supported_clocks.
 >> +	 */
 >> +	__u64 coregroup_clock_cycles;
 >> +
 >> +	/**
 >> +	 * @shader_clock_cycles: The number of cycles elapsed between
 >> +	 * drm_panthor_perf_sample_header::timestamp_start_ns and
 >> +	 * drm_panthor_perf_sample_header::timestamp_end_ns on the shader 
core clock if the
 >> +	 * corresponding bit is set in 
drm_panthor_perf_info::supported_clocks.
 >> +	 */
 >> +	__u64 shader_clock_cycles;
 >> +};
 >> +
 >> +/**
 >> + * enum drm_panthor_perf_command - Command type passed to the 
DRM_PANTHOR_PERF_CONTROL
 >> + * IOCTL.
 >> + */
 >> +enum drm_panthor_perf_command {
 >> +	/** @DRM_PANTHOR_PERF_COMMAND_SETUP: Create a new performance 
counter sampling context. */
 >> +	DRM_PANTHOR_PERF_COMMAND_SETUP,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_COMMAND_TEARDOWN: Teardown a performance 
counter sampling context. */
 >> +	DRM_PANTHOR_PERF_COMMAND_TEARDOWN,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_COMMAND_START: Start a sampling session on 
the indicated context. */
 >> +	DRM_PANTHOR_PERF_COMMAND_START,
 >> +
 >> +	/** @DRM_PANTHOR_PERF_COMMAND_STOP: Stop the sampling session on 
the indicated context. */
 >> +	DRM_PANTHOR_PERF_COMMAND_STOP,
 >> +
 >> +	/**
 >> +	 * @DRM_PANTHOR_PERF_COMMAND_SAMPLE: Request a manual sample on 
the indicated context.
 >> +	 *
 >> +	 * When the sampling session is configured with a non-zero 
sampling frequency, any
 >> +	 * DRM_PANTHOR_PERF_CONTROL calls with this command will be 
ignored and return an
 >> +	 * -EINVAL.
 >> +	 */
 >> +	DRM_PANTHOR_PERF_COMMAND_SAMPLE,
 >> +};
 >> +
 >> +/**
 >> + * struct drm_panthor_perf_control - Arguments passed to 
DRM_PANTHOR_IOCTL_PERF_CONTROL.
 >> + */
 >> +struct drm_panthor_perf_control {
 >> +	/** @cmd: Command from enum drm_panthor_perf_command. */
 >> +	__u32 cmd;
 >> +
 >> +	/**
 >> +	 * @handle: session handle.
 >> +	 *
 >> +	 * Returned by the DRM_PANTHOR_PERF_COMMAND_SETUP call.
 >> +	 * It must be used in subsequent commands for the same context.
 >> +	 */
 >> +	__u32 handle;
 >> +
 >> +	/**
 >> +	 * @size: size of the command structure.
 >> +	 *
 >> +	 * If the pointer is NULL, the size is updated by the driver to 
provide the size of the
 >> +	 * output structure. If the pointer is not NULL, the driver will 
only copy min(size,
 >> +	 * struct_size) to the pointer and update the size accordingly.
 >> +	 */
 >> +	__u64 size;
 >> +
 >> +	/** @pointer: user pointer to a command type struct. */
 >> +	__u64 pointer;
 >> +};
 >> +
 >> +
 >> +/**
 >> + * struct drm_panthor_perf_cmd_setup - Arguments passed to 
DRM_PANTHOR_IOCTL_PERF_CONTROL
 >> + * when the DRM_PANTHOR_PERF_COMMAND_SETUP command is specified.
 >> + */
 >> +struct drm_panthor_perf_cmd_setup {
 >> +	/**
 >> +	 * @block_set: Set of performance counter blocks.
 >> +	 *
 >> +	 * This is a global configuration and only one set can be active 
at a time. If
 >> +	 * another client has already requested a counter set, any further 
requests
 >> +	 * for a different counter set will fail and return an -EBUSY.
 >> +	 *
 >> +	 * If the requested set does not exist, the request will fail and 
return an -EINVAL.
 >> +	 */
 >> +	__u8 block_set;
 >
 > How do we know for a given hardware model, what block sets it 
supports? When I wrote the
 > implementation of perfcnt for Panthor we're using at Collabora right 
now, that was a question
 > I could never find an answer for in the spec.

Unfortunately, there is no good way to query it from the hardware, and 
it's not considered a breaking change to add or remove support for a set 
of a particular block between GPU revisions. My intent will be to 
hardcode a data table into panthor_perf.c eventually, based on the GPU ID.

 >
 >> +	/** @pad: MBZ. */
 >> +	__u8 pad[7];
 >> +
 >> +	/** @fd: eventfd for signalling the availability of a new sample. */
 >> +	__u32 fd;
 >> +
 >> +	/** @ringbuf_handle: Handle to the BO to write perf counter sample 
to. */
 >> +	__u32 ringbuf_handle;
 >
 > If UM is in charge of creating this BO, how would it know how big it 
should be? I suppose this
 > would be conveyed by perf info returned by panthor_ioctl_dev_query().

That is the intent, yes. Currently this is the only "implicit" part of 
the interface, where we expect the user to calculate the sample size on 
their own, based on the data passed in dev_query. I'm wondering if it 
wouldn't be simpler to, alongside the current dev_query fields, to also 
provide the user with the sample size and the block size directly.

 >> +	/**
 >> +	 * @control_handle: Handle to the BO containing a contiguous 16 
byte range, used for the
 >> +	 * insert and extract indices for the ringbuffer.
 >> +	 */
 >> +	__u32 control_handle;
 >> +
 >> +	/**
 >> +	 * @sample_slots: The number of slots available in the 
userspace-provided BO. Must be
 >> +	 * a power of 2.
 >> +	 *
 >> +	 * If sample_slots * sample_size does not match the BO size, the 
setup request will fail.
 >> +	 */
 >> +	__u32 sample_slots;
 >
 > Does that mean that the number of user bo slots can be different than 
the kernel ringbuffer one?
 >
That's correct. I don't think there is a compelling reason to require 
both of them to be the same. Userspace could for instance decide to do a 
lot of samples, once a frame, periodically or tied to some relevant 
event, and interpret all of the counters in one go at the end. That way 
it does not matter how big/small the kernel to FW ring buffer is, just 
how much space the user chose to allocate for their BO.

 >> +
 >> +	/**
 >> +	 * @control_offset: Offset into the control BO where the insert 
and extract indices are
 >> +	 * located.
 >> +	 */
 >> +	__u64 control_offset;
 >> +
 >> +	/**
 >> +	 * @sample_freq_ns: Period between automatic counter sample 
collection in nanoseconds. Zero
 >> +	 * disables automatic collection and all collection must be done 
through explicit calls
 >> +	 * to DRM_PANTHOR_PERF_CONTROL.SAMPLE. Non-zero values will 
disable manual counter sampling
 >> +	 * via the DRM_PANTHOR_PERF_COMMAND_SAMPLE command.
 >> +	 *
 >> +	 * This disables software-triggered periodic sampling, but 
hardware will still trigger
 >> +	 * automatic samples on certain events, including shader core 
power transitions, and
 >> +	 * entries to and exits from non-counting periods. The final stop 
command will also
 >> +	 * trigger a sample to ensure no data is lost.
 >> +	 */
 >> +	__u64 sample_freq_ns;
 >> +
 >> +	/**
 >> +	 * @fw_enable_mask: Bitmask of counters to request from the FW 
counter block. Any bits
 >> +	 * past the first drm_panthor_perf_info.counters_per_block bits 
will be ignored.
 >> +	 */
 >> +	__u64 fw_enable_mask[2];
 >> +
 >> +	/**
 >> +	 * @csg_enable_mask: Bitmask of counters to request from the CSG 
counter blocks. Any bits
 >> +	 * past the first drm_panthor_perf_info.counters_per_block bits 
will be ignored.
 >> +	 */
 >> +	__u64 csg_enable_mask[2];
 >> +
 >> +	/**
 >> +	 * @cshw_enable_mask: Bitmask of counters to request from the CSHW 
counter block. Any bits
 >> +	 * past the first drm_panthor_perf_info.counters_per_block bits 
will be ignored.
 >> +	 */
 >> +	__u64 cshw_enable_mask[2];
 >> +
 >> +	/**
 >> +	 * @tiler_enable_mask: Bitmask of counters to request from the 
tiler counter block. Any
 >> +	 * bits past the first drm_panthor_perf_info.counters_per_block 
bits will be ignored.
 >> +	 */
 >> +	__u64 tiler_enable_mask[2];
 >> +
 >> +	/**
 >> +	 * @memsys_enable_mask: Bitmask of counters to request from the 
memsys counter blocks. Any
 >> +	 * bits past the first drm_panthor_perf_info.counters_per_block 
bits will be ignored.
 >> +	 */
 >> +	__u64 memsys_enable_mask[2];
 >> +
 >> +	/**
 >> +	 * @shader_enable_mask: Bitmask of counters to request from the 
shader core counter blocks.
 >> +	 * Any bits past the first 
drm_panthor_perf_info.counters_per_block bits will be ignored.
 >> +	 */
 >> +	__u64 shader_enable_mask[2];
 >> +};
 >> +
 >> +/**
 >> + * struct drm_panthor_perf_cmd_start - Arguments passed to 
DRM_PANTHOR_IOCTL_PERF_CONTROL
 >> + * when the DRM_PANTHOR_PERF_COMMAND_START command is specified.
 >> + */
 >> +struct drm_panthor_perf_cmd_start {
 >> +	/**
 >> +	 * @user_data: User provided data that will be attached to 
automatic samples collected
 >> +	 * until the next DRM_PANTHOR_PERF_COMMAND_STOP.
 >> +	 */
 >> +	__u64 user_data;
 >
 > What is this user data pointer being used for in the samples? What 
kind of information would
 > it normally add by having it written into the user samples?

Hopefully I have answered this above, but to re-iterate: it gives 
context as to what sample is associated with what request. If one 
chooses the model of interpreting all of the performance data at the end 
of the content run, then this allows the user to disambiguate all of the 
samples. This eases userspace parsing by not requiring the user to keep 
track of how many samples they have consumed and what event corresponds 
to which sample request.

 >> +};
 >> +
 >> +/**
 >> + * struct drm_panthor_perf_cmd_stop - Arguments passed to 
DRM_PANTHOR_IOCTL_PERF_CONTROL
 >> + * when the DRM_PANTHOR_PERF_COMMAND_STOP command is specified.
 >> + */
 >> +struct drm_panthor_perf_cmd_stop {
 >> +	/**
 >> +	 * @user_data: User provided data that will be attached to the 
automatic sample collected
 >> +	 * at the end of this sampling session.
 >> +	 */
 >> +	__u64 user_data;
 >> +};
 >> +
 >> +/**
 >> + * struct drm_panthor_perf_cmd_sample - Arguments passed to 
DRM_PANTHOR_IOCTL_PERF_CONTROL
 >> + * when the DRM_PANTHOR_PERF_COMMAND_SAMPLE command is specified.
 >> + */
 >> +struct drm_panthor_perf_cmd_sample {
 >> +	/** @user_data: User provided data that will be attached to the 
sample.*/
 >> +	__u64 user_data;
 >> +};
 >> +
 >>   #if defined(__cplusplus)
 >>   }
 >>   #endif
 >> --
 >> 2.25.1
 >
 > Adrian Larumbe

Kind regards,
Lukas Zapolskas
