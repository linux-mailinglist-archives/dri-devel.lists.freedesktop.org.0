Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAB8598227
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 13:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A658290E83;
	Thu, 18 Aug 2022 11:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E964B6156;
 Thu, 18 Aug 2022 11:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDw8wIRMMVyFuccdtWnc+bpV5p+Fsirvp7CRotvikCAwK27Ey70xCJuJOBIyLE5qJj30qihsGNzLxJwcppg6XOqqDlUb+ZDIbE3HsKumEjDCETlC2nk21T/tEB5iV1mlJ6cIjxNdwl7ZHGyZCJ9NxCXzNhZE13Wl2c7G4bl7VkQWfwQu9IAst7Ff/MAZ36S0Lck1t/PlRZNieE96eBPB/EBu6IHSWlK62tdonn6PaO9D44ch2L1hm02SOp11SEF47xGKAHVLl6HNKpd8eDRsxIQtxM7KEcteneuqR6HF0mFwot2O57bjLHY10ktRUWYAb1IjYA4o8CxF2p74BohIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oD2y7hyJaxKfq5jcLwzxgf2pEaQIcaxr7xxQLsmaJVI=;
 b=RpFR2SWN5GLy5Jp/IRVXXKrXZcBZ4B5rpOMjNuwrg9f3ZGsif9yyz2Ey9eEgvkb+fMcy4k4QSk2e9EOxEQ5Osf3F2wDduvFaBLkem3zdQ72UUuY0wKI7FvgGRHRC9zLjJIOK5tNiW6NjUa9QqF0qEiroVLw6KWGdkbuXFt/tMBcVGbdqv5YdXAPS2xJph+/ml3z8XF++gnLK2F9FQ3o+b4BPXOYCL0APlXRjnFre1E0zx5Z11SfASKDMPM1k7CtIcAoL14NNDKUgfL4qE8+VUKZf0DaMIR9DdF2MSGbpVyCSsQY9vH5834Aw1RhulYcQGNa8xZeXS9HyCLde58z9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD2y7hyJaxKfq5jcLwzxgf2pEaQIcaxr7xxQLsmaJVI=;
 b=X75l4Zdix2l/RI2JTXijv+zGDqY38UuZR0rzUfZaND+3+aoEDqsDoYmA+OZcBO74c0kRh115RZBZrlkolMFOOmhIPaOt+FsT0LYnlWjuiijh29v4FYM+3iJoiLR0ME6JU3F2zEpbTPip+oFdUbQwH6QCKyXLxWz51+NJCTOgJ9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN6PR12MB2831.namprd12.prod.outlook.com (2603:10b6:805:ec::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 11:20:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Thu, 18 Aug 2022
 11:20:58 +0000
Message-ID: <973682df-b2e5-020c-98e9-96ec9af214d5@amd.com>
Date: Thu, 18 Aug 2022 13:20:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dma-buf: Add ioctl to query mmap coherency/cache
 info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220815211516.3169470-1-robdclark@gmail.com>
 <20220815211516.3169470-2-robdclark@gmail.com>
 <327c77d5-5812-a158-6c9f-c68e15a5a6b4@amd.com>
 <CAF6AEGu3oxM+EX_FsLpw4m0KouMyFMLN=AGGbf=6TVQGkJ7jQg@mail.gmail.com>
 <6396ccf9-a677-427d-f5f9-12d30ad2197e@amd.com>
 <CAF6AEGsbc9PuSOyvhnr0ALQiLY9gSBySHyisEOfteZq9NXN0VA@mail.gmail.com>
 <8afce42b-db0e-9f71-7cd7-2680b6c9a1c9@amd.com>
 <CAF6AEGvBhx9ZFBzb8dUymhN99HPq7eTyGwVH-Uk9GQr1QjWN+Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGvBhx9ZFBzb8dUymhN99HPq7eTyGwVH-Uk9GQr1QjWN+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0055.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8ab881d-5c49-4395-08ae-08da810bb9c2
X-MS-TrafficTypeDiagnostic: SN6PR12MB2831:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPXTAPgdok2GdG0srqD63BQKGzQ46jjmfTnP1SDmdQ5K6Glz7OD6IgEegUNIlNc7WgkETAApoHkjDLzZTvFnfgIFd0G+rXpGJg7DNyFT9JVCyfcRqUzC/xA6nYmtNVwBPjZzz6Hr2i2sMjxmkbGGBF9RSRFHnUI8WW85fuM1UnlIsHyh/FqZArR6VdxZRadjH4/CZ9nD0mLqZ9aBBN5pY0nA5+s/KySExuBnKtKNQtvGXaAZSi5eFKCFD//RWcwY9j5/BCpbbQYoQsptAbzggyKqmCIfR1PzC+/munL0u3A3vSHZ9XXrr/tQGOFx8kQ9XTqllOZdAVciGlpthPhrzt39ORACgz0lwgmQgfmWtbKbGrTgJ15sdSKlReQqaYXfSiEwEX5KkBJ5iPqhrNUyydV5YCZ6Be61Ffqg7XneU/5x02fATNg0SmcOYdRy9wZ/02qUwnNYD9HsE96vreXNmgspoPt2dH2gZ54PCWpszLWRqLEAD4LcQzKumfaFGrCaUW/uyiA6qybRZ3hhOYgw8TjFm/vgTNCjOQ9VrLu0OBq9LBiWLTCXtCoDDrBiwlonk0OMMT9Y+npmK9m5K7ScQrcDhLqKSyM+zDCsumwf/AyKeuv+f0Fg8HHjRGypRRSPGjJQNLWT+Cg1nGFZXwVyREQbY98KSNOBqk2BK/mQppX1jQqNEyDZ//WynAe9bbHkpdqfxnMvzvEsR2qetiljBsrlLrFz5sclSyTIC/B2jjlmmVXX6ohes+AWIPMq1uDHnlqt28D/FMM9WKUNY4vMySxzsfPB7z+Wf9x23l0s5+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(26005)(6512007)(38100700002)(6666004)(53546011)(2906002)(6506007)(66574015)(186003)(83380400001)(4326008)(66476007)(31686004)(66556008)(8676002)(36756003)(66946007)(478600001)(6486002)(6916009)(54906003)(316002)(31696002)(86362001)(41300700001)(8936002)(30864003)(7416002)(2616005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFpkSWZ1Q29wbC9meTl2RFVHQ1lxMmNyRlZOdktFcEwvSFBpc3hkUk1rR1A4?=
 =?utf-8?B?ZXl1dmc1Qy81WGhUQytFUHp2cTNXRkNLZlczemxuU3JpYVAwNzZaUVpUdXp4?=
 =?utf-8?B?QTdKS1RHOHdnZE1meG1GaSt3LzNqdW4vQWx6cEx1MU9XUjd4TXV5QlkvNHo1?=
 =?utf-8?B?UGJDSDBkYkpwdGlrQm1EU3JVSVZCNDl5d0FNaXhWOGYyTkR4blFOYXBCWlhG?=
 =?utf-8?B?MmF4QkRyZXJxMml3Y200V0RnQjdJTG1FelRKSTJDTkx5c2w5aEo4MVZkRkdY?=
 =?utf-8?B?YWdoN0ZwSXpxNVAvSGFWTlFpSVZuVlgzdGVmMUdXdy9JWUpQcnUwSnVPR2xO?=
 =?utf-8?B?RUhiWGhrM0VobWF0WlZUZjFFc2pZL3Y5YkFSRWt1N2xSRnpDRS8ra3o1TTI1?=
 =?utf-8?B?MlliZTJUbUgvbkNScEt6NnloaXJaNnUwRDdGd0JOSmNtMlNUUXlyWXZoNWZK?=
 =?utf-8?B?ZWxBS3VTUHIrYUUxTE1pRXRKZWtDa0NGNFZiazdLV2Z0TWkzbjZQTmR0aGNz?=
 =?utf-8?B?aWdiNHJDNkZ6RVF1QmdkLys3aUlONVQ1TnpTUk5scmloekJkNW1wTGJYOU5i?=
 =?utf-8?B?UGRMYnNtaVRpL3pUb3FCQUQvN3BmZC8yeHVySDgxMEYvZ2xNL2ZTQTV4b1JX?=
 =?utf-8?B?RUxMVmQ2YVNpNGNSVDI4bXhyNXhOSGFxMzNlTmhQSHB6S2ZqQnJwNWVFYmJ4?=
 =?utf-8?B?TlcrT3NwSWtDVnpTQ1RqVk5ZRUt0dmh3NGJxTEZJZ3prZTFqSWpUekxoZXpr?=
 =?utf-8?B?LzVPc1lZdU5sL21LRjR3QUhlRHBGQWRVOWtNNnJUZEhYN2IwcksxbW1UQlRP?=
 =?utf-8?B?Wkc2cTdOaXpwbkN5aEh2RnEzMUVIQW00enBrSmxLUU9RSUJ2LysvVDlHb2hX?=
 =?utf-8?B?SklVVVZYWWlNZU56bHdGcHJDeUdwMTZXV3RjT3F5SEx5aDl6VEdNT2MzcGY1?=
 =?utf-8?B?RFlObTNTWFh6bHJtby9rNWxBYVZBa25qOXlhSktQN0EwWnU3cHE4SEN5aDZr?=
 =?utf-8?B?bVp5MEhxU2VIbTE5TkZwazVmcTdGQisyV0pLRk8vZ0MzR2tJY283YjNMUnFO?=
 =?utf-8?B?M1lFTmV3cE84dTBNQ05ITTRaWStHSnh2Z1crRjNkeDBDYlE3dm5za1hvOE4r?=
 =?utf-8?B?U3duZlVhbGRpbGg4NExtY0ZTNVRUOU51SzFZOUlPQk9Ic0RUajJMYXp6b1R3?=
 =?utf-8?B?M3hmSlJ3amE1K3hGKzZ3TEJkTEt3b3AyUFlDRFpvRFpYYnQ3bE5tN2dGS04x?=
 =?utf-8?B?M0ZtbzhjUGUvS2lnajdERkNmMDR1TE0yNTYxV2lIUFhDNlJyWC9neEZqcldV?=
 =?utf-8?B?eWU2UmxQUzlIZnJkLzZCYmJZUjIwT3kyazBvVnA0YzkvYnhJRkNId0h0QW01?=
 =?utf-8?B?UEVmdTYvbE5TWG56eHl2S1Nldkprc3Y3T2JQeVVNZmMwOFYweituSlhmZllh?=
 =?utf-8?B?YnpvbTg4Vy90QkU5ckEzanhBRjUxZ2lCRWViNHBWYlNIRCs2UWNYS053STNU?=
 =?utf-8?B?d1d2cy8rcVRkOTZKVS96NTJyTFkrYUVIQ2VOQmRaSHpwL1Y4RyttWFlmUFZu?=
 =?utf-8?B?QW5DdTAxKzRHSms1YmtheWxXL3VrYzY5ekx1WHhobVFGellNejZrK2dERFZI?=
 =?utf-8?B?elV6dWJnVWdOZWYzSXJreUVINkFiRVhsRzk0dVFLcnRPWjFPbUV4U2NNVCtj?=
 =?utf-8?B?S05QUVFyaG4wOFFxSzJkandrbUluSU55R1dJRlYrM3RaSHR3WktybVBUblZ1?=
 =?utf-8?B?dFozdlQ5VysxdXRYNEJRQnBHUHR5QXJLRWkyQVVOZFBrSm9xZ1ROM0V4anBa?=
 =?utf-8?B?eHhpN0xQYUcyNjQxY0pkSVVTeWZMM2plajVOV2dyQ1BBUktUQ0Mwb0RjY3h6?=
 =?utf-8?B?Qkt5SUx6M21VekdZTDA0QkRGREJacFpvYUpENGJnVHhtSWNsVU9ncE1VcGtj?=
 =?utf-8?B?M3dVR28yTzBodEZyZ3cwUGdWL1cyN2dLTmRQV0tBMHNuV05OUkdEODJJa0wy?=
 =?utf-8?B?ZTlXU25jUU9GdEpQSDR1T1J5ZzlsQ2ZJL0pQaCtPRUVWaFVrb3lMeHhLc2x0?=
 =?utf-8?B?TjhQc0lhRlV5NHd5WUhoUmtBMkVKOXRnRTMvUVF4TVE5d0w5NFo3TTRSYkpy?=
 =?utf-8?Q?EQNtQ0UfKKLfmfh9lwZ1QKEeV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ab881d-5c49-4395-08ae-08da810bb9c2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 11:20:58.8877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61cXawhXhjWUhrVEFSRu0KwX/tJM9fZA/+UapiZAj4Q97Ud4rpLUltI+uaa5Owoq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2831
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.08.22 um 15:44 schrieb Rob Clark:
> On Wed, Aug 17, 2022 at 2:57 AM Christian König
> <christian.koenig@amd.com> wrote:
>> [SNIP]
>>
>> The resulting cache attrs from combination of S1 and S2 translation
>> can differ.  So ideally we setup the S2 pgtables in guest aligned with
>> host userspace mappings
>> Well exactly that is not very convincing.
>>
>> What you want to do is to use one channel for the address and a
>> different one for the cache attrs, that's not something I would
>> recommend doing in general.
> How would that work.. mmap() is the channel for the address, we'd need
> to introduce a new syscall that returned additional information?

The channel for the address is not mmap(), but rather the page faults. 
mmap() is just the function setting up that channel.

The page faults then insert both the address as well as the caching 
attributes (at least on x86).

That we then need to forward the caching attributes manually once more 
seems really misplaced.

>> Instead the client pgtables should be setup in a way so that host can
>> overwrite them.
> How?  That is completely not how VMs work.  Even if the host knew
> where the pgtables were and somehow magically knew the various guest
> userspace VAs, it would be racey.

Well you mentioned that the client page tables can be setup in a way 
that the host page tables determine what caching to use. As far as I can 
see this is what we should use here.

Regards,
Christian.

>
> BR,
> -R
>
>> Regards,
>> Christian.
>>
>>> BR,
>>> -R
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> If the hardware can't use the caching information from the host CPU page
>>>>>> tables directly then that pretty much completely breaks the concept that
>>>>>> the exporter is responsible for setting up those page tables.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>      drivers/dma-buf/dma-buf.c    | 63 +++++++++++++++++++++++++++------
>>>>>>>      include/linux/dma-buf.h      | 11 ++++++
>>>>>>>      include/uapi/linux/dma-buf.h | 68 ++++++++++++++++++++++++++++++++++++
>>>>>>>      3 files changed, 132 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>>>>>> index 32f55640890c..262c4706f721 100644
>>>>>>> --- a/drivers/dma-buf/dma-buf.c
>>>>>>> +++ b/drivers/dma-buf/dma-buf.c
>>>>>>> @@ -125,6 +125,32 @@ static struct file_system_type dma_buf_fs_type = {
>>>>>>>          .kill_sb = kill_anon_super,
>>>>>>>      };
>>>>>>>
>>>>>>> +static int __dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
>>>>>>> +{
>>>>>>> +     int ret;
>>>>>>> +
>>>>>>> +     /* check if buffer supports mmap */
>>>>>>> +     if (!dmabuf->ops->mmap)
>>>>>>> +             return -EINVAL;
>>>>>>> +
>>>>>>> +     ret = dmabuf->ops->mmap(dmabuf, vma);
>>>>>>> +
>>>>>>> +     /*
>>>>>>> +      * If the exporter claims to support coherent access, ensure the
>>>>>>> +      * pgprot flags match the claim.
>>>>>>> +      */
>>>>>>> +     if ((dmabuf->map_info != DMA_BUF_MAP_INCOHERENT) && !ret) {
>>>>>>> +             pgprot_t wc_prot = pgprot_writecombine(vma->vm_page_prot);
>>>>>>> +             if (dmabuf->map_info == DMA_BUF_COHERENT_WC) {
>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) != pgprot_val(wc_prot));
>>>>>>> +             } else {
>>>>>>> +                     WARN_ON_ONCE(pgprot_val(vma->vm_page_prot) == pgprot_val(wc_prot));
>>>>>>> +             }
>>>>>>> +     }
>>>>>>> +
>>>>>>> +     return ret;
>>>>>>> +}
>>>>>>> +
>>>>>>>      static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>>>>>      {
>>>>>>>          struct dma_buf *dmabuf;
>>>>>>> @@ -134,16 +160,12 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
>>>>>>>
>>>>>>>          dmabuf = file->private_data;
>>>>>>>
>>>>>>> -     /* check if buffer supports mmap */
>>>>>>> -     if (!dmabuf->ops->mmap)
>>>>>>> -             return -EINVAL;
>>>>>>> -
>>>>>>>          /* check for overflowing the buffer's size */
>>>>>>>          if (vma->vm_pgoff + vma_pages(vma) >
>>>>>>>              dmabuf->size >> PAGE_SHIFT)
>>>>>>>                  return -EINVAL;
>>>>>>>
>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>>>>>      }
>>>>>>>
>>>>>>>      static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
>>>>>>> @@ -326,6 +348,27 @@ static long dma_buf_set_name(struct dma_buf *dmabuf, const char __user *buf)
>>>>>>>          return 0;
>>>>>>>      }
>>>>>>>
>>>>>>> +static long dma_buf_info(struct dma_buf *dmabuf, void __user *uarg)
>>>>>>> +{
>>>>>>> +     struct dma_buf_info arg;
>>>>>>> +
>>>>>>> +     if (copy_from_user(&arg, uarg, sizeof(arg)))
>>>>>>> +             return -EFAULT;
>>>>>>> +
>>>>>>> +     switch (arg.param) {
>>>>>>> +     case DMA_BUF_INFO_MAP_INFO:
>>>>>>> +             arg.value = dmabuf->map_info;
>>>>>>> +             break;
>>>>>>> +     default:
>>>>>>> +             return -EINVAL;
>>>>>>> +     }
>>>>>>> +
>>>>>>> +     if (copy_to_user(uarg, &arg, sizeof(arg)))
>>>>>>> +             return -EFAULT;
>>>>>>> +
>>>>>>> +     return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>>      static long dma_buf_ioctl(struct file *file,
>>>>>>>                            unsigned int cmd, unsigned long arg)
>>>>>>>      {
>>>>>>> @@ -369,6 +412,9 @@ static long dma_buf_ioctl(struct file *file,
>>>>>>>          case DMA_BUF_SET_NAME_B:
>>>>>>>                  return dma_buf_set_name(dmabuf, (const char __user *)arg);
>>>>>>>
>>>>>>> +     case DMA_BUF_IOCTL_INFO:
>>>>>>> +             return dma_buf_info(dmabuf, (void __user *)arg);
>>>>>>> +
>>>>>>>          default:
>>>>>>>                  return -ENOTTY;
>>>>>>>          }
>>>>>>> @@ -530,6 +576,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>>>>>>>          dmabuf->priv = exp_info->priv;
>>>>>>>          dmabuf->ops = exp_info->ops;
>>>>>>>          dmabuf->size = exp_info->size;
>>>>>>> +     dmabuf->map_info = exp_info->map_info;
>>>>>>>          dmabuf->exp_name = exp_info->exp_name;
>>>>>>>          dmabuf->owner = exp_info->owner;
>>>>>>>          spin_lock_init(&dmabuf->name_lock);
>>>>>>> @@ -1245,10 +1292,6 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>>>>>          if (WARN_ON(!dmabuf || !vma))
>>>>>>>                  return -EINVAL;
>>>>>>>
>>>>>>> -     /* check if buffer supports mmap */
>>>>>>> -     if (!dmabuf->ops->mmap)
>>>>>>> -             return -EINVAL;
>>>>>>> -
>>>>>>>          /* check for offset overflow */
>>>>>>>          if (pgoff + vma_pages(vma) < pgoff)
>>>>>>>                  return -EOVERFLOW;
>>>>>>> @@ -1262,7 +1305,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
>>>>>>>          vma_set_file(vma, dmabuf->file);
>>>>>>>          vma->vm_pgoff = pgoff;
>>>>>>>
>>>>>>> -     return dmabuf->ops->mmap(dmabuf, vma);
>>>>>>> +     return __dma_buf_mmap(dmabuf, vma);
>>>>>>>      }
>>>>>>>      EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
>>>>>>>
>>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>>>> index 71731796c8c3..37923c8d5c24 100644
>>>>>>> --- a/include/linux/dma-buf.h
>>>>>>> +++ b/include/linux/dma-buf.h
>>>>>>> @@ -23,6 +23,8 @@
>>>>>>>      #include <linux/dma-fence.h>
>>>>>>>      #include <linux/wait.h>
>>>>>>>
>>>>>>> +#include <uapi/linux/dma-buf.h>
>>>>>>> +
>>>>>>>      struct device;
>>>>>>>      struct dma_buf;
>>>>>>>      struct dma_buf_attachment;
>>>>>>> @@ -307,6 +309,13 @@ struct dma_buf {
>>>>>>>           */
>>>>>>>          size_t size;
>>>>>>>
>>>>>>> +     /**
>>>>>>> +      * @map_info:
>>>>>>> +      *
>>>>>>> +      * CPU mapping/coherency information for the buffer.
>>>>>>> +      */
>>>>>>> +     enum dma_buf_map_info map_info;
>>>>>>> +
>>>>>>>          /**
>>>>>>>           * @file:
>>>>>>>           *
>>>>>>> @@ -533,6 +542,7 @@ struct dma_buf_attachment {
>>>>>>>       * @ops:    Attach allocator-defined dma buf ops to the new buffer
>>>>>>>       * @size:   Size of the buffer - invariant over the lifetime of the buffer
>>>>>>>       * @flags:  mode flags for the file
>>>>>>> + * @map_info:        CPU mapping/coherency information for the buffer
>>>>>>>       * @resv:   reservation-object, NULL to allocate default one
>>>>>>>       * @priv:   Attach private data of allocator to this buffer
>>>>>>>       *
>>>>>>> @@ -545,6 +555,7 @@ struct dma_buf_export_info {
>>>>>>>          const struct dma_buf_ops *ops;
>>>>>>>          size_t size;
>>>>>>>          int flags;
>>>>>>> +     enum dma_buf_map_info map_info;
>>>>>>>          struct dma_resv *resv;
>>>>>>>          void *priv;
>>>>>>>      };
>>>>>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>>>>>> index b1523cb8ab30..07b403ffdb43 100644
>>>>>>> --- a/include/uapi/linux/dma-buf.h
>>>>>>> +++ b/include/uapi/linux/dma-buf.h
>>>>>>> @@ -85,6 +85,72 @@ struct dma_buf_sync {
>>>>>>>
>>>>>>>      #define DMA_BUF_NAME_LEN    32
>>>>>>>
>>>>>>> +/**
>>>>>>> + * enum dma_buf_map_info - CPU mapping info
>>>>>>> + *
>>>>>>> + * This enum describes coherency of a userspace mapping of the dmabuf.
>>>>>>> + *
>>>>>>> + * Importing devices should check dma_buf::map_info flag and reject an
>>>>>>> + * import if unsupported.  For example, if the exporting device uses
>>>>>>> + * @DMA_BUF_COHERENT_CACHED but the importing device does not support
>>>>>>> + * CPU cache coherency, the dma-buf import should fail.
>>>>>>> + */
>>>>>>> +enum dma_buf_map_info {
>>>>>>> +     /**
>>>>>>> +      * @DMA_BUF_MAP_INCOHERENT: CPU mapping is incoherent.
>>>>>>> +      *
>>>>>>> +      * Use of DMA_BUF_IOCTL_SYNC is required for CPU managed coherenency.
>>>>>>> +      */
>>>>>>> +     DMA_BUF_MAP_INCOHERENT,
>>>>>>> +
>>>>>>> +     /**
>>>>>>> +      * @DMA_BUF_COHERENT_WC: CPU mapping is coherent but not cached.
>>>>>>> +      *
>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>>>>>> +      * However fences may be still required for synchronizing access.  Ie.
>>>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>>>>>> +      *
>>>>>>> +      * The cpu mapping is writecombine.
>>>>>>> +      */
>>>>>>> +     DMA_BUF_COHERENT_WC,
>>>>>>> +
>>>>>>> +     /**
>>>>>>> +      * @DMA_BUF_COHERENT_CACHED: CPU mapping is coherent and CPU cached.
>>>>>>> +      *
>>>>>>> +      * A cpu mmap'ing is coherent, and DMA_BUF_IOCTL_SYNC is not required.
>>>>>>> +      * However fences may be still required for synchronizing access.  Ie.
>>>>>>> +      * coherency can only be relied upon by an explicit-fencing userspace.
>>>>>>> +      * An implicit-sync userspace must still use DMA_BUF_IOCTL_SYNC.
>>>>>>> +      *
>>>>>>> +      * The cpu mapping is cached.
>>>>>>> +      */
>>>>>>> +     DMA_BUF_COHERENT_CACHED,
>>>>>>> +};
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * struct dma_buf_info - Query info about the buffer.
>>>>>>> + */
>>>>>>> +struct dma_buf_info {
>>>>>>> +
>>>>>>> +#define DMA_BUF_INFO_MAP_INFO    1
>>>>>>> +
>>>>>>> +     /**
>>>>>>> +      * @param: Which param to query
>>>>>>> +      *
>>>>>>> +      * DMA_BUF_INFO_MAP_INFO:
>>>>>>> +      *     Returns enum dma_buf_map_info, describing the coherency and
>>>>>>> +      *     caching of a CPU mapping of the buffer.
>>>>>>> +      */
>>>>>>> +     __u32 param;
>>>>>>> +     __u32 pad;
>>>>>>> +
>>>>>>> +     /**
>>>>>>> +      * @value: Return value of the query.
>>>>>>> +      */
>>>>>>> +     __u64 value;
>>>>>>> +};
>>>>>>> +
>>>>>>>      #define DMA_BUF_BASE                'b'
>>>>>>>      #define DMA_BUF_IOCTL_SYNC  _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>>>>>>
>>>>>>> @@ -95,4 +161,6 @@ struct dma_buf_sync {
>>>>>>>      #define DMA_BUF_SET_NAME_A  _IOW(DMA_BUF_BASE, 1, __u32)
>>>>>>>      #define DMA_BUF_SET_NAME_B  _IOW(DMA_BUF_BASE, 1, __u64)
>>>>>>>
>>>>>>> +#define DMA_BUF_IOCTL_INFO   _IOWR(DMA_BUF_BASE, 2, struct dma_buf_info)
>>>>>>> +
>>>>>>>      #endif

