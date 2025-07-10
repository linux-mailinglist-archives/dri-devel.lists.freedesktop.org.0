Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B7AFFB5A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD16910E893;
	Thu, 10 Jul 2025 07:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kLeGfhuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B93C10E893;
 Thu, 10 Jul 2025 07:53:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LeiSU9P5ckNn9D0WOm0Jb0oDhJZUQzds/98nnIqKVGPps4SNQuda+8HMo3Y30wNihqMVUxCpyUHakSiLTW6gC53eVyB39MwWKZxj/xa2px23l/A3Jijj3j23W4QxBEWACj7wH61TE9m5G5dBID72wfyjMYZ8KTJN9ficRRz/w6CpQSBzWyv6A8kkunc5TP6m8KKQkeSU2zNU5UP3jH0cGEdi3Qf51NDrArCIeeLDWDEVAUL+W2rBW0w6ACkrrSPKSyP9nyjRfZls126ZOmZmPAq6Q4kILPJXwMOuQe4t4BbKduCU/6La9jNGT3txVb31nN3obdpQGpHyEFHeoL8NHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3YC4bdLpvI5W0+ZrZ8fvV6jLRA73K1VqPescHgY1eE=;
 b=SNGRPcwiOvbBccAiwUAvO8Gf3lVgGiVy7BNF7H5xcbPhKv4iKvNI8lZshP4hUmod8wVlDVKK+x1FBxefy1K9aDNFGtG79qZxHObhwnrgeps45JRV2foa/jYGhZSUWRzQNs3pLvVqMaP4sHamSi0bigkj0aRMahPtndNAU9oJVvZhMKCaERYU/dyo8eB0ejMUl22rvOpsS5d8dnqra6v5oTH4Mghq0wcaPvS7ug5r0plmczzaLgIQVyX9DwUd8Tgr7GxUGd7kvDP+F7jKc4+yMLDtFgs7YRmk7tYhDZFPlgVmIGanRu47LZVQIshhDww9lnzfwKq/6H5DDDM9MboBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3YC4bdLpvI5W0+ZrZ8fvV6jLRA73K1VqPescHgY1eE=;
 b=kLeGfhuJ8Etq3mQugwNJ0rCXCyNqquSj+OsDM8B0HLMJsZMZp5uRM/MF55R4kbGRB1jq1c22BiYm3hdi7eGRNODr+wZFGo/9ipQi5NCH6nbGq50VhwvKz2bR254524/r+45W0iBNr7iy9gDrspfPRIrWbXuvtL/NeC+Y71gxRNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV8PR12MB9360.namprd12.prod.outlook.com (2603:10b6:408:205::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 07:53:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 07:53:00 +0000
Message-ID: <4ebbdcf1-6123-4076-920d-bf6bcd292fac@amd.com>
Date: Thu, 10 Jul 2025 09:52:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
To: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: zhenguo.yin@amd.com, Emily.Deng@amd.com,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>
References: <20250710063633.498633-1-lincao12@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250710063633.498633-1-lincao12@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR12CA0019.namprd12.prod.outlook.com
 (2603:10b6:208:a8::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV8PR12MB9360:EE_
X-MS-Office365-Filtering-Correlation-Id: 821b5659-9a91-48d4-4d25-08ddbf86cac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWdlaE8xUFNueVhhUTlnNDB1NkVFaWFkN3NXQjRnVHFML0QwRktsdEh3TjRi?=
 =?utf-8?B?blF5SWZPZVdRN1lwTllENVBTS1VZZ203WjJXcEVzdjdhRm80SjFKZE8vYWpZ?=
 =?utf-8?B?b2c2NjQyQlNsNU1KUU9jK1A1WVFBZkxpdHRFeEdiRGNVbEhLYk5ZQkttZkxM?=
 =?utf-8?B?TnFBaWlGVm94UHFtRytCVWs2b1hSclNlZDZYbDJmYlRHREJKNVpRNzZzUzVP?=
 =?utf-8?B?L205MHM0Q2V0blRXa25ncWJSV3lhZC9QUGlVdnNPeHY2THRjUWdzaHU3YXFq?=
 =?utf-8?B?THQwcDVLZVlpMEVlSUUzeEdocURIZDhjOXhEN2FoUzBUY1FsM2lSb1FtR21k?=
 =?utf-8?B?clNkUzNuNnVMUWN6Tmp1VjByRDFIalk0SlFXVzB5MFdwczdRMlcxcC8zSjJJ?=
 =?utf-8?B?TXRURXlIck1zU1BGWmZKaUsvRFdqODVhQytleXpnQ1hTU1pLRzY5Yzl1S0o2?=
 =?utf-8?B?YmVaT2NlaXo0bjcvYzRqSGVjZWQrZ0M5SEZpYmdkd1R4VmVXelcrOGU1VEli?=
 =?utf-8?B?VHZQd3FiN0ZxN2JiQzNkSXlUcmFNN3FxQnp2bGZKS0NDTVcyTnFacE5kQnlR?=
 =?utf-8?B?N0sySnRoTE9kYy9KZHBESXpQSzAwU3k0RlVob1Jma1dadVA0YzNPL2QrOWNw?=
 =?utf-8?B?V0dUL3JIcTQ0dFN5YW9WOHR5OTJCYmFpaXRuUWd0WXBlSFlYS2kzelZvS3BS?=
 =?utf-8?B?MFpDYzNqbzJVdjdyYkFYM3duaVRoM1lTSnY5dW5yNkxjbW5EbnZ3czQrRmJp?=
 =?utf-8?B?MXE2aHc5NjJNZHhQbE9reWttUkVvSjRySThiRXVaREVMK2NkL2JMNXNnVDBq?=
 =?utf-8?B?QTJEU1hGM1dKcTRzRERFK3ZNVDBEenlwQ3ppa3NRRjZydmphN3Y3UkV3U21C?=
 =?utf-8?B?aVRVRzVnSnZhdXU1aGdXU2c1MkV6MkM1N0o1WWFrVkIvREYxRXd4WW9jb01h?=
 =?utf-8?B?b0s2NDdkOWM1d1dTTW15M2xxQ3NPZ0pJbjFrWjAzL0dSb0NHUFpSQ0YrbnRy?=
 =?utf-8?B?UFltZHpBa3JvRllNaG5iQ1Q1R01id01EVWluUmVRdXdseEJNNHFFb2Y3M0gw?=
 =?utf-8?B?eFJPVnN1QkFTamJheCtCQndNM3JwT2QwYlhGY3JLYWFXZWluYnQzamgvUkM4?=
 =?utf-8?B?Q1BLRkd4WmRwZUo0cUVlS2tHelVDY1lEV3V1TjZmZGt2WUNIYXpZMzVGZStJ?=
 =?utf-8?B?ejJwU0l4ekNpeUxiYWdMUGIrT2tWM256dXB0NlBZNzFFSW41TTN6dlAxSTI5?=
 =?utf-8?B?dUJTKy9rNW83MUIvaG02SG03a0Qxais5eWZTMmpaNDM0VmFlSllBMm40OVBo?=
 =?utf-8?B?cDhTQ1JNcVE3eGEwNDlOME56ZVpMNUFuYWRjeEE2V0pUNUZLZk9udFp3aU9I?=
 =?utf-8?B?VG5ONDZOcCtaRTQxVGJMUGtwRW1xaTJuU0FOcUxJUVNYVWJIWUtIZTdXZi9Q?=
 =?utf-8?B?RmNtVHMwSWlIdjhMTlJabllwNkV6aUM4TnVBNXM2aUxBWHkrb2pja0RpSU1W?=
 =?utf-8?B?ZENrL1lpR2dwZjl0Sy9IZ2VVdEdaUGVjVEM3eE5qblRtdlpNOSt2VFJ2aFBx?=
 =?utf-8?B?dWtib216YUZpYnVjbFlueTJlTUcxUHhJRDY2cXhQa01FbENrVkNFbTJ1N0lI?=
 =?utf-8?B?RXBodFBZWlVodVN6NVlMdGtoSGtuN0xlbWNyTzZwazA1cDNTbVg2VzlYamI0?=
 =?utf-8?B?a1lma2UyL0IzcUpNZHFHSUx0UVkyRkVVblV6aisrS0U0N2VYN3VlSmZKS2oy?=
 =?utf-8?B?N1FhbzRGYXkralJBN0o5ZlViSTRDSFNvK2FvOFI5MmpJWG44VUdSS3djeEY3?=
 =?utf-8?B?bHZaUTI1VHJxdkJFWVNrV3Mza295RlBIbTlSVjlpWkJNVHkrbDMxZUErclhl?=
 =?utf-8?B?VUZnTXh0VXlJTDAzS3NyQzYxdXB3YmtEQWZKSlkyWjlLTW5ZRjlrWkxhMWQ4?=
 =?utf-8?Q?i+8YOc6zzJE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE9tQUlqZmpsTWJRZ2dzZU9jTThXOXc0Y3VUUGJobUVqdEtXMkMreDBlV0Nl?=
 =?utf-8?B?NGJodFhZQkZQeGhRSUdLcWhxdmJQSHB6VTJNak9GM1hHb0Q3NERJSmJMcTgv?=
 =?utf-8?B?ZmJ6RlpScSs5bXVKOFpSV29MWVYvNU5YTFlEamNVZ25xY2JxYTVMZ3gzNGlx?=
 =?utf-8?B?SmpYY1RiWGlsSVJSbDNwaFdvQUhQbHhveTFOUWZjZldULzdpQTdtTWY2a04r?=
 =?utf-8?B?MVkwdkdsdUNXYWMwZTZPRWtMeVZuMXRtemRnY0JjR3VnMmszYXh0U2phN28y?=
 =?utf-8?B?ZVJ1Y1cvakV4c05ndXZRWGNGbzFPYkE2WWlEMGN1NUwwL0Q2UFRHSlhYb3J6?=
 =?utf-8?B?bkJWRUN0NGUrb0Z0WnNNVElmc3BFZ2duVTR1ZSt1cFRTM1FMV1BVeXZCVVJH?=
 =?utf-8?B?aUZDdExoTUw5amJxMFJEdmh6dll5Nk51c1pyRHVNL1REYWRuRnZJUGpIVkx3?=
 =?utf-8?B?aGs1ZlZQNTNCY2tlNFYvY0RRckFqaFNqd0V1a0NEb2c4UDZPUTZib25WbytP?=
 =?utf-8?B?eVFjaVQ2WUhUdW5mU1VyWFVLaHpTdjdySW9NeHM4NnVJNXpXNUs4ZlFlMlVt?=
 =?utf-8?B?dTI4ck5DK2VNV1ZyOXNBeGxsOWNLeW85WHdreDdkekZpSG1iNmVpNThJeTM3?=
 =?utf-8?B?U05ZSlBOdG9xbytBWGZxaGUybVlYcEhITGtFV1VDbXJGUmFiS3BVTTV4Qktx?=
 =?utf-8?B?WFRHa09UdjBzRnhER1ZoU2h1Y255NDhHRXBCNGFXVW1VSDRNcG5OYjBxNmxD?=
 =?utf-8?B?eWJseDJYb0ROWlZjT20rSHRWUnFMNjJNMElqNnN1RUt4Tm9zRjlsTHRYcXlu?=
 =?utf-8?B?Z0lmeENLbytkSVNmNmJoakpna2ZjSTYxMlowa1JIOG1PblNQdEh3WkQ4Si8w?=
 =?utf-8?B?VWFCYlZkakhkVVd6ZDU3bkh3UVdqc1lxOTlxby94SGVuZktDY1dVZk1XSnJB?=
 =?utf-8?B?NE9QSTVwMGtEY2Q2MmI1bTRHaHdiTnpKZHRickMyUktYTTBjVjhIMW1XcUU5?=
 =?utf-8?B?WWFMbUxQNUxQWVVVVk9XdUd1Sjk3b3ZlSVNLenpWbHJJcW5ocDJHcC9UZEUv?=
 =?utf-8?B?WUhFNENsME5YSjBVU1ZTOXVyd2dHcHAreHVoRldNMmZRQzBORXRkVDQ1L0xK?=
 =?utf-8?B?azJxVlNSUzZHUU9PVDJFYzNBVTEyUk9jUWlmK3hIVHgxZGxFWWxWNkFsZHpG?=
 =?utf-8?B?Uzd5MUNrUElNUllqSnNKRDhKbE5DNGdyR0xxYmN6MmNQSGtFWVE1ZXVxSmJa?=
 =?utf-8?B?TFY4Mk9uSnE0aXByUmF3NUE5N0hRM01GSnk0d1UzZkQ5RHpQUXVVTHE3dEdP?=
 =?utf-8?B?dlJ3M3dyMDdEWE56SU9SaklVc1VjckNBU3RLUWFRQ2FtOEFhZzVOMDkvTVpZ?=
 =?utf-8?B?aWczTzZnNGtkcldHUlBjOGwrWUpRdis3UHo1R0svSU5VSmNndW9WRzd4SlNu?=
 =?utf-8?B?UDFVYUFaQ04vOEpmdjUrdWtHTW5CMDYvL0YzNlFGcFRSVlRWUlU0UlpmZ2xS?=
 =?utf-8?B?VTNla0xrL1pYeDJFUkd4bC85ai9OSzFpcHVCUkFRYWlRbEVEd04xNmNuTUxw?=
 =?utf-8?B?WktxKzE3bE15azJZQ2NiQUpERmI5ay9YZlVCdXd3S1pySkF0SVl0ZEhXMU1N?=
 =?utf-8?B?TWtQTWd6NGhwRTBoZDhIRGRMbUNoemM3TGs2WFJnSW41UjVvdHM5K2F4cm00?=
 =?utf-8?B?ZDBHb2lBWjFPQi9NT3B2WHJnbVhDdy9lOG44U2x6dmlLQXB6MDdROUtSSUkx?=
 =?utf-8?B?Q1FlUTBRYkIxdUo4R0NOZXpMNVRsL1hZcGp2Tk9OTEJ4dDZWc1hSaGtwam1x?=
 =?utf-8?B?aWlyS1c0WlNKbGpZUmlrRUh0RWt0OEFuaVJ2N0s5MmhCNmFGWHRBU1dQcndN?=
 =?utf-8?B?SERDN3RrS2t0OFlxV2FtR3ZpanUvYkowenNtNnhvRm94Y0RXQXdKR3I1ZnV2?=
 =?utf-8?B?RUd1NmF2Qk0xREtZRUxvTWU4QjA5dmNXY2RPOGFjdzJGeitMZWV3MFFGSCtH?=
 =?utf-8?B?ZWYyKy9yaHIwYTNmaWJLY2cyYlRVMk81RFRhcjdCNTFicDVYYkpZWWRtSy83?=
 =?utf-8?B?WW9pUENtc2tHRXY3a0ZaYTFBQkl5bmllVnZmaEczTU9FeUNLUUV5Y3RxMGx1?=
 =?utf-8?Q?163cHmxO6J0Xs5I/yMxIGKi1v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821b5659-9a91-48d4-4d25-08ddbf86cac9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 07:53:00.7378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2ZoraJlccZ/VHK2eNjRwiSB5BcWBX7UFEizWOP+FURFAM1KT7wPGIO5OKqfrJdW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9360
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

First of all you need to CC the scheduler maintainers, try to use the get_maintainer.pl script. Adding them on CC.

On 10.07.25 08:36, Lin.Cao wrote:
> When Application A submits jobs (a1, a2, a3) and application B submits
> job b1 with a dependency on a2's scheduler fence, killing application A
> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force
> signal all jobs sequentially. However, due to missing work_run_job or
> work_free_job in entity_kill_job_work(), the scheduler enters sleep
> state, causing application B hang.

Ah! Because of optimizing the dependency when submitting to the same scheduler in drm_sched_entity_add_dependency_cb().

Yeah that suddenly starts to make sense.

> Add drm_sched_wakeup() when entity_kill_job_work() to preventing
> scheduler sleep and subsequent application hangs.
> 
> Signed-off-by: Lin.Cao <lincao12@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index e671aa241720..a22b0f65558a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -180,6 +180,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>  	drm_sched_fence_finished(job->s_fence, -ESRCH);
>  	WARN_ON(job->s_fence->parent);
>  	job->sched->ops->free_job(job);
> +	drm_sched_wakeup(job->sched);

That should probably be after drm_sched_fence_scheduled().

Alternatively we could also drop the optimization in drm_sched_entity_add_dependency_cb(), scheduling the work item again has only minimal overhead.

Apart from that looks good to me.

Regards,
Christian.

>  }
>  
>  /* Signal the scheduler finished fence when the entity in question is killed. */

