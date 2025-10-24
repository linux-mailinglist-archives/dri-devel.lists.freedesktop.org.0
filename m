Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79900C06193
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8F310EA3E;
	Fri, 24 Oct 2025 11:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="kzht8Uar";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kzht8Uar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F47710EA3E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:52:30 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jHQk1qMOBqiVLZ80sRrO3I2ZXkrasKK1P1wpe2PBXGRsPkDoGasPlwV5gxpPigyTUONINd/pFmYjQ0F1RMraG4JDWZa4KsH/b1Zy4mC3JzsGW7w5yMqx7CvIqE6kY2h1zQxfi9Co0eOEzfKIlpJC1F+0+bxYe2gJPKh4kXprazMNFb9GZB7xte9paq5koDwmgxN8AzKOxFppuU9eV9AzsmfvCFNJVc+mYNu9LQ2ceyxJ9Mp82V/a9LFztsbznzNf8Cpi6fkEh/m/Bwo40g8SiHiABxaG9XHt9q8Who0TV2VEW9zDVlDJFRgoNJ7DXsi7nIDvMcR/NZHnUBJYjFf4+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFaUrmb8bts49obovmrwNdtGkXam098pnLRryYU+jpo=;
 b=wxBDPKQDZvzRgUBPhCZs9KZTivJMZrZ40EMQHdDXqfi4+0FsZd06d6RLzQDLUVDoO4lP1Rfca5z+NewAgfsQrJFV+M9urzLqhqHFwSY9jyVDCHk4IAByafYfFlaHAGrm9aLj5w9gjgqksdw4pWVwlkro0kcPRbVHBRIxDcsxG2RVXUQuWHhOTZA2MRVeuph04uswfe98wXltiiuR7q+Yti+GL56fe7dsq/6wHHZ3cZ4frZs65bQkkZ1r1Bl/UlHwh524OY09UerPUG3LLZIB6gikVZ9e2n5eBCm5DqZVepLd3i7EOolaAdtZktw5owmb50/VZuuf5ZeMYJXEVZzUdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFaUrmb8bts49obovmrwNdtGkXam098pnLRryYU+jpo=;
 b=kzht8UarPTtmjydbVFInQLif7nvYdbnZJMOPohh2PlHfZKLA7cWDXZm1Dwg9pPLxu4bJpMPGWj990LQrdxsURiXtv2TE+d8ldO+q0ZGtatSeWoSUgBWyDrQqKDrdkZ7CWQ8NqnzP08ThHAgRkuFPfPvmi50aC5RBHtXotv7QELg=
Received: from DU2PR04CA0267.eurprd04.prod.outlook.com (2603:10a6:10:28e::32)
 by AS2PR08MB10227.eurprd08.prod.outlook.com (2603:10a6:20b:647::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 11:52:27 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::32) by DU2PR04CA0267.outlook.office365.com
 (2603:10a6:10:28e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 11:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 11:52:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wm0H5+DxmzXpkQz9lqk2BLyc3yb0FI5+BudpcMW7Qp+zHTWFUqpI6BWgOU2EkAGwhMc8bFXvvu8NHLgnfIohvqmwX/4qcVoTW5L8Mww2szHdU9RBk4QbSP+AtJM7a8PvD3cML0UoDr0l6vqtp89NisWitG8SMz9Sj266fMB7Ex4o3aKHTv9H8PTct4mFjtciLzBx5Nrsn1R8KKVLoBllqF99r1OSv5w3zgZjxdsDWHqWEWE2EOoYeuP5tYSFiKYU8yo6LoDIusnW6k3zjsq1Pj2qkPga9uoW52jXDNvvI/2rXV7PiTIwzFQ5ltK5lo83zyA8+toJ2G+tPXyoh+0adg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFaUrmb8bts49obovmrwNdtGkXam098pnLRryYU+jpo=;
 b=wFncPx/Y2Au7UjGw5dqaAddv96tsGzolqXn/r0KFHkq3Pu4/ha4gGvhHqniKt89mj42LRQjxHyb+efkKDuXBPsFbmC/AvAr9KH4aaRGInBAP3uisRP0hDTqHUeweWaWRdN5FFuSN2QH0m/xdftRJG6SwsHd1p1bTmQ8VDYGX1ulzXWQ4iJWp0m+XOrtfIgtQh88aWPFQQxbNAyXKg3hD+wSngHhNH/PI7ntz37ktr2mAa8NuFpgHPQzqEMUcBwjxgkSL9AxLPak40i77+RYyTp5lh/+eCjH4803MJqCgmrns9QsS5aIxWn/ZxYsYdUn2dreXg4l3apEbdAWDu14npg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFaUrmb8bts49obovmrwNdtGkXam098pnLRryYU+jpo=;
 b=kzht8UarPTtmjydbVFInQLif7nvYdbnZJMOPohh2PlHfZKLA7cWDXZm1Dwg9pPLxu4bJpMPGWj990LQrdxsURiXtv2TE+d8ldO+q0ZGtatSeWoSUgBWyDrQqKDrdkZ7CWQ8NqnzP08ThHAgRkuFPfPvmi50aC5RBHtXotv7QELg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DBAPR08MB5798.eurprd08.prod.outlook.com
 (2603:10a6:10:1a6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 11:51:52 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 11:51:51 +0000
Message-ID: <65785979-5bb4-494c-ba25-d97fb0152075@arm.com>
Date: Fri, 24 Oct 2025 12:51:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] drm/panthor: Implement L2 power on/off via
 PWR_CONTROL
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20251014094337.1009601-1-karunika.choo@arm.com>
 <20251014094337.1009601-7-karunika.choo@arm.com>
 <022e2ea5-74e3-4d53-9afe-8ead71853ee4@arm.com>
 <a9cd1999-12d9-41cf-aef6-a6c3f1f23e4c@arm.com>
 <e74ec0b1-4975-4fd5-bb1a-4839c45987f7@arm.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <e74ec0b1-4975-4fd5-bb1a-4839c45987f7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0466.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::21) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DBAPR08MB5798:EE_|DU2PEPF00028D09:EE_|AS2PR08MB10227:EE_
X-MS-Office365-Filtering-Correlation-Id: 1949731c-b0f5-4959-e1d8-08de12f3cd40
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?RkpqbjVDakZSME9KY0VoUm95MjI3em1BbjRFK2V0eDRFQS80REpBaHRVTFg5?=
 =?utf-8?B?cG9ocklwNVMrbUZkY2RNWTUrWUIvY1dOVmFRV0k0WFFpRXlTclNIWWhQbkds?=
 =?utf-8?B?eHdiaURiUzdxTXhMelFYL1VGTEY5OUhmV3VpbXk3clNxdk9FTisvNTdINGJF?=
 =?utf-8?B?c1pQYXVVWmFhK3NMU3ArV3Q3RHdjUmdyWW1kV0ZIcEgvS0FIQ1JYc01CdUlV?=
 =?utf-8?B?d1NQMTJhaTJrbWdqTU9mb2h5c0RwSlhQR2kxdnE5STdoS0FpV0tDaUV4ZllO?=
 =?utf-8?B?aStHZS9aR282WE0zejRodWZUUU12Y1Z2SXZDSU5CK3VsNW43VmhDY1dHTnVB?=
 =?utf-8?B?WURwczBOTzU0MVN0WlN5WUJiTVRHc0Z0WHZsM212VDFJN04zcHdCMXcvSEZv?=
 =?utf-8?B?ZkZaOTNXVHo1dlZlOGZpcHlxbmZ2NGpqSTJUVEpDM1ZpTGxvWkdHMlBtb2xM?=
 =?utf-8?B?eStZNHhTYU16Q2NBbk5zU21BK2xZOW52bEs4dW5iVHZZdlluZUhaSER5alRR?=
 =?utf-8?B?Rlg3MklLQjFGZUo3eUFuRThKYVhCUTg0a1FaNWhsR1d4MEcra3NHOXFXdXBQ?=
 =?utf-8?B?VWNDN3JvdVF3TlBTc3dUU2lzcFdHK0RlY1NEYWVDSDZ6UlNqMkV0eHpieUp2?=
 =?utf-8?B?Qm5JSDIrTHZxckQ3R1VmNS9uRGI0alF0d3MxQk1hNUlsNmlzdzMvdm52SnB5?=
 =?utf-8?B?QXcvOWd5UjF0SUtMNUpUNlRHRldrMDAwTVVkL0dyUGlqOGVNZUFxdVhJMzdB?=
 =?utf-8?B?cjNKTlUyWE56cFRROGxVa3JPeXBYQXpINld1MEVjN2o1cHRqTnMxSWF0R00x?=
 =?utf-8?B?SkVqOE5jdjJWc01Bb0pqSTZRZFQ1R2dXTXFhcUYyTGxZTmRINDRnVkdLSzVz?=
 =?utf-8?B?bVNzZldoZkZSUk55VG1NRWtlUXUwOGZkSzhPYWVqbVoxeFRPaEF5KzRrTTlP?=
 =?utf-8?B?Kzd5U3JUUHVtMnpWMjN1eGljOHIxRDBUV0hnV2djV3hXYlFjT0FDci9IdkY4?=
 =?utf-8?B?TFVBTkU2elMrUlZUb1RyT2MzdDYwdENieTV2NW9COEZndTVTQm9wR0plME1G?=
 =?utf-8?B?ZUR4cm1EeFcwMDBOR1M5TE1pTm4xVHNhdjhjQjNNS3lqaGo1aUVSNUF5RmF1?=
 =?utf-8?B?WlJkSDMzVW12aU14ZDFwYXZVUUZZNVRzazhsV1Fmc2E4M0o3emFDQnJmVTkx?=
 =?utf-8?B?VG10aWNDQ3ZRZVU3RkVDWWdsNVNxM1ZYVzhranBOa0tVOUYwcXpTZ0U5a25T?=
 =?utf-8?B?QjNMODZvdnhhQTZvMVVzQlFWbkt1a3Jrc3ZtTVFFMGRPbTJPc1FCS2V0TUhv?=
 =?utf-8?B?NXhmbFNXdFZWdERXQ2NzQzlPZEZIUkR2WWVSR2Naa01wSExNUGhzQmZpVGQ1?=
 =?utf-8?B?TTIxZmRWaU9jRVY3eFFwNVRnNmkwR1FScnlyTEYrcUVwUk8rSjlOUWk0Ui9w?=
 =?utf-8?B?aXk5dHEyMVQ0ZnhlQTlBYjNaSVZSMnFHaG11eDlVM3JwS2VrR08rUlFLdVJw?=
 =?utf-8?B?M1hLb0tPWWFDT2xyUGNFTnF3MkkvY0cxMVRIVjdNTTU4RUtpNFlxK3ZCU2hF?=
 =?utf-8?B?eU5LTWRYUy9TTzlEZnBEK01BVUxqb2lxUDU1eEZhalMrRWx5NUtWaVF2ZVhq?=
 =?utf-8?B?RlJ2NDJ2bWpsc09LUXdkblcyN0hZdXlmczJXSUxLWHU1N2trMTlGVHhrdXV1?=
 =?utf-8?B?RjluVnpHRXduSUdIbTI4TlNINUc1VUlnaUh4dWlWcXErWkxnb1k5OTNGa01y?=
 =?utf-8?B?MjhDRXFlMUZzRE9KNnFoMEszZkp2MUZNQTViSXY2UzYxeUJOaUZGbXlibGNw?=
 =?utf-8?B?M212OWljTHN6dThMZ3JGZDZ2K3ZTNHBRdzJmTjFTMUEvbkRsMnRaS29hc0Nz?=
 =?utf-8?B?bFhkT2hZcWVCQUQvMlNid01Rc056OWtOcThRS0NjQ1l2eGtSNmFvaEJtM3NM?=
 =?utf-8?Q?rQFcE922W1hFqTAV6dPEbk1iCRatAwKo?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5798
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 474a5ee5-0ab0-41b2-3523-08de12f3b87e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|36860700013|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU1NQjdsM3dWVUhZazFuYW1pNlZFY21LU3NjVEVDT2ZjRnZxcnpSWXRJdmN4?=
 =?utf-8?B?ajYvTndtZC8wZUVuQmc2QngxZTJYb1M5VXQ4cVZtS0xnSGwzVnNjV3BiWStU?=
 =?utf-8?B?ajZjL0g3RVJnQlg4cXQwUGdJYVlLWlRtdnBuYlRFM2RuMzRwaEJRSWZOTE0x?=
 =?utf-8?B?Z1pxSm56VlR6amxUblRBVFpjRlRoaFZXeHVKNjExSVZtS21xcE5OZHEzNVBt?=
 =?utf-8?B?bnJyQTlYSGYzYy9SL041UEhsYUI5d3pvNUxIU3JjbkpRb1FGS1d3Zk12SGdS?=
 =?utf-8?B?Q0VkUFg3c0t1SW1BYUJoL2hOeTRoRkIweU8yTjU1cVZENkFFemFCSXZpVm15?=
 =?utf-8?B?RDdqTUMvbGtpL1FXWHBsb0thRDg4Z1BIcmF0bk9QYkhmV0FLODhXQW9QaWY1?=
 =?utf-8?B?cWorNzBTc0lLbEIxTUxwUmYzY1M5ZzhXNEJyOTc3RkxBcWcxbkFtcTgxMkw5?=
 =?utf-8?B?bVAyaFhtUVBja0ZBcHVTdUFEVmJUd1FSOEUyYVBhSWZhZVJpS1BVcmdYajlP?=
 =?utf-8?B?WVFSUEx0WTRyZ2JnTTB6UmlMaUdrR1IyMjkzOVY3Y2d4aVM2OWtiRzgxRGFO?=
 =?utf-8?B?cnZKRzBqdldhRCt2dlhmcEUzRjFJeEV0d2V3NktUb2xjVzNhZlJCZFM0YlA5?=
 =?utf-8?B?ajRJcFR3RG95MmZFd1RhZFNEK0tpVzdiZFg0MkNZeWhLV1pudFEyRWNVUURD?=
 =?utf-8?B?QlNmaFY3c3lzN1Q5aGlmazFCRWFqTnVJWDJHdjU3dDdPdXFUTGJ0VGU5NzAv?=
 =?utf-8?B?dEtHa1U4Vkl3S3EvOEhZZWM0OUFwazlINnFKekRyalBsRWZIakptUDZucnJU?=
 =?utf-8?B?UWxISFBwUW52T0JMU29BL0FwdmVWZEJtMm16VElMZUpMVHJ0QlgyVUVGTFpQ?=
 =?utf-8?B?ajBuL09zYmdRMGZNYmErSVY1bm5jY3krM0FJQWc4cmNRZVQrRkM5cFA4STd0?=
 =?utf-8?B?eTV3bVgxaHlFdFJZM2lreWlZM1BWSVc1TUdhTW5Zb0tDSDlWa2dUOGw2eHhm?=
 =?utf-8?B?QWlGZzF1QitWSU56ZWJYaG9JYm11aHRKeFk0dkljSWFBVE9zc000eW1lZXY5?=
 =?utf-8?B?aWdQNTlsdy8zcnVuU29jbXpiRVh4V215d3FDOTdaejBkV2JHdEZYMXNRL29s?=
 =?utf-8?B?ZUFHTWg1SHlNTVh3WXd5aEVtUXhXbjlGV09Jd0Iza081K0tPaXBsYi9nMHA4?=
 =?utf-8?B?UDV4SzMyVnhldTFGVlp2bVJNZERNakE4QVNDTmdrV0NKc3NGUHpsR1F1VTY2?=
 =?utf-8?B?WUZNTkNsbjQvQmo0R3ZzRlRYd21PRnZTbVhXZDFWaHFzYllSZ2w2N1VuN3lK?=
 =?utf-8?B?bmRBMkRobC9wQ1JKc3J4NURUK0ZXdGpLeUdYci9KTE1xVjBxYkl5YTJGVnFK?=
 =?utf-8?B?RlFzWU0vY05YK2NvM25jdmNKWERYWTRhZnhIYUt6em95dkM3bkdJMi9Gck56?=
 =?utf-8?B?L05GNU0xQmg1QnFEUGg5M3lZZ3ZHcG1xZEJIK3pxdmdOOUthNi9TdWxOV0Nl?=
 =?utf-8?B?T1AvK0xpWTZjV3ZqUXFDclJxdXdlcXI4d2pXTTRPVUp1RDh5THNTY2FtOVVY?=
 =?utf-8?B?dkp4YzVVS2l4dWhIUjhZZFhSRWRnTzh2NjlkTnJmNmJnRGlRdE1hUkxwczQx?=
 =?utf-8?B?QlczbkQ2Y2JLL1JjMGkvMUYxVExQbXZXaGxzeGY3M2RsWElKWkZFSVRMS1BP?=
 =?utf-8?B?MlF2MUI2R21nQWhoQkV2Ui9xWVpzVEg5dlNVeVpTMFhhSDZtVXl1WEw3MG92?=
 =?utf-8?B?UG1xSk5PQ0s4T1JibEEyKzBzMDZlYnhzaFRONDN1OWhDYVRnT3VLMXdjdkY2?=
 =?utf-8?B?bGQ0Sy9mZHFDSFpvdmZUanVsQmZvNE9WTGw3anp2Y1VIaDE5cWZET1h5TzN6?=
 =?utf-8?B?TXBqWG1TTDlkMFY4YjFSK3NHRVNKMnkwMTNZU2JaWXNuL0F0dytmOENneThH?=
 =?utf-8?B?YUNqMUttVyt3ODJxd0hOWXV1eXpKVDFKVFk4ai9UR0VKTXA2cHBKQWtyUG5m?=
 =?utf-8?B?ZVJKYUFjOHNuTkQzYmdYcUZQYW0yaUJLOWZaMGlVZS9paTVwU24rdDdyeEJt?=
 =?utf-8?B?d3Y2MU1UbUtxNUw0aUgyK1lWRHBsVGliY2grZ0JEZERTVXFSUTNJckg3dTVS?=
 =?utf-8?Q?L7AA=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(36860700013)(376014)(35042699022)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 11:52:26.2047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1949731c-b0f5-4959-e1d8-08de12f3cd40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10227
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

On 24/10/2025 10:43, Steven Price wrote:
> On 23/10/2025 23:16, Karunika Choo wrote:
>> On 20/10/2025 11:50, Steven Price wrote:
>>> On 14/10/2025 10:43, Karunika Choo wrote:
>>>> This patch adds common helpers to issue power commands, poll
>>>> transitions, and validate domain state, then wires them into the L2
>>>> on/off paths.
>>>>
>>>> The L2 power-on sequence now delegates control of the SHADER and TILER
>>>> domains to the MCU when allowed, while the L2 itself is never delegated.
>>>> On power-off, dependent domains beneath the L2 are checked, and if
>>>> necessary, retracted and powered down to maintain proper domain
>>>> ordering.
>>>>
>>>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>>>> ---
> [...]
>>>> +		u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(child_domain));
>>>> +
>>>> +		if (domain_ready && (pwr_status & PWR_STATUS_DOMAIN_DELEGATED(child_domain))) {
>>>> +			drm_warn(&ptdev->base,
>>>> +				 "L2 power off: Delegated %s domain not powered down by MCU",
>>>> +				 get_domain_name(child_domain));
>>>> +			ret = retract_domain(ptdev, child_domain);
>>>> +			if (ret) {
>>>> +				drm_err(&ptdev->base, "Failed to retract %s domain",
>>>> +					get_domain_name(child_domain));
>>>> +				panthor_pwr_info_show(ptdev);
>>>> +				return ret;
>>>> +			}
>>>> +		}
>>>> +
>>>> +		ret = panthor_pwr_domain_power_off(ptdev, child_domain, domain_ready,
>>>> +						   PWR_TRANSITION_TIMEOUT_US);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	return panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2,
>>>> +					    ptdev->gpu_info.l2_present,
>>>> +					    PWR_TRANSITION_TIMEOUT_US);
>>>
>>> Does this implicitly 'retract' the shader/tiler power domains? If so I
>>> think it's worth a comment. Otherwise it looks like we don't actually
>>> know the status of whether the shader/tiler power domains are retracted
>>> or not.
>>>
>>
>> panthor_pwr_l2_power_off() will only retract the shader/tiler domains if
>> they have not been powered down by the MCU. In cases where the MCU did
>> power down these child domains, delegate_domain() will exit early as
>> they would already be delegated. I understand the ambiguity here,
>> hopefully it is somewhat acceptable.
> 
> So my question was really how does the driver know whether the domains
> are delegated or not when this function returns?
> 
> I couldn't quite get my head around whether turning the L2 power domain
> off would implicitly 'retract' the shader/tiler power domains -
> obviously it forces them off which means the MCU doesn't have control.
> So retracting would make sense, but I couldn't see anything in the spec.
> 
> It would be good to have a comment explaining what the expected state is
> after this function (panthor_pwr_l2_power_off) returns. Is it unknown
> whether the shader/tiler are retracted, or is there something in the
> hardware which does this automatically so we know but don't have to
> manually retract? Presumably if we end up fully powering down the GPU
> that must effectively retract all domains (the GPU hardware is reset so
> it goes back to reset conditions).
> 
> Sorry, it's a bit of a basic question but the spec is somewhat unhelpful
> on this point! (Or at least I haven't found a relevant statement).
> 

Powering off the L2 does not automatically retract its child domains.
The above case is for handling the edge case where the MCU is hung and
is not able to power off the delegated domains, therefore the host needs
to take over and power them down before turning off the L2. Additionally,
like you have alluded to, powering off the GPU will inevitably reset all
of these states (retracting the child domains), necessitating a
re-delegation on L2 power on.

Therefore, the typical operation loop will be as follows:
 1. L2 power on
 2. Delegate Tiler/Shader
 <suspend>
 3. Halt MCU (should power down Tiler/Shader)
 4. L2 power off (no retract of Tiler/Shader)
 <resume>
 5. L2 power on (next resume)
 6. Delegate Tiler/Shader (skipped as already delegated)

If the MCU is hung:
 1. L2 power on
 2. Delegate Tiler/Shader
 <suspend>
 3. Halt MCU fails
 4. L2 power off (Retract and power off Shader/Tiler)
 <resume>
 5. L2 power on
 6. Delegate Tiler/Shader

If the GPU is turned off between suspend and resume:
 1. L2 power on
 2. Delegate Tiler/Shader
 <suspend>
 3. Halt MCU (should power down Tiler/Shader)
 4. L2 power off (no retract of Tiler/Shader)
 <GPU turned off>
 <resume>
 6. L2 power on
 7. Delegate Tiler/Shader

With the current implementation, we cannot expect it to be always
retracted on return of the function, but it does provide the
additional benefit that on resume we don't need to go through the
whole delegate cycle after powering up the L2, allowing us to
save some time there.

On the other hand, if we want to explicitly enforce that we retract on 
suspend, then we have to accept the additional cost to delegate the
domains on resume.

Kind regards,
Karunika Choo

> Thanks,
> Steve
> 

