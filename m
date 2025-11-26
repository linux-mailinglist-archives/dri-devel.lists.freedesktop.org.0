Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B730BC87B73
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 02:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D794E10E070;
	Wed, 26 Nov 2025 01:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WYw+0kGd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1189B10E4E2;
 Wed, 26 Nov 2025 01:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDT572OMihOrMpTa8W67YO7tbiuL5VlxcM4QYv6sv1Sg5nMMW7TtLB/DFQU5zY+CqPszK28PVh526OkfeT6/1O5IcNA5x4hemjs22JQmFz5AQjEb06w9Ot/+Cm8i1xfxTi7LfBs146KL8DD7gOYqkzJpaW0Pfmyx1J0VCiIH1XfLpjpRU+FBBWoeeBu57kKiFHylnEb0gkdr1i3psTcx2FPCzNIZxpUEYH08BJ9aT4JmmSWqZW3t6/QFvnvWSy13PuXrmzVwg51HNPFmD6FiRLDRkop0V2GWcnTTjor2Ovu9ubW1AzRlLyJdfIGHtRec5XauvHNpS1n8x50ULTSg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xW7T8XWtotoroqfcJnvFtQiJ4yIcsYefwtsA54ukBs8=;
 b=X1oy6o6qgfhuk4KnNTv7siuqWZFo8Wd+m+NFdavchY712eShiiMjnUCKu4KOOQcduad2CbYVArCo1ymNOo/pjzvzwHHO9Q+FvcAtFuUfh/f4PMxFOLohBKeTUwCiFVRX1OOQVnY1Va5WYceIvdOO7sVaSc1mQ9ZB7nBISj1wYk5wPe2k2CSbAtKtXbO1d2g6ln2cA9m9hRP5d5ZXbaa8Pof41LbqGYt+Enii/eklje6RCF2GZHJda7QM/nWrMsGb3tyOQw4hmNkKE9oD6NPMNCjMhFhWLzVw5oz/mz2IupltJFm7Tbnq9KrhL3Ns7JsqwMCP3YSsASXmk281rw+prQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xW7T8XWtotoroqfcJnvFtQiJ4yIcsYefwtsA54ukBs8=;
 b=WYw+0kGdtnXZbF8AHCkGNK9IgnAmRQxL7t/iyeeWVS7kNpXa17a7sXs1HL+WFBNp/vMOS4fVagY9yxCXlg3qopmVBXURrzSUYJlwgrh3exOTiV33rBwXHvoOb+6KhCqT1TBKLPKo2DUedmbZ68BYP/GzqOx82ba8sSbi6lzee0/ZRXlFwV/9z9p6l5A3eekK34PturvkvD4IlMzwwWOm0qVytgM2cxslxwuTPBIZNY296XjEnzoDgeEruBQ6q7YnNlxhFp828p3oSxwCBp/3BDnpeacpUY+jcWO6rkA3w2/2Mv0y9wUhliBdpP4A0DvkbWZ2mvpEzKupFyHI8N74Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 01:39:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 01:39:40 +0000
Message-ID: <540391dc-caaf-4ca9-9729-e3147bed3100@nvidia.com>
Date: Tue, 25 Nov 2025 17:39:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>
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
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed4d5d3-795d-4b57-df6e-08de2c8caaa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1Eya24vSVBVZFhjU1ZLOW1vUkpTQUFlZnZ2ZE50N1R0bkFXNWpVbW5UNnYw?=
 =?utf-8?B?QWZHY0tzRk9jQVB5NHQrcE9USzljaEVqN1NiOENwMnM0NjRyMzY0QVdoelE3?=
 =?utf-8?B?d3JFUy92dlVaOVhiMTBvY1QxV0RDTm1YZUdXcXRKNktCNnhkQ1A2MWJ1V2JH?=
 =?utf-8?B?dlRsUTc0dGdGNDBRaTVtWXNuaW16YzkyOGUvelpVMndhdnI3RGVHUGIxaXIy?=
 =?utf-8?B?OEtCTnFYZWNac0ZuYkVCclVjWFRZbVNkbEd6T2hFZnowMC9nRDZaSzh1MnRN?=
 =?utf-8?B?YkNyK1RnRnJaU1hLYXRIWUtWN05KeDJQRlltUFJieEdrOWpTQjVrN2JFdWEy?=
 =?utf-8?B?L05nbXBmNURLOG52Y1k0QkhhbHAvekdrL2cvUXM0a3JoNzVtZ0ZWNUJrajBL?=
 =?utf-8?B?dFJuU3VYUTMyZ29VQlFVT3NwZnlPTFNIUktNbGV3eWg5SzhCVm9xWk8vTWdC?=
 =?utf-8?B?R1h5Y281MWZaTUZ3aDdIV2gxNUhIM1Q4U0hFRHlNQzlGTVZZQ1pzKy9lOENP?=
 =?utf-8?B?ZWhyL2hmUWpjbmVyRzFGdi90NzRTd1pGekFXN1YzR0VwYWhMYWpYR0ZCUjFP?=
 =?utf-8?B?QkltakxVN3VMRlNLV3VKdU5UbWRpbmh3QkhsRXo2aE52M3FFVFUrbzc2VDZL?=
 =?utf-8?B?VXgrS0VSZm8xMnRJcHh2WE5BOVhoRXVKSTh4ZDRGR09pVDB3Y2RiV3N3QUx3?=
 =?utf-8?B?bmZVcWsxR0o2RS9DM2JRSGVRSTlhdWwrRHdROHdyTnVQaVN1ZlRZZnNSc2FB?=
 =?utf-8?B?bHZYUVZpekxvMDFpUG1UVnBmSFZwV1lyQTBCWlJMQ1lIUkZRKys2QWJYdGhz?=
 =?utf-8?B?cHpTNEVsZXZuYWJYNzlFVWhSM0EyN3NOa2xURmJwQjhqVTVmbVg1K2psWkpP?=
 =?utf-8?B?eG94dWdtd1dLY0cxNUVjc2tBNGowUjJqcndCcW1KMjZHZE1HTVJvRkRpZURW?=
 =?utf-8?B?c3gwNVRzam1qNzQwYlkxY2I0a1QwK3NubUo1di9mak0zcy84cWtsUHRUVWtJ?=
 =?utf-8?B?ZFo4WE1zdHJpL21OVHZLRXVpZzFQUWdacnFQbU0rRUpPLys4d1BxVFlTVXVN?=
 =?utf-8?B?Mlh5TG9wL0treHR1eGo2bFZGcXZKQnlNSXM0QWIzaWlHdVd4akhPcUtMcjMv?=
 =?utf-8?B?UktVRXd3U085VWtJQ2kwM0JmWUg1Z3Z4L2xYL1Rlb1VjTmtzeTNaWWV2UDVX?=
 =?utf-8?B?ZVJLZWV6Y1c3bXExTHdBY3BuQmFSSXp0UVd2WjBYendYVGkwZnNXZEw5WFpl?=
 =?utf-8?B?ekRweXQvL1RIbmV5SXpXc3VWTis1MnhKSUxlV2Zmck85eUhGaWRPaU5NVlBn?=
 =?utf-8?B?UDhhRW03YTY5WTE0K0ZPTmhnMzlYMkRBVlU1VHhnOWRzMFdKdU90cWpsbnVK?=
 =?utf-8?B?T2VkTVJyaTNMUEZjcUl1bjJlQms0OGxVZXNsSXRzNnkzdUVsVDNjYUQ0YTdU?=
 =?utf-8?B?MkkydDQ5MkxXeVJ6QU5FSXljUktoYVlXMGxwREg0SEcvTmM1QXU2VDhQbUQ3?=
 =?utf-8?B?cFBYN3luaTFLdVdlaWJ1ZzFUVFZtZ2l2L2VVMDFGTDRwU0pCa3kwWGZIWVZu?=
 =?utf-8?B?UThyTmoyR1VNWTRJaDQ2aTR2bFJsdno3czFqeFdrQVZGYUdmdlNuSWdBK0h5?=
 =?utf-8?B?NkxQQmdsL1BxQ3BhZ1ZibG1tNFFGM2dBT09IQTN6NUNlcG40aGhqUXFCemRn?=
 =?utf-8?B?N05ncWRrTjJjY0RyOU42aXcvcnUwOHlOaXVVRVY2cktEdHV2L24reWg1RCtp?=
 =?utf-8?B?bGlydmJkTVlwSjdSR0NnSndnV1VBeUxZUjErdllIc0J4SXl1d3EwZnYvcWwx?=
 =?utf-8?B?MlNmVEFidEZwMS91a2l1S3BLa0pKUnNnQlJjWWFzekNicUZ4aXNKVG1nTE5C?=
 =?utf-8?B?NW9xTFdZLytPMmVaWk96bDVkR2ZrZnMxcUhHU2cwcTI3YmtsaUpPTlhIbkRO?=
 =?utf-8?Q?aDWiCGYNXjS0iHJkbWdI54wwiDYyktvr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXp4c0ZrYWtyeG12dmJNTEtSWTB2OS85TGYvZzdqUy8yUGZTck9SeUNQZGZh?=
 =?utf-8?B?Qmo4aXJ0NGhrQS9RaFpVNGpzenFHVVJDbEZPcjBhRjdueXFOQy9kMUMxenpE?=
 =?utf-8?B?ejdZVjFkMDcybFhFd0I3VzBrOWxLcTRvS3A3N3g1K0x5UDFITllKdzdiR0JB?=
 =?utf-8?B?MUN0c2lkY2VEZVg0M1RoNk5zVktyMDJEdkZmTDZPU0RZQ255bllJQnY4UEgr?=
 =?utf-8?B?THhlV1BSYkRWYXNOdXpmRldYMnhqTkVVaHhEZ2xwczh2SGttYWxwQTZYYXlw?=
 =?utf-8?B?SGtpSmwwcVprUVZhK2cvem9vV2o1L1p1RmY2Z2R5d2Z6cmtlM2FFMUdJeTJx?=
 =?utf-8?B?UVdvY3o0MlV5ZVQwSFFKTjJxWGY1Y1doL2JjemVRaGo0RFZOWDAwR3VNUk9G?=
 =?utf-8?B?ZGZRUWlKQnhnTTBJdmFRRHVRZVhqdlJiMFBhV1phOWlvVytlMlZ1Y0RIcnBv?=
 =?utf-8?B?d2tRbEpvY2lVMmdzVktQdkYwaU16Qi9FaUNSSWd0cXJMRmpObEs2Yk9kUERm?=
 =?utf-8?B?Z1ZiKzJKQUZVaFJJS3pYalVWRXlTYkdtVHMrQ0tJQkVpVVpFQll5RWQ4Yi85?=
 =?utf-8?B?dTNEYkpHaERaVFJwdTkvNW9hTkRJakVlYkJpd2xYbC96UzBONDZSN0ZyVkdX?=
 =?utf-8?B?aXlLZjF6RzBYR0FYYUF1eUU5bDVUb2c4TC9JWnhISVBlU0ZKSCtwclhHM0NC?=
 =?utf-8?B?dG4rSm15MzRRNGw2dS9HVjRsOTd4MVZXNUNkcXhrV3VrdVJGU0F0MFF0KzA3?=
 =?utf-8?B?ZnFHd1BUZ1Z2WkRYM0JpcGM5N1pybnhTNUE4OGczTW45b1RPeFJkSzVkcEx6?=
 =?utf-8?B?VHlrZzRWSlE1dlQxYWQxMVNiU2NjUnlxQld2YTRrU2RkVXN0bkJVdUxUVFJB?=
 =?utf-8?B?dS8vVjU5SDNDeWozWkZURmRpaG5uYnhkcEZqM04xVjJVZUFxTVRQclV2Sjdl?=
 =?utf-8?B?WWxCdzluQkoxZ2gzRGpSWFJZejVIRVlOS2xEUEptR3VIUi9oWU9abHY0SWV4?=
 =?utf-8?B?OHZLMzZkamJSb2hCZjh1ZTU2MzRpWjlzcmIwN1l5M3NVU0pCam85dEFsbWdR?=
 =?utf-8?B?VzFqZUVoYWI4UElTalNYQTR2b29kWVpoZWE5L0FydnBncTdzQ3g5MURMUEJI?=
 =?utf-8?B?d2M5MkFRamhDUXBGUHVFanV4ejM5bG53RUhjMU5SY3h3OUJLb2ExM0FpMldR?=
 =?utf-8?B?S3VicnZBWm1TVGs2K09lRjZHK253c1UwRGdBSUhIUVpDSmdtRlkzbjdrQmlZ?=
 =?utf-8?B?ZlNrSjNzZHllTUhaZlJleFZLdWpLaEhKeStmMzBrYStOcm5UdVRQRG8xbkFt?=
 =?utf-8?B?M2JYMkJ3ZEozUi8yTEZmbGxpOFVqWUlKalUxK2c2dDdwc3ZDTHN0akgydE44?=
 =?utf-8?B?NnhtcmNsK3I2RXlESzJUcjZodUhqMitOMkIyVTlRY0t2eVlrdTRqalU3QllO?=
 =?utf-8?B?a1J0UWZCUTcxY1h6SVZwcTcvbWdUUGNjZUhJSkc4elFrQkZFV21nQm9OelUx?=
 =?utf-8?B?U0ZXb09tN1orVU1oVVRHdDg3NVM5dVhkSFkwbVBrc0dYVHVaaTAvajJsNGhv?=
 =?utf-8?B?ZzE2R2V1SVJoanN2UDdSdDdlcmFEeXdHTUVRT2g1UjFSaVdDSjlQTkNwdW0z?=
 =?utf-8?B?cEJjVmlhSWZhWDdoYlQyTks1WWRzWVBDeER6b3NoWDVlRGtsb2VzbDA0Qng5?=
 =?utf-8?B?TkNQSGY4M2I0MTVPZERucnB5MFpqMjQwbmlIQWhGWkVEQmFDb21ZZytSUldl?=
 =?utf-8?B?M1UxQXhSZjRFTzUrV21RVmpFVEJ1QmsyZUgyTnRRUmJvdW83YmZ5aXRJVFZo?=
 =?utf-8?B?MzhVWGk0RlI1Uzk5K1IrYkpMZ1lMRUMvWjVLWi9rNnMvNFJTdk8rODl6Y0Nh?=
 =?utf-8?B?dWVCcHBlcnVnamhPcldpaHMwL1NuT1NoK3hsZXlIRUx1TmNzY1FXUkczQUF0?=
 =?utf-8?B?VEpWNVVJdEpiQ1FVYjRjaWVIR1V6SERTQWE0bUlLOTNSSnY3SGRkVlNjK1lu?=
 =?utf-8?B?MWNHMlBnQW9UTWhwTDByZzQxTjVCbVN4T244d1FTUitaMEw3bUNkQ3kxQlFM?=
 =?utf-8?B?VlFrWHBNWE1sWnIzTi9vK1dML2creXhnM2JDSURmT3dsTzB5WEpkcmNCd2tr?=
 =?utf-8?Q?4I79/ypH8JUV2ArFgth+3Mf78?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed4d5d3-795d-4b57-df6e-08de2c8caaa0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 01:39:40.6342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8OtWrmeFFlbiSsk7huKKulf6q8NTByov3yNsodmH5K/T9vuhO5GMpsUFNk/QebhX7+RvxPG9Nz78KidlHbBeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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

On 11/25/25 5:16 PM, Alexandre Courbot wrote:
> On Wed Nov 26, 2025 at 3:16 AM JST, Joel Fernandes wrote:
>>> On Nov 25, 2025, at 9:52 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
>>> ﻿On Wed Nov 12, 2025 at 2:13 AM JST, Joel Fernandes wrote:
...
>> Correct, but it makes sense to add the most obvious/common ones (also to make it clear that using these are supported).
> 
> "It makes sense" is subjective, and in this case I am confident it is
> not the right intuition to add dead code just for the sake of it.

Yes. I am increasingly uneasy with the Rust for Linux approach, and
now the Nova approach, of adding in "things we might need".

The kernel, for example linux-mm, is usually quite fiercely pushing
for "prove you need this, by adding in the calling code as part of
your series".

Drifting away from this makes it hard to know how the calling code
*actually* looks.

> 
> Each of these helpers adds a potential breakage point from the C API
> should the latter change, so we should only add them if they are indeed
> necessary.
> 

Yes please! Just add what you need. Other goodies can come later.


> Actually, some of these helpers are not used when they could have been -
> you have a `is_empty` method that rewrites the C function instead of
> calling the helper. The only helpers that are unjustified as of now as
> `list_add` and `list_del`, and these are easy to add when they become
> necessary.
> 
> But this raises an interesting dilemma: these helpers cannot be inlined
> and add the overhead of a function call. On the other hand, the
> definition of `list_head` is so excessively simple that manipulating it
> directly is virtually as intuitive as invoking the helper - and doesn't
> bear the overhead. So should we double-down on these helpers, or just
> drop them completely and re-implement the list functionality we need for
> increased performance?

Do the "it runs faster" thing. :)

thanks,
-- 
John Hubbard

