Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC7FAB6AA2
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 13:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AA810E614;
	Wed, 14 May 2025 11:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AL2M8WSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF3610E614
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 11:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKV3JfTUM3wreUlSS3bw/50Jr1Pcpv7Q5XGLGl2aXn8LEl5amEM4bSaPhEstlZQSxhm3trY7y1yJ681+9RMW8sHgm0XoTCsYv0EzB4YkYjJ6jVLi1p9nZVNZvbvB52SaZcKZmwuki0NEe1A3IB+vb4BQy/NZrqWx4mCGPCeAbvlFxAhd36g0ewaDmJ6EfFEqfHetylyk46P6sSdOesNzoTB6QQlxwfT7xKpfNQHyByRdHcjVr6OVqPa2lRDXGQEA8fhIIAjWH3KGah/0phgN7LsAjA1HFdSJFu5atjlZqdUOtsSCWClxZudBrddpL3CkvhE6KHPwuTT+JVPx/qICLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZsknU7yWcUsFg/j0iq2HpKJVV+0880RiKd7TlyNPRU=;
 b=acOIwMi3X7x1gbJpLiahtlramFbY/7Pl+tAV8IZ5mbcsLzr1VgCY7m5jpEjYmQ4Sqi8xIq6qwbaMwN8bEFc0uKhqpRk1gZwKPffONuuB/gIe5EP+HOVH229qVRe0BJ8O+KJ5GiYH8goHm0muMDEh0e8jzT+7SseK972B/eFS4AFkBevAJfpzF9Cj2HJfYrRyaSZVXjVrPxLndiC+p7GgCnt7G9jqdYk1YxBEzdkVssP1YzCoUG98dpOJZL0JrRbzWPfx8USyEH32tt6RuIyc5zOZWI3K9V4kVmMQZUe6hpG2dDglZSrgSIngjGlTkcNFbyMPELI7n94uJ0HK36ORZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZsknU7yWcUsFg/j0iq2HpKJVV+0880RiKd7TlyNPRU=;
 b=AL2M8WSrn426nd+0wMLZ8qxCzd4qN8ToAhaBm6QEfsyTQohdiKqqr1RZZuhw544OKMVpqPSkFu1/0zPCWRW01tj0aqtlPcoxOjnQZqH17PzA6wAs7LET0BhZ1wH6zAVC+lzztBCeyVNOaxugeq686pM1dHi3/Kp4R4PXFjWgfeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB9524.namprd12.prod.outlook.com (2603:10b6:208:596::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 11:55:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 11:55:34 +0000
Message-ID: <6a41fa3e-6ca7-4791-b491-4908971275a5@amd.com>
Date: Wed, 14 May 2025 13:55:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [5/7] ttm: add initial memcg integration. (v4)
To: Maarten Lankhorst <dev@lankhorst.se>, Dave Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, tj@kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250512061913.3522902-6-airlied@gmail.com>
 <ea70e6fa-22a1-4adc-927a-5e9c2563f784@lankhorst.se>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ea70e6fa-22a1-4adc-927a-5e9c2563f784@lankhorst.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB9524:EE_
X-MS-Office365-Filtering-Correlation-Id: 983a288c-c846-4676-533d-08dd92de3be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXh3Y01RYzFBdzVNSFYwbHNMRDFaUjJsNURJZGpxbnNmREVjN0IySlkydEUx?=
 =?utf-8?B?MGZCTDhOMllTQ3VCdlJpSndta3NDRmNIclVEbm94T3dMM1JHQjFSMStlMk55?=
 =?utf-8?B?aUR6dURFR3RmbGJuL0R4dnlRTWIvYXYzOHRlNXphR0dwVlBDQWVKQlhwVTk5?=
 =?utf-8?B?V1ZNYUJlcklWR1NiL0VyQmVkTEZJUUl2cjRXYVdKaGZpSEFPcFVwY2RYV0l4?=
 =?utf-8?B?YXJGSjZTU2FXMkRvNDhsWXAvY3hoWkt6SlBGSWNzNUQ1OTMxcklCaHdrdm5i?=
 =?utf-8?B?RlgxZGRjTHF1SHB4MGlBdFBBQkdyUCtqR3BrMFZvaGRsK2lQTWQvQ2tYTlRv?=
 =?utf-8?B?L0JjWEZTK0NDSExkVnVxWkU4NDhFbGk5SXZnVkl2NWcybzVRdjFNRmtqb1hU?=
 =?utf-8?B?NXNtMjB4MW53TDBxellETE9qZFFJZEJtYUN2anpNeU9CV3NxZ3V4TDdrMkRu?=
 =?utf-8?B?SS9Bbk1sbGtBS2g0NXYxT2FZc2xYeFFLMGNXdDhxTk1Ma3YzTDZpWGVVSkc2?=
 =?utf-8?B?cmhQK2NXeUdDVjFrdmZpY2FFSmR3MVVSZVk0V0dhOTNvcmd2Slh2VlhpcnAv?=
 =?utf-8?B?eGEvZTg1akNYUkQ1ajVzdzJvV3piRWl6R2JnbVdYYi9nc1NXekZMNy81eEc2?=
 =?utf-8?B?eVRQUCs1QTViVWtlREs1T1ViWmJNZnpvcElnTmgwUmRoSGxWSnpUYk9uM1ZT?=
 =?utf-8?B?ZnViUHhTUFF0M0NBV2wvZnlEaDJXbkdTdWRwVDdCekVpWnpPT0xDbHpOcitZ?=
 =?utf-8?B?M05MZW5xNUdYU1NqdXRSWkQxRDZObEdzMTdJM1A3UWJzR1J5eG9sWXNteXo5?=
 =?utf-8?B?K3dJYnBTUlFNSFJrRkNIc2dVRCthYlkvdnVXckdyZjlSMURoVmNwM0lDYWNR?=
 =?utf-8?B?Z29RYUFVRlcwOWwvNUN4a3dUT2NKTHhhUDFlUGlVS3RlZHl3WWZFMWNEV0Vp?=
 =?utf-8?B?dXpTa0U2d3pVQkhOZnN5UGR2WmhvM0ovQWNFaWhuamNtbkQ2b01teFdJUXlV?=
 =?utf-8?B?OVI3bEJWKzJyM25uT2dJUWVkUWpiTm1RSTE2VGN5dlNnYzgxYkdGZTJ5TkJv?=
 =?utf-8?B?SEsyMFh1L3NpY2RxdFJYbWdUOHBSUFhteWRkSkY5TFlCUEhLYXFlZ3VOUUcw?=
 =?utf-8?B?SVV6bjhjeDd6R1UycDVFZko4V2FZOVdKL2pVdklLSlZGMXVJNGNSWkFiNWtr?=
 =?utf-8?B?NzlTdzU0b3E5ZWV6QmdiWCtpZFozbHQvREZmbjlrYXZYSDdUaVRDNUVLdmFX?=
 =?utf-8?B?ZTlkdFhDdHZJQVlBODQrYWNxY3I4YU5nZHJZaEs4RVVJQ3prUlc1ZDlOQnFj?=
 =?utf-8?B?b3BOaFRJdGprRWJRdmR1NW5RQm5iN3BsVzlUdVRwaW5ZWmVHOVN0c0Z3QUYv?=
 =?utf-8?B?elVEV3BsNXBXbWE3aHNORVNFWU0yTlFRVjludWx4M21YQWVtbzU5d3dzSmR1?=
 =?utf-8?B?T3EvRHlxeGJZSXAySVBTV3A5SnVSckRjRkpQMU8wNUFlNHdTSU4yVVhISWJy?=
 =?utf-8?B?QU1ZanNRZE03UDE0QjNEWHI0S0FFdkFKWEpzTVgrSTVQUUdkV3hCTVdPQmU5?=
 =?utf-8?B?bnd4amFDN0I4U0hkNG1YSXhRYW85RGc3TC9EOHk4Z1FFVEFGQkgvYVZFUU8v?=
 =?utf-8?B?SUtyTkkyMnJvYTRWZy94cEhBYmlhNEVSRHVNSHcvTVhhR1dtM20zYVU0ZmUz?=
 =?utf-8?B?RThncUxZcXZaOWxWbXI0SlgzQnRIa1dISS9Sb1F0YWJNMUtlb09oYkFrc0Ry?=
 =?utf-8?B?QUdwY0EyS3MrMW1uT2Q0Rk11M3N1aXBNckIvYTR6VmVaMlNPRFhaNG9OQWdB?=
 =?utf-8?B?T04zNHpDMFZ6dHczR0t6Z0JuM3lxV0hpWGFNdjdjY0lrRFA5RmdDK01QMVBW?=
 =?utf-8?B?S0svajErOVBFbFNIVDY2cVhMcGtwRi9acHpnTlovQzI2ditnWGVvck51YWk3?=
 =?utf-8?Q?mYRVZqAPzc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWp1cUFYQ0QzSnE0L3BLY0dwUUp3YzNjUlMzN1M2NUdVOCt0cC9VS1RHQWJh?=
 =?utf-8?B?S0t3a1Rpa2RTMWJ6bU5YVmpTekZ4S282SmNZZCtxMGh1UU9YNXhnUGN4TzRI?=
 =?utf-8?B?ZHNlOGtFc0draGdOUVVSY2RWemtOQVIxOUNXVmh5NDR2Mm1WRHVHMWpoYnh0?=
 =?utf-8?B?WFBTeDc3dkwyT3B5Z2Y2cnk3S0xoWXdTR1l2N0xkU0NyMVRNZjJyckQrSDQ1?=
 =?utf-8?B?R2l3WGpxTmxHVnora3ExNU5OK21sakxQaStFa2lOSmN0UTBFcTVsREx4N1o4?=
 =?utf-8?B?dk9CU3I5czFMa045SWpWcUhCUUhJaXd1T01HcVE4U0gwUEdYekxiOVNtZC9h?=
 =?utf-8?B?M2lMcWhiWXUyZkwzNmt6YVpwY1JOY0pDT2hiaUZ2WmtLbk5sN3FJUjNLVFhL?=
 =?utf-8?B?cTZCNll1MzVxK3FvZGxFT0ZJczBKVGR1dENURlFBWlNDczlNV0l4VEpSbitB?=
 =?utf-8?B?VU1PNlErUzJCVE84Z2lyNDJkQXd2L0ZsZnpLaElKeUZTSy9UeitPTnQ3L3I3?=
 =?utf-8?B?VVVOdXRIbEFZTHRHbWtNaGt1WkZ2eGUyVU5SWkgwb2xqa2tPcDA5a2ZGYmdH?=
 =?utf-8?B?bS8waGJseGIzdldLaU1TZ1FyaDJOejdlcndlRCsxUkp6NFFHaHdpdzNsRkoz?=
 =?utf-8?B?bGFZUDlRSzdqVnVQQ0RQQ1dsaDVHbHQvZUpoQ3ZFNDdlWVJvcU1pcFFreVFo?=
 =?utf-8?B?ak9iNmRwMS94N1p3RkVjVnR0SE5PaWVJT0dVQmhYbmQ2NDl1YjViVFdMM0kr?=
 =?utf-8?B?MUx5NmZPSWkwdXNoNUg2SlpSalhFNVJGK3FTQ212NjNHOVZNdjFKUDVQQTVv?=
 =?utf-8?B?Yk1vTUxhRS9FalFOS2Q1L0ZYeVl1SXRIZnJuWENqaWp6ZjRaRjJqTlpENUlk?=
 =?utf-8?B?c1VEajhEcDdTaU9JendLeDJJWlpuejRtOGRtY3YxUGhSNGxIelRjTnBpU2ly?=
 =?utf-8?B?ZWlMMFNGNnVMMXY3VVF0ajRRRUQ5OUlKaHhDT0N0YTNTUWl1eXlhc201cFBZ?=
 =?utf-8?B?ZHJZbUtnN2I5bzRUK3VPQmxES3BLdlY2VitTc1BKMWl2TFBiOHhqM1l4Slhl?=
 =?utf-8?B?bmpNQVlkcXJNVkpHVkV5OG5odWlzQ2UxVEVxaGNSdjlGRkRzYkxVQ214Y0NI?=
 =?utf-8?B?b0x3b2VYMFVxcnVsbnArR040NDlQOVlUemxzQ3lRR08vNXA5WHppQk1OamlI?=
 =?utf-8?B?b2o1bWY1U3c0WHRyTkFuNjdJS1p2dW41anl0NjM2RUhjSy8rdWVCaEE4YTln?=
 =?utf-8?B?SXJ0c0YvMzRtck9JSmJXZURtYW5wd3JMcFh0RlZsVUxUWmpRcTlYUXo4SXQ2?=
 =?utf-8?B?OUFldUdqb0NRQzlKZHFUZHZWY3M4YjlkNmZwSTEzUTM2RHBjRGtESkZjNEd3?=
 =?utf-8?B?bjFpT3lDZG1XR0l6WE5GeWd2YUJsaHNXQzIybUttV0VmR3pYTkFhZnduS1VO?=
 =?utf-8?B?bmJHVHU2YXVqUjZNYlRBMkRZT250UEFZQkNMdVI4WEIyTTVwZ0wvM0pBR3lk?=
 =?utf-8?B?cUZYTXZscWVDUDRKa2Y0b21vTEMyVDlrV01DTjU2bGJaUEEwSG1YNThKWTI4?=
 =?utf-8?B?Mk1Ta3JMK1AzVHArenNoS3dNVmVhaGRHWFlKK1VlUC80dmt0elhKVW5kMDRz?=
 =?utf-8?B?cHBwYUVYYW1NMzQyakF1N1FQRzh4VnR6Smh1Z2p1c0t4QjVDR3YzWGE1RWNt?=
 =?utf-8?B?Q1Yydk5MYVVKdGJCSzI1Y0hNWmcybCswSTFjNlZBYk9CVkJaUkR4UDJNaGRr?=
 =?utf-8?B?a1NpLzlUeUVtOHJBbUprZnRKejFUZkdNWitxU25Fb3JJRHc1eGdWWXZRY1g3?=
 =?utf-8?B?NGpCbDYxOVlQZ2RaWXhpeWxsdCtJWTBFSE00ditZQ0RmZFRsV3ZHcG5kMm0w?=
 =?utf-8?B?NWw3dTV5MTRpWFNqcEdiY1RnbERzWVlrUGkwUkhabzRZVTk0cFprQUh2eUhu?=
 =?utf-8?B?THBTdGt6ZUQxTFVZeXJEZkZkRkVQTjFwT2xlVGFYbTlwNXJ2ZFdwMkk3VVhN?=
 =?utf-8?B?VkVXd0dPOHlDUk9hbWYrenJMV2FjdGwvb2lqRGo3bU1BcEFvODRYeWE0OVFT?=
 =?utf-8?B?enNmQ0RLdERqMVBHbVRZTWFvejFOeXNzaFhIOURJSDd0QktMbkhUbStPMFlj?=
 =?utf-8?Q?bWqw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983a288c-c846-4676-533d-08dd92de3be8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:55:34.5505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaEaDl6TCMMh6Aeul2CuGo6lwOiMfKIR07nf60BH0zzDzxnFoPWg91bAcuJjrTfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9524
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

On 5/14/25 13:41, Maarten Lankhorst wrote:
> Hi Dave,
> 
> We've had a small discussion on irc, so I wanted to summarize it here:
> 
> All memory allocated should be accounted, even memory that is being
> evicted from VRAM.

That sounds like a really bad idea to me.

> This may cause the process that originally allocated
> the VRAM to go over the memcg limit, that should be solved by invoking
> OOM condition on the original process, which may have ways to solve it
> like purging purgeable memory, or as last resort OOM killing.

You are basically suggesting to kill an application for something it never requested in the first place.

In other words when an application requested a buffer to be placed in VRAM we can't make it responsible that the buffer had to be moved to system memory because of over allocation.

As far as I can see and have discussed with others so far this approach is a clear no-go.

Regards,
Christian.


> The VRAM evicter is already memcg aware, so it should be possible to do
> the same for the shrinker. I created a patch to use the same cgroup for
> memcg as for dmem, we should probably extract the cgroup from mm->owner,
> and create a function to charge dmemcg and memcg with a specified cgroup.
> 
> For applications that use a centralised allocator, it might be needed to
> charge a different cgroup when exporting.
> 
> Kind regards,
> Maarten
> 
> On 2025-05-12 08:12, Dave Airlie wrote:
>> From: Dave Airlie <airlied@redhat.com>
>>
>> Doing proper integration of TTM system memory allocations with
>> memcg is a difficult ask, primarily due to difficulties around
>> accounting for evictions properly.
>>
>> However there are systems where userspace will be allocating
>> objects in system memory and they won't be prone to migrating
>> or evicting and we should start with at least accounting those.
>>
>> This adds a memcg group to ttm bo and tt objects.
>>
>> This memcg is used when:
>> a) when a tt is populated (and unpopulated)
>> b) the TTM_PL_FLAG_MEMCG is set on the placement for the
>> bo when the tt is allocated.
>>
>> The placement flag is set for all non-eviction placements.
>>
>> This version moves back from the resource to the tt layer,
>> when accounting at the resource layer, if an object is swapped
>> out there was no way to remove it from the accounting, whereas
>> the tt layer has more info for this.
>>
>> v4: move back to the tt layer from the resource layer to
>> handle swap, but keep the memcg charging hooks for now.
>> v3: moves from having a flags on the op ctx to the using a
>> placement flag.
>> v2: moved the charging up a level and also no longer used
>> __GFP_ACCOUNT, or attached the memcg to object pages, it instead
>> uses the same approach as socket memory and just charges/uncharges
>> at the object level. This was suggested by Christian.
>>
>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>> ---
>>  drivers/gpu/drm/ttm/ttm_bo.c      |  6 ++++--
>>  drivers/gpu/drm/ttm/ttm_bo_util.c |  6 +++---
>>  drivers/gpu/drm/ttm/ttm_bo_vm.c   |  4 +++-
>>  drivers/gpu/drm/ttm/ttm_tt.c      | 17 ++++++++++++++++-
>>  include/drm/ttm/ttm_bo.h          |  7 +++++++
>>  include/drm/ttm/ttm_placement.h   |  3 +++
>>  include/drm/ttm/ttm_tt.h          |  9 ++++++++-
>>  7 files changed, 44 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 5bf3c969907c..1630ef28e5a8 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -140,7 +140,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>>  			goto out_err;
>>  
>>  		if (mem->mem_type != TTM_PL_SYSTEM) {
>> -			ret = ttm_bo_populate(bo, ctx);
>> +			ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, ctx);
>>  			if (ret)
>>  				goto out_err;
>>  		}
>> @@ -1237,6 +1237,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>>  /**
>>   * ttm_bo_populate() - Ensure that a buffer object has backing pages
>>   * @bo: The buffer object
>> + * @memcg_account: account this memory with memcg if needed
>>   * @ctx: The ttm_operation_ctx governing the operation.
>>   *
>>   * For buffer objects in a memory type whose manager uses
>> @@ -1250,6 +1251,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>>   * is set to true.
>>   */
>>  int ttm_bo_populate(struct ttm_buffer_object *bo,
>> +		    bool memcg_account,
>>  		    struct ttm_operation_ctx *ctx)
>>  {
>>  	struct ttm_tt *tt = bo->ttm;
>> @@ -1262,7 +1264,7 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
>>  		return 0;
>>  
>>  	swapped = ttm_tt_is_swapped(tt);
>> -	ret = ttm_tt_populate(bo->bdev, tt, ctx);
>> +	ret = ttm_tt_populate(bo->bdev, tt, memcg_account, ctx);
>>  	if (ret)
>>  		return ret;
>>  
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 15cab9bda17f..7d599d0707e4 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>>  	src_man = ttm_manager_type(bdev, src_mem->mem_type);
>>  	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>>  		    dst_man->use_tt)) {
>> -		ret = ttm_bo_populate(bo, ctx);
>> +		ret = ttm_bo_populate(bo, dst_mem->placement & TTM_PL_FLAG_MEMCG, ctx);
>>  		if (ret)
>>  			return ret;
>>  	}
>> @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>>  
>>  	BUG_ON(!ttm);
>>  
>> -	ret = ttm_bo_populate(bo, &ctx);
>> +	ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx);
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>>  		pgprot_t prot;
>>  		void *vaddr;
>>  
>> -		ret = ttm_bo_populate(bo, &ctx);
>> +		ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx);
>>  		if (ret)
>>  			return ret;
>>  
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index a194db83421d..02aea23a34e7 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -224,7 +224,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>  		};
>>  
>>  		ttm = bo->ttm;
>> -		err = ttm_bo_populate(bo, &ctx);
>> +		err = ttm_bo_populate(bo,
>> +				      bo->resource->placement & TTM_PL_FLAG_MEMCG,
>> +				      &ctx);
>>  		if (err) {
>>  			if (err == -EINTR || err == -ERESTARTSYS ||
>>  			    err == -EAGAIN)
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index 698cd4bf5e46..81c4cbbeb130 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -161,6 +161,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>  	ttm->caching = caching;
>>  	ttm->restore = NULL;
>>  	ttm->backup = NULL;
>> +	ttm->memcg = bo->memcg;
>>  }
>>  
>>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>> @@ -365,7 +366,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>>  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
>>  
>>  int ttm_tt_populate(struct ttm_device *bdev,
>> -		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>> +		    struct ttm_tt *ttm,
>> +		    bool memcg_account_tt,
>> +		    struct ttm_operation_ctx *ctx)
>>  {
>>  	int ret;
>>  
>> @@ -376,6 +379,14 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>  		return 0;
>>  
>>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>> +		if (ttm->memcg && memcg_account_tt) {
>> +			gfp_t gfp_flags = GFP_USER;
>> +			if (ctx->gfp_retry_mayfail)
>> +				gfp_flags |= __GFP_RETRY_MAYFAIL;
>> +			if (!mem_cgroup_charge_gpu(ttm->memcg, ttm->num_pages, gfp_flags))
>> +				return -ENOMEM;
>> +			ttm->page_flags |= TTM_TT_FLAG_ACCOUNTED;
>> +		}
>>  		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>  		if (bdev->pool.use_dma32)
>>  			atomic_long_add(ttm->num_pages,
>> @@ -437,6 +448,10 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>>  		ttm_pool_free(&bdev->pool, ttm);
>>  
>>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>> +		if (ttm->page_flags & TTM_TT_FLAG_ACCOUNTED) {
>> +			mem_cgroup_uncharge_gpu(ttm->memcg, ttm->num_pages);
>> +			ttm->page_flags &= ~TTM_TT_FLAG_ACCOUNTED;
>> +		}
>>  		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>  		if (bdev->pool.use_dma32)
>>  			atomic_long_sub(ttm->num_pages,
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index 903cd1030110..d7c0dd9e0746 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -135,6 +135,12 @@ struct ttm_buffer_object {
>>  	 * reservation lock.
>>  	 */
>>  	struct sg_table *sg;
>> +
>> +	/**
>> +	 * @memcg: memory cgroup to charge this to if it ends up using system memory.
>> +	 * NULL means don't charge.
>> +	 */
>> +	struct mem_cgroup *memcg;
>>  };
>>  
>>  #define TTM_BO_MAP_IOMEM_MASK 0x80
>> @@ -486,6 +492,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>>  		     pgprot_t tmp);
>>  void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>>  int ttm_bo_populate(struct ttm_buffer_object *bo,
>> +		    bool memcg_account,
>>  		    struct ttm_operation_ctx *ctx);
>>  
>>  /* Driver LRU walk helpers initially targeted for shrinking. */
>> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
>> index b510a4812609..668798072292 100644
>> --- a/include/drm/ttm/ttm_placement.h
>> +++ b/include/drm/ttm/ttm_placement.h
>> @@ -70,6 +70,9 @@
>>  /* Placement is only used during eviction */
>>  #define TTM_PL_FLAG_FALLBACK	(1 << 4)
>>  
>> +/* Placement causes memcg accounting */
>> +#define TTM_PL_FLAG_MEMCG	(1 << 5)
>> +
>>  /**
>>   * struct ttm_place
>>   *
>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>> index 406437ad674b..2790fc82edc3 100644
>> --- a/include/drm/ttm/ttm_tt.h
>> +++ b/include/drm/ttm/ttm_tt.h
>> @@ -90,6 +90,8 @@ struct ttm_tt {
>>  	 * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set if the
>>  	 * struct ttm_tt has been (possibly partially) backed up.
>>  	 *
>> +	 * TTM_TT_FLAG_ACCOUNTED: TTM internal. This tt has been accounted.
>> +	 *
>>  	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>>  	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>>  	 * then unset when TTM calls ttm_tt_unpopulate().
>> @@ -101,8 +103,9 @@ struct ttm_tt {
>>  #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>>  #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>>  #define TTM_TT_FLAG_BACKED_UP	        BIT(5)
>> +#define TTM_TT_FLAG_ACCOUNTED	        BIT(6)
>>  
>> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
>> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(7)
>>  	uint32_t page_flags;
>>  	/** @num_pages: Number of pages in the page array. */
>>  	uint32_t num_pages;
>> @@ -126,6 +129,8 @@ struct ttm_tt {
>>  	enum ttm_caching caching;
>>  	/** @restore: Partial restoration from backup state. TTM private */
>>  	struct ttm_pool_tt_restore *restore;
>> +	/** @memcg: Memory cgroup for this TT allocation */
>> +	struct mem_cgroup *memcg;
>>  };
>>  
>>  /**
>> @@ -245,11 +250,13 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>>   *
>>   * @bdev: the ttm_device this object belongs to
>>   * @ttm: Pointer to the ttm_tt structure
>> + * @mem_account_tt: Account this population to the memcg
>>   * @ctx: operation context for populating the tt object.
>>   *
>>   * Calls the driver method to allocate pages for a ttm
>>   */
>>  int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
>> +		    bool mem_account_tt,
>>  		    struct ttm_operation_ctx *ctx);
>>  
>>  /**

