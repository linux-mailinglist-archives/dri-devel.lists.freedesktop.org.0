Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F93A862F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 18:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4BF6E434;
	Tue, 15 Jun 2021 16:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2042.outbound.protection.outlook.com [40.107.102.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838636E28A;
 Tue, 15 Jun 2021 16:16:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAMWFET5Hj44C8fK6vTvzU02SVDjs6xF0eUyUT/VgBpjYbCIJA4qpjerNrwY3cGw90i0VoD0+oLgL0U1OPZono1yVdLOzPuYJTAbElaeXSwLOKXonX3xKco7w7CQbR3Dq5x0J3sd3hOv+ogDvBgq3PZH26xyhwp6cnc1zkhJk2+ezrDKk/i4u+Bhmbpy5w9CkZD2/eSmn5ekSPhrrvTzItr4vSVDiyh7B9VnOGfl0Zq2oOdSGHNlcHPVCOwhiwxCze0bDSnjBDenKOReQjB01YVE7Itv1+IBUSTCO0zAC8irC052cg2f5Az9Fofp15fD+bgWcW/aEzvqF96YP5PUhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ajh9Z0MVBu5qh3Ib21Mn8SoQFvElkpIwNIztSbBBFc=;
 b=C+rM01HdESvl9Xsxv5Pdjp001AvawG2h6pFv4ehNuiSmnf4JPA+ovqEjmGKTSmRx7rPG/ggYMTX7g98NOdeKvveTqe3tYC01LNWpotxMiUBa3NXJAp2oLB8PlOzAdLb0+MIrIeTr61mihgRhuwmyE02JqhtfxZbGMXKsO/9A6gfJK9KsReRJnl871uHDANdvA+sFchQn6Mqq9dytP9r9cqwr9zr2wFRBp241mfE1OgavGCGsNy/TWEAkn2gbK7o5GQ6mgs96Jyr88zmWO8/TOf/0TqY33URWVHPn2/6qOfWGuyND/1vGsVqYNdM+pWavc3l4fKX6XzaxzMaVz102GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ajh9Z0MVBu5qh3Ib21Mn8SoQFvElkpIwNIztSbBBFc=;
 b=gL4+/0uTDhWoOpKJM+wqojVB9Pz4wlCza4u1jxwO9bPnhAn87dFTBmKX+9TqxQIFwyvsX9vVokTqjhbmSEbJIUJTUGc1boasCgZPb7wBITJ3kfoWtz4gjOc8a8bqyrGQ5XrhyPn3icsb83T5QuE587vczeUeGZbXxJNYyW2rtXU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2482.namprd12.prod.outlook.com (2603:10b6:207:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Tue, 15 Jun
 2021 16:15:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 16:15:59 +0000
Subject: Re: [RFC PATCH] drm/ttm: Do page counting after populate callback
 succeed
To: Felix Kuehling <felix.kuehling@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <ckoenig.leichtzumerken@gmail.com>
References: <20210615115746.27424-1-xinhui.pan@amd.com>
 <f70e88b3-f0db-fca8-f05e-f685f1a913ad@gmail.com>
 <4719A30A-0B23-4053-B8EB-AC9BD21DBE40@amd.com>
 <88115e0c-5cee-5b16-f60f-480136f0bcad@amd.com>
 <da147e95-e59b-3f38-2ba2-9f4447f7ea86@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4575e86e-8cb7-2d22-93fb-c1279c404a33@amd.com>
Date: Tue, 15 Jun 2021 18:15:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <da147e95-e59b-3f38-2ba2-9f4447f7ea86@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:791b:b5ea:2111:7d75]
X-ClientProxiedBy: AM9P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:791b:b5ea:2111:7d75]
 (2a02:908:1252:fb60:791b:b5ea:2111:7d75) by
 AM9P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 16:15:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3637518a-bd21-4402-626a-08d93018dcb2
X-MS-TrafficTypeDiagnostic: BL0PR12MB2482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2482BB665A72C4CC3A5B7B7283309@BL0PR12MB2482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Ar2r4nRryYNmygHziYAwuG9qgAk10bj56MzEHt+EXSuIddd+Wbmm5HXLXdzvJ4PEbLjVeM1STaNLtuTNb6Nn1I+hqWPlOPxkqwSn48+L2kDrbohbN+YYPqpi8bLPFjp6q6TK+ELdYI+GBzjh6+wiNb7XJVEk/9rXTtMckGeI/nz9GbXzSW7BmpY6oC+V7yhYuYa3mglTvKGl4sajN1DGnj4w0lv57jZaOvOHow4yKJwKxU7gE5CXbk/kf548woApG5dbxBfhp1SxCGG0Dt+zyVJV+jPlOWhVxquo3I9COzAn4ZRB71Sb7CW3lqdTsGgv9cDvrmzhaUPkn3C0V0Tijo7Gd8MqATYZwwpnQ/yTRtM3ojBI1K1k7oX6R0faKxEefqYWNwA9cLAGkAH2Mi+uXEtMtkNKL0ygw4B0vR/uC3EBxi04K6Sx2w8+5S50T5ql5ZK/xzGmN135hsitxtT5e6BSm8ZwhFWBNjHhVnvMER7Wx5j2+RQxobOQCv5Chh06RCpWbvlKQIrH4nWctE19DWzpmnSVQJbNpyJU6s9qWnemf6jG8Yo5RKvpql2DJUh8bQ8TjDMk57v5VoMFjeigVv5LkiVc5orEyWI8sXR+oKTu6HM4zY4xHkQ9rGQhMygjak3WoVlsCOc2uXHUF/cfH8aB8FO2bf7K0xTs5AYPO4tCDEScKQ95YIST3ITC1BW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(5660300002)(66476007)(66946007)(66556008)(4326008)(31686004)(6666004)(16526019)(186003)(38100700002)(2906002)(83380400001)(8676002)(66574015)(2616005)(31696002)(8936002)(86362001)(110136005)(54906003)(6486002)(36756003)(316002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0NCRUJLdUtlUzVqb3M1V1IxN2h0Q0sxVVlMQmtBZzdXa1lRWFNQSzFzMTdH?=
 =?utf-8?B?S2tMcktNOEk2QkM3enpxdERwZzh2TENpRHAwQ0svZi80VnNLQzE4V1BKd0Fy?=
 =?utf-8?B?aDBWMUp4b0QvRHZZQ09sa0JIVDRUUTlybjluVVF3MjdmWjRhSzY1cWxzRzIy?=
 =?utf-8?B?cVdvcXNBejVFaVc4bFNWUkF1cmhEUkNNTEFKVlZlR21vbjhHRENpV2VOZFBo?=
 =?utf-8?B?TGs1NG9rdlhMdjhFZFQ5ZUlweE5FYlJLRmhSMHE2L3dpVUs4NC9iOHNBajVs?=
 =?utf-8?B?R1A1dGFhZmtmcnpTSVdHNEYxbXdZMlFrVjRrdnRJV3YvK0F1WDJHVlQzV05s?=
 =?utf-8?B?V0c1VGlvM1A3cmp5MjhKODZjOVVKYkxiZDhWekF5SklsWWszdjZEUjRZR2dw?=
 =?utf-8?B?ck5iTUVPNWFDSWluM2ExcEdMSGIrNmRYc3Q2MGlWWEhMUzkrQWVxSUNQcjQy?=
 =?utf-8?B?c0RsN2V1emgzT1Mxa282Slo3ZlQzc2FNNTloZDdPMHdRRTNYeStvTDJrSDJo?=
 =?utf-8?B?a3d3VExQUVBQL1Bpa3VVeXpzREluenBvLzZSYkZRaHEyMmpWNE1USmRZZmRr?=
 =?utf-8?B?dkZYM2ZjQmJZNUJsZEtXQkNQSUt3Yk5ZWVgzMk1lOEpLei9weGk5bE9kRVJs?=
 =?utf-8?B?MDdicXRrdVRiK1puWW5LOEpZalRWYjVKcUI0SVpVd25EWFNhdk5hc3RaWE96?=
 =?utf-8?B?MkFaNlRmT2hqUnNveGkwTUxvYllMd2RZZlJWU2VLdkYxelFiY29VT0MyYklj?=
 =?utf-8?B?UXA2WW82STkwdnc1c0piOFNXL05WVitPTElBeXR5dTZWbVVncnpUdXAyWkRi?=
 =?utf-8?B?Zlg2dzBuSmhZS2xPSEpvOUVEWUhnaGRVZHhkSVU2bitNcHBrMlJWSk00b09a?=
 =?utf-8?B?dHUrUFAxWURROTg5YW5oVzZycWFkTmFkRXRCREhwWHZiWlVwbzNUcU9yWFli?=
 =?utf-8?B?NjVZTzhZdm5lazNNRCtCNm0vK3FxcHJRc3RSRnk4YTkvN2tUNk9GenVBeTE5?=
 =?utf-8?B?Y0xJK1dSM1hzcHZmZFgwZWNBekRFVktwa1VYMTUwWmlPMStSZGhaTHVhQjRW?=
 =?utf-8?B?VDNHR1A0bmp6VDA5a2VTYndyTURENDJ0K1BrMHhqOXR4VUtDUXJKNzJaZjQx?=
 =?utf-8?B?QW1rQTU2bEFoYWVobUJKQlpGSTRRR1krYS9hSXBabUhvZmtBelBGcnR3UW9X?=
 =?utf-8?B?V0hjbHQ4K0svcEdPanFnMXR3eDhHVFdFdVJuR29zQUt1MThFVlhvWGdXS0E2?=
 =?utf-8?B?WFZYNkRnODZKT0NDbU12U2ZHNjVaWUVvdUN6SVNHQU8xeUtFRm10Si9sSDNj?=
 =?utf-8?B?RTdqQll0MFVIcVJGaXFkdlFwVTBGTVN5RGF2aGI2dVFGejE1YWlFOHh2QUZi?=
 =?utf-8?B?aFp1Q1JldGs4OStvenZRVE05OW5YS1FkSnJVZ0lMTjBSa1FuUWZFelZmTFpZ?=
 =?utf-8?B?RjgvaVdIU0tCNFJWbG13dnBVcllsL2RwM1JyS0FlVGdPbDFkTS9yR2RUbU1O?=
 =?utf-8?B?b2QvZ054Z01WM0JoVXhTYk50TktYbVg3ZGgzbDYyNHJtclVNTDZ5UTNUYkJw?=
 =?utf-8?B?aGR5OWVjeDdDdGNDdnZ2NzV1RXREaHZJRDM5QXZYT3VWRUFZQlRla3FPYjhJ?=
 =?utf-8?B?OUZTOHNqN28zVVZvWmttZW9IT0Ivdzd3Rjhja2R2c2tGZmVtMFZmQ3VpS05J?=
 =?utf-8?B?akRySVB2VHpSdFQ5c3ZHb08xUmkrbnZIdHg0QW9meVNMWkpVVkxTb0c4NlNE?=
 =?utf-8?B?Nk9MMVhSQlZqWFQ4eWVUMENGTHE3QjlnWmdKUVYxSHk2OGJoZU81dzdGemdn?=
 =?utf-8?B?RzJvYWp3dmw4RXdQTDg3Ky9NbjJNT0ZIMXBNT3BNODZacVhrRWdVWjhyemYy?=
 =?utf-8?Q?PWEQ5MacW49Nj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3637518a-bd21-4402-626a-08d93018dcb2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 16:15:59.2051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPSeqc2YWd78MaQhtCpCaDFWS8LSBBEbgM1ndrJWQaBdKv3lfbIBOGPAd2+/s6CV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2482
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 15.06.21 um 17:06 schrieb Felix Kuehling:
> Am 2021-06-15 um 8:18 a.m. schrieb Christian König:
>> Am 15.06.21 um 14:11 schrieb Pan, Xinhui:
>>>> 2021年6月15日 20:01，Christian König <ckoenig.leichtzumerken@gmail.com>
>>>> 写道：
>>>>
>>>> Am 15.06.21 um 13:57 schrieb xinhui pan:
>>>>> Amdgpu set SG flag in populate callback. So TTM still count pages
>>>>> in SG
>>>>> BO.
>>>> It's probably better to fix this instead. E.g. why does amdgpu
>>>> modify the SG flag during populate and not during initial creation?
>>>> That doesn't seem to make sense.
>>> fair enough. Let me have a try.
>>> No idea why we set SG flag in populate years ago.
>> That's pretty recent IIRC. Felix moved the code around a bit to fix
>> another problem.
> I moved some code from populate/unpopulate to backend_bind/unbind for
> attaching and detaching dmabufs. I didn't change the setting/unsetting
> of SG flags for userptr BOs. That goes back all the way to 2015.
>
> As far as I can tell, this is needed because userptr BOs are not created
> as SG BOs. That's something I've also pointed out before.

Ah, yes. That's because we need the pages array for userptr BOs.

Then we should probably move that to amdgpu_ttm_tt_set_userptr().

Thanks,
Christian.

>
> Regards,
>    Felix
>
>
>> Christian.
>>
>>>> Christian.
>>>>
>>>>> One easy way to fix this is lets count pages after populate callback.
>>>>>
>>>>> We hit one issue that amdgpu alloc many SG BOs, but TTM try to do swap
>>>>> again and again even if swapout does not swap SG BOs at all.
>>>>>
>>>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/ttm/ttm_tt.c | 32 +++++++++++++-------------------
>>>>>    1 file changed, 13 insertions(+), 19 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> index a1a25410ec74..4fa0a8cd71c0 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>>> @@ -317,13 +317,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>>>        if (ttm_tt_is_populated(ttm))
>>>>>            return 0;
>>>>>    -    if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>>>> -        atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>>>> -        if (bdev->pool.use_dma32)
>>>>> -            atomic_long_add(ttm->num_pages,
>>>>> -                    &ttm_dma32_pages_allocated);
>>>>> -    }
>>>>> -
>>>>>        while (atomic_long_read(&ttm_pages_allocated) >
>>>>> ttm_pages_limit ||
>>>>>               atomic_long_read(&ttm_dma32_pages_allocated) >
>>>>>               ttm_dma32_pages_limit) {
>>>>> @@ -342,6 +335,13 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>>>        if (ret)
>>>>>            goto error;
>>>>>    +    if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>>>> +        atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>>>> +        if (bdev->pool.use_dma32)
>>>>> +            atomic_long_add(ttm->num_pages,
>>>>> +                    &ttm_dma32_pages_allocated);
>>>>> +    }
>>>>> +
>>>>>        ttm_tt_add_mapping(bdev, ttm);
>>>>>        ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
>>>>>        if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
>>>>> @@ -355,12 +355,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>>>        return 0;
>>>>>      error:
>>>>> -    if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>>>> -        atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>>> -        if (bdev->pool.use_dma32)
>>>>> -            atomic_long_sub(ttm->num_pages,
>>>>> -                    &ttm_dma32_pages_allocated);
>>>>> -    }
>>>>>        return ret;
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_tt_populate);
>>>>> @@ -384,12 +378,6 @@ void ttm_tt_unpopulate(struct ttm_device
>>>>> *bdev, struct ttm_tt *ttm)
>>>>>        if (!ttm_tt_is_populated(ttm))
>>>>>            return;
>>>>>    -    ttm_tt_clear_mapping(ttm);
>>>>> -    if (bdev->funcs->ttm_tt_unpopulate)
>>>>> -        bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>>>>> -    else
>>>>> -        ttm_pool_free(&bdev->pool, ttm);
>>>>> -
>>>>>        if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
>>>>>            atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>>>            if (bdev->pool.use_dma32)
>>>>> @@ -397,6 +385,12 @@ void ttm_tt_unpopulate(struct ttm_device
>>>>> *bdev, struct ttm_tt *ttm)
>>>>>                        &ttm_dma32_pages_allocated);
>>>>>        }
>>>>>    +    ttm_tt_clear_mapping(ttm);
>>>>> +    if (bdev->funcs->ttm_tt_unpopulate)
>>>>> +        bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>>>>> +    else
>>>>> +        ttm_pool_free(&bdev->pool, ttm);
>>>>> +
>>>>>        ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
>>>>>    }
>>>>>    

