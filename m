Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7EC4E5218
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 13:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7846B10E087;
	Wed, 23 Mar 2022 12:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D90010E087
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 12:20:36 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id o10so2499363ejd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 05:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FH7q1M6u1Ke+7Uv9e/P9axveCS/IQGF2jSJm+AAYNKw=;
 b=LPZOY8nsO4zTqJZXrjUUUPv2hftLUIYV5O1E/iysBAWvGuZ4nB/fhOJNrXa/NXw8lE
 5aJbPYpMYxbTjbR835xDX1ZOQWL0IuvVwiawrpSsUTC8rVwcRC57gaa24IQttrGLW0fp
 Zf+4FJP9yzxDYEyLdIPylbZvl7yFadmP1vKrAcE2Jvnu89YRphsWvgnJ0p/nx8Za3h+Z
 iGyM44Gj/WjrVe6WWFMGFJ5WRLT33S1zJiP+x4GRhta8B4kGJPtiCUIymnzJxRWyJ99N
 53Ztu1cEL28criKeJVG9JKyygWCAEKO/s4LFCX/z7dSGj5Kg5LFjcr1I9eqjhRzQevhr
 7V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FH7q1M6u1Ke+7Uv9e/P9axveCS/IQGF2jSJm+AAYNKw=;
 b=Yh0JnVOV8oLpGigw4hph8QxY9XdBbJYkkZGFfkvA+PtoDJ7IuPCLO6l6CZd8ZdStS4
 HPJO6YDYEXqi91ZSZ5psDspALDonXNceawcXtFsimwwA1OuBS8DUToM68sgpS0sK5T2H
 JRgqg4N//ObOK8V6LUC3zCIK94rAtRzgPnOpjACbtuxpjYm3cBZPIeZLORagALfrL7WR
 MzsteIWI1Ki1X2NL0qHgsU62cGZtiVZMljFDSEHwKKutUysUyOdhCgqR3/5gTnWc6ZWa
 lqzl1QheLpTJVm/w1HUpIOOB27EooSD1FvK+sDRKR1g0LRnczH1d8q1tEk3mXpQHFPxB
 jWIA==
X-Gm-Message-State: AOAM5338oLwW8BKQ+qOWQ6iVJl5c0RFay5kQU0CXsSrHtR9vnaU8/LHn
 dJt1/awNT0UuD6BqRpNhOzM=
X-Google-Smtp-Source: ABdhPJyHZkLOpye/GIEdtYe4FZSj1s6bmxJ2wTxU+j/A3FMw92erGKovsDSDmoysSIse9l8jNgIFRw==
X-Received: by 2002:a17:906:16cc:b0:6ce:e607:ff02 with SMTP id
 t12-20020a17090616cc00b006cee607ff02mr30916373ejd.418.1648038034647; 
 Wed, 23 Mar 2022 05:20:34 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 ch26-20020a0564021bda00b00418f99695f0sm9428229edb.23.2022.03.23.05.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 05:20:34 -0700 (PDT)
Message-ID: <85c4c3bd-bdc8-83ea-f27e-ce6da141daf2@gmail.com>
Date: Wed, 23 Mar 2022 13:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/6] drm/ttm: move the LRU into resource handling v4
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220321132601.2161-1-christian.koenig@amd.com>
 <YjsLkqGEnre4JKkR@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YjsLkqGEnre4JKkR@phenom.ffwll.local>
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
Cc: felix.kuehling@amd.com, matthew.william.auld@gmail.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.22 um 12:59 schrieb Daniel Vetter:
> On Mon, Mar 21, 2022 at 02:25:56PM +0100, Christian König wrote:
>> This way we finally fix the problem that new resource are
>> not immediately evict-able after allocation.
>>
>> That has caused numerous problems including OOM on GDS handling
>> and not being able to use TTM as general resource manager.
>>
>> v2: stop assuming in ttm_resource_fini that res->bo is still valid.
>> v3: cleanup kerneldoc, add more lockdep annotation
>> v4: consistently use res->num_pages
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>> +/**
>> + * struct ttm_lru_bulk_move
>> + *
>> + * @tt: first/last lru entry for resources in the TT domain
>> + * @vram: first/last lru entry for resources in the VRAM domain
>> + *
>> + * Helper structure for bulk moves on the LRU list.
>> + */
>> +struct ttm_lru_bulk_move {
>> +	struct ttm_lru_bulk_move_pos tt[TTM_MAX_BO_PRIORITY];
>> +	struct ttm_lru_bulk_move_pos vram[TTM_MAX_BO_PRIORITY];
> Not really needed, just a thought: Should we track the associated dma_resv
> object here to make sure the locking is all done correctly (and also check
> that the bulk move bo have the same dma_resv)? It wouldn't really be any
> overhead for the !CONFIG_LOCKDEP case and we could sprinkle a lot more
> dma_resv_held all over the place.

You made a similar comment on the last revision and I already tried to 
play around with that idea a bit.

But I've completely abandoned that idea after realizing that the BOs in 
the bulk move actually don't need to have the same dma_resv object, nor 
do they all need to be locked.

It just happens that amdgpu is currently using it that way, but I can't 
see any technical necessarily to restrict the bulk move like that.

Regards,
Christian.


> -Daniel

