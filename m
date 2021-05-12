Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB1F37BDA6
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 15:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4676EBA2;
	Wed, 12 May 2021 13:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623B56EBA1;
 Wed, 12 May 2021 13:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOdqhS1GEgF5xO8gkrqHGkjF7DViLE8janJj8TS+HPC7C2FUS2uVEv8y/o6oaFG6RrNi6VbOMRSbYBuQjecp2ew4fzCj6fhDGBKSyTEFL/n+HkwiKMzKDffLCXZMJGhV1LCKUSwbjf4rq1ngxxqIdELRcn2knkneSNoOejfnHNMTUs/sw+aLi/7gMGYsuUod2d199cyXzxtLilbOglyVyIB7MWZ6w/p5TOftf4PWz49dtLhIva9yYwD9EFKqlN3pL1xX+ix1wfGYb0yw0qNiHu7F9CUef+AQXtDkSiqIqHBTJBDizjTqhk4izIVCYNU+1cEF88jnzYh9ZriPvhdIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByQWh+GjocigGKzwwZeSPLfJhQVf65RuUUv1czf0OAc=;
 b=n67qBaTvnfo59U+nB10DjOnYYtAB1l1HbwwhOA7XWhq8jNV/kSZ/8DkmTOZ9NotM7OSJpzDrjpUnGK0s759WLD6k72RXeVVy14kQB9wU7fvn9verY0leWFEtwQXA7ElLrIh+ifVB06ne1QY8b7WZtdHMsg0lwO+RPbhBL9P+q+2HGamdqANwdxcO5ghhye2Lu4SBWKZGRpmp3Rl+CwegOHvZJAkUeUnFe55XUYwvHyNMwmll21OFi6023SD359Ut25VtZSVZTc3VA1FLaVoI5TRsfNQ6JBsj4yNgi478TFHOVvb+p7QoHZS/2xiN/Un6q7xAzH8FeKtnlOLbJLyFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByQWh+GjocigGKzwwZeSPLfJhQVf65RuUUv1czf0OAc=;
 b=YMrzEAQF/8ELwzSbbB981sQSl52waiOwuXlrLNfk3cqdgyvqtlZnioXIShxKZiWrDPufFzprVQerW5ghkjWVoAf5AsADNQ1vZpeTMlF/zqD6H3uvF+ZqrEhWH6GjhUmQykQMnqM4kq31Sch6EBMpocvcHg0m53Bd928PWjvpHJ8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4753.namprd12.prod.outlook.com (2603:10b6:208:89::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Wed, 12 May
 2021 13:05:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 13:05:22 +0000
Subject: Re: [PATCH 6/7] drm/i915/ttm, drm/ttm: Introduce a TTM i915 gem
 object backend
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210511132525.377190-1-thomas.hellstrom@linux.intel.com>
 <20210511132525.377190-7-thomas.hellstrom@linux.intel.com>
 <8ac6bc5c-17c0-2ffd-7f8c-823ab3c8a858@amd.com>
 <88ea8e22-3314-60a4-8f4b-0b37de444b1d@shipmail.org>
 <8551810c-a095-3906-d982-7bc409140c48@amd.com>
 <0b7f32d8-bfb9-84dd-fea7-556dddded1cc@linux.intel.com>
 <a0277869-7244-aee0-3359-21dac8f5a724@amd.com>
 <e85e9bd7a28c8570c6429683d6d68ee0855afacb.camel@linux.intel.com>
 <d0f0c55d-1784-922b-e9bd-0248cd7fb6af@amd.com>
 <6e317ee2b22546a2333d3098f5cda1a59da62a1a.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d40ac511-3de3-12f0-4f0c-38b730e62b81@amd.com>
Date: Wed, 12 May 2021 15:05:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <6e317ee2b22546a2333d3098f5cda1a59da62a1a.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c533:38e4:26b8:d73]
X-ClientProxiedBy: AM0PR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c533:38e4:26b8:d73]
 (2a02:908:1252:fb60:c533:38e4:26b8:d73) by
 AM0PR01CA0111.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 12 May 2021 13:05:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6298280-f911-4be1-0633-08d9154699c4
X-MS-TrafficTypeDiagnostic: BL0PR12MB4753:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4753B349DA98F86EFD1ECB9083529@BL0PR12MB4753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fods+Nvy9mgb+26PNLhXfzexXpQL1ncqN42Dj2JniiqQgkQhMroicNmkjkBdL95rYdSwDpG+ok5Zbx149oxy67ulfspX7d7V7N8q80CD54VNajQOFDnomz1Qca30qE5VX6zNHpij5q+EjMx+WfcC8G1L0JAVxQt7tEkYH4Rgy9cHhs92UaSLbFsLSh4hmWoU392CfzR4QRPa4zG6LadfQmduRiEKEKR63gFgZDW7Rm/S2TYzykAZPhNLancgj1fFDzRAlSxcSYnlqvuqXAf50L8ugFbCrhkV1hWViNOGwUmcAAE60QYVOWJQ/qgwtUzmVrqmHyfu7sE/NMO978ob5u6ZJD5q3z8F4cnH5vYxkzuF41z4M7spV8PGXsOp8dYplFZe2wlQQnKICoiyWgLB1RZVyZTwQDzc1JnE31eitT3Cxl6JoZ3Ud6RIAzCNjWUIzkmWJbQVeywuvtUZwYl8K0riwK2YLLFm2XXrLiQiYAnOis/lPY8oXgzEUnovgTBNWbUesS7ADd4aaXN7pYvyg+p199KR1b0eje/HC1Ux8t+oJOUa5zA9uWp5Nd1YskI/OJRf99zdiqp2DqH/qcBccx9LIQn7fK4NJuVqS4hi0mIEKyDZLzJc7+XZEQx/OdBv5IWr1eV1/QJyg9kKMrRUWa+tfLOhna6uzzmkrAhyx2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(31696002)(52116002)(38100700002)(5660300002)(36756003)(66556008)(478600001)(2906002)(86362001)(6486002)(66574015)(66476007)(66946007)(31686004)(316002)(110136005)(2616005)(83380400001)(8676002)(16526019)(186003)(8936002)(6666004)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WHV6N1FtQkhPb0NjUjBDQlk4TkwvdGozeDMzZHVraHQrdFMydUpwYlVtU2Nz?=
 =?utf-8?B?M2twaWxCOXJyQ3lHVmRzRWtpcWpSTUVDWWozNXZNOS9CV2twTnZQdU1mb2Nh?=
 =?utf-8?B?b0grOEZGS0ZIaGpKajk5R0FSZ0t5c1hFSkdhZE9xMy93K0VKMit6UVRSZ1cv?=
 =?utf-8?B?SUdkU2YyRm9HNWxKT1NLT1lESXhoaTk4UFkxNGFRTkwvTEN4ZHVPNHc1UWla?=
 =?utf-8?B?bXlFTWVHazRsR3NobjZXNHpERjlZMkV2ekl3V1EwNEk2dDBzMEpZQkpiVWE1?=
 =?utf-8?B?WHJiNWF2YUdqKzJjdnQ5Njc1cEhjWDlvK2pJZld2aThYdHYrNURmRjZBL0tT?=
 =?utf-8?B?Rk9EaEhPSGR3aGR3TGIzeS9LSzRHUDNPeHdTYUtwbXkxZTM5WFlMeFh4L3hH?=
 =?utf-8?B?ZUlHTFZveDVWS1lZK3MvNlcxdkU4b3pIUG5DNGRBSklqeWJUU1hzakZNWlJ4?=
 =?utf-8?B?VWphR2lXSFh1Vm5zZmxpVDB6MVo2ZDRrVVc1SE14d3d4dzFVUkRBcTg5ZHdJ?=
 =?utf-8?B?QzJ4NzQxQngvS1VEYUlOem9rNmhZcVBHZzllaUcyY1pQZXhtamtkdSt1YzFz?=
 =?utf-8?B?dzlWRUR6UkxYaTRvbHNmZHpSVFJWK1crTlk2SVJLMjdqbXJKb0c4YnU3U0NM?=
 =?utf-8?B?Z0VUaTVVSDBZcVNMbmgwMG15NWczOTI3R1RGK0hTSUZSK0xpemxIN09MdFNG?=
 =?utf-8?B?WmgyMUhXVnZjUnZxYWdDbStaTmw2NkRObDIvYTVoZzBrY2p2Yk5ndllSVnh4?=
 =?utf-8?B?a2s4bjlFczhtZ1h4S2k5MEtkVlA0dUY5TlgyencrMXF3M2Z0bExEV3I5K1RQ?=
 =?utf-8?B?WFlXTGhnNytQNHpVTE1QeDBrZC85Z2RXb1hhU2xvdkJwNzZFS3ZKTVc0c3hP?=
 =?utf-8?B?OXE2WDN3aFk2ZTBnVW9pbU9VV3p6NzZiSjFGcDdsWllDeUJmTVpTMDFmQXRT?=
 =?utf-8?B?dnJLQjJtYVlxbXN4TUpPSVhpTjlCYjRIZVpkNVdHNUNLTDFNNjJYbDdSMDN1?=
 =?utf-8?B?K1dOQnpsejA0TThxZGNBUGNYY21DRytkTUl2YVR6YVc0WHpqODBhanB3R2FZ?=
 =?utf-8?B?NThLMkRPbFB4MGVyRzExUXAwTVhFOC9nVlBrTEk2YXJkelJva1JnZytkaTk0?=
 =?utf-8?B?VGNiME1EVTdvdldmTGkvck1mZTNsd040SE9ncGZyeU9PUjN2ZVZRL2FjSzFE?=
 =?utf-8?B?VHRVZDQ3MkhHNEJtMitYTHVLVGxBMGNvZEt6RTdpdTJhMmptRW5iN2tMVnEz?=
 =?utf-8?B?SVRsSW9BNkd1ODEwOXA1TmJCcDZoZzdqT1ZtdDRqVFdleXNCWVZMYnYzTGdK?=
 =?utf-8?B?b2tXY0hlRnUrekVzTzdJNFRNTE9mQ29CT2pPRVZ0Q1ZyQkR4N00vc29ZRTh1?=
 =?utf-8?B?ZjI0bEFXSUNPbklERlRESXFabzVPbzJWcFdwTTh6SW1QTFVDT0ZIRDBjOWw1?=
 =?utf-8?B?UXY2TGNxa2VIRmZ2dm00aGgxeGVoUGE1V0F6KzFQcWRId0dJUGJZS01zYnkz?=
 =?utf-8?B?bUh2OXlaZURrNTIwTngrYzRCb0RqSnQ1T0U3ZzNwbkpkTWFrQWJJanBlQXgv?=
 =?utf-8?B?blRUTlhsS3cxYU9vakszQnFLSk9BelpCQWh1aEcrYlRaQ0JkVHlUQnpHZ2pn?=
 =?utf-8?B?R2Z1UDNYV1BuZ0tvZGs3UEF5TkRaeFBuazVzcGpTbXozcDZpSTcyU25WbDBR?=
 =?utf-8?B?SmdVUmp4Ty9RYlltUGFNMmQ5VTZqcEUvWlVzSHNCMURtTFJqNGd2S1J1a050?=
 =?utf-8?B?NlJlMVpzbmVnL0YzRGxLSUhaRGpGclZGOWNyVWhOY0hlanQzUE1BQ2xldERT?=
 =?utf-8?B?R1BIUjdZSUxveVRJZFBIR2tTc3EzWnNVR2I0RUxERVZnWW1JeUVaMjN5QmV4?=
 =?utf-8?Q?acd7IeK6YDiC8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6298280-f911-4be1-0633-08d9154699c4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 13:05:22.3669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qs2suizLeYQOtnoCdEe/4n6GO/WK0lnbL8vRr2dlkJoBdea3yeOznOziH+eKnWGr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4753
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

Am 12.05.21 um 15:02 schrieb Thomas Hellström:
> On Wed, 2021-05-12 at 09:09 +0200, Christian König wrote:
>> Am 12.05.21 um 09:05 schrieb Thomas Hellström:
>>> On Wed, 2021-05-12 at 08:57 +0200, Christian König wrote:
>>>> Am 11.05.21 um 16:28 schrieb Thomas Hellström:
>>>>> On 5/11/21 4:09 PM, Christian König wrote:
>>>>>> Am 11.05.21 um 16:06 schrieb Thomas Hellström (Intel):
>>>>>>> On 5/11/21 3:58 PM, Christian König wrote:
>>>>>>>> Am 11.05.21 um 15:25 schrieb Thomas Hellström:
>>>>>>>>> Most logical place to introduce TTM buffer objects is
>>>>>>>>> as an
>>>>>>>>> i915
>>>>>>>>> gem object backend. We need to add some ops to account
>>>>>>>>> for
>>>>>>>>> added
>>>>>>>>> functionality like delayed delete and LRU list
>>>>>>>>> manipulation.
>>>>>>>>>
>>>>>>>>> Initially we support only LMEM and SYSTEM memory, but
>>>>>>>>> SYSTEM
>>>>>>>>> (which in this case means evicted LMEM objects) is not
>>>>>>>>> visible to i915 GEM yet. The plan is to move the i915
>>>>>>>>> gem
>>>>>>>>> system
>>>>>>>>> region
>>>>>>>>> over to the TTM system memory type in upcoming patches.
>>>>>>>>>
>>>>>>>>> We set up GPU bindings directly both from LMEM and from
>>>>>>>>> the
>>>>>>>>> system
>>>>>>>>> region,
>>>>>>>>> as there is no need to use the legacy TTM_TT memory
>>>>>>>>> type.
>>>>>>>>> We reserve
>>>>>>>>> that for future porting of GGTT bindings to TTM.
>>>>>>>>>
>>>>>>>>> There are some changes to TTM to allow for purging
>>>>>>>>> system
>>>>>>>>> memory
>>>>>>>>> buffer
>>>>>>>>> objects and to refuse swapping of some objects:
>>>>>>>>> Unfortunately i915
>>>>>>>>> gem
>>>>>>>>> still relies heavily on short-term object pinning, and
>>>>>>>>> we've
>>>>>>>>> chosen to
>>>>>>>>> keep short-term-pinned buffer objects on the TTM LRU
>>>>>>>>> lists
>>>>>>>>> for now,
>>>>>>>>> meaning that we need some sort of mechanism to tell TTM
>>>>>>>>> they are not
>>>>>>>>> swappable. A longer term goal is to get rid of the
>>>>>>>>> short-
>>>>>>>>> term
>>>>>>>>> pinning.
>>>>>>>> Well just use the eviction_valuable interface for this.
>>>>>>> Yes, we do that for vram/lmem eviction, but we have nothing
>>>>>>> similar
>>>>>>> for system swapping. Do I understand you correctly that you
>>>>>>> want me
>>>>>>> to add a call to eviction_valuable() also for that instead
>>>>>>> of
>>>>>>> swap_possible()?
>>>>>> You should already have that. eviction_valuable is called in
>>>>>> both
>>>>>> cases.
>>>>>>
>>>>> Hmm. I can only see it called from ttm_mem_evict_first() which
>>>>> is
>>>>> not
>>>>> in the swapping path? Or do I miss something?
>>>> Mhm, looks like my recollection was wrong. We should probably
>>>> move
>>>> the
>>>> call into the ttm_bo_evict_swapout_allowable() function.
>>> Yes, I think we also need a convention whether it's called dma_resv
>>> locked or not, since the helper accesses bo->mem, which should
>>> really
>>> only be done under reservation. At the same point, there is value
>>> in
>>> calling this function while holding the LRU lock.
>> You actually need to call it while holding the lock because eviction
>> otherwise ends up in an endless loop.
>>
>> Trying to fix that for years, but so far no luck with that.
>>
>>> Also, I wonder whether implementations of this callback might
>>> encounter
>>> unexpected data when called from the swapout path, because at least
>>> the
>>> helper assumes it not in system memory, since it is accessing bo-
>>>> mem.start.
>>> So unless we use a separate callback for swapout, there's some
>>> auditing
>>> to be done.
>> Please audit the existing callbacks and move the callback into the
>> function after doing that.
>>
>> Thanks,
>> Christian.
> Would it be OK if I also move the kref_get_unless_zero() to before
> ttm_bo_evict_swapout_allowable() to make the code less sensitive to
> surprises?

No, because then you need a kref_put while holding the spinlock which is 
not allowed.

Christian.

>
> /Thomas
>
>
>>> Pls let me know what you think.
>>> Thanks,
>>> Thomas
>>>
>>>
>>>
>>>> Christian.
>>>>
>>>>> Thanks,
>>>>>
>>>>> Thomas
>>>>>
>>>>>
>>>>>
>

