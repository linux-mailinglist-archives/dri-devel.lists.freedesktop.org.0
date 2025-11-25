Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 718EEC86D95
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 20:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFE810E450;
	Tue, 25 Nov 2025 19:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AWZo0dJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AA110E450;
 Tue, 25 Nov 2025 19:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF2u9ZXxTJlzbU59HeXEo4SFZBjyKIs/83WX/M/9D2q7t73dtwBqjOt/RZdpNn9y4X7STaqZQAdy8O6cFxSP/xc46mKwisO1aqGnwgRnxMoIlOUCTBgl4zNkl5DeIe6fgx0aHx/vWRz7JRNd0h1IlpV4QnFCUz43eNBmL4eGde5tfVU7KxHLQ03uxNB4WAcqBcB+73MlEulop03HECU1TwcGSLX/hGZhutDJ71yqO/8+e3WUTthkp/WLjqCQLljSqes+j6U8iiYK1cyqablatfUpFYzWiFx7gVc9SzF/JzJ2pIbCBGTgmvVCYwO7ahCeUqA0gxJgy8CimdoDGqsG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqQAcY+7qqjitfco85j0k4lWi2b4DJANYtZIAkWlQZw=;
 b=j2fPberYJQLPectl5c8BnEcMMa32BpEdRy6wCKvkXjuHlqyT6VV1TiJ3HErfQxwdHZ+daUHpiQieKU/RttVAvGDu2AaKmPHTqSkfToFbNM+PIGfUTu6RFv/raFqjScPjJNg7j7Z80G6XzcT+ioS9DEEeLKj4vlgyXVEl1wFckygK5g1wdMYxXIikFZKlxsFoaB2YINmPZ2rppeeac62crNHfdmfn6Mfjien3athpPKMI8LxA6VChVJmE0G4NNx0Gl0/wWB+oWyz3CrVhs3PN7rlD1QT1h223GqsFh3Po4om6qxrABZWNU5ZSC0uTQvqkGW3EgNrYDxcA5QU2oKCsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqQAcY+7qqjitfco85j0k4lWi2b4DJANYtZIAkWlQZw=;
 b=AWZo0dJeQDRMLeKs+9q8UAtoOoPtrZ66W5nH2zdKAfKrjZ86wEEu2ufFnX336jd70mSRA/W/sz+cQP4Jljtzac20b0WBTBZPtU44OpFA9m3YtydwzWXfadsocbISxb0TAfSIKlT05fWu5nn+e/E8UugP/2OWmigQI+ZSLr8Wi4Aog7NH6tY+7m2HmjRO48F9zh7t1XTWL7uZ/2SZP9hwsC1Z1sh8RQA7pxDc6iAf/zkyElDKXWlewEaLR7E01wlUjjQwZ9cXpe5kRlMeuOAPA/+4ymbJYghvEiAvZsIbGh3PEdFUkJ954GaqY2Trv5BbHcN0LH3EfG5XZ3CtmZJl3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB6366.namprd12.prod.outlook.com (2603:10b6:208:3c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 19:48:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 19:48:08 +0000
Message-ID: <92ae727b-189a-4ebd-88c6-cad06d9f96ca@nvidia.com>
Date: Tue, 25 Nov 2025 11:48:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch"
 <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, "phasta@kernel.org" <phasta@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:180::38) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB6366:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6748a1-32c0-435a-a116-08de2c5b8ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0lZSlJQY25Zb29uQXZ1SkEwdFlTMW5Zd2lnVGRJNWQ4U1JaNkt2N3haK0Jx?=
 =?utf-8?B?U0Zvc2VqZU9vUHVOTWhpMnRORUVZMU1oZUlRZ3BLTXpvVzhPd29aVjFFZ0Fk?=
 =?utf-8?B?YkNJRTM4SkQ3R2l1KzFPNmZtZFUyZFhZN0NVV2hzZm5mY09FMUFzRVVFTkFE?=
 =?utf-8?B?R2wySStjcURTUzN5NVNMclJ5MWg5OE85VkZuQWM3R2VvY1NLZ0Z4OUZ5ajBX?=
 =?utf-8?B?TFN4aFg3Y3FvcU84MFY1UC96bTA5clpOWERIWmhUTHdtMFV2Z3RwWm5JbEdw?=
 =?utf-8?B?dEtTUDlUMm01ZDhuczdBTGkvMUdoUmExWHIxUGllOWx1WWhwMUxMS3hmbTZz?=
 =?utf-8?B?QllZMVRIdDhMT1lxa0dUMm1vQUY2WGhlRzhCcEdXY252NUhGMjIwOGh0MU1v?=
 =?utf-8?B?aUE4endlR1BZaEI2b0FkZ3l2VHVCd2RDTEQzUm9zd3ZkM1ZhN3pOZk0vQ1RM?=
 =?utf-8?B?NUdiSDljNXo4VHBhR2pIRU1Ha2NONUNzVWN4YzlJbkM4YStWYnRUay9jWERn?=
 =?utf-8?B?Zmk4QzhUUnBKOUdWcm40cFdtVmQrVURmWERiYWs4QWFIL1BsV3plSkgwZjhD?=
 =?utf-8?B?cXlNN29Dd05mSjZCL1g2RzBOWDlIQ05EOFVyOWdkSkR5SXdQaGFEbjM3ODJa?=
 =?utf-8?B?d1lWRHEvWE9acGxLbS9OZnhURTFhd3FtY0ZCWE1FZFpLMXhkOFJmZGFMQnhE?=
 =?utf-8?B?Zms2RGkvNXZZMzVMTFlSOGJvT3dPajFOL0dPK0JJazJYQWk5L0hnSlprcnE2?=
 =?utf-8?B?cFAwZk9GMFd4V2thaFBEUldkSUFiYUlIQ0FiM0FGKzJjdmsyeTZybjAxMExl?=
 =?utf-8?B?NElBMjNEM1Zta1VRVmxEWlBsbDBkSkxJcVV0blJ0aXpyR05sdnlPY2VCQStJ?=
 =?utf-8?B?VjRVK2dzdnJNbHA3dTR4bHh5NndCQitNbjNxUkZBaVdjMlBXWHdUeEZJUnE0?=
 =?utf-8?B?ZHg5dC9uRnFhVlhQcW5hRlEwdDZWcWxYeXJJOEhLVmdqdjJVZjdPbGVhb3E0?=
 =?utf-8?B?NytzMG13ZHdPaEY4Ti9rL3hPOU5HTjk5bDEwd2JFamxuRG5IM1NSdkhtUGpM?=
 =?utf-8?B?MFREOGprRitobWt2eVF6aW01a25nTDhJdENxam1TRmMydWw0NzF4T1l5VVpI?=
 =?utf-8?B?N3l3bndkN2h0ZHBvd2Y3NGpxWTFzRGJUUnlTT3phRm1nMzgwcFhPTVBma2tG?=
 =?utf-8?B?QllrUEdpa3hnRC9qL21HT2hQcEI0QzAxZ05LN3R1Z3RQL0FJc0RLTi84VGV6?=
 =?utf-8?B?cGpCRXJlM2owckRSVXRiSVZnaE16MndLWXFDblY3bXR1NG15UEEyWDlialBm?=
 =?utf-8?B?Rnljd21oVUtrTDQvSVBVc0RvRFVrbVljZEpDQXRoUXV4SW51T1UwTFBRQ0ZP?=
 =?utf-8?B?eWRwVDdjakdxSjFmTUNWTWRQQkdpNU9BNUpJdmhpRnZhaGlpUnp4c3NuVURw?=
 =?utf-8?B?SE90bmNHT0pEa3h5R3hHckNoU2pScGxEd2ovVkFybWNnMFE0N0x6UHRTUWFM?=
 =?utf-8?B?WnBneDE2R0Rldk5nMjJKZWduZE5tTnM0aFJYL213YlJIMXpjUU1sUENJVE8x?=
 =?utf-8?B?cU5mZHhNWTNaWTczTnlnZCtIR0owVnBJanRWK0JsdHdXUlY0Mm9RQmUzRFU0?=
 =?utf-8?B?UTBwa0RhdmZjTXE5WnBUWWtDaUc1RjRDc1FSaDA1RWtUbkt0ZlZLblVNUFhz?=
 =?utf-8?B?U2VkaXJMUXU2cWZIMmI5WXI1MS9qZGJmTkw4KzdSOVBwTVVkNU5obFZaUlRD?=
 =?utf-8?B?UzdkSHJGWW1TY0Jod1RaQjNMcmtCOG0zZDdiTGYwb3dNaWVab2tqclJZdURO?=
 =?utf-8?B?ejZ0aU1KaXdBdFJGbmxMSXk4MHBxb1pUZEkxV1FYZGlBSUdCK2VweHFZUVRt?=
 =?utf-8?B?Q2ZLOHQrNEtSL2hBSlBsZzBJMEQ3RDErWFFPY25kbXp0bUsrMUlNa1o4RlJ0?=
 =?utf-8?Q?/MScLNmwSPGBLdoshI/MaptVvuF1/7Mu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2Z5OUJuci9YWlZrN3NPakRISlBOc0t2Q2Y5NU9VRU1EYmloSHZ6RUpmLzhH?=
 =?utf-8?B?dG8zb1g4UUFITExVdGV1bTVEN3l6TDNTZUFOY0QxSE9wKzRacCsrL25qNWlN?=
 =?utf-8?B?VlZSNUhNejM2c3duc0RpL2oySm1YemdxMUxVUExwRlNaRG5SNTljY2JVS0Js?=
 =?utf-8?B?MWp0NS9HeEV0cXFsMWVaL0lLQkM0TThZOEE1ZDIxcmlBa01OMW9yY3QyRzVW?=
 =?utf-8?B?KzFKNDhTTnhhd1J6LzhlbmMraUZMdS9QMkloVDFBUW0xYTk3TllIcnFsRith?=
 =?utf-8?B?dXU0aVZ4Slp0ZlAxRC9nRGdsMTBOYVVyaXUwM25TZ1c4b1ZHa2dVdEx6ODE5?=
 =?utf-8?B?NTViK1lUNmpwcHpjclBQcU4yVytGVUJWTnJodzl3dDNJUHFEeVh6L0tDL2lj?=
 =?utf-8?B?dzhjUktSTVhwYzdEYTQ3S0dhbUJkUmMrYlZXdUFWSXNuQ083RlZlUmZ2NmNU?=
 =?utf-8?B?NGp6RzUxaGNha1pFZkhtUkRhcTlRbHVXWHdJbUdERlV1UXRCc3A3dGRGbGFt?=
 =?utf-8?B?c1dnL3RGR0Mrdk82djNBSlc3U2hGY2Z5emxraUhRWGc4Wm1ac1kxbTRGSFBo?=
 =?utf-8?B?YTVkemNWbVlyTEh5Rk5yMSt2RHNXYlJkbDZPNXp3NzFQZjNaK0p4M2VNVzVz?=
 =?utf-8?B?K0JGZ2JlSmxvUlNLUmtJWWorT2EwZXVXQ1d2L0N5Z05UZ1dUR0hxQSsxR1B0?=
 =?utf-8?B?QXBrNit0SlE3SDc4VUhiNHZ1bmpwQkp3UVNmMW5CUExOTy9LWUNhM3YyZytv?=
 =?utf-8?B?U3F6UE90SXdYblNtQkpJTktObVdYM05VOGF1YWNBQ0U4WVphZ0xXK2ZkUUlw?=
 =?utf-8?B?RTcwQWdBdWpnTWx5bTJqNndJczIycjlEWFBXTGsyYmN0QlA2dXhBc044dElC?=
 =?utf-8?B?eTZMZjhKTkN4OGVPb2VjVkJnL0dMNHBtUEZzd0NuZnRhcWczeVcrY2l4NjNS?=
 =?utf-8?B?aVN4cEdqcUpwMWc0c1hSVG1hYThiVjNLWTYzemxEeDlpMjd3UklvK0FPL0c4?=
 =?utf-8?B?MUFhb014ZXpTK2ZNK3RQQWorbWQ1eXIrdzFoZGpmOFBBRVhkTEJSOFNTUFdk?=
 =?utf-8?B?a0FoaDlzZEVhMFBPdmZlNWtzYWkzc3hObEg0c3hvZHpkVEh4MkVEeFVsUmJs?=
 =?utf-8?B?N1l6Tjh3elQvN2VCb1hKcGhoanVNaS9PVHFrMmdPYW5MeC9kQ090V21ScDlk?=
 =?utf-8?B?d1dEVFJHMWRtaXZrdXF0bkVBdEZ1eHY3N1BGYjhsRnhmbkUwRGc0RjNPSHJJ?=
 =?utf-8?B?dXJUNlE0MnJtbEhHWkxldDVjVDN2THEyVDU3RUVlL1VtcDJuYmwyY0RMMFU0?=
 =?utf-8?B?aThveGRmcFd1NmVRK2Zzd0Vvc2FBOHIrM0xMVGlpMzIvcGF0eklZMFZRZVox?=
 =?utf-8?B?b2VUN2pFVHIwaURzaTNWZ3kxRkpacWFxVjFPNE1SYkJ2dDcxbkNEWFhqSGYz?=
 =?utf-8?B?UHU0QnF5UHBvalV1T2JYRmd0WHRuQm41VGtnNVl4aFhwU2FQT1liZERCOUl0?=
 =?utf-8?B?RW9DdmlqcVdpZXdYdEkvLy9udUZBbUpsejRBbU0zZ0pNZUd0WEpHa0x0T2tH?=
 =?utf-8?B?VFpyMHIvVVFVVzB0dlI1bktOa2FOanJXZm0xRVN6cGpCaTd2c2pBaFZ0cGNs?=
 =?utf-8?B?cVJXNUxETHVFU0RxWnZ2RnBvaUQvMzdPOE93QWQxcTErWmtHNnVwMzRqT05z?=
 =?utf-8?B?WThjUm9jTjVpWHdCRURQTHB1U1NraTZMU21kVnh2Z3JFdUxCR28rdXlGQ1Qz?=
 =?utf-8?B?ZXJHZjdKTCtleUlJSysyWUltTjA5NDFDbjdQMXFYWU8zMndnQndUZGhzcEVv?=
 =?utf-8?B?Vjd3d0V5SFJRWkdYYkRTQ2FMeUMrMWZBUkVzRHc2VWNUdStnL2NCZkppLzBJ?=
 =?utf-8?B?MVo3R0VIemYrL3BMVHE1eWJxeDJ4TFVaZ0Z4b3YvSWE0a0d3cHp0dXAxS0xt?=
 =?utf-8?B?cTYvOEVoVEZmWjdLUHVKbU9KL1BGT084bGx1WEVid2E0REllVmJwYTdPQUVz?=
 =?utf-8?B?dGxZTmFnMHkzUGRlMDlva2JzZ0FHM2tLUVU1Rk50SzJmK0pJbVNxZnBYRkV4?=
 =?utf-8?B?TnBFNVg5UTRDd212MVVBVFdiMnZXaTUvdkxQbTlRTGt5UEF0U2tPcnh4b2lV?=
 =?utf-8?Q?0mZE3d3vvMi4DwD+c5F+Zzx28?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6748a1-32c0-435a-a116-08de2c5b8ea4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 19:48:08.1932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipruMBOZvvpTx0TzHmi4zJacXjK7jvmADZVAr1LDxBju18dIBUvnayhEDsSSYnUS1bVzDc5wlIgC/f3A0elFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6366
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

On 11/25/25 10:16 AM, Joel Fernandes wrote:
>> On Nov 25, 2025, at 9:52 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>> ﻿On Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
...
>> Just noticed, but of these helpers only `INIT_LIST_HEAD` and
>> `list_add_tail` seem to be used (in doccomments).
> 
> Correct, but it makes sense to add the most obvious/common ones (also to make it clear that using these are supported).
> 

It's important to exercise the code. Let's please add that
coverage, seeing as how it is quite easy to do, right?


thanks,
-- 
John Hubbard

