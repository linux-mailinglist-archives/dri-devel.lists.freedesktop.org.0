Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EBFA84A71
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CA610E027;
	Thu, 10 Apr 2025 16:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="mBwRnaeK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mBwRnaeK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E90F10E027
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 16:49:38 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eT1XdGhQwNj9P4n8/pZnEfpW9rqNesb2PMiC2GNrIRz29e0AoZgwWAsP54RDM8rYanvG7Et71mJQqXaLTnbUK+0jk+60sl9MY62tPf40ihceREbIvMW1MS0dRSvJahEL8GgT61plD84DT4ii356JcYoBnu5i2a722f0E9Frvg3WDkwMxiCF8nT8wk2ACGX+EZXNuxQBqFP794DUTtcMK0zMgbKwXvzeZ9cxtMH17pvsIDj/7ocTJJS93NJ9eiEi0Y1yKth9uiVAB/oeX2Yma3HENFWHeuWv6OQn0s2iQg75VbZDR07CNqbEWboMdzY1Nf/pIxFmYG6N8dwV9CaGCnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ITB7K9lktptmpqIOgQr7taaJ6SgiKDFBeSqaQ/5kO8=;
 b=vt2fPhjQta9NRqjrxnFtDuJrXVdZQZ21qnUHfwvcXTyy33FeKSbRw6wesMRR8+KmVxngGHP1NVJkXYhJDc7U76xc6mbCKM+GxI0qE4Vp3vMYK87tir0R94ejGUF7HryAkn7aqpaxZ+AA0CCsLkIw1uRCk9sLUq/WQM9aT/U8fnNhqjqgv4fvLPbNRBK45PWIyEhGWGmnEQx9y16lMZI3CVQxJ/bKGv7wehX/URzRbR/gf3KlCiFt2vWnW68FoKssNybFS5Rf9Re675rqCIgfO6J4EpRsI13bxXw74CVCT3gu1b8gHckD0tuazYOk4SqLlMtGOKPPuW2idsXfvxhGEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ITB7K9lktptmpqIOgQr7taaJ6SgiKDFBeSqaQ/5kO8=;
 b=mBwRnaeKdMTvYlU71e28cBilKXGRQS1XLtFOx2wfYT+a3QYckmQVaofIgOH4qJRYIJS3sYuPLml703Sj7whbCJ+F0Dih/NETo1QwxHeniw4mzGYSKZ7YbbTwVpVJkp4NaBCDXLPgVIDPxsU5THRDa0avnruSSgPin9JpHnbSMZk=
Received: from AS9P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::29)
 by AS1PR08MB7404.eurprd08.prod.outlook.com (2603:10a6:20b:4c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 16:49:27 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:532:cafe::2a) by AS9P250CA0024.outlook.office365.com
 (2603:10a6:20b:532::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Thu,
 10 Apr 2025 16:49:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Thu, 10 Apr 2025 16:49:21 +0000
Received: ("Tessian outbound ef9f95d5bce0:v605");
 Thu, 10 Apr 2025 16:49:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eda9fe4912e2306a
X-TessianGatewayMetadata: W+lWsw9fpqEHYiQBqcVgYC3or4gDFlo7RiHI0WvDcV7jTIySOQzDzctczx6ZbnF2l+LqH431yDgQbfWOLp4oQkTPa7ZM+7WblC6SQBVTfN4ElF4UvkeNi9MCXGfMUE96ZCURfPirY6qKbB7wWCxMnBAekRWGXVhtIVHNopQ9Y/o=
X-CR-MTA-TID: 64aa7808
Received: from Lbc66333c9cbe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3C545DB2-16A1-4997-A338-D4102DBA19C9.1; 
 Thu, 10 Apr 2025 16:49:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lbc66333c9cbe.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Apr 2025 16:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xloWgas9ElUOd5Ytym5GdKCz8O8F1A+wpjbWhNAaOrAd8WWpPV2SQixoaMfHlfyQkdgLcorigG+owC2FPKLONNJzZSH/1NnNtToUDFD2dAMLbElQzmg2iUJK1SpbqcSn35hACwagLLQ3AH4XmOufS88MGyA9ycU3GVXWqv8H0oDfQaOKjSR1rXu1MOvVNuJh8nPz04NPOESvOg3jgcbcfeqrltBv+G9TROi9AjZHWWC4ucNTZ/Q8qfsT0Ai06QPYEGxFhvgEFXC2HNBxtA9pGHWY7hI1AdPqHyJg0AjNbie6rJiU4atXkVQqEheaBZaFv+GtThGGQXZf6TRpLp8OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ITB7K9lktptmpqIOgQr7taaJ6SgiKDFBeSqaQ/5kO8=;
 b=R9N+NS2D6wS6yKLw56hZkJHy3o6Sd/FOmwyhPJ9TbEyXS+7Ilh4lsACKiTpgKbI4BRDATWM0xy4/TeuhWPit1H8MF62bCFVagu1APDU3m0XWdV9l/RDq7QQgISZpuP7V7Wph0e4bDg8nYgYkTEJYjFTBrxsKuzNdOGhsJ2RQPa1FH7IxnxkT4cT9Idi8O8ZIe/0Uzp4TptM3ZTT5G7Oa6mJm5ZNpeUo7BJjRMIndkzFfRl5BdF2rWus/8U0GTc3Y5Qx5qKWFaz6CS9Gi1/Pc3acYlG8/S4deyYbvORWE2mW1L+jDOLHp12MPa4BIGZNLRFt35DZMCvZQBl9TBlahFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ITB7K9lktptmpqIOgQr7taaJ6SgiKDFBeSqaQ/5kO8=;
 b=mBwRnaeKdMTvYlU71e28cBilKXGRQS1XLtFOx2wfYT+a3QYckmQVaofIgOH4qJRYIJS3sYuPLml703Sj7whbCJ+F0Dih/NETo1QwxHeniw4mzGYSKZ7YbbTwVpVJkp4NaBCDXLPgVIDPxsU5THRDa0avnruSSgPin9JpHnbSMZk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PA6PR08MB10393.eurprd08.prod.outlook.com
 (2603:10a6:102:3cb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 16:49:12 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 16:49:12 +0000
Message-ID: <c9715da2-f239-4c9b-b6ef-020e08e3b40a@arm.com>
Date: Thu, 10 Apr 2025 17:49:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] drm/panthor: Add 64-bit and poll register accessors
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-2-karunika.choo@arm.com>
 <20250321084809.5f217049@collabora.com>
 <d9a4aa99-2f00-4da9-9f7e-26729f7f8fda@arm.com>
 <20250410152822.632b09b8@collabora.com>
In-Reply-To: <20250410152822.632b09b8@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::32) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PA6PR08MB10393:EE_|AM2PEPF0001C712:EE_|AS1PR08MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fb70b8-23ea-4c77-85d5-08dd784fa4ab
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZHJYcFF1MEswL25temc1NE1NQytjaVVVc2JRRVJkcVRQVFZqTEh4dHVMRGpH?=
 =?utf-8?B?U2tabkxJT3JENFk1UWJNdGtBUjlwSlRRZEFocUtXL0o1VGRjekQxaFpGVzBI?=
 =?utf-8?B?d3BLWGdza2xNRnBIU1N3R01lblBaa0FoUGZlVTVyQnlHbEJETXAyTnQ3dmtF?=
 =?utf-8?B?MnBLcHRvM1hwYUdEYlkzQk4yOGIzVUpJM0dtVytGRnlEdVE5cUpjUGhSUVg5?=
 =?utf-8?B?T08raFJsazc1R1FDWmxyNC9BYVNZenFKeVFNZk5MNG91Q2IyNTFCMlk5S0Fq?=
 =?utf-8?B?ZmF6MDBLZHZwcFlMMktINUpTcXVHcU14cnR2MmdJU2dsZ2w1RUhWTWliL1BY?=
 =?utf-8?B?eGw0SzViOU1TZ2ZkdGJmYklkbTgzaVVZaitLT3ZZaVF3NGw2V1lMNXp6OGVh?=
 =?utf-8?B?Vm5zYmVhMkUxaUdFdWxOM21rQzJ2RFE5dlZJR2x4NWtsTDJzenlmRExtOWUz?=
 =?utf-8?B?WWttWVZTRlo4ODNhOTF5c242YW1lU1Jjc3Z4NVhWTmlTck1pdndlMmJBSmdq?=
 =?utf-8?B?SVJsUGFGS1FneWpDSU9HbUhkQnBxN3k1SjhCYk1SQWtaSlc4TDlLcGR3ZFJY?=
 =?utf-8?B?Sjkxb21zd09MR1FVRVcwczNiT2dlQU1MbWEzVS9KL2xsTFRLdVdXVk9UZGJw?=
 =?utf-8?B?R1hKNE93S3laUnQwYytYd0RGQTVJeVFMR1lIUFFNL3phUkVQV3premUrR3VI?=
 =?utf-8?B?Um9zeC9YUGxFclRLZnBQeVA3UEtnQ2FmVFNQSHBjYjJkR3IvaUhDaytTckVO?=
 =?utf-8?B?bzNKNGtQOXJWZ2lwMEJ2Vkdrd3VTa2VJV3VXUHAxY3RoNER5R0tPcXdvbUY4?=
 =?utf-8?B?cDlqMFlNeFk5ekpaZ1cxdEpKUis5UmtlODF6SUtZR0E3WE9JYnQrekxVZHZ1?=
 =?utf-8?B?anhHZmNzbHQ5bWQrVjhtSDZGQnNCbDZvbE5RM2xkMlc5SWlpQi9ja0FhaTR4?=
 =?utf-8?B?SkpjWlR2Y3MyWG5sWWFLZUNiWTVBQXl3R2l0Ung1VHlnUHp3eUFVUktIZ25G?=
 =?utf-8?B?aWhER1RpNm9VT1QyNjVZSU8yY0p6UmRHQjZudW1iSEZLcmpETDlGRk5pMGxh?=
 =?utf-8?B?Q2hSQXBxSHlYcnR4QWMyK2xDTlFTdTdjbkE1cVdDcjNOdGszQkNmcTgvZlRS?=
 =?utf-8?B?UlFTNFdySEw4SHpwMGZjUStFUm5tSmtyKzRvQ25ZaHVOaSsvRnZzcGwzNmJr?=
 =?utf-8?B?bUI1WUt6akRkbGZvdkY1M2pOeEQ2OGdFZ2xveUMyVEtMU2tkeTZscVZRN0ZT?=
 =?utf-8?B?Y2N1dmFTMlBEN3dDTlhldVBIUC9UL1VVMGVzTzR3RHY4R1JtNmxGMUZUS3Mz?=
 =?utf-8?B?djlMN3BtR0RFY2t5ejFiMTlmRjBKUm1objk0YzN6TUZBckxZRmpmU2ozTVk4?=
 =?utf-8?B?Y2ZmRTNiSFFTUkV5ZGY1ZWY0bVBVM3Q0ellMTXJLaVJrM0ZjKzhUL0JQNFE3?=
 =?utf-8?B?MEdzTlh4c0JVbEVuaGsxSm1JeUlQU1NvMEhFU0l4VVFiL0VYYit1KzVuV01y?=
 =?utf-8?B?S3dFQjFodDBub1lKV3RnbGNHZ2RYdzNZZTFxVlRXcmlyOTdTTTM5M2V2ejh3?=
 =?utf-8?B?ZWtZZW9YdWtLdzFaZHNRR1BSTFNaVUFLVXpiQ2xiLzB2aXhERjNhVzlRWEkw?=
 =?utf-8?B?MkJiemZhQlpleUI2TGdqY2lKMXVRTFZ5aTJuU0h6V0xabVpuMkRmUjVBdG9s?=
 =?utf-8?B?b2RiMXhtMXdvcFRUcU0wOVAyVWdNRzBHT1h1Wkg1cUZDTzRVTGkvdXhpTTZH?=
 =?utf-8?B?MzF5bjhmemIzUVUzOUc4MjZwKzRTOUZBU2xXQVcwczdreDJjaE1tOTJnUThz?=
 =?utf-8?B?ZHJPUjZzbmhIcCtqRGpZa0VZKzRGK25PbnQ0UCt2T3dENDdtNVdGN3pwbTlk?=
 =?utf-8?Q?Rg2hgKEPcWxmd?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: aa6fe690-7ee2-471e-35d2-08dd784f9f08
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|35042699022|1800799024|376014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUFvc3g4a1J2VDVoaGRBQ2lnRVFUY1pvWm0vUm90QkpickFCalBEejBseDB5?=
 =?utf-8?B?VU1LdUhiMk1GbVArWXhpVFR6UXVTVXRrZm53MXE3Yy9WcUo5bHVwVnh1cmh3?=
 =?utf-8?B?VlBNdDJna2VSdklCNlFzMFpqazUxdUF6STBjcHBUYnVHY3o3NEs0ckNiMlpN?=
 =?utf-8?B?Sk1jcTFHc2syNDE3QWRyNDA4Qm1naHVzd0kvck1vdzErYXkra0JFWUtGMk9T?=
 =?utf-8?B?djVrUTdoa05oT0IweDViaXJCMDdQN2U0RGJXQjRmUlYrYjE5bm11UnV3b293?=
 =?utf-8?B?SGlLd0RwM2pWRTYzWCtKa2UvMVNhRVZEMklWZU5jWitENDNkNUhVTVV5VUo1?=
 =?utf-8?B?LytvVE1Ga1B0TEZvYjJGL1FERUxIODdRNDhIZzdIREpiZEw1TC9MNkZRenFR?=
 =?utf-8?B?NlRpdlpycUw4cmVFVGc5c0ZMRVhrdnNLZ256M21VMHhYUXA5MDlRbEdQYkN5?=
 =?utf-8?B?ZlBzWkN0UCtNV0tlNzM1ZldHb3Q0WjNmUEphMWhJNTJmY3pnNFJzeGJ3YzNL?=
 =?utf-8?B?RFRrS3BCRGsrOGxUU2xyV1N5S2kwVC9FL08rQWVCQkMxRzh4ZHlKT3VtbFdV?=
 =?utf-8?B?aGd1UEl2RHkwYzdPNXlFVE9teE1nZDI3VC9OT0FVMS9VbHhyd3ZVaTQweEtE?=
 =?utf-8?B?eWp6T1hkUkdyVHhIa0tRZi9ydGpoSG1uTk9zd1BXeVExVmhYdjRRQndyKzJ2?=
 =?utf-8?B?YVR1ZHRoNTJVM04zeC9HZGVvWEZiK3YvSFpMK2N5eGk3Z0p5STU3UFdNT0RK?=
 =?utf-8?B?UHFXZDJjTXQzdjNLRjFOb3dLWFhhTFNpdkFKZG9wSjkvYi9vdElJVWJJcW9r?=
 =?utf-8?B?VjAreGNaS3VjcjVwYkk2UCt5QmhsM3gwSHlOOGRmZVZhMjREV3JlUXlUOFlT?=
 =?utf-8?B?dlcrNm1Da2c3S2VtUXBaL2xPVDByZXZrb2tqeDYxQWZCengwcEhnbEcxaTYw?=
 =?utf-8?B?YUE4cEtBWisxSm9BUGtueXhtUFlWdk5sT0JZSlJ1dU9XNllrWW9Na0xqcnFO?=
 =?utf-8?B?b2hPK1QwYkQ2NitFdEFIT3NNQkUrUVlidVpQQlJlb0ZPZm9nS3JtK2NFbHE0?=
 =?utf-8?B?WnlSMFQ3YTFSUFlhQVBjS05qTGU1MFZWR0ZSMjFVRGFaK0tKZGl0UHc4Y0Vs?=
 =?utf-8?B?TURjWDdNSTg2WTlUSlFHaGhXSk9BeE9nNjdaYXd5cnQzUWl2WnJZTDhlR0Zm?=
 =?utf-8?B?bHozeWtnUjVaUUlvT1Y0WW04Z09QU2Z4c09JQ2J0eFA3aDFLamxGeXBvUGdx?=
 =?utf-8?B?VXVPMVlzVjJMdVBUZm5BZ0c0cTFteG02RVZFaWRodFhmVzRUVUlXencrbyt6?=
 =?utf-8?B?dzY2TzBDT1hPTGJteHNwREVaOWNNU1ZFbUEvQVRubkx5b1pac2ZZV3Q4K2ww?=
 =?utf-8?B?WDdIYXJKZTI4WlhyYmhxYnQyWVNhMzNrN2p2Q1FGQkc0YkRYVVViRUdqUFNl?=
 =?utf-8?B?aXlHUTNQbXVqVzlQTTBNV2JGY2t4ZFhyUUowWHFTQ2dmaHJQNlk5RE90Rlpq?=
 =?utf-8?B?UzZYYmlXMS9jcjlmdU1KOHMrYkRaaVAvZnA1MXJZMkZXdDRKd1J5MHY2V0Vn?=
 =?utf-8?B?VjhNcm9sb2o4dlFrdk5zZ1BFOWk2M2oybW5sYUE3QjNVKytGdEl0dUxlcllw?=
 =?utf-8?B?OExuSE9RRmpUVFlBbkV3aTd6RExGcmZwZHordmRybU5RS1MxODZ0Z29od2J6?=
 =?utf-8?B?SGJMd241TU5TdkhYV216ekJoeEJtcXk2NEFFcm1sQ201clNYWWRxQUtNUDR2?=
 =?utf-8?B?dXBlUkpsa1pPYndxUFppYlBmOUltZFkyWmExa2dOUVZGZmlKSU5ha0F3TXdJ?=
 =?utf-8?B?dk1OTFdwWEFsOXQ5TS9zRC83SHRGOFN3Zm5GV01hZWh3SnMyRFVHY2xNQmc5?=
 =?utf-8?B?SzViSmc3L2MwRkNwVWNSYkhtcmxFM2NnQnlrMUpCdFREWjJKU1VQM3pVMHBT?=
 =?utf-8?B?Q1QwL2d0VEkzc0hNOU9VWXlCL20yS3lSOFo3V1lQdUlPTUwrL04xbUhqa0ZW?=
 =?utf-8?Q?ureWnzdBpxuH/QiZ6zDUZHXYlQsR4U=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(35042699022)(1800799024)(376014)(14060799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:49:21.6307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fb70b8-23ea-4c77-85d5-08dd784fa4ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7404
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

On 10/04/2025 14:28, Boris Brezillon wrote:
> On Wed, 9 Apr 2025 14:00:54 +0100
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
>> On 21/03/2025 07:48, Boris Brezillon wrote:
>>> On Thu, 20 Mar 2025 11:17:33 +0000
>>> Karunika Choo <karunika.choo@arm.com> wrote:
>>>  
>>>> This patch adds 64-bit register accessors to simplify register access in
>>>> Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.
>>>>
>>>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>>>> ---
>>>>  drivers/gpu/drm/panthor/panthor_regs.h | 55 ++++++++++++++++++++++++++
>>>>  1 file changed, 55 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h  
>> b/drivers/gpu/drm/panthor/panthor_regs.h
>>>> index 42dc3fedb0d4..7ec4a1d04e20 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_regs.h
>>>> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
>>>> @@ -238,4 +238,59 @@
>>>>  #define gpu_read(dev, reg) \
>>>>  	readl((dev)->iomem + (reg))
>>>>
>>>> +#define gpu_read_relaxed(dev, reg) readl_relaxed((dev)->iomem + (reg))
>>>> +
>>>> +#define gpu_write64(dev, reg, data)                            \
>>>> +	do {                                                   \
>>>> +		u64 __val = (u64)(data);                       \
>>>> +		gpu_write(dev, reg, lower_32_bits(__val));     \
>>>> +		gpu_write(dev, reg + 4, upper_32_bits(__val)); \
>>>> +	} while (0)  
>>>
>>> We're not doing funky name concatenation in these macros, so I'd rather
>>> have them defined as static inline funcs in panthor_device.h. We
>>> probably want to move the gpu_read/write definitions there as well if
>>> we do that.  
>>
>> I see where you're coming from, and it makes sense. I was thinking it
>> might be better to keep it in panthor_regs.h since that's the file we
>> include when accessing GPU registers.
> 
> Well, yes, but also gpu_write/read() take a panthor_device, which is
> defined in panthor_device.h. I guess we can keep those in
> panthor_regs.h and include panthor_device.h from panthor_regs.h if
> there's no circular inclusion. I'm fine either way.
> 
>> That said, we could certainly
>> convert them to static inline functions if you prefer.
> 
> Yeah, I'd prefer that.
> 

Apologies for the back-and-forth. You’re absolutely right—it’s a good
point that struct panthor_device is defined in panthor_device.h. I
have moved these functions there as static inline functions, in a
separate patch outside this series.

Link: https://lore.kernel.org/lkml/20250410163546.919749-1-karunika.choo@arm.com/

Kind regards,
Karunika Choo

>>
>>>> +
>>>> +#define gpu_read64(dev, reg) \
>>>> +	(gpu_read(dev, reg) | ((u64)gpu_read(dev, reg + 4) << 32))
>>>> +
>>>> +#define gpu_read64_relaxed(dev, reg)  \
>>>> +	(gpu_read_relaxed(dev, reg) | \
>>>> +	 ((u64)gpu_read_relaxed(dev, reg + 4) << 32))
>>>> +
>>>> +#define gpu_read64_sync(dev, reg)                     \
>>>> +	({                                            \
>>>> +		u32 lo, hi1, hi2;                     \
>>>> +		do {                                  \
>>>> +			hi1 = gpu_read(dev, reg + 4); \
>>>> +			lo = gpu_read(dev, reg);      \
>>>> +			hi2 = gpu_read(dev, reg + 4); \
>>>> +		} while (hi1 != hi2);                 \
>>>> +		lo | ((u64)hi2 << 32);                \
>>>> +	})  
>>>
>>> I would name that one gpu_read64_counter and make it a static inline
>>> function. Note that we already have panthor_gpu_read_64bit_counter()
>>> which does the same thing, so maybe move it there and rename it along
>>> the way.  
>>
>> Happy to rename this to gpu_read64_counter in v3, if you're okay with
>> us keeping the macros/functions in this file.
> 
> Renaming the function is orthogonal to moving its definition to a
> different header, no? I'm not sure I see why one depends on the other.
