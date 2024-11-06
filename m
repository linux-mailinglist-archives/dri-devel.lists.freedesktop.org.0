Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FABA9BE77A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 13:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977EC10E1AD;
	Wed,  6 Nov 2024 12:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="YgBiT3BA";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YgBiT3BA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB4A10E1EB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 12:14:40 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CUmoUpAdh25XI8jXT8wWE42NbqOcw/iUO+wPm9Zk4rwg3atyEpng0ahR2WxvCXHeVidZbClYmywnEQKnE1D5tJB0m29nye3in1fN9NLy/axJ6e3mm0WoHdnn4I+z5PJVpkdVxEQs3Vp+x/2PgXYuRC5+QU0zQJqcVjgzIBbo2wP9dwlMuaZbZvt4zd2l5MVWRoQYj8EjoXtZoAbhPH/iu7uQ2GkwQmTUCTjXjp1HgVRiTNBnAlQxdAlpfsljGfZ1sHnLnMU/IHeWNjCbBoqx74hhHoTk+awqZpkeIEa1EoDbKPxxs5ZhYV6BAoOdLFDdMVPPZkN60e88DOBzlmouRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ha8HrlRc04RmffUIGqK9g3Ea50Sq/28GoA6kDm6wh+o=;
 b=qoB0tnDY0hCuX7sl4MAS18peFCVnncd0l3KDS7izA9EvLFA21Zu5bBee+tVRmNlLKvEQAi4bmnb52KZZ+x8YEiGhEm27RftiKb0vOD+sUpYR41/nfHFFFbkHHoRxW/q/XewRgYSq90HiKRG+elW06Zx2TNmhwxWLVQHbinnHXCveLDgiUZONY8vET8VYff1Tc5WodP01dzpUObzXIaBeFHq/c6+EnmfFCH9zb+hlMQtHx7BaV3mx9lQwwcA8YgTDIYy3WSElNxt5Ha3dINBwwnCDQU1Bf+U3vXSvWIMBUlTT5VH/bkL0pVgqyyq33SXdJlgnSe+cZz5F8cIOWw5GKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ha8HrlRc04RmffUIGqK9g3Ea50Sq/28GoA6kDm6wh+o=;
 b=YgBiT3BAzEKcmslYpMtf6I/ip2UGcySdtw51yasg9RTmGyPsKt+rTx0g8IwN2hJGJ/cIIONXtN5OU52kwSFhTw3SEiJsCdRGTg/n6OZB6D5L4ls+STQi3RUsJ0ohemsuRTmXhRqRxcv0NkL5rqLCjsJnpJwaXLKBVsm0lwQ05SM=
Received: from DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) by GV1PR08MB11001.eurprd08.prod.outlook.com
 (2603:10a6:150:1f2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 12:14:33 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::9d) by DUZPR01CA0042.outlook.office365.com
 (2603:10a6:10:468::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 12:14:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Wed, 6 Nov 2024 12:14:31 +0000
Received: ("Tessian outbound 57fa7becdebd:v490");
 Wed, 06 Nov 2024 12:14:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 17274f690bc471ca
X-TessianGatewayMetadata: 0y17ttSe/3rrwj+LpPuj8U5WRy5rYs4nHEAPnqdNS9duN80s9XUk1/fEFdt+JcXD7VnADNOSU6hJYFThgXYbHexpzX2bZ8q2hQUW7qFwN0m6jNVyvReF6Mj2wLnTBigcxFefSGFA4ClXnL4kGStbavn+hD7CiBpfZxiNYb31Lx8=
X-CR-MTA-TID: 64aa7808
Received: from La8df48f73af7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C341866D-D418-4566-BA48-47E9E4D987F6.1; 
 Wed, 06 Nov 2024 12:14:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La8df48f73af7.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Nov 2024 12:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIAAhbuj19Q0ziTbXntXnyPXumN4hcyesHm9MkPI7fwBLSfM8nwIjawGyZjt/D5r6aAMDsYTP2SuqNCbJMumWCrQslWm6NmhXVr8OjS+NI1eBowAlBuMoH5SsM8ivaw7+xY4QE5jZyx8J2G9XcKwbweZMHC29MC+XYflge/x3T9kGjdq2rL8nJIPQMN0viS3Zik28M0SuyH3s1OH+SNGL+XQBl9nnOcuF8r+ILALnnR45Jdm+p+stVGJal/GhGJ03O5diEKYl00GbWiQ75eszVwC6HT8xz+rH/I9Ro1j8vc30s/ct+6j3ljY60uWUkjhlXEN75zEdm/MCdZGS2HeMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ha8HrlRc04RmffUIGqK9g3Ea50Sq/28GoA6kDm6wh+o=;
 b=D6u76Su6onTLUy6Z6HZaTMzzMQ2Rp2OOE6Rrl3siKLhvOwqC7NeZdollUytDc+7XlU+lWpmfP+GmhE8Q6P4XqvtT2h5IkO86nRMPV99HmKc4lExntlKrnyYI9ZTLLQx72GxQdRGMogkAsz0n+E9pDRk1PV0hPz+nZOk00aV7a/rIKkzD/V9Yt0eQQMlZA1hYW83uoXTHhoohTSDSiE2H11pNchJO/mWblnr50xEEk6y+4hXr/g1UxRD7/WDQoa5NPUx86GTfp4WUiTjoDV6XqpLGKPq4q36Qal5CWdmXyEIFgdTMe60C8VIAQtURSHjpRs1v74LweKDNe3ZEacAoEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ha8HrlRc04RmffUIGqK9g3Ea50Sq/28GoA6kDm6wh+o=;
 b=YgBiT3BAzEKcmslYpMtf6I/ip2UGcySdtw51yasg9RTmGyPsKt+rTx0g8IwN2hJGJ/cIIONXtN5OU52kwSFhTw3SEiJsCdRGTg/n6OZB6D5L4ls+STQi3RUsJ0ohemsuRTmXhRqRxcv0NkL5rqLCjsJnpJwaXLKBVsm0lwQ05SM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by PAXPR08MB6448.eurprd08.prod.outlook.com (2603:10a6:102:152::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Wed, 6 Nov
 2024 12:14:15 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%3]) with mapi id 15.20.8093.027; Wed, 6 Nov 2024
 12:14:14 +0000
Message-ID: <4e7bc9e6-f3d8-4e21-94d9-414ff0857553@arm.com>
Date: Wed, 6 Nov 2024 12:14:13 +0000
User-Agent: Mozilla Thunderbird
Cc: nd@arm.com, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Lock XArray when getting entries for heap
 and VM
To: Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20241106120748.290697-1-liviu.dudau@arm.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20241106120748.290697-1-liviu.dudau@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0219.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::8) To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|PAXPR08MB6448:EE_|DU2PEPF00028D11:EE_|GV1PR08MB11001:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec22ad8-6d71-427e-37c9-08dcfe5c91d8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?T1pwaHo2SEVDNzU1U0wvcU1ncXh0aFhqS1VveUR6RnllUWtmbHgxNFZ0WUk4?=
 =?utf-8?B?b1p4OXZjQWtRRFN4SnR6QzhOSk1VNVdNUGpIem44LzVOenVMSnQ2Vjk5THRw?=
 =?utf-8?B?TFpOSmNkNCtlbG5xZ1dJbExMazd2SFBxMGlEWlc2T2w2SHhGWnRmNkVzM2xF?=
 =?utf-8?B?NVF3RXI5RGhqNkJmUmRIRjh3ZGNQM0VRMnY4TDBKUitIQ2FOSUw0dS8wVDNF?=
 =?utf-8?B?cjFTc1MzVmlCZXFsUE5BUmUrYTRWN3lCWWZRd0R4QXBTUmxTY2FxNUo2ZXJN?=
 =?utf-8?B?bnJPZFBlWFlKZXdwUGZCMS9RckxzUHlEV1lGUFRJcTBvV21hd080dENYeWdI?=
 =?utf-8?B?dS9yanVuTGR4RVdpUDZ3a1EyWnV5cHFQVDJQNE53eFB5a0Zya290ZlVCcXh1?=
 =?utf-8?B?bFlpMktHSHZsWE9KdkxQUHV2bU9nOXc5dUNCTytRRjZra1dFbVB6SEIxL3JP?=
 =?utf-8?B?V2hkelkvYTcrc3lKc2h1VzVRbUFEb1EraEtia1UzcEpDeUVCL0RlQnJ6SXdp?=
 =?utf-8?B?YndBeUhmWG9maDQ4amkyN1d5QjQ0UE56aU54N3VkdjdRdis2TGN5eWZVY21B?=
 =?utf-8?B?TVF0TUhLRXR5eVR3YTdmV2l1bFN2V2NBdFFnRG5oK3JvKzhYTm9KUHRrREpV?=
 =?utf-8?B?MUdxeC9IM2d5eU93OHBoRm5uUkhQdXVENUZaRXpuZiszbU4xeW03ejkxbGJI?=
 =?utf-8?B?S1JmZ2pNQ2c2aThLWk50alU0MlBFOEs0akVWNDlMZDNWQVVvYTRFSUd1Q0la?=
 =?utf-8?B?bkoyYUppQUgvb0p4YlF4UVJ6U0ROV2RaRU5JK2tsdTU0b3ZQaFJUMzJ5M25n?=
 =?utf-8?B?Y0E1Y21JdTZib1FZcEg2eDBKNXlQU0xDWktLclpNdFEzWENEV3VXMXFWSlN1?=
 =?utf-8?B?Q0pMUE11bE9VRUlGY1dndDhZUnVQZ1h5UkRKbEpsMHV5RDYyeUlmNnBwMDAr?=
 =?utf-8?B?R1RMQ2tKTmF6azBJZVE1ZnR0R2tjeFJ6eGdQb3BnSmhYZ3g5amRMSDlObERu?=
 =?utf-8?B?VkhOQ1BZdnI1ZExaOGtPdkcxdC90STQ1ZjlHYWliNi8vbXk2TXJ4OW4rcFlh?=
 =?utf-8?B?NmJkRWJEeUdrTmdidWJlaHFJcmJWUnpXSW8ybjVJbmxITTNYRXlLc2M1Q2Vo?=
 =?utf-8?B?WkhUTXNNUGY5M3RVeDBQOUdYWjcyd2E5cUZ5V2p4ZmZIeGl0QzZMd1VuNHcv?=
 =?utf-8?B?L2p5N0J6S0tSKytBVGVkeERHNjg5UkZINkpGNGFSd1Jqcm95dWY3cnlvMDYw?=
 =?utf-8?B?cVJYa1JsQ3lTeWF3eDZKd2FFT2JWaFJTRUY1dTY2d2tkTE10QkM4NmJsbEJv?=
 =?utf-8?B?YjVWemorMFp0d2RLR0R2ZU9mY0RYUG0waTYrS0tuRnk3UUdZNFk5OHVybjM0?=
 =?utf-8?B?UThlYkQrdTk2d3Z3UktiR2dOU0l6VGVjMWxUQ2w2b0hQUVIraVpHeWtvekRZ?=
 =?utf-8?B?MUxjQWdrbkxKQ3lRNGh0ODNJRnBwWEpBZWdETndBM1QrMkRmQUJUVjBBTXdi?=
 =?utf-8?B?U2pMbittT25weC80L3JscklaLzRVbEhFQWwvakt1UXRSUm1hY0hLZUwxRGUy?=
 =?utf-8?B?QnhTeEZFdjNQYTZvQUJGUjNKRWxEbkZPSHc4MVpDSmZRYzIyZENrN2tnbjJs?=
 =?utf-8?B?SE9FQmRUNkg5RjArU2ZOYXFHMlh1VmRzQTE5RWJEaEIyNzNtd0Nhcy81bG1C?=
 =?utf-8?B?Sm1WQ25hM2lHV0trbWM3dXd0cWpjOVVCMGtmNDhTVktmS2h6V2FnNlBhWmt4?=
 =?utf-8?Q?NwXhCeE1nNwVQdkTBzQO0xvGD91b/5szgpKfQMs?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6448
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a9ad4ac1-c0fc-42cc-85e0-08dcfe5c87a1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|35042699022|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGRUdVM4UjZGWEY5THZSNzBZOXY3QTFrNDltNTA4UGJKbkVEd3Q3ZzQ3WkJI?=
 =?utf-8?B?MmE3cU9vektJWlJycVZ5STNybHNTQldXQ3RJZHFFb3lxT0cvYlg3WXZ5cTBa?=
 =?utf-8?B?OWZkU3M1OU9ndGhObGhwTVFFZUhucUQ1WHBUREVGdkkyT1RxcGJQelNLbUV3?=
 =?utf-8?B?ejhzeGMvNGxKQUJTM3Q1QmJ2OFhwZGYzdkNlZThuNzZ3UnFGVlRBb0l3akla?=
 =?utf-8?B?NjVaa1A4alREOWlBemVjN1Rvd0EwekZjcDF1RXJmU1FTcm1jby9yRUlXVERm?=
 =?utf-8?B?S2Z4RFkrWEdidTRFRkhUL05zN2RWTkVjbjJhYXRHTlp1SEk5Wk5NdzBUWXJi?=
 =?utf-8?B?Yk1oa3VEZEZrMnFyMHd6U0orbmFDMzR2anJOU2xhS2FVN2pvYnYzNCt3TDM3?=
 =?utf-8?B?YU0xRGtRYUwrWUw5cW5JUXEvT202QzdZZWZNWThjbXErRHB1dUxFdHBoZWc1?=
 =?utf-8?B?RFplN1ZhRmVQd0V3T0E5VmJad0p6VHNRQVlZM3NkSnJDeE52T1dFbkp1ajhH?=
 =?utf-8?B?RkRTbytSTlRjZTJIU1FYR3pDSUw1Q0NhUGxqUHdtdFNNZmYzMDNoYXFuMnVL?=
 =?utf-8?B?OTNwcmJVVEFZc2JqalhwRm5QVHUxUkFjUDBMbEt0ZGVXS1FpV1lKd0tvc0J0?=
 =?utf-8?B?NUZmVWt1M3RDT0FzdEpMZFVNSHlMc3NRZSszM0IwZnpxN0Rmb1JGZGFxZ1l6?=
 =?utf-8?B?b0NnZnA0NzlpZDVsQ1BoR0dlRzMvYStmNWRvZWxBRjYzbWdNZ2J3cThzazdC?=
 =?utf-8?B?YTVUL3FtbFZ6aDlkdUV5blR1SUxCZ252VnZDS0pQbGtDdVdxZFNmYUh3OGc5?=
 =?utf-8?B?NTdrTFB4d0JMRGFGTkJLUmN1d21Ma3RJWFQyZkMzWW5WZ0R6RHplZTVEcDhX?=
 =?utf-8?B?aWFuazNkN2lWRERmaEREakNlTTRmWGQrN25ZbktuS1Q4c0lRTjl6a2RQQ1gx?=
 =?utf-8?B?cTRXWGFQVDJnakltWTljVUVLTWdMN0s5ejNGbzZyVG4vMWEyazJUNFYvOTZH?=
 =?utf-8?B?dm42ODMzNzRVZVN3OHBUZXFKU2dqUlRrcEpqWGFtT3ZzTVROWCtCWG05YnBw?=
 =?utf-8?B?WktSZHVDNkZDeDdadm4yRVRtNHMwVU5KaWhOUmVFbDVFRkdSNGt4L3pvM2p6?=
 =?utf-8?B?SEx5cVVySk42MWN6Vyt0UjhhWlFCY05nU3JLbThjUUExaXBPRjNaS1VTdE5i?=
 =?utf-8?B?SzRTRStSNExDaG51VGZWTGg0clhoVEFXZVorSGNPeVhMMG5XVlF3dXpMMUJM?=
 =?utf-8?B?ZGM4RHFZcENFWS9mMUNnVGsyNDhMK2pJUXJkcEhhaDNMdjhuenpOQ2R2VUFp?=
 =?utf-8?B?Y0dpdmtnWjRvWXR6VEY2aWEyNFNxb1ZQZXhhc2ZNc3prWGhnZW4yQkk0TzFo?=
 =?utf-8?B?cXRORGh1SWRzOUE2LzE2eFFPbjh0aGZCRldzWFY4NEMrb0ZIL1JEVzU3U2x0?=
 =?utf-8?B?WUQxVTJUcFZYSDNDRDlwUjVCSGpEczM5ckFoVVdvRWcyLzdYUzYyWXBqd2VO?=
 =?utf-8?B?UUlTbElMS0JNZUFncC9Fb3BsT3lVVnFTaEdrb3NXSUhiOXNJeERTTXZFUEUr?=
 =?utf-8?B?U0h1d21SbXIzRlAwbVJsMktSNFZZNERCTHBkVVAxWTU3UXhhalpORmpVTXk2?=
 =?utf-8?B?clJzWEo4eWU1ckpyTm5PaWxvNGNJcWlkbE8yc3pBNEpXaS9rUW55d3gxczdN?=
 =?utf-8?B?THIzcjduVVcxdjZ2dllpbDdkcGZHdWdIMVZsdk53N1BwUytwSkVEWGpTcjRz?=
 =?utf-8?B?TGlEN25MSkR1ODJQT1Fxa1Q3YmNFcU1EK29WRGV6Qng1OWJtRmpSaEphTUYz?=
 =?utf-8?B?Z2pBcWx4Qlc0QThoSzM3eDdLVEtNaytBOHVoTkFQMlZSLzFlMDBDSFk5VGZN?=
 =?utf-8?B?VFdzWjJPaThlZE5JQVJNbzNnSzF5SnZRTVRWdVprYzhzV1E9PQ==?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(35042699022)(1800799024)(36860700013)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 12:14:31.6924 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec22ad8-6d71-427e-37c9-08dcfe5c91d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11001
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

Hi Liviu,

On 06/11/2024 12:07, Liviu Dudau wrote:
> Similar to cac075706f29 ("drm/panthor: Fix race when converting
> group handle to group object") we need to use the XArray's internal
> locking when retrieving a pointer from there for heap and vm.
> 
> Reported-by: Jann Horn <jannh@google.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>   drivers/gpu/drm/panthor/panthor_heap.c | 15 +++++++++++++--
>   drivers/gpu/drm/panthor/panthor_mmu.c  |  2 ++
>   2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 3796a9eb22af2..fe0bcb6837f74 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -351,6 +351,17 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
>   	return ret;
>   }
>   
> +static struct panthor_heap *panthor_heap_from_id(struct pathor_heap_pool *pool, u32 id)
> +{
> +	struct panthor_heap *heap;
> +
> +	xa_lock(&pool->xa);
> +	heap = xa_load(&pool->xa, id);
> +	xa_unlock(&pool->va);
> +
> +	return heap;
> +}
> +
>   /**
>    * panthor_heap_return_chunk() - Return an unused heap chunk
>    * @pool: The pool this heap belongs to.
> @@ -375,7 +386,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
>   		return -EINVAL;
>   
>   	down_read(&pool->lock);
> -	heap = xa_load(&pool->xa, heap_id);
> +	heap = panthor_heap_from_id(pool, heap_id);
>   	if (!heap) {
>   		ret = -EINVAL;
>   		goto out_unlock;
> @@ -438,7 +449,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
>   		return -EINVAL;
>   
>   	down_read(&pool->lock);
> -	heap = xa_load(&pool->xa, heap_id);
> +	heap = panthor_heap_from_id(pool, heap_id);
>   	if (!heap) {
>   		ret = -EINVAL;
>   		goto out_unlock;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 8ca85526491e6..8b5cda9d21768 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1580,7 +1580,9 @@ panthor_vm_pool_get_vm(struct panthor_vm_pool *pool, u32 handle)
>   {
>   	struct panthor_vm *vm;
>   
> +	xa_lock(&pool->xa);
>   	vm = panthor_vm_get(xa_load(&pool->xa, handle));
> +	xa_unlock(&pool->va);
>   
>   	return vm;
>   }

Reviewed-by: Mihail Atanassov <mihail.atanassov@arm.com>

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

