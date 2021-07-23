Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79C3D3769
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA126F613;
	Fri, 23 Jul 2021 09:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E8A6F613
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:13:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q3so1643686wrx.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 02:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YtRUdDfw1syy5HBIgIsuXAtULUKGq43PWBbMLhSIx1c=;
 b=NrE4NaY/Kjs1JXTgY/2sAdVcwHwuvo7oPHJ+vY7Kg/FGC5AMqlkMWvPANf49piyV0E
 K1aqy7Mk3iOKdsJXZ2TTzADj2kiLojW7IOPuJ56SFk0sGOuFPr0mJcOAlwMRFsI8hVhC
 0vfLkONOF+B2UAV9sHRd3v7gRUX91oc8YnKcg3TxfHI/mtzieBbqZG0kmBbHrxpXcwbW
 TShhfoJQbUyT+Doj5NzFh+NCaoukbWyJVu/1cRYFT4tCjvbquGSKadOyyHGJdsXt+QRJ
 YmnpHGxm/iuMctiWs66fTATaqsu+jhUuy1wSdr4h6VoN4e5ceaxLch2nTSlDuLyOkBOc
 rO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YtRUdDfw1syy5HBIgIsuXAtULUKGq43PWBbMLhSIx1c=;
 b=si5Qjz60sWI9ArGQvTVzWx9R7qrrCAl6+DzkAcKmQb8fxEYNum8cGp9zU/u2WIh2M6
 tSJVIVnyYe+bRDiFwAf6QucLPjsNSZKMBKX1VauhbWHjP8D2iGNTqZd/31n2cN1JMoLq
 3t/b1rjlK2igVEWBoXIkaomJFOGRIX4rkK6n/LVI4PfnIXxEX3JrfA0dVh4qeQh9cNzZ
 YeHNFG685se+3zcpn0octRJHZpMxUY2jspnzt3BJo4xzyPiI573wYbTYxrpdL4rRCZaY
 8b7erIXhnEYrWy8EJnV8UbliIGVxGyB9UXWqfTvTCW0FrFaiP8I34Uu6kDdwmZcuZ11r
 uHDg==
X-Gm-Message-State: AOAM533e8rIcyqrzLIr46ANysgrcnD9ilKLVUSe5VI4NtfOYWwSgBqPu
 OfWDNMp0IF2SvLOyDGUFoe8=
X-Google-Smtp-Source: ABdhPJxJjeFkSeOBARP7XDn4yrn6KZoGZiArwOyIzVAduqkKQQJqDfL0MX9P6TerYKakGyhrjsKGPA==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr4086781wrq.278.1627031591254; 
 Fri, 23 Jul 2021 02:13:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a0d7:cc1c:9090:5782?
 ([2a02:908:1252:fb60:a0d7:cc1c:9090:5782])
 by smtp.gmail.com with ESMTPSA id s6sm38178228wrt.45.2021.07.23.02.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 02:13:10 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/vmwgfx: unbind in vmw_ttm_unpopulate
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210722124127.17901-1-christian.koenig@amd.com>
 <YPqCBUDiibBWUs2/@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c83ebc42-567c-4f4c-d6da-53ff21739222@gmail.com>
Date: Fri, 23 Jul 2021 11:13:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPqCBUDiibBWUs2/@phenom.ffwll.local>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.07.21 um 10:47 schrieb Daniel Vetter:
> On Thu, Jul 22, 2021 at 02:41:23PM +0200, Christian König wrote:
>> Doing this in vmw_ttm_destroy() is to late.
>>
>> It turned out that this is not a good idea at all because it leaves pointers
>> to freed up system memory pages in the GART tables of the drivers.
> So I wanted to review this series, and I can't reconcile your claim here
> with the demidlayering Dave has done. The driver patches here don't
> ouright undo what Dave has done, but that means the bug has been
> preexisting since forever (or is due to some other change?), and your
> commit message is a bit confusing here.
>
> The final patch just undoes the demidlayering from Dave, and I really
> don't see where there's even a functional change there.
>
> And even these patches here don't really change a hole lot with the
> calling sequence for at least final teardown: ttm_tt_destroy_common calls
> ttm_tt_unpopulate as the first thing, so at least there there's no change.
>
> Can you pls elaborate more clearly what exactly you're fixing and what
> exactly needs to be reordered and where this bug is from (commit sha1)? As
> is I'm playing detective and the evidence presented is extremely since and
> I can't reconcile it at all.
>
> I mean I know you don't like typing commit message and documentation, but
> it does get occasionally rather frustrating on the reviewer side if I have
> to interpolate between some very sparse hints for this stuff :-/

Yeah, when have seen the history it's rather obvious what's wrong here 
and I expected Dave to review it himself.

Previously we had three states in TTM for a tt object: Allocated -> 
Populated -> Bound which on destruction where done in the order unbind 
-> unpopulate -> free.

Dave moved handling of the bound state into the drivers since it is 
basically a driver decision and not a TTM decision what should be bound 
and what not (that part perfectly makes sense).

The problem is that he also moved doing the unbind into the free 
callback instead of the unpopulate callback. This result in stale page 
pointers in the GART if that unpopulate operation isn't immediately 
followed by a free.

Thinking more about it if we do populated->unpopulated->populated then 
we would also have stale pointers to the old pages which is even worse.

This is also not de-midlayering since we already have a proper 
ttm_tt_init()/ttm_tt_fini() functions which should work nicely for the 
tt object.

Christian.

> -Daniel
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> index b0973c27e774..904031d03dbe 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> @@ -526,14 +526,9 @@ static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>>   	struct vmw_ttm_tt *vmw_be =
>>   		container_of(ttm, struct vmw_ttm_tt, dma_ttm);
>>   
>> -	vmw_ttm_unbind(bdev, ttm);
>>   	ttm_tt_destroy_common(bdev, ttm);
>>   	vmw_ttm_unmap_dma(vmw_be);
>> -	if (vmw_be->dev_priv->map_mode == vmw_dma_alloc_coherent)
>> -		ttm_tt_fini(&vmw_be->dma_ttm);
>> -	else
>> -		ttm_tt_fini(ttm);
>> -
>> +	ttm_tt_fini(ttm);
>>   	if (vmw_be->mob)
>>   		vmw_mob_destroy(vmw_be->mob);
>>   
>> @@ -578,6 +573,8 @@ static void vmw_ttm_unpopulate(struct ttm_device *bdev,
>>   						 dma_ttm);
>>   	unsigned int i;
>>   
>> +	vmw_ttm_unbind(bdev, ttm);
>> +
>>   	if (vmw_tt->mob) {
>>   		vmw_mob_destroy(vmw_tt->mob);
>>   		vmw_tt->mob = NULL;
>> -- 
>> 2.25.1
>>

