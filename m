Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4185510ACD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 22:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA1B10E5B3;
	Tue, 26 Apr 2022 20:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E1410E5B3;
 Tue, 26 Apr 2022 20:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IARRrmSRuXMF8wrZlQZV0MZYpl4Qf0EKSS0M36MCWioHNuUO78A6N01BFOr42NlqekfNMt56XUDQMH0f9/m6mH7MQW+Yq/sOQA7IyKtJHBmZZQavwjYn7S1+g+Y+meVCi4QX1fqEodxASwd0CqjIg4Ku6xti+9X+TD6eDn77eo53DRcy4/R6Y3fBICyKjurko4SvCXchbXq2xuS+BAr8FZE5ygg9vRsbmpUNK5LSB2Ik07mphW2Yn+a3dUlPjL3LKnuWpfL9TbECjOES2Uf5fXfkIP44TnnVPabKOxL9Q7+pD432ZCOqtMbK1Sv4R8yqbLrD+agPubikgGDzvUik7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bheiieg9jeJISCsYmpGGIS4PRcunxHN+3Bb2TWNsUlE=;
 b=IPf2SfKVwrh8O/1kSPK3KJ59iNPtQ7bipfNyB9VYyzH2FG73LJd0Sl+6M2g2x9KeoP7tVCAqmM4eZrbB3fb7vRgzTN0uoA/3LFzaX3jvFPX1KRG+SSTcxlgoBbskcgDpfz4iD9REdcF/nUeijRuJb6Va/kYhOuHBlAVsuxmhSJrYiA/3NPfLjh8QjmCQ0p5s+2UrqoyKWQQ65Xj8NOR39fRqHVtvFd2RhySjtZlY/5t1akH67NIHe4S0EwoRgUe2nNnit3dXMjZgfoenj7vyFZpzvU+r0jR4kjPbffz6ckr4aZvoHwdY5C2JT6EOMbSZjmZhAM3Ul4sDAPWAEdkvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bheiieg9jeJISCsYmpGGIS4PRcunxHN+3Bb2TWNsUlE=;
 b=QQ1Y2XehQEiAc6CK81JElVKb//OeoJ/+LcY91zbyUqUUDyvEfYZgRVi5NXFRaWF60koUDNmzz65edNT67eBG0JjMd1Tplq/atyPrn+VhyOkSI/YeJIi56oHd9/P9hQfgIdZP7gBXlKDS6XPAHohMZNXqmAAD2r6hulC83I94ikk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN8PR12MB2851.namprd12.prod.outlook.com (2603:10b6:408:9f::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Tue, 26 Apr
 2022 20:54:33 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6070:7681:db0e:7702]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::6070:7681:db0e:7702%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 20:54:33 +0000
Message-ID: <d43d9456-d2e4-2486-9970-8c358a599b6d@amd.com>
Date: Tue, 26 Apr 2022 16:54:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/amdkfd: Use bitmap_zalloc() when applicable
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <f12820f6c5fca9b10ac8f82b3689c50ccb6966aa.1638117878.git.christophe.jaillet@wanadoo.fr>
 <14268d5a-9a4a-2921-9961-d5d36fad47b2@amd.com>
 <80a426b3-ece2-129c-edca-03556e1ecbb6@wanadoo.fr>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <80a426b3-ece2-129c-edca-03556e1ecbb6@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0148.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f25db84-b163-484e-0141-08da27c6f6f8
X-MS-TrafficTypeDiagnostic: BN8PR12MB2851:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2851B0729F4651C7D15FBB1692FB9@BN8PR12MB2851.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6K3fnbUoeYChf82OiJJFesaLmt8uvLnrh6GYp9N7iiQWhrmAs7xipx3ECRZ7+GKEWtnUjuIn5VMu4KXr716KOotRijRVtPxWkmMZuRzskbdhGAFA/jvyWnqAx8mmjbS5wpczaLgLzaQcA/kghqrLHwOqQ0rNjJqBYgIWIP4bAbse64OIPNoPVBqt4kW8HXuD1EthWe+qylZECzb+7a27ZYnGyOrzrSVj6whrL9eCpN5+SKoXXo43qt8/uSsDZSB/SYLrFjbvIYwqQWQaKghxXb9EKl0AsZaI3TBlw0f0sNA9gUSMWu1w0DXZAys8LAu0by7xDXAdeQZZyiHYGFx+T6B3QpVKdmm+x/0f2cxBs2JYAr1g/b/J4ZVXkDGUUguXvH/stXIsXPxNDm4KXFF+xyDrhxECQ5DBT6Yza36mZ4AbteWf7dIebiVDd0QKliHT4J2nPf6YGvDZOojVnYjOzjmDOzu1Ks5JvscNzRjYL5mCpeoEqliQPsfJlBq8X8qbpCtL2viLYpu88uZwJ7DRBuRCSylrtod+Vvx7T9RSEpRfXRv50juv5s0qgVvN99Y8UycooYLMDrMoZYAOseVx8gzX81vjwVpw512oZUSRBkZjvZdVt6H8CoIDd3aSd/lyICMumvo+FPe7/2DFTzI0EulkH751c7Xj5aP+FtULSMkxF4q4FUBEr5nefbORaD78+0TZoeCT9CvhS1S8Iu4spdL1+oDUk80ejZpRk1XexHWdtagqimvaXOqTMoGNCI8e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(8936002)(4326008)(66574015)(8676002)(2616005)(316002)(31686004)(186003)(36756003)(66946007)(66476007)(26005)(6486002)(66556008)(44832011)(4001150100001)(38100700002)(508600001)(2906002)(6512007)(31696002)(86362001)(5660300002)(6506007)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmN1bTRqNTFTL2V4amJyZGJ4WmFpVXE2S2FZN2k4MU0vbnVLOGFHdTBuQjVa?=
 =?utf-8?B?bE9tZDdzUjJjTllPaW9ucXJIelUxZXd2R3Jpb2crcm1ta2Vpby9Eak9INUtS?=
 =?utf-8?B?WWF0MExaNmNoTWJFRXJZanNpRGttVW13bFRrUEsvOWFzYVhEaXJ4NysybW40?=
 =?utf-8?B?NWhCVTBlV2ovMU83RDQwdHFBZXNEdHFNa3RKVmxTWEFMbWNubzlQZ2FwRHg3?=
 =?utf-8?B?SGY1SnVwbDE0cU12OXVNYitBakEveW5mekxvN3R6S24vaGkyWnE1OGkvcmRB?=
 =?utf-8?B?VVI2a0RleVVrc2VvcUdnUjNmbTNEMnZtNHpJYzdyL1JZdG5xRFdDOEx1YjBJ?=
 =?utf-8?B?YVZBWDlsR2plS1RNZlJNN1VmS3pFbmkxUzUwWURncEYzamkwUXJEb0xjSWFE?=
 =?utf-8?B?VG9YVDk4Mng2anBkU2pIeTkrK1ZYaTNUYjZLaVNNSzlRQnRKWktYT3JQQ1Bq?=
 =?utf-8?B?alJTZURjMHlEUWE3c0NsSzhBMHBsRGJCZVEyRnFzdHlxOGM2ejdUaDh4THB0?=
 =?utf-8?B?VXZVeFZaMVh6eEc4QWVFekJvMjN4akQ2SGpWdjROWE0vYlJPalRhZjFjTUVZ?=
 =?utf-8?B?a0F4Q0VteUIyNm5UQnpvZWU1OW5NbzZYdU5kQmZUSDNCd0RHRERDQ3JwUkNP?=
 =?utf-8?B?U3VuUkxnVFZkODhFRFVJOUpKVEo0SldiVkZMaTBGZHlMaS95YnZQdmRQRjhZ?=
 =?utf-8?B?WlFRa0dMSWVCNmg2Ni9YWStqVUJ3UmxwSGcyQ3Zpa0JvTWVYaXBJK2t2QXdX?=
 =?utf-8?B?RkM2SHFRNUJneVliTDZqK2NvMGJMWDFBdm5lYlN4TVBlRHJBUjFwUEpDQWVk?=
 =?utf-8?B?Zm04YVRMODF6cXBSVzdGbXBXRnh4SzB5Nld1bWg0M0dNdHA2SVF5WS96OHY3?=
 =?utf-8?B?TzFlTjhTNFBqek5YRko0M1hOUng3VmNzTXBNMXQ0ZVJ5bi9QQ09lTzN5T0ps?=
 =?utf-8?B?M01LTkpPSXVlS2Jwd2xqa0FyREs1NGxISnVsNTBIejFrV085OVM2aVpKRjdW?=
 =?utf-8?B?RXFIUjJHL2ZyQmZNYWdnZ1FqZU5iZHJZVWlLeDg5dVowY1pEZEdGNjZNejdT?=
 =?utf-8?B?S1BIVzlxbndBdzF2MGNBMUtlWjV5V1R3QVlDS1BZV3I5L3lDenpycWhDaVda?=
 =?utf-8?B?Slh0eUZRWDA4SVpBenBROGJZWlBqMVdTREp3ZCtZNkZWbnVra3IreGhhd3ht?=
 =?utf-8?B?RjU0WFBGaVJvVWpVbHY2dE9ONmx3SEY1MHl0SDNoV2J2ODVwL2gzOWQ2REpz?=
 =?utf-8?B?UDZ3K25uWFNYeFZuWWpTV1NieGpCejNYeFFsU2dTaTQ3b3B6akZ4MVFPRjJR?=
 =?utf-8?B?cCtYRWtJbjdLM0xpWCtuM3dMMktkeFdpUkJtSkZQK3NqeTJWMENrTjlFRWZ3?=
 =?utf-8?B?UnBPWXZpUWxzSnorTG9vWUYvTU02ZmRQcDNZemhvaWJHODFQVm44c2Vlckkw?=
 =?utf-8?B?QjBLVzYwYk9qUFNKZ3NkQVE0YXdRdnBQa2tCdkk0LzV3ZVV4VTZsTEFYc29V?=
 =?utf-8?B?bFFBUmtCMm1xOEdOMHJnRkphSjBQYm8ycWlPK1RyN3JGU0pYYTFDVlE3aDI4?=
 =?utf-8?B?QkNTSnVMRDkzOEtwNitLR011L1dmU25QVk1YOHlxRW0xaUJ3ZU1BbmQ0YTAz?=
 =?utf-8?B?RnEvZzNyMXhDa1ZPSVh1a1RmZXhiMzFFUVdiZlBIeUtRTk5kcmMyRzYvY21E?=
 =?utf-8?B?dGFVNzZ3RGZ6VDR4QmNJVVVXSTdYbWZjdjlvdDdxQUdBNWZBZE1PSUVTN044?=
 =?utf-8?B?RDZtWTBoRFk0WUxQUWxZWTJhOVVIQzhuMU1ydCthdVIySE9qaXkzdFlWQmFh?=
 =?utf-8?B?eDdRZG5tWGo2OXFQOXAwS0lxS20wVWxEMXJ3cHEremdyT2NMYTF1dUNrekdH?=
 =?utf-8?B?WXRGaFZtRjNWc2lUTWpMNE5wRTlKMmJFVExFb2pDME1QQUo0WnN2TXV5Um9X?=
 =?utf-8?B?aUZ2bk9EUFZVTmh5eXBtREN6ZHp0VkszcC94MStjUkZBNmdSZXdiWEovU2xp?=
 =?utf-8?B?ZURHaE8zL1VKSlI1dmFCV2l3M2FwVm40MU1VS1U0OHZ6Sy9PVFhmS2xEbnNR?=
 =?utf-8?B?Wk5sMDNBZ3plT2c2VEd3QXY3dExkRnF5cGxGN29mZVpUbWMzbWw1cEhuWGZz?=
 =?utf-8?B?amdwVHlmdFAzTmxrdWRHSUZkRngxZmZLcGJLYkJTdjhtWmlLMzVnV3FBNHZT?=
 =?utf-8?B?RERGcU85dkFqWExUQVJrSVZYRks5dmhmNElQR0FMdGcweXRBaWFBdGhDY2tk?=
 =?utf-8?B?eG9NbEl2ejBaTGZ2bjlOdVNGZ0dlb1BEUDc1ckYwTTVURTQ5NlI5MGE0cWxF?=
 =?utf-8?B?ODY0TFB1ekF4UUNQOENyUDc2Myt6cXFKUVFpSlRXaVNOVHNxaHhRdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f25db84-b163-484e-0141-08da27c6f6f8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 20:54:33.2114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAHKWWG4HQPlwKCNYK+EzYqsS6yic5bwg5Q8iACUkyf2GYA6qXm5jbQy0qTCBME8NTEDGrO/cgjDrMQrzQrK7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2851
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-04-26 um 14:47 schrieb Christophe JAILLET:
> Le 26/04/2022 à 20:01, Felix Kuehling a écrit :
>> Hi Christophe,
>>
>> I just stumbled over this patch series while cleaning up my inbox. 
>> Sorry for dropping it back in November. I'm about to apply it but I 
>> noticed that patch 1 is missing a Signed-off-by. Is it OK to add that 
>> in your name?
>
> Hi,
>
> No problem for me if you can add it. Thanks.
> But if you prefer a v2, it is also fine for me.

No need. I submitted the patches to amd-staging-drm-next.

Regards,
   Felix


>
> BTW sorry for missing the SoB tag. This definitively means that I 
> forgot the checkpatch.pl step for this patch, which is bad.
>
> CJ
>
>>
>> Thanks,
>>    Felix
>>
>>
>> Am 2021-11-28 um 11:45 schrieb Christophe JAILLET:
>>> 'kfd->gtt_sa_bitmap' is a bitmap. So use 'bitmap_zalloc()' to simplify
>>> code, improve the semantic and avoid some open-coded arithmetic in
>>> allocator arguments.
>>>
>>> Also change the corresponding 'kfree()' into 'bitmap_free()' to keep
>>> consistency.
>>> ---
>>>   drivers/gpu/drm/amd/amdkfd/kfd_device.c | 12 +++---------
>>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c 
>>> b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>>> index e1294fba0c26..c5a0ce44a295 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>>> @@ -1252,8 +1252,6 @@ int 
>>> kgd2kfd_schedule_evict_and_restore_process(struct mm_struct *mm,
>>>   static int kfd_gtt_sa_init(struct kfd_dev *kfd, unsigned int 
>>> buf_size,
>>>                   unsigned int chunk_size)
>>>   {
>>> -    unsigned int num_of_longs;
>>> -
>>>       if (WARN_ON(buf_size < chunk_size))
>>>           return -EINVAL;
>>>       if (WARN_ON(buf_size == 0))
>>> @@ -1264,11 +1262,8 @@ static int kfd_gtt_sa_init(struct kfd_dev 
>>> *kfd, unsigned int buf_size,
>>>       kfd->gtt_sa_chunk_size = chunk_size;
>>>       kfd->gtt_sa_num_of_chunks = buf_size / chunk_size;
>>> -    num_of_longs = (kfd->gtt_sa_num_of_chunks + BITS_PER_LONG - 1) /
>>> -        BITS_PER_LONG;
>>> -
>>> -    kfd->gtt_sa_bitmap = kcalloc(num_of_longs, sizeof(long), 
>>> GFP_KERNEL);
>>> -
>>> +    kfd->gtt_sa_bitmap = bitmap_zalloc(kfd->gtt_sa_num_of_chunks,
>>> +                       GFP_KERNEL);
>>>       if (!kfd->gtt_sa_bitmap)
>>>           return -ENOMEM;
>>> @@ -1278,13 +1273,12 @@ static int kfd_gtt_sa_init(struct kfd_dev 
>>> *kfd, unsigned int buf_size,
>>>       mutex_init(&kfd->gtt_sa_lock);
>>>       return 0;
>>> -
>>>   }
>>>   static void kfd_gtt_sa_fini(struct kfd_dev *kfd)
>>>   {
>>>       mutex_destroy(&kfd->gtt_sa_lock);
>>> -    kfree(kfd->gtt_sa_bitmap);
>>> +    bitmap_free(kfd->gtt_sa_bitmap);
>>>   }
>>>   static inline uint64_t kfd_gtt_sa_calc_gpu_addr(uint64_t start_addr,
>>
>
