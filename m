Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7704336AA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 15:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58C16E106;
	Tue, 19 Oct 2021 13:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC9B6E106
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 13:06:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k7so47440615wrd.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HTP0laOMyS+3LPZDWeQb93qbT0MYz1dc2AhvNQBBsfw=;
 b=Pi5H+2S1Oa0Wo9ED0v3KPrgZ3TAo/lpLFLGWnUIQQT0lnJSBFU+kZqmZHJvufOwCTc
 6z6X6OA60bvgy3tFHQx6GxFfg5ziZdGOc30dxUw+dtotS8L3/8H8NUNOyjrWnRpCXn7D
 b7nXyolWEsO2YLlOaLjUdCoDdsicpazWr5gXguCRRpYexuFRHNdgtBfH6Gl8/onIhRdN
 4psKMEsGaZCAoHNTUqmRw4MIh9Q1kw4dk6Nw0ZIOGSG6o90NKCWMN55ma61vCqyH9dlD
 d5cnyBqbYHSnxfyb74nKnn6dOlvoQwoRyImWEP5wVjZjFj0mX3l25pzG2isCWMKTSYb6
 jAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HTP0laOMyS+3LPZDWeQb93qbT0MYz1dc2AhvNQBBsfw=;
 b=Ej7PVcHNsFw6RXy/v6NM6myYdjbor4v3MNLC7DqqeDMbgQZS2TqL+yklReJGn2inCA
 H0EhIKnbsBKoLplb1sm9XpEgFfttmmJlGdeXYAyiVYc1kjF740orhHInzudzBZiPzCv+
 hRczVI2ZYlIllrTuQ4p5IvHa0ILzxwYLmf6QcqSBDr/8EfYZw79R0VBtYNG0dF8tH1Ma
 1qua9kRgU2HuScaoQI+rXhk774UXfXDokRvM3E1LFPx3WNuPJNDHhfpHmr269lqcu+fs
 5pwTc2XmyApjqKHHFNw4S6TquccECZCNwq8bGnfwaAH0WliaR+5kYdpeBbXvmoiMMbLc
 LeLw==
X-Gm-Message-State: AOAM531bKY5UbnIq1FBEnqT/hhSP6r3RGF7mfvWmP6dYkBTD6TluaEEv
 K1PpsMihJ8YEtwSrTYl4pAjw8EC+OMA=
X-Google-Smtp-Source: ABdhPJzDpD+UGjVCntZNDJIs7Tq8BFZHq/cJ+97w62Sb2OOICzTkebbUdyCDVA3t7iYzXmUbA8lrzQ==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr46016110wrq.6.1634648792342;
 Tue, 19 Oct 2021 06:06:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f344:748e:38f7:c50?
 ([2a02:908:1252:fb60:f344:748e:38f7:c50])
 by smtp.gmail.com with ESMTPSA id y191sm2646814wmc.36.2021.10.19.06.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 06:06:31 -0700 (PDT)
Subject: Re: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
To: Daniel Vetter <daniel@ffwll.ch>
Cc: frattaroli.nicolas@gmail.com, dri-devel@lists.freedesktop.org
References: <20211019112706.27769-1-christian.koenig@amd.com>
 <YW67iLFQ7ttCT54O@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b60c6edd-f5ef-d814-cd6d-ae3186758203@gmail.com>
Date: Tue, 19 Oct 2021 15:06:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW67iLFQ7ttCT54O@phenom.ffwll.local>
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



Am 19.10.21 um 14:35 schrieb Daniel Vetter:
> On Tue, Oct 19, 2021 at 01:27:06PM +0200, Christian König wrote:
>> Trivial fix since we now need to grab a reference to the fence we have
>> added. Previously the dma_resv function where doing that for us.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_add_implicit_dependencies v2")
> Uh I completely missed checking for that. Did you review all other
> conversions you've pushed for this kind of bug?

Yeah, currently double checking that.

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Also
>
> Reported-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> References: https://lore.kernel.org/dri-devel/2023306.UmlnhvANQh@archbook/
>
> It's important to credit bug reporters! Also upgrade to t-b if Nicolas
> gets around to testing quickly.

Yeah, the credit part is certainly correct. I just usually ask people 
before adding their mail address to kernel commits because of the spam 
you get :)

Cheers,
Christian.

>
> Cheers, Daniel
>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 5bc5f775abe1..94fe51b3caa2 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -707,6 +707,9 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>   		ret = drm_sched_job_add_dependency(job, fence);
>>   		if (ret)
>>   			return ret;
>> +
>> +		/* Make sure to grab an additional ref on the added fence */
>> +		dma_fence_get(fence);
>>   	}
>>   	return 0;
>>   }
>> -- 
>> 2.25.1
>>

