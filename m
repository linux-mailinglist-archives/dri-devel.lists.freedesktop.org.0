Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA017A5B5E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 09:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3907F10E1A8;
	Tue, 19 Sep 2023 07:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A6110E1A8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695109222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIy4wxoDTRMCSIT1hdD4mYsXDL2qk0oo3UnPwXJ05nU=;
 b=FvNo8ylQ57J9EJcZLiEkzPcsg6djQHT4b5E6wEr7ACtATI1JDXujiVfWiPq7by4XHDWx/b
 tuQV2K35hGRtEPTARgNSRX5lcmLVVkKBd9oBkP6J06uLbXtjVbPxTCfrCB9GOpp6uzZPDk
 NwzEAVOK7JL74RJXWLfemksSXtFObug=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-j44wiQkxNxy1bekQyBiiUQ-1; Tue, 19 Sep 2023 03:40:20 -0400
X-MC-Unique: j44wiQkxNxy1bekQyBiiUQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-402d63aeea0so41975495e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 00:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695109219; x=1695714019;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lIy4wxoDTRMCSIT1hdD4mYsXDL2qk0oo3UnPwXJ05nU=;
 b=pT7z82ekeQmT3DwRpvQQ3XkixnRE3eb7VOyECWKpJJRCYYNSg37+5lVbr0P3slDmFh
 uYLGxcAfxzHVD/5OeSouhSu19AXsHgla61xAXatceIzKMFc/upbrsmHJrgNAJF7GrZLL
 p8sMWnaVL8dsbL2AipjqA1RQ7/ExkTgpqgHD/TDcKYRrdBrFuHgBrJVyDys69Rvnf0Pe
 vpIEVf6mvwG5rPepVup2PcKy27XFZ75/bbAdNGGCoJ8zriYUbxiJKYF2RFapB9pAceGq
 oPKYzKngA00+b4Y4Sw6wMBH8ejTZo867S1sxGeNMqnAiKNdvwvZXeT9jmUbJdYTOyw6u
 H7cw==
X-Gm-Message-State: AOJu0YyI39ocMeZpOnG7BAVr7cj6jf0wCQKDxErFMD8hkcZQNzjXFb9e
 yDGRn0/GUvNG/74Ko2XegNKhWvondVxL3gcigZEU2/JlX2G3N4mMHnkeDB6SiQCGKfrDhSe1KBm
 AJkCjrXA0lhZUVU2kJJf++IwhMlFC
X-Received: by 2002:a7b:c8c2:0:b0:401:519:d2 with SMTP id
 f2-20020a7bc8c2000000b00401051900d2mr9374720wml.23.1695109219545; 
 Tue, 19 Sep 2023 00:40:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9ZlH7oaZprBy4c2/qcg34XCn2s8m9yw1rpTVp8Id8pRmSPaPWDBhTOleCLuzghKnlqWDSxA==
X-Received: by 2002:a7b:c8c2:0:b0:401:519:d2 with SMTP id
 f2-20020a7bc8c2000000b00401051900d2mr9374711wml.23.1695109219260; 
 Tue, 19 Sep 2023 00:40:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ci8-20020a5d5d88000000b0031fedb25b85sm12603597wrb.84.2023.09.19.00.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 00:40:18 -0700 (PDT)
Message-ID: <a4941644-1720-ea63-ab07-2589101c17e0@redhat.com>
Date: Tue, 19 Sep 2023 09:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC][PATCH v2 0/2] drm/panic: Add a drm panic handler
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
References: <20230915083307.1185571-1-jfalempe@redhat.com>
 <5dc52140-e6b1-0fe2-40c3-00dfaa954a03@tronnes.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <5dc52140-e6b1-0fe2-40c3-00dfaa954a03@tronnes.org>
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

On 19/09/2023 01:19, Noralf Trønnes wrote:
> Hi,
> 
> On 9/15/23 10:28, Jocelyn Falempe wrote:
>> This introduces a new drm panic handler, which displays a message when a panic occurs.
>> So when fbcon is disabled, you can still see a kernel panic.
>>
>> This is one of the missing feature, when disabling VT/fbcon in the kernel:
>> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
>> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
>>
>> This is a proof of concept, and works only with simpledrm, using a new get_scanout_buffer() api
>>
> 
> There's a panic handling entry in Documentation/gpu/todo.rst pointing to
> some work done in this area.

Thanks a lot for this pointer, I wasn't aware of this previous drm panic 
attempt. I hope this one will go a bit further ;)
Also I wasn't sure about what is allowed or not in the panic handler, 
and this doc makes things really clear.

Regarding the fbcon interactions, I prevent this at build time, I rely 
on userspace consoles, and hope they will progressively replace fbcon.

My real question is how did I missed that ? My google-fu failed me this 
time.

Best regards,

-- 

Jocelyn




> 
> Noralf.
> 
>> To test it, make sure you're using the simpledrm driver, and trigger a panic:
>> echo c > /proc/sysrq-trigger
>>
>> v2
>>   * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmermann)
>>   * Add the panic reason to the panic message (Nerdopolis)
>>   * Add an exclamation mark (Nerdopolis)
>>   
>> I didn't reuse the fbdev functions yet, that would need some fbdev refactoring, because they rely on struct fb_info, and struct vc_data (for font/console). But I still plan to at least try it for v3.
>>
>> A few more though:
>>   1) what about gpu with multiple monitor connected ?
>> maybe get_scanout_buffer() could return a list of scanout buffers ?
>>   2) I think for some GPU drivers, there might need a flush_scanout_buffer() function, that should be called after the scanout buffer has been filled ?
>>
>> Best regards,
>>
>> Jocelyn Falempe (2):
>>    drm/panic: Add a drm panic handler
>>    drm/simpledrm: Add drm_panic support
>>
>>   drivers/gpu/drm/Kconfig          |  11 ++
>>   drivers/gpu/drm/Makefile         |   1 +
>>   drivers/gpu/drm/drm_drv.c        |   3 +
>>   drivers/gpu/drm/drm_panic.c      | 270 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/tiny/simpledrm.c |  17 ++
>>   include/drm/drm_drv.h            |  14 ++
>>   include/drm/drm_panic.h          |  41 +++++
>>   7 files changed, 357 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_panic.c
>>   create mode 100644 include/drm/drm_panic.h
>>
>>
>> base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
> 

