Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C24EF229
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 17:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B00D10E454;
	Fri,  1 Apr 2022 15:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A922F10E179
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 15:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VifZEHV1BYltVp3n/WHlBCfjiBCj5nEZYINLw/NnoALx52qKC8Z6syD0X2wXGZkk95tpX9ClFMnEyV6tzecp2hJGj/B7LnEVPsks1G6drjZBwIm+sDr8vvN/DuJEArOZEPuz5o4iY82wtPdwBFGSmqeWVL//FmhFT68N+ZLho2WbNTnm/xMR19JhXdB2R8V32fq2myF5cXADZEB0y7p1EHsFeZ+dXvW0A7FZvZ1jeixUeqbkTnipSKawecErmvwAPfVB7DLvzWHDi5M88iqj7Tb5iI4VlinG/eKsA2q0hhU4uc0JmC7jhM50QJRsQWSjKA10VGA7NXJfrKLkl2ezaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nasJK40YCCpvUlH1k2+CBJw8YfSQ93Lv4SGvBh9xB3U=;
 b=a7KujllT2K4vMw6i+AutmZoydjlPpfnTMSQeuLjFXt9ECWiC3j3dU5ygQNdenuAMxVQWEC9TaGEFeihMCk1/QZWtYAhflNHx6KfX0TwQeI8lcmpkke94TgUPMVTexZzxaEaHW9DliWtsVoIuQf+KlDsC+744c+CIyNymhfBQlUYO+Sj6Gfi0iwtsZRAtDFtOgt5Hj7y7Y/qj5d+ziYnhcif1Yex/28RfVCFvhBzaAIVj3MnqCpN5Q6oKl9VwK4L23Q/CcvcArfOgk3N449sMxMK4AUUXtfmYdpbVoBWCRg7va9HXRQZd+7TP38P22/6ons/izv4iIoQwjOc02Cx5Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nasJK40YCCpvUlH1k2+CBJw8YfSQ93Lv4SGvBh9xB3U=;
 b=Ov7EsLVuAEzYMtGYbl2gCbecJhznxOPJ1KNsMkvig2P5slRGPe97vH6Gg+ZUeQo6qYS/xx1wFrsANIz+d9ohLaEyE+Uz6ZKun7IUlb5A0Q/BXO/RPs0gdkylEapPEoFtbm1pF7v60OibBOjKVnK8mODDr54cXSRRXTLJLPb55+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB3700.namprd12.prod.outlook.com (2603:10b6:a03:1a5::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Fri, 1 Apr
 2022 15:01:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.028; Fri, 1 Apr 2022
 15:01:19 +0000
Message-ID: <31041478-fe09-bf47-b1b2-5db01a157c23@amd.com>
Date: Fri, 1 Apr 2022 17:01:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 17/23] dma-buf: specify usage while adding fences to
 dma_resv obj v5
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-17-christian.koenig@amd.com>
 <YkMpD6bamZ3THpMg@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YkMpD6bamZ3THpMg@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0026.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::39) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1bcf47e-4149-4785-c597-08da13f07a51
X-MS-TrafficTypeDiagnostic: BY5PR12MB3700:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3700825A6D682812EAC7D36D83E09@BY5PR12MB3700.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7vRhUydzEA3jjf1Wa+9HNz3P7fanggTW7ul8wYLy38xMtWKmQe33CQRW37rG16X27JlFO+KBCUAYoWD4vv9MtVwk89RwDQ6IMsVnpYrG/T+T0D3h2j1n3WO22Asm0roIfyQjNlIt1YM6XemJSaomPv2OwoL4RbTdNkHYsSw1DrBgYUkeqgrSMClyMPmL60LDLnkINzkKDQ1X6Yrwpfb8+Givgetg7/4lMXCBHaUygcItvqaxwIEsbW29Xm4ctm8BxdE3+GC6z3G4efcEQO5SGqNxOnjykevTQBo4mJ5UUyj6JvpnC5NWP/0DoZNxhoIgnD3xuJFuk25w3x0EelvdKFXmrSsNMYf5/W9+TVH9/9dfe7M71VX250TwY+sRa52f1pEZK1JY5AL67v8Y8dYvlkma3tkLlBImDlXpSo7YUhkwZlMnmyByD0N8zUsP/kQhTtH0DA9B1AJ5w9GwUn6XTC1W3Mx8Br53wnWC+qNy1UO99vuwv+0uz1kXPQAtXYDNsOJKssWfNtNt/KWQ8sPzTmaOnXr6RBtiJbbVTSaYK30MhDjoXJnlJynQylNfnvOTD049yuubzfKu5WMzV/BQJrlS7nlsPwISXVwvVngmB3h9030AdtsyTC2wY3Kx7d+uTUiIXg1pEI93ukXMKYOVZqgq5pRCdxllO0jhKhNR+As0rP5AxKz6DBypffmoQ2gTMMi2goG6tmxZGD8i8gv/t4kYMO1Ezevfep1i4cD1dQGUceY6BmaHtFdxueHp2i1n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6486002)(31696002)(6666004)(66556008)(8676002)(2906002)(66476007)(4326008)(66946007)(6506007)(6512007)(110136005)(38100700002)(316002)(66574015)(31686004)(8936002)(83380400001)(5660300002)(36756003)(508600001)(186003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejBGdmVkeWtYWHFIZnBuSmRmKzR2Zm81YkJod1Y4VXg0cjk2dDhKc3p4cUlJ?=
 =?utf-8?B?bWwxTmlYY203akNKemYxKzFQWm5sM1BaUkVqMzJtalZpclVleTREd243WWQ5?=
 =?utf-8?B?Yk9qVEQyR1gzZ1ZTQ0xTTlNDM1k3dWovTHVMOTFESVpSVGNDdklaVEptSlUr?=
 =?utf-8?B?WDNZUDhlUmNidStOSzl0NDh1S3l6NUlKTDZGZHNwZ3k0Rm1aTElWSGl2dFJm?=
 =?utf-8?B?b3d1R0diQXE3eEc3MUFPQ2hSRi8xVHRSNmE5VGFRN1pCVzJ1RjVHTVlZUnJ0?=
 =?utf-8?B?OHlDcXJ0K1BYSGsvVWNKcXVKaG9qNXZ4ZVNGNisrQXhFcWpldHBOTDFwbTBt?=
 =?utf-8?B?T0xoYmNEYld6TTZJSVZpRjdCQUpMS2lYaDUzdGFFay84OXU4d0tWM1V0NVBu?=
 =?utf-8?B?d1hCNnlrKzlrS09oeWtsaFF1akVGTjV3OHk1dnZqQVE3UDNSOEFmdzhlNUE3?=
 =?utf-8?B?NzljOURsN3ZOcEhGM1lRWkxmMjRXYW1wYzRRaGNiRnAydVFyTWJsWHBLL0N2?=
 =?utf-8?B?N1Z3dUdLb1lWd0JVTEUxMWhtL1pCZyttVE1NZE9hWHRleXJ1c2sreUlHb2xN?=
 =?utf-8?B?VTlMMDJ3OFNDSTRPTC81V1c2azFpMjJKdVVEaUVWZUtLaTR2ckxDd214THpQ?=
 =?utf-8?B?M2x1dkdOeGJCVFZiZkJ4cXZDUHIxUGRHNlJKYndNcXo5VjhIRkNKZDR6MXVo?=
 =?utf-8?B?M21WN3R1Q2dUUFRhNFluMHh6Q3pWTFRveDFBQm9LemFFeFJDbWJBRWpEUUZH?=
 =?utf-8?B?dVNLR05TcDhVVjFxUFJIeDFFT29ZSVFvOUgxU05pRXlZZVRtb1dyV2srZFdY?=
 =?utf-8?B?NVRVa2Z4T3gyWENEckpwU0pLOVAxOFd6U0V6cHFVYUpLZHFQREJleDRBSjJ0?=
 =?utf-8?B?TW5sNUxOVG8rM1NqVy9BVi9ueDRBMHJBVnZhRWlvb3creC9PODFXdXJkNGFp?=
 =?utf-8?B?N0ppV1dpcXZSN0RVend2Y1U1SEpYRXdGSXllTVI4OW9GOFpuQ0VNVjc0bnZF?=
 =?utf-8?B?UFlSTjl5UFpMMjUyOVI4ZW9GNzJaWDh3SEdMNXZRaE13S0IwdjhNemdxT2NT?=
 =?utf-8?B?WjNWU043amdHcUNTSzducFlLc1duOWtpNnUwckQ4RmUzcTR5U29VWDJXeHVU?=
 =?utf-8?B?eGZNVlFSZVExM0ZxT1FHVjc3K2MySVJSZmpyWURGMFdkOVB3dGRuY0ltOHBH?=
 =?utf-8?B?NGx4WUpZMUczbzNZRHBLU1hDckhFQzB1UkxlRko5cFVCcUltZllpQnZPZDlD?=
 =?utf-8?B?VGV4c0RwMTRTUG50UUNmdFRmcnl1TkhOQVFuMmtXN25Qc2EwZmdlcWN0MmNY?=
 =?utf-8?B?QWtQcDBjbHlMNWdHZTNLVkd4ZGFGS1lQQ3BLVDBmRGtYcUdoMStDOVlKZC8x?=
 =?utf-8?B?VURkb1hVNFRlamhNZDdnUkFKdUh1U0w5R0tsL0FLTUhGMlBudVU3WjJkeWI3?=
 =?utf-8?B?QzFzaTZwNHAwOHkxZnBnVDIvRzVwK3oySzdNNWxYNDNIck5vVFBBV1JORHFW?=
 =?utf-8?B?YU5jK095RzJkZUY4MUdNZWR5WlVwMFoxU0p0Mndtb01MM2JwYTdnNU9ZYmZP?=
 =?utf-8?B?bHI3cHZNMXhVTjB3WkdMb1FyYk9ORnE3TjliTlFqbUJrS3dTQTRmcXNSTS9I?=
 =?utf-8?B?Y0w3VWVWWEtvNEhkRUU0N2xoUy9YMU91TDl0Z2lmdlVXWkYzaHBwY0tsaHVZ?=
 =?utf-8?B?cDdRVW5tY01ZMWUzeS91WG1iWnRvNVZSMlArc1BwU0wzTEprdmNuTDJoaml5?=
 =?utf-8?B?TGwvQ0hGWUc1S1hBZjlNd2xQeGZuMzNHS1l4enNRRC92N2ZMY21GYnBCM0lO?=
 =?utf-8?B?VG1PTlZ1QjY2QktKMHZPWEM0Q3M4K01HUllHM293SzJWU3BSQlFWV3FOSlRJ?=
 =?utf-8?B?RUhWS09hVTVtVGRRUk54QmIxclBwV2R3UW1wa2F4dEUrV0h1bUpDQXNkYnZ3?=
 =?utf-8?B?TU5McG4yMGZRNmNOQmlqVVU1OU91Y1FiY3BGb0FZOVFXdnRKV0JVbVNvSUxx?=
 =?utf-8?B?TFlSc21GdnpiUFZyWWxEOHBZSk55QXlJNHN4YmFMNzVEMmdrZ29IajZWbzN4?=
 =?utf-8?B?VStyUmZnQ3Z0dSs3ZkRPd1Y2eDJqQ3N6N2dzY2xaaWY0V0dCcnhNd3h6WVIx?=
 =?utf-8?B?cU42bWl5Y1ZZTG9MOXFHd3lvZzZoODNoNWQ3WExHaUpVVUU1OGV6Wk9Jck5K?=
 =?utf-8?B?VXJock1jNW1hY1grNFYzVWcwQXhJSnBHTjFQQi9vSTRYVUpCZk50UytiTDBN?=
 =?utf-8?B?VWREdjkzeXNhTG9ZbEhUZS9XUXZ6cWRQbVdmRjBpK0xhZDV1STlERk9ha3Nr?=
 =?utf-8?B?d2JxYzBKZFRqaFFqNkpWVnIxNzZibC9RYVhiVzA4dUlOMGtKMlJrTDB3b1N5?=
 =?utf-8?Q?nCU+UK209fHGAdxr6G7OCkJD/8u70he6+NQfPpBZ8jCkG?=
X-MS-Exchange-AntiSpam-MessageData-1: aUhTT47ILRmIxQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bcf47e-4149-4785-c597-08da13f07a51
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 15:01:19.5510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cUXTi7iPaohCwzGfLCvT5cczAmsktUv9ypGO1zXQmGk+zKHHyl3GHwmsX03Dy+L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3700
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



Am 29.03.22 um 17:43 schrieb Daniel Vetter:
> On Mon, Mar 21, 2022 at 02:58:50PM +0100, Christian König wrote:
> [SNIP]
>>   /**
>> - * dma_resv_add_shared_fence - Add a fence to a shared slot
>> + * dma_resv_add_fence - Add a fence to the dma_resv obj
>>    * @obj: the reservation object
>> - * @fence: the shared fence to add
>> + * @fence: the fence to add
>> + * @usage: how the fence is used, see enum dma_resv_usage
>>    *
>> - * Add a fence to a shared slot, @obj must be locked with dma_resv_lock(), and
>> + * Add a fence to a slot, @obj must be locked with dma_resv_lock(), and
>>    * dma_resv_reserve_fences() has been called.
>>    *
>>    * See also &dma_resv.fence for a discussion of the semantics.
>>    */
>> -void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>> +void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
>> +			enum dma_resv_usage usage)
>>   {
>>   	struct dma_resv_list *fobj;
>>   	struct dma_fence *old;
>> @@ -274,44 +308,45 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
>>   
>>   	dma_resv_assert_held(obj);
>>   
>> -	/* Drivers should not add containers here, instead add each fence
>> -	 * individually.
>> +	/* TODO: Drivers should not add containers here, instead add each fence
>> +	 * individually. Disabled for now until we cleaned up amdgpu/ttm.
>>   	 */
>> -	WARN_ON(dma_fence_is_container(fence));
>> +	/* WARN_ON(dma_fence_is_container(fence)); */
> Uh this looks like it's a misplaced hack?

Unfortunately not.

> If you do need it and cant get rid of it with patch reordering, then I
> think it needs to be split out for extra attention.

The problem is that I would need to squash removing the amdgpu 
workaround into this patch as well.

And I don't really want to make this patch more complicated that it 
already is.

>> diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
>> index 9435a3ca71c8..38caa7f78871 100644
>> --- a/drivers/gpu/drm/lima/lima_gem.c
>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>> @@ -366,7 +366,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
>>   		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
>>   			dma_resv_add_excl_fence(lima_bo_resv(bos[i]), fence);
> Not very compile-tested it seems.

At least it used to compile fine once, but obviously need to give it 
another go.

> I think it'd be good to split this further:
>
> - Add dma_resv_add_fence, which just adds either an exclusive or shared
>    fences.
> - Convert drivers, cc driver authors (this patch doesn't seem to have
>    them).
>
> I think the above two could also be a single patch, but should work even
> more split.

That is easier said than done. I will see what I can do.

The other documentation comments you had should be fixed in the next 
round, but you might want to take another full look at this.

Thanks,
Christian.

