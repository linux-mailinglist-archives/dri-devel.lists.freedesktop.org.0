Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77674A25FB7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 17:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D165510E4FC;
	Mon,  3 Feb 2025 16:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Ot5YHTNj";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ot5YHTNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665A510E4E6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 16:18:39 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fHQ5vGuvuYiD8oWnj4++J7KZ4uh8H+kBmJvz51dYquZSMYzb1NhxIXnXxgd+cJodt2RJeGZEQqkRNpH9XWSrstm7qTDo+m7X3F6P9SitakPQEtDqtDSC/sAb/xLAaW3SoZlQesWas1RL2gnKa9AUG56sfkZQOOF+pQ77tI3CNaP/PwRsCXHi/d0GOJdUBrxcOTMO4vH0VjnwzDeA1drk4Nej+9eSc/MMkhl8x+LHzK79UpgTA+PKgVC+fTw5tGJrneNc59bQEIhHGSwk+K1JVaswvlWF+13/H53EpTv1cug92HFKDXbJfPFS8JEAVM7dqFsG1FrrX05fQ/ehUmWPlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zifuO2tonzJmwTlnuAPbsPW3uAohnLSw73u78DuPaO4=;
 b=dhH32rKHyIRWll0M4DjbKiCF2ZJSSw9ZVC6ujGk+cHTIOpkCUhtOKiuSdDnj+mD5L0Kel6EPVA9AWdJChY4vrwNm+L06U1RgHIhgMuPpkI0UUlV9qDv11kfG0iaTitTcjcTBDjj0VIxioViW10JFHz6f8d0/89yuVq9R/9v0UF9yZuHKS/+qj6m0F0B4jl2kQ7bGlcS99Pax+3eIXzKFyEZDsiBL+6IvCDiiCW8HFNtCiUeNG3NnzCuM1JIdUNTt6/EjHkwIi4DIR3L90tP4F+xsEzCQ30psLbiynFDuoGMPlmo3nTW1vJeyoKt32ARtJZI79qcn+pj1PuMtlmy5sw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zifuO2tonzJmwTlnuAPbsPW3uAohnLSw73u78DuPaO4=;
 b=Ot5YHTNjhoTXCRWAnQr8nQdCVsWxCQIgqG6vvkxQiB2GzWGQ75VAeR7WSEzT/z4oIM7ACMfw2vkDNTCWpQ3FkAo0kMF03nkSOS7QkIDjaFlcHIbTD7EDS0B6S2HPmKIE9HYZnyDGxjbOfqdxeNyhguXdIxNmVX+4FqGUfOfHI5k=
Received: from AS4P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::6)
 by AM7PR08MB5350.eurprd08.prod.outlook.com (2603:10a6:20b:101::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Mon, 3 Feb
 2025 16:18:32 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::54) by AS4P250CA0017.outlook.office365.com
 (2603:10a6:20b:5e3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Mon,
 3 Feb 2025 16:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 3 Feb 2025 16:18:32 +0000
Received: ("Tessian outbound cd7bee7c735c:v560");
 Mon, 03 Feb 2025 16:18:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ffce7ae0a8ee4c9e
X-TessianGatewayMetadata: caav6sjM225plv59iPv93LOXIqRgvcp7ocs5QZSYAUrcB3444h2EljknyNTWsu9VTmxeE2YNqgNmJCfqMsjrrRlwk97BZkjpqVVv4KiLHAQi+rX3seLU9dXdHLzg54WWoB+HsfPZGJJdfrfpX0wzfbDGea4BMoPhWHdhAJKtohY=
X-CR-MTA-TID: 64aa7808
Received: from L2b18d4476b64.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D1E5D331-30CD-404A-BC9F-4703CF12BC90.1; 
 Mon, 03 Feb 2025 16:18:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L2b18d4476b64.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Feb 2025 16:18:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RllW1FR3d9tBvriL6+4KdSdIT418Nw1sCn0SOt8D0Crbek47DdFDFajzwwWWfSJ2q98oVYrEGBMjaQmuuHCr5gT3DnUgefvaZnJX2R5ViSx5XANhIW+cCeIDPimx2R7MdfWUMsr+lbPmMrv5g10vcbSxIG4rG+ZIA0bLv6OdBLWuQ3fNxWvGfA1FbnIarg9cqRL6RLmF9RKCe37fkDkQoR3gA0pjWSEhvotFsUGcxEmXlak/SqIZPA9QebRIqy57yd6YxWu97DtJH4lc7ezi79Et/GEY79ZKjZ8Dgtd472+ebWlTNrYjkZH18beGLXxgDFynaJ3V7Rs7Tkbw6QIQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zifuO2tonzJmwTlnuAPbsPW3uAohnLSw73u78DuPaO4=;
 b=wMcEZIIWJbpXoaGE6A+R3Gw/6LuGu7Iulnfl/aw4zAJibVBaEwU3iFyM61B1jzYNVHSfaPSUoDvN5w2oMoiX2qwnukePOTyb1VvWOORR7c/OBLEe7dREyeb0QZCMQRai3nFuG9CzU3N1acbDfOSYj14t3xUEqo+qglBb+YiNaMVAi6v+T/YirVjzAUc125KCo+upj8bhSFsq7bKS8h2PzndDvs4XR09Bo2vTg9j/YV79udHx0szGiZxVAMxUnOQBb++qikPq9SiNTEAV7w9+PBht1AAaxKbR4E7W8vWzeQ9f/BxWXFF8O+d14DYuWVP95eoIZdr8Nc/zN8/+Gyzcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zifuO2tonzJmwTlnuAPbsPW3uAohnLSw73u78DuPaO4=;
 b=Ot5YHTNjhoTXCRWAnQr8nQdCVsWxCQIgqG6vvkxQiB2GzWGQ75VAeR7WSEzT/z4oIM7ACMfw2vkDNTCWpQ3FkAo0kMF03nkSOS7QkIDjaFlcHIbTD7EDS0B6S2HPmKIE9HYZnyDGxjbOfqdxeNyhguXdIxNmVX+4FqGUfOfHI5k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by DU0PR08MB9108.eurprd08.prod.outlook.com (2603:10a6:10:47a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 16:18:22 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 16:18:22 +0000
Message-ID: <c5f1ac22-6535-4917-9155-5e0d8fd9a74d@arm.com>
Date: Mon, 3 Feb 2025 16:18:20 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <20250130232004.GA1818629-robh@kernel.org>
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <20250130232004.GA1818629-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0272.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::7) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|DU0PR08MB9108:EE_|AM4PEPF00027A6C:EE_|AM7PR08MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c61669e-1c6e-4766-f750-08dd446e6766
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aVVkc2RhZ3NwTDJySlNkMU9icmY0bmp2aHdYL2c4TzhVV1FpeFRLbUtSQ0tN?=
 =?utf-8?B?VDZkUllzWTNxa0pmbUdEcDExQm5YTUkwSHR0bXRDZlV4ME9aaEQwc3BVN0sz?=
 =?utf-8?B?RERPbTJ4a2habGtNRGRnbms0ems3VUYyZW1zNzNHN05GaTI4cGp6ejh5QkFL?=
 =?utf-8?B?b29oUFpOUDA2bDIyR08zMFFQQ3BCSS9HL3RGQXVaUEx0WDRUNm1hbUZydTNR?=
 =?utf-8?B?anBzSFRwQXBVaGJwVk5tRDRLU3NnQW1XUnVSSFU4ZVVIbzdwZVpxcjZTejhL?=
 =?utf-8?B?K0pDTHM4SW5zeDdWOXRnWE5rNlIyN0NkRDF0V0ZuRXpIQUhnRkhhdFc2VVVn?=
 =?utf-8?B?cEhoYWVJV1VNSWFwSXVPOHJJVitZSzk4TVNMd3FjVWxqOVVrNm1UNUN5STlr?=
 =?utf-8?B?SVY4dUhTSU5OeUJUeW9Yd2kvV1ZLbVF4SFlKRzhVODB5RHNFQTFsOE5QNTZh?=
 =?utf-8?B?VnBSSUk5S3VhdVdnWG1uY2dzT3hhOXhTMk1idDB0VkVJbUpWeU5GM2laRnZK?=
 =?utf-8?B?N1psUDJCVGhwOEFXWW5WdktpN0IyOCs4L1JYQm5yRnFxL1V5enE4T0xFZ3Ir?=
 =?utf-8?B?QVZDSlY3VHNmUDNTdlA4RElnQkFzenFDMFZ3ZGowa0p3L2RRRTU3Njlxc0pi?=
 =?utf-8?B?U3RsRWNpakhQem1XNlBNRWV3NXpSR0wwbm8xb0xxR0I1cXkrT1RoVTJHSnZ2?=
 =?utf-8?B?SSs4SE9tNitWOEh4WTlJcUdwRVZ6V0NzUExPQytHMzA3UE9BVSt6N2d4djhM?=
 =?utf-8?B?UWJMamtTZnRscmdWT3M3cGdCc2FXWjNxT0hqYlJZSXd6dnVuWWM3U0xGNmFK?=
 =?utf-8?B?Ty8xcUcyaEl2R3cxc2VKS1JIcGpPWFZYRUZTQ3pTbjhkWGg5d2JVQUlCcVRt?=
 =?utf-8?B?aFhkTkJsbDcxaEZhZldXQUp0Z1dWMmpmK08rZno5SUtnd1V3V1JKY21QSElt?=
 =?utf-8?B?TW5lMHJ2RWtFdWZ2KzZtR0JZMU8wN0d1QlB5cUJXejBwdG1HZTFFOVYyTUxH?=
 =?utf-8?B?bkI2WjN2MHdTRU81RVJ3K3lIa29uOTJIdmg5YWFCSGt3UjdmZ0ZoYkk4ZkFE?=
 =?utf-8?B?WVF1TkttTnZJejRpNFUzb0hnbXplUzlML2gyVDdGY3BaOUk1VGYwWHdTY2V5?=
 =?utf-8?B?YnBXem5UNFhDTFZEVDlvSXEwcUF4VVhYVlprZWUwUXoxaitpcGx0VGcxZHky?=
 =?utf-8?B?MGhGVFpNcU1DNnpsaUpuZXBXTGpUSFI5WG1FcXBOQmhaVVpIWFM0Tktlejht?=
 =?utf-8?B?SEVQT2o3RmdTRGF0Zi9LZmZGeFBmSVZPWnpYWkpUd2M2MC8xVHk0M0Zqc1lC?=
 =?utf-8?B?TUt2NmpJYkxNM1g0RzZHbUxuaVFhN00vb0lTeDJENkRTMXV5cC80dGZ4U1hj?=
 =?utf-8?B?TmpOcG9JcUVLVEhnUFQybHdNcWhFSTYzUzJmeHBmbk91SDVSQ3JOQkI5L3ZZ?=
 =?utf-8?B?R0hDWHI1RkxjK01UZDE0VjF2QkFiMTQyYmQxcVJGNklkWFRIMVNvZFdPbjd5?=
 =?utf-8?B?ejFhRUJRZjgzSGZUdk5TUDBOSVhUelN2dk9ZNWJUM3F4RW11RzJPRzJJQ2xV?=
 =?utf-8?B?ZzJiZnk2Y2RPVmlXTDVEVVRaWjJCZE9UZ1p2SGNWT3B1eWR6b21yNCtLb2l3?=
 =?utf-8?B?QTRJUnF6VHVpRVB1SVZzbjAvaisvcFY3VUFaWjZpOXNzRFV4UWd0ZURENE0v?=
 =?utf-8?B?bXFoT1RMcUU4ekpxQUl1VW5KcnFLNm9paytrTTZJa216WmMrRmR0dkZKOFZD?=
 =?utf-8?B?Uk1adkpaVnFyZlFtQW5XMnhSTUI1L29PT2cwZGlnbmppQ0RHdDVyTU1YUUI3?=
 =?utf-8?B?UzVOa0lvMHVJNG1RQ0dzQT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS4PR08MB7925.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9108
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];
 domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 70284272-a168-4ef5-78be-08dd446e6128
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|35042699022|82310400026|1800799024|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFpvV3hLMTEwVGFZb3pGSmZIaitlNDFMKzRWNlVpZzlZRGV2OEcwcXR1dUE5?=
 =?utf-8?B?OHFaS3krOTVsRjBlc0ZHRDRybTlERmx6cjZ5L08weFNQZFA1b0Z0MTRTMkVz?=
 =?utf-8?B?K2x6M2dMQVpzSFFaK0NuWkVMWnlyN1Bid3VjWndCWEZHcHJrV3lGVlpsNmUz?=
 =?utf-8?B?Zm84SDJVMU5NazNFa1FEbklrMWg5dTJleVJpeE8rRE9xUzVSajNEeGhJa1p4?=
 =?utf-8?B?c1h4TXR1VXhvRXFuRWZQWkhKWnkyb1krSjUvMml1UGdicVBqaW1OYmZ6cEdp?=
 =?utf-8?B?ZjlEOFRWbGpwcEllYWJtL2pUVHZSVE1FOVhQQXBGSUJOVjJIanBRV2ZNVVdJ?=
 =?utf-8?B?OXN5TUo4NEExUjdIcmx2ZlorTzdlMzVxSXFMcVFvekFMbGJhdFYxWlZ1Tktm?=
 =?utf-8?B?T1Z1YTVET3pBeFo3RDFsYWxVTXpYRkg4THRjek1haUdIdG13aWJETTNYNktT?=
 =?utf-8?B?aFdKZE5BekdSZkpJc29mYkJtaFhBNk5NSVNqNlRvT080c2FZVDZGdnVjY1Fz?=
 =?utf-8?B?djVieW5kUW94amJoVEh0ZmNCUzBDUmhoZzN5SXlDZnFiSGZlS1hGTTJpN3Rw?=
 =?utf-8?B?QXpmRUdldk5ORk1LNmR1dUNGMklQSFR0amJiQWkrUUFkR2cvSVNLYTNXVnEr?=
 =?utf-8?B?Y0VTQk83Y3VUQjBQYXNIaW92S2VXOW1keG1RQnp0U3E2M2ZZZDQ3cW5iTkx1?=
 =?utf-8?B?NTlyblhYbFZUa0UyMkVUMlVYVVdYODdTajhkL09CSDBPLytGa0xRTElHNFRE?=
 =?utf-8?B?NnhlSGtLSTBJOVBXcFJQcStEUG9PK0pyd1Y2K1VGdlJYaHVWcXRzNkFMM3Z0?=
 =?utf-8?B?aS9YcWYvYTJaMGtsMDVVWHMzTzdpWWhqSU9vSWZoZTBXSEdyUXpaV29wSHZm?=
 =?utf-8?B?NUwwc2VVRzFYWHlzb0sxN3gxcEpMMXBpQmNIQ0R0NURsaHQxaXM3UFFBK21V?=
 =?utf-8?B?UUsxb2djTVdXSUZXNXdNSk1xQlhjby9lQzQ0SlVQL1F1cVZLM2RzVVZLN29s?=
 =?utf-8?B?ZHlzR3p5OGlESmNNYUkxbm5zd3RybVczSW9ZVlhYb29xNVp1bzFBYkpYVVNl?=
 =?utf-8?B?MDdWQjlaUkIzd1poMjRGa1lBM0R1b1hWc2hLYXpFV09BNzJnTzI0QXlySFVO?=
 =?utf-8?B?VERHK3drRFJpeGJ3MFBDOCtxZ1ZhZ2ZqcFZpaXFqWXVTVDA0QWJWWHpOcGoy?=
 =?utf-8?B?Qm5SVXlqNHNXODBPN3orK0NwWTZlcnZtbE1KLzVILy9xVmZuVVc4OEVGMGF5?=
 =?utf-8?B?aHpUNVkwUjQ2cG9xdGJ2aG1tTyt0OU1PaG1hREl6OEhhdG1qWldCQXhVc1hP?=
 =?utf-8?B?ejVyYlNzdDZHNHBEK2kyZmZiZHpYb2tKV3pKUTBmUExnbUMyZ0Vud2ZPQ1Iz?=
 =?utf-8?B?QU1FU25hUkVZUUtNQWROZU1mRTFkWWYyZzhRTkJITjQ4UEdybXpFbWkyai83?=
 =?utf-8?B?Skx6ZnFXQUtmVlBQTlM0bzIxRGhvdWZEVHpVOTF3KzNkUWZiV0EyQUV1WDNr?=
 =?utf-8?B?UVowNmQ3SWZoZkNDd3l1WlRkRGlrMkcwWGRacEJIUFZVVmF5NFBPdVMyOTEw?=
 =?utf-8?B?ekRTaFNFc1pNRGJsTTFwdWZnTDd6UUZIOXRIYkxBQ2xFVHVvRjFmWDBZclk1?=
 =?utf-8?B?UG1tck8yTDdFaWs0NVNvNCtDTU94ZGE3M0RuMjQza1ZtaWlWMlNSL1A4cnhF?=
 =?utf-8?B?bG82Y3JZMTZJUHJneVhyUHo5UUVSRmxaeS94dnlsOFZ2eFk1QnJ1b3lkdjc2?=
 =?utf-8?B?RU80My8yZnlNa3JIT00reWkwZFdjWnFGT01VUjhVT0U1WEF4L3BXSlMvTTZO?=
 =?utf-8?B?TEd0OW02dCtNT0NZU2swV2VTNnVqZ2tLdDVIOC9yNzU4MmY3VG9HbGNWUmtX?=
 =?utf-8?B?NWVUZU1qSTM3V2hybkZZenZNZ1dtMDBaSis0TlhlZnNwNjNVMVhlcG8vR0Q5?=
 =?utf-8?Q?wuG+Xo+ttHk=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(35042699022)(82310400026)(1800799024)(14060799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:18:32.7589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c61669e-1c6e-4766-f750-08dd446e6766
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5350
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

Hi Rob

On 30/01/2025 23:20, Rob Herring wrote:
> 
> Why would panthor need CMA, it has an MMU.
> 
> In any case, I agree with Maxime that this is redundant.
> 

This is correct, the GPU has an MMU. The reason I introduced this custom
CMA DTB entry is to allow creation of a standalone DMA heap which can be
retrieved by Panthor using the API exposed by:
-
https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t

My understanding might be wrong, I am under the impression that current
CMA driver only has `dma_contiguous_default_area` as standalone
carved-out heap and we cannot have more than one. Please correct me if
this is invalid.

With the DMA Heap API I based the RFC on, Panthor kernel driver does not
manage the protected heap itself, it relies on an exporter to do it. On
some system the secure heap will communicate with a secure FW, on others
it will be a carved-out memory with restricted access. This is
integration specific. Panthor kernel driver will expect to import a DMA
buffer obtained from a heap.

For the development of the protected mode feature, I decided to modify
the CMA driver to create a standalone DMA heap and allocate a DMA buffer
from it. It helped me abstract the importing of a heap in Panthor kernel
driver. Someone may use a different heap driver to reproduce the setup.

* Additional information to help with the context:
Mali CSF GPU requires protected memory at the device level which does
not belong to a user space process in order to allow the FW to enter
protected mode. There is a single FW per GPU instance and the FW is
loaded a probe time.

Regards,
Florent
