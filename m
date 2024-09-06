Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493AA96EE51
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C75C10E9BF;
	Fri,  6 Sep 2024 08:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TTxUyJtD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E0110E9BE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:38:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2yVaFBAdOdqwgfx2r6R5DeuJle/7uyT9nJY/X9CC5fMmjZqVCF9MUoxvUfYxxRXLCskRoWEYWWB61gWlOB7Yx45gSY71rNqLe0feKzspCkspbNq38jwPK5QYM0d243GDcYcXx1mUg8p9kxGGTt0EundHENGaDYcogp4mMZ/KMKGqHkvznq1EzWroNGoWmNAYz5s5KPwO29nANiAXmfsIOI/mjxX9ZNUge4wLPhkiID+/pvoav8rddlEG2fYU1avRVb+vwOaGo/dnbICp9GEum/57F6Su/MYnBg+pRTYGdg6zVKzwpNkafTQf/C1CbjgWO0Ft4Xb0Zsw78XvLR9duw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5pbLq052/WtjzlOu8w+PVfaY396iIdY2cnN8PNa++s=;
 b=xSFVSLlsPLH8NXvs7nNDmFMe+G9rI2S8baSzfcylGkQaod8ZHfVFUP6bFBmWhPwnwCY7f2C1v3BHZk0vKTV1gj2YPYa5azWN5a2JviTk1uxjs/9VPMK4gE09Ca6yv0P0K810iqI5xZUh3dVu3voadJb3ObInr3m0jHH3bR35i6BOsmgsXLhSu6viN43MDgPhtoHvo+qifs5wn9fLhOdDgEFMvfVBm2YdKzbQYTLTC3rJg+n7f3EwS+9qRk6eooXEVuHdlFZP0Xet+6JFKIeiKGEnDZtLh1CpqSlw2jc72Sc/UyGGND15vcRmvg3bMQcGvq0d8+/GHp8QKE280v+Xtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5pbLq052/WtjzlOu8w+PVfaY396iIdY2cnN8PNa++s=;
 b=TTxUyJtDzAR7tU3QYzIfJFQsy1iPjtkBpL4JYJ1GYk84uUHXWjxZAej5BckT2AvmiMEUbUUSOvTdWM9wb41R33jol/G9+xvZ79rYUJSZX26Qedv7mLF6J5ZQnwsokPgpfiiF+bYJS+pjmOhoER/CZNk1qOO/euf2rVPR4LA1JusNdWiGESC70yO5O7eGLtKOSRTKlIQhbaab9b65xcoszbtc43g4ad7CUNLZVHVJMm0qU4LKJIGsNJnhLjZIC+Myvbv/TOxZe0BR5MQMJohLPye9r04WDLuAWoJoJy/F0rJYPxEJezcFpZYZVx7VpdwQE6vUqOhCu6xWqI7mZGvhFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) by
 PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 08:38:41 +0000
Received: from DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b]) by DM8PR12MB5447.namprd12.prod.outlook.com
 ([fe80::5f8:82ee:7da9:219b%4]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 08:38:41 +0000
Message-ID: <f0720898-aadc-4e98-9369-05ec5821414f@nvidia.com>
Date: Fri, 6 Sep 2024 09:38:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: host1x: Request syncpoint IRQs only during probe
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org
References: <20240531070719.2138-1-cyndis@kapsi.fi>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240531070719.2138-1-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::10) To DM8PR12MB5447.namprd12.prod.outlook.com
 (2603:10b6:8:36::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5447:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: ce73b5ab-8a58-4974-79ae-08dcce4f4f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGsxb2NXYUNXM09OVHJ5QWFwNjY5KzNQU0dRa0lDQXFiV0c5NzNXMGIxOWNX?=
 =?utf-8?B?Y0FmSTAzY0NsdDB5M3R2Y291Ulk1NEltZE9tZ1h0MUYraHUwZzd3a092R2hw?=
 =?utf-8?B?MHlwT3RicVlWN0Y1MjNuM0lMZGIzS09BNUJrS2JYR2RaZXF6T1lVOWl6R2ND?=
 =?utf-8?B?UDI4dG5TVEFPMmUvODZzamc5NnNPN1NwSWRoTU9nWkp3UEdZY05iWTN3bUs1?=
 =?utf-8?B?LzNxemVQQXBTUkYyNFdWeFdSUFBYZTlFelBoTExWczhpcHBDTWsvYkxsRWc3?=
 =?utf-8?B?VXREbnF0ZkJPNTNrMExsUWdOZ2RYbHd0N3pZUEhHdUthU2d4Z2lseTlTUzFX?=
 =?utf-8?B?ZTZ1WGN2MDZyZ3k0WFBkaXV6YSs3SXBSTGxvTTNqZnV5NUxhU0ZkY1kzS095?=
 =?utf-8?B?SEhkdDA4V3V1bkNlTWRHL2ppeHFQQUJieVE2UUJPWkdEdXhjalNydGhyYndU?=
 =?utf-8?B?aVhQNjNmWUNOK2s0M0g2QkhYaHE3eVVmczR0UW1EWUphMGs5QlMreDlweEo5?=
 =?utf-8?B?RXdXbWJrTXVubExlTkxCOWdMTWR4aXVGeFo5QVdFdjNLY29NS20rc1pySUtR?=
 =?utf-8?B?TDdWL1dhQkVuTjhIbG9UOEhsd2YvcVNSNEJFbG5NZkk2Z0tsNlQyYU8yZHpn?=
 =?utf-8?B?RG1oUTA5eXI3QkxNbE9peHJabndvd21HL2p0MHhiYUxmRVpMMGxYTHQ3dUFq?=
 =?utf-8?B?dHh5MHJ0N1ZvRzdIUG50NmVrMmROa1hrMjNuaWpUYXBaSjRseWVpTnhibGtD?=
 =?utf-8?B?ejdUOUFSUEFGMW00SE4rOTZoWi9Rek1UcVpZQmZpWkEzQUxYVGxXdzlvRWp1?=
 =?utf-8?B?akZQVzg3WU8rYlhtbWgxVGRmYmM4QlFDWHNLaWRMRWtwS2FrSmZOU21uc0cx?=
 =?utf-8?B?YU1lMkdTdHBZN1BpTHV5SG5DdHFlSWtYb2ZWYTEralhvVE9LcnJMNXhSNjFW?=
 =?utf-8?B?MzE5M0V0dEowcXRWaTZ6ZUcySCtLc1ZqeDkyU2plT0RaRVpoUmJaK3lxb1Fq?=
 =?utf-8?B?UVEzQk9nQTkvOU1DZlJGM1BDK2xiOXhJZmlmUlNhK0s5WXdUczl4T0hvSEFs?=
 =?utf-8?B?TlU1OG5uVVU0V2huakZqZFRSVnNKZVNFNFpNQmxiamJSaGVwdTFpWlh6UGV2?=
 =?utf-8?B?ZmI3L2VtOGtNYWM3ZElURG8rMFAzSXRULzJmOGEzeE1Tb2VJV3FjOUJabjQ3?=
 =?utf-8?B?dFRiV0d6UVN6dTBCTW1qZXZJdHhPazJsQnkrNkZjTU9kMW5rUVdlckZseVJC?=
 =?utf-8?B?aDlJRG9EbHI3TE00bXN3ZUFhYVFxbEVweHFOdENacFYyZXlaeXpWNWF1VzA2?=
 =?utf-8?B?dWEyZ2E5Y3B1RkkzM2VUWWlqWFZsSDhFM2g5YUJCb3djK2Q3NHVpWVNNR2lv?=
 =?utf-8?B?WUw3ZG5yVHQ3SVNZRk1LLzR1MHVuaXhIclYvK3d0VDFiT04vdGliaGE5bTYw?=
 =?utf-8?B?cDJFWGgzUFg1QzdGQjViY2dPUlYvUkVNblJ0TXN1QjhkWFA4YXkzYm0xRUFz?=
 =?utf-8?B?d0haZjl3SDBPdUdieXBMTENRWmVHTkpuQXM3Yk85V0Z3OVh2cVJUek9uQlpH?=
 =?utf-8?B?N2EvUk1vZ3g0OGtMbkZDUUE5aVdYQTUydW5PRFRQQ1p1MVluWWtXQ2dMY1hT?=
 =?utf-8?B?Q0FhVnpHNnhHN0RsUjlaZnprT25kN29xZkhhYllucHE5bFhrMDFwek50eUFE?=
 =?utf-8?B?TXhjWVc1elluSFliV3BGTEtCSm54UGtCeDJlTWpJS3U0ZUZkTXdzL1E5ckhm?=
 =?utf-8?B?aEY5amZXNG1tU2V6dmxldGxEZlhoeC96SkQ2VjFYZE8xZGtGR041elJNbXFD?=
 =?utf-8?B?amR1S3VIemN4K1ZDNXZBZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5447.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXpNLytFRWhpV0RlcWlBTk1uWjYwbTlicCs1MUl0bXBVOWVWbCtXcXd1Y2d2?=
 =?utf-8?B?aXV3WCtweGhpRE5CcTQxNUg2bER3Zm42d3RNQ1krZ29hazYvV0gwSXFuWmlq?=
 =?utf-8?B?K0R3MjVhNHBhZEVnQmpRS3ZSZ1RJcFFxSUplQkthWkZTOU5kUnE1Q0V1aGFN?=
 =?utf-8?B?alovS05yTFdET0plMzFtVUE3S3dtem4za3JLSDBXQ3dYQ2VhV2VycDhKdnFO?=
 =?utf-8?B?cGhadGFxUHMrblJ4RFEyN2NNaHVmUzJFeXc5SEtCaC9adzlzZ1RNZkk3YzBo?=
 =?utf-8?B?NlZHdmk2bVkySHV1QWs1RVNJeGszQ0ZkQ3oxVlFUUExpVjV0ZkhpdXYvQUpR?=
 =?utf-8?B?Zzh6NldHN3JlTmFvZkh5bEo0Wjg3aU8xRFhMbVBWT2RnWFdiOHozamFZeG5L?=
 =?utf-8?B?ZXZ6cWphUnh4TWtFaklXOFdPc3RzdDZ5U1VLL3BQblA2S0gzUDVnNG5sUEQy?=
 =?utf-8?B?ZXQzd3RDTDBVKzY1RkMxbHZZQk9JNFIvaHM4VjdBZ3pRRGtpZDRNcnZBci83?=
 =?utf-8?B?bGNiWGxQSHlnSVhXU2ZvNzExdG5WL3dZR0hzR1dNaEFyUHJuRHRud3NYYnBs?=
 =?utf-8?B?ZnBGN3p0RTFwbVBiK2ZEUFlpYUszdjBXY1A3K0ExT2F2YTZsTWtCa3RkS09m?=
 =?utf-8?B?N3BPczV0ZTFLZEZNV2ZlMEVPOHdFa1BveXdMb2Q3QXhrMzhPZmRObk5hR3lE?=
 =?utf-8?B?MkpjaEY3OUw0ZmwxTWo3WDFXckwra09TMnZJSVRFcWRPaHRXRW02blptZ0RG?=
 =?utf-8?B?SWNLcHFsUFRWUm8zaXNRaE9FTVpzQjhMd0dkNUc1eEVxbEpKRzN2ZHRPUjdC?=
 =?utf-8?B?SmhqM0dub0d4citVWTVSTTJKRFhBcEZ3YjNXZ2hORERIU0I2TnpwUi9rQTBn?=
 =?utf-8?B?VTFuMEJFRTNBUGVub0U1T2RhaTlMeGliV3krTWtaQkxRSFVlRUR5cHVwZnl0?=
 =?utf-8?B?SW9qZUZ6WnoyWmh5bGdmV1NCdWxEeEk3Z3Iza0JzUFVtRkxSeUlKVU9aMmVK?=
 =?utf-8?B?dUgrN0NSZUY5a3hMMnJRRHhhS2RyeE0yV3BnV1VlQm1WRVVBU3d6ZzlQVkYr?=
 =?utf-8?B?OUV6amwwNUJoSWN0Qkkzdjl4MVVLeEI1aThwczJxaFRaN3crcFNVb3VCbUh5?=
 =?utf-8?B?d2ZnRkdtQlVaNHBqZW1hMWtGUXpjWGQ4KzBxTC8wWHBqa280RG5BWXB5em1O?=
 =?utf-8?B?WUhZVG93Y0s2R2VUQ2xnYkdNbjBON0VBZFBNV2czZFlXRXRLNE10T0dEYnJ6?=
 =?utf-8?B?S042OGVnSFBUTUlldDBsWW1xL1hGVGY1OHcyTzExQm1SZnhFZHJWUzZYTFNu?=
 =?utf-8?B?NTBrK1EzWDFuNDl0K1FXMlo0bmtiYkd3Q25UWnYzcCtXSzFEdWE4VGF5cGJv?=
 =?utf-8?B?bHFDY3VlckVIWEtlTXJTV2ZUT2pmL1NSYXlnaEdkQXBqNHJWUHhycGVaL1Rw?=
 =?utf-8?B?M1J5c0p6WnZtTTdxWDEvY1lRQk55YjhDNmR2cFJwblI3T2M0SEtPc2FwTEZ1?=
 =?utf-8?B?MlRUdnpTZkphSmZZK0VJWlZtUEllYll6ekN5dU9FOEhmdEtWNHZhYy9VRkNH?=
 =?utf-8?B?L3BXTWtJVjA1N0l2ZGF6WE5tRm1Yenh4WWlNYjZMN1hGZ1YvQjRXMWtnRTFu?=
 =?utf-8?B?b2hjT2hPQUY2QWNaTFNRQ2VwMk84cE02NVNKUTR5MjRvNjBaOVhkWlVScis0?=
 =?utf-8?B?TVMrOVJ1MG9aYzZ1OEZneVhBV1pmNTRBbGNHV2ZFZTcyYllpRC81N2xiMjhr?=
 =?utf-8?B?MTBSQTdENDFKS00yUVkyZzdrWStJMEpSVXoveGdUUVhTWlE5YnA4RlAyK1Fx?=
 =?utf-8?B?aVcycFlyQUVxNE9sVEJHQ2dpT2l0UzJLMTB2SjB1b3ZSaEVSamRMWXhXMlBR?=
 =?utf-8?B?aFRPM1NmUVVBeTJDS2V6R2NPcjZnTUk5TWVydGw0c3YyUTBQU203MUQrWUlM?=
 =?utf-8?B?aHhQa3pHUEdFT0pObnNCVmd1U0h2VWJ2VXZyVHY1b2pQUytuYnR4Z1cvdms5?=
 =?utf-8?B?MG9hR0szTEJFNEE4N0gyamhzK2FGWGgwU0gyWDQ1ZmpxRE9ZWWwzUVZHTENL?=
 =?utf-8?B?ZXl5SDlYR1RjMU5pWGVFMStFUEFzbG95SnhmTll6cjdWa0gxTENCR3Zsczk4?=
 =?utf-8?B?SUE5aWMxc3dDbWdKTUJPNHdOSFA0SDJjTGhEd0c1djZBS0RrVmsrMHNjOHBY?=
 =?utf-8?B?MFArMFFJQ2M4T0VKbXRHeU5aUlF6MWJXYmF2eWJDQTJZcEp3NGtTaGJTYTcw?=
 =?utf-8?B?M3ZWK2QrKy9ZamFxQS9CeTlXVzFRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce73b5ab-8a58-4974-79ae-08dcce4f4f32
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5447.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:38:40.7946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUmIMILEKBN5fFYVqxRNPZzNWLuL3SrHQSeQzSTtD2UpnmeAyRkZvGBF4RZOyxL5M/av9mUjc/03+3k/WkbbYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277
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

Hi Mikko,

On 31/05/2024 08:07, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Syncpoint IRQs are currently requested in a code path that runs
> during resume. Due to this, we get multiple overlapping registered
> interrupt handlers as host1x is suspended and resumed.
> 
> Rearrange interrupt code to only request IRQs during initialization.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>   drivers/gpu/host1x/dev.h        |  2 ++
>   drivers/gpu/host1x/hw/intr_hw.c | 37 +++------------------------------
>   drivers/gpu/host1x/intr.c       | 21 ++++++++++++++++++-
>   drivers/gpu/host1x/intr.h       |  5 +++++
>   4 files changed, 30 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
> index 53af0334c6e1..d3855a1c6b47 100644
> --- a/drivers/gpu/host1x/dev.h
> +++ b/drivers/gpu/host1x/dev.h
> @@ -9,6 +9,7 @@
>   #include <linux/device.h>
>   #include <linux/iommu.h>
>   #include <linux/iova.h>
> +#include <linux/irqreturn.h>
>   #include <linux/platform_device.h>
>   #include <linux/reset.h>
>   
> @@ -81,6 +82,7 @@ struct host1x_intr_ops {
>   	void (*disable_syncpt_intr)(struct host1x *host, unsigned int id);
>   	void (*disable_all_syncpt_intrs)(struct host1x *host);
>   	int (*free_syncpt_irq)(struct host1x *host);
> +	irqreturn_t (*isr)(int irq, void *dev_id);
>   };
>   
>   struct host1x_sid_entry {
> diff --git a/drivers/gpu/host1x/hw/intr_hw.c b/drivers/gpu/host1x/hw/intr_hw.c
> index 9880e0c47235..415f8d7e4202 100644
> --- a/drivers/gpu/host1x/hw/intr_hw.c
> +++ b/drivers/gpu/host1x/hw/intr_hw.c
> @@ -6,18 +6,11 @@
>    * Copyright (c) 2010-2013, NVIDIA Corporation.
>    */
>   
> -#include <linux/interrupt.h>
> -#include <linux/irq.h>
>   #include <linux/io.h>
>   
>   #include "../intr.h"
>   #include "../dev.h"
>   
> -struct host1x_intr_irq_data {
> -	struct host1x *host;
> -	u32 offset;
> -};
> -
>   static irqreturn_t syncpt_thresh_isr(int irq, void *dev_id)
>   {
>   	struct host1x_intr_irq_data *irq_data = dev_id;
> @@ -54,7 +47,8 @@ static void host1x_intr_disable_all_syncpt_intrs(struct host1x *host)
>   	}
>   }
>   
> -static void intr_hw_init(struct host1x *host, u32 cpm)
> +static int
> +host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
>   {
>   #if HOST1X_HW < 6
>   	/* disable the ip_busy_timeout. this prevents write drops */
> @@ -85,32 +79,6 @@ static void intr_hw_init(struct host1x *host, u32 cpm)
>   		host1x_sync_writel(host, irq_index, HOST1X_SYNC_SYNCPT_INTR_DEST(id));
>   	}
>   #endif
> -}
> -
> -static int
> -host1x_intr_init_host_sync(struct host1x *host, u32 cpm)
> -{
> -	int err, i;
> -	struct host1x_intr_irq_data *irq_data;
> -
> -	irq_data = devm_kcalloc(host->dev, host->num_syncpt_irqs, sizeof(irq_data[0]), GFP_KERNEL);
> -	if (!irq_data)
> -		return -ENOMEM;
> -
> -	host1x_hw_intr_disable_all_syncpt_intrs(host);
> -
> -	for (i = 0; i < host->num_syncpt_irqs; i++) {
> -		irq_data[i].host = host;
> -		irq_data[i].offset = i;
> -
> -		err = devm_request_irq(host->dev, host->syncpt_irqs[i],
> -				       syncpt_thresh_isr, IRQF_SHARED,
> -				       "host1x_syncpt", &irq_data[i]);
> -		if (err < 0)
> -			return err;
> -	}
> -
> -	intr_hw_init(host, cpm);
>   
>   	return 0;
>   }
> @@ -144,4 +112,5 @@ static const struct host1x_intr_ops host1x_intr_ops = {
>   	.enable_syncpt_intr = host1x_intr_enable_syncpt_intr,
>   	.disable_syncpt_intr = host1x_intr_disable_syncpt_intr,
>   	.disable_all_syncpt_intrs = host1x_intr_disable_all_syncpt_intrs,
> +	.isr = syncpt_thresh_isr,
>   };
> diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
> index 995bfa980837..b3285dd10180 100644
> --- a/drivers/gpu/host1x/intr.c
> +++ b/drivers/gpu/host1x/intr.c
> @@ -6,7 +6,7 @@
>    */
>   
>   #include <linux/clk.h>
> -
> +#include <linux/interrupt.h>
>   #include "dev.h"
>   #include "fence.h"
>   #include "intr.h"
> @@ -100,7 +100,9 @@ void host1x_intr_handle_interrupt(struct host1x *host, unsigned int id)
>   
>   int host1x_intr_init(struct host1x *host)
>   {
> +	struct host1x_intr_irq_data *irq_data;
>   	unsigned int id;
> +	int i, err;
>   
>   	mutex_init(&host->intr_mutex);
>   
> @@ -111,6 +113,23 @@ int host1x_intr_init(struct host1x *host)
>   		INIT_LIST_HEAD(&syncpt->fences.list);
>   	}
>   
> +	irq_data = devm_kcalloc(host->dev, host->num_syncpt_irqs, sizeof(irq_data[0]), GFP_KERNEL);
> +	if (!irq_data)
> +		return -ENOMEM;
> +
> +	host1x_hw_intr_disable_all_syncpt_intrs(host);
> +
> +	for (i = 0; i < host->num_syncpt_irqs; i++) {
> +		irq_data[i].host = host;
> +		irq_data[i].offset = i;
> +
> +		err = devm_request_irq(host->dev, host->syncpt_irqs[i],
> +				       host->intr_op->isr, IRQF_SHARED,
> +				       "host1x_syncpt", &irq_data[i]);
> +		if (err < 0)
> +			return err;
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/host1x/intr.h b/drivers/gpu/host1x/intr.h
> index 3b5610b525e5..11cdf13e32fe 100644
> --- a/drivers/gpu/host1x/intr.h
> +++ b/drivers/gpu/host1x/intr.h
> @@ -11,6 +11,11 @@
>   struct host1x;
>   struct host1x_syncpt_fence;
>   
> +struct host1x_intr_irq_data {
> +	struct host1x *host;
> +	u32 offset;
> +};
> +
>   /* Initialize host1x sync point interrupt */
>   int host1x_intr_init(struct host1x *host);
>   


This change is causing a boot regression on Tegra186 with the latest 
-next. I have reverted this to confirm that this fixes the problem. I 
don't see any crash log but the board appears to just hang.

Jon

-- 
nvpublic
