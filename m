Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A629C9D326
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 23:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9683610E6F3;
	Tue,  2 Dec 2025 22:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TCCaZw9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010060.outbound.protection.outlook.com [52.101.85.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62DC10E6F3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 22:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAViGX7FH6L7irn1EhTvRjFUpQ2SJI7/RmD8TvZAkC204jcx77BMy92AvQhIGJLNdMmybpsJXRlzUTXOvO1swng8TRV496CHuNQhP29XPPRBFtgNryJYN1hjlS8OpFk/QlvAfGDDy21JTOXrSbyIAmRdiiSlQt2E13N2HggFtyeeA/2x/cOr6qA/rdfxrQgh7uXQ3deA1OtKSQIQUQDVc8u0ag59LrWztbD7DeJFnzqzcxHhTxLdTPkwnVhKLtgLXfX+Y2xFatDBv4Wukm5MIPP/DAN9DAu/Aq+quou4x46Ko6dIk9WeMhCJCFoAYjCzwQSQK6eVnvHUrJsXe4wFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7BRKgMa12mEyAcD4Gg+ZxUH5q/w1fresXx3e5ni2gg=;
 b=sdVbUteJbPqpIlN9qeW1mt/V+bmibMYKPRImiwvadUrYD/EeTKygF3SOlrg0I33m1sqalufNMFQ9WGMtLo4HgoLeoIjGGO9dDFPgVQGB2eTME9N80U7P8CSoZsecKFOkrZi9k9oIbex0rml59Cz2n73duLpDO9YezNTgf3ahaxsr2VY+4pK748CKnoJLczRezqOTWhWfFNhDuUEP1rWrBw6chsY410mlLmaQuR2KI3z1NW+0bmHrxJ27+ty7MZjjc0JZSV2Vd8B0cK4qROw2l/E3K54c3fBNNcm8gzjuyAAk0XrdPRiaAXLbPAfljyr5fzWq0ET90YPruDUlYTDEQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7BRKgMa12mEyAcD4Gg+ZxUH5q/w1fresXx3e5ni2gg=;
 b=TCCaZw9tsC+UYMuCnpWzPNqrJKDRs7U8IJ3gbF4ukREymAPhxGk7t4j17gpNaMec8ztPzrpGIZqcMDXxS/UL9RdeWidM6yWWzWI/LvygcW7tTQ36OihY1JTDNBpzRu0HvDaB4XK8mKvmu1ZozamlOagDg7KGVPWE2a+zBpmawRIyNe9TgHVB0QOmMmDtlYpCZenVTgDIgC1Vxk3K0zniP1Qi+lQldw1Y/8tgKtoUigjdWqtrLYYx3SyR3Cm3ahj0uyG8g9AA4/qYfs6OvZs1E8ewf8LZHnwxwWGL6PKJOMXvIL0dy8tQ/Qhm8iyFMnUhNzHT45FYLiJyP9SWyjb31g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA1PR12MB5669.namprd12.prod.outlook.com (2603:10b6:806:237::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:20:37 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 22:20:37 +0000
Message-ID: <8243f83c-6485-4632-816f-4cf103d0871f@nvidia.com>
Date: Wed, 3 Dec 2025 09:20:31 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] Remove device private pages from physical address
 space
To: Jordan Niethe <jniethe@nvidia.com>, linux-mm@kvack.org
Cc: matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org
References: <20251128044146.80050-1-jniethe@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251128044146.80050-1-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::14) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA1PR12MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d632118-05af-454a-5dd7-08de31f10515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm5icW5MOC9aZjVXVUU4UmJkSnBnd2MvR1AyTzQ1N0ExYzB1RWxKTmEzRlc1?=
 =?utf-8?B?MFN1YTZRd0hzUFZuYWhNZ2RaVi85eGN6ZlFzRHFTMDdLSEpUY0dCZ3BOTHE5?=
 =?utf-8?B?VS83WENKU3AxdXBrdkRLS0lZVjV1QXhNQmZhZ0Jwd0JxMnQzcW42TGpmbEZW?=
 =?utf-8?B?Q0VaYzhKWmRiOWRtM2hZWWU4TFBGR2t6WDdtejRSazZUMWZNdzd0QTNUYjhy?=
 =?utf-8?B?YTZNSy96MmZ1cExDSlNwTDV4TXU4aU9aK1ZqeThOQ3lRajZzck43dUI5di8v?=
 =?utf-8?B?RG9WV2lackdTMGF5RzNndzIvanBqQisvUSs0VTg3ZVpFVjNXNVpBd1ZLQnY2?=
 =?utf-8?B?OHd4QXlCUTZ5N0V4QzNxYkJFM1NhSXRweS8wSmwvbFB1Z3Zoa0x5ZVV2TkNo?=
 =?utf-8?B?YXdDZGQxajQ2K1pkQmt0S0VrMmNrZkY5dWplbEFKSVZlamNqMGRGaGo4cVhB?=
 =?utf-8?B?aE1Ob2xMUHVBU2tqbzIwTHRFM3ZHOGY3UTdsVWJqaVZsbDhua1I2SExhOW1H?=
 =?utf-8?B?bmtBYWpsSnpkTjduRHh3K0gyY3UwTm1xSW5FQVAzTE9YQmE5bDhDUVFxQ3V2?=
 =?utf-8?B?eG5oS3dCTGlwdTJzam9LR3JXckJ6ZjZmSFRaV0h3eUJKTTRoSjBrbzBFVTVO?=
 =?utf-8?B?U2YwcHNUM1hmcUdUcExtQlIzNVFaNXdUaHpvUFNXZGJoZ1FhdlEwb0w0V3VM?=
 =?utf-8?B?NzVzZEtoSHpOTEIrMlRobDZqc09lcVlIaGFuMHhaT1lJZTZJbDNTQjJVMDY5?=
 =?utf-8?B?ZFVheFdqcHJrVXIxMmNyS1JkdGZtYUpWZ21uZVgwMmE3eTlhbnBETUYxVUlL?=
 =?utf-8?B?QXlpbzR4K2tGYU9RRzR3ZDNXZEpIT0ZmQkM0TWR6bnFUZ2tBYjZIcnR4WkJn?=
 =?utf-8?B?OFhxYnV2WEJkS0JYU1MyNjI1YzBaeVgxNHFYWEdMbTdYWkZDUUE2R0NMaUtV?=
 =?utf-8?B?R1JLa0NyeXJJNzhiTlNzNlgveVBRaHRGUUh4WTJsN2YvY25zKytwa2hNOVRC?=
 =?utf-8?B?RmhHb2hiZjVKY01sOURxYjZqQ3dBWGN5TjBhMFpUeWN5ZE40eXdpZFVkR2I4?=
 =?utf-8?B?ZFBXOFBaRm52ZHhob0RLdDFTOEllaWVCZy9KNUw4a3BPSzRQYjZXL0pvcGcx?=
 =?utf-8?B?c2Q3bWlGTU5hczhad3UvSkxVajZJUENrL2FOQzRsa3piZUVlWXpTdFhlTVVz?=
 =?utf-8?B?b1hZSS9BcjNQaXhNSTIvM3dPKy9kWGFjZ1pVK05lQVA0K3hvRS9POUU3b2NX?=
 =?utf-8?B?cUNyZGthU0hCSHh6RERSMWRtb0dBYW5YbUNuM1phSE1mSDJONytnbGVTSWJl?=
 =?utf-8?B?Qm83R0RMaml4R2VJdm1rei8vcFFaNC9DQS9ZVGlMb2JHTHdPY25nd0N4dVg2?=
 =?utf-8?B?aUlla2piRXNVeFE1SUF5YkJ4dE95eTNTS25DWE5JdytqNkk2SmZIckUyaElO?=
 =?utf-8?B?MUpXYlJwdi9ESDJyOGFaS2hVYXVGTC8yc1BGT3hhWlN5eG1SdXZ5VmVHSEly?=
 =?utf-8?B?cnV5Y09TaWplNWxBcjF5T1RIQi9vMTRqcTNLc2paa3BRRDg2VWZvMFd2cGgy?=
 =?utf-8?B?YTZ6aExLbVdMeE9kWldiWmtxaHlkNTZTWGxiNWRoN0pDdnIvb2x3dzNJZ3lG?=
 =?utf-8?B?V01Jd202S2thdFBSOFB3bndjTjY4U2I4YWlWQmRJcjZKalJ2M29RRGtGZkcy?=
 =?utf-8?B?ajR2WjhmRldLeXhwanB2WUkyM3ZoUHdVQy9nR1FHUk5VRjNnSDk3WVNVclEy?=
 =?utf-8?B?RzAvRmZ1cDJBNmZSWlFPSWhpR095N3lVSEJ0My9vZU84N0NPYmdsL2RVUWRR?=
 =?utf-8?B?NDJoRTJ0QVZybkZVNzltMzJ2VVF0ZDJYRXZFV0xJUHBMRk02RmRISkN4SWZo?=
 =?utf-8?B?OU1SUVBjcnFSQjJPU0Vocm1UbW9FZWY4dmEvanVWQ1RpNmFqOVl2VURja3R3?=
 =?utf-8?B?YldHa1gzS0c0RXJ2L2JOOGlNR3NuRlNuUk40aEYxVWtXZ1hIMjRQaThlRDhK?=
 =?utf-8?B?b1hKK2xHeXlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzlpNEVXVnBaVFVhRnVjaG9ESUhWUGlQUEMyRXFZRWxma0hKMWZXTkJWUW1r?=
 =?utf-8?B?MmZIZzFhaG9CSWxkWHlHWndYbFREV09ZcndIVHlGVHkvNmhPdXJFY0JuZEdJ?=
 =?utf-8?B?b015RkdFMWlLVGl4UnhmK3BUSmxiaGozamUySjdtS1gwZ1hhUjlEbWJQVWVo?=
 =?utf-8?B?aDdNcG0vS2hzYjVlWDNESWRvU0xUWE5wcnp6MFZmTDRITGluaEF5ekE4KzBH?=
 =?utf-8?B?c29uK3VjNVoyb1g3NXNObmpkN2dXWjdXMnpEbDdsWEU2R0dkWmRNcDFzVkY1?=
 =?utf-8?B?RDUxUmVJZHdEakJYQVV6SzdLVHpHdDJDQWlZOVU0WEswZ3lqZDRpNWpNbXVj?=
 =?utf-8?B?bnMxSUlNWEl3M01KSjFxeE1NOEJwSUVnU2twN0RURHJlK3IrOXRCQXUwWWFY?=
 =?utf-8?B?VTFPeUZ3RjBXUy90VTVSSkFuU1NUcm9CS2M4SkxrMVRObE5BOUltbURaYkxv?=
 =?utf-8?B?OGlpRVZuU2hTZ0VBQ24vclBGL1h3YituMFNYcXVtZGRCZk9uaGNNTnVSQWJX?=
 =?utf-8?B?bGFUdWgzaUlZM0luUzBWcGdPbExYRHVyZi9sLzY4MFpvU3JzSDMyUWg2ZEFB?=
 =?utf-8?B?bnpnL1BjZjJROHVoazNmZEV6QUZQNmtMeEtBcERrb0Zvc3c2RGZYL0ZWVVpT?=
 =?utf-8?B?bjBzbjBwclNZd1ZjbWxsY0dvQWtCZ0U5RG8zaEdSRXp1T3R5MWJFNlFjdDY0?=
 =?utf-8?B?TXkwSzlvRlhNVU1sNE4vbjRXeU16K0IrSDBMMnc3RHRqUmQrK09ubmVWUTIr?=
 =?utf-8?B?aFpnNnlqQ0pNS215YVptRFZoN2hOdWh2dEY3djQ5ZzVaSXIvSU1TMnlWNG1X?=
 =?utf-8?B?dXV3SGZhd2hxd2ZlbEFDMys3b0JPRkZveWRqbEFTZlpWV0ZOaUhmbEplWkg3?=
 =?utf-8?B?bnRFRU9jcnpKNko1SFY5bTIrVnFXY05TVm94NVFJZGxMVjB0ZHBYUklsamYz?=
 =?utf-8?B?RWI2QUZ2OUkvbnNkQzdDajVZOHV1Wm5vK3JoRTlMOFJ3WGZ1a053QVhiNGFm?=
 =?utf-8?B?ZnE1c1NVWThxYXh1TC9DZEtkbWNlcDJlOC9tMEovb2xoV25reDF4Y1dkQWdH?=
 =?utf-8?B?clhwRURsRUVQSUZQWXp5UGNRSjBhUHMvMEo2NnJKK29zSWlVMThVa2MxU0hn?=
 =?utf-8?B?Q1h4TkhZNlpCVzdhdU1SOXFGbTYzdTBhY2I0SVVPV2NRZjBsamVycmVCSkt6?=
 =?utf-8?B?b2pGVFFXVlBxWmJRWWVMZkg0eEJXSE0zbDNNRFJ0V3hsVW0zWUlVTVU0UldK?=
 =?utf-8?B?RmZrWnQ2dnNiOFg5V3d4U1c0ZTZlR1RRZ3JnbGNTRmZPYm1hU01wWUFNcVJ0?=
 =?utf-8?B?QVNacU9JRVQyeWdNdDAwaGdJaDFZQ0ZRQW9Xa0lhSWt3WTRlRGg3VWg5M2g3?=
 =?utf-8?B?M3NtTTEwVURMdXl5a1VFQi9PRXRxUW5MSWNuNUZBd2duakNGSmp3TW1tSURC?=
 =?utf-8?B?ZjZ5UG15bWNiWnAreGJjT1htTVhvZGorNGdCejVPeUhKUzNRV0VxdWVaYzQv?=
 =?utf-8?B?ZVEzbUUwUktVOWs1czhTM2M2SGsvcUFXVG95VmF3dUFjeXpHSDB1ZDBoNTI5?=
 =?utf-8?B?YjVELytpYVIwcXlzRk1DQW55NDRjdFlKbG53SFh6NmErbk9NVmtuZUVHR0Qv?=
 =?utf-8?B?NWx0SjBMdW81SmphK212dHZiS2tuVmNXN3BHU2gzZDNqRXdOSXlLOVlKWGJ0?=
 =?utf-8?B?T1JoWkl3UHpCaWV2VWFDMk1kaDhuZ0wyU2FMTUplVUVRc0EybnY4Qm9HVDhG?=
 =?utf-8?B?OXNyc1BOVnpSSU1raS9GOG4xSmZPRHBPM2pxOUY4T2JHenVPMDhKVTVldG1Z?=
 =?utf-8?B?OFZEcExlcDIzamxhSjMxSnVLbG9YRXZSaU5FMTNBNFFMVW0wSEI3UHBhQkUw?=
 =?utf-8?B?aTRtbHp1dE5KNHJCSzFhS2IxNE8xNmw2U1hwbzhJeHMxYVlEY3NESU5DK0Rx?=
 =?utf-8?B?dUxRcTVISUd3L21WTis5alBCUnpmSjdXSkdoVFpjMG5YNjdhbWFwNyttbTh1?=
 =?utf-8?B?OU0xYWcxUXhUendmbGRUbmxBT3hRSkdCNy9vemo5a282TXA1MmtlWDc1RElW?=
 =?utf-8?B?WFF0ZW9PNnNTRFlGWWtzVTBsUUY2U0todFJKdlZHZU5lVEd1cEIzU1EwN1Zq?=
 =?utf-8?B?WVcvZmtrSlJaNUJNSmtBUy9YbWRxd21QTk9lanNlajJZaVJVMzQwVnBLMm1B?=
 =?utf-8?Q?KMU9z0df+YodZFzB1tu6kVW15o20YSSsSv6v2Ct73uAh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d632118-05af-454a-5dd7-08de31f10515
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:20:37.7447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rq0fUc8P3f3zHjbt0e4wtwkZIMrAnDgQ20Xp4zn9UZlkDG0PoEdD4f81PhxZ7KJWZMpk7B0Gx5jQXBlvhFWNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5669
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

On 11/28/25 15:41, Jordan Niethe wrote:
> Today, when creating these device private struct pages, the first step
> is to use request_free_mem_region() to get a range of physical address
> space large enough to represent the devices memory. This allocated
> physical address range is then remapped as device private memory using
> memremap_pages.
> 
> Needing allocation of physical address space has some problems:
> 
>   1) There may be insufficient physical address space to represent the
>      device memory. KASLR reducing the physical address space and VM
>      configurations with limited physical address space increase the
>      likelihood of hitting this especially as device memory increases. This
>      has been observed to prevent device private from being initialized.  
> 
>   2) Attempting to add the device private pages to the linear map at
>      addresses beyond the actual physical memory causes issues on
>      architectures like aarch64  - meaning the feature does not work there [0].
> 
> This RFC changes device private memory so that it does not require
> allocation of physical address space and these problems are avoided.
> Instead of using the physical address space, we introduce a "device
> private address space" and allocate from there.
> 
> A consequence of placing the device private pages outside of the
> physical address space is that they no longer have a PFN. However, it is
> still necessary to be able to look up a corresponding device private
> page from a device private PTE entry, which means that we still require
> some way to index into this device private address space. This leads to
> the idea of a device private PFN. This is like a PFN but instead of
> associating memory in the physical address space with a struct page, it
> associates device memory in the device private address space with a
> device private struct page.
> 
> The problem that then needs to be addressed is how to avoid confusing
> these device private PFNs with the regular PFNs. It is the inherent
> limited usage of the device private pages themselves which make this
> possible. A device private page is only used for userspace mappings, we
> do not need to be concerned with them being used within the mm more
> broadly. This means that the only way that the core kernel looks up
> these pages is via the page table, where their PTE already indicates if
> they refer to a device private page via their swap type, e.g.
> SWP_DEVICE_WRITE. We can use this information to determine if the PTE
> contains a normal PFN which should be looked up in the page map, or a
> device private PFN which should be looked up elsewhere.
> 
> This applies when we are creating PTE entries for device private pages -
> because they have their own type there are already must be handled
> separately, so it is a small step to convert them to a device private
> PFN now too.
> 

It'll be important to distinguish between the two PFN's and ensure
that they are not treated as being interchangable

> The first part of the series updates callers where device private PFNs
> might now be encountered to track this extra state.
> 
> The last patch contains the bulk of the work where we change how we
> convert between device private pages to device private PFNs and then use
> a new interface for allocating device private pages without the need for
> reserving physical address space.
> 
> For the purposes of the RFC changes have been limited to test_hmm.c
> updates to the other drivers will be included in the next revision.
> 
> This would include updating existing users of memremap_pages() to use
> memremap_device_private_pagemap() instead to allocate device private
> pages. This also means they would no longer need to call
> request_free_mem_region().  An equivalent of devm_memremap_pages() will
> also be necessary.
> 
> Users of the migrate_vma() interface will also need to be updated to be
> aware these device private PFNs.
> 
> By removing the device private pages from the physical address space,
> this RFC also opens up the possibility to moving away from tracking
> device private memory using struct pages in the future. This is
> desirable as on systems with large amounts of memory these device
> private struct pages use a signifiant amount of memory and take a
> significant amount of time to initialize.
> 
> Testing:
> - selftests/mm/hmm-tests on an amd64 VM
> 
> [0] https://lore.kernel.org/lkml/CAMj1kXFZ=4hLL1w6iCV5O5uVoVLHAJbc0rr40j24ObenAjXe9w@mail.gmail.com/
> 
> Jordan Niethe (6):
>   mm/hmm: Add flag to track device private PFNs
>   mm/migrate_device: Add migrate PFN flag to track device private PFNs
>   mm/page_vma_mapped: Add flags to page_vma_mapped_walk::pfn to track
>     device private PFNs
>   mm: Add a new swap type for migration entries with device private PFNs
>   mm/util: Add flag to track device private PFNs in page snapshots
>   mm: Remove device private pages from the physical address space
> 
>  Documentation/mm/hmm.rst |   9 +-
>  fs/proc/page.c           |   6 +-
>  include/linux/hmm.h      |   5 ++
>  include/linux/memremap.h |  25 +++++-
>  include/linux/migrate.h  |   5 ++
>  include/linux/mm.h       |   9 +-
>  include/linux/rmap.h     |  33 +++++++-
>  include/linux/swap.h     |   8 +-
>  include/linux/swapops.h  | 102 +++++++++++++++++++++--
>  lib/test_hmm.c           |  66 ++++++++-------
>  mm/debug.c               |   9 +-
>  mm/hmm.c                 |   2 +-
>  mm/memory.c              |   9 +-
>  mm/memremap.c            | 174 +++++++++++++++++++++++++++++----------
>  mm/migrate.c             |   6 +-
>  mm/migrate_device.c      |  44 ++++++----
>  mm/mm_init.c             |   8 +-
>  mm/mprotect.c            |  21 +++--
>  mm/page_vma_mapped.c     |  18 +++-
>  mm/pagewalk.c            |   2 +-
>  mm/rmap.c                |  68 ++++++++++-----
>  mm/util.c                |   8 +-
>  mm/vmscan.c              |   2 +-
>  23 files changed, 485 insertions(+), 154 deletions(-)
> 
> 

Balbir
