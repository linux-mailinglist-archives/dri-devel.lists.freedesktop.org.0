Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56F6903F9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15A10E983;
	Thu,  9 Feb 2023 09:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A790D10E975
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675935599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6XBJsaUpiCjlyVPxMsAhVdSvzsLV3MJdUJQfLsvKQk=;
 b=VKpcmdEo/A0Kf+5EX6e+UJZmlTg0SYpbhMnfhsWiKJ9hogsJe6r5XbmV8cZueRKXwBO5sR
 cDlqnrI4PpKWblO2mWGW5O70qWrlLOqaE+ZsEtKatcIQ5NVPSm2VzUXj3i31HDRqjovArV
 0ZDuCjR4RZ5jkwEbw8tPkXtlNwrYeyQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-l284gGEFN5SZJNLQLB37QQ-1; Thu, 09 Feb 2023 04:39:58 -0500
X-MC-Unique: l284gGEFN5SZJNLQLB37QQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 a15-20020adfe5cf000000b002c500989222so214897wrn.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 01:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M6XBJsaUpiCjlyVPxMsAhVdSvzsLV3MJdUJQfLsvKQk=;
 b=eAufgv5uHWPDWpPBo68HKalEMfi3tw3SrkJ5Hw/+LIDv3zvbn4yEdLyA2sajNPUNlm
 RaBs8qZUl8L9OtsoDVbke74+72juQGKcr+HpuSfSNjM3hCtpmoi7fvhgzxrhd8RNej2r
 Wp3UzbFCPpocg3QVDsXyzCoYOO8VmdJnQg26E4fUy7JZeA/YiduVi9g5TLdhVQxaBt/S
 tSxcBdm8VOLAvrYClWV5+Bvc/3jbTA5DhO1xqpp/xE4RrbNAZdFrRl7uzgnbbpWL06vW
 xHTmN5xztxRq/mZYz57JeR0iskGOKQCz7O1PuggvNFFl2SvRzGmQjM4y1OAZkso7fPm9
 b50Q==
X-Gm-Message-State: AO0yUKWneQyyuIJJIAOHTphdbTBb/gsIrNDTXca08UTuFylz6qR3kP0c
 w7/xn+J/+RicLdkqcgd+6udlnLuq+kTRoW0HUzEq0pS+Wy/vkhD3JcHOuba5/frqW/ih1PXMrSZ
 DHmPh98bHudOaDNJ8v8Os5Or2s+EXI2wu+Q==
X-Received: by 2002:a05:600c:340a:b0:3e0:185:44af with SMTP id
 y10-20020a05600c340a00b003e0018544afmr3908342wmp.20.1675935597517; 
 Thu, 09 Feb 2023 01:39:57 -0800 (PST)
X-Google-Smtp-Source: AK7set9bPYen6cm4KQb+UCgs3Oq89ZZTH4tMtbNfwzSeZiLXSCKW70PqlXBefRESlU04kTpDK0Y2Jg==
X-Received: by 2002:a05:600c:340a:b0:3e0:185:44af with SMTP id
 y10-20020a05600c340a00b003e0018544afmr3908333wmp.20.1675935597357; 
 Thu, 09 Feb 2023 01:39:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 d2-20020adfe2c2000000b002c3f7dfd15csm792461wrj.32.2023.02.09.01.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 01:39:56 -0800 (PST)
Message-ID: <8eed17db-50fa-711d-d2fe-135f9b8f35ca@redhat.com>
Date: Thu, 9 Feb 2023 10:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] drm/ast: Fix start address computation
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jammy Huang <jammy_huang@aspeedtech.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com
References: <20230209091254.15455-1-jfalempe@redhat.com>
 <65c4af68-3808-4021-ae4f-d0c07c908431@aspeedtech.com>
 <dc897487-9e17-036d-b0b3-6c15903dd009@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <dc897487-9e17-036d-b0b3-6c15903dd009@suse.de>
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

On 09/02/2023 10:35, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.02.23 um 10:22 schrieb Jammy Huang:
>> Hello,
>>
>> The offset given to ast_set_start_address_crt1() should be offset in 
>> vram. It should 0 now as your patch.
>>
>> I think it is better to correct it in ast_primary_plane_init() and 
>> ast_cursor_plane_init() as below.
> 
> I was about to write the same. Thanks for the review.
> 
>>
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -714,7 +714,7 @@ static int ast_primary_plane_init(struct 
>> ast_private *ast)
>>          struct ast_plane *ast_primary_plane = &ast->primary_plane;
>>          struct drm_plane *primary_plane = &ast_primary_plane->base;
>>          void __iomem *vaddr = ast->vram;
>> -       u64 offset = ast->vram_base;
>> +       u64 offset = 0;
>>          unsigned long cursor_size = roundup(AST_HWC_SIZE + 
>> AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
>>          unsigned long size = ast->vram_fb_available - cursor_size;
>>          int ret;
>> @@ -972,7 +972,7 @@ static int ast_cursor_plane_init(struct 
>> ast_private *ast)
>>                  return -ENOMEM;
>>
>>          vaddr = ast->vram + ast->vram_fb_available - size;
>> -       offset = ast->vram_base + ast->vram_fb_available - size;
>> +       offset = st->vram_fb_available - size;
> 
> This is confusing me, because in my tests I still saw a cursor, even 
> though the address is currently wrong.

I think it's because the PCI base address has its 26 bits lower part set 
to 0. So in most hardware it will works.
you can see in ast_set_cursor_base() that only the lower 26 bits are used.

-- 

Jocelyn

> 
> Best regard
> Thomas
> 
>>
>> On 2023/2/9 下午 05:12, Jocelyn Falempe wrote:
>>> During the driver conversion to shmem, the start address for the
>>> scanout buffer was set to the base PCI address.
>>> In most cases it works because only the lower 24bits are used, and
>>> due to alignment it was almost always 0.
>>> But on some unlucky hardware, it's not the case, and some unitilized
>>> memory is displayed on the BMC.
>>> With shmem, the primary plane is always at offset 0 in GPU memory.
>>>
>>> Tested on a sr645 affected by this bug.
>>>
>>> Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/ast/ast_mode.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>>> b/drivers/gpu/drm/ast/ast_mode.c
>>> index c7443317c747..54deb29bfeb3 100644
>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>> @@ -681,7 +681,8 @@ static void 
>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>       if (!old_fb || old_fb->pitches[0] != fb->pitches[0])
>>>           ast_set_offset_reg(ast, fb);
>>>       if (!old_fb) {
>>> -        ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
>>> +        /* with shmem, the primary plane is always at offset 0 */
>>> +        ast_set_start_address_crt1(ast, 0);
>>>           ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
>>>       }
>>>   }
>>
> 

