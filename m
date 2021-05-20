Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6838AC44
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 13:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4922A6F3FB;
	Thu, 20 May 2021 11:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2A96F3FB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 11:37:49 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id et19so17673711ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YU7uy+eLr3JgvI0Mg+wNNHPaABadqB4/+n4tkR57F+U=;
 b=sy3e6y4oO9T6b8KGNTSlXW3UJ/9ArPgWQdD7pVfK4aE4M55Iq7qZZJX/RemBZynnGa
 52aJHotILFJ75GuaniWpPfF2u4InijILQKvE1kol1+R6mZqijKPwgyzNJDywloux19SE
 FulNoaIqgZe9VoMKnWAIvCqYknTD/r+zI3MrOjgxQ353ebnwV3l4N9kYy/LnGkkfBeY3
 WyMG1yXs9w7ldbG6I4QJMUb9iGx1apjnX4JfhmqYnTvRindZWQD+8OYzGr9M1aXLh9Dt
 DWEa9YrElqjSQTi+2ubL+qSjQAZkCRDcGCH/Nm1fMR8FCI7pdtz+esruU2wwG9ywbSuw
 L6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YU7uy+eLr3JgvI0Mg+wNNHPaABadqB4/+n4tkR57F+U=;
 b=bvd3g1B7GXoXV0EJq5PNtssPrcOrYy7E9jGFHUnHB6xO2Hu9bkCAn54nxODh81xwL5
 33IYwpV1EBM/aVxVG2LssWZHdCwteLiJiIBXMIsaBfaVnTYK4TOjKJQvAWmFjW7HiWAf
 DgTbggnYpAGpWuIRRWMUbMqlEvi3CgvOLTFAdqaosBD8DymvQAZ064LPFop1IKAwhvj6
 YrYP6owUJvwpcKkNvpIq3Jg7bRH5+Co1otGXbPQpIGoW1llKCGFaUniOlImWbNHYR9Rl
 I+tduQjK+DItKdwyJqo0Y5jZ+oKQGzGnBgpqIT5ikXQ6aBvgvTtD64jzzb/7EsvHiByb
 sKIw==
X-Gm-Message-State: AOAM533tw7BK3PCC9UKD//Bm/RVwlZakq/7O/R1ei9pxXbZzSo7VoIO0
 63L85ORWgBQXu4KNLqrAm96aUDBKdpo=
X-Google-Smtp-Source: ABdhPJwPku/XxIofkvipXBJ0frLNj8I21MkPqDawsE3bjXbjlbtFV1ip7VmkfXerfz57fD/+E8iPvw==
X-Received: by 2002:a17:906:e2d9:: with SMTP id
 gr25mr4329387ejb.373.1621510668312; 
 Thu, 20 May 2021 04:37:48 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a?
 ([2a02:908:1252:fb60:4635:589e:67a4:e02a])
 by smtp.gmail.com with ESMTPSA id s2sm1381221edu.89.2021.05.20.04.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 04:37:47 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix unintended pin/unpin warnings
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <20210517115705.2141-1-christian.koenig@amd.com>
 <CADnq5_O7EBT7tdsuq00K-T2j=HEq34hLEpsbME4157wcGZyTBg@mail.gmail.com>
 <YKKERxNX+OmIgwlL@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a7396a42-995a-80bf-4f51-c203a62096e7@gmail.com>
Date: Thu, 20 May 2021 13:37:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKKERxNX+OmIgwlL@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.05.21 um 16:57 schrieb Daniel Vetter:
> On Mon, May 17, 2021 at 10:09:13AM -0400, Alex Deucher wrote:
>> On Mon, May 17, 2021 at 7:57 AM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> DMA-buf internal users call the pin/unpin functions without having a
>>> dynamic attachment. Avoid the warning and backtrace in the logs.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Bugs: https://gitlab.freedesktop.org/drm/intel/-/issues/3481
>>> Fixes: c545781e1c55 ("dma-buf: doc polish for pin/unpin")
>>> CC: stable@kernel.org
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Hm this means we're losing the dma_resv_assert_held check, do we have that
> in amdgpu callbacks to make sure we're not accidentally breaking stuff
> later on?

Mhm, well this is just for calling the pin/unpin internally from the 
DMA-buf framework itself.

Need to double check, but I think all those cases either have a 
dma_resv_assert_held() or are locking the reservation themselves before 
calling the function.

But yeah, rather good point.

Christian.

>
> But yeah lgtm, Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>>> ---
>>>   drivers/dma-buf/dma-buf.c | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index f264b70c383e..eadd1eaa2fb5 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -760,7 +760,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>>>
>>>                  if (dma_buf_is_dynamic(attach->dmabuf)) {
>>>                          dma_resv_lock(attach->dmabuf->resv, NULL);
>>> -                       ret = dma_buf_pin(attach);
>>> +                       ret = dmabuf->ops->pin(attach);
>>>                          if (ret)
>>>                                  goto err_unlock;
>>>                  }
>>> @@ -786,7 +786,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>>>
>>>   err_unpin:
>>>          if (dma_buf_is_dynamic(attach->dmabuf))
>>> -               dma_buf_unpin(attach);
>>> +               dmabuf->ops->unpin(attach);
>>>
>>>   err_unlock:
>>>          if (dma_buf_is_dynamic(attach->dmabuf))
>>> @@ -843,7 +843,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>>>                  __unmap_dma_buf(attach, attach->sgt, attach->dir);
>>>
>>>                  if (dma_buf_is_dynamic(attach->dmabuf)) {
>>> -                       dma_buf_unpin(attach);
>>> +                       dmabuf->ops->unpin(attach);
>>>                          dma_resv_unlock(attach->dmabuf->resv);
>>>                  }
>>>          }
>>> @@ -956,7 +956,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>>          if (dma_buf_is_dynamic(attach->dmabuf)) {
>>>                  dma_resv_assert_held(attach->dmabuf->resv);
>>>                  if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
>>> -                       r = dma_buf_pin(attach);
>>> +                       r = attach->dmabuf->ops->pin(attach);
>>>                          if (r)
>>>                                  return ERR_PTR(r);
>>>                  }
>>> @@ -968,7 +968,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>>
>>>          if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
>>>               !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>>> -               dma_buf_unpin(attach);
>>> +               attach->dmabuf->ops->unpin(attach);
>>>
>>>          if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
>>>                  attach->sgt = sg_table;
>>> --
>>> 2.25.1
>>>

