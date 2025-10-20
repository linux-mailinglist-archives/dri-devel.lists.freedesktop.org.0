Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6282BF3C8F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 23:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0499510E09D;
	Mon, 20 Oct 2025 21:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kPbTvN9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013070.outbound.protection.outlook.com
 [40.93.196.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DAB10E09D;
 Mon, 20 Oct 2025 21:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tlojf1QQh7Dn0yJOTEYdU/2nIYh5iO28VyLshhVJ3vZeSGsEehgbSLRdNCXwx+46ZN/ahwRBbBZv4CYvxZ/jEHmJCgwJ/NPfu6rCvqK5NeoK5Wz/hGF5+D3q0l73SrOnfOLFwngpYGk5PXIuWlqDqkT6jLFq+zXkY7GAGzRBwEyz24PMI4xKwkwdjy7pKL8y5cVWFtdbHEqmj7TcaljcslFiH0ee7ZbocCtbOv9CKFl1CHj+/0jc4ErCV0lyomYZPET40myjil2VFoYcM7hq5IPPBsoOBQeXdRfGRUxaWnWw5MEPswvCAc7CzjGqa2496zboXZ6KRjXyJ5sLA3wMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wd31BwfTQw5IMnmuZHqDHfV3mCuUo5WiTbR1YQZhZyw=;
 b=LtLKINqq8u/KmiHwI1sHJUFacDkwyy6LKb2w/qYdeMNzFCnWjkx2l/vYZd2Xmf6TkIGNXVkM7c/N9h+Yj2ccJsZD4SXsxPjZzPq8aFqnpVcIv4ujdEyMsLCw5GHgUg+y5Ge/3k91TFMh1OWGwqtDKWPqe+/Hvl1i6yWoaxUn44fL5cgUWg92NTIGrgme5dm/y/C+xB4YgEHQ5+W/7qyNS+cJ+phUqFx6nSgsixfMR/3Qb5fU2GgXkkAy5KerFuxhrw9spF2dbKOMUqBUA+W0xKabc1OfZhHwc0nz0XDJGVTPid58U5+IyL6jVODjqXn5HA+1e2VVL7d4Zj6lbQs9lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wd31BwfTQw5IMnmuZHqDHfV3mCuUo5WiTbR1YQZhZyw=;
 b=kPbTvN9pjEowaMIcLjI5/3aRYbg02ALZCFkHl4dgyP8ovbst0kbKvCflp5Ozyd7PaC1s1S9z0oLBbMA0AiZismlK33OW9At6qXSNl7S2r49Xqqb1YDMV/Q3oeDFZ1nBix1plYrt93+Lb5I0Cfv1EOXmNlIfhYAT5sx1G+DONBlRbUCWds8XLRG7mLpncDwUSeOI+cuI0ht0mSB3v7teI/0xYhBvNhopT3dY4fYu4cm7kzKoe8UCZezc/cR7QgOXsV86o/h+GeqcdxIOTftiDvcKoO+urHABpiyN1s15zEv+odq+hnr3RPBhyURF2HuVCYzzgVigldJHgpHQXfIcHMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 21:49:26 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:49:26 +0000
Message-ID: <c62474ef-ace4-4aa0-8dec-53cc52b7344c@nvidia.com>
Date: Mon, 20 Oct 2025 14:49:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] docs: gpu: nova-core: Document GSP RPC message queue
 architecture
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-4-joelagnelf@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251020185539.49986-4-joelagnelf@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0077.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::18) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MN2PR12MB4221:EE_
X-MS-Office365-Filtering-Correlation-Id: 62939df4-4fe4-481f-8415-08de102289dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bi91eWVYbEt2eGk1NVArTEk4Tk9GL0Z3K2Q1SmFLbTlNOFM5OURLbjYrVFVD?=
 =?utf-8?B?b0V6UTVtTXo2Q3VrcE5WSEVTcGV0QTlDczVwb0JNOGdpZnhIOU1ienNVSk1l?=
 =?utf-8?B?cCs0U1V3bmZrcGp4cllCanJuTFBMR0pXU0d4UTBqazZ1aUp1NXRyZHhYMDNq?=
 =?utf-8?B?THNGM1hLaWhPMFZSbWdBRzBDNE10THN4YXU5d1VEc3grSmx5ZHVxYlFOV1d3?=
 =?utf-8?B?SXFVcG5SQjdIVlliZmh6VjZjUWNOSGo2ZjM5cGxoV0hESnRja0kvUnVoek9L?=
 =?utf-8?B?b01Pb2RKNTVxSDFCaWJZUHQrSlBrdndVMFRZY0VydTYrZmZlcHZ3b3daZWRx?=
 =?utf-8?B?U2M1bjdzOWtnODJNUFJqN09tc2lHRGVKVzhOV3RKV21YTGU4WEJiSDNPVlBJ?=
 =?utf-8?B?b091c3czV1BVbnRFVU9tdzJNOEZOT3NhcG1mdVduaTlLRG5hSy9lSEV6U3lS?=
 =?utf-8?B?Uk84a0tyTUJiSkdpZUs3VFZhQ3E1eVNHemJpU1dKa01mTDQ3ckJKaFkvSUJE?=
 =?utf-8?B?eENtWlFqeDVqUUpqZE9ZRjJWbXEwTU1xUE1rV0NFTHN6QVhGdHNUOU1IRXJ3?=
 =?utf-8?B?SitsdCtZUTZYR3NKeU02Z0ZHSXdRcVpCaExMSzBBNnBJNDJZaGdBdXJnS2VH?=
 =?utf-8?B?a3J0VkhlTzFGUUpXbDN3OUtROTZ2d3llWjkwSFRlSFZPbGlMSjBVZG5uZysw?=
 =?utf-8?B?ZWZxL1U1TkVLS2lPb0l0dDVvMTdvTDdSa0czTG4zOW5DNHpSV0VQTkZkb1dl?=
 =?utf-8?B?OTdOT0lMUGJzSWZCaWtTa21hdmo4R1hmU1N3Q3lJdUJNemNvVExYdFF0SCt2?=
 =?utf-8?B?dTJmRHRiZU5pcmJsSGhDMGJBelJLVWdDUTFUVzZJeFc1QzYrODdHdFhFQnd2?=
 =?utf-8?B?d0FJenFTZEVST3F3aEt4YlhXMWFQOTJtVmQ0dGk3OEJPbnpJZkwyaG1GTjFX?=
 =?utf-8?B?b3FwQjY0em1iUXBUSHFzRnZNWWhTV0x1WCtXY1dpN0VlMUM4TVdNTFVCYnQ3?=
 =?utf-8?B?Q1JLcmhUNzVhb0k2U3UxMlJnUzUzeEtITmVLdXdydENGMGNtMHlkZUxyUHBO?=
 =?utf-8?B?YWpwQVg2RjFYSTdBSVZITG9YNUcrd1o4dnhiWmZKa0pEenBjK1N4R2JhdU9O?=
 =?utf-8?B?TE40ZzVCa2w4L0laZGUwNlpsOGxGVTRJVWVWU0hidFdRMVFCWjAzZEN4ZHFW?=
 =?utf-8?B?VFBTa1Z6QUJmSnJIQ2VLVnVGZ0JpKzRlYVQ2VkozcUVFMUNLeEN2R2h2djR3?=
 =?utf-8?B?clFOSHppVFR1ZktVd0dHUXVNQ0h6emd1dlI1NGhzRmJzaTNWZmdLK3JMVkNC?=
 =?utf-8?B?UWtJaldJV1lTWmdkKzZyQTVjNjNZRlJCbEVjd1JnSGZuOVltMzVBbkMrczFw?=
 =?utf-8?B?Z1JkNkora1gxcGNaUWY1L0VvRjhSdE1lOVZyaERCNlEyN1FTeDZoNTdOcVZN?=
 =?utf-8?B?cmIyOXBVWktOcUF2MGVqRFcxdnFhK211UmU2V0tjMlowOGdRTHhMQS9ET3E0?=
 =?utf-8?B?ZHJ6ZGg4VnRYaDJQMzlDVmh6ZEQxMkFMNXN3SlFTRTRCSUZtZUNoMmxvbldB?=
 =?utf-8?B?SmdSendROGlnenFvaTdiMjlmS1A0cEEwZkxyaE9QNnlqamhvOWxqMTIzVTlT?=
 =?utf-8?B?TElFa3NXTTZ2QVgydVBES1dOaTlVZU84NDUyRkR5S3dHSVNxN2QrOCsxRHVB?=
 =?utf-8?B?UkU2Uk1rUGlmZlhRVzNHNkJjcG9VczhlZkNDMzNYNVZhaG9KR1k1N2JNdC9J?=
 =?utf-8?B?Y2NiM2IrNDVtQURCbGtMSFNRL1hCYWFIaStTdGx1bUpwbWRCaXI5YWVIcGhs?=
 =?utf-8?B?MFAvblJ1ZlZ6dWxsL25hMnhoZnB4VU1XWmpPdzFPT0tTQ205QU5ZUWpnSnJI?=
 =?utf-8?B?UnlOWGxNY1FWUEE3R3BxdlZYVkJuRWpyMXlqYXo4a04ySjlTa1pSTXNrWUFr?=
 =?utf-8?Q?NOrqc/6F//ZeiovbfKB/AQ3yhQ3tTHmG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enNRbTh4UEY4MjB1T3QzUVNXcFFnbkhwZ1daRFovT3QrMnUrS1VxbnZZcWxU?=
 =?utf-8?B?WGZucHRSNjN2OXJMbEJQZm42YnQ4UkpXSFphL21pOFdpell3UVp4ZGlKSWQ3?=
 =?utf-8?B?b0tnY1JyRVk2YWFGQXErejZSQjMxcHBxck5ab1lvWWRiY3lOa1Jxdyt4aE5j?=
 =?utf-8?B?VVdoZzVlTUJLanczaGlLM1R1cXBCZ1FoNWJ0ZHdjM09PSzMwTEdEd1MvRjZP?=
 =?utf-8?B?T2FCeFhMNGdGMWZQZmZmaWpqTC9LS0k4Yy9EMzluNjFJeXJaQU0wNFh4NlFY?=
 =?utf-8?B?VnRQSm9NM3hIeEJVczI3TUhudU5qbXRjRnMwUFZtS3FoNUFUbGp0T0VFaUFX?=
 =?utf-8?B?czVVekxOQTVxMWsxSlZYN0NHT3dDOGJJdWRZWSthU3ZzZFcxcTFlL0haV0di?=
 =?utf-8?B?M2JIRmJKMWdFNXBzOFdWYmk0ODJhTXZmQmFBWHY2TjdGLzVDZmtDRzFDVGp3?=
 =?utf-8?B?SXEvN1V3ZHNkbnVYanQ0QTE4Mlh6N244UjFUTjI5ODZBWHpwSVNnbXovSkU4?=
 =?utf-8?B?QjBMM2lhVVEzQTB6TkE5MkI2a3dlbFNmT3B2eHBoaDN0N0x4STN6QThwZEUy?=
 =?utf-8?B?c2FzeEZJWlZ0cnlTWkY4RG96K3FvaU1MK1ZGNW9YeFJLY3BSa29aZVFaNG5Q?=
 =?utf-8?B?clErWkhEdEN4VFR6U2YzalBFYVBQOVlKLzYzUTNvUHM2VzdBZjBiQnhYTEZR?=
 =?utf-8?B?UXNGWXlFKzQ0QmoycVBzWUNidzlTWTBsSlhzcVhXd0d0Ui9zanNIQ1h2UVlz?=
 =?utf-8?B?bDdVNDlqeFMrZXZtN09RZU83THRubXp4ZzBISXFhdFlQU3hkZGtXZ25ZS0Jw?=
 =?utf-8?B?MnhGSEZzYlVUYUR1SW9MMnk0TjFMVTh6TmwvMGdFTEpwNzlaeC9tZTE0Kzdi?=
 =?utf-8?B?OUxSWGh3S2ZDaTlEUGtxdWRMU1ppOGt6U3Rudzdwcm5xeFNXYktUT1lXaGc5?=
 =?utf-8?B?N25kaUpmZmRWUFJjbWg1aXZIWjRaakVOL0tWQzBrZFRRUEJqNUtXRzdqWlNu?=
 =?utf-8?B?eUhrK1YxcThzcUY1M1hiMUZOODJVd01Bb1V1QklzWmNLWWtWc2ExWGYrdk9O?=
 =?utf-8?B?QlN4ZGpHcXFGeXRyVHpYQ1hPTmZvMlVJZ1BBdWZpUUFhd0lKUldwYndyc1o3?=
 =?utf-8?B?Y25uUENmOElSMzVVRjhKeW82N3F0aVRhdUN4YllSR29xeithcmZxLzhhSXk0?=
 =?utf-8?B?MlJneUllaExWRjFCR3I4Ym1xSndqMzk0UnBEL2xHZjFYeFpNa1FVeWNuVTVi?=
 =?utf-8?B?WStkc3BxaFVpRXJPYzR2SkJBeW9odXcvd29ZaTZJT3p6NWQ1L2ZvWFhySTBL?=
 =?utf-8?B?MVlRWThiTXppekwwMFdmb3NwSWhIWURIazRhUCswMjd5aUVOUER4ZW9KWDh3?=
 =?utf-8?B?NGZ0K2dCNEYzVzZ6SG9aSE9GcXBtN0dSS2dQWFBkMG1QV0g4eFNFMnRxMHdl?=
 =?utf-8?B?TDI5cGtiNytyNG54RGdlMnA2SUcycnVrQ3pOS2VneFB2NXNTdFpIdUZ6VjZp?=
 =?utf-8?B?SXNCVHowK09sUGQ1NUFVQyt6RWZYS1R1VmRkQ2kxZjRSdG9yZzNUTFhEanlU?=
 =?utf-8?B?VkFJb3Qrb2tUcnlDcDVjRFhFeDRaczNoWjBJYVBPK3d1TmxpR252UThPSzQw?=
 =?utf-8?B?eTRRU3J6dEg0dk9HVHcxdGhWRHFQVDhRMUpueU9DczA1bDI5ZU1pSW8vNGg3?=
 =?utf-8?B?bURZelE4YWJ5STllL0d4SzRScWM1bVFEM2F3dllkaFZTbkhnNkVMalFQZ0Q3?=
 =?utf-8?B?d3lXU0pNbkNtcS8zRzhXMGROdlgwcjRjcE41cGdqYXNUampaUUdkMFRmRjdI?=
 =?utf-8?B?NFJZNmI1dFMzM1pjOEt5d0VNMmlxUndzbTcyY3ArUlRYUDl6TC9SR1U5MHVm?=
 =?utf-8?B?SDJranUrK3lscTFraVN0Vyt4Y25DWFdWVFU3eHBpbkZ1N24zVzZKUUlBOGsw?=
 =?utf-8?B?L1hNZGRTZ3B1Z0lHSFBURkFRckdjVWNuWmlFWkNLTWRoWFBZakJnVWNHaDdT?=
 =?utf-8?B?QkZ4d3hzZnk1QzB2YmhzT0xWMkVNTkhVZFpHcFEwcFV6WUQ5TU11eDJ5ZkdY?=
 =?utf-8?B?NGFIUjZadnMzZ3RNaFlJemsxT2NadXdBR0FxVE1BRG5GVG0vK2hLT3JqMVh6?=
 =?utf-8?Q?AQF/gbLOPXKV7oioR+qE+fks8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62939df4-4fe4-481f-8415-08de102289dc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 21:49:26.2361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsEqd8aWbH6LdgVTwAPOPGhBayIg6PMw4Wk5nfZlQbC/Hgnt2PCvKgxpR5yZvMuYsRc95iwlrLClczCfHCNF7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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

On 10/20/25 11:55 AM, Joel Fernandes wrote:
> Document the GSP RPC message queue architecture in detail.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---

Hi Joel,


>  Documentation/gpu/nova/core/msgq.rst | 159 +++++++++++++++++++++++++++


Can we please change the file name to approximately something like
message_queue.rst? I'll buy you a few extra characters. :)


>  Documentation/gpu/nova/index.rst     |   1 +
>  2 files changed, 160 insertions(+)
>  create mode 100644 Documentation/gpu/nova/core/msgq.rst
> 
> diff --git a/Documentation/gpu/nova/core/msgq.rst b/Documentation/gpu/nova/core/msgq.rst
> new file mode 100644
> index 000000000000..84e25be69cd6
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/msgq.rst
> @@ -0,0 +1,159 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=========================================
> +Nova GPU RPC Message Passing Architecture
> +=========================================
> +
> +.. note::
> +   The following description is approximate and current as of the Ampere family.
> +   It may change for future generations and is intended to assist in understanding
> +   the driver code.
> +
> +Overview
> +========
> +
> +The Nova GPU driver communicates with the GSP (GPU System Processor) firmware
> +using an RPC (Remote Procedure Call) mechanism built on top of circular message
> +queues in shared memory. This document describes the structure of RPC messages
> +and the mechanics of the message passing system.
> +
> +Message Queue Architecture
> +==========================
> +
> +The communication between CPU and GSP uses two unidirectional circular queues:
> +
> +1. **CPU Queue (cpuq)**: CPU writes, GSP reads
> +2. **GSP Queue (gspq)**: GSP writes, CPU reads
> +
> +The advantage of this approach is no synchronization is required to access the
> +queues, if one entity wants to communicate with the other (CPU or GSP), they
> +simply write into their own queue.

How about this:

The advantage of this approach is that no synchronization is required to access the
queues. If one entity wants to communicate with the other (CPU or GSP), they
simply write into their own queue.


> +
> +Memory Layout
> +-------------
> +
> +The shared memory region (GspMem) where the queues reside has the following
> +layout::
> +
> +    +------------------------+ GspMem DMA Handle (base address)
> +    |    PTE Array (4KB)     |  <- Self-mapping page table
> +    | PTE[0] = base + 0x0000 |     Points to this page
> +    | PTE[1] = base + 0x1000 |     Points to CPU queue Header page

s/Header/header/

> +    | PTE[2] = base + 0x2000 |     Points to first page of CPU queue data
> +    | ...                    |     ...
> +    | ...                    |     ...
> +    +------------------------+ base + 0x1000
> +    |    CPU Queue Header    |  MsgqTxHeader + MsgqRxHeader
> +    |    - TX Header (32B)   |
> +    |    - RX Header (4B)    | (1 page)
> +    |    - Padding           |
> +    +------------------------+ base + 0x2000
> +    |    CPU Queue Data      | (63 pages)
> +    |    (63 x 4KB pages)    |  Circular buffer for messages
> +    | ...                    |     ...
> +    +------------------------+ base + 0x41000
> +    |    GSP Queue Header    |  MsgqTxHeader + MsgqRxHeader
> +    |    - TX Header (32B)   |
> +    |    - RX Header (4B)    | (1 page)
> +    |    - Padding           |
> +    +------------------------+ base + 0x42000
> +    |    GSP Queue Data      | (63 pages)
> +    |    (63 x 4KB pages)    |  Circular buffer for messages
> +    | ...                    |     ...
> +    +------------------------+ base + 0x81000
> +
> +
> +Message Passing Mechanics
> +-------------------------
> +The split read/write pointer design allows bidirectional communication between the
> +CPU and GSP without synchronization (if it were a shared queue), for example, the
> +following diagram illustrates pointer updates, when CPU sends message to GSP::
> +
> +    +--------------------------------------------------------------------------+
> +    |                     DMA coherent Shared Memory (GspMem)                  |

I think it would help to do this:

s/DMA coherent/DMA-coherent/

> +    +--------------------------------------------------------------------------+
> +    |                          (CPU sending message to GSP)                    |
> +    |  +-------------------+                      +-------------------+        |
> +    |  |   GSP Queue       |                      |   CPU Queue       |        |
> +    |  |                   |                      |                   |        |
> +    |  | +-------------+   |                      | +-------------+   |        |
> +    |  | |  TX Header  |   |                      | |  TX Header  |   |        |
> +    |  | | write_ptr   |   |                      | | write_ptr   |---+----,   |
> +    |  | |             |   |                      | |             |   |    |   |
> +    |  | +-------------+   |                      | +-------------+   |    |   |
> +    |  |                   |                      |                   |    |   |
> +    |  | +-------------+   |                      | +-------------+   |    |   |
> +    |  | |  RX Header  |   |                      | |  RX Header  |   |    |   |
> +    |  | |  read_ptr ------+-------,              | |  read_ptr   |   |    |   |
> +    |  | |             |   |       |              | |             |   |    |   |
> +    |  | +-------------+   |       |              | +-------------+   |    |   |
> +    |  |                   |       |              |                   |    |   |
> +    |  | +-------------+   |       |              | +-------------+   |    |   |
> +    |  | |   Page 0    |   |       |              | |   Page 0    |   |    |   |
> +    |  | +-------------+   |       |              | +-------------+   |    |   |
> +    |  | |   Page 1    |   |       `--------------> |   Page 1    |   |    |   |
> +    |  | +-------------+   |                      | +-------------+   |    |   |
> +    |  | |   Page 2    |   |                      | |   Page 2    |<--+----'   |
> +    |  | +-------------+   |                      | +-------------+   |        |
> +    |  | |     ...     |   |                      | |     ...     |   |        |
> +    |  | +-------------+   |                      | +-------------+   |        |
> +    |  | |   Page 62   |   |                      | |   Page 62   |   |        |
> +    |  | +-------------+   |                      | +-------------+   |        |
> +    |  |   (63 pages)      |                      |   (63 pages)      |        |
> +    |  +-------------------+                      +-------------------+        |
> +    |                                                                          |
> +    +--------------------------------------------------------------------------+
> +
> +When the CPU sends a message to the GSP, it writes the message to its own
> +queue (CPU queue) and updates the write pointer in its queue's TX header. The GSP
> +then reads the read pointer in its own queue's RX header and knows that there are
> +pending messages from the CPU because its RX header's read pointer is behind the
> +CPU's TX header's write pointer. After reading the message, the GSP updates its RX
> +header's read pointer to catch up. The same happens in reverse.

What do you think of this alternative wording:

When the CPU sends a message to the GSP, it writes the message to its own queue
(CPU queue) and updates the write pointer in its queue's TX header. The GSP
checks for pending messages by reading its RX header's read pointer and
comparing it to the CPU's TX header's write pointer. If the GSP's read pointer
lags behind, messages are waiting. After processing each message, the GSP
advances its read pointer to acknowledge receipt. 

For GSP-to-CPU communication, the roles reverse: the GSP writes to its queue and
updates its TX write pointer, while the CPU monitors its RX read pointer and
advances it after consuming messages.


> +
> +Page-based message passing
> +--------------------------
> +The message queue is page-based, which means that the message is stored in a
> +page-aligned buffer. The page size is 4KB. Each message starts at the beginning of
> +a page. If the message is shorter than a page, the remaining space in the page is
> +wasted. The next message starts at the beginning of the next page no matter how
> +small the previous message was.
> +

Error Handling: The document doesn't mention:

a) What happens when queues are full
b) How message corruption is detected and handled
c) Recovery mechanisms for communication failures

Performance Considerations: It would be helpful to add:
a) Why 63 pages were chosen for each queue
b) Typical message sizes and throughput expectations

> +Note that messages larger than a page will span multiple pages. This means that
> +it is possible that the first part of the message lands on the last page, and the
> +second part of the message lands on the first page, thus requiring out-of-order
> +memory access. The SBuffer data structure in Nova tackles this use case.

I don't think SBuffer has landed in the kernel, nor in the pre-requisite bitfield
patchset, yet, right? We could replace that last sentence with something like
"TODO: show how the upcoming SBuffer data structure helps with this use case".


> +
> +RPC Message Structure:

Let's remove the trailing colon.

> +======================
> +
> +An RPC message is also called a "Message Element". The entire message has
> +multiple headers. There is a "message element" header which handles message
> +queue specific details and integrity, followed by a "RPC" header which handles

s/a "RPC"/an "RPC"/

> +the RPC protocol details::
> +
> +    +----------------------------------+
> +    |        GspMsgHeader (64B)        | (aka, Message Element Header)
> +    +----------------------------------+
> +    | auth_tag_buffer[16]              | --+
> +    | aad_buffer[16]                   |   |
> +    | checksum        (u32)            |   +-- Security & Integrity

Can we say anything useful here about:

a) What authentication mechanism is used
b) How message integrity is verified
c) Whether encryption is employed

?

> +    | sequence        (u32)            |   |
> +    | elem_count      (u32)            |   |
> +    | pad             (u32)            | --+
> +    +----------------------------------+
> +    |        GspRpcHeader (32B)        |
> +    +----------------------------------+
> +    | header_version  (0x03000000)     | --+
> +    | signature       (0x43505256)     |   |
> +    | length          (u32)            |   +-- RPC Protocol
> +    | function        (u32)            |   |
> +    | rpc_result      (u32)            |   |
> +    | rpc_result_private (u32)         |   |
> +    | sequence        (u32)            |   |
> +    | cpu_rm_gfid     (u32)            | --+

This shows field values but doesn't explain:

a) What "signature (0x43505256)" represents (appears to be "CPRV" in ASCII)
b) The purpose of cpu_rm_gfid field
c) Valid ranges for the function field

> +    +----------------------------------+
> +    |                                  |
> +    |        Payload (Variable)        | --- Function-specific data
> +    |                                  |
> +    +----------------------------------+
> diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
> index e39cb3163581..46302daace34 100644
> --- a/Documentation/gpu/nova/index.rst
> +++ b/Documentation/gpu/nova/index.rst
> @@ -32,3 +32,4 @@ vGPU manager VFIO driver and the nova-drm driver.
>     core/devinit
>     core/fwsec
>     core/falcon
> +   core/msgq

thanks,
-- 
John Hubbard

