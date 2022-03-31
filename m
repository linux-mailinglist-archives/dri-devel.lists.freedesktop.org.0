Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808564EE2E9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 22:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAC110E9D0;
	Thu, 31 Mar 2022 20:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99CB10E9D0;
 Thu, 31 Mar 2022 20:49:32 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 663461F472B4;
 Thu, 31 Mar 2022 21:49:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648759771;
 bh=euVVKOinX78LJMKrZP4o6rrvu4hdAz3jFyyNapFRAMg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aU+ySryv7hPIyjtk1t95Bj5UstgWJyj78s4NVbEyHDyWjwOtULLr7i2QvQwOftsYu
 mZIgLpZ6ebi8zPN2sXml8PlXsD5ECqjXsQfA3AIw85HoYC+2wtVXtR5kb8k726rBEE
 siqevoQ98XYD2sGobZMzx3fxt1bB3LiMrLqrJTBXlh75VzqVVnKCLV7Uk+xf2/GIX+
 ogEg+um7F6OVbP/BsCJe0Z9VvDLneQJCNxw2VqGYxHbxe/OWJmZqcUPQ/Xt7ITr/Wz
 lQ6xw9mkBmmD2bK1rMkryNPtbb/Fvj16gQ5ZMVynxb/nBa3J1zlJK2sivGTnxdRUp5
 xnAHZP6ZtCuxw==
Message-ID: <8b1aa75d-1de4-40d2-c80b-7d23605dd49e@collabora.com>
Date: Thu, 31 Mar 2022 23:49:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 07/10] drm/msm/gem: Rework vma lookup and pin
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220330204804.660819-1-robdclark@gmail.com>
 <20220330204804.660819-8-robdclark@gmail.com>
 <83979c7b-8a8a-5006-6af3-f3ca8b0d8ced@collabora.com>
 <CAF6AEGtEczCSzwMNcr2EJJ=OcncABC2ZM2dVpAYoJM+5TBTKXQ@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGtEczCSzwMNcr2EJJ=OcncABC2ZM2dVpAYoJM+5TBTKXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/31/22 21:58, Rob Clark wrote:
> On Thu, Mar 31, 2022 at 11:27 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> On 3/30/22 23:47, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Combines duplicate vma lookup in the get_and_pin path.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>  drivers/gpu/drm/msm/msm_gem.c | 50 ++++++++++++++++++-----------------
>>>  1 file changed, 26 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
>>> index deafae6feaa8..218744a490a4 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem.c
>>> @@ -376,39 +376,40 @@ put_iova_vmas(struct drm_gem_object *obj)
>>>       }
>>>  }
>>>
>>> -static int get_iova_locked(struct drm_gem_object *obj,
>>> -             struct msm_gem_address_space *aspace, uint64_t *iova,
>>> +static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
>>> +             struct msm_gem_address_space *aspace,
>>>               u64 range_start, u64 range_end)
>>>  {
>>>       struct msm_gem_vma *vma;
>>> -     int ret = 0;
>>>
>>>       GEM_WARN_ON(!msm_gem_is_locked(obj));
>>>
>>>       vma = lookup_vma(obj, aspace);
>>>
>>>       if (!vma) {
>>> +             int ret;
>>> +
>>>               vma = add_vma(obj, aspace);
>>>               if (IS_ERR(vma))
>>> -                     return PTR_ERR(vma);
>>> +                     return vma;
>>>
>>>               ret = msm_gem_init_vma(aspace, vma, obj->size,
>>>                       range_start, range_end);
>>>               if (ret) {
>> You're allocation range_start -> range_end
>>
>>
>>>                       del_vma(vma);
>>> -                     return ret;
>>> +                     return ERR_PTR(ret);
>>>               }
>>> +     } else {
>>> +             GEM_WARN_ON(vma->iova < range_start);
>>> +             GEM_WARN_ON((vma->iova + obj->size) > range_end);
>>
>> and then comparing range_start -> range_start + obj->size, hence you're
>> assuming that range_end always equals to obj->size during the allocation.
>>
>> I'm not sure what is the idea here.. this looks inconsistent. I think
>> you wanted to write:
>>
>>                 GEM_WARN_ON(vma->iova < range_start);
>>                 GEM_WARN_ON(vma->iova + (vma->node.size << PAGE_SHIFT) > range_end);
>>
>> But is it really useful to check whether the new range is inside of the
>> old range? Shouldn't it be always a error to change the IOVA range
>> without reallocating vma?
> 
> There are a few cases (for allocations for GMU) where the range is
> larger than the bo.. see a6xx_gmu_memory_alloc()

Ahh, I didn't read the code properly and see now why you're using the
obj->size. It's the range where you want to put the BO. Looks good then.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
