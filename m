Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168E8B46582
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 23:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE27010EC5E;
	Fri,  5 Sep 2025 21:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IOuZDgXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDAA10EC46;
 Fri,  5 Sep 2025 21:29:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdHXLj6E39iid4kJTNg7EBuXWM02R1IM2TRBn2s10NGJJyHDyZ0b8CMxfcC2NpCV1Mu+KXmtPHuEgk+jrzd0uagAkLZqrq1i+BWXS6LjX7klooRayoxavQz74iPWuP1sru7VHbRrGU786WGoNHuVzPSONPwJVDZG/tdo7Z2mx4C1rwmtitRuEft8MRCXF1X/T2s+8iIKXNUC9zjP0hnoC/NBXallqMVUOCmwpo9IFqUkznhnA/C+NV3L+F1CtHgyAazquYPjyhSbgzP2+gQt4A5ZNxfSfIoXju03MU5/z0hJ2XhZfQz/stQLrHdVRns0dnTTB5M9i+dQCDtNS9/SGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adherVS76pr9R6jXn088pyA+qWFYjl90tyZQwYp45CQ=;
 b=vKSyErC56gvvLXhdGXRmlpY/LhOBJM3tM0emk/126cvS6QK+kkgtdNg4DBIbzaBkz/hMwZZkZVSZeOuYpP5pQfF6fEvIGBPjSUc5zx0+N+dmM9K3mn/qb5dw5QVQVv5CXvHX/NKXyFRL99D6j5wiv4/v/QYtoiNt+WkKK3adv0GMqnfKDaxJb0N6iryrdPBHGNn4Gkwo7T7evXtidz9b77jWrS4VgwPp0l8t1jwYpwDMCa1fJ6v6OTKoW/iQO7yhjRsr5W7Yoi56hftw6bQWgdrqTFKmaIiP3n/aTqMYO9JML0oL1/blJ3iiDz63iX7e2FkoATyEGOwcEIBXwFPLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adherVS76pr9R6jXn088pyA+qWFYjl90tyZQwYp45CQ=;
 b=IOuZDgXkda1pE33M/bSegTgk9clNQy1L+kIgRpOymNHrmivnWviht0oDS26KSjmu8vM+HKLcXb8XE0WRiXQ2UZ+oCnCXssNpV/6xdBalqkmi7w3PkOr7N/vYh45TFRc2FGggMAf+VhFXF5wj8BVhUvW93wG4FKpVCsJ/r8nP+h65uOKl1zjfbnjLC1q/yMQ9vmYKccLdkGTqVO3/v7qHBPtqicZogLM2KQg0dE/VGfrGbHN/uk6wkAPGxdK3fxk566Uaf2mNED61MpjVQv81S2pg2w7jygu5ZCB+H7ICYNi3NPbPFQuCkh5uqeixHEG7SUE2xb60iTIlhdsRTemjfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 by CH3PR12MB8933.namprd12.prod.outlook.com (2603:10b6:610:17a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Fri, 5 Sep
 2025 21:29:09 +0000
Received: from PH7PR12MB5949.namprd12.prod.outlook.com
 ([fe80::85:1897:39e3:6262]) by PH7PR12MB5949.namprd12.prod.outlook.com
 ([fe80::85:1897:39e3:6262%4]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 21:29:09 +0000
Message-ID: <40e412fb-5b45-46d4-ad62-252dea0b9ac1@nvidia.com>
Date: Fri, 5 Sep 2025 14:29:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <DCBGLCQVD1RF.6V5UT0NQ4GLB@nvidia.com>
 <444ebd64-7a90-46a6-b885-2c114aa59284@nvidia.com>
 <DCJOUO214EXC.32MFBN80VJW3K@nvidia.com>
 <DCJTY0OQFG83.1AX49CQARXCEX@kernel.org>
 <DCJYU75OUCGQ.3AEODDJR4IT38@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DCJYU75OUCGQ.3AEODDJR4IT38@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To PH7PR12MB5949.namprd12.prod.outlook.com
 (2603:10b6:510:1d8::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5949:EE_|CH3PR12MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b8806bc-e55a-49aa-671e-08ddecc33fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGlkUklCNnBtVjZhNEZGWDRTdnlOVXRtOFpXVzRiS3RZd3ZiWjVHRWM1VExj?=
 =?utf-8?B?aWVubGdvOThZUmxDUlZSeCt6Q1Z5MkdDbWxzL1JxWU9oT1p0ZHlCSlB4SHEv?=
 =?utf-8?B?VmVVcytHMkFHTjZ3cktFZmk3MHRVMC8yek0vcVZUNDlZbVN5WEsrbkhOUVBs?=
 =?utf-8?B?OUdxS0I5emY5ai84WkpJVGREL0l3d3RlbS90VWwrV1dMOUZHUjNlUkJwa0xE?=
 =?utf-8?B?cStLZzNDZ2xIamtKU0FUMFJxZkJ5UzN1cnhLSGJzSGhTMmRzRURaQXJCYmdv?=
 =?utf-8?B?QTY3RHBwanpoZ3oxbDBkY3lVKzU0YzRMSTNSRGQzMWszQzF0MnhHMGQ4cks4?=
 =?utf-8?B?Q1FXbUlSZDNMUXJwSjNjS2E0a2NiVDVsUE1McjdKQ283WUFsNDF1Q1VEekpO?=
 =?utf-8?B?RklhTE9qRGtlbW9rQzFod2VWNGZkVzFFSDBBM1REc0RhNnpPRFJmNG1OZ01K?=
 =?utf-8?B?UTBmQkd2WktvVTNSNmhlK2RRNjJNU0I3Rm85eEpublVmK3h1VnlrZy84UFVF?=
 =?utf-8?B?VThSRDlBNHhKeTdJWXMyKzdBWDh5T1dZOTlISXFrWlFpc3VFWXBQd2FqVWFK?=
 =?utf-8?B?VG1tNEhvdVgwZlJLYXIzSmdzNDZ1OXNkdURyNTVBaXR0clRLREN4SWd1QWRp?=
 =?utf-8?B?YnZ4NVlCcjRCcUR3Rlp4ZTZyTXV2bUs4akhOSzcyU0M3WTNVWEZ5VDg3ai9N?=
 =?utf-8?B?eC9LWEdZRnR6U01XZkNpWXh4Z1gyaUlGYXIwNVQvUXJkOEt0OGswMXlneVdh?=
 =?utf-8?B?dEF1cTlBZmdsTWRBSjFET2lZZU1OdXRVUjhBcGJDZk5JMHQrL1VPUytJWE5X?=
 =?utf-8?B?b2s4UG9uNjNtTEI1QnZNQTVFZ05TNUFLRDJCQnpUNWJmbzRyblBLU2FEbml4?=
 =?utf-8?B?NkZYWStOR2wwd0tSamVmRnhkVUZUU28xY0c4U1lmTmZjT1JzMGJwcFZLWFlr?=
 =?utf-8?B?VCsyZkZ1VmhHVmhXeStVM1kwcWlMSlhFWTlFSXJsaUFYSHdhYnd6cnoyS2ls?=
 =?utf-8?B?OXExSUMwVGRNUURtTXZuVkdwS09vUXA2N080N1FpRm5HNjNxYUdMeFVsWi9J?=
 =?utf-8?B?cHJweWpVZnRGcEl6ZmZiY1JJd002Z2UzaHpxN1BXN1FPMmw4YWVUNTIzMW5U?=
 =?utf-8?B?Z1VjUE5RVHJEeEh3cm8xS2hYcllTVC9rWXRoZlFvV0xDRFN4WlNyRmQxVWpM?=
 =?utf-8?B?NjZnZlhLWU1PNUMwUkJOVlVWT0dPbzM1QzE2bFdpV3hmaHRFR0RxUlZNcU1m?=
 =?utf-8?B?Q3lCWUZXeU1jTjhRVWczZWw4L3A2Yk4xQWhzOCt6MEtHVG9vbitJc2Q4R0RF?=
 =?utf-8?B?ZjlETFZwWVZoL0k0Lzg4S3VIQ1pIVmd0djYzcjVLVjcrbDF5bTBSU1JqUTRp?=
 =?utf-8?B?cncyM1pRMWFYUzgvSy9hVkJYby9MNWc4T254U213bnlKZlZqTUZSODczYWsv?=
 =?utf-8?B?eXo3VWN2dmxkT1plWk1nemhaYUUzeUhtM3lvZDdwY2JVK1A0c3MvVHFtREEy?=
 =?utf-8?B?Wlc3bHRXa0F1OUczR25EakcyeVlKTzZDd3RUUzNueVZ4VFlJS2hTWEEvd1FK?=
 =?utf-8?B?OG1yZG1iZnJBa1pZVUhLMDRJYmExL0FtU1NJNGdQQUtBUHVjNE5wL2g4biti?=
 =?utf-8?B?ZFdVVFJGczcxNi9kM0x1dmw0SkVMRnpBYUVtNWtoZEU3OTdDM0ZwSERrekhH?=
 =?utf-8?B?NWhIQUFBOGhock5jRDFDWVdrTWxnanRrb2FGZG91WGsxT3RFUzRIak40MzJy?=
 =?utf-8?B?cTNOeGw2eStQL2p6MWx3ZDgreThaallnejQ2YzlEWDVDQkRSVXdSL05CcEo4?=
 =?utf-8?B?NklhaTkyRUg0YUVvT1g2bXQwUHZhaGZSY1VsVE9JUVp4ZzZPTXp0amJzanpw?=
 =?utf-8?B?NmdRTDRCRFVBZFRWaEFEeTlUR3h6bncxNGpzQTBqZ0V5aEVIOUdmaHNYcDUx?=
 =?utf-8?Q?cIdInOrmmJk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5949.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1RQNDJPczNQdmpJSDMyTC9EQzZBZWtiSVIvU2dLNGt1YSszbWJpUjhLYVNz?=
 =?utf-8?B?U3pETnJ6YURabFhqaDU1OGtqbnZGaExuYWJzUHpURjBMeThna1VTc0NZZWor?=
 =?utf-8?B?WjVMc1p1ejFUdUVHanJHZ1g0c2lHT2x1WklndnRhUEExZEZEZ0xpdDlhQkI0?=
 =?utf-8?B?d1JPQ2x3Y3JCWFAvbEpjd0Q2SjY2VHJCMDFUekRWcWRXNVN2SUdWSHRwVkF2?=
 =?utf-8?B?Qm0zdDZtZTBUOHRaM283dlEzSFIyQjF0Vzg5a1YyN0lKeVJJU0kvNmZ3Q1Mx?=
 =?utf-8?B?anQ0L0U1bkpDTENIdG5xdnRJdEFpcDQwWEZ1UEpwNjRDbGorSWFVaFEzTmZC?=
 =?utf-8?B?NEx5SHg0eDI3TkxHUnB3UVFaUnV6UEk0VGJ0bkRialBONmMzazhIOURrRUtO?=
 =?utf-8?B?Zmd0djZhWGJQS3V0SWUzbzVsblNJTDJtMnBTbi83Qm9Gc3NNenNod0dMMWVo?=
 =?utf-8?B?bkUvbFRNS3VUbGx4d1g4OEVCNUNXL0lJTy8vUHp1cGhkU3ZtYzdzQ2VNVW5o?=
 =?utf-8?B?ZzBzOFRKL3N3WTRkK00wQWFuL2ZYSEU4QjRkaTRjVVErTi8zZkxyMzZtNDhS?=
 =?utf-8?B?NVZMaWtGeDlSWTNIcWhEanEvMUU1emtXUm1OMEp2YTRDalU5OEdvNklwRms2?=
 =?utf-8?B?akpKUDk4bkNXQWlKNzFDQVd1OGU0TEFtYXRFR3VoSFROSVBxYWhsTmlIR3pR?=
 =?utf-8?B?c2o0aVp5NkV1MmlQazVNaUg2YmNFZDlxQkc5eW92T2NaK0ZiQ0s0UWt3SHE4?=
 =?utf-8?B?NDJsVzRFV3Nub2ptSWNiRitNSjI2MURvZW1ydzdxbG5hOW9OcFpzbm52dC9T?=
 =?utf-8?B?czNOTE84b2FxcGthNWE4bTgrRGNvaEU0L0VtSWk3akFFaVRqU0NsaVduaThE?=
 =?utf-8?B?L3J2U2thaDVhS1NkQlh5NXEvSG9kVDJUcHNIb1BqNThvRU95N21HQ05JT2Jn?=
 =?utf-8?B?NDdzd25SMVRFVmQyd1Bzc2lrYWZuMUlpODJxVHozT0l3bHlIditYZkhETWtH?=
 =?utf-8?B?MEhCOFVyT3FVbDZsc0VxNFZhaEJzcU1WQ1lUdlRvZVlYVXJIOEpyaHVEZU5Q?=
 =?utf-8?B?b1Flcjlab2xCbjZEL1lYMjF6OWZDc2NJbG5OZUVZSEVHTnlMYk9IdzhXMU1U?=
 =?utf-8?B?elNyTUZmbms5WDZ4Mm0xQzhrbmZyWnRweG1XeFBxaDczYUZHeHl1eS8yUnlO?=
 =?utf-8?B?K0dIeVNGNWs2T3ZiK01sR3dEcnFNdlF6RzF4WDlyclpnRDgxRytuZUIrZlJl?=
 =?utf-8?B?bS9KTm01V0thZExmQS9BYnptYWFmQTUrWjhSbTBqN1Z1L2h3RVI4MG83aXQx?=
 =?utf-8?B?OE83VG82eXZxc04weUNWdVRvZzFrWGRVSkg2UnN2TUtCMHg4MDk1ejNFbitt?=
 =?utf-8?B?SEllSTNZYVVYbDJmY3Z1VFJkNkNIanFYVHBDVEFmYjFBdGFXam04bXB6KzFq?=
 =?utf-8?B?dFNVVkMrNjJBald1WmwvbjNsY2ZZaytORWdjN1JnWkhSRkxLa0NsZlF3RlNZ?=
 =?utf-8?B?VDBiSWtCam10UnRXSnIrN2kvdk1yTHU0RXNKZjNkc2ovZWNvVVdCZXVnU1l5?=
 =?utf-8?B?RE1ZdG1SR2pIMXFsQWc0bExYQWcyVXNpWFdtOStpWDhFd3FqblhvRzFRR1Jp?=
 =?utf-8?B?cnhjdnFUU2hXS2hyRGd4M0picVk4c2xPeDFPYzVjWEY5S3M2RGRSaGtaTDV3?=
 =?utf-8?B?TUtpR2R6am1mTDVhWTloVDcrVE1TSFhZaTNGOFNqcGZTS3BDbExlVTZ1MUNW?=
 =?utf-8?B?d2tvTFlsTkY0ODBTZ3poRUlFR1lJUURDQldPZm1yNTM1UHcrdC9JWGV2QTht?=
 =?utf-8?B?U3UyUVZMTTZtNjJILzhOSkIvUTJtR0FNK3hmdlEwR3Q1QUFDNVF6ZUJ4akRi?=
 =?utf-8?B?K0xMVWc3TTY4aDgzeHJjQmVxRmxSNi8vRXlYSUdIZ3JidG9zb3czQUtLTlBZ?=
 =?utf-8?B?SkNWcUphQ01DWlFzQVdnWXdLV1NrblZ5aTVIWkNxU0s2d0VxYkE3Z0NrbnRL?=
 =?utf-8?B?VFFCM1Rxc3QrZzdFVHFnT3doOURPd3JJQ05oeFJPRjdxMDV3SlFoWnRLNUN4?=
 =?utf-8?B?aXB0eGNqRTdmQVl2U1I2eUVDREFHdHBSYU5Qb3pQckRsSjJWSU5Md1pva1hn?=
 =?utf-8?Q?mX6kUeptslbGxzBktn/v948CO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8806bc-e55a-49aa-671e-08ddecc33fd5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5949.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 21:29:09.3436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DqbR2T475+oDDEJOSRV1m/j52K0Qk0I2+bqpcLn7/pcAc5Lh1Ly2tRweiO9aY8NWzXGsfCprM2py3yn0tTquw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8933
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

On 9/4/25 4:06 AM, Alexandre Courbot wrote:
> On Thu Sep 4, 2025 at 4:16 PM JST, Danilo Krummrich wrote:
>> On Thu Sep 4, 2025 at 5:16 AM CEST, Alexandre Courbot wrote:
>>> On Thu Sep 4, 2025 at 12:15 AM JST, Joel Fernandes wrote:
>>> <snip>
>> 	pub struct PageTableEntry {
>> 	    63:63     nx          as bool,
>> 	    62:52     available2  as u16,
>> 	    51:12     pfn         as u64,
>> 	    11:9      available   as u8,
>> 	    1:1       writable    as bool,
>> 	    0:0       present     as bool,
>> 	}
>>
>> This is also what would be my preferred style for the kernel in general.
> 
> Sorry for the confusion. The discussion was whether to keep using the
> `H:L` syntax of the current macro, or use Rust's inclusive ranges syntax
> (i.e. `L..=H`), as the `genmask_*` macros currently do.
> 

The H:L (for example "11:9 available as u8", above) is elegant and readable.

The Rust native syntax "L..=H", much less so.

For this part of the kernel, dealing specifically with bits, feel pretty
strongly that we should go with "H:L".


thanks,
-- 
John Hubbard

