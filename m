Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E0579239F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 16:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4F610E54A;
	Tue,  5 Sep 2023 14:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5245810E549
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693925214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axcYM2nCi9XC7eMrm1TWmKUcLJ1fFChEjvcWXXmRoSQ=;
 b=aKavUP3ZN1mJTgG7guH4meVqIxBRS0w3X3JwqbOTeIh8DWMuUclGgWOV5DnKAipCo0YdTS
 Ieti6hgD3SgY+raIgEiVDYj5SIxYY+6kiQptf0+WdsBXrumKCdfT7mWhTP+71+Wy8TDFCL
 29sUW2CKkejyzHvLOrriEPP/zYJzvuQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-lSAH1aryMiuC8MC6F6p0Yw-1; Tue, 05 Sep 2023 10:46:53 -0400
X-MC-Unique: lSAH1aryMiuC8MC6F6p0Yw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-401e1c55ddcso17428325e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 07:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693925212; x=1694530012;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=axcYM2nCi9XC7eMrm1TWmKUcLJ1fFChEjvcWXXmRoSQ=;
 b=X6bVEgGTP0HIhkrppvAVGJ9xuRv1ATukzyDwYjF0Jdlmd7eU+bBHvlqpOX/PPGk1bL
 fW4LwcfBCuiV8dUoRBB1+dzQUA5wzC2GCr9pAnWDPiSUqmhzDLNolP78VRUB4VeCnFDy
 nYS1FWSsPHkZODzqQBY257kb8KmlT0TfQGgMVlNpTxvTOpjNaWGvzwdDIibnWdIWvoTd
 GYnM3hwecL99GomwPt6ACT7UaU/e3JOtrGk+nP0b6/c3x5OwBgn/oCIxg4OSsYhfMl89
 GVQ3uZc6FZzG95JzYvFBaiZoIYoFb2zaoM81A4XKLreKBVlEIl1iv1gW/RvmUD8RdL8q
 ePDA==
X-Gm-Message-State: AOJu0YwmojNZCCZeD3YJPu4WMPtLa2j4uaKcTfuP+GOkSqRiVOnawUdD
 TminjCjo9ShtMfzwbZ9OmVBC+ZIDNKoivKqah2X9r0rhv4jVB4Q1wsMo5X4hRzBVZzFbCNXKu+e
 ha0fZHA2N+5IlogcrqCEFHxbbnaso
X-Received: by 2002:a05:600c:2181:b0:401:d803:6242 with SMTP id
 e1-20020a05600c218100b00401d8036242mr9989942wme.27.1693925211862; 
 Tue, 05 Sep 2023 07:46:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsinh8Fzz7YrLSxfxeQXDnveHgMbizR8T08LzEuREuR8zJoNVl48Y0ocXCkQQkP4fwHU+zEw==
X-Received: by 2002:a05:600c:2181:b0:401:d803:6242 with SMTP id
 e1-20020a05600c218100b00401d8036242mr9989917wme.27.1693925211357; 
 Tue, 05 Sep 2023 07:46:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a7bc3cc000000b003fef19bb55csm17091253wmj.34.2023.09.05.07.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 07:46:50 -0700 (PDT)
Message-ID: <12490fcd-7c72-090d-b7ed-9928d51c21a2@redhat.com>
Date: Tue, 5 Sep 2023 16:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC][PATCH 0/2] drm/panic: Add a drm panic handler
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
References: <20230809192514.158062-1-jfalempe@redhat.com>
 <9b232cab-057c-bb42-48cb-f83da3f0e938@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <9b232cab-057c-bb42-48cb-f83da3f0e938@suse.de>
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

On 04/09/2023 16:29, Thomas Zimmermann wrote:
> Hi Jocelyn,
> 
> thanks for moving this effort forward. It's much appreciated. I looked 
> through the patches and tried the patchset on my test machine.

Thanks for taking the time to review and test it.
> 
> Am 09.08.23 um 21:17 schrieb Jocelyn Falempe:
>> This introduces a new drm panic handler, which displays a message when 
>> a panic occurs.
>> So when fbcon is disabled, you can still see a kernel panic.
>>
>> This is one of the missing feature, when disabling VT/fbcon in the 
>> kernel:
>> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
>> Fbcon can be replaced by a userspace kms console, but the panic screen 
>> must be done in the kernel.
>>
>> This is a proof of concept, and works only with simpledrm, using the 
>> drm_client API.
>> This implementation with the drm client API, allocates new 
>> framebuffers, and looks a bit too complex to run in a panic handler.
>> Maybe we should add an API to "steal" the current framebuffer instead, 
>> because in a panic handler user-space is already stopped.
> 
> Yes, that was also my first thought. I'd use an extra callback in struct 
> drm_driver, like this:
> 
> struct drm_driver {
>    int (*get_scanout_buffer)(/* return HW scanout */)
> }
> 
> The scanout buffer would be described by kernel virtual address address, 
> resolution, color format and scanline pitch. And that's what the panic 
> handler uses.

Thanks, I will try this solution. It shouldn't be too hard for simpledrm.
> 
> Any driver implementing this interface would support the panic handler. 
> If there's a concurrent display update, we'd have to synchronize.

Normally in the panic handler, the kernel is already single-threaded, so 
there won't be another task doing things in parallel. (But the GPU might 
still be busy doing other stuff, if we're in the middle of a game).
I think this drm_panic should be a "best effort", we can't guarantee the 
user will see the panic screen in all panic situations.

> 
>>
>> To test it, make sure you're using the simpledrm driver, and trigger a 
>> panic:
>> echo c > /proc/sysrq-trigger
> 
> The penguin was cute. :)
> 
> This only works if the display is already running. I had to start Gnome 
> to set a display mode. Then let the panic handler take over the output.

oh, I didn't expect this limitation. I will try to test that too. It 
might also get fixed by using the get_scanout_buffer() above.
> 
> But with simpledrm, we could even display a message without an output, 
> as the framebuffer is always there.
> 
>>
>> There is one thing I don't know how to do, is to unregister the 
>> drm_panic when the graphic driver is unloaded.
>> drm_client_register() says it will automatically unregister on driver 
>> unload. But then I don't know how to remove it from my linked list, 
>> and free the drm_client_dev struct.
> 
> Unregistering wouldn't be necessary with this proposed 
> get_scanout_buffer. In the case of a panic, just remain silent if 
> there's no driver that provides such a callback.

Is there a way to loop over all drm_devices ?
otherwise drm_panic may still call get_scanout_buffer() on a freed 
device, which would be problematic.
> 
>>
>> This is a first draft, so let me know what do you think about it.
> 
> One thing that will need serious work is the raw output. The current 
> blitting for XRGB8888 is really just a quick-and-dirty hack.
> 
> I think we should try to reuse fbdev's blitting code, if possible. The 
> fbdev core, helpers and console come with all the features we need. We 
> really only need to make them work without the struct fb_info, which is 
> a full fbdev device.

I'm a bit reluctant to re-use the fbdev code, for a few reasons:
  * I want drm_panic to work if CONFIG_FB and CONFIG_DRM_FBDEV_EMULATION 
are not set.
  * drm_panic only needs two things, to clear the framebuffer, and then 
draw white pixels where needed. As the frame is static, and the amount 
of white pixels is low, that should be good enough. So copy_area() or 
image_blit() are not that useful.
  * For this particular use-case, performances are not a priority, it 
doesn't matter if it takes 10us or 100ms to draw the panic screen, as it 
will stay the same until the user reboots.
  * Some aggressive optimizations might cause issues in a panic handler, 
like if you use workqueue/tasklet.

On the other hand, writing the code for all supported formats is a bit 
tedious. drm_log [1] did it in ~300 lines, which should keep code 
duplication low.

> 
> In struct fb_ops, there are callbacks for modifying the framebuffer. [1] 
> They are used by fbcon foir drawing. But they operate on fb_info.
> 
> For a while I've been thinking about using something like a drawable to 
> provide some abstractions:
> 
> struct drawable {
>      /* store buffer parameters here */
>      ...
> 
>      struct drawable_funcs *funcs;
> };
> 
> struct drawable_funcs {
>      /* have function pointers similar to struct fb_ops */
>      fill_rect()
>      copy_area()
>      image_blit()
> };
> 
> We cannot rewrite all the existing fbdev drivers. To make this work with 
> fbdev, we'd need adapter code that converts from drawable to fb_info and 
> forwards to the existing helpers in fb_ops.
> 
> But for DRM's panic output, drawable_funcs would have to point to the 
> scanout buffer and compatible callback funcs, for which we have 
> implementations in fbdev.
> 
> We might be able to create console-like output that is independent from 
> the fb_info. Hence, we could possible reuse a good chunk of the current 
> panic output.

I think that was the goal of drm_log, but this can be done better in 
userspace, for example there is work ongoing to make plymouth display 
them during the boot [2].

For the panic screen, only the kernel can do it. I also think the 
current fbcon/kernel log is good for developer, but too technical for 
most end-user.

Best regards,

-- 

Jocelyn

[1] 
https://lore.kernel.org/all/1394131242-29567-1-git-send-email-dh.herrmann@gmail.com/

[2] https://gitlab.freedesktop.org/plymouth/plymouth/-/merge_requests/224

> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.5.1/source/include/linux/fb.h#L273
> 
>>
>> Best regards,
>>
>>
>>
>>
>> Jocelyn Falempe (2):
>>    drm/panic: Add a drm panic handler
>>    drm/simpledrm: Add drm_panic support
>>
>>   drivers/gpu/drm/Kconfig          |  11 ++
>>   drivers/gpu/drm/Makefile         |   1 +
>>   drivers/gpu/drm/drm_drv.c        |   3 +
>>   drivers/gpu/drm/drm_panic.c      | 286 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/tiny/simpledrm.c |   2 +
>>   include/drm/drm_panic.h          |  26 +++
>>   6 files changed, 329 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_panic.c
>>   create mode 100644 include/drm/drm_panic.h
>>
>>
>> base-commit: 6995e2de6891c724bfeb2db33d7b87775f913ad1
> 

