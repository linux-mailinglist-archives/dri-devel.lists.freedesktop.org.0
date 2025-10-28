Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21932C17331
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 23:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0771910E68F;
	Tue, 28 Oct 2025 22:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mpKYPq02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013019.outbound.protection.outlook.com
 [40.93.196.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0313410E68F;
 Tue, 28 Oct 2025 22:33:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1JLtSC5ahZpg5gozayfH6s3ZfYC+ZV8esyD/SBylGCFc3peXWw02gc8OvewI8+CTcpLIzfePtnKkdx05gLlufzNJsxdLBZ2lKcj5wN7A7BxGb041SrSLeYcQSflBi8tkc2saeJALZ6/krQ22PR+X0hM5D1Mysz8ggFoUKrRTaDKRyxqSG/tIaXVU7pW9eX/gM4b6GDf3Y5AE/R760xOc5dS0ydQUROXtrfLDWEZH+cRQ5/tSfGWRCG1QKt3Oau2lvMhKLdHHvXUM74OksQTTuUKHolvjysPMaPv5oGWUIBAo6HnRljdP5BYBUNJNWGaZ5DRvHh+DzC9koyDhvSuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSrwFrZzBIU2TL910cHa37xbZJswflooO4as6B7ZHX8=;
 b=ASwxWbBVRuAj/kHcMFNDPkxZwiA4FDGGGxnYoEgPiYjrgtP6M/0+tdM5zCaTdaLrz6wU/g4vmlps5GTJwfY+EegtMA7q1OyvpLbNKL24l3gjCOKXoKX1Xd0oZXGHieeJslttZhWr0JOBdBfCo7Rv7GIBM1mY/oYKa9WEcvRxvAM85odT+XCFPigqXoikzMT8yaH01IMMSU2o2QwxaiYbf2xi9SiC3WOG30EuY89u0376/2obxiVPPLuh32GwsaLDVk2bSwam99FdvNdWvaDDP4XKRatPwxkMUdLTf5CdbcdlqmkBveTyes/nZTjPe8az8yQMHyxrmZcUhPVx4WHDEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSrwFrZzBIU2TL910cHa37xbZJswflooO4as6B7ZHX8=;
 b=mpKYPq02jAQc3HAw7nQPnxE3YCpDtRn1NFE8ZKMqlcOkJlWa627sOJv9f/4HqsadeRTHZm4+ij32aA6i0PugmWMDxQbR+hQX5e6ZHAtmwWgInncjIJjkodU97tmY43LTuWi8Do41Nu4xIUh46Z44LBvuQujmft/IxfsVCVXSD0D2iDeZvt/nZnHGZS8piZNp5GvxO5tjA9xDToPbsT9y8lbnSeQF82Ecfzyq9suFDL3G1eRvBRPwYUxTM+TODlTnskt7pQFAqzXeVINQ7QLghEQRCrJnTs0f1i/hClCn90NuB7KphIDlhYSh8pHyDUWKDblhJtTCzH4k0daT8X00Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 22:33:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 22:33:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 07:32:59 +0900
Message-Id: <DDUB9FJY8IRH.1M5GHVSOFCR3Q@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Matthew Wilcox" <willy@infradead.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] gpu: nova-core: add extra conversion functions and
 traits
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20251026-nova-as-v1-0-60c78726462d@nvidia.com>
 <20251026-nova-as-v1-5-60c78726462d@nvidia.com>
 <CANiq72mgoW_TyWf9Nv=5t3Qij_dsDjicNpGsa=F1t+sg23vxSA@mail.gmail.com>
 <de796658-ed1d-41f1-b153-f3d1089656ba@nvidia.com>
 <DDU1AQDW78QI.1CBHEW03926H0@nvidia.com>
 <1772ce29-c84c-42b3-8c77-e92355fbee53@nvidia.com>
In-Reply-To: <1772ce29-c84c-42b3-8c77-e92355fbee53@nvidia.com>
X-ClientProxiedBy: SGBP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::14)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c937e2-cc9c-4f09-ec4d-08de1671f502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWF2c2hRbFRMcXlvdkY3MkFHL3o3QXVGZk9UbzlMVTZISStvZUdzbTFaSkpv?=
 =?utf-8?B?WWJ2Rmt3Wm1IbG1jSG5NYTVhSzUwM2dOdE5DQ0xoOW42bFRiQmd3cjdOWWhQ?=
 =?utf-8?B?bWNZbmlPejRjU1ZaQS96THFaaXlZVlJZZEx1QmJwVHE1M0JGTW5qQVhPRy9V?=
 =?utf-8?B?cmZ5elg4VTU0MnMrbVZ1Y1ptcTRSZVdudGs4OVVWdmcydGQzS25tT0VBV2t5?=
 =?utf-8?B?MFV2VGdzbmVmRnlHVXlwK01yUkpyTmFvV05zelNJWlNvT3lGVmpFRWtyR09v?=
 =?utf-8?B?WU5SOWUzdXZqL0syanRhUGticlNFbjlyRk1zczJaZXZxQTBpYSt1MTBoSVhn?=
 =?utf-8?B?Q3o3NytmMXFGdHFhU0ZnajZjenZ0YkJtTHdlK2h1ZjR0clN2ZllxOVJGMnpK?=
 =?utf-8?B?bVV1L3pETVFTNU12Ty9DY2Y0ZE1ieDdRczdwaHBoVmF2cWIxZHFZRjRtMlh4?=
 =?utf-8?B?S0F2aWxhb1pjVW1NbUJvYWE1TVVydUFFUXhkTkdINUpLYXBTY0JXY2RPdUFs?=
 =?utf-8?B?UVM0Rjc5SVRFTTE4ME95VGZuSzVyL29SL3lzRCtqZXJTOTFpN2dtd0ZUeUFW?=
 =?utf-8?B?OEc0bHNDbnkxSFFWWExPY1lSOW5nTWZhOXBkMnlBN2UrQ0dGMk11RnB4SXF0?=
 =?utf-8?B?Y2o1dkNMMGhGME5oT3BkU25OSjdDZTlnU0d1dU9QZldDd092OUgwVjJXWGxy?=
 =?utf-8?B?QkFmYlhTeU5qS3lMeTRoUEFEZDdGOFEzOXRQSisrRThDNCszVld0ZEw5dCtN?=
 =?utf-8?B?NmQyVEhmZ25OSGJBbE5Hb2srV2l2bUFTSDNvTnJoMTJoNDNLT0M4MEhWQ01Q?=
 =?utf-8?B?dHJ0RVpmbVNQUnNwdVhVNEpaS1BlMnZtRzRic2cwZlhBLzBTNTdYRktuendX?=
 =?utf-8?B?TExxQitXNGptNWRDZkFjQUtoNHNXMFhNY25pSGZpY0R6dGVQVGUyYVV3L3Q2?=
 =?utf-8?B?NzlrMERTa1VGNlpycHdVZUZTaUNlYlZwYS9xd09mTWZIckRNQi91RFFDNDdu?=
 =?utf-8?B?K1lwVUJRWHUzaFN1NG1sblIwWHBnMEdKcFlHNmpXdC9TQVFacDJGa0pna0Rs?=
 =?utf-8?B?UGIyakZmUmJMQk1kbFlVYlE5MGdNRkpPb2d6OE5jS2xNZmRDNzliS0hJVGF6?=
 =?utf-8?B?bE5ZM2ZaN2ZxRDVzeGJIcm1HVWkwZ2UvSkl1QytLNkw2UFEzeW1hRGQ4WnVB?=
 =?utf-8?B?UmZlbkJYaGFlMWk0Y3Brcy9yZHB1Q3diWDAwSTF4ZHJNdE1ZOTFGa1dhTFRv?=
 =?utf-8?B?R1NZZ2RTMmNWOFR0dTVBWGw0ZGwwcThLRG4ra2dsWXdleTJ0L1BFWVp6T3JH?=
 =?utf-8?B?VDN5cTBSZk1UM2tjQnZuc0pJTUxGTUl4Vi9IWVRXTGpya3p1azZ1WFlJakhz?=
 =?utf-8?B?b1dCa1MzdWFRdWZBODBjRUp2amRMUU5TWXdCWTNVbjYvWkdBNzVoS0NXcDJP?=
 =?utf-8?B?T0N6eUhaVE9EYTlkMSs0Z3FKbE81MUFFc2ordC9JZ0JCTWVUY1ZhbHZ5WGdD?=
 =?utf-8?B?ZWlkb0ZLRmcxRnREeTNPYTdyU3FzZW5zWnlpZGdDMml4K0JKRWJkWURtdU5F?=
 =?utf-8?B?b3F4TWZFNHJsa0hyZkdUY1dPLzNoeTNhbG1XNnBWUCtXQTJTbjlBc0wxOUdK?=
 =?utf-8?B?YmhGVjZwSVR1MUpUQXFLcHVzbmhzcHgwcUFHWjJOa2tldk01KzhvdFM4R0dM?=
 =?utf-8?B?eXlsaURobFZGdHVGcHdKWkxwYUhyN1JmdzBGUGpleXJYRGdMaE9Nd3FTWHJ5?=
 =?utf-8?B?N1JyMU9TVHhod2FCdUdWZENhNmlBM0Mrc0xhM3JuZDExdkw1ZlBCQ1lNWnlp?=
 =?utf-8?B?dE5LMWROKzYwQVZpMDl1NmhjZGEyWWF6bU1VdEJaSVhHVHpqRUJxZTlJWHd5?=
 =?utf-8?B?WVA0ekQ0RWF3aDJ1M05XTzVVYTBSU0c2STQ4TG9CRE8rV05EQUxlNnVHMk1S?=
 =?utf-8?Q?13RPwpyW556vaX8ozPn4U/trdVZOgGOz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUZ6T2ZWK0ZISUo5OXB5UkdvRWFXeTZ3SWMyK2cyc1UrVlZTRkJkUnU5Z1pY?=
 =?utf-8?B?bnFBL21EK1FUVWExcWFwQlExeW9aUFhCNWxMSTFDaU5VRCtKRzk1em81UUhE?=
 =?utf-8?B?cERBMzA2blh6NC9RL1lqZW8zaXZzMlFaZWNveFJoOTVlcUhKdVBPaGdmRlVJ?=
 =?utf-8?B?Rk8zRjZXN2RPdkJwS0EyZGVsL0FiQ2lId25jbmpjT1NIWWIvakZlT0owUEpr?=
 =?utf-8?B?bHZCMkRGSWtDRk9qYklJVkw4VG1MeXZHRTUyY3RESEFKM3ZkeDhxWXk2ZHIx?=
 =?utf-8?B?UVVjdGNYaEIzZXNaQlNIWGNkc1pDTUY4U1pSK0d0ZzAxYXQ0YlBkUXBoVG1Z?=
 =?utf-8?B?TFNvVFFKWDBSbTNETVV5RWxlbnJRUDFoTnZ2TlV4bFZvNFdnN1AxYnY4YzRR?=
 =?utf-8?B?VUI4dG5POVJpZ29sb0laOTJ6TVhtc3VIa1hWQ2VWTzc3aXdlOTRaa3FzbCtK?=
 =?utf-8?B?STdNQ1NIa3hRVVNGMUlEUzNEejFMR2lDMFZDVjFSMHo1aWZzeDYyNXhnT2cy?=
 =?utf-8?B?YzBaMnNrQWMxdG5EY3hKVGlvbVd3dWlZVDdwWlNCbzdDWm14ZWxMT3ZJUG5k?=
 =?utf-8?B?dFZTWEg1NW1sUUJxcTN0c2ZDYjJROG42a0hIN3N1eEZXVXZRU0hEUEl1WC96?=
 =?utf-8?B?U3FKTkJUZENydTJNby9ESjk2ZytzQUk3OHN6ZVhUNWpRMEYwZXNQdU1Md0NB?=
 =?utf-8?B?TTRpaTljNTZySURac1FZM0twZkhQTGtHSXVVY2JTSXdWRVppUDJSU1ZwK002?=
 =?utf-8?B?RjFVNkZBdEkxVGVuRjZnZU8zV0NWeG8rYUVxT0dOMnJzN011ZGEySitzUWNW?=
 =?utf-8?B?L1hxR2V0MmZwWnllNGhvU0t5TWJHOTNMRG1mdXZsSGZ4QUJFajlMckF5MmNC?=
 =?utf-8?B?Yld4TFRCSDdxNXNxUFZLQzY5a1JmTjFoZjVOUEt1bTVCZGhSYWFEOWs1YnJI?=
 =?utf-8?B?b0wvZ0JieHk4VGNOWVJOSlJ2b3I5anVNMnpiNGR6Q3BoZ3htYkQ1UmZUL2FG?=
 =?utf-8?B?ZlF1dnY4aUZPWnlxdGtGK2RydEVPcFJWamdtUjErRFJ3WjFlNEljNUtWN1FV?=
 =?utf-8?B?WUhmVnZ0dTZXZS9tdUpVdnlUdWhSN3B6RGg1c1dSRmoyQUhPZTJqRFJRa2da?=
 =?utf-8?B?VGVwdlljdWdWcyt5TTk2eitkRWtyMEpWeld5RUNOWm41UjBvRGVQL0NqM0kr?=
 =?utf-8?B?UWQ5S0FIbmpYeVYrQnZSRGZxNVp2eUFNRmp1U1NKcUI5NGJneXpabVRUNGZZ?=
 =?utf-8?B?QldLSnF4Q0JQN2c5dWt6dXk1bEROblJYb0NKS2hwL294SFNnZjFpTDBQbUwz?=
 =?utf-8?B?UzlQWkhKcVBiSEloSGNQb1BGRi90Y2pkMEo5UXRvMStJMEh3WCtWdDlZYi9G?=
 =?utf-8?B?Vmh3YkRKZjZRUUpUQ29IK2wrMWdDSXpWTVJTT0VuajBzWU42L0ZtSXNKZVU4?=
 =?utf-8?B?bDZpM1B5TldmUS90M1BmaEJWdm0yRUFuY0hsbFI1VFJWdCttSW8wUUlVcnhL?=
 =?utf-8?B?cWJzWmxrbkhuNWVlMVlISWpKVkNSUHVXcDFyeTdqKzhhbjI3alZwbFpnTkdW?=
 =?utf-8?B?M0sxQk9mZzBwQjJlUDB6UTZRa2piSTFkNTFDcVBmNno1VXI4OTBWVkpjTTRY?=
 =?utf-8?B?dU1HN2UrYytZZE9zS0ZmTTl2azNqenIvdmkzZ2I4VzlkT3BqZXExdVBGWUpX?=
 =?utf-8?B?aGdnVjZrektxQ0dJVzVmV1RyUWM3UnRGdHZEMngxcXJ0SjlkMEJpbVQ3cDJD?=
 =?utf-8?B?clBFSHdCWXUzTmdJdk9MbURHVnMvbzhObzZZc3FldVpFQnorK0JNV0E1TzBw?=
 =?utf-8?B?OTRqT0UyT09OdTR5UkkzajdsU1V4cmNwMUJUVnRrWGU3UDBDODRqb0FUKzVr?=
 =?utf-8?B?bitxelFWWUpTbVh3NXEwbXgvNmZoR2Fwd0Z3QU82RzFRSCthekdIdi9PRUE0?=
 =?utf-8?B?VzY2Z0xoOVR4MTl5WDVWNEY4b3pJVXViTG1Ea3o2bFJScklUL0xDVmhJYjhW?=
 =?utf-8?B?RmwvY1lyaEZlMkhFUWZkZFAwT2Q0bkh3QlhWZi9MYXR4ZENQaWZsM2ZlS1Ju?=
 =?utf-8?B?TnR3eFNjWm5renRFWVcwTFg3VjVYcXlKNGFJYkhnemZ3TVI5R2ZLditHNkhV?=
 =?utf-8?Q?XmaeOWMVmH28xfi3tUyhF/1FT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c937e2-cc9c-4f09-ec4d-08de1671f502
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 22:33:03.6051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Q43AZdJRU2UUZCjNMIgphlHHU+e/MEqeqh75TpANWiay+EpIXFRrJfwIBHtxJ9/4Gm0Rv0tRKJsF8j9fVUSPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
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

On Wed Oct 29, 2025 at 2:18 AM JST, John Hubbard wrote:
> On 10/28/25 7:44 AM, Alexandre Courbot wrote:
>> On Tue Oct 28, 2025 at 3:46 AM JST, John Hubbard wrote:
>>> On 10/26/25 9:44 AM, Miguel Ojeda wrote:
>>>> On Sun, Oct 26, 2025 at 3:40=E2=80=AFPM Alexandre Courbot <acourbot@nv=
idia.com> wrote:
>>> ...
>>>
>>>> Regarding the `.into_as()` name, it makes sense, but it can be a bit
>>>> surprising when reading out of context... The standalone functions are
>>>> super clear, in comparison. But I am not sure what could be better.
>>>> `into_in_this_arch()` or similar could emphasize that this will only
>>>> work in certain architectures, i.e. it is "an `into()` for this arch"
>>>> rather than the general one.
>>>> That would go well with the idea that you didn't implement it for
>>>> other obvious types, which I guess was to avoid developers using this
>>>> instead of `into()` by mistake, right?
>>>>
>>>
>>> Exactly: the into-as, from-as naming suffers from *appearing* to be
>>> familiar and readable, but actually, the naming gives no hint as to
>>> what it is really doing--nor how it is subtly different from the
>>> basic from/as/into standard conversions.
>>>
>>> Instead, we need to add something (almost anything) to the name, to
>>> make it clearly different from the from/as/into.
>>>
>>> into_for_arch() goes in that direction, for example.
>>=20
>> I'd like to get more input on that, for I am not sure how we can stay
>> succint in the naming, while carrying the relevant information.
>
> That's too many constraints: if you want an extremely short name
> that carries information, *and* avoids (as requested here) confusion
> with existing "as" methods, then...you can't.
>
> But you are allowed to be less succinct here, because the more
> specialized and rare a case is, the longer you can make the name.
> And here, you are definitely allowed a few more characters.
>
>
>> `into_arch` does not sound much more explanatory than `into_as` - the
>> intent with the latter was to say "I would normally have done an `as`,
>> but instead here is a method that attests that this operations is indeed
>> lossless and safe".
>>=20
>> The best naming scheme I could think of is to have the methods carry the
>> source or destination types: e.g. `from_usize` or `into_usize` (like the
>> standalone functions), but that would require defining as many traits,
>> and increase the number of imports - if we go that way, we might just as
>> well drop the traits completely and use the standalone functions.
>
> Accurate names are really desirable; maybe we shouldn't completely
> close the door to the above approach.

I think we have reached the stage where any responsible adult would
shove this whole discussion into a LLM and see what it comes up with.

And the candidate is... `FromSafeCast`/`IntoSafeCast`. Which I have to
say sounds like a good middle ground? :) The intent is definitely to
perform a safe cast here.
