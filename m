Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEC1579422
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 09:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECA410FE53;
	Tue, 19 Jul 2022 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CA310FE53
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsS3CxEomjT9QEdIVqShjYIpHPCUIQM6m6gQSsqCrjSX7AHKT865uja0iQQ6OpN9Bm8emzZOP9UITw6wnXDZwFdu++7ElTVDYtMY/m/mqMzm/chJcFsxfQ9Dt6rADG5rL1vKU+f6VF0NhBzZYyV9JYiO6IcTZ2Suf5LuYZ55BPxqxbwL+e00Mam+GdLXJOfVtr5Xao4is01a4FiIATgCcBJ/yDgV26CvzA6IcUVXluWvTGxwjTdJgjAaWgqD+XAuNUtehuJI7fGw4QR2iQgtqa6SdoJb2PJxstfasx4W50AD1QdIX7/JMuNFd7Y8gEqfAUSTe6YvUAFsTcyREozUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFZLhxr0fdQ3h38cgG5ZdYNc5jZIMqeeO2wK3dfkW10=;
 b=iY7km2FBpPHQEYyHU8NjNwzaz6XCvhKj83Cc5XOtGs7VesxxbjiTETcM5cJuH+p9LV+/X+f+XoGwj5HKBCTPtPzKvvzn8IFx+zIkeUsGXkLkoF1LRp7zV3YrRgE+MCpvBsRxZHuLHCy+ebbvuap4M2hj/vgE+CuRz1TuTJhs9VgXCnwi3NciMwKfgSdyS7eXgGQ/v7Lwi9Pz1XnZkKfXd4PNHh+wX6lOg/j2oV4yKBS6Eu562l4l8TtJ8yOJtLIhdl2cXm6UHasg7mTzwOeUrJvVBXaj2PqfF865FZviSIU7jyuoQrydCIHcHa5RN+QfxZKwov4gJxJXiS5jUmRcEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFZLhxr0fdQ3h38cgG5ZdYNc5jZIMqeeO2wK3dfkW10=;
 b=zQeDrgF7y9IQLxZt0wFcIOFLt0QhDna5MYkvKtJYsRxOhFNqOTuFm/Ts5o1SKKxhuJ7Qif23DcGdsWCX6nTOQpdeYGYcbQI2NXSh4HnYdVAVhfrHxuQdyzqq6an5xpxdU1gzvvTJ0kJ6dL5KPD9ceAyMLHvlj1IEBpLSa0tnloE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6334.namprd12.prod.outlook.com (2603:10b6:8:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 07:27:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 07:27:16 +0000
Message-ID: <e616a8be-8936-9e15-1139-fd99152fea1e@amd.com>
Date: Tue, 19 Jul 2022 09:27:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220715111533.467012-1-christian.koenig@amd.com>
 <e71431ef-bcb9-012a-ff0d-4ef350cd232e@suse.de>
 <5bdedd05-3620-5082-1e6f-c3f6bbae9cc5@amd.com>
 <55a2564c-d4fa-dbcc-a33a-3148a7de386c@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <55a2564c-d4fa-dbcc-a33a-3148a7de386c@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 265e05ed-03a6-4364-7ef4-08da69581b63
X-MS-TrafficTypeDiagnostic: DS7PR12MB6334:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7SMo842o3q2WWuNcWAYTilGP12qwANMZcCnVesmLfYWpu0CC3kymqxFXiTySFmd1f5Q2jYbE6lj/3BAC/DhYi9suAoQ8YRZErACN1FiKoHxrw06Z3PgZxYHozMrzYiAhg5F+Ab1c/e8YEME53vMdfwuecn9cP5iksY+qEsfNFsOthGObC4ZGaaAJ14tGZsMEDYTC16oSYSPov0oDT2yulcp7OcYoTmeqmaMBAQIS73+fEKnvr8ZF35II35b2NHaVZTQLhJd7BzvMwfeukI8vlxvXyN+3jKaWQR8/N1/ifPtToH8ZuQlECPKML6CeRt5F2RIto+tEOiG7wmC3DWW0bIomJgos31SjKkEp/qZYIgTOBIndRBch/OsR1yFKuMZf8nIccIDwDuhASRCt+K+0xXfioX+2fE6wkiwNyn0RHl3LGzv7TDzKOecBo2LfgEBiBjXBkNxA+AXUbu5+oMF4DrJrS6257oX3rltBFKvkuk6hTJheBLatcgSxfv4Ers3q6Ydfk3Xb4FLxpu41vV3XjepryvYW7gOGwst3WvYblx+6MEZtX4RdCSRA9HwUzFxE5AvI47kUG3pAeMPXNYnoMvAxFX/6DTFwBEoh2Oiusg6Ixe04rZ9uHje0EeGYOb1VyJLdI5bfILp0ZsOEX8EnixtZg/sXKBR2KDfIlK44jc2+P/xPlUuHUn8OvnbGtfmbvRX/CD2t6/exZe98dSeH85RLyI43KIBSKc338mSVtf9iTbeYyUmG3NpJM9LeFVW+wjOmFCDp7SmYQu39Q3eaX1PozMLKgn2gPFF8ilsgt+4hueYmjqqRTv+x8FJWIN1cIpCz8jJcmg9RgdE5OjzchkbjpRfm01EFvbi9gjavpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(2906002)(66946007)(66556008)(8676002)(4326008)(66476007)(2616005)(5660300002)(966005)(66574015)(186003)(478600001)(6512007)(8936002)(6506007)(41300700001)(6486002)(31696002)(86362001)(110136005)(36756003)(31686004)(316002)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dytDY2ZOWDlDWncrNlJFUEVxQzRrZzRETGY4M1JJVUN6R2NJWUV0eUhlRTdi?=
 =?utf-8?B?MGpRZDV2YmtER3N6bVRPL3p4YVhFYTlDYTVvVDNITENmb0V2K085eEhrKzF2?=
 =?utf-8?B?S2gvWEFOWE9vNUtCbmoxWHF0S1VZcktrKzFrOEY4Yk5JV2piaWl4UVgxYXZh?=
 =?utf-8?B?WUhhMHZ2cEhjb3FSdDRveU1LSE1hTmliOW1xMEtBSlBaSDJMTHdXRlUvNUxz?=
 =?utf-8?B?eEJBVWNuSEgzV0c1bVI1TE5nWVRHVUdSS043Q3FiY3V6bWd4YTZlWlN1cjJu?=
 =?utf-8?B?T0t3b3R1YnBqTnRVRFlMdFRrbktrVjJCekJvWVJ0dFo3Y2czVmYzMzVGclRO?=
 =?utf-8?B?V2l3aXhkc1JrQTlPb0htWjFFQzJWZWhXbWZrNkxTOVZwWWpUWXdBSEczMSt4?=
 =?utf-8?B?K2c2cjQzejhRVkl4T21DWVFSUzFEbDhGVThUTGxxaUtMWSsvU2t1ZjNQWng4?=
 =?utf-8?B?NmEvT1NyRFZQdXFVdGRsRW1abTBKNjdHaDFLTTdSSkx6V1RHVE9mMTBkMnRQ?=
 =?utf-8?B?aURxWnBnaEpabFJIRHBDY2txS1lMeVJVT1dDTCtWbWZ2TWJ3S2trV0VMbThR?=
 =?utf-8?B?eXdHQzRscDVZZFpqS0o5bUltaGtHb2dROGQwYkVLRDJLcksyQXhaNDFLNDhN?=
 =?utf-8?B?Vkh4YXRkSUloL3lGelFUai9IV1NReTNiNktkSFk3aTF2dXN3SExDYnQ3Y21T?=
 =?utf-8?B?QTM3ajhBbXBHcmMraGl4czYxOVZZbFRMbFhUZVdYZCtKR3BHZUc2a05nQUE1?=
 =?utf-8?B?VHRlSTVxZ293WE5JM1dIY2dITnhGcjNRUUd4bi9RMmsxZEJJdWRiTmlPMFBK?=
 =?utf-8?B?UmZGdDZmYnFwaVJNTzJoYmhvVHJkOTN4RnNnT0pWQjZuMENzYW93QWg3K2dp?=
 =?utf-8?B?cEpZbUhCZFRsdHR6d2FHNm9rUGR0QlRLMFE4NTVneDROOGVJR05IRjNwOGNR?=
 =?utf-8?B?UWFiaTUyajBtS1hnQ3RPY0ZWMFZZS0RMZHRobDY2TXhTL0l5cmUvSFcvaDNn?=
 =?utf-8?B?ME1XWnAzS0c0U3hTZ1JpSmV3TmFVc0RON1pJdVRhUVY1cDRYeFNUQytiS1VE?=
 =?utf-8?B?ZUpzdHdXaXNyTnJBSzdxb1pxR01PRmhXOUlUZHRCN1FLek4veHBhY3JuZDJo?=
 =?utf-8?B?WjVVNFo0SWJzNVdTRDRLSElzRDZybWpRemVmbmVqc0pLemhVVUFkZ01CQWZV?=
 =?utf-8?B?Q3JFSzhwVmN5cERsaFdZTnVtSlBwSGZyWC81c1ZsYWV5cU15REJSWUJlQVNq?=
 =?utf-8?B?eXJURks0cENaUjVINkFraS9ac0wzVTZXaWZmbElHdjRrREpCKzR2Z3oyK090?=
 =?utf-8?B?UVBKNUZEc1Y2SGVFRjlCQTlOUGM4NTBvWExSeEdUSVlZZDJ0aktUNU9TZ1NI?=
 =?utf-8?B?Rk1BRDNyY2ZwNy8yN3o2NndjSVYyV2Jqb2hMbXFmdWRrMlkrT24vMGNHTFRm?=
 =?utf-8?B?QSt3NHZpNFVrK1k2ZmlQR0VFQ3BYOTB5d0NGMHFWOHdMWkErMzdEQ2NCSEUz?=
 =?utf-8?B?NFlIV3BmOHE1Z00rVFd0N0taQndnTlR0MkV5eUlxaHNkUnhEb3VIY3diREtz?=
 =?utf-8?B?SXhOWUFlcFhaem9wV1FuVmlUTDZtSXJreml1SCsxTkVFY3dHQTN2YkhTWWJJ?=
 =?utf-8?B?NnVtMlBpWUlkSVR4cm54Q090NUNXaTEyMkNYbUhrTVJ0aTRTNCtBaVlLVGl3?=
 =?utf-8?B?TVlNckNwc1pwWmkvTlhaMnRSV2RFWjNqekRnclJqWTlwUVFlSnlpS2ZscU5I?=
 =?utf-8?B?UzRqZ2pJYStQTmhEVXdSMDZpWkNOVWhvSnB1QzBEcUZwQU96eFEwT3FzUDRs?=
 =?utf-8?B?ZkdOM0NNVmVEakc2Wk9NUW1wekJvNHpacDVaVitxU29adktzKzNIdm8xU0ky?=
 =?utf-8?B?MlN0TC9ISXBIK0s5MWkxSHNrUmRUdkRNUHRyWWlCNkw3c0pzM09TTytOQUJp?=
 =?utf-8?B?MFltTnY3N3pDeHN2Zis3ekZCelNCb2tFNyt3eVdQZUlvL0Q5T3JnelliZnZN?=
 =?utf-8?B?VXpUemhuV21tWVZpV2dNTFJualZmZ0c1VUZ6ZmtlOVhoaEdqR3FHTUx1c2xV?=
 =?utf-8?B?ejRsSXNhZmhmWThXT0kvZmFZRjk5NGt2QWxJRUtFa25VUFhqcDZhTTdXdDBa?=
 =?utf-8?B?QWM5Y3ZzK2EwVXVWRHVFQzFZTUg5TXBqekxvZkFWN2Mwb0E5Yy8zeUdWaGtG?=
 =?utf-8?Q?HkyB+VPfEdduYYIG7dpoBdc/CwbfLNgaBlUE8GPOplv0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265e05ed-03a6-4364-7ef4-08da69581b63
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 07:27:16.5765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6Q4UgIVBg6dwXh6YY4WjHWRXNmpg4B5H5pSkzAlJFyuwFugcDOinLo+rqDgtkTD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6334
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
Cc: dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.07.22 um 09:19 schrieb Thomas Zimmermann:
> Hi
>
> Am 15.07.22 um 17:58 schrieb Christian König:
>> Am 15.07.22 um 17:36 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 15.07.22 um 13:15 schrieb Christian König:
>>>> I've stumbled over this while reviewing patches for DMA-buf and it 
>>>> looks
>>>> like we completely messed the locking up here.
>>>>
>>>> In general most TTM function should only be called while holding the
>>>> appropriate BO resv lock. Without this we could break the internal
>>>> buffer object state here.
>>>
>>> I remember that I tried to fix this before and you mentioned that 
>>> it's not allowed to hold this lock here. It would possibly deadlock 
>>> with exported buffers. Did this change with Dmitry's rework of the 
>>> locking semantics?
>>
>> No, can you point me to that?
>
> I thought it was somewhere in the lengthy discussion at
>
>
> https://lore.kernel.org/dri-devel/20201112132117.27228-1-tzimmermann@suse.de/ 
>
>
> but now I cannot find it any longer. :/
>
>>
>> My assumption was that drm_gem_vmap()/vunmap() is always called with 
>> the lock held, but Dmitry's work is now suggesting otherwise.
>
> IIRC the lock was supposed to be held, but every drivers does it 
> differently. And dma-buf locking essentially worked by chance.

I guess we where just lucky that nobody moved the BO while it was being 
mapped.

I've now pushed the patch to take the look to drm-misc-fixes. If some 
call path really called this while already holding the locks we will 
obviously run into trouble, but I think that should be pretty easy to 
sort out.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> We certainly need to hold the lock when we call 
>> ttm_bo_vmap()/vunmap() because it needs to access the bo->resource.
>>
>> Thanks,
>> Christian.
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>> Only compile tested!
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> Fixes: 43676605f890 drm/ttm: Add vmap/vunmap to TTM and TTM GEM 
>>>> helpers
>>>> ---
>>>>   drivers/gpu/drm/drm_gem_ttm_helper.c | 9 ++++++++-
>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c 
>>>> b/drivers/gpu/drm/drm_gem_ttm_helper.c
>>>> index d5962a34c01d..e5fc875990c4 100644
>>>> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
>>>> @@ -64,8 +64,13 @@ int drm_gem_ttm_vmap(struct drm_gem_object *gem,
>>>>                struct iosys_map *map)
>>>>   {
>>>>       struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>>>> +    int ret;
>>>> +
>>>> +    dma_resv_lock(gem->resv, NULL);
>>>> +    ret = ttm_bo_vmap(bo, map);
>>>> +    dma_resv_unlock(gem->resv);
>>>>   -    return ttm_bo_vmap(bo, map);
>>>> +    return ret;
>>>>   }
>>>>   EXPORT_SYMBOL(drm_gem_ttm_vmap);
>>>>   @@ -82,7 +87,9 @@ void drm_gem_ttm_vunmap(struct drm_gem_object 
>>>> *gem,
>>>>   {
>>>>       struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
>>>>   +    dma_resv_lock(gem->resv, NULL);
>>>>       ttm_bo_vunmap(bo, map);
>>>> +    dma_resv_unlock(gem->resv);
>>>>   }
>>>>   EXPORT_SYMBOL(drm_gem_ttm_vunmap);
>>>
>>
>

