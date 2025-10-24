Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E85EC06FBA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 17:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1FE10E1FE;
	Fri, 24 Oct 2025 15:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xYMEJ/2I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B97A10E1FD;
 Fri, 24 Oct 2025 15:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxcoXccumh6H3Kg4joVEkej8CufdpkAEZU4lecUtpuCldURQdclgaA8D8YouLUj8l8fnSwtkrB6jjLv8oJWvHnrxX+62GZCX8yzJzYtPb5lL/tyIM1W2qtZ2lzW36gGxsqe4/HqSIph6aom4nu0U39gkexYQNMRgluxZzY6ITC0KKGCUQwrGslA3AJ3Hapsp0y/pZXkWrLSHDEiE6dPnotDwjkNAv1qzBuEDoc16sN9d+sUmBhOEUcKjc+rSDvn/eBbTEOnIqnkmaul2PkKA7UVxhJ2VrgQtIhXfEhbj7sRRUSc6oQuVK/L7tT8K842YqiMlFV0JcDgP8NdgcDmgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP99I0HXas33E6Wu08POa09+fnJUAANY40VKSKXEmsc=;
 b=kcbzQAc7WoBzuJnFRwhxolCwcsiurwEtjO7zAbMLTdkm5133hdkdCAZkKcKQsldxTBllKIwGKoMgtaYmNo8kac+NSkQa+KmVBDVE+uX0EYWm2c0R+GjWMzGSXzsYTUhG0vu+N0RDMZGSqvdvJTjqLjkpmJmXyrazNeoB4PQr9uNPyt4kHc00F+srqEABwICX+gUCXjZxFubrCFKHlgQn/Nr/PlI5rFhf52bKXdSj5CPqGkIomfGTySDTiLho+LTRuqnc9wkHk8sBjzZQ1IrgKGqrXqVdsHQX22dzR7ytjtfiyW64PsDZ5q2MXcVL+cxHlPu3LHqQvs558y0UVNnv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP99I0HXas33E6Wu08POa09+fnJUAANY40VKSKXEmsc=;
 b=xYMEJ/2IBh9rEhFrhDPC6+7gXdAGefKMrgBg+YfvdUn4teCEAdYs1O9LkzBRieMlzCkH67M9K2WrBpnp6Pd4iO0aNzOeqdyxgsYkAW5SokJnJxBFyr0QTZ//qS1jInOajwdHgnSAN276JARUzKMETraoivTD0IBjGjImGW8OAyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH8PR12MB9791.namprd12.prod.outlook.com (2603:10b6:610:254::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 15:32:15 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 15:32:14 +0000
Message-ID: <c71c3ee5-e101-440f-9533-508d37d05d04@amd.com>
Date: Fri, 24 Oct 2025 10:32:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] platform/x86/amd: Add S0ix support to the Xbox Ally
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Perry Yuan <perry.yuan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20251024152152.3981721-1-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251024152152.3981721-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0094.namprd04.prod.outlook.com
 (2603:10b6:805:f2::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH8PR12MB9791:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2b665f-69ce-44b0-6786-08de131281a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWpyakI5NkpDdVhBdGFQaWt1UkYxYUtpS2w5dnBsQzM4NXJONnB6RDNUKzU4?=
 =?utf-8?B?SEQ1bklQbDl6SjhPYnEyRTJZT2FNRkZ5b2R0YVBNWFkzdndsNW5DZkhHVGln?=
 =?utf-8?B?aXp3MFhzQzEyM2lsaXhkRGo3VDVVNUxLRlNNWFkzU2JmbG1rT1JmWU44RzBW?=
 =?utf-8?B?dlM3RFpwL21YQmRQNXF3NzJ2anJKdmxWSkF0QVM5Mm9LM1RRNkZaM0dza2Qx?=
 =?utf-8?B?ZjNmeHZZYTF4ZHM5SnM0anBDTEppSkh2L0ZhSGF5QjhPUGlDeSt1akRLQjhH?=
 =?utf-8?B?ZnVzek9UMkZXbnBFWDN1RjBZZ3RaZEJwNnZab0dXTHlxME9MQk9TT1lkcjFQ?=
 =?utf-8?B?YXdXMWlwWlJldHIrVE9sK3I4STBxVnFrYVBiOWpFT0YzZUlSaFQwLy9leGZt?=
 =?utf-8?B?UE5CUkJmZEd0czhWeS9JVFFkMFJoTU8xaW4yVFE1Q3RwRHRzWHV0WDFqMHRK?=
 =?utf-8?B?dWFYa2tDc2cwdzhHK0wzQWJ5WFhCZ1ArRVJYTFkxN3dhcGdicDBHVWRHSW5z?=
 =?utf-8?B?WHZqNndVbG9BQXRUUExzaXExWUNzRlBOMlE3dVA1MlVJWExJN1RUY2c1d3pJ?=
 =?utf-8?B?N0hRSUlRdzFEWTJhK2Y1aWloaXhWdG9lZlcyaGJoc0g0ZEdOZnl4dHNOUU5v?=
 =?utf-8?B?R1dlOHZvM1oxdHZyTU5lTlRBVUR1V2pCSjE1a3pSK1FxMTlWRFA4KzBvVFdL?=
 =?utf-8?B?eXAwN0VKR2JEc1I1cTFCcnRTalFXMUlGK3d1M2Q1MmpZTVMrZHM2ejZKUTFx?=
 =?utf-8?B?NlRNRUZac1ExMkxIQTBnY0RkZkdwYmdIZzBsZGRSdCt0dzduTUdWUzF6NVY0?=
 =?utf-8?B?ZzNXSlBsTTdRYll0Z3dOL294Y1IwT1prbm56REt3VEdHUzY0NnRWcmhUTFFJ?=
 =?utf-8?B?TjBWMkRCS1Jic3p4K2tJOVEyUjBBS1RMbTZXQkNEdkVwN2NvSUZIMzRmMFRH?=
 =?utf-8?B?bUM4OFh2elMzb0VWRHZlRVkxWGVGNHlFRndNbjhZc2U5UitteWROc29Dek1a?=
 =?utf-8?B?WlhDNHVra3JNVnFqZ2pXTDdtVWo4R2l3dzMxbWxSRkQ3UFduZjVjY29mczhS?=
 =?utf-8?B?bDd5dldVN2xxK3dFazNsTkpSK1c2YzZBRkJmRXJxNFczYlF4cjVmZEtwQ1Zn?=
 =?utf-8?B?ZDNrTDlVdU9PaWRud3NzNEwrenBhU2hBam5TclM5Nm13eFpyUWV5WUY4cTIw?=
 =?utf-8?B?Y2JraGF5ZzQ5VjhHUnpSMy82cVRYeU50eHk2V2pKTUw3RFBYdEtYQ2h4eG5i?=
 =?utf-8?B?UXN0eUtoTWlxTmJMdGoxSFpETmlibkhPMSsrOXJqOG9KbGJtSFI3QVd4eWRO?=
 =?utf-8?B?aFNldEhLeTcxcXJ3aFFSbDNnVGQwTHlUaGpmVERITWNabkNrVU5iOU8vSEZx?=
 =?utf-8?B?bjFpZXdpQ3Q0Yk85RGJRZGphSThZYWRYZldUWmhKMWJkRTRSWFFsL3grNUti?=
 =?utf-8?B?d2RsRWY4aHdtbXphUDlmV25VcWdMVXh0MHNmdEZxZmw2dXpnRi9vbkJYTUlY?=
 =?utf-8?B?dlFIeEUvVkdkdy9XZmFNVGt2S3lqVkxFdW9QTWN6Y2RVVjF4RjdUWEV0NWQr?=
 =?utf-8?B?c3dyRzFmR0cvT2w5UmoyQ2NZTGxwNjkyT05yeGNPTkI0cjY5MVZSaU9UWFVG?=
 =?utf-8?B?TklPcnBlWGR4YklvWXU1NWx3Qzk5WXlNamNnalFsUHBsSjJ5UjhKNDhIcUtv?=
 =?utf-8?B?SDlJTFRxVnJpeWFRYkdaTmY3QkRKQTVUZHFiWEtPa1crck42T21lSWdSbi9K?=
 =?utf-8?B?Y3BpYktLK01KajU1ZkNwSjBVZ3hEV3B0ZDRsQVk3Mmg3YnV5bytYYkhzUjI4?=
 =?utf-8?B?dFg3K1VRNnQyQ2FaV01JcWdrMVhZNDdUQVA0cXN1d0NJZlJ5eTRTeVYrNHJT?=
 =?utf-8?B?TWZJMlU2UHBXTVZ5dUZLSEJxb01BcEZ1Z1ZmeG5NTjJUckE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmE4V09Gd3JCNFhpM1RwUmF0VkNkMVVoZmpYeGVROUlZYS9CVlZZUk9icXlZ?=
 =?utf-8?B?YW5raXBBeVphdEtORFZxZW10ZUlheWpRY0J1cTdMZHFqTWtwWW5DZjhkWU5p?=
 =?utf-8?B?eXc3aXM3VG9PN3ZOdlA3aXBFWHZHV1pqUEtSQkNDZ09ldnRpRzg0SmJFR3JC?=
 =?utf-8?B?TjNsdm1zM3J3UnU3STdidHhrcE1Ub0VvaU5zYUJCVVdzc3pKa0ttUGdRSy93?=
 =?utf-8?B?eXdudnhuYjEyYlVTZ3dWZjlGSmNuWkx0czFjaEJLemVHYVk5endQZForZG9N?=
 =?utf-8?B?ZmNwczZFc21rV011SU9CNkpPWHVDNm1meUFDVmZvM1RNZ3lrdlYwNUtvbjQr?=
 =?utf-8?B?bWFKSkFNbnMyQWZrWHBmOXhRQ2U2TURnTU9PYi9PSkJwbGxWTlNEdlVod1Rv?=
 =?utf-8?B?N0NzKytkYTU0Z2FoZ0ZrQnhoTUNBMWlUWEpkbk5TWXdONVRpUFU3U1V4ZWd1?=
 =?utf-8?B?cFlFQi9HOVBRVjJMUXJlYTY2b0dnNGpVNnBreXdOMC8wbjFwdE5pb045YTY4?=
 =?utf-8?B?QTJSMkY4K1FMQWd6OWc1Smlnc1h2NDZYelNBUG5QWkl2VVJ5ekwwdWhQeVlj?=
 =?utf-8?B?azNuckllZzd6TEJMZ0ZvZWRoMUNscUJLdDlBVmMwWklXeUh6TVNCK3BGSm9L?=
 =?utf-8?B?dWhva0tNeFVoai9KQ25SSlVOY3gvZVV5N203VkxIcEF3cm82QU5aaE1HaHp4?=
 =?utf-8?B?TEc0Z2dIMElQRVhiS0RTaWhHTUVXaElkQ1lwSHR4QWZ0T01ROGZaOTkyVlR5?=
 =?utf-8?B?Y2I0WlJraWxXd1N3U1hjNm9lTG9MQmEzTlhVeTY0b1lzQmVLR1BxWjVSaDNM?=
 =?utf-8?B?VlBjblJXcmlhcDBSdW1BemV4NWU2Y3lJK2Q4MXhCTThEY3IrbFhCQ1BKeFNO?=
 =?utf-8?B?WVpaamtWYTR1cUxMV3A0UHM3YkxZNE9BVkYvTTY3UEhtZmR4aURmakxaOUVr?=
 =?utf-8?B?cE10a05pNU1nc3JIdHNyT2hiTDZ2OXQybHBJSUc4RUxhMlNaaDNiajI5Nzg0?=
 =?utf-8?B?MEVQdjRiRDNuOTZFVCsrSitFYVdXSW52OG9CamdRWEtxOWs4Ri82WkpVUzI4?=
 =?utf-8?B?ODRiNnVYSnd6SjdrRlFvUEdTbzJUZUpiU1VaNFBsd0JXV2xncmszOFlnK0Jo?=
 =?utf-8?B?aEE1QTdKWEVQREt1QU40WmtIMWNudHV1dGRXVTlHbjg5RnpOektEUWEyRUxR?=
 =?utf-8?B?L0k3U2w0dWh4TFJmblFyWS9CM0R6eEtNekM1a1pxdk04N0MxZHF2Y2JTVnp6?=
 =?utf-8?B?MThYNlpQME5jSGJqU2YrZ05kOFgxWXgxQ2c5MXZodGxicDBLK3R5UlEvSldD?=
 =?utf-8?B?dzljSTB3azhtNFZhOXR3eGVYWUIvKzkzeUdJekhCYkxkT0tGaTlZL01Mbmk4?=
 =?utf-8?B?TUpTcW0zN2ZDd1VJWnQxRytHQ25hS0VHcjNoQUF2eE1RSW9YK2h0NXBIeWM4?=
 =?utf-8?B?WjVoUTNpRG9nZHVDTkJKU0ZBN21nTnRYbmFRWmI5d3JzUWQ2dllZRis5aVll?=
 =?utf-8?B?NGl1WVlQaDA2b29mZ3BHTXRMaHhvdnZJRmZzZFZSVklBVVl1MXM4Zi9udUV5?=
 =?utf-8?B?ajgxWHBsR0pBTEYzUmdWRnR6TTloNm9rYjhmRzlZRFo0dUJ4QXUvTlF4QmEw?=
 =?utf-8?B?TGdMZnZvT3l4b3M3di9MYm04RDZKOW9MeEJTWmFRRHBxRDdJZmVFbnlMR0Fw?=
 =?utf-8?B?ZldveUpCOHlCWE9yd29GY21oS1c4Z0xscFZIV0hmQU1ickxidnpPUXVHbHI0?=
 =?utf-8?B?YjRlMks5T1gzSjArTC9iL3RWM2lmK2s2dEVvUzA2TzU1YnlQekVETXN6UUVU?=
 =?utf-8?B?Z21wMzUzVThkaFVRRWtjZTFZcnU3MlYyYjU0OVhmMWwxenlXTWlqK0ZyVWNC?=
 =?utf-8?B?TDhhanVZbHFEU2pndDBic2t2ZFJsR2NTWWlXeXJKQlFIWGI5SHZQVHhJZGRl?=
 =?utf-8?B?Rk1JT3dnQU9aOHB2eis1bkdpYUJvckZnV1g5UnljbGd5a2RFdlNGeU1iR3BT?=
 =?utf-8?B?b0M4Mm5taUdaeDNLSHBXcTdueXFiQlhleE1ESCsvd0NUUFpXamRsSDhCVlA2?=
 =?utf-8?B?RCtzU2o2aEUybE9IZTJkbTVaeHBjcUZ6LzhhZENwQllpa21ZalhCcWYvOXZj?=
 =?utf-8?Q?bvh2swvS/A92pGHAX8I+D51cB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2b665f-69ce-44b0-6786-08de131281a0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 15:32:14.0141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxEwSiAHpM3PGQSljenxFcf9zR5sSjz2yhiUn4isRusC+SQknkR9/e19LLCPK99/8snHqmH4V1Hnm60ffuLbaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9791
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



On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> The Xbox Ally features a Van Gogh SoC that on the Steam Deck uses S3.
> Therefore, kernel support for S0ix was previously absent. Introduce
> this support in three patches:
> 
> 1) Add Van Gogh to AMD PMC driver
> 2) Enable spurious_8042 quirk, as it is common in those generations
> 3) Adjust the Van Gogh init logic to avoid powering down the rlc
>     and tweak post init
> 

Just to be clear - there is no need for all 3 patches to go to one tree 
or another.  The PMC patches should go platform-x86 and the DRM patch 
should go through drm.

> This allows the Xbox Ally to properly enter and exit S0ix suspend.
> Perhaps it also allows the Steam Deck to use s2idle without crashing,
> note it is not currently possible [1].

FWIW I don't anticipate this series actually gets Steam deck into a 
hardware sleep state because you need firmware support as well.
But the drm patch will probably will help the hang that was observed 
which lead to the patch you've linked below.

> 
> Currently, around 1/10 times the SoC misses the PMC hint and does not
> enter S0ix, so perhaps 1 or 3 need tweaking further. It wakes up always,
> however.
> 
> @Alex: I tweaked the text on patch 3 a bit. You can resend it separately
> after the issue with 1/10 failures is fixed.
> 
> [1]: https://github.com/evlaV/linux-integration/commit/5ab73e9069017aa1b5351f91513ba540ce5905fb
> 
> Alex Deucher (1):
>    drm/amdgpu: only send the SMU RLC notification on S3
> 
> Antheas Kapenekakis (2):
>    platform/x86/amd/pmc: Add support for Van Gogh SoC
>    platform/x86/amd/pmc: Add spurious_8042 to Xbox Ally
> 
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
>   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
>   drivers/platform/x86/amd/pmc/pmc-quirks.c        | 8 ++++++++
>   drivers/platform/x86/amd/pmc/pmc.c               | 3 +++
>   drivers/platform/x86/amd/pmc/pmc.h               | 1 +
>   6 files changed, 26 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5

