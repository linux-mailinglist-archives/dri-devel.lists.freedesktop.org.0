Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C339BAB315B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BE510E312;
	Mon, 12 May 2025 08:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yIMbsFhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2971F10E310;
 Mon, 12 May 2025 08:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiVDmim2vkL6t8YmA4IweeeqaRI0CUrNSHudNdHnavdqb/m2PjGwp53IaogTiAI2BFlvlplToHrCWozq8IKgFHjFKBJRQdwYpdL7lkCoNE+sg+6hrsbDd+mxfSXNVGFAnPZnCWynyqdiMPkZ9FOaAG23MiM0jk5oTGj7YJGbU23uvGyw0g+AQkUEq+iTERS6xg0uhMC408UFOlbKX4qX7VSU7PCKGGquVNosDWteqBXL1zAI0LBVy++zO3cl2UXkMCVOzfTCj53NsT2n82/q/pZNO+dELInxYvif9abaH6ZuItCQZ7anC3iINAOw0ipjje0hc4JlHGAsGUrGTf8Z5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5u0LY9XtoSe3EOx62NEiORZs6nf0UVWp/kBjXDD7P8=;
 b=SByXe4Ew/B4kjpH0OgAPRIhB5rIcOsxpR9ZtleY2jE5ChTe8ZghcU+ioj+il8/uKycA/ehuc2IDoxaaOuw0J6dK+JIPrxgrSQDkJ4YkiMksTH4uqA7Br341TGm745805GF1I0uHLoj8hDust24CqLSR2Q9vKpTzFZit8Yoc/VBU7fP+Dgd4ERoxCIvSLj1ty3PXwEyeqquErVKFI7XF00F8Jo3TTjWr2FAqUgccHkaG/eEQ37gNeiqfAtOgeBn0v18epV1wRq6NjnoCq+xoB0Pb+41PBVGPL3HvUmsXcJVeTzByeb6eRzAYkp16lYcTZoAggkWHPhURAGirAXtxsZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5u0LY9XtoSe3EOx62NEiORZs6nf0UVWp/kBjXDD7P8=;
 b=yIMbsFhYSsFXgpMLgXlgiIY2wInskzR4DbZYNk2MhG1Wnnj7PQKvxHPWOSLXSpLLJWoGBDyR9Zl2Iv6Fld7rNjGWmb1onPXgfNhD/PwH3uuFekd/M6465bUfbi5i/X+u0h45dl/f4WUvAMn0/cc1Z6pHjO6hB3P/WGA3n/7sUIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 12 May
 2025 08:17:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:17:33 +0000
Message-ID: <48ca64e8-09a8-4321-a84a-e33f2d32e552@amd.com>
Date: Mon, 12 May 2025 10:17:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 03/13] dma-fence: Use a flag for 64-bit seqnos
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-4-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250509153352.7187-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: b22eb230-beed-4910-f574-08dd912d726e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU1RQ1N3aHpzT3lUV0NubStlWis4Q2hKZnA4emxISURqZGxUZksya0JHY1pH?=
 =?utf-8?B?V01VZE00TXRGL0VldVZqRGNtRDlnc0NseEZBeEN1SmVNaFpwZVY3a1BYY2RO?=
 =?utf-8?B?Yk1heUpSSmcwL3lBSVMvRzRQbzZKSmxqeExybTRodWNvSUhsajJCZVNFV25K?=
 =?utf-8?B?V0grM2JlWE1Xd3lnTkVycFJITmQ0dWNUSnZnaGxwOU83RHU3d0RjY0JrWUt2?=
 =?utf-8?B?QUNsVGRnR3c0VDNoZE1xd0FqRXdYaTQ1ZmY0L1pvVDk0ZWt2eE1JemhPcmw2?=
 =?utf-8?B?d2hRWlhXMUZacndaYldVKzhlLzNrZXM0U0M1dFczR3UybHVmVUFoNDQ3T1BV?=
 =?utf-8?B?ZFduY1NybENKMVJiWFFtVXFORkFZMXNoK0dqR1o0SnJSZCsvMzNyMTNRTWtN?=
 =?utf-8?B?R2ZRdDR1bTdWb011NU1pZlgzZmZydEVwNkdhUnVDSVlmdis3Z3NwbGU2S2F5?=
 =?utf-8?B?Uy9SYm5lL1I2ME5Vb2VGcUI2Z29FQ1d5UW9zTjMwM2xmcnNkVDJudGI1RkVR?=
 =?utf-8?B?WUZkcVVIbXIrQU1acXRFYTZmVFlVY1dPS091dU5JSlpWQythYlJIek1YT3J1?=
 =?utf-8?B?M3QyQWJkWHBMRnFHN01SNGxQM1NvOFp5RHYvU1pGNlFvZEtzbkNpK3BrZERM?=
 =?utf-8?B?NWRMZXgxcXByUXdBbFh6M2JSTHNEM2pmUjF6NkpjQXRVcmtMQzVVS0c1b3Js?=
 =?utf-8?B?bWV0a2hkZmEwZzUyU1RYSDJwTGJHS0xvS1l6dU1nVjNNK2VSR3h1TTJCSktu?=
 =?utf-8?B?US9DbitMMGJiQmRVakx2NWFoMll0QzlqMTZRbjRkMkM1M1ZqRVFyYnhRMzJV?=
 =?utf-8?B?YWNIaXVtQTZ1UHF3bEt1S1VuMHdoYUVzeEk0dit3RytoajFIS2xIY2o1SnJt?=
 =?utf-8?B?dTNobDVaaml3ZmVhYXhsYy9Ra0RVazBPTmdtbjhRR3pRM05PbmZ4Y3Y4S2pu?=
 =?utf-8?B?R3N2b3BIa1ZscytMWDhueTcwMmFQUjBpS0ZFNU5NVVVCWHlHTi83K3dXWTV4?=
 =?utf-8?B?WWFYVUsxcm55dEZWVFNQeFVXNEt0ZUMwelBTWDYzdnZYd2ZxaHJrOWNCNSt5?=
 =?utf-8?B?ekJxRU56RkZqcmhudnVkdmZocEpwVFpaMXhCZ3JYbkswQ0s0T3hQY3JITklY?=
 =?utf-8?B?cG1odlF0WmhmQUhVTHIxVUVacjNmdm1OcEdCdW44bm45V1dCdXFiaWNDZUVy?=
 =?utf-8?B?NytLR0J6N1p1c3ZLeTYyVUY3V3JBb21XNldIZFJTUXpva3QvVVlZRjhFWmtY?=
 =?utf-8?B?WWVnK1RzT1Y1WURyWDExTEp6ZkNkSUNuYVQwc1NXaTRHWHFtRTVQNVptSmhn?=
 =?utf-8?B?WlRjRkZEVnB4UTY3ZzQ5ZEtQMlozNW4yejE4UldFdmdBaHBDUUJsZUgxbjh4?=
 =?utf-8?B?azVqRzRrRXEwbmUvTmRWOStpdExSZnFwbzFDZ3NYamQ2K29yT3hlcVZEaEcr?=
 =?utf-8?B?Y3ZienFpNHlZRUVVV1pDZko5Q2hrcXQ1bThKdzlRUlZLRXN0S1dQaTdwNGdB?=
 =?utf-8?B?ZFoycnpzdVdGSUU4VnVjdTVtVHNaOTFLVEtVc1RCbnNuaER1YnNzQzlqT1N5?=
 =?utf-8?B?Z3h1UmovbDJBWnZjRFhvNFpQOTdzZVQyV3Y1ZWVhSk9WM0FzdHpmcTZ1WTVZ?=
 =?utf-8?B?Zks3U0dlejJJdmJjR3hnQm12WTIwcnUvSTdiRlpUV25NTTFvMmxzSkxua1Jz?=
 =?utf-8?B?ZVd1T3lySlk3RjM5NC96TEt4czJkMVhabFluUGNBNVpOZHplZVhFd2cyelV6?=
 =?utf-8?B?Y3BWTTlnRWwrWjVZME5XcnpzZ3huUTl6WDVtSEErQ3g1ZnladzdMbmtoNE0z?=
 =?utf-8?B?cU1aU09vTU0xUzg4aVNhQmFVZVgzM1BJaS9JUDFaWWh6YmxkR2k4cG1ZOE1i?=
 =?utf-8?B?a09JdnJMVUZ1WUhZQnVEU0FNYk80U3IrdFZZYk0yZ0FLYVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG5KdXEyY24rMUl6NDV1OTJndEM1bjRMRkdEWUxqT3JoRnlleUxrc0lob2ZU?=
 =?utf-8?B?TkVqQXNZNThwdG9WcHFMdDdXWGRuQWx1eW5uays2TGNIQ0ZNc3ZnTVdKOTI0?=
 =?utf-8?B?U0FNSFhNcTVrYXpTSmExc1JlT2F2VHVnZnBtR3lKT2pFdUJvS1NtblFKRjVw?=
 =?utf-8?B?L1RqQmhVY0Z3TDRaVWJ0R01ya2pQYVhwdUJxSWV1dkd2UkRuZnllcUZnbkVC?=
 =?utf-8?B?b0VDbldIbmtic0NHMkFGcVZSTjZjVkV4L1JiVWZ3RWZjbGVjMkR2amQvZE5B?=
 =?utf-8?B?clNvd2IwYkxLclhBREFWUVZ4U0hxQWwvMk1EMER3YVUzdk9Nck9YRUJ6UU9T?=
 =?utf-8?B?WDVPTUNoN1A0em80dnoreEpRVHpod2dMWmFIRUFDS0UwUTJOZUJCVkRpcWFH?=
 =?utf-8?B?NDJqWkxBTi8vVy9aRGR5U2M2UjhuNWxMak5PbStBcHh2SWFkTDFqM3pzMUt6?=
 =?utf-8?B?QmtpWEtLWlB5TXFyS0xvQXlxL3I4cFRDak1HU3h1bEU1N0pkZFM5a3UwQmdG?=
 =?utf-8?B?dFBTOFpVRm9rTWtSZ1dOL1BvWUtwUi8vMzBWdzRqUHB3VWFyOHFNQTVTUkFs?=
 =?utf-8?B?QjVZTHFzSjlCcVNUaS91LzV2UEpYWTI5NzlZNGk1M0tkcExnbjRjYlVRam0z?=
 =?utf-8?B?ZmdxZENhczZsVi9IazZuVlFoOUdudno3aG5YZS96T3o5WU90UVFlL2lHNEd3?=
 =?utf-8?B?eEtoNVpubTh3RjhrRUorVUMwVnJNWEtCTzVXT3JvbU1iN0d4a2xtRFRKakRk?=
 =?utf-8?B?MUVHb2pGREh0MlpCQ014UVJIZDVvTFRhMEt3aXk5d3NhYWlNZ1I4T3ZlYWJY?=
 =?utf-8?B?dzUwaEZjMEorZy8xRWR0akZHNFQ4SS9QcTVrVks5L2I5UVZhVXBhZlYyL2FN?=
 =?utf-8?B?VklTK1BrY0FMYzJNTjhTTkRSRlY1N011enVMVUYzZXljdHVjbG5wNjFNQ0VK?=
 =?utf-8?B?dW9PbjI4NWFsRnZIYVpJYW9hT2RZNkZDaHQraGhmUG5CZlp3MVUzdkQwZzlI?=
 =?utf-8?B?bHhFR1dCVGQxMi9xWldlYjlWUWJYM1V4OUw0N0NUd0pSOVQ2MzlodjZrTWZq?=
 =?utf-8?B?Uy9nVU9HUHRnU01Ma1d6bExnSVIxbVA5Wkt5UGZVYnh3Qll0TjNwMldFWS9i?=
 =?utf-8?B?TUgwblFmVHRibDJ4bEVjVGlVZ2UwV29tVXYvV1VLdTNremdBcnl3dnVWeHpF?=
 =?utf-8?B?akc1YUFFVjZhTjBsRDhEN2xJelU5T0o0Sk1tSWhrajlucElhbUEzbkJjVzhH?=
 =?utf-8?B?c0lRTTNxb0l6UWtXZ3RiWXZFRlNCeDZkQzBJRlhkbjFSMTZwSmxkYk1PZG9r?=
 =?utf-8?B?NXBTblVYTzVpSytoOXFTODVZL2o0ekp6aEF1RWZhUW9EZWpBUituMFRaMFpy?=
 =?utf-8?B?WDFYb0pPNXVydktVaFRIOUdBdE83Qk1qcVFkVVRNdDdoNDE5RFpleGpXSHM5?=
 =?utf-8?B?K3dmNlNzZXlEczhLWGlzbWhPNWMwZENlcmxhTE5GeDhVeHZ0cXd4dVQ2NnZI?=
 =?utf-8?B?V0pCR2IxQ0xCbE9rcnB3WFpleU1Ceit4VFk0eWh6bi8yTmlKSXU3aFcrQ0Mw?=
 =?utf-8?B?Z25lWU5TRkhRTm04YlZ5RlgrODVsR3dwTmg0VVVUSmM3OE1zSDFiamozaTJM?=
 =?utf-8?B?OUdMSUtEWjMvZTBLSFh6K1ZGSVRoV2RQeUt6Umg1Y2ZRTFd2SG84OTUwa1pN?=
 =?utf-8?B?MlZ2bnorZmdIaGc2eENQcWVpMXVGc3BpSFk4SWUxQ0dFOTVaNlNhQUhsOFYv?=
 =?utf-8?B?RFBoVUR3T1FtN3Iyc1duSFJ5cko3VExiaTdtV0l0RGY4R3BGdUhhYVcrY09V?=
 =?utf-8?B?WjA1MGFZeTJkdnltMjFmQ1NKZDRMYURoSHhwYWFlemxiZ2RyRFdCNzh1Q01N?=
 =?utf-8?B?bGl0MXFvZFMyVTRoZXd1M0hkUk5oa2t5OWx5T05xVzkxeG16YWE5bDF0OFlP?=
 =?utf-8?B?dHYrUUtoU3Q5ZU92M0QrZ2lMSEtZUnR1V0NHWVJRaW9Ed3YwZnIvSW9VcmZv?=
 =?utf-8?B?Z1o3bWtFeDIwU3VXaW5iZTNsRTdIYlhtYVJYVWc5MzUrL0h0TlhvbHk0TmZs?=
 =?utf-8?B?amVsTzMzeDREdUdWMjQxUUVGY3cxUXI5bm9FQ1phVG5MdDJKTnZpUDdyeFhs?=
 =?utf-8?Q?ji14kX3q52T7wFw7yd80f3AV7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22eb230-beed-4910-f574-08dd912d726e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:17:33.7156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V1LgW9imPgI737l+2GvtAzKvKnwqcAAKxx77p+gY5f/A8b6eFDOxNm2yuMF3mNSe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7113
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

On 5/9/25 17:33, Tvrtko Ursulin wrote:
> With the goal of reducing the need for drivers to touch (and dereference)
> fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
> the fence->flags.
> 
> Drivers which were setting this flag are changed to use new
> dma_fence_init64() instead of dma_fence_init().
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

My idea was to copy the flag from the ops during init, but that should work as well.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence-chain.c                | 5 ++---
>  drivers/dma-buf/dma-fence.c                      | 9 +++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c | 5 ++---
>  include/linux/dma-fence.h                        | 6 +++++-
>  4 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index 90424f23fd73..a8a90acf4f34 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>  }
>  
>  const struct dma_fence_ops dma_fence_chain_ops = {
> -	.use_64bit_seqno = true,
>  	.get_driver_name = dma_fence_chain_get_driver_name,
>  	.get_timeline_name = dma_fence_chain_get_timeline_name,
>  	.enable_signaling = dma_fence_chain_enable_signaling,
> @@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  			seqno = max(prev->seqno, seqno);
>  	}
>  
> -	dma_fence_init(&chain->base, &dma_fence_chain_ops,
> -		       &chain->lock, context, seqno);
> +	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
> +			 context, seqno);
>  
>  	/*
>  	 * Chaining dma_fence_chain container together is only allowed through
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f0cdd3e99d36..33661658f684 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1023,3 +1023,12 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  	trace_dma_fence_init(fence);
>  }
>  EXPORT_SYMBOL(dma_fence_init);
> +
> +void
> +dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +		 spinlock_t *lock, u64 context, u64 seqno)
> +{
> +	dma_fence_init(fence, ops, lock, context, seqno);
> +	__set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
> +}
> +EXPORT_SYMBOL(dma_fence_init64);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> index 51cddfa3f1e8..5d26797356a3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
> @@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
>  }
>  
>  static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
> -	.use_64bit_seqno = true,
>  	.get_driver_name = amdgpu_tlb_fence_get_driver_name,
>  	.get_timeline_name = amdgpu_tlb_fence_get_timeline_name
>  };
> @@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
>  	INIT_WORK(&f->work, amdgpu_tlb_fence_work);
>  	spin_lock_init(&f->lock);
>  
> -	dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
> -		       vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
> +	dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
> +			 vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>  
>  	/* TODO: We probably need a separate wq here */
>  	dma_fence_get(&f->base);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 48b5202c531d..ac6535716dbe 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -97,6 +97,7 @@ struct dma_fence {
>  };
>  
>  enum dma_fence_flag_bits {
> +	DMA_FENCE_FLAG_SEQNO64_BIT,
>  	DMA_FENCE_FLAG_SIGNALED_BIT,
>  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>  	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> @@ -262,6 +263,9 @@ struct dma_fence_ops {
>  void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>  		    spinlock_t *lock, u64 context, u64 seqno);
>  
> +void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
> +		      spinlock_t *lock, u64 context, u64 seqno);
> +
>  void dma_fence_release(struct kref *kref);
>  void dma_fence_free(struct dma_fence *fence);
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
> @@ -454,7 +458,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>  	 * 32bit sequence numbers. Use a 64bit compare when the driver says to
>  	 * do so.
>  	 */
> -	if (fence->ops->use_64bit_seqno)
> +	if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>  		return f1 > f2;
>  
>  	return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;

