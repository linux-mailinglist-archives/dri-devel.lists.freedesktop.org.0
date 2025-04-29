Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B59AA0D35
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3356910E441;
	Tue, 29 Apr 2025 13:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IFQcD+xC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3210E0A7;
 Tue, 29 Apr 2025 13:13:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueJ4MBj6KCrxtq/cmh7KQTasMYBQhQHxYd9AZjnIs5qkGmw5VHOM/ORtCp0XaYIr4h7vbB7u4P14qyW/OMJWI2uePrqh/aW13JOskdgsSdZsqaH2s0+BruiayanE8B1lojxvHiuNljH4F0DbOMBhmr2O63QCoG7V7rVsBapoOdXqc+/k+XOpYa2BdWBkxuPqHOJKNwQgIIuh5ZFrn+4m3WsCeftIkXEGejbcBeFmVXPXDzRLTQS6NnXyg0uYkTPrlIbV8DtiKRyh6Dhs15PZlNQ6x+2EeqIV0XgBenjr7PfnrFI36BuNQYw4Tqswv9jD0ddMW3JGnkBzuP4ENBuonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGWsefombxzvVMmj8h1+ZaOoh2+uxgYZfDinYnwy4J0=;
 b=g07WjAOrLzlln+cQLH32M/NAqdYYl/CPBgdonGmpb+V0fP6taXD4e4ZpS1G6tSPFuqW16voXvXiczIfdnmIFBpmqaErSvWuwca033yERa62VrPRsvsDBhgX+gr1dg5RHclO+1CCme/daaqpwrIDe0fleBhJ1kKqM24JgO/I/CSuOw08lhxLUik1LazyTUXs78w3Epi/r9SopVs05SU8NwWllQHeWMfjlwvJLFVykLuIYIMsC4+k9SvI8caSVMJbrKacJsIh1Aw84b3Qn3GwEW947nj3JfpUhSExAjepki7NlIZiGpAmZjlDRks5TYXAMXWDQIwemxWQWRZwjMo/iEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGWsefombxzvVMmj8h1+ZaOoh2+uxgYZfDinYnwy4J0=;
 b=IFQcD+xC4NcqbFvfy6xEWrQqpJkNXj60MqW0fQJgi+DfOytjnlZSj4OcXS49p0vRAN0CoT/V1dWOQGCYHpa4FhnUMQd5zeEKpmW1lNT5zRix8xVFRGnlzC3b34uZ3YcTXQ6b0jRFdQFebKF+naENpOGjFtFMj/6hz4SHQhv2LsufufYiudFcLULWEJxDhcPA+dVNfsN/yqe8/wS69lCDL86/lj5TI9hE7gZLf6yDds/nYbz4h5tLk13QuzJhGi7YSgY5VB7Ud+MNYjR5OuvRQwgFJBhLMgb5KajIL+5JvDpIhsLTFT5wheaGpgpNUQiZm/hKKr+G03dYON9fV44jmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 13:13:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 13:13:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Apr 2025 22:13:45 +0900
Message-Id: <D9J5E3SL1F8V.3GN8AOA7NCQTN@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 10/16] gpu: nova-core: add basic timer device
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-10-ecd1cca23963@nvidia.com>
 <aAeGdRvlm5EVJOw3@cassiopeiae>
In-Reply-To: <aAeGdRvlm5EVJOw3@cassiopeiae>
X-ClientProxiedBy: OS7PR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:604:24f::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a11d72-cc86-4725-d560-08dd871fae45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elAwbWxVc05FK1VUaVp2bE0xV20reDk3VFp1ZGhVUHZabERxbkdvYWd6VnFG?=
 =?utf-8?B?Zm5qbHgwVnFoanBET29sVHk3eFpaV2JvY2VaVFdUV05CdmdWSHJOMTJRZmx2?=
 =?utf-8?B?TDRoMzRRdjlDdVVKL0E4VkpBZkZISnR1dmVad3NHMUd0bzN1WjdHQzU1QWtl?=
 =?utf-8?B?T3FXc095QmFYaGt5R2p3cTUvTjhXcVJnOXcyb2xsNkRTNHdjd0x0dWNVaElt?=
 =?utf-8?B?dnRUSytaZ2g1S2cvRzU4b0REanNDZVJzUzBOMXJzTkM2ZllrMWUrM2J4MU1P?=
 =?utf-8?B?bXU5cURJWFZIdXMrcVlrcUhCMnBRVndFYVlOVmNTZzQrQmR2VHRPSW1iRWgr?=
 =?utf-8?B?eEJBbDdaZS9qUExtZnVjMERmeE0wQzlBYlJKQlNzSmhJVjVpUE5NME9WcHBh?=
 =?utf-8?B?eXkvTkpCRkFzOXRPVHlQcFZnUmpOcE1acExXbnc0d0xyYXNMdHU2UitRNWI5?=
 =?utf-8?B?cHlqbUxsQmpLR0tWbnJuWWFubXR6bE0vOUsxVHo4MVJxcW1qb1dkWC9KS2Zp?=
 =?utf-8?B?a2VNVDFRWDVZVUxOWlFzZU9PYmNFYlNFRlJjTGtQYXZCZDdXMGR3U0xMSUo0?=
 =?utf-8?B?anNSanA3ZTlkNm12aVhHSnlaaFh0Rm5VMWJkdEkvaFRtMVNaMG5ZYzVKcG5w?=
 =?utf-8?B?cDMyNnhtY2JjYndVSmJVMGhHY2lVNGtVV3laQ1dxdnV4RHpNZ2MvejA5WitZ?=
 =?utf-8?B?aVZIZnNIMXJ0Q3cwK3c1TmNQNW5BVzdyRTZDL3RncFVkQm9BKzY5QkNOY3Rw?=
 =?utf-8?B?NVdJMGdlVWxvdTlQc0xsWE5uZmZsMWR2VmRmdGZJdFcrUWN2aDZyeG5JR3JF?=
 =?utf-8?B?QkRzWGp3Z0hmOXdJSnZkaXNSbktNMGJReDJ2SDhZak5qQi94SDNOeVdrb1FJ?=
 =?utf-8?B?aVF5NWh0TklvaThIajB5cFVLcG9rcU5VOUx6UkxsT25zcGFaekNGTzZ0aC9v?=
 =?utf-8?B?am95eW55TUkvam5oWmpPLzRVVU9ZYnhKOGIwRGNRb051TFpSdjdCeDBsUXZx?=
 =?utf-8?B?ODcrd3NqYVZMSDNGdXJrN1AyQmhZVFlHL1RndUZ0bGxXeVVacnN5OTlaL3BJ?=
 =?utf-8?B?eFRJSCtrbHRTeVQvRkRtZlFocS94K3VkTFlEL3dNQ05KNzlORnFHaEtvNUNo?=
 =?utf-8?B?Zk5IQjhpME9Id1dsUTlaRm44OXlqNlZ5cFFDbHY3c2pPc3RZbEVpM004cXhK?=
 =?utf-8?B?eml5YXViWnZ6MVZKUEZOL1gvNG1hdUVFcFE0enlibTRGakt3MWRVQ09ZNmdQ?=
 =?utf-8?B?K3o2REg2VFY2MWoyT0lyTHpNcEEvaEx0cG9OSkNGaEk3cUR3ZFNxWUozQzZC?=
 =?utf-8?B?R2NTRUFDeEZCMGFwQlljQVloWm81SG82R0dIU0JEcXExNy9IVVh5dytqRTFJ?=
 =?utf-8?B?WnJTZXBUNVNqaXRLQW1rNFNIeVVhWVprNVhRWmxhLzkzODc3YUFtNzJyTXZo?=
 =?utf-8?B?QWpIT0ltYjVQY2ZtRzUvbnl4TWp1WGtRaG01Rm92YmVOVHFBTmVrU1V4aXpE?=
 =?utf-8?B?VGdrYi9IaHUvQVRFNXVmSXQrd295YytORzlrNzU4Q1FNR1dXOWNwMW54WjBv?=
 =?utf-8?B?bExSRW9qckdwb0FUbTE1YVgrRjU4a2F6YzMwaE1UVis4c1ZiUFpsTUI3eC90?=
 =?utf-8?B?aUdrYVVqclhHZTRzcWNkUHRpbko2aHk0WE1hQ2prYjdXSzc0bG1rMEkvRE1M?=
 =?utf-8?B?RDVzK3VHUUplUVF3M2ZLNU82c0tNVU51S3BGOTJZMitqbkR2RlVCRmdlRFhL?=
 =?utf-8?B?cHRtUHh2R2ovUkhKYUFZRW1mMmdPSDJkUW9PZ0dZdnRTamI2MkJvTEVCYkc5?=
 =?utf-8?B?V04wMzlYbUxLUEp4a0cvUG1uOWVYVVBvL2dyNmwvdlFBTjVIa3FxNTYvbVBB?=
 =?utf-8?B?M1lnRlBUVXVNMkw0YkRCM0c4OXlKdW4xc0lKM3Jnb2N0RjY5ci94cDRiSzVZ?=
 =?utf-8?Q?DQpGWLMp6Pg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzlEK29XU3FTVXVraWlHVlZSSDVkSGNadzMyL2RDaVhBZlN6a1VLV3JYbzNV?=
 =?utf-8?B?dUhKMEsvY0lOK29iUGxQUThpS0RyY2k2UzZ0UGQwTnNUdkZORDA2T25sR3Vr?=
 =?utf-8?B?MndxL2tNNjVMaUxFazd3RUF4M0g0RUoyYkpZTFI1THB2bkZDc21tOHpjNG5n?=
 =?utf-8?B?YlZBRXhXcmRIWkl2RWttUVZYVTQyNGlYNU5Ub2VyOS9nMDRzVjNhMnltamhL?=
 =?utf-8?B?bklMNFZGUy9Oejc4NnZDNGMrQklXNmtoaXFmUDNjdVNiM080MndpODZvK0hX?=
 =?utf-8?B?dGp0RXdReFdMMVF2OUhNSlBLbWVVaURieEd1bDh5Q1pnWGVjK2RlTitHaXZV?=
 =?utf-8?B?anhDK1V2RXp3b1VacGFTbklxakZNRVFEb3hLeFh0b2dnb0t4SFFqbGMvaXhl?=
 =?utf-8?B?S3VwT280andtNDdMMnBrVGk5NjFkMjRYaVdxNXhua1lmYXBQZm9HbS9qZStI?=
 =?utf-8?B?VkU0SGlUcFhVelcrYnZxQThkU3FtUlhSbG1ranRBUXZURmc4VU5BWTJyZkFL?=
 =?utf-8?B?TnBORmM3R0lpeHBSSUk3TmJGZ0grVG5KK0gwM2ova0pjbUlrTUV3K0l5OEZD?=
 =?utf-8?B?MEJvd2NxMkgzTXNKRDNiNlVZcDlZaytkc0NpRURQRnE1aGN6SE5xVU05bW9n?=
 =?utf-8?B?RUdydEJ1RGZQZWtpNTdyTGRMN3dPQVNWVTJpUGt2OHR2UkdrWEk1TVM3bG41?=
 =?utf-8?B?cmd0b0VHbEhsSE9mNkZlcGZMTEhCT3BMaWFmMmZGS1dWMWlKTTkyMVFTQUN1?=
 =?utf-8?B?a2oyRWpWd1BDRnNweEpEcjViQUtSakJkNVQvY011a1QvTFJxYXRuL01KaGhh?=
 =?utf-8?B?cHpwUUV0N3NCYjdFUXFwN3dSSUlTWDlDZEdwZmx1ejUwSW45bnRQTWNJVGE5?=
 =?utf-8?B?YUdyQ21kWnB1TVNRSXFlR09qOFRMZU1Wd0RXaDd1WkI3c0pvYlR5Q1JVMFBO?=
 =?utf-8?B?YjNqaTYyeHpoWXl3eVhuNGppMlVZWFVHNWMyZ2thTU1WTEdyL2V3N0phc0Zi?=
 =?utf-8?B?akN1RlVJT3ZiRzBtUklOSHovWTNWQ0xRWmQvTjZBZ1VsMWtLQWRSdElzZnUx?=
 =?utf-8?B?Q2UwL3B5N0R1bTNqVzRLdE9KYmsxK3VuNTBtdEZvUFFWd2VBT2hXdWJEdnY1?=
 =?utf-8?B?M3BJUDh6eFBQZy90U3plb3NjclJ0NHNkd3VrdGpXekRFS1dWRjFJeDNnL0tQ?=
 =?utf-8?B?Unc1cG1XUXdtR2lmTnRXb25RcDV3L1hTS0puR2c2QmJVMTlwOVhQY0RoL2JT?=
 =?utf-8?B?ZmZVcWtNODRvem1PR0lkSzM2L0I3OWVGRVE4VGpic3hVZlBmYTdiaTc5TFFl?=
 =?utf-8?B?ZzlRV0ZWVFZpSmtyUkdNbGdGTS9KdmMxM3h1Z2hCUVdNaFpOWnhtTXVnTFVS?=
 =?utf-8?B?QXVjS0FkKzdxSWVXVXF1Y0FCOTlXUWF1LzNmUXMzOStNaFhjai9JMWF2MUJs?=
 =?utf-8?B?VVI0d1RkcmdpZEUwRE5MSzdLNSt5bWxjeTVqWEJON1NqNThPUUgwWWdJZXls?=
 =?utf-8?B?M3h4dElCOUp1NENza01VT096NWs1L2hxOG56MHgyNEUwWU8zK1dmQWI5WjVK?=
 =?utf-8?B?Sm5wUk9qLzd6ckM0M0w3QUpZNGRjR1ljQ1JKWlVpSzVZR1VsWXpoeDFvRTlM?=
 =?utf-8?B?MGxud3FidFFWQ3VldVoycm8wSmdpQVRYYzVOR2haVmVibzUxNVFzR3hObXdU?=
 =?utf-8?B?Q25qQjF3T01YWUVQYUtoUnBWN2F6Q1EwMGZ0OGZFUjd3Z1prNTJCY0lMZ2hv?=
 =?utf-8?B?VWkrTGU2SHBESnAyY0hqWnVGTkZ4eHNjdE5YaTNSSXAzSXhoaW83N2gzZWcw?=
 =?utf-8?B?QmNoUGJDWXlSUkRGSC9HZTJBczhZTVBrVXZmNFVxNkpRc2xPbllNSHBVL1Zv?=
 =?utf-8?B?NDBiQ2haOElXUmFSZmJzaVcveHdkSytYd1IxdTFyQ1VERkZFbSs2eDhySnVj?=
 =?utf-8?B?TDU1TEtKTkxhS0VHNncvV0d4M2FFWEtrZkpZcTV3c1JaVitzKzB1MFJzaHJR?=
 =?utf-8?B?S2NMV1VPUGtFd0VaWWFVU3BYUGVVMmhjM3lwamplYW5ERHlRbk9iY25DOEp1?=
 =?utf-8?B?N3J5aXRVWW1ERGs3d2JVSUJsWnc0dnJWZzRqZmFVbTRSZ2lqOSt1NUVsMGxR?=
 =?utf-8?B?ZXl5Qm9NTXFuc0NUWmR0MWZISGgvYUlVRVYveEZTeUR0UFNWcElBNGMvVDVE?=
 =?utf-8?Q?09OZz2T+qyq3U6MeGazdnIBoNiqLaxSMd0F79oyAlKZP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a11d72-cc86-4725-d560-08dd871fae45
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 13:13:49.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtELZn8YQ4ZJcJZBrhLv8v48RFl9DpYs/aQ0vF6mpjGGVKFJS18V1tvXH4ijZQF2LpKSN2pTzq77QV9bJBG4/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888
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

On Tue Apr 22, 2025 at 9:07 PM JST, Danilo Krummrich wrote:
> On Sun, Apr 20, 2025 at 09:19:42PM +0900, Alexandre Courbot wrote:
>> Add a timer that works with GPU time and provides the ability to wait on
>> a condition with a specific timeout.
>
> What can this timer do for us, what and HrTimer can't do for us?

It is local to the GPU, and the source of truth for all GPU-related
operations. Some pushbuffer commands can return timestamps that will
come from this timer and the driver must thus use it as well in
driver-related operations to make sure both are on the same table.

>
>>=20
>> The `Duration` Rust type is used to keep track is differences between
>> timestamps ; this will be replaced by the equivalent kernel type once it
>> lands.
>
> Fine for me -- can you please add a corresponding TODO and add it to your=
 list
> of follow-up patches?

Sure.

>
>> diff --git a/drivers/gpu/nova-core/timer.rs b/drivers/gpu/nova-core/time=
r.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8987352f4192bc9b4b2fc0fb=
5f2e8e62ff27be68
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/timer.rs
>> @@ -0,0 +1,133 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Nova Core Timer subdevice
>> +
>> +// To be removed when all code is used.
>> +#![allow(dead_code)]
>
> Please prefer 'expect'.

Ack.

>
>> +
>> +use core::fmt::Display;
>> +use core::ops::{Add, Sub};
>> +use core::time::Duration;
>> +
>> +use kernel::devres::Devres;
>> +use kernel::num::U64Ext;
>> +use kernel::prelude::*;
>> +
>> +use crate::driver::Bar0;
>> +use crate::regs;
>> +
>> +/// A timestamp with nanosecond granularity obtained from the GPU timer=
.
>> +///
>> +/// A timestamp can also be substracted to another in order to obtain a=
 [`Duration`].
>> +#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
>> +pub(crate) struct Timestamp(u64);
>> +
>> +impl Display for Timestamp {
>> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Resul=
t {
>> +        write!(f, "{}", self.0)
>> +    }
>> +}
>> +
>> +impl Add<Duration> for Timestamp {
>> +    type Output =3D Self;
>> +
>> +    fn add(mut self, rhs: Duration) -> Self::Output {
>> +        let mut nanos =3D rhs.as_nanos();
>> +        while nanos > u64::MAX as u128 {
>> +            self.0 =3D self.0.wrapping_add(nanos as u64);
>> +            nanos -=3D u64::MAX as u128;
>> +        }
>> +
>> +        Timestamp(self.0.wrapping_add(nanos as u64))
>> +    }
>> +}
>> +
>> +impl Sub for Timestamp {
>> +    type Output =3D Duration;
>> +
>> +    fn sub(self, rhs: Self) -> Self::Output {
>> +        Duration::from_nanos(self.0.wrapping_sub(rhs.0))
>> +    }
>> +}
>> +
>> +pub(crate) struct Timer {}
>> +
>> +impl Timer {
>> +    pub(crate) fn new() -> Self {
>> +        Self {}
>> +    }
>> +
>> +    /// Read the current timer timestamp.
>> +    pub(crate) fn read(&self, bar: &Bar0) -> Timestamp {
>> +        loop {
>> +            let hi =3D regs::PtimerTime1::read(bar);
>> +            let lo =3D regs::PtimerTime0::read(bar);
>> +
>> +            if hi.hi() =3D=3D regs::PtimerTime1::read(bar).hi() {
>> +                return Timestamp(u64::from_u32s(hi.hi(), lo.lo()));
>> +            }
>
> So, if hi did not change since we've read both hi and lo, we can trust bo=
th
> values. Probably worth to add a brief comment.
>
> Additionally, we may want to add that if we get unlucky, it takes around =
4s to
> get unlucky again, even though that's rather obvious.

Added a comment. The odds of being unlucky are infinitesimal and the
consequences (an extra pass of this loop) inconsequential, thankfully.

>
>> +        }
>> +    }
>> +
>> +    #[allow(dead_code)]
>> +    pub(crate) fn time(bar: &Bar0, time: u64) {
>> +        regs::PtimerTime1::default()
>> +            .set_hi(time.upper_32_bits())
>> +            .write(bar);
>> +        regs::PtimerTime0::default()
>> +            .set_lo(time.lower_32_bits())
>> +            .write(bar);
>> +    }
>> +
>> +    /// Wait until `cond` is true or `timeout` elapsed, based on GPU ti=
me.
>> +    ///
>> +    /// When `cond` evaluates to `Some`, its return value is returned.
>> +    ///
>> +    /// `Err(ETIMEDOUT)` is returned if `timeout` has been reached with=
out `cond` evaluating to
>> +    /// `Some`, or if the timer device is stuck for some reason.
>> +    pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(
>> +        &self,
>> +        bar: &Devres<Bar0>,
>> +        timeout: Duration,
>> +        cond: F,
>> +    ) -> Result<R> {
>> +        // Number of consecutive time reads after which we consider the=
 timer frozen if it hasn't
>> +        // moved forward.
>> +        const MAX_STALLED_READS: usize =3D 16;
>
> Huh! Can't we trust the timer hardware? Probably one reason more to use H=
rTimer?

No, to be clear I don't expect this to ever happen in real life, but I
also don't want to leave a loop without an exit condition.

OpenRM and Nouveau are both using it so I believe it can be trusted. :)

