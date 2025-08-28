Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 699E9B3AE57
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 01:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049D510EAFD;
	Thu, 28 Aug 2025 23:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bahr0PwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA77310EAFD;
 Thu, 28 Aug 2025 23:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1ZPe22pYf+ojCst/q0q61keKcLZSnXbR5mR5rXPFHS54Xuyqoj9zlG+OjWrjrzQrr+X9WvK/LhVeVy65KbIXydVu80TF8zg7hIicqGGjoqiU05R2LTrrDefy7kMQrAGhdOoc+wC4xicaCoZDe9dKv8TVl9Z8YSL7KQ12jIXtLAqycUNSf+BjrYrXboMMFEgPYkFkqwcUFa95dUcI2k7cGyCnFIUfbey/QP69bUv+9ifK+9lgYui6U8ajKtDpOrlCsMyD8TBkl/6SEb/qXh8892pEIEynI8bgK5SUaa1aZUbTwe0tATcBj5M+uKnbdrgajYmZuf+XyQ8TGXOzO1qfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQBNKiL3lDwRCZ0r1nznX6bq+H8krO7YIt30fAX74+g=;
 b=VyDPFnNAAbt8VbXKZ7nleQ+vEFsRI1VG2sCGrflxN+GPmt9cF/BZX+W4Y+1TcpetjNwP3yNkQafveY7OTGhCPd93BN8L9JiyM1bPP5feo//Vg+6fMOhyW9p1BAf1pbr3raAc08094SqXCROMvFWoyNdBchmH2mFRpHI/jT7ZJWxBvADSYY6N1Qp3CU+BqZk8H5QCQy3xCNsR4zivmvIM1z1Q8uOjikvXQFEB73AeIC4EfbvPbGF//tbe9aGXZlPK6mMylq/tOVLgbZGYyeltCbBJRP1ri7Uu4vHSXNmFOO+AuJrntEL9KTN/wTV2BhCOhHx1UbbZ4XTkr1cuhAnMbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQBNKiL3lDwRCZ0r1nznX6bq+H8krO7YIt30fAX74+g=;
 b=Bahr0PwT5nrT3nmda9cKIlSpNVEgN67tOStKrqBmwJDpz7w75ILBlvyzK3hUorCrrOYJEIv38yMkqGwKMfbtGFE4ND+RoNOZ3BToub07v0JZAEQ3bB8tsHGex5GfIH2Yx5NmwoKR0LEq3JIAfwpDSXQ0JyWvwaZioprF6loXrfMaK5FoHeAiZEYpZWjelodEqOgfWJQhIeBilWsOINPIPZOEdSVldaB8umglt2VScakeHubU1gLHMRkITcyDtcdtZzD/To1Z6xO8xRE2bsA4VMeqkfpNRR29zO+cMjmig4WotxpmeMVmcSCYR87iPIm8nSjnRfEoEpIxJmKiZZPzTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by SJ0PR12MB6879.namprd12.prod.outlook.com (2603:10b6:a03:484::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 28 Aug
 2025 23:17:27 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 23:17:27 +0000
Message-ID: <152d2f58-a561-46d5-999f-88741d9230eb@nvidia.com>
Date: Thu, 28 Aug 2025 16:17:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: depend on CONFIG_64BIT
To: Danilo Krummrich <dakr@kernel.org>, acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
References: <20250828223954.351348-1-dakr@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20250828223954.351348-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|SJ0PR12MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: f1dae4f8-ef18-4950-9c0b-08dde6890d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDI1QkxsOHVpbHVNRVZ5TGhFVjZsM2Y4TjhVTFBnMTBZODNCMlZ1VFFUcmtt?=
 =?utf-8?B?by9FanZ3bWkwRXl3TEtaSitFelJQdU11S09vVlB3bi9TZzFxNENnWktFeEM3?=
 =?utf-8?B?WXk2SnphQWFCOHdJQnFvaE5uWUxObzJXSXp3MTlKY3JVWTJ0S1pVSlo2bzZF?=
 =?utf-8?B?bC83bDM0OUlEM0p4d3hEMXJjZ0RDQ0ZQQmlXdm95TEN1eThKbGRMUnJHK2xF?=
 =?utf-8?B?WWgrN0laeWpZQk5lc0xFRllmR05jbC8rbFFPbzF0Wkp3NEtSV3FsM21wamFC?=
 =?utf-8?B?bWlnSWkybVFIZm9JSjFBd2g1V2NYcFRZenRQZ3kwOGcrL1R2Ky83QWkrVzBu?=
 =?utf-8?B?VFZOTzdXeGJpd0lwUFd0dFZ1bTZIODdvN29iNno3ZzQzdGFXM3JTVkdNSi9F?=
 =?utf-8?B?V0xIb1dBRkVDRHRSNFQvUUhDNjE4dXhxWCtpQ2hPNTRvWXY2R05WK3lIR0dP?=
 =?utf-8?B?M0h4em4vQ09jMEs1Uy8xMjdmSXdKY0Z0UE03c0ZhMnQwU0hvTjllcEJlYkVF?=
 =?utf-8?B?dGthQlZGN3RvQnZGNGZJcDZzVkdWQTQ4WXZFbkRNSXd4c0l0M0xxOElUd2Rk?=
 =?utf-8?B?U1A2Q1RQWm90ZE1oeHJDazVkSTUrYW1CbzQxN0Y1eWtXNnB0RW90MHVsMjVi?=
 =?utf-8?B?aHdCdzNybFp0YjFHL21mZEFaMWV5dzR4MnprL0JDKzVRSU45K1h4a1FjSEU2?=
 =?utf-8?B?dFNvaWVVcldUUzl0MjE1ZjlJMXpLTDM1STNUU2VQeWVVNXh3ckQ4Ri9nekZ4?=
 =?utf-8?B?bk0wYm5sd2RFYkdvbURsejhsZUZJK1dNaERyeVlSWXptb2dBc2pRWXpuRUNR?=
 =?utf-8?B?SFVvQzloS3pzdkNuQ1IrMm5ZUzM5U241a1RLQkV0NmxmYytDZFlZWHdUb1Vz?=
 =?utf-8?B?SjhXWGM4UVdJUTd3RUZaM25VR3ZkM0ZSVHczY0Jydk52MmIzZXd1VkJkbzBS?=
 =?utf-8?B?dW9HVFdrQnZCZ05oaE9rMGdQTEJJSWM1MG1sc0ZRRWllMTVwcElJRE1lREF2?=
 =?utf-8?B?cjlQWEU2VlY0MTZRMEs1QVpDY2ZxSmRmL2xVOG5EUUtqU0xjTTFLTlpVOFRT?=
 =?utf-8?B?aW1IakltelROUFZGeGJ3V2ZuQVRRVkVXTVVqeUZJYk9UeXlxb3lEbllKc0pZ?=
 =?utf-8?B?MzM2NnFpMGVGdzlpaUlaQWFNaENVblVsSURCWGNuYkNLeGNnNFZFSGtka29w?=
 =?utf-8?B?QkIyemVMd2UzV2tJN29WT2ExNnFLWmNuUnF4YTFCNUwrLzRNRHA5ZCtoZE9Z?=
 =?utf-8?B?cU0zUlhOTTRYcTVyekkyQWRVQmpTb1JKU2FyNmtUMjlIcGlxVFpDY05BWjVn?=
 =?utf-8?B?eHBYdGVnOWp3dVYzNHBWbEhaZ3BkeE14N1lJREFCcmNNamV1U2kxOFhGaUp1?=
 =?utf-8?B?d0djRnp5dVV4TkViWk85N2IwTmJFME1jOXBKREpzajdZMnRaUHFJMVFnb1Bq?=
 =?utf-8?B?Y1U4YXlYbXZMVVBqOTNjMEhjTndTMkZCcWFwYkxnTEFIUndKcWpHRUxWZzFh?=
 =?utf-8?B?cndHSU9YTHNFSzlNYzdNOS9NdGszeEFIdFg1ZnJBaWpZdW5qcEdLNWFrQ2lw?=
 =?utf-8?B?ZmNsc3U0S1pBaDV1ampZS01LN3JaWmZPYytIZ0FaNzFtWXdNWCt3bnJRdjZz?=
 =?utf-8?B?YzVJUlNvSXhvZmt6QVAwTUk1cG9hNm5WUFdycmZETnRETDNMTGtzU3ArK2Va?=
 =?utf-8?B?N1lhMUxURWN4RzBDbkY2VGh4S2RUZ2dKMkNrejZtbUoxT2F6M3o1RXYwOWhi?=
 =?utf-8?B?L0ZodUhtL3BxbmpSQ3ZpNE9yZm5EdmRiL3k0amNpNDlsSXJZWE9QdFRpNU4v?=
 =?utf-8?B?VVZUdnhuYUdqaXkrMkFtMjBIcFpFWGxUUXUwbUlrajNPQzVGMUgzWGhjV3Jl?=
 =?utf-8?B?UXkwcmhLS2VvQkJ3VFBmSXQxVy82N3BVSDlkWndHYy91THc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVN0ckNmNEJHcmlLR1Q3L09oeTNsZmxqUkcwSjlnVlIwdTZlNktTbUhTRkRJ?=
 =?utf-8?B?TWcvd1dNUTBtSjFkUkdOUnUwZnJOTWlUNFA0MS9tc3d2ZVcxamMvUnRWSnNj?=
 =?utf-8?B?dmZYU05OY0ZpS0FTOFo1Qmo3ekQvUnBKdjhzRHkrdy9RSXlmOWVKL3RuOUZ4?=
 =?utf-8?B?VDJvYVZrTG5lSzZFb0JCaExHT21semhjQ1J4YXV6WDQxTUVoSHViMzFjYzVv?=
 =?utf-8?B?U2k2UWswWi9GNXgyR1BSR3ZoTEdMc2YrcEUwRXF1ZEZ0ZWYxc1ZrMnI5Ukhw?=
 =?utf-8?B?bys1WitjWHM3YzdKTy80anc2RFBiRHYycTRvbWdzTmdKOXh5QW1ra3JYd3kv?=
 =?utf-8?B?OUNyd0gyL2pUbGxVVU1vTVkvbE4ybjRLejV5T0VyVU9HaEM0eXNmMjMzeVFJ?=
 =?utf-8?B?N0Q3blZUamZHSWZkSGlyVHVabFJGR3JYMkhLNm5RSjFCcWNXODBqUUE3MkM2?=
 =?utf-8?B?NVFUK3hKQjlBSXoxWDFLMWtwT0JIU05wUkt5TUVveHlhTFZ5VE03amZsWlJ4?=
 =?utf-8?B?RmVhRzN5ZWNwZnFteC9maHpYOWxLWEFMd1RrUDFZM21KUm5KNVBmb0E4YkNC?=
 =?utf-8?B?dWhFUzM1QmVKakxYVm5Ic2JLSUIycXp3dXlzVHVSaDlhMWoyLys0blFidHBj?=
 =?utf-8?B?cDgrWE8xSUYzYlFCSEZBMjBWZ21MKzVQWXhuYWlQNG9oOExoTHB3V2M5Unp2?=
 =?utf-8?B?V1JxWDJrZjdoNS9KTWY0NjRzR0RiQVN5Y0M5ekRUR0QzOEp1eGtQdTRTZXkz?=
 =?utf-8?B?U3laL052UlNyOXgzT1VXZGROY0l5OEFjUEJvYjhKeDJvQXlVcnJuYUZNZzN3?=
 =?utf-8?B?UFhkWlkvcStWd1YvVmQ3ekphcyttYnh2alJnb0ZYelpWM0g5RmpZWC94cTY5?=
 =?utf-8?B?YlRMT0ppaHBrL0Y3SlFrbWFsNndzQmMwR21PSTc2TzFFVXEyaDZ3S3VtZmxx?=
 =?utf-8?B?SHkvTktlZzQ3aVViM0NNSGFZaWk3Z0lyeXJnNGlGTFBjdGI5V2Z0bVQ5dzZD?=
 =?utf-8?B?RXc1YkZFcjBsRmVXMmZEKzQrbGg2MUU1ek8rcDlTdVRhU2duWjhkSHhYb2Vm?=
 =?utf-8?B?aE9OaHVoTmczemFaNEJzck1ndGZYOWdhdEdUa2xxaXJ1aUxDaDdVRC9qT0w5?=
 =?utf-8?B?WXJZTGNrb0taMGg1ZjduQ3hKa1lFanFXSUdiTlRkTFB3NXZIWjR4MUJoYnhR?=
 =?utf-8?B?UCtibjR5UFl5V3p3RVhFdit3djJmcTMyeFNKOVdIaUZiOUFXUWJOS0dXZUo4?=
 =?utf-8?B?NzRoK3RXaGxLWm5iMUxpVjNXT0JIdkFZR0pCM3Q2cHNMdHZpVTlQZ3NPUVVI?=
 =?utf-8?B?eVBjNDJvWkRZRFA2aG1YRGIwYU50NDJVQllQaTJ5UEx4c1o5YkVWRmNoc1FQ?=
 =?utf-8?B?STBPQ1JQMnFSRW1wb0FLRlF3R0Y2WkVHK0JKaGJTNUpSSWlVQjNVcU10MXZo?=
 =?utf-8?B?Q1ZUaHA1bVM0aDhMNUZhbXRERHA3anU3d21KV0N0K1puUEZqMzVYMkgwekZP?=
 =?utf-8?B?dXNxOUI5M0xYcml2YjYwalJSS0lidDJIcm9rdW9SYW1vMTBzbTU4c3FMeFU4?=
 =?utf-8?B?YjR2YTg1SE15Nlp4NEtxcDl2UVA0NjdiWlFROVJ0djd2OFNiOGN1eHphRmxG?=
 =?utf-8?B?M3ZPLzB6M3BCd3lwbXpuYTcvODE5ZDNJSGxZZEhNYm9uK3VBWkdpMGxWYUw2?=
 =?utf-8?B?SWVMVjlrejVkYy9zN251OEFIcmt2SEJseXR3cVpSUVY1RjV3V2VKbVd0Yllh?=
 =?utf-8?B?UHFCMW1PcjF2YllzMFYxK0FIa0J5WFZCSG4xRWJUbktIVDd6U0tMOFNic2R0?=
 =?utf-8?B?Y3EvMklNZ0tnQVh3VjBGRTZuNHllVHg3SWd0Y2ZDVlJFRVdlWStjV3V3VFc2?=
 =?utf-8?B?T3JkVFNMeVFTb3N1SjIvekdEUmdpQURQMFJBN1lyR0hmb3RhSTIxb0lQajhZ?=
 =?utf-8?B?NE9INEpSTnFVanc5bkM2ZGduVDFkYm9EZGgyS2ZrV0xsb2VIVG9xWU9SYWJH?=
 =?utf-8?B?aXFqVlcwUXEvWGs0Y0ZWcVRBT3g1L2pWSE16QnhvN3dFMmRJUitLdlUvOTVs?=
 =?utf-8?B?eHhNOVRzUEgvdkxOVDlmZW1BdkFmRkNEU1cyQ0VLQStqREJyVkxoaWN5cHFm?=
 =?utf-8?Q?xAvoWKq7UWBUlYWu/VNc+fMHG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1dae4f8-ef18-4950-9c0b-08dde6890d83
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 23:17:27.0202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nv7P2w3AXLMjq3FmNpEO08Sn9vyfbg5eRXL/w5MXMIhjOTtR84+eiJr6NTQsS0Rp1xu/tQVDZlRdbNmv+K/1kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6879
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

On 8/28/25 3:39 PM, Danilo Krummrich wrote:
...
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
> index 8726d80d6ba4..20d3e6d0d796 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -1,5 +1,6 @@
>  config NOVA_CORE
>  	tristate "Nova Core GPU driver"
> +	depends on 64BIT

Yes!

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

