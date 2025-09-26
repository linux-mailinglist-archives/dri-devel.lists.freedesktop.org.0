Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698BFBA2335
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 04:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A60710E2F1;
	Fri, 26 Sep 2025 02:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hJDKeG61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010055.outbound.protection.outlook.com [52.101.56.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D88710E2F1;
 Fri, 26 Sep 2025 02:21:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehqRZDpWVqHIcoAId3EqbV9WiUcZtA7j/lXKhgCaiwjXxteKr0Uj1JoZg4RDeD3RspgqJrejnnDl1yh1Ia+54DutTeG+bUTwF5dBQcVFlz2M+11cVYEMoJzN9ClBLR8DEsOUgFwObiZcXidz8ugJ/m1mFWEGX4zpmitMBcpbDPKhG+mfwQoxboQv7/m9I42ZiEth2Uiklxd3P+7jQSrqJn0txSlfmPaM3rFItvmCf+zD1Pn2CHy0/V6kDVkQQo265u1snbbFIgMLbglZBX2Jgx8cfTQWSB89xMljGvrr7tFvlb7pfg7ckBOoov6F0Yxn3U5dN/oRd73PIXGCvBJPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9oQ6/A/LvdWCQ+zL/0JKfQLgpzYxXBTqNWDyPf5nAA=;
 b=ki+ONK5gp3vBNppIsW/f9bscTO52kAcT1SimIhUItBFc5CuGMoVCnjbhCO/Fi6aQMkR/sELLiQy5whccbF9MOzlYM6pbkGFR85ToklEyucYdcJMIE661usEq2HFVPukxppnOPVA0WgoIsmtz9tkVHTWW+M05WYodzuuNsGoRK3Sl/34wDooXRvZ/PjfPOHZx/u/iTBgPN6b+p4bh55ODhQLsqySXUhuLz8TZuN6cBtWEVtuhQ9cxUA3XPe99+PhnN4bOsfiGRct6vyZga2KBcLiHxkucuzdlIcEP8NsqQhlNLRj+L740UR03FROjPXN0p+8YgM85LBANj0HjYBK7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9oQ6/A/LvdWCQ+zL/0JKfQLgpzYxXBTqNWDyPf5nAA=;
 b=hJDKeG61k14gEqonXUFvOouRbTeCtB6GF18QIL9UhxhXNISt5TRv8gwsk+Loi3WR4C0rf6DVeNSyJgVoVDYiPOA8o/mulNvS9i6eowpic88Fq0m4/eZLnpyC5NncUCwGElOs/7SIfMQ7etvuAoP6sQDfDhlFQ55T4DIFrcXP9ghSHoJngHC6LZ1+wUT3sqW0eyUgV5a1UEYUfZSlrd1NQYjZcVudaepMBtjZJuUBoJ6+pSsmsnKyNiHiidRzfZdnwFXzl+XG1fDTiLXiUwOiEB92nLmb0bYEczDfId2pn6VE8uhATF/0A324Z82dgi8Ox6SvAIoNBZw7Hykhy0mIag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6097.namprd12.prod.outlook.com (2603:10b6:a03:488::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 02:20:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 02:20:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 11:20:25 +0900
Message-Id: <DD2DFKZTFIGS.2HDVZRV6WGXHG@nvidia.com>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <e95c59cc72145c05380d0d81d767c6ce97fbbf0a.camel@redhat.com>
 <fiwv6movnoliptvjdlxzx4rggv5a7mid4zyvmqowvw6kt5auhh@r4dmizzmykwv>
In-Reply-To: <fiwv6movnoliptvjdlxzx4rggv5a7mid4zyvmqowvw6kt5auhh@r4dmizzmykwv>
X-ClientProxiedBy: TYCP286CA0098.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: a04f66a5-254c-40fd-f601-08ddfca34275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWJDd1ZEYW5ZTUZZTDlpT2VKTnBlT0RxRkY2aHMybEdtWkxKZmJzbWp2cXlG?=
 =?utf-8?B?WUhlcnpnS0w1dDNHeGFjVk9Hb3JMMXRSTjY2b1FmeEhxRHJGbEFrVkxBdDFj?=
 =?utf-8?B?dUlXNE5EUytGbnRDM2hhT0xLN0NNOTMyenVrWU05NEtkRDE2SnpWcXdReVY1?=
 =?utf-8?B?L0JhRmoya243OCtvbDFPV2NxUVpmS2ZSVlQrMi9YcXRVRGZLeDRvNE9xRnhp?=
 =?utf-8?B?RjF0c2xFTUlPaDk2VGx5ejExZ3NuL2Vzd3c4K2YxMXJrc0xPN0x0MW5NaTB0?=
 =?utf-8?B?Y3JFQ2RrQ0pEdmlnNTVGaXVINlFGVkF0WnEzc3RWMHFGcUJqMXRybWJHSmpz?=
 =?utf-8?B?SjJhTi83WHdCM1laVVVtMVdRRU5xVkhHMHVLWmFzaFhKVUhMZ05LaEhnWm1Y?=
 =?utf-8?B?bXRzN2VDNGhiVmhwMGs0TTBIZFFwS08zbUtoYU12T2c4N1FmR3FETHF1N0ZJ?=
 =?utf-8?B?WWZYN0lFR1BBUjV0a0QwOG1tVFF5bjNubzFnVldlS2Rra0Vtd01pTk42MG1j?=
 =?utf-8?B?WnhseHZlVGhiM2xXZGR4OEMzVjk0OURKT2FwdStaT0dJNjdKanZtZzlFTDFO?=
 =?utf-8?B?TklhWVlWTElyQ3NJbE5GUllYMkdLUVh1ZzlGVUdzT3orWS9taFVqeHNndzB2?=
 =?utf-8?B?a0ZUS3gyVGVQY2U2Y1Ywd2dYVFBNVkFraDRZM3VyL0hITi9qTFRxK0RXL3Ra?=
 =?utf-8?B?WmkydEFqSDhXUngwdnF6b0YwcGdTTTNVZjgzU2F3VWJCSUx6S2VJOGZrcHJq?=
 =?utf-8?B?c0crODBUbVd4NDlqUVdPVWRHNGNPUDRCdXdiT2VwdmhieEVidjMrUTNNY3p0?=
 =?utf-8?B?Z3kyNDdjWmJ2TG9RL0hmZi93N2JSSXhZR0w5QkQ0WGk0RUVmN2U4ZmVrUlRl?=
 =?utf-8?B?V2tjQS9kcmFMNjZRb1hqKzRaMTBKb1hzcVZNVjhsVTB2bkNFOXVYYi9yTnJN?=
 =?utf-8?B?VU1lK3BZRmZ4cTZxd1FYZFlISXNnZmVnaTViUWdBOFVsRjU2S3BGdzN0NUJL?=
 =?utf-8?B?V080NnZldVkwZFdiVzZ3aHRUd08wQWM3MGhkL2NSYmMwemdXbGVkRDB6SjVM?=
 =?utf-8?B?QmtTam1BZ0dEb1hrd0lTM3BzT0FsSmd5cnlZalU5NzAwZW9HYXdVeVJqaVF0?=
 =?utf-8?B?amp0aklKS0JoeUx5VURDWE14UGVJMGNGR0RKOXkwL2xCYWg0R3ZncFN3VWgz?=
 =?utf-8?B?anI2TzB6a3Q5MEhDdzBsMUMxeWxmVnBGRHFIb20zdStNSGRoWGxTeUp1c0Nx?=
 =?utf-8?B?U3RFa1ZaR3NrNjMyRDI3eUNZNDlsYnd0WU9CM01ZWjBsMGtxajBxSSsyZVZh?=
 =?utf-8?B?VmZ4b0JOVjl0REg3cE1wSUZ0SFBILys3VEptWGJYKzhxQWl5Um5udXhBQUl6?=
 =?utf-8?B?ZDN1ckVHemNJaURVenBVRjIxcUZMYlVaSFNEWHFoZ3dQOGpLd04wdEJ4aDBN?=
 =?utf-8?B?U2QxQVBwU0ZkREVIc3AxcDJUUTYxRVlRc0VWcTFSZ3E1Y2dZMjZzeHZOMGY1?=
 =?utf-8?B?RS9mZWN6TzA4NW5aR0JKVFFpZTNlb280WjlxNHpibndLRWVZdDZOKy9qTitP?=
 =?utf-8?B?WkFweFhwelpRMUQ3dkhXNnkwOGMxcWxZZFdHTjJhVlBkTUVpVmthZWlVMTEv?=
 =?utf-8?B?MFEvZnhxSW1RZmx0NzFEZEtORmJ0L0NITU5WNFArUExoQVBlOGVSd3ZyNEpM?=
 =?utf-8?B?QWMreXJ5aHJVaUo5REluVGxBckl4Ym43Mk56a3MwUUQxSEljbzI5cE9rK1hR?=
 =?utf-8?B?ZmFaVmJJaGpWNmMrSTM2RHJsWklVU0hiSEdjQkwyNFVLNFBRbDlwNXpJTkR3?=
 =?utf-8?B?YXQ1Y1ArWTFJdmdTOUNoQnBPbTJRVFBxc3VTVVpnUlk3ZDVabU9LYlJKVFZC?=
 =?utf-8?B?WjNzdzhEcUxNeGNidVF2RXRucE10cWdRQlU5dHVDMm5kcG54eWp3WDNsWmJ0?=
 =?utf-8?Q?eSEZOXQyerc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1VXK0ZxMWhxbmNaN0J5b3ZCNFlzOUJkOEpRVWZiaGpvalVUd1FqbmtRZ0tm?=
 =?utf-8?B?M3hXeTVqNCtoK1VzYnhzTitqNWFjeEM0Y05jcWFuVjFWdXFCbzQ0ZWRPa2tG?=
 =?utf-8?B?Slk5Z3hMaDFYeEtJTTB1WDBMNVhXZjJUckNsUk5yNXVwazh5UzcwWi9pWi93?=
 =?utf-8?B?ejJLMGJGV3Joayt0c0xOcDgzNGRiM21oL0YvdEFZdU1ucDhPc0ZKd2lZMnlk?=
 =?utf-8?B?dmlXSnFURm9FandwL1R5bGdIaWplOWpodjBNVnZ5eFF2cFFQck9MU1oxRHhN?=
 =?utf-8?B?dlFxZWkvOWFKT0NUVzJKMUJSa2xLQTFwcVM1bmg4eXdUV1M3bldteURrb25m?=
 =?utf-8?B?czhTUk5qSG1mcVp4d0NzRUkvOTZSVVZKV3UyN2hFQWl2M0VXVEVrZ1czS1RO?=
 =?utf-8?B?NlRxNWgzdVQ5MWhOUFBtRjBrZTh2b1d0SXJPZmcrYkduRHh0ZWRxKzRVTGRh?=
 =?utf-8?B?TnI3SzRmamNkQmZsZFhxc3dGeXM3bk1CRzBlb1hzUlJQSk1SUXJkZ2pDRnVT?=
 =?utf-8?B?UUFNMkZOSVVyY0RJK0tKWXJ4MXBqMGJOS0tsQzQ0MW1wV3h4RDhMQUNTbnI2?=
 =?utf-8?B?UGs3Z0p6OHA1allnb0ZqUFJSa2VuMjlQRzFML1pUNjg0Y2RacTdUUE9IWXlX?=
 =?utf-8?B?SE1XQ25JYjRobFB3cEZPNmdpUSs3RzJiT1lYZ1N1OWkyUTVUb2RiRXd1aXB2?=
 =?utf-8?B?N0lBeWZlVWJqZmQrb3oxbVFPekpVYVB2VW03enNSRW9NNG1sbXhVM21qNGJR?=
 =?utf-8?B?WkwyL2hOb0FlMHM1V0pnS2hqYjUyVTIxLzBSMEd0ZldTK2JXUjJ6TTE4NDBD?=
 =?utf-8?B?dzNDZy83bER6UWFPN1Q5OEIrYjNPaXFvVE5oNkVoUy9zQW9lYzNrU2xMVENr?=
 =?utf-8?B?N0txVktBblAyR3FzVVF3a3ZxSXJMeGJtUXoyMVdZZHFSWDljZVBiL1NubEZ1?=
 =?utf-8?B?cjFCSTN1RkhjejBCc0ZvdHR2RHJjSkJ5WTE5eTlpZ0t0SStNdjBmMXorRWhN?=
 =?utf-8?B?NVg4WUlSUGlrZTMyTmNtUG9BV296MFdsQThWc3A0S1h5dSswd3R3Y0s0WW9H?=
 =?utf-8?B?K09ReGM4cEt4NGFGOEhkeGJBZ2FGZUl0Y3FJdE10akcxODZGWmlyK0xreWdn?=
 =?utf-8?B?RW1TdTlFZVBabU9TZVluUnB3TnR4ZW93OXloTjNrQkQwTmxHMzc4M2RGWlVj?=
 =?utf-8?B?ZkFhK01hRE4rZU52YlJrWk1FdVlxUWovenJRME01Y0h2VHFtTk9qODZIejdx?=
 =?utf-8?B?WTQxZmpwaHBva3NxVXBoUmMrc2I0UFo0L2c4Z1N2aWJUVVhiM3lXME9aaWsz?=
 =?utf-8?B?VDRwazNVRWNiSHQwUlVSWjhyZVp4RkdXQjZIbEFJdEtSQ1pmSWs3bmVYVVZS?=
 =?utf-8?B?QU1jZjBxYmNDV0tvdEJMckVBNFNEcHg1d2VPMWV3Y1J2YjNPU1hJZ3N5dkUv?=
 =?utf-8?B?eDZ6N3RvdzB2K0VKODYxQlNnR2k0S1M5N0hZc21CdDUwRlk5QkN1SlBIdXpk?=
 =?utf-8?B?bHZ4d2QxaFdNdis5T3ZTbVlIZE1NRzN2ZHpNQ0YrQmliaVo5Y1JYYjhnT29R?=
 =?utf-8?B?dkRDWEtQYm1va0hmSk5uejNOc2V4UFJTVmRLclg1WCttcEpZQlVWelhVeHUy?=
 =?utf-8?B?UEp4TUdsYzhVNVVHVXNXUERxOERnNjQ5YUE2dGZSTk9UbkhBeTkxanoraHdn?=
 =?utf-8?B?K2Q4MzNvd2FqOGd3V2I0ZVh0NkRrdHFhUEg2a2s1NkNYcm5VdStPdjZIem12?=
 =?utf-8?B?ZGhydWpYMk5vUXBEZlBtTUR6VmdsUkdmWDlJR28vZ2NmdkpjSjBkN1F4bjR1?=
 =?utf-8?B?cndvTlc0bmc2SFZ3aHpoTEw2b3dHS3p3eUFsd056OEtzOHpmMVlBVzgyaER6?=
 =?utf-8?B?bDdNak5uZUZjV3VvRmV5WHRIKzdVMXlVT2cvaklCOCs4TjgrNGtRT2JOcnBG?=
 =?utf-8?B?STBsb3E1U0ljTEJjMGdEcnpnNEJOVWdDQ1o2KzdYVDBkdE9ZbTJaNmF5MFFs?=
 =?utf-8?B?WU1DVlRUa0dtdlZJbWJQcWNEYW0yVHFRNmYxbWVGVjJiM2lTQWEzRXdOaWsx?=
 =?utf-8?B?YmYySzdITUowK1E4ekM3aXFOT0dLVUdnR2tZcUFVdDZOWTJWeHI2aTB4RWY3?=
 =?utf-8?B?YThIL1JUU2JsVm52cmNyL0ZWcHh6cFpVeEJpdjFiTmN0L1pZeDBLQXRpTGdm?=
 =?utf-8?Q?VhKWTKdEaU0vZe69/zvvIaqWGUJzmM4fzXCny+1jZKqu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04f66a5-254c-40fd-f601-08ddfca34275
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 02:20:28.3059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mywAdVxkqnJPXBqWLE9QfQ0r5uasedS1tIAlqNkWpW6LemkG2pAy3joorYMhXUpQWt5Pdf8KFqQ2cFomvENGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6097
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

On Thu Sep 25, 2025 at 3:32 PM JST, Alistair Popple wrote:
<snip>
>> > +    #[expect(unused)]
>> > +    pub(crate) fn receive_msg_from_gsp<M: GspMessageFromGsp, R>(
>> > +        &mut self,
>> > +        timeout: Delta,
>> > +        init: impl FnOnce(&M, SBuffer<core::array::IntoIter<&[u8], 2>=
>) -> Result<R>,
>> > +    ) -> Result<R> {
>> > +        let (driver_area, msg_header, slice_1) =3D wait_on(timeout, |=
| {
>> > +            let driver_area =3D self.gsp_mem.driver_read_area();
>> > +            // TODO: find an alternative to as_flattened()
>> > +            #[allow(clippy::incompatible_msrv)]
>> > +            let (msg_header_slice, slice_1) =3D driver_area
>> > +                .0
>> > +                .as_flattened()
>> > +                .split_at(size_of::<GspMsgElement>());
>> > +
>> > +            // Can't fail because msg_slice will always be
>> > +            // size_of::<GspMsgElement>() bytes long by the above spl=
it.
>> > +            let msg_header =3D GspMsgElement::from_bytes(msg_header_s=
lice).unwrap();
>>=20
>> Any reason we're not just using unwrap_unchecked() here then?
>
> Because whilst my assertions about the code are currently correct if it e=
ver
> changes I figured it would be better to explicitly panic than end up with
> undefined behaviour. Is there some other advantage to using unwrap_unchec=
ked()?
> I can't imagine there'd be much of a performance difference.

Here I think we should just use the `?` operator. The function already
returns a `Result` so it would fit.

I'd be willing to consider unwrapping is this can prevent an
obviously-unfallible method from having to return a `Result` - but here
this is not the case, and handling the error doesn't cost us more
than the `unwrap`, so let's do that.

<snip>
>> > +impl GspRpcHeader {
>> > +    pub(crate) fn new(cmd_size: u32, function: u32) -> Self {
>> > +        Self {
>> > +            // TODO: magic number
>> > +            header_version: 0x03000000,
>> > +            signature: bindings::NV_VGPU_MSG_SIGNATURE_VALID,
>> > +            function,
>> > +            // TODO: overflow check?
>> > +            length: size_of::<Self>() as u32 + cmd_size,
>>=20
>> (just curious, do you mean overflow as in arith overflow or overflow as =
in
>> going past the boundaries of the header?)
>
> Actually this snuck in from some of Alex's suggested code improvements (I=
 had
> intended to credit him in the commit message! Will fix that) so maybe he =
can
> answer what he had in mind? I assumed arith overflow but maybe he meant r=
ing
> buffer overflow or something.

I was thinking about arithmetic overflow, but maybe that was just
overthinking. :) We're probably not going to send a 4 GB payload anytime
soon...

