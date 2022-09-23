Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2675E78E8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 12:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE5B10E844;
	Fri, 23 Sep 2022 10:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17E210E844
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 10:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663930732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMUgOPK/RtugliRj+Pj1jl4eY39uXMZWK214zvKFcko=;
 b=Lo5utS1MH5OgGtAQDjabI1u8j6BvTt2XZB4NoahUa5Byb/sUA/Ez9HQbNAG34VNjTzDv+V
 cfHIDHWceWgl7IyDrGaUnoroiVp3YgRimfY4OIbtTySTFWYnSQ/teYLILX3KpxYGSUXVOI
 5ASjbDnWmEQICqg5rvtRTcbZDViPVlQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-2QxujIWyOGS-B_b3LCv4Hw-1; Fri, 23 Sep 2022 06:58:51 -0400
X-MC-Unique: 2QxujIWyOGS-B_b3LCv4Hw-1
Received: by mail-wr1-f69.google.com with SMTP id
 o7-20020adfba07000000b00228663f217fso3886372wrg.20
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PMUgOPK/RtugliRj+Pj1jl4eY39uXMZWK214zvKFcko=;
 b=aTYhuwCuGkAnlt1Qw9+iHVR50Kt+htUsIkTufKZHJvSBiaIDsa/IUsfZqHkrxuLSQ3
 20p5cCJbO2da0vv3VnMS6zCU8ttZh8wlvtqIpb3us5cGXTEuqwbX49R0Xx8FYHjWqUs6
 RmQyhdFqPUwTS36dNGglgOuCDvPZblSwpxKZHgXZ8ZCRxiRWmJZ+1jxf/UbfIkNEBKgh
 kkn3/SposOglMoWR6nlD+P4Cb0tNPz6QiKy0XnIMo+eMpWQWP6Pgn8zqZ5OHZOzvQT0w
 tbZ1ch63Bizo5geq56DyALsSvFzvY4krwNCfbjrL5CNVae31mo2QZbwiRD7at9J3LRWc
 5ZGw==
X-Gm-Message-State: ACrzQf3mG9hEfeMOzXRHoPHpQRLiEoxRQSP8+RwjhhUQHY/kM25mSVt2
 baoyViJlLu+yw4Dag3LidQoJsymnd2iLc6fikHlfFp4bmXiZ/tbbrUYZ4fHzF//iDsDGcT/6BpG
 dfdgx9TH4C5j8fvcBKAb4p8X7vjzg
X-Received: by 2002:a05:600c:3591:b0:3b4:bf48:9f10 with SMTP id
 p17-20020a05600c359100b003b4bf489f10mr13100861wmq.76.1663930730602; 
 Fri, 23 Sep 2022 03:58:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM51LUX7W1x6U4wC8WDcNzphj53pVT9IlAK6wIg139LqzH3BfOcp6EHv8/sBg5N2lvZaIO+tqw==
X-Received: by 2002:a05:600c:3591:b0:3b4:bf48:9f10 with SMTP id
 p17-20020a05600c359100b003b4bf489f10mr13100849wmq.76.1663930730429; 
 Fri, 23 Sep 2022 03:58:50 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c050a00b003b4a68645e9sm2097375wmc.34.2022.09.23.03.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 03:58:49 -0700 (PDT)
Message-ID: <90b49a3d-aaaa-ba1c-ae7f-a4680a0621c4@redhat.com>
Date: Fri, 23 Sep 2022 12:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 5/5] drm/simpledrm: Synchronize access to GEM BOs
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-6-tzimmermann@suse.de>
 <2163b960-cfbe-7693-ba89-633cb36558a7@redhat.com>
 <fcd1d302-89af-62c9-0081-0717ad40e4ca@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <fcd1d302-89af-62c9-0081-0717ad40e4ca@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/23/22 12:43, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.09.22 um 10:06 schrieb Javier Martinez Canillas:
>> On 9/22/22 15:09, Thomas Zimmermann wrote:
>>> Synchronize CPU access to GEM BOs with other drivers when updating the
>>> screen buffer. Imported buffers might otherwise contain stale data.
>>>
>>
>> Can you please elaborate what the problem is? The framebuffers memory is
>> setup by the firmware and would never come from an imported dma-buf, so
>> could the GEM BOs even be shared with other drivers?
>>
>> Or is this done just for the sake of correctness ?
> 
> This isn't about the scanout buffer that we get from the firmware. This 
> is about synchronizing access to the GEM BO memory buffers. Our BOs' 
> memory buffer are allocated from SHMEM or could be imported via dma-buf. 
> In the latter case, another driver or hardware might modify their 
> content concurrently. We need to synchronize before reading the memory 
> from our CPU. The pattern is
> 
>    1) sync BO memory content via begin_cpu_access()
>    2) blit from BO mem to scanout buffer
>    3) release BO memory via end_cpu_access()
>

Yeah, I got that part. What I was asking is if importing from dma-buf is
a real use case for simpledrm or if this patch was more about making the
driver correct and aligned with what other DRM drivers do?

In any case I agree with the change, it's just the rationale for it that
wasn't clear to me.
-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

