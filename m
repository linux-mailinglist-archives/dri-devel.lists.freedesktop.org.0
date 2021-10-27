Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2601743CC30
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 16:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A789897E9;
	Wed, 27 Oct 2021 14:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0268897E9;
 Wed, 27 Oct 2021 14:27:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScDoP7LwOwsCqfPbdkPIXTDyXhbXL7nF7NQI9EC+HCQ96S/n2EmxX7PrpENzggCRHf60w19vgaG5DRq7jKpi7BA1yCAvOQdLM8BQYF7+hhdBxy0zWdqBz5x6Kewzu4azt0CZECMCGnN1W4BsDEcJq/ikIQXPjBhaAJ9ugJ+EBXd4Ss5O/1XsXspQ4+lqOGGmLnuZ9Wh7RMAyuSBuHCRr/HwjBQlMqq9H1KjYhF/N06RS++5vlw6PPn9RCx8gafOK+MDdHk2pC0cC6zboMtO0Npv+A5xBwfx/xhrFhvI8if8ZHT16tNyrdsORIXcCR4cx9lXK9/+xeus0rgH9mxw9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ECtfD3IW1/KYkCt3STnrA/b0rpkOvxLF6FD06wFowo=;
 b=ctaFvar5EbZk3nztIixncrR+LoPGeqgdJReY+4qBNEO9gbboP2rONm1ggbe7ZlkfmEkVbcyIYCVqnZYA4/YKaTAsvm0Ipnb7OgEgVZkPjkcDKqWu+y+JeO6TzK3cU3G03OyY1iNv/KIRsVo1LUFc5p8VVGNFj9MNxIbKlpdvqCIJd22H/knYTW2MsotZFfNBDFjvi7Me10Rdz/ngfopzON3PdUcrOEVkJkD7lRN8wioB92o0C/oCgUMONaU2RIlmyX0lkiDXm7ZTnO/DPfGyxwPK6iPbTpi/5g6WJkXoPy36+HBGhItLO4VFH/LMexUSZpyyhK+ZaBa8uC8Z5Olgpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ECtfD3IW1/KYkCt3STnrA/b0rpkOvxLF6FD06wFowo=;
 b=X1OCYZkUtjcUDMswa/ypDnEbEVV5ne5oC5vHbSgNVEAXPrmkMs7deiLv0UONaG3M2Rl46RsEHXGSLyTUaUxOOF4n5l2ixZGu9qCJ2qqSmbXbLVn4sE8JdSOlnLVrnVTE6N6hcFl78x+jJvTE6veIdUX2feuPqoOl98UmeoFj7Zw=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1943.namprd12.prod.outlook.com (2603:10b6:903:11b::7)
 by CY4PR12MB1813.namprd12.prod.outlook.com (2603:10b6:903:124::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 14:27:41 +0000
Received: from CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::28c0:a6b8:eb2f:5a79]) by CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::28c0:a6b8:eb2f:5a79%9]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 14:27:40 +0000
Subject: Re: Lockdep spalt on killing a processes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
 <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
 <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
 <cbeac930-84c3-7a62-0b3d-4cef3074139d@gmail.com>
 <da1ed5da-59ad-d12a-906c-c84b7462d8c4@amd.com>
 <bb70e916-e71b-9968-78d9-d7de8fef9e91@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <5c70c6a9-8867-506a-1e7b-32f85589a070@amd.com>
Date: Wed, 27 Oct 2021 10:27:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bb70e916-e71b-9968-78d9-d7de8fef9e91@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::6) To CY4PR12MB1943.namprd12.prod.outlook.com
 (2603:10b6:903:11b::7)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:9448:e1a0:ef19:2ba6]
 (2607:fea8:3edf:49b0:9448:e1a0:ef19:2ba6) by
 YT3PR01CA0116.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 27 Oct 2021 14:27:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 648d3feb-8398-4cc1-0c66-08d99955ee71
X-MS-TrafficTypeDiagnostic: CY4PR12MB1813:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1813D4669EEB71417DE696D1EA859@CY4PR12MB1813.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iwa83uN2oIDZqGK8hdmaHWQxAROx/0J+tNazCfbaq/8wE1CVrfg3vB7SOOF9HKxaAk52KVdYUZmUSfwMYhpPAMTqJh/twqmBlewb6PgsUPCu2PmORtVxx4lja1WyqrwyhLjPiDBhLSIQVWsFl2MX/Hqpj39EeJtvxlTwn0LMuooZrthwVkS67pkABEqAEjOrye/A+yj00bRC2C5A+nr3X9Y7tHkBLkb6otDDR6O23NZoof0AcRhxG9Rb7Babf3+pAWzl2bbkEU0f2hJGpbsPQ9n3JzGPAOgC5kvtlChfmozOQt/HNHUZPeCI9/GP2s+K//FQXiXwmulGiMPyp5aF/IvvsrPwu/PVU6JyAYQFEAhe3nK6RC5haSa3j4qzCWYJvjTZfXVuqZUUKFsJZnRzwUyrDmubo8L2rRt3ttvoKIVRdima64VG6oad2/pW69doV+qJDZ6MPe84JsMhHjmrrPLdXjpTguMWKcYJwIRSEULmMIRsI1iKeJSm2aUaEjhdue4ILVzQ8AXLcQkUfdWB048lp+CotOmRhWvIKkUPbnMiKTh7OmzP7Xkynvfd0KPgO7DHG7drHkP/kKNSOdN35KZ81im+2+/+8LLlBAHzYRmBboxQKrZjF8w88lQLPeuS65AlBS3jq475rPfx3PgnDAI9mDU0a4YQH4EkUMCcqKIr26VC5NnhNYtK4AI0W/V0gdNph3yLT0mJxxAcmfkJ+l+p06QKAhxVTtMOfx3F/OPLv43y4KVmhrxoi+XMm10cPdDr6LYlnxvLdP+e1YXLfrPUVCt/8b42SmdXLlnLgsookoaeiiiKLftANIhwX4SO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66574015)(53546011)(316002)(186003)(66476007)(31686004)(4001150100001)(36756003)(86362001)(66556008)(45080400002)(30864003)(31696002)(2616005)(966005)(2906002)(8936002)(8676002)(6486002)(66946007)(38100700002)(110136005)(44832011)(508600001)(83380400001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXdLd1RrWksxMFFRZ2JrS1dYakY2VGNpdVJ3bjRvZ2VyN2tFQTZ0cGY4bVRV?=
 =?utf-8?B?NnZDYmFCTkgxRVQ5RWszUS93Uit2ZWJRL3gxbmlSak9maWVHbVUyMk8vQWk1?=
 =?utf-8?B?ZUpjVUpYSlRITEZRM1VrdE9lMjJyc1FLRXNrS0EwNG5ZVjNlczIvWlVROGxK?=
 =?utf-8?B?UHNxblh2M2JUWmc1YVErM29ENFgvM05Zd09oQ1E3Q1h5djJzN3BzZjhkSHhO?=
 =?utf-8?B?bnN0UzR3WHg4dXEvWXJlL0krVzU1bjNlZFFpVFp1K28xdUNQNFpZMlZ6YU9R?=
 =?utf-8?B?REdmaGZBWCsrZlJaQnYrU0kwdnd2dXdGMm1zcVJ1VmFoM2w1eHRONFMreEhi?=
 =?utf-8?B?Sm9FajVTL0FyOUJsWXhKdE1IV0JpbGRPNVhyc0ViUWFNeUxub3VoMTR6bExQ?=
 =?utf-8?B?SVFNREhMa2lQZmpCVFIwK0cwb29HQ1BuT1c0ZWFYb3FrbkdhQlVySXNLMk1q?=
 =?utf-8?B?ZkpqTGdIcDlBZjRBUWxEVnJUbDJGSzRuMEk5ZEFYUFUzMlM1NGZ6QkZ1d2RL?=
 =?utf-8?B?RjNXQXA3aTd2dTlsMzh2R1FkVWovRmJHeCt3R2xiS1FRZ0hpUDhadW9pTEZT?=
 =?utf-8?B?RGFDSkNoZEgvc243SDl3cnIvaXFFNFhBVU9IcExPaytKTy9uM3BIRnc3YXpW?=
 =?utf-8?B?c1pPd2lna21DTXMyUFlSbVoyZERHS0ZlUFEvR0FlS3lKZ25BdHU4c056TUFZ?=
 =?utf-8?B?YzNvbWFtei9Bcm1zR2Q2ZGlGR0ZsY3laUWRsR0RyVi8rbXRZWU1SU0FSZEpR?=
 =?utf-8?B?Z3ZMTG9iR0g5Mks0eWxKVE5ZazJHaVNrQkIyTG9jbGxiNzlQZ2FCMXZodHRV?=
 =?utf-8?B?bUlXbTdJYlZVSjRUQTQ4d2RuVFl6QllIREtJcGJ3K1lkUVo4bmhBSUZ6MWlY?=
 =?utf-8?B?UDV2MHFydHYrNVh5VzJKWUUvVmVOSHEzUlNzMStzZUlYMTREVWpPQVkvN3lZ?=
 =?utf-8?B?bXBwbjNEenE0SkRzZDhhdGJtVDhTVDg3d2ZkQ3hCa2l5U2xKZ0xybVUwL1Zt?=
 =?utf-8?B?TmpaaXJUYUsvWFdGRWpocThOQ3JiQkNteEpZU0dJMWtuZjdGU2Y4ZE1jMkZn?=
 =?utf-8?B?dlpYMlFlQUpybVJvRVZDSXZwRkxHOWVtd2V1Q3pSdDlhL05xVHpxL2dNeEpj?=
 =?utf-8?B?cFhlcndiV015bzZPbXJaeEM4ZG0vQ2x3MmgxNVZFQmZTRGNaUXJsNTZXYVhI?=
 =?utf-8?B?ditadUdoeXR6UlExeUhKeTBIcytQd2MvaGFOT3d0MkdBWDhVaXU1RjNsQnVW?=
 =?utf-8?B?Z1FpOVE5U3pwSzR5L0ladFhFU1ZqckgvSkNxRzVUOXZhei9nalI3RFVwTFJr?=
 =?utf-8?B?YlAxODBzL0RIc25PcVg4Z0RHWmNCQ3NSa242OFJMM0NLb3kyMjczQ1pTbXBR?=
 =?utf-8?B?TTRhUTFzTFhqbVJSVlNaWU9FWXhBK05MWUoxdUUrZFFlM2p4L1BjeVo2SXdw?=
 =?utf-8?B?ZWFYaW5RVVFsQTRqQmt0LzdxRUh3aVFFUDBQRnNwVlBGWGZBem1uT0lLa3ZM?=
 =?utf-8?B?SUJOODdaT05DbTZLNzM4Nms0NVZLMnZUUnhRVkZ0VzdqQkcwZUNQWDlpTFdp?=
 =?utf-8?B?RSt3WEx1Q0U3WC9nRzRDZjFrZWpWdTNkbGRPb2xhdG5kKzdnQ3AwM1djUUo1?=
 =?utf-8?B?cWRPRU02cHNsdWd3dzFnZTd1TDhmNEI2eE4rS0ZuWm9ZT1dpMkU0aWJEOEE3?=
 =?utf-8?B?aUladTA4TUlmcGppUFNkYk5hRk43Z05rdVZ4U2dyd2dMdDBoYlA1RzhYTTBQ?=
 =?utf-8?B?bnJPS0pkbTBUZk8zRmRFZjFFQTd3V1JpaXNGUEZJalJWZ3ZIczd6dzB4ZlFl?=
 =?utf-8?B?UWorZzhMckhuK3RNajVpNk81cGczQzF5UFBRQ3RsNHFoRjJURGIvY2FSaE04?=
 =?utf-8?B?QmRvdHpBSTV2Q2xJM1ZpQzBIeFl1dWZxSDNzclRsRTA5emdnSHpkU2hkLzB4?=
 =?utf-8?B?b0RjZkNnS3dESHlOM3EzdmRxdnlQaStRenV6Mm56VnV6MDdqaFVLWFBRSnZE?=
 =?utf-8?B?NEE0eS9mUVBxbktFVEdhekdOQnJMaFJKWkdjZWp4MSs0WVF6ZUROZ3RqSzV0?=
 =?utf-8?B?ZVJYdDV6UWFoNktQUGVQMHphYXRRZmhrbnVvb2hZWW9BSk10ZGxobi9RaVpk?=
 =?utf-8?B?cnNZQmtLWGQyd29CR0VGZlJrWlMwNHkyWngrUnQ4b0Vvak05N21kZVpiRW5y?=
 =?utf-8?B?T3g1MDRhY0VnNXgrMy9TSWF4S2YxTW5HUFQyZGlUZzVxM3NWbVRuamV0RGVE?=
 =?utf-8?Q?rQZi2B6OpgGng6fEHwaWE8KN7FXvu+EJPfpHuJYG2c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648d3feb-8398-4cc1-0c66-08d99955ee71
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 14:27:40.3061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpZTz+Sz1JWctIUFmS/Dc4FqwQFm7SBQhbkqLDcQ6KTznRM3hMLlelpyskR3i5IyCIPc2mFwpmk3FufrED5JYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1813
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


On 2021-10-26 6:54 a.m., Christian König wrote:
> Am 26.10.21 um 04:33 schrieb Andrey Grodzovsky:
>> On 2021-10-25 3:56 p.m., Christian König wrote:
>>
>>> In general I'm all there to get this fixed, but there is one major 
>>> problem: Drivers don't expect the lock to be dropped.
>>
>>
>> I am probably missing something but in my approach we only modify the 
>> code for those clients that call dma_fence_signal,
>> not dma_fence_signal_locked. In those cases the drivers are agnostic 
>> to lock behavior (or should be at least) since the lock
>> is acquired within the dma fence code. Note that if you are worried 
>> about calling the callback without lock then same exact
>> concern is relevant to using the irq_work directly in the fence code 
>> since the irq_work will execute at a later time without locked
>> fence->lock (which is the point of using irq_work).
>
> Yeah, I've seen that it just doesn't make much sense to me.


Not clear what doesn't make sense ?


>
>>>
>>> What we could do is to change all drivers so they call always call 
>>> the dma_fence_signal functions and drop the _locked variants. This 
>>> way we could move calling the callback out of the spinlock.
>>>
>>> But that requires audit of all drivers, so quite a lot of work to do.
>>
>>
>> As i said earlier - if we only modify dma_fence_signal and don't 
>> touch dma_fence_signal_locked then our only concern should the users 
>> of dma_fence_signal.
>
> Yes, but what do you do with the drivers who call the _locked variant?


IMHO we don't touch them at all, they stay as is, we only re-implement  
dma_fence_signal  because drivers that use the locked variant take the 
lock explicitly and so they intend for their callbacks to run
under the lock and if they don't , it's their own problem within their 
code and they should fix it locally there. Driver that call 
dma_fence_signal are our only problem because they didn't take the lock
explicitly but were forced to run the callback under lock by the 
dma-fence framework and that something we can change.


>
>> Let me please know if I am still missing some point of yours.
>
> Well, I mean we need to be able to handle this for all drivers.


For sure, but as i said above in my opinion we need to change only for 
those drivers that don't use the _locked version.

Andrey


>
> Regards,
> Christian.
>
>>
>> Andrey
>>
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>> Am 25.10.21 um 21:10 schrieb Andrey Grodzovsky:
>>>> Adding back Daniel (somehow he got off the addresses list) and 
>>>> Chris who worked a lot in this area.
>>>>
>>>> On 2021-10-21 2:34 a.m., Christian König wrote:
>>>>>
>>>>>
>>>>> Am 20.10.21 um 21:32 schrieb Andrey Grodzovsky:
>>>>>> On 2021-10-04 4:14 a.m., Christian König wrote:
>>>>>>
>>>>>>> The problem is a bit different.
>>>>>>>
>>>>>>> The callback is on the dependent fence, while we need to signal 
>>>>>>> the scheduler fence.
>>>>>>>
>>>>>>> Daniel is right that this needs an irq_work struct to handle 
>>>>>>> this properly.
>>>>>>>
>>>>>>> Christian.
>>>>>>
>>>>>>
>>>>>> So we had some discussions with Christian regarding irq_work and 
>>>>>> agreed I should look into doing it but stepping back for a sec -
>>>>>>
>>>>>> Why we insist on calling the dma_fence_cb  with fence->lock 
>>>>>> locked ? Is it because of dma_fence_add_callback ?
>>>>>> Because we first test for DMA_FENCE_FLAG_SIGNALED_BIT and only 
>>>>>> after that lock the fence->lock ? If so, can't we
>>>>>> move DMA_FENCE_FLAG_SIGNALED_BIT  check inside the locked section 
>>>>>> ? Because if in theory
>>>>>> we could call the cb with unlocked fence->lock (i.e. this kind of 
>>>>>> iteration 
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.15-rc6%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fttm%2Fttm_resource.c%23L117&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cc8a4525f94c244bebbd208d997f19242%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637707886075917091%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=YBq%2BNkDuYKERc8XJDWTfeM%2FSknpuCBHQYgN8Uo5PFv0%3D&amp;reserved=0)
>>>>>> we wouldn't have the lockdep splat. And in general, is it really
>>>>>> the correct approach to call a third party code from a call back 
>>>>>> with locked spinlock ? We don't know what the cb does inside
>>>>>> and I don't see any explicit restrictions in documentation of 
>>>>>> dma_fence_func_t what can and cannot be done there.
>>>>>
>>>>> Yeah, that's exactly what I meant with using the irq_work directly 
>>>>> in the fence code.
>>>>
>>>>
>>>> My idea is not to use irq work at all but instead to implement 
>>>> unlocked dma_fence cb execution using iteration
>>>> which drops the spinlock each time next cb is executed and 
>>>> acquiring it again after (until cb_list is empy).
>>>>
>>>>
>>>>>
>>>>>
>>>>> The problem is dma_fence_signal_locked() which is used by quite a 
>>>>> number of drivers to signal the fence while holding the lock.
>>>>
>>>>
>>>> For this I think we should not reuse dma_fence_signal_locked inside 
>>>> dma_fence_signal and instead implement it using the
>>>> unlocked iteration I mentioned above. I looked a bit in the code 
>>>> and the history and I see that until some time ago
>>>> (this commit by Chris 0fc89b6802ba1fcc561b0c906e0cefd384e3b2e5), 
>>>> indeed dma_fence_signal was doing it's own, locked iteration
>>>> and wasn't reusing dma_fence_signal_locked. This way whoever relies 
>>>> on the dma_fence_signal_locked won't be impacted
>>>> an who is not (like us in 
>>>> drm_sched_fence_scheduled/drm_sched_fence_finished) should also not 
>>>> be impacted by more narrow
>>>> scope of the lock. I also looked at dma_fence_default_wait and how 
>>>> it locks the fence->lock and check if fence is signaled
>>>> before wait start and I don't see a problem there either.
>>>>
>>>> I attached quick draft of this proposal to clarify.
>>>>
>>>> Andrey
>>>>
>>>>
>>>>>
>>>>> Otherwise we could indeed simplify the fence handling a lot.
>>>>>
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> Am 01.10.21 um 17:10 schrieb Andrey Grodzovsky:
>>>>>>>> From what I see here you supposed to have actual deadlock and 
>>>>>>>> not only warning, sched_fence->finished is  first signaled from 
>>>>>>>> within
>>>>>>>> hw fence done callback (drm_sched_job_done_cb) but then again 
>>>>>>>> from within it's own callback (drm_sched_entity_kill_jobs_cb) 
>>>>>>>> and so
>>>>>>>> looks like same fence  object is recursively signaled twice. 
>>>>>>>> This leads to attempt to lock fence->lock second time while 
>>>>>>>> it's already
>>>>>>>> locked. I don't see a need to call drm_sched_fence_finished 
>>>>>>>> from within drm_sched_entity_kill_jobs_cb as this callback 
>>>>>>>> already registered
>>>>>>>> on sched_fence->finished fence (entity->last_scheduled == 
>>>>>>>> s_fence->finished) and hence the signaling already took place.
>>>>>>>>
>>>>>>>> Andrey
>>>>>>>>
>>>>>>>> On 2021-10-01 6:50 a.m., Christian König wrote:
>>>>>>>>> Hey, Andrey.
>>>>>>>>>
>>>>>>>>> while investigating some memory management problems I've got 
>>>>>>>>> the logdep splat below.
>>>>>>>>>
>>>>>>>>> Looks like something is wrong with 
>>>>>>>>> drm_sched_entity_kill_jobs_cb(), can you investigate?
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>> [11176.741052] ============================================
>>>>>>>>> [11176.741056] WARNING: possible recursive locking detected
>>>>>>>>> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
>>>>>>>>> [11176.741066] --------------------------------------------
>>>>>>>>> [11176.741070] swapper/12/0 is trying to acquire lock:
>>>>>>>>> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, 
>>>>>>>>> at: dma_fence_signal+0x28/0x80
>>>>>>>>> [11176.741088]
>>>>>>>>>                but task is already holding lock:
>>>>>>>>> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, 
>>>>>>>>> at: dma_fence_signal+0x28/0x80
>>>>>>>>> [11176.741100]
>>>>>>>>>                other info that might help us debug this:
>>>>>>>>> [11176.741104]  Possible unsafe locking scenario:
>>>>>>>>>
>>>>>>>>> [11176.741108]        CPU0
>>>>>>>>> [11176.741110]        ----
>>>>>>>>> [11176.741113]   lock(&fence->lock);
>>>>>>>>> [11176.741118]   lock(&fence->lock);
>>>>>>>>> [11176.741122]
>>>>>>>>>                 *** DEADLOCK ***
>>>>>>>>>
>>>>>>>>> [11176.741125]  May be due to missing lock nesting notation
>>>>>>>>>
>>>>>>>>> [11176.741128] 2 locks held by swapper/12/0:
>>>>>>>>> [11176.741133]  #0: ffff9c339c30f768 
>>>>>>>>> (&ring->fence_drv.lock){-.-.}-{3:3}, at: 
>>>>>>>>> dma_fence_signal+0x28/0x80
>>>>>>>>> [11176.741142]  #1: ffff9c337ed172a8 
>>>>>>>>> (&fence->lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
>>>>>>>>> [11176.741151]
>>>>>>>>>                stack backtrace:
>>>>>>>>> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
>>>>>>>>> 5.15.0-rc1-00031-g9d546d600800 #171
>>>>>>>>> [11176.741160] Hardware name: System manufacturer System 
>>>>>>>>> Product Name/PRIME X399-A, BIOS 0808 10/12/2018
>>>>>>>>> [11176.741165] Call Trace:
>>>>>>>>> [11176.741169]  <IRQ>
>>>>>>>>> [11176.741173]  dump_stack_lvl+0x5b/0x74
>>>>>>>>> [11176.741181]  dump_stack+0x10/0x12
>>>>>>>>> [11176.741186]  __lock_acquire.cold+0x208/0x2df
>>>>>>>>> [11176.741197]  lock_acquire+0xc6/0x2d0
>>>>>>>>> [11176.741204]  ? dma_fence_signal+0x28/0x80
>>>>>>>>> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
>>>>>>>>> [11176.741219]  ? dma_fence_signal+0x28/0x80
>>>>>>>>> [11176.741225]  dma_fence_signal+0x28/0x80
>>>>>>>>> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>>>>>> [11176.741240] drm_sched_entity_kill_jobs_cb+0x1c/0x50 
>>>>>>>>> [gpu_sched]
>>>>>>>>> [11176.741248] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>>>>>> [11176.741254]  dma_fence_signal+0x3b/0x80
>>>>>>>>> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>>>>>> [11176.741268] drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
>>>>>>>>> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>>>>>>>>> [11176.741284] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>>>>>> [11176.741290]  dma_fence_signal+0x3b/0x80
>>>>>>>>> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
>>>>>>>>> [11176.741504] sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
>>>>>>>>> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
>>>>>>>>> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
>>>>>>>>> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
>>>>>>>>> [11176.742393] __handle_irq_event_percpu+0x4f/0x2c0
>>>>>>>>> [11176.742402]  handle_irq_event_percpu+0x33/0x80
>>>>>>>>> [11176.742408]  handle_irq_event+0x39/0x60
>>>>>>>>> [11176.742414]  handle_edge_irq+0x93/0x1d0
>>>>>>>>> [11176.742419]  __common_interrupt+0x50/0xe0
>>>>>>>>> [11176.742426]  common_interrupt+0x80/0x90
>>>>>>>>> [11176.742431]  </IRQ>
>>>>>>>>> [11176.742436]  asm_common_interrupt+0x1e/0x40
>>>>>>>>> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
>>>>>>>>> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 
>>>>>>>>> ff e8 37 5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff 
>>>>>>>>> fb 66 0f 1f 44 00 00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 
>>>>>>>>> 2b 75 c8 48 8d 14 40 48 8d
>>>>>>>>> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
>>>>>>>>> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 
>>>>>>>>> RCX: 0000000000000000
>>>>>>>>> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 
>>>>>>>>> RDI: ffffffff9efeed78
>>>>>>>>> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 
>>>>>>>>> R09: 0000000000000001
>>>>>>>>> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 
>>>>>>>>> R12: ffff9c3350b0e800
>>>>>>>>> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 
>>>>>>>>> R15: 0000000000000002
>>>>>>>>> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
>>>>>>>>> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
>>>>>>>>> [11176.742495]  cpuidle_enter+0x2e/0x40
>>>>>>>>> [11176.742500]  call_cpuidle+0x23/0x40
>>>>>>>>> [11176.742506]  do_idle+0x201/0x280
>>>>>>>>> [11176.742512]  cpu_startup_entry+0x20/0x30
>>>>>>>>> [11176.742517]  start_secondary+0x11f/0x160
>>>>>>>>> [11176.742523] secondary_startup_64_no_verify+0xb0/0xbb
>>>>>>>>>
>>>>>>>
>>>>>
>>>
>
