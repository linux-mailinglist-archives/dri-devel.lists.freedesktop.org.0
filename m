Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4712FA8619B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEB110EBF9;
	Fri, 11 Apr 2025 15:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="G64XaIWW";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G64XaIWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCA610EBF9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:18:17 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D/lYM7csu2/Kd2DhsEkqnQhU9dY+j5bqUh87abPUiX3Szz5v5iDguXuaB7w14YUyBAOk+w5rgV3+cz+tcPz1UnX3F/qog7x/xf7oPoLvkqNWwDEPhOvs25Vdwck9ek1lJFuTYEQN+kIhKqpG3hn/zFmx1MY0ibCafp7sI0Jobb2+nYqPjd6KdCtu5gjkhLixxEbvDre+ABFMR7eTK7QYDanMdliMiUcm2kg4pgjubjwI3qI8o4WgXuuyIAcZDF8poAGZWQGsA8rkyOoFThf3SiOx3Q/fgHbdfaZQX+j9kKGOyn3tOpYfSZYfdaPWA4Lv2003cWP0xPYT1ieE+P0XrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12Gc1N0EVDRA5mfAOpeaXrCEqfE28HOO6/BPSMWtE+Y=;
 b=FAH3E0WPaqdUJY0HFergblFS28Tuvb4ccZyB0Z0yWPRKnFR2e0QAkku2RBAVO447TQEoB2OpXYW4zcgSZsVcFO0v8/ENzbWCYAftk9IfM24AkfMaE7cuZZQF44KAZ5spAGw+pG5tUs2GIBhNei0VuUbQAJPckykorq8m4Nv4aNgmT8cSMdE/0D4OG8UigVUdIfYUfEDw1Xn9QNl2pJKYjNV3AOD68oTDy7BddeSaMghZGNZ+VjRdsN/Sm2bCn4IUvcYwj0uVev63tqjAGnQjcyzTfiacqFGcGxwbv9HcNknyoPzcbp92qSvSxSM1zqnRuEmq/fcaTbJtiD61NXxBFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12Gc1N0EVDRA5mfAOpeaXrCEqfE28HOO6/BPSMWtE+Y=;
 b=G64XaIWWETmiX2EINWIn7eyQs7zlVxZ426EEGLD3XNdFr0I37cQg0gszDo3Sw1qriggwH6qd6rTbscNXgzDbkhSztMd1khvxLM2x510bAxhu7LOd93l87X1IXJ6lHJSe5+BwAPXWEh4w5fmYOHu7l9eUaoRZxD41OPFtanlQ2+c=
Received: from DB8PR06CA0028.eurprd06.prod.outlook.com (2603:10a6:10:100::41)
 by DB5PR08MB10234.eurprd08.prod.outlook.com (2603:10a6:10:4a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 15:18:07 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:100:cafe::5f) by DB8PR06CA0028.outlook.office365.com
 (2603:10a6:10:100::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Fri,
 11 Apr 2025 15:18:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Fri, 11 Apr 2025 15:18:07 +0000
Received: ("Tessian outbound 14ceab290806:v605");
 Fri, 11 Apr 2025 15:18:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d7011c13fc5b70a
X-TessianGatewayMetadata: w19jn3SWC3zxUgk+kRF7Gq1thN2J5IWKg9c5en1sH3K7d9UVQ7odrJtkOR8IsT7+6qKWyzZZoUyUzPrbvAl0RFzCyj9YH27hjevhWw4d9tpnVSO5PJfiRdCwq5SFU3/6bOju4Gte+KZfQAm+Eh2XHXKQgLAS0ppsXgrWuPf5yWE=
X-CR-MTA-TID: 64aa7808
Received: from L9dea3e09da4a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B85686A2-7045-4FE0-9BE3-13175B8F8B4F.1; 
 Fri, 11 Apr 2025 15:18:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L9dea3e09da4a.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Apr 2025 15:18:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKcSw5zxM71IeyzLUMhWeyic2ywXN0aZlXaWwfeXRyeMeDmUG/dCp7ajCPyeysuX3K/u/i0TmfOx5dyZE+h3V/nZ477Qa+T4mMiVSN2iEJ1EgjxSPhAWIkuCLqkeMa/Akc6PvF0Gh84N2iI/VSn53xAd16dWlSB3w+juZtH2ADMmjDtF1frhc/p0s9jo09advZqtkPN5ZnaCWWtDr8L4TN2jrtZTpJQ/uv78uXKtFJmrFtPXpnkWY8rQpzJGCl5LmNUN6cYO2P4HVk/E8c/ALffkH5L4GYbpLzcqFe2VjWd4AxIhpixwGmP6EqKcaTlxDADMFjSbW6UyUGC4Q8mlwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12Gc1N0EVDRA5mfAOpeaXrCEqfE28HOO6/BPSMWtE+Y=;
 b=CKw0paJDhQKoSbQ14PM7zT6U6RmmdDCj1WvsKC8+4t337ciW5ZIC9dV9P4qAtfbnFHEpfvwB3BgXFWyXosOh3KnwoKwGZj97SXS2Mzo0KN/FK8xb6bl4GjDxaCycWI3oxE1n/47GkMy161qJxwWZNDqAygRxBZOh8Z24litmKhHUpiMGxqw2HOwR6EGYRDxpeQ6eIEYJuseCIrawWYiMLKyJ+bkRrizJX6d/egSwNwGKXJRxCcYNUSkB+5/mQySZuJbrn5gbpyc6GrRzBUGXLPMmGJNf2lpCvEIqd7FGuRdRhQaNAVG14B1+PSSALiNCu9fkQ4Q+rALGkOy8o0pbxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12Gc1N0EVDRA5mfAOpeaXrCEqfE28HOO6/BPSMWtE+Y=;
 b=G64XaIWWETmiX2EINWIn7eyQs7zlVxZ426EEGLD3XNdFr0I37cQg0gszDo3Sw1qriggwH6qd6rTbscNXgzDbkhSztMd1khvxLM2x510bAxhu7LOd93l87X1IXJ6lHJSe5+BwAPXWEh4w5fmYOHu7l9eUaoRZxD41OPFtanlQ2+c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB6149.eurprd08.prod.outlook.com
 (2603:10a6:20b:29d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 15:17:58 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 15:17:57 +0000
Message-ID: <6994d307-17e7-453b-b5b9-99a422f73f66@arm.com>
Date: Fri, 11 Apr 2025 16:17:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Add 64-bit and poll register accessors
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250410163546.919749-1-karunika.choo@arm.com>
 <20250410184637.5e0613d2@collabora.com>
In-Reply-To: <20250410184637.5e0613d2@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0016.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB6149:EE_|DU2PEPF00028CFC:EE_|DB5PR08MB10234:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e80952-db17-46f8-62a7-08dd790c102f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?UWl1eGJlMHhQT2J3b2paaWxPUDRxd1ZPY0JoRGpVUUpUbEhPdHQvcURMQS95?=
 =?utf-8?B?SUh4dWkyeU1WYkRVTkEveHJrd0VDZGk1U2I2QmgwWlhZRGU4ODg2dFIwL3RP?=
 =?utf-8?B?ZDRmNkpuejBncGVDaDRVMXY0RmNCSFA0V2Y0NENSQktLNlNsT3I4MTZrMzEv?=
 =?utf-8?B?YXVZSFljZmtiVXo5bGNkY0JLbjRzcXVnbFhxaytxVlJBc2szV3NqOWtQZVVY?=
 =?utf-8?B?cWtZUS96bHV4ZzU3cGVkNm5sYlRwSi9mOGdFVFMrTWxicFRoSWlrYTRZRnBT?=
 =?utf-8?B?Z1lZRkdHckNpMTluOWE3cGxHcnFXN1NoQWV5NFJvMStEQWVhekJ4QzJ5MUh4?=
 =?utf-8?B?WXVJSEQwYVZPM1VrMjlsclN6YlNOREsvNThtbmtVZlcybkIzRjdzK3VkRm9z?=
 =?utf-8?B?YVBRNW11ZjROZTJWRzFGcDRMOW9PQ2FYeXhhUUN2aFlXODlHYWJZU1VTU3pB?=
 =?utf-8?B?UTl6Nk80aFVud0NFQzBRRFFIdzE5UFAvb2o3M1Y4WTU5RzkvZkZOUExGdzhj?=
 =?utf-8?B?eTdWb3dPUmdRMjR2bzdpTG8rYWFuSDJrRzVxakNwL0JXUldEMVdnZ1JYQjVC?=
 =?utf-8?B?QlpnVTRzWWhyNTlZOVZwRzgvU1pIRHJUKzZJeWlSWG01am1ycE5mWDdqbzJU?=
 =?utf-8?B?d3ZmQ1pEMnZDcmhVSmw4RU5UYTdmLytRa1NMdUVNVEdBUERRYVUxdk9sVUpK?=
 =?utf-8?B?OVlJTzRXbXNkUDRZRzBJK2piMEJtQjJpWlYreFN1L0lmck5IZ2pMMERvRzVL?=
 =?utf-8?B?N2JweEVHbzNEdnpYQ3drcVV2UkpiL2ZEOFZKVDBvdjR1S1JRTjRKcWZLRThN?=
 =?utf-8?B?WUhlN2I0WjdCOTJGTFl1QjNaeGJUZlZRQ0cxTjAramxvYW9rZmhtYkZ1Mysv?=
 =?utf-8?B?YXhHYUFjR3RaK05qQ0l5ZXBUT3FpaUtNSUEzREowR0dFOFd3TG9ZckNJenRE?=
 =?utf-8?B?M2Vpdms1RzZIR1VoQkZKVUxad3cvTlpnelh4L2dGY3JhVlNOQW1NZW9HZjcz?=
 =?utf-8?B?YU1OZTNsSGg0cHNlRDZmeUVNYkJpOGhKUWVva2ZvQTc4cnNBcXRoZHF2Wmlk?=
 =?utf-8?B?ZkJ5MmdYSjk4YnA2Rk92dDM3SHlRdXRDM1M4Q3E5elhqTU54OXZzWFpEbjFK?=
 =?utf-8?B?dU81bFdQbGk1UXJ4SEJtYVFxQ1UzdlVVRE9jRzhkOXJoNjFMQUNNZGwzTHEw?=
 =?utf-8?B?UHdldG1PU0dRMnZFVmU1T2V1SWd4ME02WmJKZ0VjNXpXWmJiNzRKTkd3UmY1?=
 =?utf-8?B?VUs1S0dBSkFQRmd1WW5aR3o0VENRTGZFcVNxdUpsS2F0bkhmeVByYlI0bm55?=
 =?utf-8?B?dU5aclFPL210ZFFYWjVaamR0T2FYRDNRd3FVNHZRTnNjYndrNGlRSnpDUkho?=
 =?utf-8?B?dDY5S3pLcW9ycUlnQTNYQmxmejA3NERLaDI4TW55QTNldVhwQS95TTdzYnhh?=
 =?utf-8?B?YWdPbC80NE1Fa1VnckRMdVFnUkY3WExra2l5eU9ZNzYvck5Ja1JpWGlmM3p5?=
 =?utf-8?B?V0JQS2t3ZzkzQ253d2xVRkl2YjBLMWJBTU5mZjVOck5ybGUydk5aVmVSKytE?=
 =?utf-8?B?NGlwTGtDbkorQjFhU3hxdTU1SnRMQjR1RmpzZ1pNT05CdWRzcE9pQ1ZjOW5q?=
 =?utf-8?B?WjhvdnlNVVRUM2VQWjI1alRQTFFOVFZyMWJNUHBjWXFGWGwwbVNyVDlHamta?=
 =?utf-8?B?ZTNpZExycEdBWFJaeGZ6dlhZYzVYTWxldjlCTmhjWDRrR0N5OFJxVG5relBE?=
 =?utf-8?B?REIxbGFTVzgyNDYxb2hIN3cwUTU3clcyWTExb2FEenBwd0R6aUNsUFhDU1Rl?=
 =?utf-8?B?UTYrWFF4UHh2VUEzSXp6UlNtc3MzRzZrUDdFUmM2VzVQWTZSNmpOWUl1bmxk?=
 =?utf-8?B?cXV4SDJ6Tk4xQVJUSEJ3TllGL1A5dEd3Qld4d09YM2xhTXRCVW4zcWRNN1Fp?=
 =?utf-8?Q?/4QGa7TIIBw=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6149
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8d0d8deb-d26d-44ed-c7ef-08dd790c0a5c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|35042699022|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3NrMmlpQUVvTWIwSjVPL2JTMTRNMFRzeFo5SlNtVWtNaHhRRldvV1hrOHRI?=
 =?utf-8?B?UGFYb0xhVVoySitGVy9nc085SEdsRHpjU1FJdTJLS2F1Ukl5YVFnVWtlK1Jz?=
 =?utf-8?B?aXZ0RWpPcWNxeVpNYWxUdUNrTlJrZk5ORllFY3FIcHdWVGtqUVlEVkJFQjBa?=
 =?utf-8?B?Ym44bk9lQitCTE0rZ3NUNXVIeWxEUVFqZE1wU2I3RHR3UXFoZnZmSk5iZlgz?=
 =?utf-8?B?MXRNWXlVUm4xekdxM08rQXRreWJNMGczYUNBY3ZXVXhLK08zeVYwSHJ3NnQy?=
 =?utf-8?B?NkVUT3VEQjBlR0FwVEJ0N0lhMzJJSVVFa3hxR0pKc3NyZTliNFpDOEVXMFFt?=
 =?utf-8?B?WEpGRWh5Nk9kaDc3UVFiR3BhU2RRNk5VTFlFVkdpWVpCcU4vYi9ORzFvaVBh?=
 =?utf-8?B?dmNoS0pscG1XdzFpbFFBakF1R3lXU1M4MEdnanRyMTF4RlJ5MVlyVHZyUzNF?=
 =?utf-8?B?V1FGQ3ZoblBVT2xvQjBaT09xdjVKMDRQQkt0a2tGZXBVZGQwcFRhT01sY1dL?=
 =?utf-8?B?OUhEOEpWQUo3bkdFcTZ6b085SDdJOVczWVhTNWdnTnIvSkZhVyszcklBZWxW?=
 =?utf-8?B?bXhCQW5kMDNaazMyVEtKQVV2c090dVpFc1NhVG5xcUxvR2VRS0NmaFhFMjAv?=
 =?utf-8?B?cVJoYkUxWXViREZRK3pQSTFQWHZMbS94M1o1KzNQZjR5dzg2OUo0RGxDNUdK?=
 =?utf-8?B?di8rV1piVm13SHl3N1VueGRDREJRMjNGTWlTRmd4THJ4VElXT1NwcmZ2MWsv?=
 =?utf-8?B?SndNcUJLQ011VWlQdWtmTHVHK0pGUEtzUVo3Y1FlaTBiMEhLR0hlbnFOLzM1?=
 =?utf-8?B?a291WmFtSnNEWTVCdTRjekhmWmxrRm9hRTBvcnNXUHBDUERxaTAwMXFBSXdC?=
 =?utf-8?B?MGg3ZmVCUlFIdjFrWVh5K1lsY0NFQkxrZ3RJMDA4ZDJJU3lMeExiNU9PSDlV?=
 =?utf-8?B?bkQxRmpyWWVudXJ0OGtsRTM3MUVlaW0xUUdrdDZERjR1WEYxa09lc1BGTjBM?=
 =?utf-8?B?WGhoVWlNTzYrbEx1VVlRMDlKdW84Z3BFei9OWGhvVzlsUVRkeFF6RVJkdHls?=
 =?utf-8?B?N2s0N3UrOXZpZVVHM0NhL2xNQkphVGUraFVLaHlzaE1ZSUFYNlIraUxSSWpi?=
 =?utf-8?B?T1ZCMW56OFAyY25DWlpZRmNtYWUzM3E5SU52WDdsWnUrUlVjQ2RuclNFUDVM?=
 =?utf-8?B?ZDFFK3M2UlNqSU5uWi9EVjFIeWVWbVpYd1FmT2c3c1M3bWdIR2pLNXJodzZY?=
 =?utf-8?B?MW9hWUN1NE5OMEdGTjhsMnp4VWxGcmI2MnFhaG03TU8xMWZ2MWJUQWhMcEEx?=
 =?utf-8?B?UlQ0QnFjR3RFeVBVMi9KZzVndnpGckRNQ00rNFhVaWMyeWtvcFAreUhqZjZn?=
 =?utf-8?B?LzVheEU2Y3NLeXJGem4rTktjY012Vkx2RldFUDNpdFMzVldXRkFQWFFodzF0?=
 =?utf-8?B?M0NuU3Vud1hUbkVOR3ZhNGlGVDRmZ1RhVG1yaEJlRmtFZUdnYzlLVnZXa1pw?=
 =?utf-8?B?eHNPUGZMNGxzcVBNRTk1Q1JXUmtZd0k2ZGxQazdLRW43U0NrUG9TLzYrQjBv?=
 =?utf-8?B?cjh1NDJFaE9odXRkSUd5NU5sU0hKOWN5S0FqWEFtY3BuWU5xMENOL0xrdk53?=
 =?utf-8?B?SEdPdVFXRlNNQmFFRU01UUNuK200YXFDUEYreXdjOUtVVGN0S3ZJUmV1UFNi?=
 =?utf-8?B?WWwxbzZXbWhOMWZFbnlmYkZvdlYzWUZlZFZoNGsvR3g3amVlRlFUU0V3QnYw?=
 =?utf-8?B?UDA1M3NsbTBaZzRUVExHZUFpcDNSbW5EanlXc0hWMTlUTjNDOEZ5a2Y4N1Y3?=
 =?utf-8?B?Z3FGSGVVeVVRQ3ZGdmladG0veFFkNnBtQkRaV0djMW5mOXB5ZXVvMTVkN3RJ?=
 =?utf-8?B?MGMxRnRwOFg2SXA5N2NLR0RSK1AzeGFLYzY1Wkx4YU5NU0EvTzhLdUxTRTIv?=
 =?utf-8?B?L2xRc0Urb29WSExiWDhscy9IdFhZV1MrQkRKZmhBKzk2V2JKUWdJbVBjWnE3?=
 =?utf-8?B?c1NkNFdybVZ3bDluTzBuemF0YldEOEhDVDB1TVRySWVNQWFPSUdWY2dxS0Zz?=
 =?utf-8?B?REZ4SGtWTEtUV0V4eEo5cVFPTXhRQnppb0crUT09?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(35042699022)(82310400026)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 15:18:07.4431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e80952-db17-46f8-62a7-08dd790c102f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10234
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

On 10/04/2025 17:46, Boris Brezillon wrote:
> On Thu, 10 Apr 2025 17:35:46 +0100
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> This patch adds 64-bit register accessors to simplify register access in
>> Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.
>>
>> This patch also updates Panthor to use the new 64-bit accessors and poll
>> functions.
>>
>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++++
>>  drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
>>  drivers/gpu/drm/panthor/panthor_gpu.c    | 142 ++++++-----------------
>>  drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++----
>>  drivers/gpu/drm/panthor/panthor_regs.h   |   6 -
>>  5 files changed, 124 insertions(+), 138 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>> index da6574021664..5028e25f5e0d 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>> @@ -428,4 +428,75 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
>>  
>>  extern struct workqueue_struct *panthor_cleanup_wq;
>>  
>> +static inline void gpu_write(struct panthor_device *ptdev, u32 reg, u32 data)
>> +{
>> +	writel(data, ptdev->iomem + reg);
>> +}
>> +
>> +static inline u32 gpu_read(struct panthor_device *ptdev, u32 reg)
>> +{
>> +	return readl(ptdev->iomem + reg);
>> +}
>> +
>> +static inline u32 gpu_read_relaxed(struct panthor_device *ptdev, u32 reg)
>> +{
>> +	return readl_relaxed(ptdev->iomem + reg);
>> +}
>> +
>> +static inline void gpu_write64(struct panthor_device *ptdev, u32 reg, u64 data)
>> +{
>> +	gpu_write(ptdev, reg, lower_32_bits(data));
>> +	gpu_write(ptdev, reg + 4, upper_32_bits(data));
>> +}
>> +
>> +static inline u64 gpu_read64(struct panthor_device *ptdev, u32 reg)
>> +{
>> +	return (gpu_read(ptdev, reg) | ((u64)gpu_read(ptdev, reg + 4) << 32));
>> +}
>> +
>> +static inline u64 gpu_read64_relaxed(struct panthor_device *ptdev, u32 reg)
>> +{
>> +	return (gpu_read_relaxed(ptdev, reg) |
>> +		((u64)gpu_read_relaxed(ptdev, reg + 4) << 32));
>> +}
>> +
>> +static inline u64 gpu_read64_counter(struct panthor_device *ptdev, u32 reg)
>> +{
>> +	u32 lo, hi1, hi2;
>> +	do {
>> +		hi1 = gpu_read(ptdev, reg + 4);
>> +		lo = gpu_read(ptdev, reg);
>> +		hi2 = gpu_read(ptdev, reg + 4);
>> +	} while (hi1 != hi2);
>> +	return lo | ((u64)hi2 << 32);
>> +}
>> +
>> +#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)    \
>> +	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false, \
>> +			  dev, reg)
> 
> nit: can use use tabs to pad till the '\' at the end of the line so we
> can have a consistent formatting across these definitions?
> 
>> +
>> +#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,         \
>> +				     timeout_us)                            \
>> +	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us, \
>> +				 false, dev, reg)
>> +
>> +#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)    \
>> +	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false, \
>> +			  dev, reg)
>> +
>> +#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us,         \
>> +				       timeout_us)                            \
>> +	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us, \
>> +				 false, dev, reg)
>> +
>> +#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us, \
>> +					     timeout_us)                    \
>> +	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,     \
>> +				 timeout_us, false, dev, reg)
>> +
>> +#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us,         \
>> +					timeout_us)                            \
>> +	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us, \
>> +			  false, dev, reg)
>> +
>>  #endif
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
>> index 671049020afa..fd09f0928019 100644
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
> 
> Now that we have proper 64-bit accessors, I think I would drop the
> _LO/_HI definitions and just go a single def per register that replaces
> the _LO one.

Hello, 

please find a link to v2 below that addresses your comments.

- https://lore.kernel.org/dri-devel/20250411151140.1815435-1-karunika.choo@arm.com/

Kind regards,
Karunika Choo

