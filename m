Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC9C10567
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 19:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4646310E180;
	Mon, 27 Oct 2025 18:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mieIdoGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF3310E180;
 Mon, 27 Oct 2025 18:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhlXBu8BKuur5mtl9eYE5+y94Nm0o7ZA52/b3yPE7iuGq+1HVhipmqz36zPv695W1W8pPYSB5HM6n1aljCqQ5OeqHmS9kPyL/gN88YaUABzLAr6cFFPIEpBnAor+6TchSlYxG+HRi0sBAWftGVm+P5HfZynueHMwOKRzlS9OY8NWZdS9jFUYJDfnmMBEu6P55kH4adrMSFbSGxqiVtLfi8nzsT1ECMGU72BRZ3t+KHD/fViyRF54lIFU0RJtIgFk6SM2Bl01x+AsxmuyUvw7VSHOTiwOqJqVvrB+FDpa2hkLtn8PIs/SLTaKhSYc+wsj5qOlAiE7ho/OObjNuTQLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRmKLi4SzSBdHz1/xqwtji3/tA+N/ZzOGH5FOwz8hwY=;
 b=J23ubHdVfaNZsTF6cjh0w6IY22umGpnt/oKpeNDBzf5M7vEIRRyUWt+uBpzVCElebQevfxXslPVK/f6i6ezFIXToaneQ5XjiHDb28tJ0Kn8Y+6KeC8DOBuLhwxWPfXuGdXq8+ptUFadLIjNnVPhq9p5Ask5ve1vmOKR65w1vAYNjsaMRIAOMoGjzHAYNMLntHnVUPXByj7XvfoLcfLToQP3akvYmxJesbe6bdtxgAVkhHwWHS81BJ2eg0FEwBBCXEDxnORTiIQF6r6KEIrOW9/vcoWEFl6eXx2LWYviNLCEKeXaSapwKeeKHL4obDQ4+tW5Yy6IF30pe9Dby1wOHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRmKLi4SzSBdHz1/xqwtji3/tA+N/ZzOGH5FOwz8hwY=;
 b=mieIdoGYhCa6FwCVGN2OuKALa3W7T79zmMvYWKPPBkc0niSEzKXgHrWsEHA8r+46xzr1lG2hSXg3xvgS8m5Ap9WfCUmHunv1QjqWGexpkYkUdbxEpB3JIo5zqu+JUT9E6hmMeWn2ISqj6/xOR2VHoI1C3fKs3jHzukocayjM196Ss/B6vbFv/AuKttd03TINhnsi5t3L576k2dbTKeRw1nrT04eHHadIEyU+ol8jT3SZaN9kr4gE7jfUAf50jn/d+eMP9jgcxyKMHr87NY6pabFxIeDgCTD5mXLxULY3sG0lChl4EBoUeV/j1V4FL+7ojWPPKjmYhspX2Mx76BCsDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV5PR12MB9802.namprd12.prod.outlook.com (2603:10b6:408:2f8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:58:31 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Mon, 27 Oct 2025
 18:58:30 +0000
Message-ID: <e4bc295c-903f-4560-a1c4-314729fe5f5f@nvidia.com>
Date: Mon, 27 Oct 2025 14:58:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
To: John Hubbard <jhubbard@nvidia.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
 <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
 <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV5PR12MB9802:EE_
X-MS-Office365-Filtering-Correlation-Id: 5600745f-8b1c-4083-6e80-08de158ad204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWY1dWp0UWtkejhVWVo3Z0JQNEFtcHptckIzMlUwZmFDVy9hbmk4U3g3cWc2?=
 =?utf-8?B?ZmdVdmtvZTIrTmVWVEdyVUxwQXNHVTUyV2ErSFE5L1B3R0xlanErNG1yUTZF?=
 =?utf-8?B?Qm5HT0NjZDdaZ25vVURyWkhPaG1nTGRPcDd2MkVQYTZ1U2hCWFB4R0JFaHZK?=
 =?utf-8?B?ak1yMStLYWo3U2Uwb3VzSVZHOGtrSnlmbmZLa080TGRXemhjb3NWMHp3SFhx?=
 =?utf-8?B?b212S0lrZ1JqMytvK1JuMFRFUm9wVk5xZFg4d3d4SWdGMGdQYjNTV25OVnFa?=
 =?utf-8?B?N3d5a3ZJQXNxc2ppRjhqZ0xNUHR5OXY0VEpxU3BqWkliNVdNenkwVUFYaEZr?=
 =?utf-8?B?blVvZWloZGovQWpYWjNYb3VtOGU2SEQ1WHRjOXE0ckFyVGM1eTljOU1iQXA2?=
 =?utf-8?B?SDkrcTR0VERUQ1E0bXdQdU42QUJVY292K0s5V3BaY1lxaGhDRGJwUkt0OVZI?=
 =?utf-8?B?MmVmUEZVdDNldGdNK0kwZ2puZDN5SW43UVlRUDZ2S1p4ZjFiSWF2OHo4Qkkx?=
 =?utf-8?B?Y2Z2cC9ORjhtVlZ6b08vZE9wZWFjQTVnNk5mb3gvdmRldmdVS2ZML2UxTTUw?=
 =?utf-8?B?Rks3S2RjK1VxWnBicWFyMERlMXZPQnFkYnNVeGhLRFZLOTlpcjhMZDBOUm4z?=
 =?utf-8?B?MVp3V1JYQkkxWE54MDR1QVBMN1JCYkdoY2p6ODJLOHNKbHJMR3RPWWpMMlJz?=
 =?utf-8?B?T3FkNnZHY0k4V3hWM21hOVZSejRoUzF0dnl6N0I3dW1nOWdXNDZwUkVaa3Bk?=
 =?utf-8?B?MjV4UC9zNTZ6ZzJ4OEZlMW1RUERUVk1KUnhRVDg3Z1M4aURxRlg4UTBVSlpE?=
 =?utf-8?B?MzNyejllZ0phSitsV1U3cTVzRXJGanJETW9GcUppMFVhOC9XQzlYWXV2enNI?=
 =?utf-8?B?bTl3bjFkcU05YmNCa1gvblNCM0FDbCtWY1dHWUpIRmZDVmN2QlFFTi9NSGpQ?=
 =?utf-8?B?M1dHWnBLUzJUMGNXb3ZKU0pXZ3c0VnVOcFNtNXJqZ1dFSFU4UjVzRW5NUExq?=
 =?utf-8?B?Y0JzY1E3bnk5N3JCV0wycUV6bDBkL3NGSGhuRkZ0RXd2Q1h1Uk9SL2ViSjJj?=
 =?utf-8?B?VGhLNzgzQXFMZlhuM3hJcEhuL01jMzZuTFNiWnpKWnJuQ1dtQ3FNVVU0bUlQ?=
 =?utf-8?B?c1lnc3lHeGJBamVTbzBBZmdIMzVBckJudjVydW13RlFFN2Q5S2VEWlphc2xJ?=
 =?utf-8?B?MVl4cWl1cUdrV2NnSitHNXJWa1BBMjFsd0dpZkhyZy9zb3IzUnZPZkRzYXA4?=
 =?utf-8?B?TkZnT3FDeWNiTk8wNXMzWHdnVE51OEo4b1BmTCtTS2prbFhzS1dXeDAxOUlp?=
 =?utf-8?B?NExzclc1RTMyMmFaSFF5MkNJS2FnbFBwVTdJR0tSbUpQbldXME50T3hTdWQy?=
 =?utf-8?B?Vzh4cWt6Q3hwcDE0cVhQUDNMM3IvMDM4OUZldHVsTktuNjZXcjhhdkwvVnNa?=
 =?utf-8?B?Ky9HeFJ3R0t2a1dIUnh1OGhDSTFHM3gyS2hjaWpnVTJLREtFdFJIc2lCMVNS?=
 =?utf-8?B?L3dzN1ZDdDZtMmxrZ2VCME5COWw1OWJhSUw2YmFsQ0ZGYko1WDBDMS9uazNP?=
 =?utf-8?B?R1hZMU9KMWdad3ROL0hXYjgrUHQwTmg2Rm1HdDV0V0VtL2dYbGRub25kcVZs?=
 =?utf-8?B?UWc1ckxFMjJteEc2MmxKR3M4NU1LUmVXaE8zZTlvZVhCaG8xN3Q2VjFCODlj?=
 =?utf-8?B?a3VoN3A0di9HYVJVa0FoYkp6bVorWUN5RzhvYnF3cjNmWHV4blB3Zk5TekxN?=
 =?utf-8?B?bTNIbXRabjZ3amQveC9Cek9CSjlJdkpNSXd1WnhjNWZvaFJ1WGhwRlRxZE94?=
 =?utf-8?B?WE9tTjEyUEt3Z1o5L2R3NG9UUnoyUVUvbjhZMVlJelpBcXhleWY3SitiUllJ?=
 =?utf-8?B?R001T0lSNGJiOE5hN1NNLzhUNEhSSmo4QitCd1VRNlNzVWNsYjY4UVgyVTht?=
 =?utf-8?Q?1iaU4xcOAhZlgvU6pDgNGW4RpE4X0ZKv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtwM3ZPd0Q0V0hnL0ZXbURnVjJxM0p6cVJpZ0dITEU1cm1oTVBFVkVocHUy?=
 =?utf-8?B?Q0tkVGRrSUhMNFpUVEc4ZHlZQVJpeUpuUW5vOTVpaFRvVUtVZHdRb1c2U0NL?=
 =?utf-8?B?T29ySDE4emtDNUE5Y0FxaCs0Q2ZOUmhQQ1YzeGxnV092YW9aNHVQRGhCT2hZ?=
 =?utf-8?B?Tm1UMVgwZWdBVU1uUjAwcFIzQ1NoZWFxQThFcnBMcjN3NmI5bU9SOGFoSm5x?=
 =?utf-8?B?eFVsM3hCNTFjVXBKdEFiUjFrNHFJQmgyT2NGalhVSDNsejA3S3NQSS9sbnVF?=
 =?utf-8?B?OGZCaUtYRlEzRHJ0YWRoMkR1RGFETCtDWWpTZmxPN2R6Tk5mbXZzdTVqcSt2?=
 =?utf-8?B?b2s1czhKaTYzRE1RZGFWOHF4SGc4aW9EdnpzOGxSME9lWGxmM2c2NnpwREIv?=
 =?utf-8?B?MElsZWo5czBPVjNKUGJZWEpHYnVpVW1DMEhCNlhCZDg0MWhiZkdpb3labURC?=
 =?utf-8?B?VXU2M2lnS0RYK2x6RFpTSFk2b0crWHJSV3pZWDAyUW5MSW16Q2l0d0lLamVT?=
 =?utf-8?B?ZDFYMWpNeCtEVCtRUElMSWxXa0pIOEduNGlKZDBRaDNLalpzT1FrSVNNODdG?=
 =?utf-8?B?ZlRINUdXUHhMNlpscjluVlBLeml1KzZHTzZ5bVNaUjlmSHRVSGpkMG5hVDZG?=
 =?utf-8?B?Ym5yem9YRVZsZjFMM3dFRkxFS3BuWkUwcVFTRGtPM0ZEdEJ1VnZYTzFKOXpw?=
 =?utf-8?B?S240QnpGTFdvOXlYM0JLSEVxNkoyaFQ5cXVBZ0VKNlY0NHhpenM1QzdkZnk1?=
 =?utf-8?B?eUE0d3Jpa0lYQ1V3MU9QV2JjVEVibGxKZDl4Z1lxd0hvSWJ1dStVVlorRG00?=
 =?utf-8?B?cXJocGxrMEJnL0VNUVpBN2ZkWm8rQTRwZWovM3JpOENqTzc1UFUyY3A1bkhH?=
 =?utf-8?B?WnFtVVNQN2R1cnNwc1ZXOUNQRUtDbUZRb21NNHZSbFZWLyt0ZjJOTG4yN1FM?=
 =?utf-8?B?Nzd1SHg1NlN4TVkwZExXZndGK3Y4Rk9ZTU9DeW9JVjFOMmJ1QXM1NENaUnEw?=
 =?utf-8?B?c2ZXRXk4R21LQVA2QnhsdmtSQTY1d1Nha2tYcTZNSkhJVVZUYUxId3dwRDV5?=
 =?utf-8?B?K3dJa1VZR3V1RjZDZnZlT2dXWHVKNThXSWEwVnYwOHNaWUtsMk9IR0VVZUt6?=
 =?utf-8?B?NFNvSmVJRkRkRHRvSyswaVN1Z0Z1c0RJVzk1MzlOMWRucmYxTEoyMkFPNElP?=
 =?utf-8?B?am5FK2hJQ3U5R3JONHZZM3B0NlZUbzFaa01VcFpHUWpVNHpWc2xFcjA1THRT?=
 =?utf-8?B?RHl2MkZtbEJtVWM0Nmxsa0o0U1hYQ3lqalhzQmNnd1dsL3lsV1hqZmZXd0E5?=
 =?utf-8?B?Tmo4V3RnMTdPK1dlR01lSUdoZnhNeEw0MDBldis2NzNBMDludmNJanRWRkc2?=
 =?utf-8?B?MDltSEtpN3RtaG1EenUwQTQzNnBEVDZQMks5ZW9LK3VRR0lvaEtySDJlYngv?=
 =?utf-8?B?cEl5UUptd0doV3dwYTZQV0IycksrcktTN3FjODV2Y0ZjUmNHWVF0V09FV3ht?=
 =?utf-8?B?MUpkTGgrQlJKbTNNNUx6QWgzM2xETTFCKzEwZ0RUY2M5T05kN3pBUUZnOHlW?=
 =?utf-8?B?WDdVT24xTm81aFZ6Wi9yWFJLWnBRNzlMcU1ka05wbFAwUG9QSWtHanFVUUhR?=
 =?utf-8?B?SHBZMVNVQ0xGbGllc3NCeXVYcjJJeXczbXRaT2gydXcxbVJ3alA2K2djUU9p?=
 =?utf-8?B?cWRicFN4cVVLRklrQlVKS2hLelJDV1NOY0xtWGhXMzlueVd6ODVPRXlJUUtV?=
 =?utf-8?B?dmhPTEVUbi9kNy9hZEczOWhRL1c2WE5uNGdBQTlqWWI2ekFudENXclhNb1BQ?=
 =?utf-8?B?UWJDSXlTSm9kdVBQSWhvZFV3MzYrYmZIU3hSSU9ybldEN3BmQWhBLzREdFhC?=
 =?utf-8?B?cnZYU29aSTdvSFpNNlhDRi9rZHFHaysreWlPbmM2enVGTnQ2ckd2b1dsY0Jj?=
 =?utf-8?B?SHhrRTNFQVhCZGhYREZ0ZC93OUhhQ1BKUDlzaXh1bUVsZlF0a0hRZWhjVVVR?=
 =?utf-8?B?RzVSWDJjMFVBNld2a1FEdm56Yk90ZW90UEM5M3JFc05tV3pUdUNsVzB4b21t?=
 =?utf-8?B?QlBDamNuSE5oN0VONDF3R3JCVU1uT1VCQXo3TW44NXFRWHlDVkxzTVJYd0dr?=
 =?utf-8?Q?rjrtZiZwlxtVQYrigw4uNuwV5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5600745f-8b1c-4083-6e80-08de158ad204
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:58:30.8365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UO4RbgeguevIcboQQSBayNeRuYAXwJxjoaU2a3/56Dj8txFX5Z0ckSAPnqAjje2qwRKWg79qj0h7TLtWNJKJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9802
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



On 10/27/2025 2:46 PM, John Hubbard wrote:
> On 10/26/25 9:44 AM, Miguel Ojeda wrote:
>> On Sun, Oct 26, 2025 at 3:40 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
> ...
> 
>> Regarding the `.into_as()` name, it makes sense, but it can be a bit
>> surprising when reading out of context... The standalone functions are
>> super clear, in comparison. But I am not sure what could be better.
>> `into_in_this_arch()` or similar could emphasize that this will only
>> work in certain architectures, i.e. it is "an `into()` for this arch"
>> rather than the general one.
>> That would go well with the idea that you didn't implement it for
>> other obvious types, which I guess was to avoid developers using this
>> instead of `into()` by mistake, right?
>>
> 
> Exactly: the into-as, from-as naming suffers from *appearing* to be
> familiar and readable, but actually, the naming gives no hint as to 
> what it is really doing--nor how it is subtly different from the
> basic from/as/into standard conversions.
> 
> Instead, we need to add something (almost anything) to the name, to
> make it clearly different from the from/as/into.
> 
> into_for_arch() goes in that direction, for example.

100% agree with John. Thanks,

 - Joel

