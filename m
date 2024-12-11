Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4815A9ED2B2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD5A10EBAF;
	Wed, 11 Dec 2024 16:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="RH2HkpD5";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RH2HkpD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE3210EBAF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:51:05 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZBpsBTulDmNrfwJbZHeXcq75jMj/boSmH09tWylX/NG2VNB4DC3pyRwvw8Ne+vxDJo4iPhPUzDwCJmeI2gJ24j6RJp0LfEQuTxBCXbJRiRMyG+XHe32vM2aWrlTc0TtG6J9Vu+2UZj4+QAy2ORr5BLRmpWc/SwYQGHXzqerD+utAky0c+aNAXMuqZHG6gmOEZmNaKHCOjnvQjGAH33qzwPrZYceliFKHAeE075EKsGYXCEG7nH+/hxnP305twlc9naBre7qS9n1VSLnbYb/8PS9McgufCQDk6NjCeLs3sUGy8FFovft8UhhWYyCvFA6eQZHdZNOvoRPR/Hukh3yfQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ayApdt7pFmAAU/+0KjMja4H3DAGhYFLXVanPs5Gsk8=;
 b=vonbfuz4GHdeCo2cLOk920lCBitBdqE8ntoTEAtl6GJV7C1jBWguMde0FfhEM3awCFiV3qLfkrBvu546Di0uyQjPos44zLbzmVlQ+EJBAq3IW6VocSwqiC4FyydMP+ZhOt9qM9XJCT/gPx2G29tOlWWQJrg6JlF4YpCBNoscvRCHt6fe9S6nVaJ+O+PY4VfMSUs+o3p2cnHJ0xJn/HxyUOZ9Hkf2LEVrB04tW+bsZCla+kLmnQXoCCLvlrhlaQ4O0vzpbC1d+HQbfZDwkkTzOQBfdcp8x5bhMgMejCSBaxEb+NiLVy6e3AVdFkri+vpjWYDK5Q2BkrUUqp/mehruOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ayApdt7pFmAAU/+0KjMja4H3DAGhYFLXVanPs5Gsk8=;
 b=RH2HkpD5/lYZy097Neb+M5ZxK/nuOVWGp4ST/VMEPc1O3CcjLAbh2q3rnsrPLCNvIvNG10CtrlEqw//XkLKCezpGYXwKkrfAvAjawFDtweEgMNxlWXaw1rfUdAftkVkVCqw3SmZREe+UP075P1a3epx8/MiWeoO7wTbvc0haEbo=
Received: from DU7P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::30)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:50:58 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::43) by DU7P189CA0020.outlook.office365.com
 (2603:10a6:10:552::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.20 via Frontend Transport; Wed,
 11 Dec 2024 16:50:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 16:50:58 +0000
Received: ("Tessian outbound 3df7a8fbf509:v524");
 Wed, 11 Dec 2024 16:50:57 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 42a7f1a433c56572
X-TessianGatewayMetadata: r2NuGx4gX34veOs4T8DOdHNbgv+r1W8HjCKLciDUHmXtf5DstOCT1Qu3fGvHDfPLAtkJZnjEikQD+KM07i32tOP0Ki7yEbD/IV6d1LiccBvuxNYdHP+yU2w5HznLyh0FXHPhpAhQ04hxIQyCT17ejz8spC4dl3moQhQ4+hmEo+U=
X-CR-MTA-TID: 64aa7808
Received: from Lf5fe2988448c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CD584AF0-00F3-43EB-BC7A-6B5260494457.1; 
 Wed, 11 Dec 2024 16:50:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf5fe2988448c.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 16:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhHSuEyLgAWEyn8Rsd7Tx54KS2+NwwPou24juz3fi2HDhG2JTi3lzpO6pweyUvQ3kDu/bX9Zt45bbQyN3qDzjhiPpV1jt2jn2pnk0mtEG7EceszSnnLyzdktQ9n7hGDqJ01cIDyDdxnlh+MxtGSrH+hgYfUadSsSBZgesmmUBY3Gdl/meyyvrk6stll6L5d0lLOibDskIgOIYMp4iBFZjp6vxMc07r7mB3Xms9NdWsoGhjMWdVkjKAjgpf4F8oN29pOBvw+GWb9gwt/axepGuTe4hdhwTXfa+biG21i7aDFvVYTYOM0mSHHPGN+bxaR3LR19SNMqay/HsAbLFpfYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ayApdt7pFmAAU/+0KjMja4H3DAGhYFLXVanPs5Gsk8=;
 b=Qh9HStLCeze+0PqjnC/l2iYKLb6DeISaXbWlQ6gAt2yjBGmnx1KHKhyR5otDPRHrhJduv7TZhpsoBgtr7ZQWjkb9lRFcRBwF1atYGWfjfV1SV8hdTJhBodhmuelp2yoE3sIoJxhgAujRAlI9FIEkULimafkhSvepG4DD7Otn6vFz5CwQ2cXwtSfqGYZL4fhVI4hFqCy+0LoaEgHp4OseAo2KatwUFD9/lWlpfqEFfZLHTyCKLjgKJgkU1UlRvSMcmZpodhLuU9hZsXOXvyijmwgGpuzyiGM2u0FGpbSrBH3j+0ZJ347RO+SiR6li5YRmC4cBAwgf4znh/bDTqlYEeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ayApdt7pFmAAU/+0KjMja4H3DAGhYFLXVanPs5Gsk8=;
 b=RH2HkpD5/lYZy097Neb+M5ZxK/nuOVWGp4ST/VMEPc1O3CcjLAbh2q3rnsrPLCNvIvNG10CtrlEqw//XkLKCezpGYXwKkrfAvAjawFDtweEgMNxlWXaw1rfUdAftkVkVCqw3SmZREe+UP075P1a3epx8/MiWeoO7wTbvc0haEbo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28)
 by DU0PR08MB8422.eurprd08.prod.outlook.com (2603:10a6:10:406::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:50:48 +0000
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897]) by AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897%7]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 16:50:48 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [RFC v2 0/8] drm/panthor: Add performance counters with manual
 sampling mode
Date: Wed, 11 Dec 2024 16:50:16 +0000
Message-Id: <20241211165024.490748-1-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0563.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::11) To AM6PR08MB3317.eurprd08.prod.outlook.com
 (2603:10a6:209:42::28)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3317:EE_|DU0PR08MB8422:EE_|DB5PEPF00014B9A:EE_|AS8PR08MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4d6228-f4cc-47e2-4aa5-08dd1a03fc90
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?T0s3YjZsdlZTaGVlNFB5QUJUN3VIRjdyNjZMN2VqcUY0U1hRM1p3UmlXQkY4?=
 =?utf-8?B?bDgyV1QvTThyd1FEK2JyNWFUUWxGNTlkdlY3cGNYM1Z4ZWVSakhzeHJ5QURz?=
 =?utf-8?B?YWVJVEtIdC9iWE51N09CUkwwWWRYS05DY0Y0Z3ZMZDQ3byswTTJ3Ri9jMkNn?=
 =?utf-8?B?YVVQSWJuUHRUMGU3cEhQVHhkK01Bb29BNWlCUzAwanhML0RXZXQ1bi9JSjNs?=
 =?utf-8?B?UXZjR3lMTWtleUxmb0VXOUEwQlVPWDQ1Rk83UWRJVkFNWUNxNDBBdnp0Nlhi?=
 =?utf-8?B?K1huOTU3T2YwVFBEWnpEQ1puMWt4Nkd1SzhLTXpwNVV6TytFSjhsRG5wMmdk?=
 =?utf-8?B?cDRuSVJaREFJQXBHSElaUDRmRm5ySjdHd2NPZzlsbGsyTkEyQnVtWmMzNUZY?=
 =?utf-8?B?cVNQZjZaeXBUSlZxSzVPcG5ZTDJRRUxRMGNxVG5RaUltS2FrTTR6N1BlRVJY?=
 =?utf-8?B?TGxrT1lReXdMMko5bGw2UFRxdkNVUTdReUJJOXE4NXdwUVdEQm5BUmZiM2dK?=
 =?utf-8?B?TUUyZ0FyV2IyelhHb0s3SVR4VGt0bjdKNXRObTgwbVVQSHFVOEsxUEdvdFBT?=
 =?utf-8?B?dWZpaHFMZUtMOFlRbXJZNWphSTR0clBNREVudlhqRW9EZkQzaXhLb3pUbTlV?=
 =?utf-8?B?MHAxMDNURWRhVS8vM3JpRyswWkxHcE9qdXBYRmdRK0g3eWlUcWtRTFdVYmpJ?=
 =?utf-8?B?c01Ham9mWk1LU25JeXBNWEh4VGxYR2tXOE1FdFNVTEFyRlJxZTRoZmRZTjZu?=
 =?utf-8?B?YUhnU0hoNUJVOUVTWnlmZW1CdVhsa25KUWs2cE1VZU90L3E2WWhDZkl4czAz?=
 =?utf-8?B?OHFNelRNOHBYYVhqTkFjZERFV3FBSjJrNVJid1lERDJQMU84SzNkd214ZU9Q?=
 =?utf-8?B?RU1GZ1lPL0M3ZjliNjJ5Y2dobExvOVNoamJkVGtWc0ltTzVSbUtJbTlUYW5W?=
 =?utf-8?B?Vm5mYmlFSFduVnZJU1R0VVdZcThndEtUazVvRVNKc054djJMbHdFZ0QveXg0?=
 =?utf-8?B?MGY3emFQcmgvemFRMVlQSXJ3TE9jVnpFZzI4bGwzYlRXeXFKamtOc1d2MWRt?=
 =?utf-8?B?TW1KRnpCeDNIZlVoVkdjdVdPeG54THZVMTBJVFdqTWZpeGkzK2tnVTJrNVlB?=
 =?utf-8?B?SDY4YS96L1ZsYm5oMi9lRUYwdEtlR2RNNlFnNEx4NzBacnVrcU93SkdHQmhU?=
 =?utf-8?B?SGd5K2lmeng1UHBsaWJVM05GcWc4VDkvenJUa0w5TXpvU3BTRGk1NkNoRTk5?=
 =?utf-8?B?bEVCUXpKRW9BMS82blZiOHlWZVVTWmRhdUtKdzgvaEpSdUl3YWRYWGw3MjFM?=
 =?utf-8?B?eHhGTXRvMUlPRENLR2pEV2x2dlpvVU43ZU8wWjBJMzBQUS96Wmt0cFV6b0s1?=
 =?utf-8?B?T3JvWU9aNmoxUFFyeks4Z2tYZTZJbFpGclRENmtsQWluSnRwc1h1aGVCNnJR?=
 =?utf-8?B?S2pvYy9YWFhVRlgrakFNZTVabHZ5NlVYTFM1clB3WEFsRm5RSE5GMXV2R0JF?=
 =?utf-8?B?MWJSZ3pvaFFaeVYvTXhBTFBaRlhHcmRSZFNJdGhqQTNjcjl1bG1KeTRvQjBD?=
 =?utf-8?B?cmhMRHJ3OUJJSU5PeTZPTFQrSlAwdUlyeTVtQVh4VlVhNUxxemVnN25uOWJz?=
 =?utf-8?B?UDA2YWlxazhoWEJ4ejR6QW5KUm9VYWJLcEdJV2tZRDJSZVA2VlgvYzc4TndJ?=
 =?utf-8?B?eHBTeHpSRmR0Ni9aUGRCUXY3SGtxL0NndXpqNFZ0RHNzL3ZIUjVadlVjR2xv?=
 =?utf-8?Q?TqrWxaoqWOlAbdhzNQ=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3317.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8422
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:209:42::28];
 domain=AM6PR08MB3317.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0b089aa2-e535-4122-d3d3-08dd1a03f6f0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3RCWTVNMCtRY1dtV2hac3VvZExzRzkzZjZieENLbjE4SllQY3RaUU5mazdp?=
 =?utf-8?B?dmZxL2wyUDBWcStsNWwvRzNqdU44MjlGZitYbGgzenBFQU5ZOHh2NGVRZFlw?=
 =?utf-8?B?VUZLVEdSb1A3R1lGVmRZOHE5aFJobzNjcjhSUjY0cWFTOUIrcG1TTzBvTnhO?=
 =?utf-8?B?NExjUmhsd3ZOTlJTMkZtMXBidGh3NTNRM1RWb002K2ptNE03RnJmNENmZk8w?=
 =?utf-8?B?MXNDV3FJRjhkNHlEZFJxam5CdEFFS0lWRStOeEpUVWlPMkNmK3YrWmw3M3Rt?=
 =?utf-8?B?YjdRb1NHaDZPci81RWxZeU1xU2QrNE9COTlGemN4SmZxemg0Z2JHbHFmTVNR?=
 =?utf-8?B?U09CL2hRRGVxdS9BTi9LdkJOQ0M5anhjSGY3QXM1dmxSMFRjSU4wSldNWkg5?=
 =?utf-8?B?aUQ5QVMrK25tRlVaYWt2eWIvSU42SWZsWXV2ajY3QjdObklRWTRrOEpCb29D?=
 =?utf-8?B?dHlJdWxHTTBuRnVGdmg0NUJ1K3cyN3MzME1SbHhZSmxjdUZVT3lPTG9sTi9j?=
 =?utf-8?B?NkEzMzhQK1I2MEVhbWlaTncxTllkYklLc1pnWWY4K3l1VGR3RkppdGUzTS9j?=
 =?utf-8?B?dk84KzNGbnM1eDIwa1g0Kzg2M3pyOGdzM1l3b2JoMGoxeHFmTnNuQzJsN3pj?=
 =?utf-8?B?dEwrWFNNU1VqUFNpSGxjOVlFcWVTWUhRRnFMR29iY2o3VWtKczdYV2x1Ni9j?=
 =?utf-8?B?RUtyTFF2cXJWaUllQkJZaCtWbEN0N3JmclpHTnNPKzJsMUJOTURidHNVdElO?=
 =?utf-8?B?T2VqKys4aEZZVDNqTkFDZkU3S2tTSjRBRVRuRXJyNE53bmV4amdBaDRwbnJ2?=
 =?utf-8?B?Ykh5MDRvaXZSN1BjbzU5ZTlzT0dDWXgzSytWT3h1aGtIZHFVVElLTFVHYis3?=
 =?utf-8?B?cWhqb0VVKysybG5pWG9zTDFtOFQzVGxiSjAwbmtLZkxab3RldFVIKzlQQndR?=
 =?utf-8?B?d2doL1dSRCtDeE9hNXlnWDRjK25wd0dLT1g0Qy9aTnpwK1hycGVRMEZ5Smcz?=
 =?utf-8?B?ZEUxTU9GU01maVJITzVSKzlGQkVKVXlhVWNRZVQ2bVZYU3pBTENyanBrbzJZ?=
 =?utf-8?B?M0NqbjRza2djY3BiRmdlRkltdlBPZXVLMEk0Y2RleisxNFFEK1JKeklSdEI1?=
 =?utf-8?B?NFNHbFpVZXBNcjc0SHdRTWRUZlgrUG52TU9YbUxRV21zY0hreXd3MG92clBL?=
 =?utf-8?B?WE1BRC9XbzRpTU04R3o2QlBPeHZQVkQ3UnZJQmh6bm91bmhLV241Q0hhQzN6?=
 =?utf-8?B?Y29lVGl4emZPNGNydFltSVFzODQ4S1VNcU4raEo3M0UzOGFnWnlsVnRqRjNR?=
 =?utf-8?B?K2ZBRVhFWEU1VnU4ZUR4UmtEY012YVRWM1htakwrMmZ2Wnh3QUNNRHptRVhx?=
 =?utf-8?B?WHhSSjJ3enpKQ3RlcDdnT3k1SjhtRlQ5NnR0UFdiOGs5TjQ0WEEzRit1SmtS?=
 =?utf-8?B?V0tYamczeFg1amVOSUFaMTduT1JCTUtJbHcvODdJZE9tanpndUt1bHdTSGli?=
 =?utf-8?B?Q0FTa1ZsVjc1dklRY3BEWmp2VnZQbVFYVlRKMzAveVNEWE9MMWlRQk5yckJi?=
 =?utf-8?B?ZHBvNTZzc08wbHVVTVoxZjVXRWlqQ0t5QXBZSi9CS1NTZnlsQTYyTGNEZDlF?=
 =?utf-8?B?WktyMmludDRzOEZwRnYzN1ZWY096K1p4eXRwaFMzSm5QN1QwSHU0U0JTWVFx?=
 =?utf-8?B?SVBCMEE4UDVCM0p4MGR0Z2pmU0kxOU94VEV4ZklsT282bTh4ckdPcEVqbjQ1?=
 =?utf-8?B?S2NqakU1ZVpwVmdlWTg1Y3JQaEV4WUJENUVVNHhURWRWTTVIK3hYSU13aEVj?=
 =?utf-8?B?dmUzaXJST0x4bUpCMTVVMDJQUmsybHBBc3E3aE52TDJxL2hXemVnVnBhcDBr?=
 =?utf-8?B?ZEMvM296ZDErWElXQ2hGK0hHVWtGWGEvc2Q3d296OWkybkE9PQ==?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(36860700013)(376014)(35042699022)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 16:50:58.0548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4d6228-f4cc-47e2-4aa5-08dd1a03fc90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712
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

Hello,

This patch set implements initial support for performance counter
sampling in Panthor, as a follow-up for Adrián Larumbe's patch
set [1].

Existing performance counter workflows, such as those in game
engines, and user-space power models/governor implementations
require the ability to simultaneously obtain counter data. The
hardware and firmware interfaces support a single global
configuration, meaning the kernel must allow for the multiplexing.
It is also in the best position to supplement the counter data
with contextual information about elapsed sampling periods,
information on the power state transitions undergone during
the sampling period, and cycles elapsed on specific clocks chosen
by the integrator.

Each userspace client creates a session, providing an enable
mask of counter values it requires, a BO for a ring buffer,
and a separate BO for the insert and extract indices, along with
an eventfd to signal counter capture, all of which are kept fixed
for the lifetime of the session. When emitting a sample for a
session, counters that were not requested are stripped out,
and non-counter information needed to interpret counter values
is added to either the sample header, or the block header,
which are stored in-line with the counter values in the sample.

The proposed uAPI specifies two major sources of supplemental
information:
- coarse-grained block state transitions are provided on newer
  FW versions which support the metadata block, a FW-provided
  counter block which indicates the reason a sample was taken
  when entering or existing a non-counting region, or when a
  shader core has powered down.
- the clock assignments to individual blocks is done by
  integrators, and in order to normalize counter values
  which count cycles, userspace must know both the clock
  cycles elapsed over the sampling period, and which
  of the clocks that particular block is associated
  with.

All of the sessions are then aggregated by the sampler, which
handles the programming of the FW interface and subsequent
handling of the samples coming from FW.

[1]: https://lore.kernel.org/lkml/20240305165820.585245-1-adrian.larumbe@collabora.com/T/#m67d1f89614fe35dc0560e8304d6731eb1a6942b6

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Co-developed-by: Mihail Atanassov <mihail.atanassov@arm.com>
Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
Co-developed-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>

Adrián Larumbe (1):
  drm/panthor: Implement the counter sampler and sample handling

Lukas Zapolskas (7):
  drm/panthor: Add performance counter uAPI
  drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
  drm/panthor: Add panthor_perf_init and panthor_perf_unplug
  drm/panthor: Add panthor perf ioctls
  drm/panthor: Introduce sampling sessions to handle userspace clients
  drm/panthor: Add suspend/resume handling for the performance counters
  drm/panthor: Expose the panthor perf ioctls

 drivers/gpu/drm/panthor/Makefile         |    1 +
 drivers/gpu/drm/panthor/panthor_device.c |   10 +
 drivers/gpu/drm/panthor/panthor_device.h |   11 +-
 drivers/gpu/drm/panthor/panthor_drv.c    |  167 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |    9 +
 drivers/gpu/drm/panthor/panthor_fw.h     |   11 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 1773 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |   38 +
 include/uapi/drm/panthor_drm.h           |  538 +++++++
 9 files changed, 2553 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h

--
2.25.1

