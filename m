Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606AC42007
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCC610EB98;
	Fri,  7 Nov 2025 23:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WGVc5+BO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011005.outbound.protection.outlook.com
 [40.93.194.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8277110EB93;
 Fri,  7 Nov 2025 23:43:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWH9KL4lIFW7YVC+Uw/cQCbsd3gc6osOUKF1tIFaryQwPFh/l6J+YLDnLSxXr/An0Zvmc4o0WGZMwlyqlHxEglzLHoXzWgzuAT3baxhxV/8mxdR1oANbI0YQSG2fLn3Xbw91kfzNfsUCwKQLtoRDTBkNSYdTT0vXtZ+fsmZTtn5IR+glTDK3klgE5GKdHwoEtt9RLSa9F9kDWif/TA9hEyLQEX7CMbkwusKPPuhHIvkeuG/t1ZKKXbWjQxuRR74OfzC76wSODPBMfmK0YdmJOBZdWTOQ/yDcyyxhk9V52mPNep6u6ohvks2fSvlgvyfXguLG3YZi60KHjpeEGaEXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU9DYYDP2N5hUMBzUA+gQNsKrg7tsji2ptDrnAqZGUw=;
 b=ar0XIsavK7adyhE/1/aAPDzIaVdxFBiaDe7ynlH4t48HU+6DSOBI9LctzgKlX5ophqy1+J1ORR2PdGuysBYoHWr63fGXzvHsKiOOXxAwIKGl2qghSEbvyuELgRwnkKIoJ7A7XcVodr/3zBv4z4ajBhNONCDVdfTL+4qSCybw65NHEAKyXQJP4lkO3Sy8fkgAHfUk6ieU3G99XdTO4rBYtjlb2FumUx/w1DI/ad7b62Kh0Gyo+infKplkNTujjJVOkVWn29iWQlUyFiqkjY4KGhrDZHK8dn83APxgFc9NP74CyiN+dE7/YT4G9GEMtjlhttjNQBU+N6l5ZHFeFeB66A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU9DYYDP2N5hUMBzUA+gQNsKrg7tsji2ptDrnAqZGUw=;
 b=WGVc5+BOAd1Y0uqiQ2UBlvMBznSQ+Lr1Kjoy8YMw6kRFhML000tPUiD0H2SmftBZ1DWglKEkvlfQ2C6WXqhOxIM8COxn1m6ikHlAD0LzID5v3vzJYdFIgwLjab6k0mJnbpNP2/A/LwZih/j3GQ5nFu210X0tU8oUpUGYVvaXPQniEV+zAt2F1fGGLvfqRxeVqprq/gQrnZB8cOCL4U3dfSHU8ZKhc3dYezycONh0o8SLHqnSRq1ZmeDSDSxQVlTdO1UvgWMBiTawu3Q5nt6QTx7RXdrNIlFpL976k7UDiYPrRT5kHCH18EGgS3deO32x08rBi50FQBLXyG5ybBAcag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:06 +0900
Subject: [PATCH v8 05/16] gpu: nova-core: gsp: Create wpr metadata
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-5-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 10383a33-b65d-4901-f893-08de1e577872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTJTbkNobjc5aUdjSHZqVzhTS2R6cjZqSDRvd2E0MkY0SS9hNEQrUmgxT2V6?=
 =?utf-8?B?cFBSR25nMFRGalNFK2VuWHlmV2tpcEdMdUlBUG44UkFYQ3J3bDFxRmczdVdl?=
 =?utf-8?B?b01BYzhEVjBmSEQ2YWY3ZnUzbUhONHBZOWR1dk45WExYMlJKNzN4Z3BvOHZ5?=
 =?utf-8?B?SGZuOWcxWXJHWitXUUFpU2tNWVpRZnhCWVcyS3NmeXo1ckZVVEpDdmtWL2JQ?=
 =?utf-8?B?UmdwbmNpdjM2L1MzNVZWb0ZmSE9xaEFxN1ZQN2NtcHpodVZFZ3JjYnhuamxk?=
 =?utf-8?B?N0xNc2RFelpWeGNlS0t3aTgxVTZDdjc2VEw0WUpvSDU3VlQvcGI5TmNOWmNZ?=
 =?utf-8?B?OHRXZDg2QmpOOUhMQWZDRkxSSEtDTXl6ZzN1blQxYllBVm10UUpMZUNsRXkw?=
 =?utf-8?B?M0swbkloU1FScWQwT0F6SjlpcERNU2F3NUZ3NGsyNE9xei9QdUR0M2lJR0lB?=
 =?utf-8?B?VnNRTFJ4Tk5qOUNRT1ZqaFNMZVU4L2ppNzhsVzY5YlQvQmJVSlh5RUVTek5L?=
 =?utf-8?B?anJiditDY0l1aW1OLzZQZHYrT0tlU1JlSWhvOEdnME5NTWllWEJuYmtQV1NG?=
 =?utf-8?B?bFFQWHNxSXFHR215dXBqcDhvQXN0YnhEMDNRY3pkOWswWXJTRXVlQk5jVlVZ?=
 =?utf-8?B?Z2ZLM1MzQlZhcHltUCtZVWpNSkx2T0RjQzBFWUgwckcybDE0OVN6V3NpREps?=
 =?utf-8?B?RU9tY25TWGR4ZWoxa2o4OGN3VUg3cGNYVGJuTWcxWnZLb0xHdmFmSmh2ZGY4?=
 =?utf-8?B?MkhSSUdTL0hmeXl3MFBkZzZOV3kvaUpWdzBoY0YrMWM3UXlLNzkvZE1jSDZP?=
 =?utf-8?B?TkZhUWMvR2k0dTB6eVBEMU5qcVVjaXJlWDd5V3dwZXk1MEtCYlpuNHBma3I1?=
 =?utf-8?B?TC9WNVdXRjlNTFVIKzAyZ01SOXZnZGlpNHFQVk40UWUzZmFDZ0xPemNWc0hp?=
 =?utf-8?B?eUxUZ1hvRDJEeVY0ZFBlZmlvNStrRzlOMmh2b3dwVG5RUTBEWUx5Q04xeXgv?=
 =?utf-8?B?TTNUelhmbks4NXhhWDJlTnU5NkVDSWVETlZMRHdVWGNveXRyOGw2N3NZL2Mx?=
 =?utf-8?B?L0twZ1ZZcS81SXR1MXZMNmU3WndVeVpVRVVMbmpWMVFtZVdmTDQxRHBQM043?=
 =?utf-8?B?VkdhQ1BVL3UxZk1ZL2RrWlVsRFo2TEd5K0JFZEdVWmw0MnpObEJCdGZnd2pX?=
 =?utf-8?B?Y1lDT0l4Mnk5U0prZTNZcEdhN05lcEJmbW1HNjd4ZXhtQW1NdTJEb2oyeWFM?=
 =?utf-8?B?YjBZUzVudXg0RjA0bzl2Kzlld2lNdnJmMzZTVXZLWnc2eThOWTIvT2hUWGhj?=
 =?utf-8?B?THlteVp2SVE1NkE0dDlIdE91YURmZHZpZ1NpYm5ONUdzUm9JMm16NmRBcXhE?=
 =?utf-8?B?Y1p2MW9oRkZ2bWVuUmZXYnRLWXN2bzVTeTMxdjR1eWROTjZNVWQ2OXhEd0Q2?=
 =?utf-8?B?RDE3RncyRytzamh1Z3M0UTZHWWZjY2FzZHJIUW5RaUxIcXVpeDlXRzBlSjZp?=
 =?utf-8?B?VHhzd0ROQjJ2dUNwQ2FrT1NUUVU3Ti9sSjI1c0hTelBoWUNIRE1qOFNESmdk?=
 =?utf-8?B?V0ZjM2FidU5sNUVSSHNFWEw5bVJEU09XazM5WlY5OXhCSHh3ZFQxQmtPSGV5?=
 =?utf-8?B?S0hrckttYk5TSVhoeWd0Zy96WUE2aldsR2ttZU5hdlJ6eUJnWlJLK3dWeXE3?=
 =?utf-8?B?dVBKRHJnUk92a1NwaStaNzJnRWc4eVdsNm5uZmZMampORm5nUlY5VHlIVGY2?=
 =?utf-8?B?ZXlLTFIxd2NyWm9tYzJYTlpEMXRmcWRId2pjSmVmTHloVlFQMGNiaG1YQUs1?=
 =?utf-8?B?b2FqZ1RZQzhwUXdWRzB6MDNPWVpobDk3VWZWeElWeHNoWHJranl3VzdYY2c4?=
 =?utf-8?B?ZUpZb1MyWGJXbkVzZnBxWXR3eUhobzB1bTcraDlaeHpHclprYnVYOFpTaWh1?=
 =?utf-8?B?R1hkR1hneWgxcEF6ZzBpclI1NlNKTnVyQ0h2ZWt4cHJTNmNSOHl1VEd6Y1Za?=
 =?utf-8?Q?mv58NSMprzlOvjzQpI7m6H+L0G221Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEdreHpqUGpoR2xFanNoYmJOU2hLYzdVamtvdklNYms5b0k5QnpmTEowY0Qx?=
 =?utf-8?B?Wk1wVkJuVVlDZFdMMTBxZjNqam5hZWxMNStITDNESEhBais1WWxGNEFpdDlN?=
 =?utf-8?B?NWdnc2dlZWRtU2tEcmFEMzBKeHFkMlcveEFNRWdiSWdRUUk3V3hKZyt1REly?=
 =?utf-8?B?cmkrL242dUdoaFdJSWtEYzFRR2NWemZxV1IrbXVBWnJsNWIzNnJCVzZZUXhE?=
 =?utf-8?B?SFRYMHhxcGZlL1h0clJJcVVhWlpNZ3VKeU95MUZDUjBXQUhrMTRnWkRVaFFw?=
 =?utf-8?B?Q3VkVG4wZElGbjlYT1hxSHJyL1FueENHWlNVYUt5T1kwdkRhMWoyTWZjZ3p6?=
 =?utf-8?B?WkdvOHYrdmF5elpMMGFpOC9EOC91WEl6OUFobXJYTXFKMzlSMnFwTDRidzBP?=
 =?utf-8?B?MVhhWmxZWlZpWTY2NmZ1OWtIbkhZMHNJd1UxL252bFdsUjVWTnM1NklPZ2Jw?=
 =?utf-8?B?dFhpb1FVdGJVNXFxYnQ0WEpLem9tbW9EYU5SZkxFenFUTDQwNzFxSlNIL2Ew?=
 =?utf-8?B?MFBDY20xbkZOWmNxa3ZDU1lINVlZRjFmZGFIbjZyYnBtcWw5T2NzMFNFYVE4?=
 =?utf-8?B?bXovazh3YThSQXUxcms1RTdCVmM2aDJoMk9yMHBMM3hOK0Fqc3ZLWG55RWNF?=
 =?utf-8?B?Q040QzFPRVRSZjlQcEozNVQrbWZPUDY4cXV6NW5zU1RxNmV2bW85VmhZMzUx?=
 =?utf-8?B?ZzA2Mm9wVmZnZVpCb2FleHpHUWRxRUFFakZnVHNaeWJKUjJmSHJoc29IR2N2?=
 =?utf-8?B?RjhKQVdlc3UvVENRbk1PVi83d3V0L1VIZ05Kd1RwMFNlZVdEVlRhYXJ5U0E0?=
 =?utf-8?B?dW02cG0yQ3pVcDVkSzRpVnVtUTdmN0tINkppLytucjBkbnFSUHd6dnFtNURM?=
 =?utf-8?B?Zml3UE5pY0QvSzlwSmJtQ2FoV2VJZFoxVVNBRnliLzNIU2k1VWtzeklWMFdR?=
 =?utf-8?B?aEJmLzFjS2R6UDljVThhVllRZEhITXIwWDFuNW9FYUNQTXhIOUo2V1JmY3Na?=
 =?utf-8?B?UmVoWHI2Slp2bVRwYnBJYWY2aFZBQ21nU1IySHNQOTFJUTdWZUt2UEhReGh2?=
 =?utf-8?B?WlVWWENFN3FKcmE5eGFlTlBjR2pJU2tGMy9pSVlMY1VIRmtlaEJRdGJXRXBJ?=
 =?utf-8?B?L3ZRVHdEaFpDb0hQa0ZncU14QnB2cG9nTGNuWFh4YUFEMDFtOVhxWm9WZ2ds?=
 =?utf-8?B?dTBnN2h4bXhCd3ZHRFhwZ2lqY1RNVWtRU3Q2eXRjMExRN0hHQ1FsWDRERm1J?=
 =?utf-8?B?V3JYNFM0dnVzQlQwOFE2MTJLSitnL2hwUHlWM09GNnc0WEhNK2EwYWpVRkZq?=
 =?utf-8?B?U3FxUnNFNVc5T3dFQldoMERMNHZmaUovSWo2eFF4U0ZMMTF0dWh2L1hHMXJH?=
 =?utf-8?B?NzZRYW5oL0sxdWtsYXgwSmxyMzVYd1BlVjdrQndaNlVMM01HTXRUbUlFdE5r?=
 =?utf-8?B?MWtVUTFnbzZDeE1yVjlaODY0SmRWMFdPcWZYVmd1Z0FLZXpFaGZnRUNiNmdi?=
 =?utf-8?B?TWZtMFZoQWlnMjdXZDJvVTFGMnlhR081b0tJWWxiVFNSU3RoTThVNUdwY1Yw?=
 =?utf-8?B?aDQ3cnZsanpnZ2lJdFZZN1lQOVFmbU9iVEFZZDF3MGxVSkdPVlVJaWl6QXIx?=
 =?utf-8?B?RjNySktWTUtKSklkMUcreXk2SjdTT1BpZGFvMFFtdWF6MHNXVlhDYkcwcUZ1?=
 =?utf-8?B?MDlQc2owMkFMR3BNS01YLys3cjhPdVN3WFdNOU1qQkMyeGtRNHVXUGtldXFT?=
 =?utf-8?B?dkJOWHZxdEJUQUNDUTRoY1QvNlpzeHhFS2w1MDdNTnlYZy9mNENadFVFQ0pD?=
 =?utf-8?B?amxTQnU3NWovR2krZ2NNbnBmL2hpNmxrRW5tRXVLd1RMbkQ1dVg5N1ZEbHJK?=
 =?utf-8?B?dmxicUVkRjlYQldhWGdUSzRFZVNWT21VL1p4dVhVOTdQQ1pRVUhFQVpaY01Z?=
 =?utf-8?B?K2xYZVczRlVGY2kxai8zRXZjYTZIRDlYNE9ua2orNGZNdjJibVAvWFJ5TDBB?=
 =?utf-8?B?Zy9BS0dMRllDWUZadC9MZy92cGdLRDJDZHNrUUJ0Y3JqUUlnN245ajB1TmMr?=
 =?utf-8?B?ZnNqY0MyVWpZeGdZalJsbUl5UzJxVFJQbzVKdzIra0dCa1QzRW9lN0RjNlBP?=
 =?utf-8?B?SVkyMmxLUFdWdnNMeW1rMnVoNTdHQmtFeXJURngvR0JJdjZqVWxNRFVBNmlo?=
 =?utf-8?Q?NhlP7kCUyYh1g8u30iNOAIeLTr8q7A1rPN/3tY7VZcEh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10383a33-b65d-4901-f893-08de1e577872
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:36.6570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NT6NERUagy/vA9SlSt8NSdaldg5/GavBm8qfLj7i7LUbOrxKVGOXqvQEdvP949WNCjv7GOOMrpjoGC18JCGmbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

From: Alistair Popple <apopple@nvidia.com>

The GSP requires some pieces of metadata to boot. These are passed in a
struct which the GSP transfers via DMA. Create this struct and get a
handle to it for future use when booting the GSP.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                       |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs             |  3 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |  6 +--
 drivers/gpu/nova-core/gsp/boot.rs                 |  7 +++
 drivers/gpu/nova-core/gsp/fw.rs                   | 61 ++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
 6 files changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 156d9bf1f191..3c9cf151786c 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -98,7 +98,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
-#[expect(dead_code)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 471ace238f62..0549805282ab 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -145,7 +145,7 @@ pub(crate) struct GspFirmware {
     /// Size in bytes of the firmware contained in [`Self::fw`].
     pub(crate) size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
-    signatures: DmaObject,
+    pub(crate) signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub(crate) bootloader: RiscvFirmware,
 }
@@ -231,7 +231,6 @@ pub(crate) fn new<'a, 'b>(
         }))
     }
 
-    #[expect(unused)]
     /// Returns the DMA handle of the radix3 level 0 page table.
     pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
         self.level0.dma_handle()
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 3838fab8f1c0..7d82fb9876e8 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -60,11 +60,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 #[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
-    code_offset: u32,
+    pub(crate) code_offset: u32,
     /// Offset at which the data starts in the firmware image.
-    data_offset: u32,
+    pub(crate) data_offset: u32,
     /// Offset at which the manifest starts in the firmware image.
-    manifest_offset: u32,
+    pub(crate) manifest_offset: u32,
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 979d3391e58c..5ea53250bf37 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -2,6 +2,8 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
+    dma_write,
     pci,
     prelude::*, //
 };
@@ -27,6 +29,7 @@
         FIRMWARE_VERSION, //
     },
     gpu::Chipset,
+    gsp::GspFwWprMeta,
     regs,
     vbios::Vbios,
 };
@@ -146,6 +149,10 @@ pub(crate) fn boot(
             bar,
         )?;
 
+        let wpr_meta =
+            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 458b5610061f..a6ee52475bdb 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -13,7 +13,10 @@
         Alignable,
         Alignment, //
     },
-    sizes::SZ_1M,
+    sizes::{
+        SZ_128K,
+        SZ_1M, //
+    },
     transmute::{
         AsBytes,
         FromBytes, //
@@ -21,6 +24,8 @@
 };
 
 use crate::{
+    fb::FbLayout,
+    firmware::gsp::GspFirmware,
     gpu::Chipset,
     num::{
         self,
@@ -122,6 +127,60 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
 
+// SAFETY: Padding is explicit and does not contain uninitialized data.
+unsafe impl AsBytes for GspFwWprMeta {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspFwWprMeta {}
+
+type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
+type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
+
+impl GspFwWprMeta {
+    /// Fill in and return a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
+    /// `fb_layout` layout.
+    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
+        Self(bindings::GspFwWprMeta {
+            // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
+            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
+            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
+            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
+            sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_handle(),
+            sizeOfBootloader: u64::from_safe_cast(gsp_firmware.bootloader.ucode.size()),
+            bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
+            bootloaderDataOffset: u64::from(gsp_firmware.bootloader.data_offset),
+            bootloaderManifestOffset: u64::from(gsp_firmware.bootloader.manifest_offset),
+            __bindgen_anon_1: GspFwWprMetaBootResumeInfo {
+                __bindgen_anon_1: GspFwWprMetaBootInfo {
+                    sysmemAddrOfSignature: gsp_firmware.signatures.dma_handle(),
+                    sizeOfSignature: u64::from_safe_cast(gsp_firmware.signatures.size()),
+                },
+            },
+            gspFwRsvdStart: fb_layout.heap.start,
+            nonWprHeapOffset: fb_layout.heap.start,
+            nonWprHeapSize: fb_layout.heap.end - fb_layout.heap.start,
+            gspFwWprStart: fb_layout.wpr2.start,
+            gspFwHeapOffset: fb_layout.wpr2_heap.start,
+            gspFwHeapSize: fb_layout.wpr2_heap.end - fb_layout.wpr2_heap.start,
+            gspFwOffset: fb_layout.elf.start,
+            bootBinOffset: fb_layout.boot.start,
+            frtsOffset: fb_layout.frts.start,
+            frtsSize: fb_layout.frts.end - fb_layout.frts.start,
+            gspFwWprEnd: fb_layout
+                .vga_workspace
+                .start
+                .align_down(Alignment::new::<SZ_128K>()),
+            gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
+            fbSize: fb_layout.fb.end - fb_layout.fb.start,
+            vgaWorkspaceOffset: fb_layout.vga_workspace.start,
+            vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            ..Default::default()
+        })
+    }
+}
+
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6a14cc324391..392b25dc6991 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -9,6 +9,8 @@
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub const GSP_FW_WPR_META_REVISION: u32 = 1;
+pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;

-- 
2.51.2

