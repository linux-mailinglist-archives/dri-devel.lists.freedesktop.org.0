Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56978539A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 11:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156F810E3FE;
	Wed, 23 Aug 2023 09:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E9F10E3FE
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692782101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZmqnwyIiUpOS3f9HwLOK3gfHdtolAiT6g24hP2gfNPY=;
 b=VXD9WGyOejuhXdIyei+tPxHJt7MbifGkTTgCbq3Yy5/VfCJQuiFvhJMA06lNOBJzEG08I2
 K2Zvy05bBu07sSN+yMRuzM8Lda95Q+HGMyyqXJsn+ppPM5smyWkwvA6tbqCILxntmcgSdF
 c8TxzhmO6J0vJotT2elDCMj4IVdZuso=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-u0805TkdMHaFOEykWPO98Q-1; Wed, 23 Aug 2023 05:14:59 -0400
X-MC-Unique: u0805TkdMHaFOEykWPO98Q-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b9fa64dba8so58136711fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 02:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692782098; x=1693386898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmqnwyIiUpOS3f9HwLOK3gfHdtolAiT6g24hP2gfNPY=;
 b=UpuXSn+37guVRKI0POFEy+Hnesgv5RyExrp+L9OckFO2AN/XfNkQptvKHAaIN3JE0z
 g3WsE9uH/KURx7c6KmVJWs0xE7T5KziI4pQrCA8RL9QEFEvTPLcYNxjVwegGjmyH7VjC
 0uo2MXDv4kmvH9eKwBQNNrMoLv7EhsVw3TNW/umgvPwFXU5Nhec5KeIiOBo2lwmPUxX0
 DBLnY+pduH05PWChDN/f/J4nMDAMScAPqI5KEB2ASJ4l1yBqj0UpqJlnAmNFLRXlPqpE
 FF+CegZLxpMMezqzL7H3gmvjdmSFL8jTq63KDrW8y/3dij47pOHxCmtFj9IoDtYYF2z6
 +dQQ==
X-Gm-Message-State: AOJu0YzmDIIFe/6ERIB3/fUAvuzQGpOJoJoTa7HJsgiF4F7Si+wl9UcD
 8whW0pAVfGRbWuJt1nY/+rjmZ8STyE2fAuNLqzGQtsDmJ2aPQ/Y41/Xxl/AcOgDeiteVcExslRS
 piv/rUS8EA+6q45Bwm9BWqnSOJv3/
X-Received: by 2002:a2e:9851:0:b0:2b9:f1ad:94f5 with SMTP id
 e17-20020a2e9851000000b002b9f1ad94f5mr8997303ljj.40.1692782098388; 
 Wed, 23 Aug 2023 02:14:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIQk+KFKd33U8Jna9CjTcSP0kWhirK7CyX95540LD/JFVgIQFVsCHPCx/oUz7dRemNHrAGLg==
X-Received: by 2002:a2e:9851:0:b0:2b9:f1ad:94f5 with SMTP id
 e17-20020a2e9851000000b002b9f1ad94f5mr8997293ljj.40.1692782098053; 
 Wed, 23 Aug 2023 02:14:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:329d:db81:ed0c:c9cd?
 ([2a01:e0a:d5:a000:329d:db81:ed0c:c9cd])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a7bce8f000000b003feef82bbefsm10164225wmj.29.2023.08.23.02.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Aug 2023 02:14:57 -0700 (PDT)
Message-ID: <0336b4cd-1557-3fff-c8df-cf21ee123e34@redhat.com>
Date: Wed, 23 Aug 2023 11:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
 <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
 <20230818162415.2185f8e3@eldfell>
 <36prxupvl72tmamorquaunss27kckoq5zegmrwxdr3v3ynqz4s@xiypdbs4pbga>
 <20230822112004.3599df53@eldfell>
 <b2074198-2176-5e63-ce18-02bb14ea5749@redhat.com>
 <20230823111105.1281a980@eldfell>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230823111105.1281a980@eldfell>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tzimmermann@suse.de, javierm@redhat.com, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2023 10:11, Pekka Paalanen wrote:
> On Tue, 22 Aug 2023 17:49:08 +0200
> Jocelyn Falempe <jfalempe@redhat.com> wrote:
> 
>> On 22/08/2023 10:20, Pekka Paalanen wrote:
>>> On Mon, 21 Aug 2023 17:55:33 +0200
>>> Maxime Ripard <mripard@kernel.org> wrote:
>>>    
>>>> Hi Pekka,
>>>>
>>>> Thanks for answering
>>>>
>>>> On Fri, Aug 18, 2023 at 04:24:15PM +0300, Pekka Paalanen wrote:
>>>>> On Thu, 10 Aug 2023 09:45:27 +0200
>>>>> Maxime Ripard <mripard@kernel.org> wrote:
>>>>>> On Mon, Aug 07, 2023 at 03:45:15PM +0200, Jocelyn Falempe wrote:
>>>>>>> After discussions on IRC, the consensus is that the DRM drivers should
>>>>>>> not do software color conversion, and only advertise the supported formats.
>>>>>>> Update the doc accordingly so that the rule and exceptions are clear for
>>>>>>> everyone.
>>>>>>>
>>>>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>>>>> ---
>>>>>>>    include/uapi/drm/drm_fourcc.h | 7 +++++++
>>>>>>>    1 file changed, 7 insertions(+)
> 
> ...
> 
>>> In the XRGB8888 to RGB888 case, the kernel doing the conversion may
>>> allow for higher resolutions, but it may also hurt framerate more than
>>> userspace doing conversion, theoretically. For lower resolution where
>>> XRGB8888 could be scanned out directly from VRAM, the conversion would
>>> be strictly hurting.
>>>    
>> I think that depends on the hardware. For the Matrox, the bandwidth
>> between system RAM and VRAM is so low, that doing the conversion is much
>> faster than copying XRGB8888 to the VRAM. It also uses less CPU cycles,
>> because the copy is done with memcpy(), (DMA is broken or even slower on
>> most mgag200 hardware).
>> To get numbers, on my test machine, copying the 5MB framebuffer XRGB8888
>> to VRAM takes 125ms. Copying 3.75MB RGB888 framebuffer takes 95ms. The
>> conversion has no measurable impact, as it is done on the fly during the
>> memcpy, when the CPU is waiting for the bus to accept more data.
>> Doing the conversion in user-space would actually be slower, even with
>> SSE, because they won't use the "wasted" cpu cycle. But anyway the
>> conversion can take a few micro-seconds on the CPU, which is still
>> negligible compared to the memory transfer.
> 
> I stand corrected!
> 
> Always exceptions. :-)
> 
> I suppose you have dumb alloc returning sysmem, and PREFER_SHADOW set
> to false to go with that? Sounds good for XRGB8888. I guess there is
> not enough VRAM to alloc dumb buffers from there anyway?

Yes VRAM is between 4MB to 16MB, so the driver only expose dumb buffers 
in system RAM, and PREFER_SHADOW is set to false.

> 
>> Before sending the v2, Simon Ser proposed to move the paragraph to
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_plane.c#L132
>> instead of fourcc.h.
>> I'm wondering what other thinks about this.
> 
> I like moving it out of drm_fourcc.h. drm_fourcc.h is about format
> definitions which are used by things like EGL, Wayland, and whatnot
> which are not KMS specific.

Ok thanks, I will move it to drm_plane then.

> 
> 
> Thanks,
> pq


Best regards,

-- 

Jocelyn

