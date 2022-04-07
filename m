Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95824F78BE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3223210E5C8;
	Thu,  7 Apr 2022 08:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC0610E5C8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:02:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgoJowVI0hVkGQJoNOGYRYvntQPEq7ssdyJmFkHW3U3E2P7lmj7pklYXfjt4rLm7MEHFuvz1TWaggdsxKShHV+PX2KWfWFt6B1uVc7aYwuVLj/5jbzOPIvq6afNC9Ls3gkjx0c5F60rcB7myIuv/Sqd/34VkNiNwiDb1InNRwljG3IqdIwSrJRYmnBJe5/Pwyrr+TWEFzzk1lI8VD+p70unKoxgakTUJm2HnofVqUrDbtgd/rN2z34WXuJhiKGtXHCmGXj0Aa+4KwlBLAMOC3DD4DaKL543rE3/MAZecrgvmUVa1OrxKBfhgY22u1j6DcQGnaiqJJ+BjSBW+Cd7TtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhGjMZdir0oKnFF8R0dyxNYHX+4NM9p6PLELsivI9D0=;
 b=kQZxMB2+Uc5Rg7V4WAtWTJNSu1mltUEgqeT76sP08iQ9/v8+VncPoxiJP7m5NZZnY85JJcOSuRGhCeRtHR+pjBJe3lrCX8NOyUfoxoS8xkIY/0gWgAJ9Qx1BvhfeBVdOixefv7ZiXrJSaAOx6r4f7z89kAaHxe1IpuB0ZLEbiF9kZwZbMyyEE23D5YRj2nAS/Nmdl50N0YExjezXzztPIFP6AVFtztykA3M5bUoqAxENxvzefAZTbCpkHhBAPhAuUfxuYBVPfIz+FIFuwxKY5HCFc28foXGI2ayjhKxoN8H/fnxseA2l/A1FMgKWB2On6HTTum7MbHWgdvw5B+n5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhGjMZdir0oKnFF8R0dyxNYHX+4NM9p6PLELsivI9D0=;
 b=y31o1rAM2MQORFuB+FipQ+4LLX6wGTAIaH/Tz1Wv6ibEA6G1fgWFGMMO+7op36S8z4u+BnuAn9XvwXVkVTrHleRLJLdW/0cJjodGjOSw4OvUqWPOFlz0Y2kzF52hIT38dYbQzRXjhOnlgKwfFN426nHtcBtsEE1AXUKldtxhJQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1197.namprd12.prod.outlook.com (2603:10b6:300:f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 08:01:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.021; Thu, 7 Apr 2022
 08:01:58 +0000
Message-ID: <0e34ce06-c962-b1f1-d2a9-5dedbd19ff32@amd.com>
Date: Thu, 7 Apr 2022 10:01:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/16] dma-buf: specify usage while adding fences to
 dma_resv obj v6
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, DMA-resvusage@phenom.ffwll.local
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-4-christian.koenig@amd.com>
 <Yk2IVgQMbb24cKdv@phenom.ffwll.local> <Yk2JBZ7z/uZop5xx@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yk2JBZ7z/uZop5xx@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0041.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdce94ef-46b9-43ff-de72-08da186ce3f3
X-MS-TrafficTypeDiagnostic: MWHPR12MB1197:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB119709CB0CC758656B6D8A3483E69@MWHPR12MB1197.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jOzQ335mfhdEznGoUtmc8/+dMIz8+wh69OG+C03hw/SQZ/xjnJKoqLvT9T8iMVpUxw8us2dB3fk+77LMMZieyE8OUmy327iomLMmUxeJpkuxM0p8KpsGTX/5mfPElChj66FB9tE04bVOLF3ZOQhUntY04A3rvgIapnC36oDmCwM2WBrwo0DMEEQSt0P9eXJoChTcXXXnOexkgsjnOFY99QydwgV+/p48X8s17WYdA0REiPiGHmmWbPGsQv0tqtdwHp6R7dfoHKvXAyKEyd3H6q7jQq7EiHZivRUlUoxJoOYGjHe/FihH3K2HvOVCwgEqDVfhccdHkm2T0C+Y7jeXdqalVkxd9qZusvZDF+hpRP2Ex0KtGNgiCzadorK7Abw708DKzFrMvsyH+yJcaSXYlqW0y5pTEmwIJ7LN1M7u4Fu3wIc24LnaPcbAjZGF2IZhxATHiHd95x66XM4Jqpa+umJNgJNN5KhpqhW2xvApHfIDxJIoV+ezstq4wF5qciV0xsfamEzJiA7Bw4ZDxza4JRwpI3+Y5EtrWDdaQdbzQrOVuffiQIXsi4cXBQw5HnE4kCzRsJj5hKOuJVE97cCjPulazwVY2BkaX9/Z3zuTnqCXzbrU+N/10T4hNzsdQPrXrBcWYBBUPZioBHn2mgcR7Q71TofMfBr9bmR0brbMInar2Nu+5ZMTiUkVhSmO73WvYleFrihFRoZ9E1ucgv1rTPeeNnEyo2/3+H6P9R5iMxpyF77IZWS5eRQex0UHrtPU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(31696002)(86362001)(66946007)(66476007)(66556008)(4326008)(316002)(36756003)(2906002)(8936002)(6506007)(6512007)(6666004)(26005)(186003)(2616005)(8676002)(6486002)(5660300002)(508600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUx6Nk9wR1hkeWIya0h6eHIwK3NVc0xPRlRmQ21HNy80MDZwbzRybzZQZTA0?=
 =?utf-8?B?YW1QeGNnajNyNmx4cTh1MVpBRUpkWTBaTk9aajJUWWR2Z3puTVRXT3NFc0pX?=
 =?utf-8?B?ckhYKzdETkFEZjhzNnZGOWpJVWxVZU9pVWRZbXpxSnpJeXlLeHczQUJMVXFL?=
 =?utf-8?B?bWpZQkpkdTJVYytyTDdPVU1yaXgwb1EyU2ZCdGFoNTVTTFYydHAyR3B5U2lW?=
 =?utf-8?B?WmwxU2txU0JnaXdSTEJ5dGQ1MDhlQ2NLTzZYOUdEM09DM3VpYWhXSDdWeTNB?=
 =?utf-8?B?RXNWYndrbGhlOHA0eEZOSDYxMU92dm5mRW54S3B6WUUyUnIzUy9jMzcwN3NJ?=
 =?utf-8?B?OVZLVmUyWXVFMk4yVEJoUEZQdUE4djBHVlhFZGN2d2QrazZxdlhaSHl3T2tW?=
 =?utf-8?B?eXJCWWhnNXU2RnNkeXo3dGdXREZ2Ykh1YnlBVjN6a3V1N3dLVFpYSUZORW4w?=
 =?utf-8?B?TUhaZzNVOGZucnRoY0FNblVKdVIwTTJ6cmU1NTRLU1d4a3RjeU5TTXdSZUhG?=
 =?utf-8?B?aFEwSXF3RU5NTE9WUStmT21DQnlDV3hsZkQ1NjNiaFV5c3NNb3pXYWlrdXBk?=
 =?utf-8?B?c2NZM3grbkI5dk1SZFg3bHl1eWpwdDUxY0pxTi8xMmVjUVBCMXcrTGlwelFa?=
 =?utf-8?B?UTB5VGFPcUpINjFMc0w2c0cwak5hdmx0S2h0WVpVMVNkcFlMbTVUbWtObEZH?=
 =?utf-8?B?bzdsQk56QjRYeWVpQ003MVIra2RBeFo0NEt3Zjg3VG42WFpLbnFMYTJxYlRE?=
 =?utf-8?B?Si9HLzBwRTNNOU9sTzliZDNnU3FNcjNBT2J2Y0Nic0RzbHlaTVNTa1ZKKzNm?=
 =?utf-8?B?SkEwRFNtcDJYS094a2F1TVRMdTFkYklrVS92SjJkZmdVQmRoOWt3ODZGeTdE?=
 =?utf-8?B?SDBSZi9pUitweStxVE54WCtqU3NOR0d2RWZlVEo0QW5oOGJFS3BIb0EvSHpZ?=
 =?utf-8?B?cnphQzdNSGozbTloWk92SGF3M2NnOTc4cE8xc1VSZGYvemcyd1hUZTFMc2N0?=
 =?utf-8?B?ZGEvVEdkcXZxalFxVHptU24yY0d6Unp1VmVTSWhzdGlLQTB0VkU2U0M2STA3?=
 =?utf-8?B?SGF5SHB6Tkg4SnA1RUcxcmtOWHk3K1FtZDFZNmgyalV3bmtXSVc3R1Q3SXl5?=
 =?utf-8?B?cjhOb3NyNnIwZWx2TG9QbVNkeUxKdE1SZ2lyTTYvd3l2T0Irc21qSmtUTDdP?=
 =?utf-8?B?dWxNRFdnVFN2anhKdklJTGNJdVJQSmFTaVA3b2s1LzNWY0tNQ0FNdGdMZjdM?=
 =?utf-8?B?QzRQaDBFL1dhMEdPSVlySmt0YTlNVWkySXlXclRqNlpVMnpLTnRtakdkcHky?=
 =?utf-8?B?VUhSdGhlT1plSmFYMit2UEg0N3E1ajRPcW5KTkFVVTNVblh5S3gzSFBZb3gz?=
 =?utf-8?B?Y1F2akQzNXJDU0hNdzFxeWViVWFvRU1xSjRaMTI1U3V2ZFA0S3U4QnhQREJP?=
 =?utf-8?B?RDZnTy91Z0xEbHAvMEpBNTR1bVVua2ZuYkRBeVJGTXl6T2swYUh1R3pDYWQ4?=
 =?utf-8?B?UXlCK3djVDk3NmpGR2lJcTByenpGa2xCZVdPUnBsdlZMZ1dMSXlDV2NGcDhT?=
 =?utf-8?B?YUhmMzNMYzQvYU95aUFDTi9VbGlPUG54cjc3MTUrbGpRdnplREFacUJURFc2?=
 =?utf-8?B?OGw3aTYrN21QUlQ5Vm5jdnZWM0d1U1VKOTJiejBYd0hRUEhsajlJeURCZFJH?=
 =?utf-8?B?L3loQk1xN3FsNDU1L1hCSm11UkhWUjAwTTErSEtpcW04ODFoQXUzNkx2QWs1?=
 =?utf-8?B?cGFWd1k3emN2SmdRZWxhTUx4RG5Hcmd1Mjdyd1FzM01ybklOZytCd1E0Z3JD?=
 =?utf-8?B?alhxTVg1UVJIZTEzRktNa2VETmlTano0Y0hQNFdGZXlkRjc0UGFBVzhUcGc1?=
 =?utf-8?B?QkNPRHJqZU5BRGRRRFA0MEI0TnZkL1BKSkFOaHRqc0JDRFU2c1lRL29qRWhk?=
 =?utf-8?B?T1JjWjRnRnBWdysrY2NvUDNkQlhsTUNDRDlGbnFNM1k5TjUxR0Z6Z1NnU01F?=
 =?utf-8?B?a1hNbDJ5V2dSZGVwUXpIMlBJRDBmUDJGUEFpVEk5TDduK1BIZWZPTUdrTGtt?=
 =?utf-8?B?ODAyYmhCK2RpZ1RVY0Z0bytLRCtWY0Nic2gxcEJqWkxBZVovZjNZMDZ3c2RR?=
 =?utf-8?B?N2l0TmZzVEdTM2dGVG55c2UrSlBFRE41dnRhMjJaLy9nWldiekxnQS91MDIv?=
 =?utf-8?B?N1dVYnVJWWpBUjZaaEovNkZtL0R2bExrc1FBUWptQVNIbUMvTDlhcXNuSFJn?=
 =?utf-8?B?Z1ZLaXdSSzNPUndZUGUzQ1JKQkdjZVJTR1lDSnN5cVBoOXNrbWJSY2hES1hN?=
 =?utf-8?B?OGhweCtBSkVVZ0dLdjk1MDJZK2dXQVJTWlhhWVo2TVlvNk1SQWxodz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdce94ef-46b9-43ff-de72-08da186ce3f3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 08:01:58.7697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX4MTUhMQqEVj4UdO+HWYi/fQo9A+FFqJmg5y/wISeB25c44JZy4CiomFwZ4j9hC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1197
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.04.22 um 14:35 schrieb Daniel Vetter:
> On Wed, Apr 06, 2022 at 02:32:22PM +0200, Daniel Vetter wrote:
>> On Wed, Apr 06, 2022 at 09:51:19AM +0200, Christian König wrote:
>>> [SNIP]
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> index 53f7c78628a4..98bb5c9239de 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> @@ -202,14 +202,10 @@ static void submit_attach_object_fences(struct etnaviv_gem_submit *submit)
>>>   
>>>   	for (i = 0; i < submit->nr_bos; i++) {
>>>   		struct drm_gem_object *obj = &submit->bos[i].obj->base;
>>> +		bool write = submit->bos[i].flags & ETNA_SUBMIT_BO_WRITE;
>>>   
>>> -		if (submit->bos[i].flags & ETNA_SUBMIT_BO_WRITE)
>>> -			dma_resv_add_excl_fence(obj->resv,
>>> -							  submit->out_fence);
>>> -		else
>>> -			dma_resv_add_shared_fence(obj->resv,
>>> -							    submit->out_fence);
>>> -
>>> +		dma_resv_add_fence(obj->resv, submit->out_fence, write ?
>>> +				   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
>> Iirc I had some suggestions to use dma_resv_usage_rw here and above. Do
>> these happen in later patches? There's also a few more of these later on.

That won't work. dma_resv_usage_rw() returns the usage as necessary for 
dependencies. In other words write return DMA_RESV_USAGE_READ and read 
return DMA_RESV_USAGE_WRITE.

What we could do is to add a dma_resv_add_fence_rw() wrapper which does 
the necessary ?: in a central place.

>>>   
>>> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
>>> index e0a11ee0e86d..cb3bfccc930f 100644
>>> --- a/drivers/gpu/drm/lima/lima_gem.c
>>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>>> @@ -367,7 +367,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
>>>   		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
>>>   			dma_resv_add_excl_fence(lima_bo_resv(bos[i]), fence);
>>>   		else
>>> -			dma_resv_add_shared_fence(lima_bo_resv(bos[i]), fence);
>>> +			dma_resv_add_fence(lima_bo_resv(bos[i]), fence);
> Correction on the r-b, I'm still pretty sure that this won't compile at
> all.

Grrr, I've forgot to add CONFIG_OF to my compile build config.

BTW: Do we have a tool for compile test coverage of patches? E.g. 
something which figures out if a build created an o file for each c file 
a patch touched?

Christian.

> -Daniel
>

