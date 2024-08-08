Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686AF94B9E2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 11:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5754610E6A4;
	Thu,  8 Aug 2024 09:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="G5e0cba6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G5e0cba6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2056.outbound.protection.outlook.com [40.107.249.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59D210E6A4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 09:41:28 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aN196OTjIf0rCyjPg0M3HD5eKFlcV68NRsE3cgk9RASQF8tq2mVtskBntgavaObqbsXDogoXWMKQZlBkqEs0lEwTRbnZlelaow981p5JfkvUCw56BfaWECjFioE5t9upBW5OsuSIIcp0WzJyAXdVzvHKIfdigwt/VWjZCIm3++7ODdd3pRrR5kTzmXaLfal2MqzJH/C5Jo2Oe8NdMAT22An3nNRPofZPG7dMW8TGg+kObfVyoCz+z8IKqxPDfXBGp9uHjrhu8hjv/FLUUJmKc/5VpMPDf7nfxXOm1iMLd7jRPd9YFI1gr4MBIFmCOdVL0Q9Hir4SmtfKxtgO4OUDVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9WvkJ+UDcyg6ndMKjWfsd3xRnhIZyW4SqBjPL+0lH0=;
 b=pfgC/6qLkfk34UYRbvAGRP9UgmrjnARGaUxLRITu4La6ANcjG2nbgMvfSQ+cbrHdOSo5tPX+OPcU8cAY6dRWWpmbw/3cwvfzldsbGeg0TN9LS8aV4ZYaPcoeQDqmEGC+zoqS9rBjXIFm+OS0sW15DbYKiprFF8oB0tx+rDEWUBIpOuPey+/B3huVAWDMAJck8uIslwLkJcifKxBr9bfrIoIZSHkc6Mk0Lu0D7QxVORemJqVRRH2ssTQlU6hg3cWA7rOzQ/Pev4nByfI0Dga2ULgJd3B7iZ650fe7jC0HyqMnSctILzz5nIKrYzOWWP4aAb+zcBkRH0OkaXpLHPN4PA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9WvkJ+UDcyg6ndMKjWfsd3xRnhIZyW4SqBjPL+0lH0=;
 b=G5e0cba6l4Pg+9KTSasb/6DU1MOgex1bqGI1DyoJjZNtUiNYIxroPd6Lx7pQFhHX5jnDR7QvMsltAtlU8gLvYX8HsDVbkabNV2OpJEfENyzN0lhRhPQ3IJ1amL+B7zBfUFvm1062qwDGRtov0+XEhaiDJLbWvSccz4us1d4pQ/k=
Received: from AS4P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::20)
 by DBAPR08MB5638.eurprd08.prod.outlook.com (2603:10a6:10:1b2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 09:41:23 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::8) by AS4P189CA0029.outlook.office365.com
 (2603:10a6:20b:5db::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15 via Frontend
 Transport; Thu, 8 Aug 2024 09:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7849.8
 via Frontend Transport; Thu, 8 Aug 2024 09:41:23 +0000
Received: ("Tessian outbound f92bcba418d7:v365");
 Thu, 08 Aug 2024 09:41:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c69d73d73d6a9ecf
X-CR-MTA-TID: 64aa7808
Received: from L0c4147026e2d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6549617F-3BE1-48C2-8B4F-524A8D633229.1; 
 Thu, 08 Aug 2024 09:41:11 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L0c4147026e2d.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Aug 2024 09:41:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hv4mkQqIMsJ6PhEcx5cgwWl6c4eTPgRVWr9Jg6k9hg6+lMdxFaEhSUGrvm9DHZ1N6lh2RLNj1I3m5Yk3khHvgMs+leGBZRASp51TBA2ZR1bb0+a1QqYBR/wqOXLCZOc/8I/yevoAEnkC7ey8h4y/LZTKJZEuzQtQW1ijYeP+sK/ROcSKJmG3vv0dfTXecJLREXesnt7r2BbPKLIyeaNg9CvMVHCHK1IrHxUB2i3h+RNqSf9qtq+kZhhfzZ1RaUysk3/dYQ1BnZRulyNZ5eTvBsqjhKssSQ3pe2THRlPX8/9a42pU3gQAqMBTJvyoA59Sr9nUqUUkJL/bhKmrVWlHcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9WvkJ+UDcyg6ndMKjWfsd3xRnhIZyW4SqBjPL+0lH0=;
 b=aTvGNOnYIgYsfY7DwujQmZ9TkNRc+V8L0ZICIhFokcfa6hJZnl3U2XfH6ii4TKhu/gIi0vqZ0cg7YYnDxbBrHvmZqu8V5UQS3R5O5E+rlAPip2No83KibC3UCMLuCRtOxYq7tobIbCDjWZDp3Q+jgCYKIHdxTFD/jl1c54CnT64rPRyTfAx6fobabC/USr7PdoBud3BNmhDh6p9p+sJ19fOaNEjcX6j0/7StYVGFuUo6/Y+4q1dWVAQUFi62lNIGV4KU/o+mbTUgL+TxfY5RkvNk1D8XxjKsrACzfHIzlRW478oqaEcDxptqWdmy2ZaoE/b5v3Xau6U3jKLmqq0Prw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9WvkJ+UDcyg6ndMKjWfsd3xRnhIZyW4SqBjPL+0lH0=;
 b=G5e0cba6l4Pg+9KTSasb/6DU1MOgex1bqGI1DyoJjZNtUiNYIxroPd6Lx7pQFhHX5jnDR7QvMsltAtlU8gLvYX8HsDVbkabNV2OpJEfENyzN0lhRhPQ3IJ1amL+B7zBfUFvm1062qwDGRtov0+XEhaiDJLbWvSccz4us1d4pQ/k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by DU0PR08MB8932.eurprd08.prod.outlook.com (2603:10a6:10:467::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.11; Thu, 8 Aug
 2024 09:41:08 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7849.008; Thu, 8 Aug 2024
 09:41:08 +0000
Message-ID: <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
Date: Thu, 8 Aug 2024 12:41:05 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
To: Mary Guillemard <mary.guillemard@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, nd@arm.com
References: <20240807153553.142325-2-mary.guillemard@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20240807153553.142325-2-mary.guillemard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|DU0PR08MB8932:EE_|AM3PEPF0000A793:EE_|DBAPR08MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b4b71b-82fd-4ea0-427f-08dcb78e43e6
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?R3Nnek12YnhsanlWSElrOXJsbXJlRldNTTk4Q293MHBGVGtMeGxOdkFyaFVi?=
 =?utf-8?B?VEhJYnd0bzFtQzZIVTN5N2hOcDdQRlV6ZnAybTVueHJ3dGluQk54c2JJOHNu?=
 =?utf-8?B?L3RIR0JpeThLZEV6eU1qRmMzbHNyNFhLMlEzK05Td2lOVXp6WjJObTV1QTlQ?=
 =?utf-8?B?Q1h3L08xdUFqdm1Bck1LaVVjSEE1c2ZPRk1IeHI1ZENzVkk4eGRFL1BDNGZk?=
 =?utf-8?B?U29LWmtpNk9qMWlVUHdBbHNwWkVDMlBLUDd0UkRjblRKOW8vcXpLbHphYy9E?=
 =?utf-8?B?dzVDZEt0cUcrZ2FmRDVmVHdmM2YzSkJ2QWlYUVpEMmZvZGVwRUM4dVkwcDIw?=
 =?utf-8?B?VEVtaTZNNVFJRHBKczN3RGkvTFNsSkVPdXQ1Tzh4QTdmaS9qekxsMWZDVFNl?=
 =?utf-8?B?dFJzSlgyRVR1OWQ5NGNzVC9OcEY5cWo1VU9tRGxlUXVaUmhEeGZTMkhIenZT?=
 =?utf-8?B?UDlkL2VLVm1YcDFZbkhrQTlpRmtBYWdIL2ljVGVUMXZraE9YQ01wVG1HVjR6?=
 =?utf-8?B?WXhqR1ZZa3k0MWR2MmpVR3VuTlE3QW9uWWJDNXVpbVpMREpaaGcwU3pUZHdk?=
 =?utf-8?B?L1lvNzJyUEpCbDI3Um81L1NoTDM3WklXQVFWZjR4eTZjcnJodVYzODVjdVpU?=
 =?utf-8?B?RzdObHBHTVZWREdrZlR6K2dhM1RLeEdib3VON3pDMWY0VkxHYzRmRlFybXlR?=
 =?utf-8?B?L3RlSnhxY1UwakdHc2tSMlVwQmRYMjViWjVsWXg2bjVkWEh3cUp0N24rY203?=
 =?utf-8?B?MW1pWmJrQk9oNXRDdmhlNDdNMzJDcWJ5WlhaS21Wb3BGTG5Tc2hwTTNma0xH?=
 =?utf-8?B?UzUzMEltbWNGQUVMb0VQMmxnS1FVU21pOGdVSDl4OFhtdjlTekFwNEY3YTVW?=
 =?utf-8?B?NTJmZGlmTW5RclArcURmOGlaOXViWjV0NDZsSTl2OUVyZ3pVMlZLYWdkbE1P?=
 =?utf-8?B?c0tDL1FsNWlvRXY2UDY3aXViZ3ZpOGtJamhQWXZLUEI2VEFVaEpRZUx2T2Nj?=
 =?utf-8?B?MC9QaitFd094ckZIUXBUQXFLNmYrQmovLytqWHExUG5ZZkFIc3dQOVh6djlx?=
 =?utf-8?B?RXhTWSs0aHZMdjhIYUpxUWhKTVNlaDRHSVFsQ0FETGFpaC8zZXFJcTUwU0hD?=
 =?utf-8?B?ZDlQOE5nbUJRcWVzSGJpemJsVjZvaUVSaU1VVldmclY4VGlvMHpkMnIwaDdn?=
 =?utf-8?B?UjJ1ZnlCR1JHYVBJQm5NMkk0WGN6WkxHQWEzbG9FUlk0ajE2bk9YTmc2YUww?=
 =?utf-8?B?N0FNQXYveTVGa0Y3ZmhuVVQ4cGlqdnRxTW96WjF6WkVUVzEvUUJFTHpEd1NE?=
 =?utf-8?B?TDhlUEowejhqbVZVWUJZNTA5T0lOY3cwd2FMblB0T3d5Uk9pM1NTekdoSE9l?=
 =?utf-8?B?UUlRWkxhL2o0YmQxTndBWkUrT3plUHVualRpeWliR0Zrckl3TWRDWGlsUVdU?=
 =?utf-8?B?MU1WcHB3TENyUldIalhMZVUyVTZzWVNPd2VlYXpXZmxvVDMrekNjK2IrM2I2?=
 =?utf-8?B?UzVZOStmcWlUSTQ1QmZTVWd1YTVYa1kzZjV0RTJDSHhMelpEWXZ4WjNEa0pj?=
 =?utf-8?B?SXZMVVFkTHVvbHIzWEN6RkdoTnV0NGV0RHRhMTlmWGhIWXZxVTUwa1lMckFO?=
 =?utf-8?B?U3BCb2xHdTRhMXp1bXgyTkV3WTd3dDhyRStMNFc0RGI5cWs3ckFDdDRIczhS?=
 =?utf-8?B?NGhmdFNyVWFGdXdpVWdNTDhtNFMwNTVYb3dOZkZndWhjWnN5azlCMmZGbmFG?=
 =?utf-8?B?ZEhVWE9EZFBPbUxzYXNrWFM2bW50WEkyZjJRSnJZalpid2NUWlYzaUhxUlF6?=
 =?utf-8?B?UXlDUTVDRkRXTlVRVVZHdz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8932
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 350b962d-f738-44bd-1319-08dcb78e3b2b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|35042699022; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmdsRXA0VUIvSUFIN0J0eWxDL2pqTEZmOThzVVVMM1AxZmVadU9QOGRhaUpE?=
 =?utf-8?B?TjZjL002eW5LQ1RVdXhEUXFVNm5WMWk4aEhic00xNVJZZk9WNzgxaFFRMTQz?=
 =?utf-8?B?M2VKR0F1RGVjQlpNRnBYNjhZZUtlL0FobzkyVGk2M2RBdXFoeVF3ZEI0Z0R2?=
 =?utf-8?B?cWJ1NWZtcUVueWpydjBzOWZWK3BxSUx6SlRFNzdDYzREbEMwWWowTlUyaUh2?=
 =?utf-8?B?aHJsZE9ZL09ocnROT3BiNFZDbU81dTZWOHkxemtuYkVGdy9xNHhDSWNRdW1F?=
 =?utf-8?B?eUlEa2Z1bUVaWmd2UjlnSTE3N25RV2ZmOGcvTGxaa1ZLc1FmZ0VPMlgwU0dL?=
 =?utf-8?B?cFA2SXEvRllLbU5TRENpa2pJTDM4Rk81WTFpVUd4WUkvV0VrSW5SeHVQMWt4?=
 =?utf-8?B?aFdlcjdsbmdnOXRnYWhyRHlQM0Y0RFRocXpHSFVlZ0N3dHRlY2pxQ1RmWmlh?=
 =?utf-8?B?V1l4MnBtWTkrRUNhMFF1NUkybzBpd2hDeWNONlF1dmF6VjEwV0ovSG00ZVZn?=
 =?utf-8?B?bUJNdm9sVGFSMjlQZlhZdk9lQnRCVVdLWDhjWkRvVmlmdFhHbU8yZXRYNExN?=
 =?utf-8?B?SWg0QW5ialZRN3MzajQySHhkdVBjY0Jyam5jMjR2Zm9lbnp3QlBoRCtwNXQr?=
 =?utf-8?B?d002b2hQY0p4SU04Y25qakZsZjhaM3pZM3gybUEyUS8zN1VsUHdZYkhyMEIr?=
 =?utf-8?B?OTc1cHBMN0Q3aEN3VG8xWGZ6UGVlV1FXd3Q0Y2UrYmFtS3VFVFoxVUxEUlkx?=
 =?utf-8?B?MGU4WVNyZkJxQUhoRTR2MTJEN2RoQjRZTTlUeldXSEhzTXp6M3ArU3d3eCtN?=
 =?utf-8?B?OTdkYzljVGxuNm1hdnl6WGk2Q3dBK245NHdUZkVrQWFZUC9rVzRPWTVRS0k2?=
 =?utf-8?B?cGY2SFcyWm1VZ3FZb1doOTlmRTNWNngyNEVXYjFQS3czVmpZY21VdzJobnFL?=
 =?utf-8?B?bTA0YWtvZVEvVzBQUGVqdGh5QXU0TnB5L1dTTUw4TnFZRldtNUFySjQwUDF3?=
 =?utf-8?B?NTJZdEUrS2xxZUVpcUdtRFd3WGNwOUFlQ3hXWk5oOUJVL09WZGtseDNLRktM?=
 =?utf-8?B?OS9oYTVReVVoOUUyMGhLeTFoUE1IRU1BZG1pQVpMVnBZRlhEVXY1RGRHOG5i?=
 =?utf-8?B?aUxlUy9xazdJaXlIOUpWVmxJN2htbDBzVFdLUVF2NUNkbTdoK1hsN2J5OWNC?=
 =?utf-8?B?TVBUTk9Va1NXb2lnQXBzVTJtOVNQRFpTdk5naXAvcFRBSlZCSGlKcGZIMUo0?=
 =?utf-8?B?TVpkc2lrUUNWYmVqT3hUbm9URFd3RHBHWEtTalBadWovV1ZuWEV4ejlLWTVL?=
 =?utf-8?B?Ly8vdTdVZFZvK3ZPUDFKeU5aVmJjMUV1RUtkZ01CRVpVaHdLTjEyeER1Zmh4?=
 =?utf-8?B?ek4vN1d5bGlKcWl6ZDVmR3FiYXIrYm9RNXgzQUFtZGMzbmZDRXV3MEN1SVJ3?=
 =?utf-8?B?Skswd0NFOGRSa3VSNHNKWVBxTXBjSEhvY0xmaDVIbnphaUUrL2NndHhiTXpJ?=
 =?utf-8?B?YW1VWUlxTTNiSzVMY05FY3pILzFqVnFBRWdlOFhnd3F1SUk0eFYwWHJnWkpD?=
 =?utf-8?B?Y0Q1SEtmS2FBMUh0Zy8wYW9TY0VLYlpHWDNrV2VOaUJQUXRCM1Zid2FBVVIr?=
 =?utf-8?B?WXA3SWZmcTYxMDlhZnJnamFxZ3BuWmJocFhDNElWTVB0dTBrUXZQQi9MdjhF?=
 =?utf-8?B?K1FVNHY4aEtsajBRa2tna1A3VzQyczNOeXJjaDRCcVFKNGZqcXI2RWR6VU9D?=
 =?utf-8?B?b0Z5MGZaa2dzVzM2SEhyQk9uUkZXZFNSVjhoRlJIWFo2V2pSbUxteW9oS1dY?=
 =?utf-8?B?eXZUQVVJSlRhTjlLYlZxUnpLMzhLdk5WZmFieVVJYUtqWWFMRTQ3Ri94M1ls?=
 =?utf-8?B?QmNIQnBNNlR2SjNRNG5hN2haVi9UdE9lMmRjSmJjR2hMR25ZRnUrOXhPODdR?=
 =?utf-8?Q?pzkl4sY7s1d5sXOAJkahNAm/m46rjcGf?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 09:41:23.1545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b4b71b-82fd-4ea0-427f-08dcb78e43e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5638
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

Hi Mary,

Thanks for your patch.

On 07/08/2024 16:35, Mary Guillemard wrote:
> Expose system timestamp and frequency supported by the GPU with a
> new device query.
> 
> Mali uses the generic arch timer as GPU system time so we currently 
> wire cntvct_el0 and cntfrq_el0 respectively to a new device query. We
> could have directly read those values from userland but handling this
> here allows us to be future proof in case of architectural changes or
> erratas related to timers for example.
> 
> This new uAPI will be used in Mesa to implement timestamp queries
> and VK_KHR_calibrated_timestamps.
> 
> Since this extends the uAPI and because userland needs a way to
> advertise those features conditionally, this also bumps the driver
> minor version.> Signed-off-by: Mary Guillemard
> <mary.guillemard@collabora.com> --- 
> drivers/gpu/drm/panthor/panthor_drv.c | 23 ++++++++++++++++++++++- 
> include/uapi/drm/panthor_drm.h        | 16 ++++++++++++++++ 2 files
> changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c
> b/drivers/gpu/drm/panthor/panthor_drv.c index
> b8a84f26b3ef..4d62ff3fbe03 100644 ---
> a/drivers/gpu/drm/panthor/panthor_drv.c +++
> b/drivers/gpu/drm/panthor/panthor_drv.c @@ -164,6 +164,7 @@
> panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32
> min_stride, _Generic(_obj_name, \ PANTHOR_UOBJ_DECL(struct
> drm_panthor_gpu_info, tiler_present), \ PANTHOR_UOBJ_DECL(struct
> drm_panthor_csif_info, pad), \ +		 PANTHOR_UOBJ_DECL(struct
> drm_panthor_timestamp_info, current_timestamp), \ 
> PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \ 
> PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \ 
> PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \ 
> @@ -750,10 +751,21 @@ static void panthor_submit_ctx_cleanup(struct
> panthor_submit_ctx *ctx, kvfree(ctx->jobs); }
> 
> +static void panthor_ioctl_query_timestamp(struct
> drm_panthor_timestamp_info *arg) +{ +#ifdef CONFIG_ARM_ARCH_TIMER +
> arg->timestamp_frequency = arch_timer_get_cntfrq(); +
> arg->current_timestamp = __arch_counter_get_cntvct();

The GPU HW doesn't use the arch counter directly, there's a dedicated
timestamp register that can, e.g.:
  - get dumped in perfcnt dumps
  - get sampled in shader programs
  - get dumped in perf instrumentation trace buffers by FW

This GPU timestamp sometimes/usually needs to have an offset applied to
it by SW via a dedicated register, for example, to:
  - account for errata like a slight difference in the clock frequencies
between the system and the GPU counters leading to drift, or
  - account for errata like an existing fixed offset between system and
GPU timestamps, or
  - provide a stable relationship to a known system clock source like
CLOCK_MONOTONIC_RAW, to assist in correlating events in perfcnt dumps &
traces to other system events

> +#else +	memset(arg, 0, sizeof(*arg));

[aside] The GPU timestamp register semantics are also defined for a
non-ARM-CPU based system. How you get the frequency on such systems,
though, is not something I can help with :). [/aside]

> +#endif +} + static int panthor_ioctl_dev_query(struct drm_device
> *ddev, void *data, struct drm_file *file) { struct panthor_device
> *ptdev = container_of(ddev, struct panthor_device, base); struct
> drm_panthor_dev_query *args = data; +	struct
> drm_panthor_timestamp_info timestamp_info;
> 
> if (!args->pointer) { switch (args->type) { @@ -765,6 +777,10 @@
> static int panthor_ioctl_dev_query(struct drm_device *ddev, void
> *data, struct d args->size = sizeof(ptdev->csif_info); return 0;
> 
> +		case DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: +			args->size =
> sizeof(timestamp_info); +			return 0; + default: return -EINVAL; } @@
> -777,6 +793,10 @@ static int panthor_ioctl_dev_query(struct
> drm_device *ddev, void *data, struct d case
> DRM_PANTHOR_DEV_QUERY_CSIF_INFO: return
> PANTHOR_UOBJ_SET(args->pointer, args->size, ptdev->csif_info);
> 
> +	case DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: +
> panthor_ioctl_query_timestamp(&timestamp_info); +		return
> PANTHOR_UOBJ_SET(args->pointer, args->size, timestamp_info); + 
> default: return -EINVAL; } @@ -1372,6 +1392,7 @@ static void
> panthor_debugfs_init(struct drm_minor *minor) /* * PanCSF driver
> version: * - 1.0 - initial interface + * - 1.1 - adds
> DEV_QUERY_TIMESTAMP_INFO query */ static const struct drm_driver
> panthor_drm_driver = { .driver_features = DRIVER_RENDER | DRIVER_GEM
> | DRIVER_SYNCOBJ | @@ -1385,7 +1406,7 @@ static const struct
> drm_driver panthor_drm_driver = { .desc = "Panthor DRM driver", .date
> = "20230801", .major = 1, -	.minor = 0, +	.minor = 1,
> 
> .gem_create_object = panthor_gem_create_object, 
> .gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, 
> diff --git a/include/uapi/drm/panthor_drm.h
> b/include/uapi/drm/panthor_drm.h index aaed8e12ad0b..8d39a2f91769
> 100644 --- a/include/uapi/drm/panthor_drm.h +++
> b/include/uapi/drm/panthor_drm.h @@ -260,6 +260,9 @@ enum
> drm_panthor_dev_query_type {
> 
> /** @DRM_PANTHOR_DEV_QUERY_CSIF_INFO: Query command-stream interface
> information. */ DRM_PANTHOR_DEV_QUERY_CSIF_INFO, + +	/**
> @DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO: Query timestamp information.
> */ +	DRM_PANTHOR_DEV_QUERY_TIMESTAMP_INFO, };
> 
> /** @@ -377,6 +380,19 @@ struct drm_panthor_csif_info { __u32 pad; 
> };
> 
> +/** + * struct drm_panthor_timestamp_info - Timestamp information +
> * + * Structure grouping all queryable information relating to the
> GPU timestamp. + */ +struct drm_panthor_timestamp_info { +	/**
> @timestamp_frequency: The frequency of the timestamp timer. */ +
> __u64 timestamp_frequency; + +	/** @current_timestamp: The current
> timestamp. */ +	__u64 current_timestamp;

As it stands, this query has nothing to do with the actual GPU so
doesn't really belong here.

It'd be more valuable, and can maybe give better calibration results
than querying the system timestamp separately in userspace, if you
reported all of:
  * the system timer value
  * the system timer frequency
  * the GPU timer value
  * the GPU timer frequency (because it _could_ be different in some 
systems)
  * the GPU timer offset

> +}; + /** * struct drm_panthor_dev_query - Arguments passed to
> DRM_PANTHOR_IOCTL_DEV_QUERY */
> 
> base-commit: f7f3ddb6e5c8dc7b621fd8c0903ea42190d67452

-- 
Mihail Atanassov <mihail.atanassov@arm.com>
