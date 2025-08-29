Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9267B3AF21
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 02:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E9A10EB0A;
	Fri, 29 Aug 2025 00:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gOobT0kd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600A110EB0A;
 Fri, 29 Aug 2025 00:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9y8QYgzlLDqWLj4qpExhAy1+9sG/1/riJTwCKQGYXRQE+2GKqZJoVlTmwJ/k2zihZMBsp9maoykppVNg22Vx2khLHMEIrzbVClh4eNxLZKaDCzpz901HMeQQenI9TjVWopGMwWukpDsXiFF6KdNlvkMg6qk438SGlVUyR/8maNEk8JOiEVs2o7EHzSnn4vHvFA4Mv5kDYrK5sPGL6hj+EGu0tisdu9G/fmRpIjP0Po38x4/EMOnD+HYu5TdSILUJ1IbTabCWTnwix8C2xfm0nfmAyzAq8BmQKi7PRqj5I+4qRDjYy/DSRadswtGxi0dH22/3qskP1OI4cMBOe+KJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6iQudaJu3jdKCgzQAhTIMVk9impPFhlbRL6rq/6J6Q=;
 b=YGoYEt0QRCDqxjhUHQR8W3kfkOgCa++tdcIA7loZFIAMIfj+A62Ox91JzYJ3FQI6kHM8AMDSMcASOEMhCUFwc1EXe9bFStb87yD1O30zTDTbrkOsgsGBG6sU9CCSrl1D6EBTwVi+3DuIUHcKJ9B6Jr5BpFwb4rjwyz+MXvL0klrZXWCVddqB7yo7l2JNYIBNkFQ09//dI5iHqNGe+Qo4jwTkgVfCWoz6oVUU2Lq0Fyk+A2NUd6UaT+YP69khw22FzLSWy3bngos/ZSV5D36cbcp88TI1ncW3OMnJycajYGHXUrxjaEiNPNynnoPBkg92t7CKK2ItT5GO6wAGK3OFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6iQudaJu3jdKCgzQAhTIMVk9impPFhlbRL6rq/6J6Q=;
 b=gOobT0kdYfmLk0wFFpuI2Gj6UzdQDUgbGjr0BTWk2QVdxvMRQTyscolRsHJPevsvL/LgKZRCOVS3F021AH2aDRAljTQFXon3KA/QQRGbzczFwjIxHVmIZFh851cURYB7E+UxyEIix+LEMOikLPo01CdQ6dODSwEdJx8fyU3eNwDq20BQ824rbv+PHyGkLo2ivPSVGt+UdOLXjm7VKxN380Hd5jvkm/APYlYGnFncXr7OhWb/FBLpSxuUNt1emfT41y0PXs5fX28eCwV2MnnTGo0oJPgZkgiLPOBmw9hgDsN0YN0Go/gPWGWsH7eZcL/aVbIKYpPT0Q0xrDVd2STC7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 00:27:26 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Fri, 29 Aug 2025
 00:27:26 +0000
Message-ID: <884ce684-9993-4880-bd3c-42a8fec5c435@nvidia.com>
Date: Thu, 28 Aug 2025 17:27:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] gpu: nova-core: firmware: process and prepare the
 GSP firmware
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
 <407bf89c-0488-40e4-91f7-440610b6a906@nvidia.com>
 <DCE0M4NY29YA.K4IX71XOHF4C@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DCE0M4NY29YA.K4IX71XOHF4C@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:a03:505::8) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3f1249-8985-4f02-23e0-08dde692d4ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3hTTTlWNit0U3J5K1Q1aDROdzlMQU0yc0hpZURQVS81T05FT3VpalpEM1I0?=
 =?utf-8?B?OEJCd1NqUllSdjROdmRCTElTdVVjZVpERmJTWmZ3L3RQdVRoUUhNa2FRdGx1?=
 =?utf-8?B?VkJqRjBML0pRL0JNNzVxME5ZMXhGWnR4WDZzM3RBZjBKWm11Z0xQWVZMNmlH?=
 =?utf-8?B?OXovV2FWMWNpVHJxdlJ5aTNsTzRhRTRMS2dpRjhYNEg0a1hIako4blY3SUFv?=
 =?utf-8?B?bkNSL1NyR2tOTnZKb3RQekRIRjdLTGkzUHB1TTJ2dDdnc1VjYWxhaFBNZ3BG?=
 =?utf-8?B?ZE5pdGUzbEhkSVNrcXRBOTRXZ21sNDBJc0VqMVRJN2plUEZiY0lwVTEwVVNi?=
 =?utf-8?B?c1FqU3c3MlYrQUJvSGhFVGNIeUNTU1E5TWlHUjdNb1hiaGNnLzRqNzNGQzE1?=
 =?utf-8?B?M3BPVDBrREVrSlhVTmJ2UjBHL09LNnVRWFdKNG5NbWcvdlVKRzVaK1BOZnJV?=
 =?utf-8?B?Y3dOUHhjR3BiQ29RWEE0NEpjdTlHVmJHYXpPSWF3YkFoMVY0MXNRUlhIenRK?=
 =?utf-8?B?WTlXZUVwb1lPMFFHYi9LY1V5cGFGMDY5TmtXcGFWTkxsQTNPeFpFSm9xa1N0?=
 =?utf-8?B?NkhLZmpYdmwwbVdnbkZKUk8wZVVlbG5CSEhJM3kvdlZicy9maDhoQS9vY3pL?=
 =?utf-8?B?RW1lVU1wcTdTc1BrT29yVHpwNHFUTnIyOUdXc25LM0dOQVR4Q1o3VkVKZzV3?=
 =?utf-8?B?WUFXUzRnNHlNeWpZcm5XeHc3QVBPeGczcDN4YkNBWjJPU1NHbzVwdDNuOXBx?=
 =?utf-8?B?NFVPRFUxNmg0cUlCZUIvaXZ1VSsySTFJZDRpUHcvdHkxamlNc0ZxanEvMC95?=
 =?utf-8?B?N1NWdHArWUxOVEU4b2VhSDRSYTNnZHlZbTJNOXJHSVFUSHJtbzBvVEhvd2JJ?=
 =?utf-8?B?aDJlR1RmYjBJTjhLMjdWY1pDbmlhWHROc1RJaUhlRzRXL3ZjclNqQlpiN1B5?=
 =?utf-8?B?VnZVNHV2c0xnUDE4WTJCYkV5TnlvY25aeXpxMGtxVmhlckphSWNCUU4xSTh3?=
 =?utf-8?B?TDZuOGkrSUloTzBXYytIc3M0OWM0eHV1TWNUM3VkRTMvcElZUEI5cncrdTJE?=
 =?utf-8?B?ZEZRUVYxOGYwME9ISTN1NlZBSlg3UEk5RHNSazJsUThvaDhLcFV4SWo4OFQ2?=
 =?utf-8?B?b3RqSG1LeENQcE1DelBTTUV6cCtYK3JaNG9YaUx2a1VTTWowdUZVcy80ZEx1?=
 =?utf-8?B?c2w2UDRvTTJ4ekdwMkQyODU1SDdmWlhIRHArSGkyMXV1bDFMeFE3dGxuZHJS?=
 =?utf-8?B?azVZZzdpNGlvOUVRc2ZMRE9zMVdINUdjREtONXZaV3lkQ1pIUVBSdjBNOTNX?=
 =?utf-8?B?RVNuSmZ0TFp5SkhZQm1NVGlMVkdPZ2ovUHVLV1l1Q1dQTUlmWXhmR2J2N3BH?=
 =?utf-8?B?WTR0K1VtQ1ZtYUtXV1RVZ01IL040cGFqOWg3dkVhckdROVptZC9tYTh0REJG?=
 =?utf-8?B?L2wrN1FUdE9DUEhJcHh0R0NXOVNPTVFNWEdCV3hXNHJ2cWN5T2ZjV0pMWTY1?=
 =?utf-8?B?emJuMWtVT0k4aWlXeVFmNm5BOUY3WFlhbTZPbXFvMVlvcDlUU3pLbXJQUmlD?=
 =?utf-8?B?akZWcFc0VVk0VmZPVDZxT1RhZlQyTFo3MEl5c2ovOVdWd2k4cERnYktlNktO?=
 =?utf-8?B?aGk2OTJFMFIvSnh0TUZJNFVtRit5bzE5SnRpMXFLZjNvZkZqSnJuOE50eWhN?=
 =?utf-8?B?ekxDc004WlZ0RlFyaEhIdVVCS281SzFBSEZDNnEwUnJYVHlxNkdhMzA5L0lE?=
 =?utf-8?B?M1lxaVJSL29wMFYvUlZQYnQya3VtNFZFUkxreHRrTEVWWG82VFFBa2R3RVRP?=
 =?utf-8?B?SDlZMksvSGN2MWZMZnBvam53UEZhZ21KUE5yeG1HM2dHYTluTS8xdkVzemZr?=
 =?utf-8?B?N2ZtVCtHblZXZHFZN3FtNjRJbk9ucmltSm5OblovSDVDb0g5RXNvK3E2NFMx?=
 =?utf-8?B?d2xIelFJYTNaYkR2NnV3RVJjUVBXbERWRVdaRDdjcFcxVk5wTkJ5R2tCeVpu?=
 =?utf-8?B?elVCT3h3emRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkRoSk9KcFBOdGxiekMrKzVoak9xSmVvdnVpbDh0UmtBTlhyNnpyS1A2L1oy?=
 =?utf-8?B?YkY2TTVNbWFjbTB3cWloRVMwaTJmZ1JUNWhTbDhXNytRN0o0bkNkNmhzOGpS?=
 =?utf-8?B?V0lyQ21IVVZQRUZhWExqT3kwempaQnpNU01hZG1TSjBQdHkyTFdCTzF5cWpQ?=
 =?utf-8?B?VDNRVUoxaGJzNnlJdExIUGRZUG5kYVZNa3ZlMUNpdXcyR0xXQ1F4Yzk5OG5W?=
 =?utf-8?B?RjUrS29IdnBsQkJRYkVpZXg2aEd6RUFKWnNJTVpBZkVLQnQvTkRkVk1tUklr?=
 =?utf-8?B?aGdhUUZXSFdQN1BxU2d5YVJieTBUR0cyRlRQMDljVUIyd2FoalZYa3diTS9x?=
 =?utf-8?B?dlk0NjZMbkFYRGNwSFl4RGZYTi9Kd2ZiMUZaSi9FMklQQXZ0TTRMcldsVFB5?=
 =?utf-8?B?VjBQOFl1dklYVG9WUUtYUG5QUSs3TjBITHUzT1BkZ2RQZmdpYk16b2ZxWDhZ?=
 =?utf-8?B?NnZvYk1VbldsRS9XOHBsaUduWjZLSVVVNWUyQ0FmRTlqcVdGaGNkOHVheVk5?=
 =?utf-8?B?MWNHdzFXcS9JcTFNMnp6S0hzTWdSZnVhTVdVbitsUElCV2J4bE4yRG5hTHNo?=
 =?utf-8?B?azlPL2xDOWdFV1lYdzdkZE5NaW44Tm04U3RSN2czS1VnWkJobVQyN2ZuMzBo?=
 =?utf-8?B?WFdkdS9rYXlKZmdUZ1RPNUlsbTR4eXBnZjEzWFJiSVFLczNLRkFJZkRDb1pG?=
 =?utf-8?B?S092VlVhNk9qR1ZLbU9sbUEwelBZakVZTjhTN0FQMDVNOWtUQkZZQm1tY0M5?=
 =?utf-8?B?R2NRb2ZYK0p1TFVCdWNCMFJaeGJacFpGME56OEJ3L3p5N3NMMWx2QWNwZVR5?=
 =?utf-8?B?Szl0aXdRTExIVmxucXpZelZFSW95VTZPWTF0RzRPQi90djlRbXpSQkFHbENT?=
 =?utf-8?B?bWM3L3dQajNLVzc5SVFYSy9aaTJUUnZIYlVxWGduTzUrSUY4QmFRaW9YaTlS?=
 =?utf-8?B?cWN2VVdmVVNmcG5qcVBnQXJGNGVBUUs0ZHNHdVNiY09MbTlwTEFkWmJnd0FF?=
 =?utf-8?B?V0FpYjJZUHJNOWp4WThqMktPeGZJMkdLbzNEeWZqc0t3UEtpSkFkdEx5Z2p3?=
 =?utf-8?B?cHE4N1dQdXpadWhoSnFaeWx0QXRqY25JZ29FczdVZDdJZTZYa09uREJ1OGs3?=
 =?utf-8?B?RjdEQ2lOc2FNM0crR3REKzBNMURCTERoN0VlL2x1OWJScnMwWFNtVlJOK294?=
 =?utf-8?B?UVVROHlQNHpSOGhKM2owa25JdURPTUdRNzhlSjI4RS9jVm9DMXAzUk5tVVZz?=
 =?utf-8?B?OVpoamhIWmczSzF4ZnJJT0diWlBiOU10bzlHV3kwVVhsZjZ2RnZRQUpjaDVo?=
 =?utf-8?B?dGd4NEhRODBvbkF0WGwwTUFHS3MzZWVrUDI5Zm5VS2NyRnhKcCtGRkR0cEFq?=
 =?utf-8?B?OWVVc1diUHZxeWFMd3QyTnJVaGJySUNkbXJIZDJSdVVuUTBDSHJIR3AwVWRt?=
 =?utf-8?B?cDh1Vzh0YzBkVFdCRTYySU9sb3ZUWnQ5SlA0dkZ0SWtkbFFlQUh5Z25lZmU5?=
 =?utf-8?B?Q1hxbmsveFh5dTY1QmdVZU5BNVdoY0wwUGtRZFUwVWlIcnB3a1lzd2xYSHlR?=
 =?utf-8?B?dnRHdWJoRTZyUnZqUUJqZFNNVS9Mb0IycnZWTXdRQjQ5QzY2QWpFdlBnSUw0?=
 =?utf-8?B?ekwrOVR1UWtDN3pQNUVvMzVkSjFIMGVHYmM3T3REQzZidCtvK1RjVHNjUExS?=
 =?utf-8?B?T2ZKcXN2TW9qbVJpNkIwS0xoZXlNK0J1UW1Hdk42YW9ONXFSRVpXOGZnRDU2?=
 =?utf-8?B?cG5hSXUvcUdyRlBUYmpmN2t1STZHcXBkNUx1WUFrRDhuL2cyOXBCVTNydGJa?=
 =?utf-8?B?Z0ZEMTlGMFZINHZ4OGtucU1tbkNFT3dHelUxY3Zvbzcyc0dHaWgvOHh2bHVX?=
 =?utf-8?B?WDVsTEx1Nko5Z1BhVWp2WTkvWWZXV1BaYTBORHhwaVdra25KYUlTVU1CZHBm?=
 =?utf-8?B?Q041T0swS0xTeHJPWk9JSy9CeTZNZUtXTVdMeWV4YkVCNTUxNU4vWFBEMnBR?=
 =?utf-8?B?eGtkRm91Z2ZQYmtIRTVWcTI2Wlc4OG9HTEdOeXh5RjdSayt2TEZ5WWxYelE3?=
 =?utf-8?B?VGkyRUVTL1hjbUFIQ3lkeWZoZlN4ZGd3TjZLUXcyZGFSSnpXTEZrMVp2ZWxT?=
 =?utf-8?Q?N0LpC2LXDURhm4cyzZF+KjXMu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3f1249-8985-4f02-23e0-08dde692d4ae
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:27:26.6074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFl1w6spt/MO7zKDpLAUZh0SWQI6aMqpXXWOJp1LzvJytWZlEyDJVDEdttPY2/K/WOghn9QO811mPyoiMY4pgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
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

On 8/28/25 4:13 AM, Alexandre Courbot wrote:
> On Thu Aug 28, 2025 at 1:01 PM JST, John Hubbard wrote:
>> On 8/25/25 9:07 PM, Alexandre Courbot wrote:
...
>>        /// Level 1 page table(s) whose entries contain DMA addresses of level 2 pages.
> 
> Looking good. But isn't it singular "table"? We have one table, with
> potentialy several pages, but each page is not a table in itself IIUC.

Oops, yes, good catch.


thanks,
-- 
John Hubbard

