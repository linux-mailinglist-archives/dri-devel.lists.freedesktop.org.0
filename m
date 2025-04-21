Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73178A95833
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 23:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 093CE10E166;
	Mon, 21 Apr 2025 21:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="taAp9X8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B49010E059;
 Mon, 21 Apr 2025 21:45:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4JRc9Fz/uqxtRTWyIup96JjAOJHT2fej5PuhuO9iOa8trxzmnS1ZPe+MffWONrxGpC0DvwfH77lkRoMwRN3VOtGDWQmOsM1KUpikcQ6InG6VddM3c2mmf65wDTapseewv1lGjdaOoB228Ku1JwOQ5Y8hCp4cmGkUG05CKo7AVbLJdMzoaoWIcLG7qAFAoqnL0LX2UFkDSrU5POECFoWfDn9EoiBro51yT30jeUfGnGGvtrqsgEAGq15taHYIRXz+KXw32KGLP0vnr3CoQ3UmVAvsNIHrY1TN4a20HCznijV6Q2Tt1i8ttzNowQkTRB2Xei6ubeJ6wvU+7tMEV3jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVnoKt9gWx7ymLFDV5516ZQ9ps4smiIqnZGkDUl9GWI=;
 b=yj9ZFW7iwmQcIhZkkvsSzVKnBezMHAJto8/4408tsxltgxPsTkOvbec0xjLIiEG2s+oJCq185mNCfzDmcOurh/LwD7YCnJ72iixZroxR9+G9BpDElaH/2MdSZAKNxwzjUOJsaY6xAIO47/Zd22hfkysLYSrX790SG9wLM3FZgC7KdhPScaaggQlkajhbea6N0o+bFBzVLecIUS2JN4yzOuTBuNu3Qh/s+gjPqQCXfmSdNhd9ErGOJAzNDCwkuuzgACQtrwtd5ZewaFvg2k/3yHtrrEeyX+A5xkYdVyvB1oL9nvggvZuO+wSjc+wHOqipn9QWcgFPfvR3gRNgeyIfeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVnoKt9gWx7ymLFDV5516ZQ9ps4smiIqnZGkDUl9GWI=;
 b=taAp9X8lH/XNHrlDLAEmRnOjRRfpQyepi0BCaEEXFjTp20GYQ0PbmlQ+VinRYL7HLHmMGEjl5uEwJ+Cx6lcC0/m2pbCdREHs45eUtfgXMJaVh0Bmny4uiYkFBXy8bNTHd1UoiIqYKUw3PyU2QaxiVAuWrhZtVltH1yynrGs6g/ZnOACGs/s6ApQ5eveyv4xQ6/YbRBUi7XudtHZmRb1ILYJZ3eXneRBtdXLYi1ReuTMZFr0i2OsBGoFTshovoCg4WcZAXGCZXODiBOVERqqMFi4tV19cR0wnHnKxYmpKiBoMXo1z312OqR8OIbzXNbbjRBVM0W2S1u4G8HFmZyivBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB7636.namprd12.prod.outlook.com (2603:10b6:930:9f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 21:45:37 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 21:45:36 +0000
Message-ID: <64d869aa-587f-49c6-8626-d2085441bb3b@nvidia.com>
Date: Mon, 21 Apr 2025 17:45:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] gpu: nova-core: wait for GFW_BOOT completion
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-8-ecd1cca23963@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0019.namprd19.prod.outlook.com
 (2603:10b6:208:178::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: e13f87c3-2ab0-4b7b-a200-08dd811dd9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGVqMms4V3lqN3gvcS9iVTh5YVd1QUR0QUgyNmNOYkFNMlVieVpGU2U1Nnpr?=
 =?utf-8?B?b3pxSmdHOXRzQ1UwK3BtbndQSGhwZHp2cGFYWEpFZ1NwRGl2emkvSDZ4eHBy?=
 =?utf-8?B?QWM1dXZDVEQwbXIzMFdPQURjZlM4MkVIS1I3b1gvK2JEYVZRWjE0UnFtMHdN?=
 =?utf-8?B?WC9sVVNHUDg3MUFlVlovbU5jU0hRN1g2TzFIUExTb3hqaHNSSTNnUzlvekpa?=
 =?utf-8?B?Qi81dTQwQ0psWGkyVFFzSHZrREhTemtVYVdzbnBnVC9lRFNsREJTd2NYdElT?=
 =?utf-8?B?UEcyVHV4R3ZqamtBeXAvc3lEWCtsVXBKenMrdXpXcVJlYW9NaS9oMUVNa3hQ?=
 =?utf-8?B?YThhVXkxbFFLaG14SmhrcjJvNmRyREpsamlXc0kzMEVOV2ZGcmR6R0d2c2Qw?=
 =?utf-8?B?QzIzemIvWHQvMUFFdFBnMitxYzZTTTUvZW1GODlQdEV0a2grSnNDL1BhV25j?=
 =?utf-8?B?ODMzRm03ZndNWWRxNXhFTWRVZXUwWnRscUdBa3lnak1NcDFOQjRjYTNqZS9H?=
 =?utf-8?B?RnhtNGhoSFZXekhiVndrUnNHTWJCU25NT24xVnZTV1dZZGkxdFhBKzRtR2VG?=
 =?utf-8?B?TWozRlhSMzhLaGh4TlY4Z0F1R3B0QjYxRnVjVFJ5QWtudXJWVjcrRG1YQjky?=
 =?utf-8?B?M2s4dnNpZzFjdm0rSVMrSjVGb0lSd3Q1WlFVZDdrMHpmakxnd01nVjlza09L?=
 =?utf-8?B?WTBNemE4d2dBeVY2RzVZNUIvbGtlMFBQSDhMMU91Zm1tTWl4VDJVakRDa2ZV?=
 =?utf-8?B?Qk1hc3NJb0pQcUpmdjZaekNaa2EzUjB2Ymd3dTRTV2RRb2p5aGs4NnpJU3Z4?=
 =?utf-8?B?dEVaczg3T21KQ3hFZk5JUThtLzlCZmFCMW5tUlNndHBnbWQyaDFLRDNIZnpG?=
 =?utf-8?B?dGRHQ2RrYmJ2ZFZCTkVkY2lVWGVYSldPRjl5ZWV6aFVia0xLQzZrb1pOYzMr?=
 =?utf-8?B?VzNYS2NCOFh1aGU1MTZsbFlsSXVDWTBpQzByNVRHcFNTa1gxb2RpNkJlZUx6?=
 =?utf-8?B?c0ZHc1kvWGJQUmYvR0FjWWJheDFLMXlBV2Q3bU1xcEtoNG1DZWt5MUpIZzF0?=
 =?utf-8?B?UGVwdUdJNUhzYmE3RVlETVJnYU9iT2JtellkREVHUXRKZkxqQ04vV2pDaE5n?=
 =?utf-8?B?Q3NDVVp3bCtQbnRjVThWUjgvQ3dJMnMvOG40UWNFdW1xZVNnTk9JNVJ1ZG9I?=
 =?utf-8?B?V0tuZWh6NldUQ2YrbGtnZytBaHNMTjJML2NTbU1VTUhXWWs4aEdrTUkyVXBL?=
 =?utf-8?B?cUR4VVRyVU5zUzdUZ1BqRXM1d3VRdENSeFJnbEF0TTBldW9MTlNEcjFSbmpO?=
 =?utf-8?B?M3VBekZmMnRhV1p4U1J0cVRuZStob3F1a1pIZGl4a3NqOWN5ZFFLV2VoWWlu?=
 =?utf-8?B?TldObUVOMTRYS1R5QzhYZkczTldQb2M0NHViSEdubVUvSGZJekliVFJ5aFRv?=
 =?utf-8?B?Q2hlZDdRZnBJZkJTblI2Mm9qcGZnNzVUaWloOFR6YjN2QzdBdzAzVXZXa2pi?=
 =?utf-8?B?bjVaaVZPcmVPZTg5RUYzMkp6ZGR4M1ZhMDNnMUUzMGZXbjNPTDRuSy9mclZo?=
 =?utf-8?B?Wjk2M3pDSmVuSGNtd0lYbk1HZFk4TVFFdi9OVHVTcG9Nb1d0bFlTTkpEbmVm?=
 =?utf-8?B?M2ZNbE9qUXBsWkNUZVdGK0JZekdNL0RyU2pEbTd0VmpUV0FaVXR1S2NLMUsw?=
 =?utf-8?B?UTQ3SUNTYXY2YURJSElleXJnbUZYczZJU0ZmUi9RcTR4NFVtdmxVQ1dNWWo1?=
 =?utf-8?B?T3pLUmdoWDNUbUtld2Vwc1FrWnlSM2U3YU80UklSOVJneDhoZXBEYW1xMUM1?=
 =?utf-8?B?Snh1NVFWY3hnV0VQa3RLZTdvNDd1MjY2S3RBak8yVmYvb0MyMi9pZjl0NkRh?=
 =?utf-8?B?QnY4Q2RUZXZzMDFTZnhmdDFvZlJkdlNxejIzYmxTdlB4WWwxNmo4RmZoRmFL?=
 =?utf-8?B?WTVFZGE1aFlTdmlXQm9aMlNxR2lKVjZ2OGNubmliaHpEUzZyYXUwK3hNUmFC?=
 =?utf-8?B?N3hXemtQUHRnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REdkWlBQYjFZVHBrTlZNbzZlSFRXa1RzRExQY3BoZURhRFFsUEZIQTFMSjJO?=
 =?utf-8?B?RlVvN0gzanNBSFc5czZLUDlKcU52VllGYUo0K3ZCQk54a283aW13d0R1N2Jz?=
 =?utf-8?B?YW9BVGJXVHBIMXR5SlpZb1F5bktqSGllSEMyRkVTUHhmQ0ZOcFdJM2lyVkNR?=
 =?utf-8?B?MzcwYk16M25iN0R6Q2UraDJYYmNHaDRrYUZHTWREY0hoOGxqTjB3L2ZuK2Fi?=
 =?utf-8?B?VXJiZkp3WW9EcWplK3RHQnBSSHI4eGNvc05BNWw0UVFWaGVhZFhJQ1lFcmZ3?=
 =?utf-8?B?WFBEbm1IU3FxUldNVitZZHc1R0Mwd2JaTGZvSnpQM3kxY0Y2a3VteWVFdTdB?=
 =?utf-8?B?WDNrS3VQWW53YVlXVzB6NnlDYkJ0ZGcycGFINDkrdDExZ1NmOUxCSVpVcE91?=
 =?utf-8?B?UU9QQUpyOUFQQW1yM2c1WjhYS1FMTXE4U1N5ZE8rREhXeWl0Rk1sOXBqTFNk?=
 =?utf-8?B?WVFrTktENlFSOWhNalhlMkc3aGloUTR5eFplTzhnZVdBMVQraWprMWcyTjZU?=
 =?utf-8?B?TG9sclhNaHZGcjA4SWxtRUFVMXk4ZGRpOTB0djI0NmtCYjVlS0ZCOThDNjVi?=
 =?utf-8?B?OG5SZzUyeDhRbmNHenlRWUVtM2ZOaHhHRE9KUlRlU0pLRGo2WkRMVm9vN2RK?=
 =?utf-8?B?SFpGUW1ZU0thMjkvdGt1SlVVWmFWT0lnMWlBZU43QW13cmJhMFNiQ2JYZ3dN?=
 =?utf-8?B?SjRnZ1NHcHpUUkRMQkQyRzlmRU1tSnJnOGtlSFZFbDRVSDg0RGwyNGpDQnlj?=
 =?utf-8?B?TnBrVUxuWnZjZFh0WkVVUWlYYkxYWCs0TGpBSzQ1dXFHVGUrVGJYbFhzZ3ZT?=
 =?utf-8?B?b084TUlZM3dOQ1p1Z0NMRnpWaHE4aVZXSU9pdUZXZFdKdEpjd0lXaVRLM3VS?=
 =?utf-8?B?c2JvSXhreVdZVHRGUWY4dlZwbTdwaDBzeG9SSFJqTFdaZjVCbmo2TW0yTllz?=
 =?utf-8?B?R2lCTkIzV0pwZ1U1YkRQRWtzTUtSV1Y5Yk5iWGI3RTBack82c3BESFVCVlJw?=
 =?utf-8?B?RnBWN3ZtY2NSMjB6S3hZbW1iczNXR2xNTVBtV2pQaHYzNW9ndzlCZnpDcXJY?=
 =?utf-8?B?UUttVTFjdk1ZWjdCb3Z1WGpuS25EN2hwdGhBMmpmV1dNbUpoa1c0eXVtK2NV?=
 =?utf-8?B?a1JyOU4zMEZzdTQ4a2F5c2J5bjVXcnFaakRUbU9VUVZwSEppNFZHR3YrazVm?=
 =?utf-8?B?MnZ5QmcwNG1rZGdIZllweFEwb1NGTU5qaS9SbHE1R0RrLzlSckVFT2lCVUFE?=
 =?utf-8?B?MEIralZYcy9VbU8xNm43MmxJbG02cy9iMGlPVVEwLzFXZkovRUs2ZVYvUThm?=
 =?utf-8?B?M2JyMXM0bVVIUm5BUGp6bUxzcFliN0hlNW5VUGN2Y0lrSDhXZE4xeEx1eFVC?=
 =?utf-8?B?RWpURjlqaCtqdjcwOVIyNUROdDdFc29pRldITDBsbTd3VnpyRGNFemowUThq?=
 =?utf-8?B?N2ZwMkJJQm96eFc1V0M1Rjk1UkNKSzhYUFlxS0pnYnZVTkk4QVlhMUxPcEVi?=
 =?utf-8?B?TnFJT0RFL3Q3aWlhZ1VJMEw4VDVTK2pOS011bWxpcnNOU01vYTg1YUlSSzA5?=
 =?utf-8?B?YVlyaHptYisvS3NRdW5FWjhybk1TRXlITFhQOVhXclNlOTh1dVhrMzVVaXQ3?=
 =?utf-8?B?bStFQ0Q2TW5oMWxIUFdDRWd0Y01JaldBYUNQM2ZGRVV6NmR0Q3haQXFiSDdo?=
 =?utf-8?B?V0dmVG1nR2ptSURhVWh6Y2t4Wjl4REVIS3hPSHM1SGdwTGhneUNRYjZ0RjVB?=
 =?utf-8?B?TU9wV0VQVmN1ZWI4elF1eHhOUi9FZXVVSEpiWFFJNFMwbi9PK2tPdHpFbHFE?=
 =?utf-8?B?Vjg3bzZrdEE5eVJqUlBnV0V2N2hEY2k5NytPOGVldmZiZmZMMDEvQWJJQStw?=
 =?utf-8?B?d1hudXhrZ2xiRDFWQlVJUWp6Ry85K1Mxb3Nxb29tVkZwNjNTNVhoRjNWMlVx?=
 =?utf-8?B?WGd5UFAyUlFjRzVydVRmb3owK2NRV0xnR0s1cHRMVjJxL2VhSGM0SVFBV1pD?=
 =?utf-8?B?bFkzVHNrR2owYm1oVCtZZi9nWVVkYVFIMTZ0OVdqNElMbEF1TUk0VC9mV05F?=
 =?utf-8?B?WlJzbVBmWWlRKzFpNU9oczBnK0VjSys5M1dnSU9tVFFsWjV3b3A3YVJzNUtX?=
 =?utf-8?Q?8qsjxmNrmrTMmFaR5/kfKAs6p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13f87c3-2ab0-4b7b-a200-08dd811dd9cb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 21:45:36.6991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYdpKKonN/pcewJwKk3i19k4teOoPUdWrqlPEemqOFQWeD7k5hpBn4wAU0Gaw7tpTBh+zr71BkijGcgGOQ7kQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7636
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

Hi, Alex,
Just some documentation-type comments and one Rust-naming-convention comment:

On 4/20/2025 8:19 AM, Alexandre Courbot wrote:
> Upon reset, the GPU executes the GFW_BOOT firmware in order to
> initialize its base parameters such as clocks. The driver must ensure
> that this step is completed before using the hardware.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/devinit.rs   | 40 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/driver.rs    |  2 +-
>  drivers/gpu/nova-core/gpu.rs       |  5 +++++
>  drivers/gpu/nova-core/nova_core.rs |  1 +
>  drivers/gpu/nova-core/regs.rs      | 11 +++++++++++
>  5 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/devinit.rs b/drivers/gpu/nova-core/devinit.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..ee5685aff845aa97d6b0fbe9528df9a7ba274b2c
> --- /dev/null
> +++ b/drivers/gpu/nova-core/devinit.rs
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Methods for device initialization.

Let us clarify what devinit means.

devinit is a sequence of register read/writes after reset that performs tasks
such as:
1. Programming VRAM memory controller timings.
2. Power sequencing.
3. Clock and PLL configuration.
4. Thermal management.
5. Performs VRAM memory scrubbing (ECC initialization) - on some GPUs, it scrubs
only part of memory and then kicks of 'async scrubbing'.

devinit itself is a 'script' which is interpreted by the PMU microcontroller of
of the GPU by an interpreter program.

Note that devinit also needs to run during suspend/resume at runtime.

I talked with Alex and I could add a new patch on top of this patch to add these
clarifying 'doc' comments as well. I will commit them to my git branch and send
on top of this as needed, but Alex can feel free to decide to squash them as well.

> +
> +use kernel::bindings;
> +use kernel::devres::Devres;
> +use kernel::prelude::*;
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +
> +/// Wait for devinit FW completion.
> +///
> +/// Upon reset, the GPU runs some firmware code to setup its core parameters. Most of the GPU is
> +/// considered unusable until this step is completed, so it must be waited on very early during
> +/// driver initialization.
> +pub(crate) fn wait_gfw_boot_completion(bar: &Devres<Bar0>) -> Result<()> {

To reduce acronym soup, we can clarify gfw means 'GPU firmware', it is a broad
term used for VBIOS ROM components several of which execute before the driver
loads. Perhaps that part of comment can be 'the GPU firmware (gfw) code'.

> +    let mut timeout = 2000;
> +
> +    loop {
> +        let gfw_booted = with_bar!(
> +            bar,
> +            |b| regs::Pgc6AonSecureScratchGroup05PrivLevelMask::read(b)

Per my research, FWSEC is run before hand on the GSP in 'high secure' mode,
before the driver even loads. This happens roughly around the time devinit is
also happening (not sure if it before or after). This FWSEC is supposed to lower
the privilege level of the access to 'Pgc6AonSecureScratchGroup05' so that the
register is accessible by the CPU. I think we should mention that here as
rationale for why we need to read Pgc6AonSecureScratchGroup05PrivLevelMask first
before accessing Pgc6AonSecureScratchGroup05.

Here we should say we need to read the GFW_BOOT only once we know that the
privilege level has been reduced by the FWSEC

> +                .read_protection_level0_enabled()
> +                && (regs::Pgc6AonSecureScratchGroup05::read(b).value() & 0xff) == 0xff

I find this Rust convention for camel casing long constants very unreadable and
troubling: Pgc6AonSecureScratchGroup05. I think we should relax this requirement
for sake of readability. Could the Rust community / maintainers provide some input?

Apart from readability, it also makes searching for the same register name a
nightmare with other code bases written in C.

Couple of ideas discussed:

1. May be have a macro that converts
REG(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK) ->
regs::Pgc6AonSecureScratchGroup05 ?
But not sure what it takes on the rust side to implement a macro like that.

2. Adding doc comments both in regs.rs during defining the register, and
possibly at the caller site. This still does address the issue fully.


> +        )?;
> +
> +        if gfw_booted {
> +            return Ok(());
> +        }
> +
> +        if timeout == 0 {
> +            return Err(ETIMEDOUT);
> +        }
> +        timeout -= 1;
> +
> +        // SAFETY: msleep should be safe to call with any parameter.
> +        unsafe { bindings::msleep(2) };
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index a08fb6599267a960f0e07b6efd0e3b6cdc296aa4..752ba4b0fcfe8d835d366570bb2f807840a196da 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
>      pub(crate) gpu: Gpu,
>  }
>  
> -const BAR0_SIZE: usize = 8;
> +const BAR0_SIZE: usize = 0x1000000;
>  pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
>  
>  kernel::pci_device_table!(
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 866c5992b9eb27735975bb4948e522bc01fadaa2..1f7799692a0ab042f2540e01414f5ca347ae9ecc 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -2,6 +2,7 @@
>  
>  use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
>  
> +use crate::devinit;
>  use crate::driver::Bar0;
>  use crate::firmware::Firmware;
>  use crate::regs;
> @@ -168,6 +169,10 @@ pub(crate) fn new(
>              spec.revision
>          );
>  
> +        // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
> +        devinit::wait_gfw_boot_completion(&bar)
> +            .inspect_err(|_| pr_err!("GFW boot did not complete"))?;
> +
>          Ok(pin_init!(Self { spec, bar, fw }))
>      }
>  }
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index 0eecd612e34efc046dad852e6239de6ffa5fdd62..878161e060f54da7738c656f6098936a62dcaa93 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -20,6 +20,7 @@ macro_rules! with_bar {
>      }
>  }
>  
> +mod devinit;
>  mod driver;
>  mod firmware;
>  mod gpu;
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index e315a3011660df7f18c0a3e0582b5845545b36e2..fd7096f0ddd4af90114dd1119d9715d2cd3aa2ac 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -13,3 +13,14 @@
>      7:4     major_rev => as u8, "major revision of the chip";
>      28:20   chipset => try_into Chipset, "chipset model"
>  );
> +
> +/* GC6 */

GC6 is a GPU low-power state. The VRAM is in self-refresh and GPU itself is
powered down (all power rails not required for self-refresh).

The following registers are exposed by the hardware unit in the GPU which
manages the GC6 state transitions:

> +
> +register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;
> +    0:0     read_protection_level0_enabled => as_bit bool
> +);

This is a privilege-level-mask register, which dictates whether the host CPU can
access the register.

> +
> +/* TODO: This is an array of registers. */
> +register!(Pgc6AonSecureScratchGroup05@0x00118234;
> +    31:0    value => as u32
> +);
> 

These are always-on registers always available including in the GC6 state (which
makes sense since we need to access it to know if we are far enough in the boot
process).

thanks,

 - Joel

