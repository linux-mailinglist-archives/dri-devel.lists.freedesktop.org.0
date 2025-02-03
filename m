Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09286A2606C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 17:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D0810E508;
	Mon,  3 Feb 2025 16:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="isRhWrCy";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="isRhWrCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC6110E508
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 16:43:46 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nEJ9rVYrdfDJIKepUlo+xlkerMlrarb/M4M+n7iAZZIlfb+7DvL9rcZjhiEVFxHxRP+f/3hm/NPZ02Hzk/lZYOAYZFe4kasiMODytZpOZaQ9ql7M4dTMxUyVgQ5oBcUjFwBkh5peUbvzkMgCirZRoTpznm7VpDX5E5rwE+TIYcGc4yYNkO8lI+bHtG9AneQDva0QPHOfjn2qy5zKuDoxry67jQkYi95ySJKws/fzpsBR7vvNWgZQp1pxAdWmEd2yBv4jHqsgYBkbHTEOtsRAL04/vm7AF3DpwZtGL5jZdQdSpnFylPWXW1q/tYFcG1ixK/E4VWfOKdDixJmxTKNx9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YovYaV1IB0d3IG0EyOIZHJq8T0KgPvnM8HVgRV8Tk0=;
 b=I+dpzMCNNz4stlmaHzJ7jjYQ0+tOzaJXZ6g6ftyGHuhyfyYU/a9LsoWJk5l+1Ifu+SSo88PyQtDQZMxtfNdajUzQjGnMgre/GYkzammiLP2bJTUMEsgYTdGPU6+BMYYGyR5R/0+Spf/E/qkiEOFqcIQsFpsRzlr0lc+tE7D77st6rMUyW2QB87/AzNwGxXEPpSz6AKN2OpblprVtqLgktE2Ps89RA/h6iFKc1kGgILYzJMpLz+oaDcpi7So0rm1fI25LzdZNRIBgQEpax/9wm+uTU+9Tu/e39cNKzigXDTXeIwOUDkSOWZwVb6WzXQ5a/a5s4lrotjjbcNQDGNqUsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YovYaV1IB0d3IG0EyOIZHJq8T0KgPvnM8HVgRV8Tk0=;
 b=isRhWrCyJv1Bny/KU/+kOFf9mHi8dOPf0K2nQxNz9hlvib774DY3sV+2yynUOHMnHUYyIs1087+mLOOVHj3UFGd8ZbAsV1aKwYfcfaNXztdrkA8+38w8DO2JrfT/TWh8RHJvRwQPcTqVc6UmXqyH0IeZpZ3+6paKv7uxIpgNQSg=
Received: from AS4PR10CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::6)
 by VI1PR08MB10244.eurprd08.prod.outlook.com (2603:10a6:800:1bd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 16:43:40 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::98) by AS4PR10CA0006.outlook.office365.com
 (2603:10a6:20b:5dc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Mon,
 3 Feb 2025 16:43:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 3 Feb 2025 16:43:39 +0000
Received: ("Tessian outbound 72f36a054dd6:v560");
 Mon, 03 Feb 2025 16:43:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea92f48b8bbde35f
X-TessianGatewayMetadata: hPoADkzqM3qy9TbyL41kFJ/lXTReNtTCql/NNtd8T/J6/Pyflxsojm+7FyQd8flwLvHQs7XbMGwl0L/1HMyjhLq1t6i1SlKMhCYASrIIznv49xJ3bHObfO8vDYaiZXSSIp+4Z/Zy8GMm+QfwqIjnATLtUYw5d0nfa1n5BYGy5Eo=
X-CR-MTA-TID: 64aa7808
Received: from Lc8418286d724.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2367C1F2-EBF9-4496-A9E3-D0C8FFDF8186.1; 
 Mon, 03 Feb 2025 16:43:28 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc8418286d724.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Feb 2025 16:43:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YycOy3S9XQqCpCbNx2O+Ws82iMMfd5oNGu+fqm0mBBYhOB/YHfjCaieFn0a5VlNwUzzyvp1YLHkbivwy/0YvshgQI8R9boMdu31YCLVzx0uFLg/yUzQUAMic5JYQZwCJ7rAstSezB2JEafRMawTEp2cV5lkyLJb+IWQU0vclK1xvzm7rGli3NrcSbyy+c3SLCdroIhdkPCJ1yd2hYpDmZve9TGQC4ttaWSB92tXm5DRk29m0Buu6AhPhq0r+Luz7nSY1QVnxqdAJJ7wy8M+WqEIXplKEFaeX1bB2patQrudKKVI/92UTaYmz+/v+bv2kC8SttURDQDeBCSU/x2Tfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YovYaV1IB0d3IG0EyOIZHJq8T0KgPvnM8HVgRV8Tk0=;
 b=OqRMNnKBvLGJsBV09dCD0O+1GCCYcHDj14nQXWOkaJYXeS9wBNu1/flW2+kSCLtHS8cLbHX4LUshK1EGY0DgiJ9caqDvWIPyfQLYqCQYgepbt8ASFM1P3ynpzPAh6/IXMm4ulfTsib54PZ7PNszhG/RJG2JkKlJu2fdq9FNn4FOPCnc8DaHSfB1bkp1KGde2riMbVse06JrwxauplBNrHrbEyM4/3sM4fNv78XX0Datq1aF4PYCVLaLWzsABVe+mMF1v6R4HFDm8fePmBmiRPB8kAVmRLZvcBd2A0lhJ2/Mjk+bv1x2yaItZm2N/jMZk1E2LI5fwCmJzu3DRauxTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YovYaV1IB0d3IG0EyOIZHJq8T0KgPvnM8HVgRV8Tk0=;
 b=isRhWrCyJv1Bny/KU/+kOFf9mHi8dOPf0K2nQxNz9hlvib774DY3sV+2yynUOHMnHUYyIs1087+mLOOVHj3UFGd8ZbAsV1aKwYfcfaNXztdrkA8+38w8DO2JrfT/TWh8RHJvRwQPcTqVc6UmXqyH0IeZpZ3+6paKv7uxIpgNQSg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by VI0PR08MB11198.eurprd08.prod.outlook.com (2603:10a6:800:252::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 16:43:25 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 16:43:25 +0000
Message-ID: <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
Date: Mon, 3 Feb 2025 16:43:23 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali CSF
 GPUs
Content-Language: en-GB
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
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
 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::17) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|VI0PR08MB11198:EE_|AM2PEPF0001C715:EE_|VI1PR08MB10244:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abe1b14-f88f-4862-9db7-08dd4471e997
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?V282VDFqdkdxV05TODVPeElBUStiZHFkeldaWDlhcGJJOWh4U3U1L0Z2dktK?=
 =?utf-8?B?VVJHakxXczlENXBHM0dOZUdMSWtxYU5aajJvQlJrNTJGeE8wMEIzMjhPc1oz?=
 =?utf-8?B?a3RBS1Q4REpiL0lpRTBOY1N2U2VQdmV3dlhiVG1US3o1UWt3Z3BKbzRXcUZN?=
 =?utf-8?B?blVUOW5mSHRqRFdYaU1FTDYvNmx2Y01LL3BJSmhFV2orOTZCZHhRM0U1QkJu?=
 =?utf-8?B?QUhKakJuQk5VUUtYSVpsL2NMb0p6YzMxTVJyczJpVmpuT2FKWlo2Ti9ld25u?=
 =?utf-8?B?RFVPQ3p6T3VhYmpOWWdqdVpsMkVlbkd3VVBoMTZxVVNGWFIwWkY0SWkrRGFI?=
 =?utf-8?B?Q3pxVkQ4SGhVSTN0dWJPT3NEQi81UEdZam9Bd2ZnMmFHZkcrNDlPK1ZESitI?=
 =?utf-8?B?MnhXSGtQdnc4SHdSS00waU9DNWY4MW5oRFFFaE5rOGpDbHJ5RGI1TEhrcElv?=
 =?utf-8?B?em4weWlDSEFvLzRhUkFVc2ZiRlp5a0pOM29xY09idk1tUDFxZmYxVTJlam51?=
 =?utf-8?B?RDU5aE1vbFVENXFSZlhpM1RTcTBUQ0xQdHg0QVB0a1pDMmYwVXJ4Wlh6U3ho?=
 =?utf-8?B?eHZ2YzRSYXoxOC9iQWhhVjNhanB0U2Q1KzAyZVpCb0d2SXFNTUVMNHlOM0hF?=
 =?utf-8?B?Q3l0aFRNeDJ3WGtNK001cmJGbm52TjlDVTZlaFBjUGp1TGU0OHVjbGpXUUNy?=
 =?utf-8?B?aFFYVzQ5c1U1aVJudEJJT0RYOVJ1cjFnc1FleUc3SUp6dEpVRVM3MEJjLzA3?=
 =?utf-8?B?RThrUExKSjhoejdRVXZsWGxaLy93Wm1TUkxlZnhDRExVUFVoejBqN3pNT0lU?=
 =?utf-8?B?ZzRkMmNlVVp3R0V2VU5odmg4UisyNUZFOGs5RzdGMmFCOTJhVm53dkJVeis1?=
 =?utf-8?B?NmRLa2lKMXpwL1NYdDJvWHF6eTVSUkxjclFjNDEwQzRKUnE2bmltVnUrL0FQ?=
 =?utf-8?B?Z2NFWUVwSjVZcUd0eDYxNDFGSFljZDhMLzVnRjVycUVKR3kxNkFIMmsxRi9U?=
 =?utf-8?B?K2pGN0hlV0N4aFAwQUVxSzluVGJGQW1selVReXdmTTF6akNDMUQxRDQ1Y1h0?=
 =?utf-8?B?RExCZXFkZWZDcENKYmdLUDZIY0RrREVVVjcxcDQ0WWRZNnRjamxLK0dVcXFw?=
 =?utf-8?B?YmVFZkJzSVJTR0t3STJKNUFTblNreE9jekNwQkkrbGxtZXNPeDF6MFp2dFMr?=
 =?utf-8?B?eVN1ekU1QTFqVGpJNVFuV3dwN2ZobGJHcjBNdlJsVGQrM0xYQjlYS1F1ZCtp?=
 =?utf-8?B?OGZ3SVpuZUhQdWlTdzFpc1hTWndyRzJMckw4U0g5ZG9jajR2TUorQmE4dEc0?=
 =?utf-8?B?NTdBTmRKdGFFTEZ3eFVuWmU1ckhUMUp4RmlhL2RXUURtQUY2WkZMZk5JNzd5?=
 =?utf-8?B?VEFjNEVNV3lxNG1lekRoWFc1cVZJMmh0eHc1dGxNT3B0OFlNaUI2bFZzMUxj?=
 =?utf-8?B?QlNobVZWVWhEU05Ha2RpV1Vja01LbUc5bnhScWZPY2tkMVBoTHpXbzk2MzhQ?=
 =?utf-8?B?Q1E2dFBJZW5CallaUlVBM3cxT1JwcDg0bDVyMnc3M0xwK1N5R3pjWWF0TUtr?=
 =?utf-8?B?aVB5WHQ1OG5NQ01OSGxFLzBwbmlpa1IrcnhZZkZ2UkwvSk1VMHJZWG1BRitr?=
 =?utf-8?B?Wkw3Y0pKK3dqcHNmZEIrbzNBUzUvek9xd3RJTlZYU1A1bVJiZGdTMlBjclc1?=
 =?utf-8?B?cEhqaUl1ZWhETlJEbk9kS2phVjdxbEVsdGJqazMxZWFQRGxpNEs3Ny9JZjN3?=
 =?utf-8?B?NFNyN2pIZnFrSkpTNURDZFUzK2dCYkcrLzdjUWFaT0pXM2hhZlgxL3ljQnNM?=
 =?utf-8?B?RHR5RUtqdWtxeTFDd3pTZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS4PR08MB7925.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11198
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];
 domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9117feac-9979-4695-df87-08dd4471e0d1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|35042699022|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1pYVWk3WTRtZG5TbXBaR3RpT1lLSEdoZDI3NXZoUE5IaFhmU294Mk9GSHkx?=
 =?utf-8?B?Q3ZZalJZS2ZLcUR0YnNJZGRBeWFVY1hHeUh6QndLQldkZlliM2RLcTNzU09u?=
 =?utf-8?B?dU8zVnVFRDNXNlg1VllwUmM5bmFaOHEzZG8yVGEyOWdab3JxOVlsQVh5Zm9R?=
 =?utf-8?B?UWZrQkdObk5ZWC9jQlp5NGVWUzNnR3g0UmJHckVtYWN2R0hwb1BVOENyeUFQ?=
 =?utf-8?B?eENGRThVZXgyZE9LVHFwREQ0Um1GK2Nsb3FVSDRFTmpqVnE5T0ROeFFoeVpw?=
 =?utf-8?B?eE5DR0QyTXBSNzRjZ1NEVE9pYlo5UC9Dd2tqYUR4b3Uzb3YybitKVDJEdjNS?=
 =?utf-8?B?UXU4Y1NCRjBEL2dNeE8xVDl6YzhqS0ZJRGo0bU1jcmJlUVBqMXo5eHd0M2hS?=
 =?utf-8?B?c1lWN3BvSytTOTVuelNPc2NibzJJM2dxLzExdnZvUnM0M0xnalhHR04xTk42?=
 =?utf-8?B?ZGxmdW9GVlBxRzdnTTNWOVU5b1hIcnFJQXlSU0YveFZENU9FSk53Si91MXJ4?=
 =?utf-8?B?ZklMV2NSV1VhTC9XbmV4V0dBUmNrTVZySXhwN2dnOVFtYm9jbGJOSGFNMmYx?=
 =?utf-8?B?WFdMQWNxK0FmbWNyY2ZtQndMSzJzN3VKVDROK2JocjRTUGRJZGhHU01ncmkz?=
 =?utf-8?B?TFRPUGNJRXVaN3U1V3hPeGxidlZNeFhkcHRKamZUb3JwanRLakpnOVMzdkFV?=
 =?utf-8?B?cXlYZ3ErOExsdzNtMGRtOVg0VXE4Q1VxaVliOWZBNE9nR3ljWW1CZ0doRHJ2?=
 =?utf-8?B?dEdLZDBsamFKbzRRdCsxc2Z3UUhJczJGQWNlQ0Zmb2t5aFE5STkrdDFrN0Jn?=
 =?utf-8?B?WDdlSjdqbVdjL0dTc3lhMFJYZGxLSTdKWk1QL0lucmtJV0tpUHVnKytCRUdh?=
 =?utf-8?B?bjFneHpIa0JwTFNXb3lVdFRqKzl1TzN0dll3TWFvRTB1VlM0ald3WVNVME12?=
 =?utf-8?B?Qk5MRmlnOG9MWWdNUTNhaU9SNGw3OHgvMGl1bFB5bmRBVkt5b21kb1pQMWJ1?=
 =?utf-8?B?U0xuNy9lVkJYbldEV0Q4Z0Zub0t0VFNiNUZtQWJQQVdQT0dxVVNVQjdOcVZa?=
 =?utf-8?B?VWM0b3ZJalRrOVdwUllJRFJtb0dtSjNYTUNsQVl1S05hYWtHSlFaYlhLRnBz?=
 =?utf-8?B?MmVLRDZiaHJjUU5zQ0Vtb1pIRlBuc09nYVNCbnZXK0trcDZ5MHB0dHNaUFNm?=
 =?utf-8?B?NUZZeHlxNlVrR1pIRXZzcEg2M1lrYW1wcXViUHIwV2dmM00vZ01yanJiaFR6?=
 =?utf-8?B?MkUyLzZlWVVyTDl3ck43VERtVEl5YnIwcHN5OThwd2tMcWlwRkhkRVN6S1Z2?=
 =?utf-8?B?MWF3anBnalZEaHpKSnZ0ampRaGRkQ3pZaEJiNVVFWWZjTU5lbnBjWlV2TW1x?=
 =?utf-8?B?ZUpObzJuTmJQVzVtb01pMnFhRnFQTWNBNHFlYVFIaU0vS1htS3FYb3dZMnMz?=
 =?utf-8?B?WHR3bmZBNjRxQ3E1R0FueFBIYndybkY3V0l3SHZDL08vZU0rNWRWR01tY3kz?=
 =?utf-8?B?Ukd1WHlIMkxidlA2Q3VGZ3phYzRPVHZZL3hZVlV0UFVUZHMxOVBuS25IS1R3?=
 =?utf-8?B?L2dTbmtOc0k0MDRvQUNiaFkwYWd3blBIOWhHdXpXUzdIWXRKZEdhT2crMlZU?=
 =?utf-8?B?eHJXV0lXR0ZoQmtsNWpScytjTG5FdXE3RUd2SnBlV0U3TE5lVGZYU0hqcWw2?=
 =?utf-8?B?WjM1NkNaeDl1STg3dS9yeWwzbUl6aGVic2E2b0RlNDduQktTQ0pUYm9ZUFRp?=
 =?utf-8?B?VnhGNlRHS0J5V1RUWmllM21wWjNtaEkwQWlEUWU2RVdOcDA5WVA2SVJFUVRI?=
 =?utf-8?B?eVU1R3lsVDRyM05rcjdKSDFYUUZnYVhLd2ZUNW5tYmdrQW9tODlrV3VPRHdJ?=
 =?utf-8?B?cXBuZDJja284OXhVTFpwMVRkSlV6QzJsSExsdnovNHRYYlFuUFYvb243Y1Vo?=
 =?utf-8?Q?8EHzxdABXOc=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:43:39.6561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abe1b14-f88f-4862-9db7-08dd4471e997
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10244
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

Hi Maxime, Nicolas

On 30/01/2025 17:47, Nicolas Dufresne wrote:
> Le jeudi 30 janvier 2025 à 17:38 +0100, Maxime Ripard a écrit :
>> Hi Nicolas,
>>
>> On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
>>> Le jeudi 30 janvier 2025 à 14:46 +0100, Maxime Ripard a écrit :
>>>> Hi,
>>>>
>>>> I started to review it, but it's probably best to discuss it here.
>>>>
>>>> On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
>>>>> Hi,
>>>>>
>>>>> This is a patch series covering the support for protected mode execution in
>>>>> Mali Panthor CSF kernel driver.
>>>>>
>>>>> The Mali CSF GPUs come with the support for protected mode execution at the
>>>>> HW level. This feature requires two main changes in the kernel driver:
>>>>>
>>>>> 1) Configure the GPU with a protected buffer. The system must provide a DMA
>>>>>    heap from which the driver can allocate a protected buffer.
>>>>>    It can be a carved-out memory or dynamically allocated protected memory region.
>>>>>    Some system includes a trusted FW which is in charge of the protected memory.
>>>>>    Since this problem is integration specific, the Mali Panthor CSF kernel
>>>>>    driver must import the protected memory from a device specific exporter.
>>>>
>>>> Why do you need a heap for it in the first place? My understanding of
>>>> your series is that you have a carved out memory region somewhere, and
>>>> you want to allocate from that carved out memory region your buffers.
>>>>
>>>> How is that any different from using a reserved-memory region, adding
>>>> the reserved-memory property to the GPU device and doing all your
>>>> allocation through the usual dma_alloc_* API?
>>>
>>> How do you then multiplex this region so it can be shared between
>>> GPU/Camera/Display/Codec drivers and also userspace ?
>>
>> You could point all the devices to the same reserved memory region, and
>> they would all allocate from there, including for their userspace-facing
>> allocations.
> 
> I get that using memory region is somewhat more of an HW description, and
> aligned with what a DT is supposed to describe. One of the challenge is that
> Mediatek heap proposal endup calling into their TEE, meaning knowing the region
> is not that useful. You actually need the TEE APP guid and its IPC protocol. If
> we can dell drivers to use a head instead, we can abstract that SoC specific
> complexity. I believe each allocated addressed has to be mapped to a zone, and
> that can only be done in the secure application. I can imagine similar needs
> when the protection is done using some sort of a VM / hypervisor.
> 
> Nicolas
> 

The idea in this design is to abstract the heap management from the
Panthor kernel driver (which consumes a DMA buffer from it).

In a system, an integrator would have implemented a secure heap driver,
and could be based on TEE or a carved-out memory with restricted access,
or else. This heap driver would be responsible of implementing the
logic to: allocate, free, refcount, etc.

The heap would be retrieved by the Panthor kernel driver in order to
allocate protected memory to load the FW and allow the GPU to enter/exit
protected mode. This memory would not belong to a user space process.
The driver allocates it at the time of loading the FW and initialization
of the GPU HW. This is a device globally owned protected memory.

When I came across this patch series:
-
https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t
I found it could help abstract the interface between the secure heap and
the integration of protected memory in Panthor.

A kernel driver would have to find the heap: `dma_heap_find()`, then
request allocation of a DMA buffer from it. The heap driver would deal
with the specifities of the protected memory on the system.

>>
>>> Also, how the secure memory is allocted / obtained is a process that
>>> can vary a lot between SoC, so implementation details assumption
>>> should not be coded in the driver.
>>
>> But yeah, we agree there, it's also the point I was trying to make :)
>>
>> Maxime
> 

Agree with your point, the Panthor kernel driver may not be aware of the
heap management logic. As an alternative to the DMA heap API used here,
I also tried to expose the heap by passing the phandle of a "heap"
device to Panthor. The reference to the DMA heap was stored as a private
data of the heap device as a new type: `struct dma_heap_import_info`,
similar to the existing type: `struct dma_heap_export_info`.
This made me think it could be problematic, as the private data type
would have to be cast before accessing it from the importer driver. I
worried about a mis-use of the types with this approach.

Regards,
Florent
