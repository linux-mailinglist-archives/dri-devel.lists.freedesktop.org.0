Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130245F025D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 03:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF9110E189;
	Fri, 30 Sep 2022 01:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4106A10E132;
 Fri, 30 Sep 2022 01:48:23 +0000 (UTC)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MdtKv0SxFzHtnP;
 Fri, 30 Sep 2022 09:43:31 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 09:48:20 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 09:48:19 +0800
Subject: Re: [Freedreno] [PATCH -next] drm/msm/msm_gem_shrinker: fix compile
 error in can_block()
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20220929093022.2428520-1-yangyingliang@huawei.com>
 <6504933c-048d-310a-1651-58528f868bdb@quicinc.com>
 <CAF6AEGvKFF+xrz0y39d0YU9+0empuMCqq2zF3Qtrjkk_oyxdUw@mail.gmail.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <e6b58363-5a45-245e-05bf-d230950948e2@huawei.com>
Date: Fri, 30 Sep 2022 09:48:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvKFF+xrz0y39d0YU9+0empuMCqq2zF3Qtrjkk_oyxdUw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 yangyingliang@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2022/9/30 4:38, Rob Clark wrote:
> On Thu, Sep 29, 2022 at 4:51 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>> On 9/29/2022 3:00 PM, Yang Yingliang wrote:
>>> I got the compile error:
>>>
>>>     drivers/gpu/drm/msm/msm_gem_shrinker.c: In function ‘can_block’:
>>>     drivers/gpu/drm/msm/msm_gem_shrinker.c:29:21: error: ‘__GFP_ATOMIC’ undeclared (first use in this function); did you mean ‘GFP_ATOMIC’?
>>>       if (sc->gfp_mask & __GFP_ATOMIC)
>>>                          ^~~~~~~~~~~~
>>>                          GFP_ATOMIC
>>>     drivers/gpu/drm/msm/msm_gem_shrinker.c:29:21: note: each undeclared identifier is reported only once for each function it appears in
>>>
>>> __GFP_ATOMIC is dropped by commit 6708fe6bec50 ("mm: discard __GFP_ATOMIC").
>>> Use __GFP_HIGH instead.
>>>
>>> Fixes: 025d27239a2f ("drm/msm/gem: Evict active GEM objects when necessary")
>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>> ---
>>>    drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
>>> index 58e0513be5f4..6a0de6cdb82b 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
>>> @@ -26,7 +26,7 @@ static bool can_swap(void)
>>>
>>>    static bool can_block(struct shrink_control *sc)
>>>    {
>>> -     if (sc->gfp_mask & __GFP_ATOMIC)
>>> +     if (sc->gfp_mask & __GFP_HIGH)
>>>                return false;
>>>        return current_is_kswapd() || (sc->gfp_mask & __GFP_RECLAIM);
>>>    }
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>
> Somehow the original patch didn't show up in my inbox, but I've sent this:
>
> https://patchwork.freedesktop.org/series/109255/
When __GFP_ATOMIC is not dropped, if __GFP_KSWAPD_RECLAIM is set,
it allows sleep(can_block() returns true).
In your patch case, if __GFP_KSWAPD_RECLAIM is set but 
__GFP_DIRECT_RECLAIM is
not set, it don't allows sleep(can_blcok() returns false). It's 
different from earlier behavior.

Thanks,
Yang
>
> I guess __GFP_HIGH could also be used to detect GFP_ATOMIC, but
> checking that direct reclaim is ok seems safer (ie. it should always
> be safe to sleep in that case)
>
> BR,
> -R
>
>> -Akhil.
> .
