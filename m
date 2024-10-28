Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6359B2F5A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:55:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7A710E488;
	Mon, 28 Oct 2024 11:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ii+/N8TT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67D610E487;
 Mon, 28 Oct 2024 11:55:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oibAdU/BLkBDR3S5Nk3o3OqAISMgd28COPU0CgfsakOLNM7e0aHnb/m4H1AXiVUuD1Y+5/5PED+e5Ct6wfWzqQgkCzcYD1nPcbhEA71YxCu52IEiZMiLtCvo+BoIW88Dp0WHvCDdcBF2IWouUAvQiG8OP0d1d5g7+kJZE8nA698rzYrRX9oG4syLNw43VGq+wOjUvsQ/dBWvyDOM1bg0bQf/AW48FYgkv5QcoiGZICw08hVKvHCn4gW5LAOqownIOPsCAtmjzL98ow9G9trp4gq7n+xjKwSJkDLJzCzVHm+Fu+ez8Xn6MeiJc9HPSHEVw6XERG6y+BSioHatXX2C1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0m4PX1Vlzi8Ix0h17LZzI1BFFcYoqfjjFFwahoD8Bo=;
 b=vA4Of3E9hT8cPx4peSc0KrQzt37uMSbDH+nHhTNySlUwQUxsnzmLtXWxX1pvxcZdn0HUzWDovSaPsB72Q0IwDSCFjR19P/n74Yw+Mw7tKktlL9fq6TFDkmW4R6d617l6VmgGRpUKP9R0pA5CWZqxQyKFuWqN8gkPnq3ugLQRE4URGkXmcY/KGA7e9cj+SWSh3LnGowxBe1Cv/zSn6X91RKAZLzgI6PhrLeOMcQIV2H5dod+ftL9wpE26rElhpBGO/cViaOtXej0CyOqLpNC/hINg96u/loabC6NRvW6suYiOavDhfbJsQ/I03m1ce+tWgPL0SPP7n1GxEB3FQLCYDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0m4PX1Vlzi8Ix0h17LZzI1BFFcYoqfjjFFwahoD8Bo=;
 b=ii+/N8TTj0sWYU7XwF5uDx+W0bDRwC/0/AbkaohQrxT7/1U9uMJNPuUKTrD36oKy+h7YmQchjuW0GsnDB5Ny1uCgyc8riEgj3EdDNHHcAxpjqpgGw/kacjWFLYNyEq06CKkCl2kCASdpChSy5urTxYgujmQBwj44T3fecBqVPo8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7698.namprd12.prod.outlook.com (2603:10b6:208:432::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 11:55:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 11:55:22 +0000
Message-ID: <b55a80c2-4253-4f14-b8f9-c37e1e55960b@amd.com>
Date: Mon, 28 Oct 2024 12:55:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu/fence: replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
To: Hongling Zeng <zenghongling@kylinos.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, zhongling0719@126.com
References: <20241025035110.10854-1-zenghongling@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241025035110.10854-1-zenghongling@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7698:EE_
X-MS-Office365-Filtering-Correlation-Id: 16864760-d38a-4d26-c15a-08dcf74766a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFVWVI3dFd5SVZ5STVDak51V0FMQVplWDliTEJhWWdnMHRqTUhELytnRC8r?=
 =?utf-8?B?QXlmUTk4SXY2eFNvZWl3TnNwTmpaZ21xQXVnVFpnNG95dDVsbjh6REk2SzdF?=
 =?utf-8?B?QklQNnFxSGtEWW12OW5hdlVzSWZVMkptUXVNU25oUnZ1NkFjMHBDNlR4cjcy?=
 =?utf-8?B?QUpEa2g4cUhjUG9EdGRaRFZUcnFBZkMvMnJ4V3N4ekVDU0lMWHVBY2VZR1Ju?=
 =?utf-8?B?Y2NMY05VSEljK3MwU0xGTGlVM0Q3am5GTTVTUi9UeXR4REc2QUlaK0l6bVQ2?=
 =?utf-8?B?SitiR0R3dURRSGowNGZNMFArcG4vVWh2Q0FFMjFKVExJZ3RoaGZpZkp0WXB0?=
 =?utf-8?B?YzZLaTlyYnNIWGd3WC83ditNdlprc1gwNUl5Wml5dDZJWVJBNnF6WUZCbnNs?=
 =?utf-8?B?NGhyZXZrVEZSMnRjOG9IZjB4Y0U2cmc3RXB1a3d0eHI3VFJ5M0x5VmdvOVJU?=
 =?utf-8?B?WDU4Q1dBTGFnMXB0cTBWMXpWRVd6Y3l2MVkvVUU2akhlc2dwUTJkQXpXVmdY?=
 =?utf-8?B?OHE0ZE1ZZHp2ajkzNmJBRkRDRFpwWTJ5ZEM1ZmlhYUZFdHIwWlBEeXlxOUp0?=
 =?utf-8?B?Y2FVS3pDRUZVdWVONkNKdk1LcTBjUjc2czVKRzNNYVF4TUtpSVY4RmFIMHEy?=
 =?utf-8?B?MG8vYzlYUXhmVWtubjVtK21CQmdGbytwMHQ4NTlURGZKT3JNeFUyc2xXMlRK?=
 =?utf-8?B?MkI5T2Q2MVRXbjNkOEpmMUloTjFXSWo5eG9qcHBtc1U4eTlEU04zM0ZsVHg2?=
 =?utf-8?B?U1E5R3hNQTg3b01lWkNMUnJWd09EQ2dGUTRYNDJsMWFFSyt6U1c0ZklsZmdv?=
 =?utf-8?B?OVppcWZxQWd1TjZiMzluM0hLTVpmTjFtWmgwQmxaNUFiSWxwZElSN0xvTmI4?=
 =?utf-8?B?RlBnTzUxWWY2a3k2dnVrQi81cmZzVmFVOHRSS2N2YlRxNW5hWlg0YzRzRVo5?=
 =?utf-8?B?TWw3SWRRK0U3T29RbG10bFppTndYWTFaMHFiVC9JZEFwRTYydnFRcjRwSURC?=
 =?utf-8?B?WjkrclNtaG80UUtYNngwdHVtMXovRmt3akd5N2FqQmZNN2VOWXpNUnFyYnY0?=
 =?utf-8?B?TFlmZi8zc3UzM1g4RlJjYkh0MjB4K1A0TFRXNm9qQzRxckRBUjBJUFdiaGtQ?=
 =?utf-8?B?Mmt0SXdPWktPOFMrT2FhSE42akpMNEV5QnJrY0YvM3ZMMWNwUk11Z2ZBMHd3?=
 =?utf-8?B?R21ISTY4L2h6Tmpia2trbUh0SkNTZEFaUFZJbjVHdk52dnhuYlJ2aVFVaHpy?=
 =?utf-8?B?amNFQlU5OGJEaUpqbDR4b0IzSVFJTXQxNGJOditEOWRKY3FkTHRpUk9ubHNG?=
 =?utf-8?B?VXNPQVhJT1kzd1BqNDNBcHZrUlU4OXJuUDlmaEdGbU5DN0s2cTNZOC9aYk9O?=
 =?utf-8?B?K1haSWZpcUFnUkNJWE5TbHVuSXdFVWcxNFYxWjlDUmxkUWptalp3cExhYW56?=
 =?utf-8?B?Tnl0Z3psM1BJT1VYT3VvbnBnTG5VN2ZxazNGc2pjd3MzZlpvWHdoK0dFeWIv?=
 =?utf-8?B?MkdjZzcwd2ljemZPelVqTjhwTjBBc2hScHdHV0d2cmJwRTlOMzVvM1hQVFJD?=
 =?utf-8?B?SkovTGF2UXVYamFRQmFGVFlvOG1KaFV2L3BxZnFtaEsrOUZpb0tsenkxUXU3?=
 =?utf-8?B?dW0weEdDQzhjSkpsV0RhSmhPWUVkWDhPcTJPZXZ0SWE3TFdLZW52NG4vTHQ3?=
 =?utf-8?B?NkFhWVlaeGJKV0c4eUJVVmh6cTZkT0pZNjFEZ0Fwb0FGRGZXenZDZDFmMnRr?=
 =?utf-8?Q?DJFVmOApZfkmtpgx8LZQHZxFTocBuWrSPGjEchk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFU5R3ZpVCsvZXJrbFBDN0p6VGlKNVRWSlU0UTRUaFhNUlY3aVVVbFlOc3Va?=
 =?utf-8?B?Y29IZ05qY3dXMWVKYWlxY3g0Q2pLMCtWN0ZJYmEveWMrUmtwWjdiWXpRS09Y?=
 =?utf-8?B?eUg1anlvVm5HM3JiQ0IrVG9CM2g2ZzE3WWZBeVBHNmJVdGJ3a2dPR002Ym1o?=
 =?utf-8?B?V052ZzZYTTA1dDVLdEc5d2tlSVFoeUw0KzNNU0dsRG9hMmd5ZzN1cG9adXhC?=
 =?utf-8?B?eW8xSFFPMHFoRlNXc1ptTldSQUhBdWdXdjVpVWxXb3l0RmZ2TVFCOVZhSnBp?=
 =?utf-8?B?Q05uN1NEYUEyc1dWUTBPVGdOT1RaZXJCL2t6bkI5cUlVb1R0bkNybGt2blBG?=
 =?utf-8?B?Qml1aDQ0WVVxUDJFekNSMW1rTWJ5OUFaNTdoL3FCbzJCdG03NTJ4Z0t1Wlh4?=
 =?utf-8?B?R3hVRHVyYWFNOGtIbjFVcEFUQ0srRG1aaTZrMlVoeUNqQytidWhrNjZjUWhZ?=
 =?utf-8?B?V0QzMzRPMzFEUHYzZ21ORFFUQklCYTBtN1IwUnNUVXlIVnZ5QUNFS1VhRnhL?=
 =?utf-8?B?eFlVOXNZdVBXUGI2QlNqbGhYL09IellCdEtWK1o0UTRBNDFFcmRaWTRYeGdL?=
 =?utf-8?B?UDA3UGNENmNtQ1U3bFcvbWJUbHhYWnVoZnNuVEJ3dTA2aVIrd2luM1RuKzRV?=
 =?utf-8?B?c1EvejR6R2Zkd056RFZUUUFES1hpVzV4UVJEdkRTc1N1ZFkxaEF6TGFJMkdu?=
 =?utf-8?B?aVdVcGRWY0hvYytmbmpUMGJCUXdWd3dkNTFTWFYyOHovdHFmT1psWXBIWWpI?=
 =?utf-8?B?U1Z3NmhZbmpwVElzcWlXakhRTVhBRUl2RTVRUElmcldqUnQrQUREanlqWUVz?=
 =?utf-8?B?Y1JKaWg1bU1oamhqTWdSSloxazFyd2ZaM1JmU1JmMVhkaC9waU94eGtVeGZF?=
 =?utf-8?B?bldJZm80elpLWE81K2EzSmozUHM4ais4WHpqbHJVdThmZ2NmMTlyZmlUY1cz?=
 =?utf-8?B?eW4zelBmeU9ZR1duQmtLOC9VV3NWNjByWlZLTDN6K1NPdUoxaktFd3pSeTMx?=
 =?utf-8?B?UDBoR0QxU0hoNHYwZjV5L1BoWnA3OTVlZGw3NkxaYWtUNENGQjNhQ2NwVDJF?=
 =?utf-8?B?ZU1rNmg3cmk5aE9nYy9mNW1CdGNGdFdhNk5Ca2J6OTR3U1JXbG9TaEk3YU05?=
 =?utf-8?B?RUdtblZWNm1rTnR5TUhGb2xLNjMyY1RBbkx5b3B6ZGwwTk9HUnh0NTdaMFc3?=
 =?utf-8?B?TWRLZVkzdW41a250ci9sOGFmaWw4NVFuYUpxdmpHYWRCOFRLQlUvSGV5ODFv?=
 =?utf-8?B?SnA2MGVKZGhuYlBuUDlNK2lQME13NkMzSXVYYkEvTGdiY243cExSbkEzY1U3?=
 =?utf-8?B?Z1BJSTBrUUg0dnByTHIwMkJTRnhnTGRSLzFTeGs3MVF0cVdMZHpwNWNONVdR?=
 =?utf-8?B?SzdtTjBJV3MvSzlPM3NqUGU3cEFIRmdjSFhuUkhZaHMzaGFPNVVPTVFZY3Qv?=
 =?utf-8?B?Nlc0WGhyQ3N3dUNCYmMyREtvb1ZFL0NlanNBS3Bxb2VQeDFsYU1sRFVqNkNO?=
 =?utf-8?B?RGJQWHFNaWxETkE1RmhVSTRraGU1bUVXeUpVRnkzc2t5T0Jwa3hLb1IxL2xx?=
 =?utf-8?B?Sk9DRE9zTUVOYWhOOWZjdXQrMEdwTXBnVGIzZU9YYUJ1b3BRL01DTHJZR1lm?=
 =?utf-8?B?Y2I1QTYreVI4ZzVDYTJDSG1iT2xSSjh2dlZmYnd3WGQzVFBWVkdQaWVoY3I3?=
 =?utf-8?B?TGVFZ21tQjg1c0g0Rld5SXFzcHhzdGhtZ2NLa3BsSzRKdGM5WStSU016dUNO?=
 =?utf-8?B?VW5ZNG1PeGpHRXdFK2Z5LzdvalJPeUR2NVo2WW4rNElQaHpGcEpuMWYyOFV2?=
 =?utf-8?B?b1lnT1FPUjYyWmdBVWRmUWExWGJaTi8vYUtOQUhSNGt6UThBbmpSRldwcVpL?=
 =?utf-8?B?QXdMTWswQzdRODMwbWViZ1MxdXFsNE10bXZsSkh4czhvZG9KSVBIUlYvczZm?=
 =?utf-8?B?SVV5UGZHN1kwbGRzRjRtZmxkNUZyLy96U2lZMlJxaHdhaTRndDZiWnF5VTBj?=
 =?utf-8?B?bWIyaEZVNEFkRDZnTnRTNjc1b3d3dUJKaXBYT1NHem5SVEQvOWdJcUR6WlFV?=
 =?utf-8?B?OHF3OWhER0RvSWZrWWtqSXFzYnQvbkdLcWpiS2pNYmdtQmdod3JITFFibzdQ?=
 =?utf-8?Q?C3uI7ZZZlC2xeYxvbsK8b70jC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16864760-d38a-4d26-c15a-08dcf74766a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 11:55:21.9805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: poyILRazAQDZkLCzfaNSsvCUb661JRzrtVrZRXmM8Gzl8f8cBzsMwpdec1R3qdNn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7698
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

Am 25.10.24 um 05:51 schrieb Hongling Zeng:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.

I would rather prefer to completely remove the use of kmem_cache here 
and for all other dma_fence implementations.

The object can live longer than the module which has caused us quite 
some headache already.

Regards,
Christian.

>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 2f24a6a..d047afe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -818,20 +818,6 @@ static bool amdgpu_job_fence_enable_signaling(struct dma_fence *f)
>   	return true;
>   }
>   
> -/**
> - * amdgpu_fence_free - free up the fence memory
> - *
> - * @rcu: RCU callback head
> - *
> - * Free up the fence memory after the RCU grace period.
> - */
> -static void amdgpu_fence_free(struct rcu_head *rcu)
> -{
> -	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
> -
> -	/* free fence_slab if it's separated fence*/
> -	kmem_cache_free(amdgpu_fence_slab, to_amdgpu_fence(f));
> -}
>   
>   /**
>    * amdgpu_job_fence_free - free up the job with embedded fence
> @@ -858,7 +844,7 @@ static void amdgpu_job_fence_free(struct rcu_head *rcu)
>    */
>   static void amdgpu_fence_release(struct dma_fence *f)
>   {
> -	call_rcu(&f->rcu, amdgpu_fence_free);
> +	kfree_rcu(f, rcu);
>   }
>   
>   /**

