Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E86630BE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 20:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D13210E4FB;
	Mon,  9 Jan 2023 19:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D939D10E4FB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 19:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYOzibzAr84gJIAeAIvAXzoxAKxp8A07onO/qLtWGTKXGOIlQ36LHKgiGDj/IU1sznAvJIcq88ppmEyV4QnMPd5azQt4exS+mf8pEgukvVdxdvhvv+lMwyYb4vYaJOZ0JowCsW6AgeyDBgXP0URjrOun32T8bmhYAvQWboNCdoIItMIm9oOWnYx9XTMdSwkOEGfKMdYGj6Hy3TyeGoiwn20OD5OwFPC0WOqGSbzEhCtjPDWUPNp9/OTJuIPahGsVkhfOO/LUDeTUAw6crOkV389r4BjuJG6lkvo10VbXouGVR56zOSrfCEtcMS4j9U91DaLYk7cy0IwYYsCzcooTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxXui10JLNukbDXApDh3pOAdkE4PBNwJCdsIQ3Q+z8Y=;
 b=JFNbj4ZmI20X1ogRi1ZbCxBLR+vTS9zn1gfZJGof5HNbA29bOokMhmvhL9kE1xhrAPlmOM+SW2DNYXZdDCfKV2Y2HxgwS/Xi1UknAVhQT/+4aCjzR0wA2vexrv/HVN/+/mL6K61zlmjhbWLhNrPBTZ9hAHee8ZUauznRXCu1SH69XO7HLemgxuqui1y0vPQVyz5i0cuiv7IhsrKe8yTDr5RmrJ4ryfatYRgoYM0fPnqKOQTjdZcWAWjPuNnapMFTRUhHk5rSpH8HSPsxcmG/9/S0IpFyTRkpsHS1J6dX4NfJNey7SOQGRFenzo11S83vt5tLgmGBzqC73Vo99xxGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxXui10JLNukbDXApDh3pOAdkE4PBNwJCdsIQ3Q+z8Y=;
 b=zxc4b/7+UW85iRBHPcVf9BD3lX2D/mkMrQTLOU2UfXe8E9Nty6Kli+jNbNpaqYtE/d+0H9lQO5U5v5S+tG3Pe17/Z0aikGE9+/BP1TGkonuSNqHMyEbNeqEHBEJc5KPxKEbkRAVid+Aee/jZGb9qL1mvV3T/IeRfrgi2HtV70DE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 19:49:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 19:49:33 +0000
Message-ID: <85982ed4-5e7b-a2b5-d2ad-90278e364b63@amd.com>
Date: Mon, 9 Jan 2023 20:49:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] TTM shrinking revisited
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
 <ac777256-2400-1b19-81ce-af9ec7adfe9c@amd.com>
 <7e71d251-8179-12d9-4216-af5233d61f0d@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <7e71d251-8179-12d9-4216-af5233d61f0d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 7243778b-96b5-465a-7c9f-08daf27aa146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+OQNTNkcOD5e9EIvpv9Kh+KHep63mev+qwcCigfKOG0VzdQUpRAW8ZfzisJ8F/lizOdMNvWyse5eJKoMYXz5PhpVNkLHW15tbHniAryY4DfKkys89hP3NaFGbHMoLeMItrKtGr3cjhZ734iB7xRnh/ig7f4xA++67nFb+RLpbsaMedp3B7dYv2WMvFbsTAxlenH4pZVfbZnPlpZEH/VkmiCr1IG2NzUw0hf5byOnb7tLeBDDDZka6CNxkHmdv9r/jkTlAg4B0NUtLb0dqC/MAlXQWzLtyP3KOfCmh6WUU9zjyYsx0S7oM29L2mn3nB0IcNd73+NrOi7i40ayYeOTrJdDQ0Q+RxURZbwSBnec8aRHA9EGojneZTzuFNko1XXVs3gIsYQIP3blc2/Fff+i0c+pTipu5hv+E5sYiyaG6zDnEYa2juimR6y6YcdNxzPeMP+2jlBjrd77bAScIrVI5RuyzR1yOc9AX0NXktJXrfQp4ArwS80C5smFf8V7KY10snSUZvGUlumUh6KVQlokN4421QzRskKW/XKACCQ30Sqphycvllusm2hAEd0mH7Kar8pcvlOX1chswXa2SLx0vZ1tOlKNKhlq3/iy3pxg9Ei2Py8Ybrzk/PoLaJy3LLaB/a3QIfyQwJS655hpsqFj4FEOPrgi/1JzqG0OMLc7S8CCWe455T3gOBnJVnDJz3YE9L/MEhgpiPxAVSlv+NIWaYZ71+dx8a8NuVypnIGZE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(36756003)(186003)(8936002)(53546011)(6666004)(6506007)(6512007)(2616005)(66946007)(5660300002)(66476007)(66556008)(316002)(86362001)(31696002)(38100700002)(478600001)(41300700001)(6486002)(31686004)(8676002)(2906002)(83380400001)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGRqa203NWloTXZ4YzBGK0FQQWMvdmNCYy9DMmRyc01Nc091NjBHQTNGREps?=
 =?utf-8?B?Zm9PRzBjb0c5TmFuMWlOZE1URXdKTWdmRXh1YXpqMEd4YnRmb3A2TW5QRUZH?=
 =?utf-8?B?UUFDd1FkM2lRbjI1WTh2VDFoa3plZTUzVGZ3WDY1cTQ4OGErODlDSGhIOWZX?=
 =?utf-8?B?cXVuYitqUngyNWxXM2NLc3VscnB2KzBVTnlKOGFkbXZEZWtsdkxneXErMXZh?=
 =?utf-8?B?SmtjcVFqakdaam5WcXdITDRHSEVpcmJWeFFaWDM1b01EQ1dLRndSQk1uNEVj?=
 =?utf-8?B?eVZMT2RaVWxkY3ZLeWF4dDhMc0ZvUGZTWmliOFRIbWVzWnJscmlHSVgzR2hW?=
 =?utf-8?B?VGNxd2NtMGlQK0FKbVFLQWh3bXp1Wko2eGlqeGRlMkc5YmFCVWx0LzFuOGNP?=
 =?utf-8?B?ZVFSdlI0a2oyWUFRRGRIVGlMYmdKMHlFdTQrZThUdm9qWkdsUjZGd243NVBM?=
 =?utf-8?B?OWNQSXZkRng1SU50U2c4dkxSbUl2cS9CWG9pcFBnbURlZ1ZvOFc4cWJrOGwx?=
 =?utf-8?B?T0g5RnhMbWcrY2pla2xpa0NCYnc0UU5OeDI0NjBlSDJXMzNYL3dOZW1PVjNW?=
 =?utf-8?B?NEZUQmtjRnF6L3UvV2pjM0NlL2hqWHdvY0FzV2swanZPVFFTdVc5ZllBVGpW?=
 =?utf-8?B?VU5xN3h4L0FldmRvSDgzNUprNEhvb2I2QnJkTlNndnRZMHNYeGUxL0orOXd5?=
 =?utf-8?B?K0ZQaGZsZnNjK0FrRjJEc1VjTkRDVU44OUp5WnJuWnlNYjV5MkZLSURMNEIv?=
 =?utf-8?B?NXlrVFZYaDBNNGR0UHJHZUtiUXZ2Y0IxSk9WRnQ4QUN0c2xYdVJ4MnJLQjM5?=
 =?utf-8?B?bnZaZ1FjTWF1TkJIT2VIV21CQmNHeTYzK3JmNkF5SHB5aGpOODRURXE4VFhS?=
 =?utf-8?B?YTlWTWZjelVmT3F5MFBSYVJtVXEwRnJSVHRsZTc5YlFGRXhWcEVoVGVnQ3ds?=
 =?utf-8?B?YzR4ZmU2OGZxaTNjc2lNdllvdVljbVBGYW90Sm1VcmVJZ3FKMURmVkdMTG9D?=
 =?utf-8?B?OGJxNTAwU3BxZS9KeTM4aitwS0RaN0toak15cTFRWTNIemlUYmZYeklsWWpQ?=
 =?utf-8?B?VnpHbVR3Q2pqbDdNQ2ZGMEsrV0RUdURzelI3TURoWTlWQWo4eHJDMDg5YmJw?=
 =?utf-8?B?ZnB1Z1J6NGJrUTFaR01SVU5CM3dGa2JidnRKbnUrZXZtVStDMEhQNGRwUm8x?=
 =?utf-8?B?Sk9RL2ZLQkJkSE1VVkZGSzYzemRLSmd5ZFZXVURhdEprZEtJWVhtR2FGcTRv?=
 =?utf-8?B?ek15M25XcFRxcjVoNExRVWRUZGMrcDVYaVd6aThxZnhPZ3VIRGVnbnpEL01N?=
 =?utf-8?B?cWVJUVdxNEIvNmRwNHk0NXNGTDRIQkR5UjRKUzU2YlEvR1hvZkpGSVFlRjNG?=
 =?utf-8?B?N2RkVE1EbFZheXZra3JhMDNOVm1STWhLazNGam9ZZC9tK1ZKQUd1SG1yYjV0?=
 =?utf-8?B?L1ZTYjlTMlhYOURrbHFMaitqdVNvOUwwaTVWazJhcDZmQjhzZU96Tm92TThR?=
 =?utf-8?B?R0FLTHlQc0xuUVNBT0FveXo3UW5wcnlMQjdSWkNGTTlpS1hpVTRtb1FVaWEv?=
 =?utf-8?B?TFlBZkphN3J0bTJpMHU4OTkzdXBldUcrcXJ4QTQxOUltTmI4K0ltQ1d3Mm51?=
 =?utf-8?B?b21neTZEb1JrN0ZqblNEVUhNNkRmSitsazZQNHJpUEpOZU9GajdGRlhsV2dI?=
 =?utf-8?B?NTA2QnliK2xoMmRQS2I4SVJPb25BZXcxR1gzRnlWQmF2VHB6US8xYUQ0MWRu?=
 =?utf-8?B?clZPdTBkSm5udFJYdDRwVEo0Tkd5NTluVXIxaFB4S2wvWkVtNlVuN0s3Y1B5?=
 =?utf-8?B?MjlLZCtkUi9qVDV4K0FVT1NIc2lpb2tCTjNNakYvN0kxTHowak82UUpHWWw2?=
 =?utf-8?B?ZlpISWhoSFB4STNzVVBJOEJRUjBqVW5PTEY2YW9LRE82QTRIT1k5a1B1Tkp4?=
 =?utf-8?B?VktlMTN1bjlOWCtEY0NlUkh1eUtlNlozcHZWNkEzN09WNEVSL0QybzZELzBT?=
 =?utf-8?B?Y1U3MkwxUVRjKzJGS3Z1UndCRy9FMVlLRkwzeXdhRFMrYXZxMDcvdHE2Q2ov?=
 =?utf-8?B?N05HR0EwOGZ6UThsZU9ZNy9JT3MxemlVbERCd2VDa2VVT2JGaks2NGxoQmsv?=
 =?utf-8?B?NVRZT2VSQ0RmV0ZVUEtzR2VOUGI0YmV6V2VTUHdXSUlkeFNvV2wzK2xMZDNh?=
 =?utf-8?Q?ebxSrxUmQiyAhnbBE8sQ8ca4F1HGbjgfkCZrburHKmcU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7243778b-96b5-465a-7c9f-08daf27aa146
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 19:49:33.4373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjqrMXVO/R6LE1/dK8PMVPVZIApMNrtgAAGK80Pyo+SmbfDCyPS+MVw3B9/V4Tcw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766
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

Am 09.01.23 um 10:14 schrieb Thomas Hellström:
> Hi, Christian,
>
> Thanks for the feedback. Some additional inline comments and questions:
>
> On 1/4/23 11:31, Christian König wrote:
>> Am 30.12.22 um 12:11 schrieb Thomas Hellström:
>>> Hi, Christian, others.
>>>
>>> I'm starting to take a look at the TTM shrinker again. We'll 
>>> probably be
>>> needing it at least for supporting integrated hardware with the xe 
>>> driver.
>>>
>>> So assuming that the last attempt failed because of the need to 
>>> allocate
>>> shmem pages and lack of writeback at shrink time, I was thinking of the
>>> following approach: (A rough design sketch of the core support for the
>>> last bullet is in patch 1/1. It of course needs polishing if the 
>>> interface
>>> is at all accepted by the mm people).
>>>
>>> Before embarking on this, any feedback or comments would be greatly
>>> appreciated:
>>>
>>> *) Avoid TTM swapping when no swap space is available. Better to 
>>> adjust the
>>>     TTM swapout watermark, as no pages can be freed to the system 
>>> anyway.
>>> *) Complement the TTM swapout watermark with a shrinker.
>>>     For cached pages, that may hopefully remove the need for the 
>>> watermark.
>>>     Possibly a watermark needs to remain for wc pages and / or dma 
>>> pages,
>>>     depending on how well shrinking them works.
>>
>> Yeah, that's what I've already tried and failed miserable exactly 
>> because of what you described above.
>
> Do you have a test-case for this or a typical failing scenario I can 
> turn into a kunit test, to motivate the need for direct 
> insert-to-swap-cache before running it with the -mm people? It will 
> otherwise have a high risk of being NAKed, I fear.

No real test case, but Piglit has a test where an application tries to 
allocate texture which gets bigger and bigger until we run into an ENOMEM.

Without the 50% limit we crash pretty easily in an OOM situation.

>
>>
>>> *) Trigger immediate writeback of pages handed to the swapcache / 
>>> shmem,
>>>     at least when the shrinker is called from kswapd.
>>
>> Not sure if that's really valuable.
> Not completely sure either. However, in OOM situations where we need 
> to allocate memory to be able to shrink, that would give the system a 
> chance to reclaim the pages we shrink before we deplete the kernel 
> reserves completely. Shmem does this, and also the i915 shrinker in 
> some situations, but I agree it needs to be verified to be valuable 
> and if so, in what situations.
>
>>
>>> *) Hide ttm_tt_swap[out|in] details in the ttm_pool code. In the 
>>> pool code
>>>     we have more details about the backing pages and can split pages,
>>>     transition caching state and copy as necessary. Also investigate 
>>> the
>>>     possibility of reusing pool pages in a smart way if copying is 
>>> needed.
>>
>> Well I think we don't need to split pages at all. The higher order 
>> pages are just allocated for better TLB utilization and could (in 
>> theory) be freed as individual pages as well. It's just that MM 
>> doesn't support that atm.
>
> If we can insert pages directly into the swap-cache, splitting might 
> be needed, at least if compound pages were allocated to begin with. 
> Looks like shmem does this as well before inserting into the 
> swap-cache. Could be a corner case where the system theoretically 
> supports swapping PMD size pages, but when no PMD size slots are 
> available. (My system behaves like that, need to investigate why).

Mhm, sounds like my understanding of the swap-cache is completely 
outdated. Not much of a surprise, it was more than a decade ago that I 
last looked into this.

Christian.

>
>
>
> Thanks,
>
> Thomas
>
>
>>
>> But I really like the idea of moving more of this logic into the 
>> ttm_pool.
>>
>>> *) See if we can directly insert pages into the swap-cache instead of
>>>     taking the shmem detour, something along with the attached patch 
>>> 1 RFC.
>>
>> Yeah, that strongly looks like we way to go. Maybe in combination 
>> with being able to swap WC/UC pages directly out.
>>
>> While swapping them in again an extra copy doesn't hurt us, but for 
>> the other way that really sucks.
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Thanks,
>>> Thomas
>>>
>>

