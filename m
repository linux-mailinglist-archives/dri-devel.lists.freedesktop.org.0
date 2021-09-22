Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 928B6414750
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 13:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CB46EB75;
	Wed, 22 Sep 2021 11:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD816EB75
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 11:08:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t8so5617707wrq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 04:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TVcNDKcqecRZlhO3HfWY78/MBaQNDcEy6qeHAwuqfmk=;
 b=KHbVrKmZ+DBOQP3KKqvX5HWsEBZnw4H02y4HJf3Vgcn4oMS8ZHcRCtrGelJojSc8QB
 2rSX4bt4mxRPV2WnW/o9wPSGGOKZEu68Rci48NWXs/IwyHxeUK99CbIrY4U3VIR/qp2V
 S7yJ93gTcOtO27186lEj0G67l1wKT/+5S0mF4fOj4YhWJFLYghO4mxeRUeZzdsIkuXU5
 z2o2fZGyBdqzLUyKF2RwTPEvfJ/Nj0GNlFKS0221Zx54vtEfev85wx2D+UD7elkTLZ/4
 9l4y4OxNVX2ZrkB0xhDalvRFbteR7kgI55JoIExHSKMpR7aq8u3lTn3Oo043h7Z5s5Z3
 g1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TVcNDKcqecRZlhO3HfWY78/MBaQNDcEy6qeHAwuqfmk=;
 b=lyIV9B0m/cYx1lZgyNs+Yq46Yi9X0g62vp47KVQyjBplWCpV+K6Fs1BHXhAz2orXxu
 Xqxl00pFpbPS9LwxSREU9mj1WDa2eRT9F8ZbK7Cwr10XmGEVwa44j62W5atlOucHvN4m
 UN8l6czFp7M30HdN2aXexPqGVl0i22Nw7KjOCkB04vRVjk6JsBN+oI2kjKNWGL71SWpQ
 4A2JDG+ykk/+jCAxD+y4fYIvfUO9CovLm8vHzSeKp57/tvnJ7f/tZqS2pShnHqZkoXzi
 Bkb8cMgjNWBWKIaWtTHD3GxVezy63h66St/caiLOhF041/yvSpNyW3oE0IFGu7IqkiXY
 0R/Q==
X-Gm-Message-State: AOAM533hpS7RG8wS9s7qQ/z968y0oifCdk/3/bDeyrv3YN3Iu33vKe3y
 dQiHs3SysaPGxhtjk7zweQF/HdvOfyU=
X-Google-Smtp-Source: ABdhPJwh+CH1uH/7BJQdJJK2AG7MwRKyOoD9cahgRjGgTAodcFc0Dx00QTj5c10qnGlhXCFpDP6OSQ==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr40504261wru.243.1632308926283; 
 Wed, 22 Sep 2021 04:08:46 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id r9sm1826666wru.2.2021.09.22.04.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 04:08:45 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v7
To: daniel.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>
References: <20210720131110.88512-1-christian.koenig@amd.com>
 <97ea61fb-aa20-5220-8304-e71145cc7587@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9eca7ec8-4a33-4ddb-e4cb-295c1033aa60@gmail.com>
Date: Wed, 22 Sep 2021 13:08:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <97ea61fb-aa20-5220-8304-e71145cc7587@daenzer.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Totally forgotten to ping once more about that.

Michel has tested this now and I think we should push it ASAP. So can I 
get an rb?

Thanks,
Christian.

Am 23.07.21 um 10:04 schrieb Michel Dänzer:
> On 2021-07-20 3:11 p.m., Christian König wrote:
>> Daniel pointed me towards this function and there are multiple obvious problems
>> in the implementation.
>>
>> First of all the retry loop is not working as intended. In general the retry
>> makes only sense if you grab the reference first and then check the sequence
>> values.
>>
>> Then we should always also wait for the exclusive fence.
>>
>> It's also good practice to keep the reference around when installing callbacks
>> to fences you don't own.
>>
>> And last the whole implementation was unnecessary complex and rather hard to
>> understand which could lead to probably unexpected behavior of the IOCTL.
>>
>> Fix all this by reworking the implementation from scratch. Dropping the
>> whole RCU approach and taking the lock instead.
>>
>> Only mildly tested and needs a thoughtful review of the code.
>>
>> v2: fix the reference counting as well
>> v3: keep the excl fence handling as is for stable
>> v4: back to testing all fences, drop RCU
>> v5: handle in and out separately
>> v6: add missing clear of events
>> v7: change coding style as suggested by Michel, drop unused variables
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> CC: stable@vger.kernel.org
> Working fine with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880
>
> Tested-by: Michel Dänzer <mdaenzer@redhat.com>
>
>

