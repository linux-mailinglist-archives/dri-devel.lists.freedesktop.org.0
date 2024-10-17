Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB39A2C3D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 20:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E2410E207;
	Thu, 17 Oct 2024 18:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="HYhdN1K6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HYhdN1K6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7510E207
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 18:34:25 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vfLMiSn6owRpK/gOWOrhdf9N4sjbt5jbQrrDtHW69IiqnBmENE58yXpF0jW5ru2Zv0Ac/2kdpxzSba0k5S+RbAquEmEi2w1yhyBlgcw8bbedi6ij3d4U+pZ0PxCmVIFArqMn+wBkkaeB/WFn7Pr1YqhNeW+Y6qK1CP1kQroLJS7yKqJjf/uMj0xcf7fSfCm2Zmv4/qGwaBliWZ7qPEFAR7fXwkqWAbq6K5o1qFiVPqev0v/kgQ32AdxDX2qKo2i15CbmioEpCw2/L+xqLHYlPrw2QwwVXL4bZiwGmdSxjm+YcZ/v5p2qN9S5XZ9K4Y5LsMuvb5bpuQ/mJD9DcCoEZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+vbV7Xf4w0GWPiB9wMFR9ye9B2xYP8lEeh33z3GBKg=;
 b=oOIQqCccRDRp7ZVKNLRO8tDHBikjqSYUnsi57/vpm/0xrnBp1i7NuV/XCb05zLRROwEC6fGb5zzVjIMBxl9SSdFhqH/ltkL0K0eiknJHTv85lIqmMwJFiWE28muzzqxG5I6KGxiXsMSIv88JsLHwrB8RLC/FLS9mZs6t4JKIhCKo3hR5EkRzu+GNSqnjunQwEM+K+OgeuSkDJJsVp9hi/3KgC4Sm/z1gxDACZMgXMfrSpmZDS1R7mO2kBXhukWmp17wQATDN5ynJKo6afqx7DTVVMY0IyYAR18FH/zHyr28hXqd6gISgYbkmt27DwyJfCwYJt3YfaRDrn8XOf4nYJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+vbV7Xf4w0GWPiB9wMFR9ye9B2xYP8lEeh33z3GBKg=;
 b=HYhdN1K6HqSoLoYaB0qVK0G2pchjkkLeLojJdKsI2Q3mBta78AElnj5RiU2CFcimZszxpQNPK87kPpwBcemduNwvxAkTlAJbGpuwAUpKUjRDvYD8oEJTDNjYzFjKSqE/MylJVnFntuplgYjzdJGrtqBYrQjHBi5wK1pYW0SBmfQ=
Received: from DUZPR01CA0193.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::14) by AS1PR08MB7610.eurprd08.prod.outlook.com
 (2603:10a6:20b:475::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Thu, 17 Oct
 2024 18:34:21 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::c9) by DUZPR01CA0193.outlook.office365.com
 (2603:10a6:10:4b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20 via Frontend
 Transport; Thu, 17 Oct 2024 18:34:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8069.17
 via Frontend Transport; Thu, 17 Oct 2024 18:34:19 +0000
Received: ("Tessian outbound 5c9bb61b4476:v473");
 Thu, 17 Oct 2024 18:34:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4d9444b74a91f09
X-TessianGatewayMetadata: 367TmJERQykqjqeoU30ENfOgAnF1RPZl3ZQBqNCAfiSYbbNpTbukolICEbQ6/a9BTOLcsAAquHPCrg2t/Ym8L58xVU3s2N311jFEF1ZI6HMBwIK7oa/paH3G33ZRec4BcOQpE3+zhaMuFJyTAvGVjy69/rZE/CG3RxQUxOH1Os4=
X-CR-MTA-TID: 64aa7808
Received: from Ld2a913904e10.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48233960-7DD1-4C9E-9EA3-A60B0F2A761E.1; 
 Thu, 17 Oct 2024 18:34:12 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld2a913904e10.3 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 17 Oct 2024 18:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fflTnPes+jKLs1JqnEYQfzoqmnQfpeBH0PBHXBU9FK2r9FZAudfg8zHcqBbOAa5rSjp+Adffl92iW+nvMtTj664BXl2/7WXRLMqKl3ElDZ2PGtOMptv59IeY41ISvAvk4OW6j1MHzn7fv6Lqpl1oBv9cpetN8YtiYh9H9WJBGcqhZdXhUa4Aspg9cW+BqhZ9G6Sn624AhSO4/thaDnAQ/DlkWMUhwJ+RwXJWhC+G6OZvU3WaeAOiJNyEvydJuxmxZAswQl8k3HMQZwDhPUYHSPI6Q0GIwcJKDCi8MI95PCtifTEcRIGBOUN1jrG14c+CcJ4+H3oxlyNuubHa0PUHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+vbV7Xf4w0GWPiB9wMFR9ye9B2xYP8lEeh33z3GBKg=;
 b=wyumHTg3tOkm2R6a+hSGSwSKaD3kmBa7eddm+JsPeJAI9hKG+txxjPTQ7wKJt5sErG5Yi8joytruEYfSDg2V+qwnGWzF8zn3841k771rmuKmM+sQCArRwicwl9WeoudrRRaaSDmQzMkCLWiD6Mw7EFnUWpeV7WECJg2cK8VQsnvKdm9T6ct339WNNID2v5Qco7MyDHi12C3fOd/0iwNCg4VU9DKTt25gq01Wpf2OYNrPkRveSXu0BsCXHoRtAuvVmaNmYf4t6Y2tNFbXD03V1SsttI+r7iJ7aLQUtXW7LkuTkPUxHb82u9+GclBW80q/7fatVtKY56c1WXomgXFGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+vbV7Xf4w0GWPiB9wMFR9ye9B2xYP8lEeh33z3GBKg=;
 b=HYhdN1K6HqSoLoYaB0qVK0G2pchjkkLeLojJdKsI2Q3mBta78AElnj5RiU2CFcimZszxpQNPK87kPpwBcemduNwvxAkTlAJbGpuwAUpKUjRDvYD8oEJTDNjYzFjKSqE/MylJVnFntuplgYjzdJGrtqBYrQjHBi5wK1pYW0SBmfQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PAVPR08MB8824.eurprd08.prod.outlook.com (2603:10a6:102:2fd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 18:34:08 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%4]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 18:34:08 +0000
Message-ID: <a6930cb9-0ddd-4044-93ba-cb70cb7c89b8@arm.com>
Date: Thu, 17 Oct 2024 19:34:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] drm/panthor: Add uAPI
To: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-2-boris.brezillon@collabora.com>
 <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
 <1bd37b18455607b709529c8def963c4561e2ff1e.camel@collabora.com>
 <abded30f-3333-49e5-aac2-8da6ac64903b@arm.com>
 <da2c1dcbefcc25760d6a452e04d870987daf0a27.camel@collabora.com>
 <20241016161833.574494ee@collabora.com>
 <e4cd985a471f4ab787ac002ae67e957ee85ede85.camel@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <e4cd985a471f4ab787ac002ae67e957ee85ede85.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0217.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::14) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PAVPR08MB8824:EE_|DB1PEPF000509EC:EE_|AS1PR08MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: 047d5d54-0525-41c9-4c7b-08dceeda503e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?YUJyaHRzZzVnTlViUTZkS2FqaDFIYmErMnBnOW1aa0RWV3ZNSFJNd2RoMkNC?=
 =?utf-8?B?Q0NKSTZkcjVUbmJqMUc5cmR0K3pUdEE2b2hrRjRBY05oRWFFZXZXWGNxWjlx?=
 =?utf-8?B?U05SeVhsNEJvSVhZNnExeDJYVzRPQzNGbTZ1NGVlUkIxU3MxV1A3ZHZWUitw?=
 =?utf-8?B?dm5sd0pTNFlXbUN2SGR6VGhRSkh0YzkySFZnVUNmOW51Qm9TTVJscXp6cXky?=
 =?utf-8?B?ejhoL21VSFdzTkxzSVkxYi9TZ2J4OVViL1pSRzE1eWgrdVMxZjkvYWlmZTFY?=
 =?utf-8?B?VElUUjBNZTBpSmxhUEt6WDBPY3lxTGVxVkpjVERIQ0xCZ1hHeEhneSsrNnRG?=
 =?utf-8?B?WUhmMVRYMlc5TnBNVGkxd2w2S0l3bytkUFJraC9jUDBSQ3YzL1YrM3VKekJj?=
 =?utf-8?B?OWJhT3R1djZ0WUNTejkwV0pNaTM4emR5N21Cc1A3YlFMYXZYM0RTZUVmSVlo?=
 =?utf-8?B?TjhWbGIraUlxVUV5eTRxRUlUUWdlMFJBR29qS29xWmsxQ0M1UVpiMDVVaUFV?=
 =?utf-8?B?TGF6V3pDd2t1RGh0cDZpMzBETm5aVERvaTgrVXNUOFZNRW1FV3lXNjhwNmta?=
 =?utf-8?B?YlFjVit2YUtqWkhybERlcHhTWGhMcFhYMkFvK0xsVFBUVDRrV2E3RjZxbGpm?=
 =?utf-8?B?cUVaUks2TjFRTGR5YXU1L2ZJbVdJM0QzTHB4Y1JUTGZvcmVScGhkV3BMcGNm?=
 =?utf-8?B?bU5LWFgwc2ZyRVRpcTN5dUlmRFlpbkhCbHRDMkp3L1NEOHpnMnBmZGtWbzEw?=
 =?utf-8?B?d2tpUy9nOWlZb2RpYXdPZnkxZm0zV1doNVl3bTBsZE5DeTYrRHVrVTVYeXk0?=
 =?utf-8?B?NVhSVkR4OE5YQU5sa1cycjZXZGlxRkNCaWk4ci84SHpwcjl3bVFoRDJVZDB4?=
 =?utf-8?B?UnhGN1ZuOVJXYTJINVRGWWN6elpvbnIvVzlwUG9YMVo5RVRzVzd0OTZBYTEr?=
 =?utf-8?B?U3VzMzdIOEg0dHRPVnAzWGVYWlNOYSthRzJMRGlSWjZiM2Joanhnc3pyb1BT?=
 =?utf-8?B?dk10eS9aTThDRFZ4cm5JVUo3Z3IyOUpEUkh4MStwcEdTVGhQRUZuRm1HNHRi?=
 =?utf-8?B?TW5obnpEN3FveVFrNWxLRGsxWmxhUDBWakg0Z0ozZzBFYkUxM29FTjRBSTdG?=
 =?utf-8?B?Y3YxdTBNSXNGb09ObEU1dVI5OER1SlBpMVNCcUJnbWZjK0FWTk9UNHU1R1I5?=
 =?utf-8?B?SlNvTEVXUUxNVi9yUWxxZG9rYktNU1BTRWtnSDk3dDVSdGFQbkJsOXhCYUo1?=
 =?utf-8?B?d2s0MUVTWE9JUGgvRkNkUmdFRE9kdlo2QkRTc3hrSDhyd3E1WTZVMURlSjl2?=
 =?utf-8?B?V2hDQzBJb2owWVRJSU9aVGgxZFE0NFlFVUErUTJzQndUcUsySENSc0h2OUYz?=
 =?utf-8?B?eEhSZ09qZ3lGMllJVjF5dnhpY1lWT044VnNWaHBKTUJpSzNjdWMybGVUeUha?=
 =?utf-8?B?dnpjQy9QcUdscXN4SDVTWUVhLytrak9iNTBzejZFY3FpZnVHWXo2NFdqdWxL?=
 =?utf-8?B?Z1FYakh4ZDYraCtINnJ3TXpQdTkvZ1hBU2NxL1NLaFk2VVVLVnhTVzhlRkQ4?=
 =?utf-8?B?ZUVvbnM5d0RSb20wVXc4WFhwVlQvSlcvVUphdVVxeFMvdUJQeG5oTXYwcm5v?=
 =?utf-8?B?Y25mZm1ZYXZwTFgvdjBDUll5R2tMVHpOU1ViUGNWUXVidWk1MlZTMzBqVzlP?=
 =?utf-8?B?d3kwNUNQQjRxNGZMK1IzY3Z4T2xpUGI0RHh0bWNBQXdZdmxKdE5TaWxkR05k?=
 =?utf-8?Q?BYwDgD/KZn47u4ZR6AYJuoctZD+jeovYSqa3jVN?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8824
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 04dd27e8-5849-4472-c87f-08dceeda4951
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|35042699022|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEdOSGYvMUpSREFhWkFVMGU0MmcrQ1RFUHdwVWoxeGxEaVVBSEdYU1Z5Zk1o?=
 =?utf-8?B?VmZWbUZUcVdwNFhsR2NLdzFNdnNHdGYzdnFRbEhtd2hSWnJuS0VwQnFidVpJ?=
 =?utf-8?B?UE1hZk9hQlpmaG1CTHozVkpvVXJ4emNSaC84ekFJS2V6dTN5eTdZNkNjdWsz?=
 =?utf-8?B?ejluME1nUXlzemFIOS9DRkxMM0JaSlowQlJ4SzlsV3lWWFkxVnBjRnI3dWYy?=
 =?utf-8?B?NER0d0I0RHFFMk5yOWNaZDY2aVo1S3VaYWpxTnRPeDgvcU5PUWdBSmM1ZGhs?=
 =?utf-8?B?cTIxRStNYnA0eGZYVGFQcWtsbWVVV0ZUY2h3YTVkd1phVTVHSVl5TXloMlJi?=
 =?utf-8?B?SFZ1NUtGVlpWQUsxeGJzSHd1NVBSZ1JaV215YjA2Q0lubUpGTUtHc0xOZlMx?=
 =?utf-8?B?Mzg0cWN6QlRPVEsyZVFzS3VrN2RpdHBpYUx6OUZjWjU5My9ybG9za0ZJck91?=
 =?utf-8?B?Z2cvZ1pGbk1VM2R3cjNzcDF1QTg1Q1lGd1BmY012bmVhVTY0MjQzU2I0aCtw?=
 =?utf-8?B?bVRJeDNSOThwcjN3azZUcHNqSk9iQUFXZllzaVRxUGZUR2tEbFd2Q3B4Nkdp?=
 =?utf-8?B?OGU2bXliV2pHbkNuVDRwRnZFbHRwa3dwRUNURVk4emNPNk1kVldqcVYvVTFr?=
 =?utf-8?B?YUZJeXlRQnZEVUt1dHduQTlRMXI4ZVA0YmFFTWU0dEVibzZZSnY5c1Y5S1pa?=
 =?utf-8?B?VUdJM0g2MHVyK2tUWG9qaUYvVm9tdEoya0tEV0FjbmtPeUFHWU9yU3QrVXlJ?=
 =?utf-8?B?bmY2RnBMTUxFRmR0eG93ZDNtTHRuWUp2dXR0aXMwMTk1UFJJZUo4d1p1MkJ2?=
 =?utf-8?B?OXRlMDZVUklEYTg1Q1g3cGNGb0lqdmN6cDE1anZ5QXg3Mk5JWkhzYWIxV29H?=
 =?utf-8?B?dDBBME1WbDhVTTI1Uy81WTNMWE9RRFVEY28vZktROGFXM21kTkhtUWtVcWFZ?=
 =?utf-8?B?RjZ3dGtTTjlVMWJUbzFveURBMGx1aGQxd0NRT3pNMzZMYUMyYTRjV1lhOTNJ?=
 =?utf-8?B?ZWVVNERHUkx3T1VZMTcweGtHUTlyejhBTjV6L3ZpTzRhd0NCN0tRUFFLeTlm?=
 =?utf-8?B?K2VRdEQvMmU4VXNISENsYWRDc0tIUWZBRGprWW9ScDNNY2dweHFuZDFCMTdz?=
 =?utf-8?B?SDlUd0xHSkZZZGUvcmpEQkQzZmlTOFlSQ2ZuSVc1YStiQmVzTk84WHdFbXVJ?=
 =?utf-8?B?c2dnWGJlSTYxaEdIN3owZ2JvREdUWXd4RU5mTktzNEtkNHhpYVk4blJJRzdh?=
 =?utf-8?B?czRVRGJSMkRxcFNJYmxWZlk3VWdvcEdmSVpCM3hTSDl2aFBDbHJFbk9KVWhh?=
 =?utf-8?B?dllBYnJmWFZtVTkzS0RWemdNVFEzRHQ0Uk1YYXlIQ1R0WmtZdUFSY3NHbzNv?=
 =?utf-8?B?QVNYMDcwcTE1SWFlWFRnU0xNdGxtSjQ3V2VpNlBKYnB3S2RHOFhIcmN5WTM3?=
 =?utf-8?B?SjJxaUlGWEZ2TGpycFpsRXFaVTJnYUptSFk1aDNtRmxGYklUTGVLbFd2aTZi?=
 =?utf-8?B?ZzBxaG9ITEZJdi80LzJpYVQxYU9zdUxsOHZxNVJJL2V4RUpNZEVQRWpLY3pT?=
 =?utf-8?B?USsrL1R1QkdIa0xZK2paSzc2MmtEcE9Oa011RDYwT0t6eVdoRUVMSFdBNFlI?=
 =?utf-8?B?S2RWSkltSHg0RkpHbmg5ck1hNFJCL2ZpZDJPQXk1QlU1ay9MZGNlaGVqQmwx?=
 =?utf-8?B?d3BEcUdPeE51SlRmNTZEV05mRDBMRjhjNlpvU2o4eEMva1htWWNMVzlubTBG?=
 =?utf-8?B?WWp4MWhteGMxOUFNOURCY2hvYW5XS1A1ZGpmQXFoZjhhOWsyVi84VXNzdUt2?=
 =?utf-8?B?SnJ6WThRS2pZV0JSMGkvMVVxN3JXRmVNUmROY0Z4cjg3elVKdXZraWVJazRt?=
 =?utf-8?B?VVl3RDEzN2crYU9TUEhHck9jQ2VJRzdnUVZzQ0E4Z3R6UGc9PQ==?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(35042699022)(82310400026)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 18:34:19.6152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 047d5d54-0525-41c9-4c7b-08dceeda503e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7610
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

Hi Erik,

On 17/10/2024 09:51, Erik Faye-Lund wrote:
> On Wed, 2024-10-16 at 16:18 +0200, Boris Brezillon wrote:
>> On Wed, 16 Oct 2024 16:05:55 +0200
>> Erik Faye-Lund <erik.faye-lund@collabora.com> wrote:
>>
>>> On Wed, 2024-10-16 at 15:02 +0100, Robin Murphy wrote:
>>>> On 2024-10-16 2:50 pm, Erik Faye-Lund wrote:
>>>>> On Wed, 2024-10-16 at 15:16 +0200, Erik Faye-Lund wrote:
>>>>>> On Thu, 2024-02-29 at 17:22 +0100, Boris Brezillon wrote:
>>>>>>> +/**
>>>>>>> + * enum drm_panthor_sync_op_flags - Synchronization
>>>>>>> operation
>>>>>>> flags.
>>>>>>> + */
>>>>>>> +enum drm_panthor_sync_op_flags {
>>>>>>> +       /** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK:
>>>>>>> Synchronization
>>>>>>> handle type mask. */
>>>>>>> +       DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK =3D 0xff,
>>>>>>> +
>>>>>>> +       /** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
>>>>>>> Synchronization object type. */
>>>>>>> +       DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ =3D 0,
>>>>>>> +
>>>>>>> +       /**
>>>>>>> +        *
>>>>>>> @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
>>>>>>> Timeline synchronization
>>>>>>> +        * object type.
>>>>>>> +        */
>>>>>>> +       DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ =3D
>>>>>>> 1,
>>>>>>> +
>>>>>>> +       /** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
>>>>>>> +       DRM_PANTHOR_SYNC_OP_WAIT =3D 0 << 31,
>>>>>>> +
>>>>>>> +       /** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation.
>>>>>>> */
>>>>>>> +       DRM_PANTHOR_SYNC_OP_SIGNAL =3D (int)(1u << 31),
>>>>>>
>>>>>> Why do we cast to int here? 1u << 31 doesn't fit in a 32-bit
>>>>>> signed
>>>>>> integer, so isn't this undefined behavior in C?
>>>>>>
>>>>>
>>>>> Seems this was proposed here:
>>>>> https://lore.kernel.org/dri-devel/89be8f8f-7c4e-4efd-0b7b-c30bcfbf1d2=
3@arm.com/
>>>>>
>>>>> ...that kinda sounds like bad advice to me.
>>>>>
>>>>> Also, it's been pointed out to me elsewhere that this isn't
>>>>> *technically speaking* undefined, it's "implementation
>>>>> defined".
>>>>> But as
>>>>> far as kernel interfaces goes, that's pretty much the same; we
>>>>> can't
>>>>> guarantee that the kernel and the user-space is using the same
>>>>> implementation.
>>>>>
>>>>> Here's the quote from the C99 spec, section 6.3.1.3 "Signed and
>>>>> unsigned integers":
>>>>>
>>>>> """
>>>>> Otherwise, the new type is signed and the value cannot be
>>>>> represented
>>>>> in it; either the result is implementation-defined or an
>>>>> implementation-defined signal is raised
>>>>> """"
>>>>>
>>>>> I think a better approach be to use -1 << 31, which is well-
>>>>> defined.
>>>>> But the problem then becomes assigning it into
>>>>> drm_panthor_sync_op::flags in a well-defined way... Could we
>>>>> make
>>>>> the
>>>>> field signed? That seems a bit bad as well...
>>>>
>>>> Is that a problem? Signed->unsigned conversion is always well-
>>>> defined
>>>> (6.3.1.3 again), since it doesn't depend on how the signed type
>>>> represents negatives.
>>>>
>>>> Robin.
>>>
>>> Ah, you're right. So that could fix the problem, indeed.
>>
>> On the other hand, I hate the idea of having -1 << 31 to encode
>> bit31-set. That's even worse for DRM_PANTHOR_VM_BIND_OP_TYPE_xxx when
>> we'll reach a value above 0x7, because then the negative value is
>> hard
>> to map to its unsigned representation. If we really care about this
>> corner case, I'd rather go full-defines for flags and call it a day.
>>
>
> Yeah, I suppose it can get ugly for some other cases.
>
> If we rule that out, I think there's only two options I can think of
> left:
>
> 1. Using #defines instead, like Boris suggested
> 2. Using 64 bit signed enums (e.g "1ll << 31" instead)
>
> Again, #2 here would be the smaller change. But I kinda think I lean
> towards #1, because... These aren't really enumerators. They are flags.>
> ...Yeah, sure. In C the practical difference isn't huge. But if we ever
> wanted to support using these enums from C++ code, we'd need to add
> overloaded operators, because C++ doesn't allow ORing together enums
> out of the box.

That's only true for enum classes. Plain'ol enums' values can be ORed at
will (but you will need to `static_cast` them back to the enum type,
admittedly, because they auto-"promote" to int for the arithmetic op).

I've had to use uAPI from C++ and the most painless approach, once you
finish writing it, is to wrap the whole uAPI in C++ constructs anyway.
So I wouldn't consider that angle, personally.

>
> I'm not saying I have any plans on using the uAPI from C++, just saying
> that if we're going to tackle this, we might as well tackle it
> completely...
>
> Also, expanding the enum-type to 64 bits might have some additional
> consequences, like needlessly needing more stack-space to pass values
> around etc.
>
> Thoughts? Surely there must be some precedence on using the top bit for
> flags in the kernel, no?

--
Mihail Atanassov <mihail.atanassov@arm.com>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
