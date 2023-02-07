Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984E68D59C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 12:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363E510E4E0;
	Tue,  7 Feb 2023 11:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E05810E4E0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 11:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675769818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHB65Kzx24a7EPBgs6C5aNQS+bVe0u0a5VcVS+Le8WU=;
 b=B9yTjiQNLhl/yroIqd2LWC9jiOyRr6QcPWtrgKit5QY+dg7yM7SLALMkLlmymiNP+ZgU9z
 dNauIcID3sykxTHBd+M4ryxGSaRMva1zxHVQZ2HGzPy/tp/UtDuHbFkM9dPIREjsexFiGL
 x8IwrHeMmLeCdfCpNUj4NviWeVMZgb0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-464-4y4esj1OOH2yYPgxYZtBvg-1; Tue, 07 Feb 2023 06:36:57 -0500
X-MC-Unique: 4y4esj1OOH2yYPgxYZtBvg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h9-20020a05600c350900b003e000facbb1so3213226wmq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 03:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nHB65Kzx24a7EPBgs6C5aNQS+bVe0u0a5VcVS+Le8WU=;
 b=IPAY2Gdhpz9tmsciOo0mkjQLVnV/abt/IbeXDNE6NPp0V3IANyo+gFlJ7YHZf/61tH
 N7LrsVJmD9zQwfxoM59RtBic+3sdtRTIHQIP5CYgnkp+tOqX5cyOw/ofN+W2DDaySI3z
 TDpyu1S/CS9Ro00kreleSbJe4CGydc+Wi5FFVhGwgSxWFZ9T6RvtbGrqL7pt7iD4okds
 73gHJZunjhCDmqsTxY3VxLpBG43/FQT2apNxw5ZRrwTIYK03vKXEYpShaFncTHdOc/1o
 dftGp+fKIq/96v4cbtVwBy7I19fwlxa1N61k8ZPJ7bDGpHI/bmMn23ymquplb67YQZPp
 sHHA==
X-Gm-Message-State: AO0yUKWJ7TDaWw1ElsVZLbBLqIATFZfqYraAKbkUEjGQK97TFtuphvBP
 Uh9aAAqczYVjn9NLeHVTbvi9gchymN7rX/Lo3KbfruCp9qkJpHPh+9JlrqY4rZ/N+17TKIRtpY6
 d4yioiYCoB/ZTwaAv/Z/xTOHpBoyd
X-Received: by 2002:a5d:5487:0:b0:2bf:b3ee:4a19 with SMTP id
 h7-20020a5d5487000000b002bfb3ee4a19mr2452491wrv.9.1675769816104; 
 Tue, 07 Feb 2023 03:36:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8Q610L9EoZPilcdUVmaSFeQPP11qCExUrsB8FCYRSuNKpAGfKnUf89ROxMmZ7EbMHaVoFHgQ==
X-Received: by 2002:a5d:5487:0:b0:2bf:b3ee:4a19 with SMTP id
 h7-20020a5d5487000000b002bfb3ee4a19mr2452478wrv.9.1675769815867; 
 Tue, 07 Feb 2023 03:36:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a5d43d2000000b002c3dd9bb283sm8547194wrr.37.2023.02.07.03.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:36:55 -0800 (PST)
Message-ID: <5d79840c-b0d8-ead5-6fb9-9d13832c3c80@redhat.com>
Date: Tue, 7 Feb 2023 12:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drm/ast: Fix start address computation
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jammy_huang@aspeedtech.com
References: <20230207105317.224277-1-jfalempe@redhat.com>
 <125d895f-7837-1ded-f121-ef0c5879bc2e@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <125d895f-7837-1ded-f121-ef0c5879bc2e@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 12:17, Thomas Zimmermann wrote:
> Hi
> 
> Am 07.02.23 um 11:53 schrieb Jocelyn Falempe:
>> During the driver conversion to shmem, there is a missing page shift when
>> computing the start address in GPU memory.
>> This leads to graphic garbage when connecting to the remote BMC, 
>> depending
>> on the PCI start address.
>>
>> Tested on a sr645 affected by this bug.
>>
>> Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index c7443317c747..d75e4a7611b3 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -714,7 +714,7 @@ static int ast_primary_plane_init(struct 
>> ast_private *ast)
>>       struct ast_plane *ast_primary_plane = &ast->primary_plane;
>>       struct drm_plane *primary_plane = &ast_primary_plane->base;
>>       void __iomem *vaddr = ast->vram;
>> -    u64 offset = ast->vram_base;
>> +    u64 offset = ast->vram_base << PAGE_SHIFT;
> 
> That can't be the problem, I think. vram_base is already an address. [1] 
> In the old code, drm_gem_vram_pg_offset() returned a page index. So 
> shifting it to the left here is most likely incorrect.
> 
> Can you verify that the new offset is the same as the old one?

Yes, I was also a bit unsure about this fix.

In my case, with the old code:

PCI base address is 0xce000000

with old code:
start address (which is 24bits) was 0

with shmem code:
start address is 0x800000

So the additional page shift makes it 0, which fixes the display.

I was wondering if this start address is not an offset in the GPU 
memory, and in this case the primary plane offset should always be 0 ?

Best regards,

> 
> Best regards
> Thomas
> 
> [1] 
> https://elixir.bootlin.com/linux/v6.2-rc7/source/drivers/gpu/drm/ast/ast_mm.c#L96
> 
>>       unsigned long cursor_size = roundup(AST_HWC_SIZE + 
>> AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
>>       unsigned long size = ast->vram_fb_available - cursor_size;
>>       int ret;
> 

