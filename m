Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9EAB05357
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D02910E0D8;
	Tue, 15 Jul 2025 07:34:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JCuSTXZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BA310E0D8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 07:34:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIsXpkSM9nckv5N8qxrLrhc6EIV00j5Wrc0k7I+HM6VP6WvJc3OGvdS/CKEXvmlYhLPOuf9np287Twz0QA0Zmcg6kkkSPeqau1+9Bjt7qWMad/Ld/KLhdp1L7k7bcz1fRhUCKJSyF01hLpvaNBdt2h3NVWWJQoIDyofBkc6AY+zttsUF4PradLSAva34NMRuZyfWeXYALODsNod6GWmUJ/2HkMoWfY59VinHQsVUt2qHpSkCtAK2HvTMKZLv/L7JBOwBhDX1H5ZSJG+vWDJxJXfrBK9dfQWOyUx+ZtuZdmbvvtELmrjFoUYoV53na4Uxobx9XChQs6G9r3HKw6zlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNeE48P9o+rQVH2MXGqsNC7NOY2tkJW9p8SrCSvVhF8=;
 b=rYaSLpqq4X129zkmWiFDwClgWpOpRTq1g113MNPFdHTLPMuKeBRFAnfd1l+JOwbNFyt9HIZNEzVNjXyOsKpk5YqlAHpTpB75Gg8NmXrotal6DU1G3+6XtoJm54+FKs/tm/mKFIWyahC5xuBtRj22GeJSKyB5pCfB1osL4KRSx2WDG2/e6DY1Us8kEhFiX7pI0xGwQIlNQVme1V8XINKBldY2EkKuS8yEJLVEf1yJRB4yHuBLXYay+lwGizPtFGh7225axE5MXEPHm5e9lb/abLnO+B1ydjuCl0flhjlYxAdCUCkJ9ce9GzLPHwqJ4PH3Gj/zdPI5JnDT55v5x0Qd8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNeE48P9o+rQVH2MXGqsNC7NOY2tkJW9p8SrCSvVhF8=;
 b=JCuSTXZbetI1AjgXpwk/5UeHE0Fv27ESvcpMHnPVTE0m6CmNIEQzMi1P/XVZ3dQZK1+rMldrsuuZ7N7ZwauvPQdarFsSJDDyhJngxDb1dfYWYFHULYMs40lBbDC/jofXW6SNxAaVdzhasgBOHelcS6KhMgAEMTvnHVEY+WwSf/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6061.namprd12.prod.outlook.com (2603:10b6:8:b3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.35; Tue, 15 Jul 2025 07:34:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 07:34:26 +0000
Message-ID: <77949b3a-201d-4e7d-a51f-e77274e4a4be@amd.com>
Date: Tue, 15 Jul 2025 09:34:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/18] ttm/pool: enable memcg tracking and shrinker. (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>,
 Dave Airlie <airlied@redhat.com>
References: <20250714052243.1149732-1-airlied@gmail.com>
 <20250714052243.1149732-14-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250714052243.1149732-14-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: e48ae696-a71b-4435-821c-08ddc372068b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjJLM2JNN2ROZWFvWlhycmFtS3M1MGhKL0k4eXIrazVjM1pzSlBBU3VoUysy?=
 =?utf-8?B?ditnQzkrb0FkVWpjUk5rRjFFSTQybFU5ZmNvUHZGQ0ZQYVJtNXBVdkJiZmEv?=
 =?utf-8?B?ZlM2disyV2VZZjZsbXhPenB2b3F0WWE4OUpOS2w2cjFhR1JYSVpPWnlNYlZD?=
 =?utf-8?B?SC9ZM0VnWFE1UngydmFVUFJ3Z2FqL2FqRHNOSUZxNkFDQkxtUVRoZzZ5OWdD?=
 =?utf-8?B?Y2o4M1E2QTlNTkY2c1R4cU4xL3IvSlN3RnVsbmFidDFLYVhHUENHRzlMU3Ra?=
 =?utf-8?B?WnpSaWpzNTdzK2d5UHhnM1pRa1JKZGdJSjNsSmRTWVAzNzBITitMRjlSVGVV?=
 =?utf-8?B?Y0s4UFQzQzRYQ0FCdVp0ZUx2Mzl0L25TaHdZcGNpWWFYWjI0VzVqOElKcy9k?=
 =?utf-8?B?ZEp0cnlkczRFekFyYWhaTXoyVWZwbGJLUlloV2dTMlJXZTVXTHQ4ZEYvRXdO?=
 =?utf-8?B?cXVjb0FQYmV0VjFoNkFXTTd2Y0szMjFlc0hYcHhSU2ZOSVA2dFh5M1d1Q0dw?=
 =?utf-8?B?MTVJMUxFWFRsK3hlWFprMHlNRllPc0tXYVU5cVc2aFRrTDVrOEVsbnJ5OGpZ?=
 =?utf-8?B?QnRhQU5McVJzUGJJVkxkUnpPaTg1TkR3YVgvdE91Q2U4V2NiOGdBWHJ2RTR6?=
 =?utf-8?B?cDVXSkZaNzNBWnFrNTV1YlN6WGF3WlFNS0dISDFvc3VQMk5Uc2d0WTVWdDEw?=
 =?utf-8?B?b1NYOXczakxqU25GWGo0QkYrbkI2dHBTdFROUW82ckp4S1hiYnJOb3lPaFRH?=
 =?utf-8?B?RmlBVE1sZG1OVThqRjVjVjZUSjFTVXhRWVhDY2RENEJ2TFo4QWZtUEFtbWhT?=
 =?utf-8?B?b1RaLysyeTdxNy9nUCtON1ozS1dPRzNrOWIyUnBnZGZ4NUhYMmZ5TW9yeGdp?=
 =?utf-8?B?clhVZ09hTVdycHl1OE5KQzhaTmQ5WXhTeWQ2WFg3QTVqcWw4NDFDZDhTckU1?=
 =?utf-8?B?NGwxOUpMSEwyWjdWTTY3eE1SZ2dreEx0UjdJQlRrZC8xS3hxWDZVaklWY0F2?=
 =?utf-8?B?Y2h5TUF1U2pUUDI1alBmVDZQUzQxcWgyaGlrQjcyMW1JMVdvclR6OTcrUkU2?=
 =?utf-8?B?TjVaN3ZOOU0yV1hHU1oxZXROUGN1eVllS3YrTE9VVDNVNkJqaGdmZmhoYVU5?=
 =?utf-8?B?bzdpN0NuZDltcXoyYjJmbjZFRTE0K1IxaTBOb0RaYTlYZkUvaEdpZ1lZY2Nl?=
 =?utf-8?B?UUVkN2s5d1k0cTdQdXlQRXEyNnUrbVVzRFRqT0VYOGtFVjVoT0NEMGhKZUUx?=
 =?utf-8?B?S1JkcjJ4WWczQmxsVVlRenN3UzliZGFjMnplWjJpWDIrbzZEMWpXeklwemR0?=
 =?utf-8?B?SGxUbGU2bHR2MHNaWTBQUk5YNnI4RHExakw5U0ozVnpZaDhrai9YR1NOQTJY?=
 =?utf-8?B?MVo5emcyWW5iR2pySjE5RGpNL2MxUEtWSWNicStENkNPT3NMbFQ2UW9ZVHdv?=
 =?utf-8?B?bFgvWDBYYjFZZVQ5NWR0dmdRVEswZmNqMUlNaUJvZStqVmNYb0ppUlNiTUYx?=
 =?utf-8?B?eU0rYS9GTmZHYmtuSnl1UXg4dWRsN2k5ekQzczNTbmlkcEJQZDlUZkd5ZjF2?=
 =?utf-8?B?NFJSK0l3d2phaThvdzROSDQrZXJya1p5WjZEdGdQOG9aMHlOMTN0VWxRN2xD?=
 =?utf-8?B?SDlhb0Y0cGdDbi9SYnpDMUtSVEdIN1RyVjNnSzVQdHBOQ0Z5WHlUeWFPYjBB?=
 =?utf-8?B?TWJuZHh3N0dBcWRkaEJyMUNGNlZ1OFFmZnlWVkRFcjVML1NnSWM1dDBOSUhp?=
 =?utf-8?B?TjZibDhXdmdZK3ZibWZUM2oyVjlUbThUTHpwWnR6ZEJId0dIdFBIa3lMblNE?=
 =?utf-8?B?MWJ3RjltMkJCRTVLbStWMWtOWjMzWDVjWlJxNGJnV0Q3cjI2OU9ZbVlqTmpx?=
 =?utf-8?B?UkhndXVEVXJoNFZFbklJTGFYZHV1V3BJbzkyM3FGZUN4NkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0xDKzlVdEhyU1JKT2ZPOUFSZ0RLWSswdHNIVVQwMUtzeXM0VDI4eDZQeHM5?=
 =?utf-8?B?dVZMYTRHcjU0NDYrMGVyU1NDeXp3YUZQM0pSbGN3cHdHYVhrZFByOTFLSUxt?=
 =?utf-8?B?OGk1cndRWE9NU0FoYjVUVE9YZEZBU3JJaUZUQXpla0xDREpLUDBNaXVVUWow?=
 =?utf-8?B?YVdTRVk2OHpsMjFMWllWRDB2OUpzVTVQV1FkVVdRT0NJdDJ0NmxLSkxQWm5U?=
 =?utf-8?B?RDZRdHR1a1dOYjZDS2JtZzJOano2ME9wT3FMOHVNTzNYK0VoaHRCYmJOenVM?=
 =?utf-8?B?Yko5SmhJdjlHREc4aHkxd1oyNFhyMEFEdzlKS3VJRk9zQjlEcDdYQTZZN3Er?=
 =?utf-8?B?Ymh4WHk2Q0VzUGxKa0tzd3p3VW40TDQyWFp3bEVQaEg0NUp2MVo5WGRpOWlu?=
 =?utf-8?B?TjBab2F4SzRiRmpJai91MEhROC91czVMTnVKSG93SzZiS29hRkNrcFoyMTF6?=
 =?utf-8?B?RDNmdHZrSHU4b0RZMHVuak40MjdxM1BGZ0RDdmtUWDJhK1JzSm9Od2Q0SjVY?=
 =?utf-8?B?M2djb0J4T3lnTno2MHJQQnN4RThrNlFEYUpRUkpTYVg0a1pkZGFQSzhhbHc5?=
 =?utf-8?B?UVhmTFV6bHZPc3VXZWFsemluc3lHNmNZZHAyUmkrcmdmamFaQzdrMnVKdU5q?=
 =?utf-8?B?NW1SSWhqanU2TjJ0MUE4MTlXN2RTZm9aS0JzNER1STZ4Ni9FaVJPK1RRYTBC?=
 =?utf-8?B?UWIzckZaYVJFUXlrb3dWbHFiV2YzSXlnb1FWekJUZUhMWFZZM1JxZFR1WHdM?=
 =?utf-8?B?dmRYUGxrVDZtbCtLdGxZUGg4SGs1UzEvWlloQnZXakh2N0JKcnY3YjlyTnZj?=
 =?utf-8?B?T1lvbkc3UHBLSjRvZlNPOUJIQW5XUjg2NzZBY3hIdWNVNHVLQ3ZzZ01BaFJX?=
 =?utf-8?B?S1loNHRsYUNzSUVadEgrT1hJM2owSnUvWHd4QitmNVpFTm1taGFhVmNDOW5k?=
 =?utf-8?B?TWdmWDJNeW1FUCt4RHF5RjEyVUJTT1ZCNzljZTh1SkN4VlRoRU9ucE0vbUZL?=
 =?utf-8?B?d3BoWEtubUh6b0N4Nzc1UjFRNXgzWHROZEhwR1JONDdKUEJDOG9ZdU41VlpH?=
 =?utf-8?B?QmFiVUE3WHMwRjlvNVViblZHaTZ3YkNndjdOSzdQQzI2Y2J2QmUxanJ0aVJk?=
 =?utf-8?B?UlY1YTlsZkhabm04cjZIWmljcGlZQWkxdmg3VjRiWnBjSkFkY1lkZSswc2Zm?=
 =?utf-8?B?VGZudEoxSWFucnFrWUpGTlBtUllEWGZQOVFKTEZrMTJKS0RJeXUyUFozeVRO?=
 =?utf-8?B?MTVlQ3VYYkEwbE01cHY2a2RxQTg4Y001K0I3Q0Y1QjFyRjJxZEluTlYvZDl0?=
 =?utf-8?B?bDljN1ZsOVR6S2lLZWJHck1ZWFJvMmFjbzJIUng0M2FpcHZHUG54STNoZVBQ?=
 =?utf-8?B?dysvVnVZWXRVTFdiQURmTjB3Rk9ncE54RWJFZFVHRSs0YmJuMVJ2c3pLM0N1?=
 =?utf-8?B?ZkZidDVwN3o3dk9yYzFDOS96T2tmZTg1d3ZnN3MxK0YwN1o4OU0yVmVXYnBK?=
 =?utf-8?B?aFNLcGNpRll2ZlFLbmowU2o0ZGF4VFJ1S1hMZWlNR3ppdUExN0JRdzlMMVFy?=
 =?utf-8?B?Tlg0TXBWTTk3NC9xRlE2Lzc0NVZHaFlHOW8xVGdDc3hPN3cxRUFqQXNmU09X?=
 =?utf-8?B?U0t0bkpSWkIyeXgyczZkUFd1TXo1emFwWmdlTllNNHBoTHViSmJlajRqZU9G?=
 =?utf-8?B?Y242UXArQk9kSVhyUXpTMVFnNUlML04zSllpbkIwZVZPeXBRZHJBdFBEcVpC?=
 =?utf-8?B?REVkM1E1akhBZlZqODBRTGZEc1MwbVk2VlgyS3JWdThtUnRqdmU0WXRpSXda?=
 =?utf-8?B?Uy9zQXpvVXFEcnowdlZUdnZ5cUJYdnliYTJmWlpKM3B5NXgwYmV2Y0ViaXZM?=
 =?utf-8?B?M1B4VDlBeUdFMVRCc2JZZzh1NlRnZ3Y3ZFZ6SVpRUDZZaTBVVi9iUjNwZXlT?=
 =?utf-8?B?YU93endseDladVZsVXBQbFdVakZEQ3lFMHBUZzVoZ2NOQU9KY0VFY3lENlg3?=
 =?utf-8?B?NUprVU9uR0l5ZDlCOWFGb0ZyUForVzUrM1VmYjNOaXFGWkpuNGtzQ25rUnJl?=
 =?utf-8?B?WXBwUndldTl5Yk5sc1RhRnp0c1NXQ0ZQSVluMXJ2NEFITUdXK21SaTNUODBh?=
 =?utf-8?Q?al0t8dNDni0r4ct1R0JSM9kml?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48ae696-a71b-4435-821c-08ddc372068b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 07:34:26.3606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8+nuoc4DY8UToBbGG1xDvDtVqenRr/3+v0n3y7GETFEnrIaRfJ6oKAbwOBYtxfa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6061
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



On 14.07.25 07:18, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This enables all the backend code to use the list lru in memcg mode,
> and set the shrinker to be memcg aware.
> 
> It adds the loop case for when pooled pages end up being reparented
> to a higher memcg group, that newer memcg can search for them there
> and take them back.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> 
> ---
> v2: just use the proper stats.
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 126 ++++++++++++++++++++++++++-------
>  1 file changed, 102 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index a4f4e27c6a1f..1e6da2cc1f06 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -142,7 +142,9 @@ static int ttm_pool_nid(struct ttm_pool *pool) {
>  }
>  
>  /* Allocate pages of size 1 << order with the given gfp_flags */
> -static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> +static struct page *ttm_pool_alloc_page(struct ttm_pool *pool,
> +					struct obj_cgroup *objcg,
> +					gfp_t gfp_flags,
>  					unsigned int order)
>  {
>  	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
> @@ -162,7 +164,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
>  		if (p) {
>  			p->private = order;
> -			mod_node_page_state(NODE_DATA(page_to_nid(p)), NR_GPU_ACTIVE, (1 << order));
> +			if (!mem_cgroup_charge_gpu_page(objcg, p, order, gfp_flags, false)) {

Thinking more about it that is way to late. At this point we can't fail the allocation any more.

Otherwise we either completely break suspend or don't account system allocations to the correctly any more after resume.

What we need is to reserve the memory on BO allocation and commit it when the TT backend is populated.

Regards,
Christian.

> +				__free_pages(p, order);
> +				return NULL;
> +			}
>  		}
>  		return p;
>  	}
> @@ -213,9 +218,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  #endif
>  
>  	if (!pool || !pool->use_dma_alloc) {
> -		mod_node_page_state(NODE_DATA(page_to_nid(p)),
> -				    reclaim ? NR_GPU_RECLAIM : NR_GPU_ACTIVE,
> -				    -(1 << order));
> +		mem_cgroup_uncharge_gpu_page(p, order, reclaim);
>  		__free_pages(p, order);
>  		return;
>  	}
> @@ -302,12 +305,11 @@ static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
>  
>  	INIT_LIST_HEAD(&p->lru);
>  	rcu_read_lock();
> -	list_lru_add(&pt->pages, &p->lru, nid, NULL);
> +	list_lru_add(&pt->pages, &p->lru, nid, page_memcg_check(p));
>  	rcu_read_unlock();
>  
>  	atomic_long_add(num_pages, &allocated_pages[nid]);
> -	mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, -num_pages);
> -	mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, num_pages);
> +	mem_cgroup_move_gpu_page_reclaim(NULL, p, pt->order, true);
>  }
>  
>  static enum lru_status take_one_from_lru(struct list_head *item,
> @@ -322,20 +324,56 @@ static enum lru_status take_one_from_lru(struct list_head *item,
>  	return LRU_REMOVED;
>  }
>  
> -/* Take pages from a specific pool_type, return NULL when nothing available */
> -static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid)
> +static int pool_lru_get_page(struct ttm_pool_type *pt, int nid,
> +			     struct page **page_out,
> +			     struct obj_cgroup *objcg,
> +			     struct mem_cgroup *memcg)
>  {
>  	int ret;
>  	struct page *p = NULL;
>  	unsigned long nr_to_walk = 1;
> +	unsigned int num_pages = 1 << pt->order;
>  
> -	ret = list_lru_walk_node(&pt->pages, nid, take_one_from_lru, (void *)&p, &nr_to_walk);
> +	ret = list_lru_walk_one(&pt->pages, nid, memcg, take_one_from_lru, (void *)&p, &nr_to_walk);
>  	if (ret == 1 && p) {
> -		atomic_long_sub(1 << pt->order, &allocated_pages[nid]);
> -		mod_node_page_state(NODE_DATA(nid), NR_GPU_ACTIVE, (1 << pt->order));
> -		mod_node_page_state(NODE_DATA(nid), NR_GPU_RECLAIM, -(1 << pt->order));
> +		atomic_long_sub(num_pages, &allocated_pages[nid]);
> +
> +		if (!mem_cgroup_move_gpu_page_reclaim(objcg, p, pt->order, false)) {
> +			__free_pages(p, pt->order);
> +			p = NULL;
> +		}
>  	}
> -	return p;
> +	*page_out = p;
> +	return ret;
> +}
> +
> +/* Take pages from a specific pool_type, return NULL when nothing available */
> +static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid,
> +				       struct obj_cgroup *orig_objcg)
> +{
> +	struct page *page_out = NULL;
> +	int ret;
> +	struct mem_cgroup *orig_memcg = orig_objcg ? get_mem_cgroup_from_objcg(orig_objcg) : NULL;
> +	struct mem_cgroup *memcg = orig_memcg;
> +
> +	/*
> +	 * Attempt to get a page from the current memcg, but if it hasn't got any in it's level,
> +	 * go up to the parent and check there. This helps the scenario where multiple apps get
> +	 * started into their own cgroup from a common parent and want to reuse the pools.
> +	 */
> +	while (!page_out) {
> +		ret = pool_lru_get_page(pt, nid, &page_out, orig_objcg, memcg);
> +		if (ret == 1)
> +			break;
> +		if (!memcg)
> +			break;
> +		memcg = parent_mem_cgroup(memcg);
> +		if (!memcg)
> +			break;
> +	}
> +
> +	mem_cgroup_put(orig_memcg);
> +	return page_out;
>  }
>  
>  /* Initialize and add a pool type to the global shrinker list */
> @@ -345,7 +383,7 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
>  	pt->pool = pool;
>  	pt->caching = caching;
>  	pt->order = order;
> -	list_lru_init(&pt->pages);
> +	list_lru_init_memcg(&pt->pages, mm_shrinker);
>  
>  	spin_lock(&shrinker_lock);
>  	list_add_tail(&pt->shrinker_list, &shrinker_list);
> @@ -388,6 +426,30 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
>  	ttm_pool_dispose_list(pt, &dispose);
>  }
>  
> +static int ttm_pool_check_objcg(struct obj_cgroup *objcg)
> +{
> +#ifdef CONFIG_MEMCG
> +	int r = 0;
> +	struct mem_cgroup *memcg;
> +	if (!objcg)
> +		return 0;
> +
> +	memcg = get_mem_cgroup_from_objcg(objcg);
> +	for (unsigned i = 0; i < NR_PAGE_ORDERS; i++) {
> +		r = memcg_list_lru_alloc(memcg, &global_write_combined[i].pages, GFP_KERNEL);
> +		if (r) {
> +			break;
> +		}
> +		r = memcg_list_lru_alloc(memcg, &global_uncached[i].pages, GFP_KERNEL);
> +		if (r) {
> +			break;
> +		}
> +	}
> +	mem_cgroup_put(memcg);
> +#endif
> +	return 0;
> +}
> +
>  /* Return the pool_type to use for the given caching and order */
>  static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  						  enum ttm_caching caching,
> @@ -417,7 +479,9 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
>  }
>  
>  /* Free pages using the per-node shrinker list */
> -static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
> +static unsigned int ttm_pool_shrink(int nid,
> +				    struct mem_cgroup *memcg,
> +				    unsigned long num_to_free)
>  {
>  	LIST_HEAD(dispose);
>  	struct ttm_pool_type *pt;
> @@ -429,7 +493,11 @@ static unsigned int ttm_pool_shrink(int nid, unsigned long num_to_free)
>  	list_move_tail(&pt->shrinker_list, &shrinker_list);
>  	spin_unlock(&shrinker_lock);
>  
> -	num_pages = list_lru_walk_node(&pt->pages, nid, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	if (!memcg) {
> +		num_pages = list_lru_walk_node(&pt->pages, nid, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	} else {
> +		num_pages = list_lru_walk_one(&pt->pages, nid, memcg, pool_move_to_dispose_list, &dispose, &num_to_free);
> +	}
>  	num_pages *= 1 << pt->order;
>  
>  	ttm_pool_dispose_list(pt, &dispose);
> @@ -594,6 +662,7 @@ static int ttm_pool_restore_commit(struct ttm_pool_tt_restore *restore,
>  			 */
>  			ttm_pool_split_for_swap(restore->pool, p);
>  			copy_highpage(restore->alloced_page + i, p);
> +			p->memcg_data = 0;
>  			__free_pages(p, 0);
>  		}
>  
> @@ -755,6 +824,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	bool allow_pools;
>  	struct page *p;
>  	int r;
> +	struct obj_cgroup *objcg = memcg_account ? tt->objcg : NULL;
>  
>  	WARN_ON(!alloc->remaining_pages || ttm_tt_is_populated(tt));
>  	WARN_ON(alloc->dma_addr && !pool->dev);
> @@ -772,6 +842,9 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  
>  	page_caching = tt->caching;
>  	allow_pools = true;
> +
> +	ttm_pool_check_objcg(objcg);
> +
>  	for (order = ttm_pool_alloc_find_order(MAX_PAGE_ORDER, alloc);
>  	     alloc->remaining_pages;
>  	     order = ttm_pool_alloc_find_order(order, alloc)) {
> @@ -781,7 +854,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		p = NULL;
>  		pt = ttm_pool_select_type(pool, page_caching, order);
>  		if (pt && allow_pools)
> -			p = ttm_pool_type_take(pt, ttm_pool_nid(pool));
> +			p = ttm_pool_type_take(pt, ttm_pool_nid(pool), objcg);
>  
>  		/*
>  		 * If that fails or previously failed, allocate from system.
> @@ -792,7 +865,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		if (!p) {
>  			page_caching = ttm_cached;
>  			allow_pools = false;
> -			p = ttm_pool_alloc_page(pool, gfp_flags, order);
> +			p = ttm_pool_alloc_page(pool, objcg, gfp_flags, order);
>  		}
>  		/* If that fails, lower the order if possible and retry. */
>  		if (!p) {
> @@ -936,7 +1009,7 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>  
>  	while (atomic_long_read(&allocated_pages[nid]) > pool_node_limit[nid]) {
>  		unsigned long diff = pool_node_limit[nid] - atomic_long_read(&allocated_pages[nid]);
> -		ttm_pool_shrink(nid, diff);
> +		ttm_pool_shrink(nid, NULL, diff);
>  	}
>  }
>  EXPORT_SYMBOL(ttm_pool_free);
> @@ -1056,6 +1129,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>  			if (flags->purge) {
>  				shrunken += num_pages;
>  				page->private = 0;
> +				page->memcg_data = 0;
>  				__free_pages(page, order);
>  				memset(tt->pages + i, 0,
>  				       num_pages * sizeof(*tt->pages));
> @@ -1192,10 +1266,14 @@ static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>  					    struct shrink_control *sc)
>  {
>  	unsigned long num_freed = 0;
> +	int num_pools;
> +	spin_lock(&shrinker_lock);
> +	num_pools = list_count_nodes(&shrinker_list);
> +	spin_unlock(&shrinker_lock);
>  
>  	do
> -		num_freed += ttm_pool_shrink(sc->nid, sc->nr_to_scan);
> -	while (num_freed < sc->nr_to_scan &&
> +		num_freed += ttm_pool_shrink(sc->nid, sc->memcg, sc->nr_to_scan);
> +	while (num_pools-- >= 0 && num_freed < sc->nr_to_scan &&
>  	       atomic_long_read(&allocated_pages[sc->nid]));
>  
>  	sc->nr_scanned = num_freed;
> @@ -1382,7 +1460,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>  	spin_lock_init(&shrinker_lock);
>  	INIT_LIST_HEAD(&shrinker_list);
>  
> -	mm_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool");
> +	mm_shrinker = shrinker_alloc(SHRINKER_MEMCG_AWARE | SHRINKER_NUMA_AWARE, "drm-ttm_pool");
>  	if (!mm_shrinker)
>  		return -ENOMEM;
>  

