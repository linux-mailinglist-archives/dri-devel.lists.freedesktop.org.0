Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3F45FB8F3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 19:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0812010E97F;
	Tue, 11 Oct 2022 17:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B2B10E97F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665508152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ximfb1JVwPVAZeYmdjGqYrvIUc193INMDULwL4mjDIM=;
 b=eMv75/WDvRbFwl2KiRPK4Edbwzd/yljBJ8ERDs02LSxvKOmfU+klbIi4KvnHiaiO3vsKeC
 db0vpgK6uxCYbXeO7PLcWEIYcO/6kp0Tt3PRng9NBXdGsppIeopc9m99QdgxXxDI3RKiwN
 Q06yvKKQohoiIFdYw8xaTGQcle70wY0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-TVNDA0oNMGe0lc46Y2c0-Q-1; Tue, 11 Oct 2022 13:09:11 -0400
X-MC-Unique: TVNDA0oNMGe0lc46Y2c0-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 k38-20020a05600c1ca600b003b49a809168so10898901wms.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 10:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ximfb1JVwPVAZeYmdjGqYrvIUc193INMDULwL4mjDIM=;
 b=QIKOYQWutq1ZC6/VhM3MJqqIyueRY6r8ugnXmQOnot/x7+qak3zeVBUJyFFYx91fXt
 4NKMYSYFEl4Z1fg9QDX3iCtOnCaMlx1dR/BwGsdDyT79FqQSzo/1cKkj81rTBQA6EoEP
 47pkN+5YFUA7LeFRLPGIwPukVGpdq3bdJfzcvngfQLjnshLiBkGRrVqxfIVOGDK+/nGX
 qZOasGtxj0Upuj9I6ZhkoyHNtKIYgbZtyvkAs766iku454pCK5y+xht3yG10OPfj/Gu0
 h3tstmlB0z/FYQZrxxN9MkEf2oxgjhX4aN8Qg/Z/Pe/edJ1mXXGkvY+PNtezt5Xy8W8/
 Q7uw==
X-Gm-Message-State: ACrzQf0+3s1skqXMQqhLsRgykUmheXxUW/p4hg+xGeu4Pkmrq7L4Bpxw
 85m+0HfTNZ9KMzROlSaDFRfRsIPBL2EmMd9T72Stm+pTxYnRLjKs2qo/5rC2XHzMXjzn9WFHJV/
 jujI4YV/7r12i7euH/IchsVZuq6Hm
X-Received: by 2002:a05:6000:15c5:b0:22e:44c5:4973 with SMTP id
 y5-20020a05600015c500b0022e44c54973mr16365199wry.513.1665508150496; 
 Tue, 11 Oct 2022 10:09:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM75RiWza/2bdwoX8K8EawUmL5tf4W1sqqz2949vLYn+zDZtsVT9XOmu9abbXPpYyPkz+pZH8Q==
X-Received: by 2002:a05:6000:15c5:b0:22e:44c5:4973 with SMTP id
 y5-20020a05600015c500b0022e44c54973mr16365181wry.513.1665508150266; 
 Tue, 11 Oct 2022 10:09:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003b4cba4ef71sm20027890wmq.41.2022.10.11.10.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 10:09:09 -0700 (PDT)
Message-ID: <3bfddaa7-e6b2-e9ff-c1a9-7d1fcfd86530@redhat.com>
Date: Tue, 11 Oct 2022 19:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 8/8] drm/ast: Avoid reprogramming primary-plane scanout
 address
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
References: <20221010103625.19958-1-tzimmermann@suse.de>
 <20221010103625.19958-9-tzimmermann@suse.de>
 <73eb1f19-5900-a758-bf80-38cbd69395e6@redhat.com>
 <1f29c829-fcca-eec6-50c8-0a35d7c31599@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1f29c829-fcca-eec6-50c8-0a35d7c31599@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/2022 16:59, Thomas Zimmermann wrote:
> Hi
> 
> Am 11.10.22 um 16:21 schrieb Jocelyn Falempe:
>> On 10/10/2022 12:36, Thomas Zimmermann wrote:
>>> Some AST-based BMCs stop display output for up to 5 seconds after
>>> reprogramming the scanout address. As the address is fixed, avoid
>>> re-setting the address' value.
>>>
>>> Reported-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/ast/ast_mode.c | 12 ++++++++++--
>>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>>> b/drivers/gpu/drm/ast/ast_mode.c
>>> index 1b991658290b..54a9643d86ce 100644
>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>> @@ -672,9 +672,17 @@ static void 
>>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>>       }
>>>       ast_set_offset_reg(ast, fb);
>>> -    ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
>>> -    ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
>>> +    /*
>>> +     * Some BMCs stop scanning out the video signal after the driver
>>> +     * reprogrammed the scanout address. This stalls display output
>>> +     * for several seconds and makes the display unusable. Therefore
>>> +     * only reprogram the address after enabling the plane.
>>> +     */
>>> +    if (!old_fb && fb) {
>>> +        ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
>>> +        ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
>>> +    }
>>>   }
>>
>> I've tested the series, and BMC is still very slow with Gnome/Wayland.
>>
>> It's because ast_set_offset_reg() also trigger a 5s freeze of the BMC.
>>
>> I added this, and it works well:
>>
>> if (!old_fb || old_fb->pitches[0] != fb->pitches[0])
>>      ast_set_offset_reg(ast, fb);
> 
> Great thanks for testing. I'll add this to the next version.
> 
> I wonder if that problem is in all ast chips or just this one. :/

My test machine has an AST2600, but I think it depends mostly on the BMC 
firmware.
Anyway it's not useful to reprogram the same value on the registers for 
each frame. And that's the good thing about atomic interface, because we 
have previous and next state, it's easy to check if the registers need 
to be updated.

> 
> Best regards
> Thomas
> 
>>
>>
>>>   static void ast_primary_plane_helper_atomic_disable(struct 
>>> drm_plane *plane,
>>
>>
>>
>>
> 

-- 

Jocelyn

