Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18FF5B1604
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 09:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9AC10E996;
	Thu,  8 Sep 2022 07:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6426C10E996
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 07:51:27 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z8so23085999edb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 00:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Dy+epp2qa3xjff7m5N8gL/SUH9acy7thZi9m9SWmFpQ=;
 b=FOeptOd+3vckQSCHt9VO16dzghrHHgsrglYYKuv5aI7qyXrM0XK2qEAh2NrTyfwqeO
 QO0jII8z4gpV0h/ge/WJH9Q4FwH+5MCgv3RDBG2M+zRcjVtwNwsfsVv2H6rbZEQpjMt5
 0CzlmoDrAKdnig1vC0QEjs879SOFJeE12sqqoIh13c+/ni56nP5PTEXNk881c8xpvqD4
 UliccszhHTteSWHh+l6Lv/kT9BMqGEkKhKjKcR7uh/lBUi23MMwWTj5Xbjp9G7sLmNAp
 vAiZ3bCk3glYW5u+cLQBYMoNS80068IFlsgPP58aLDiAm6GJyheImmPWVJ0qpzoyVeBT
 8/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Dy+epp2qa3xjff7m5N8gL/SUH9acy7thZi9m9SWmFpQ=;
 b=24haAF1EvYHkxTv5fR8w1weIF6IetZU8yQmMmDo55RX8RTo+u+DDxV7Cs3uP2p+MBC
 aDDdXYXFV9ogy2Kaxr6cVv5SEEgzTMtQ2OEuEqaIr8YY0AJ1v1mASG9ROdsdTOIP36SQ
 2IxlC9MJFsiBAYZLlQzCT1TeIMmYyPBxBJ/i7IqJE3LEDb9a4r1MT/QozqwmaCPEtTqa
 b5FdvAPyv5JR6m5J5kmTpSOo8bXpOrvTenqRYkhF1L/Tiby/k7vH/jIXn/czZ8183Iwd
 Dammu4ec+FmB9SyDSbjf08uQbSkGX5lYHTSa3ShPn0vQfvWtu6Y+POOGap5geRdv/xfo
 FewA==
X-Gm-Message-State: ACgBeo3yaBt6iqiJKAEYedI/nlVaCTa2b86u/sMfTOdQKmMlzem9jwO+
 QR69wtq9g3Q1REQArw3fz80=
X-Google-Smtp-Source: AA6agR50YIEFZ+c9YTzYOnlvY4zrwv4s55Mogzp24rCGr3rsot3PiOygxdmNqUeaqCFWacQZqN12iQ==
X-Received: by 2002:aa7:c9c2:0:b0:440:b458:9403 with SMTP id
 i2-20020aa7c9c2000000b00440b4589403mr6005575edt.132.1662623485882; 
 Thu, 08 Sep 2022 00:51:25 -0700 (PDT)
Received: from [192.168.178.21] (p4fc20f4e.dip0.t-ipconnect.de. [79.194.15.78])
 by smtp.gmail.com with ESMTPSA id
 k17-20020aa7d8d1000000b0044e937ddcabsm6967310eds.77.2022.09.08.00.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 00:51:25 -0700 (PDT)
Message-ID: <b487ad2f-74f0-4c76-b051-421733ca493e@gmail.com>
Date: Thu, 8 Sep 2022 09:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: cleanup the resource of ghost objects after
 locking them
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220907100051.570641-1-christian.koenig@amd.com>
 <CAM0jSHMPbT1c=NZu+aj8iJ07Qz511K8mpC+g9ez9XTTX6b+8cw@mail.gmail.com>
 <CAM0jSHM-Ozk6zWCirTH_9Ukz2SLiA8qX1pJ0+ZbELOUYdp5UDQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAM0jSHM-Ozk6zWCirTH_9Ukz2SLiA8qX1pJ0+ZbELOUYdp5UDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: ZhenGuo Yin <zhenguo.yin@amd.com>, jingwen.chen2@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.09.22 um 09:46 schrieb Matthew Auld:
> On Wed, 7 Sept 2022 at 11:26, Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
>> On Wed, 7 Sept 2022 at 11:00, Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Otherwise lockdep will complain about cleaning up the bulk_move.
>>>
>>> Not even compile tested.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Looks reasonable to me,
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Christian, are you going to go ahead and push this one?

Pushed. Thanks for the reminder, just forgot to do that yesterday.

Christian.

>
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 10 +++++-----
>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index 57a27847206f..911141d16e95 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -236,6 +236,11 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>>>          if (bo->type != ttm_bo_type_sg)
>>>                  fbo->base.base.resv = &fbo->base.base._resv;
>>>
>>> +       dma_resv_init(&fbo->base.base._resv);
>>> +       fbo->base.base.dev = NULL;
>>> +       ret = dma_resv_trylock(&fbo->base.base._resv);
>>> +       WARN_ON(!ret);
>>> +
>>>          if (fbo->base.resource) {
>>>                  ttm_resource_set_bo(fbo->base.resource, &fbo->base);
>>>                  bo->resource = NULL;
>>> @@ -244,11 +249,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>>>                  fbo->base.bulk_move = NULL;
>>>          }
>>>
>>> -       dma_resv_init(&fbo->base.base._resv);
>>> -       fbo->base.base.dev = NULL;
>>> -       ret = dma_resv_trylock(&fbo->base.base._resv);
>>> -       WARN_ON(!ret);
>>> -
>>>          ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
>>>          if (ret) {
>>>                  kfree(fbo);
>>> --
>>> 2.25.1
>>>

