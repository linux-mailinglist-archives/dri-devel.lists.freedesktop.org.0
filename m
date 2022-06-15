Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDD254C2E2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 09:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3217C10EC93;
	Wed, 15 Jun 2022 07:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C6510EC93
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 07:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655279451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4CbnNSQZeqy+bdEkfeSk5gGR8/2lFLfAGt7IGwzGzc=;
 b=O8SR7CwjixHUPsNi4MOmREoactA8Pfrvmy9cW5jYNca11tMGUpE95Pol0iooJqdkHTl3y4
 JYCyXwe/bboqGsrl4x+JdY8/1pKxDGMZdtwD9hR1I0BDD0/oAAGxyNiW2sCA8tz0/G6akR
 mUtyrChFxtUXzqjYwKlWYwkDcvhdgmA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-VEf3bZOiNEKBHV9j8nb9zw-1; Wed, 15 Jun 2022 03:50:50 -0400
X-MC-Unique: VEf3bZOiNEKBHV9j8nb9zw-1
Received: by mail-wr1-f71.google.com with SMTP id
 e15-20020adfa44f000000b00219ebf65301so1591281wra.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 00:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j4CbnNSQZeqy+bdEkfeSk5gGR8/2lFLfAGt7IGwzGzc=;
 b=T5D+ETNM8kUE9L/U99Fhkds99Ijjjvh9XNElAU6i3Xn07nLKTKfZ1S6uACUYZgX+aq
 XBAzUQKlYFL5oLYp7L8109K9+hqk+v2DzrAAu/kgeIJah/jVf4163LZzHYYanQU0ENxn
 ZRzV/LiZ6m8oDmGSJpEAUwD32MmBbWpDFOvQpEz/aUd7lyAdznkdy9aaTex806Z33c5y
 PDWfXg4YSbyR23BRAXzZ6R7feBncSNms+wS6avw720RyVfjtqH3YJQxvkr6MjYWIpGt+
 O/o+YEwrOhXkuutoKwnLnxhfHLBk/8til1XlFXHrqBXpyJRhbweJLsrRp1b3ItBhab4L
 yBnQ==
X-Gm-Message-State: AJIora+pEVdedmYkkcNPyE5WECUtxtcMUBFfE7UWr3cMCPPWL6uKKDq4
 yW8uOklObwxE4X6rOEFelx5KEBKiHXx/r7s3QZWFvpIQ4xlhiXNHbdXUjb4eEBE20iFs7BNsgVA
 kx0c34pjIRH2NgKzhgID+FekZ0PNu
X-Received: by 2002:a5d:47a4:0:b0:218:5829:dced with SMTP id
 4-20020a5d47a4000000b002185829dcedmr8953992wrb.56.1655279448783; 
 Wed, 15 Jun 2022 00:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vuZl7SWs3l6Ktt9SfH1He3/YGrOPMqkYXwl2IG+5WAno5r/emEULp+a93N9r8/iO5mFs1D/w==
X-Received: by 2002:a5d:47a4:0:b0:218:5829:dced with SMTP id
 4-20020a5d47a4000000b002185829dcedmr8953972wrb.56.1655279448503; 
 Wed, 15 Jun 2022 00:50:48 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q185-20020a1c43c2000000b0039c3056c3dfsm1711001wma.27.2022.06.15.00.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 00:50:48 -0700 (PDT)
Message-ID: <a8350570-0ed5-dc91-c4a4-76931dec0c1d@redhat.com>
Date: Wed, 15 Jun 2022 09:50:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
 <3d6303d4-4569-7078-76e1-0f7c46d9556c@suse.de>
 <54a8a681-3a96-22cb-846d-9e406f10bab7@arm.com>
 <8693a65a-6866-3ec5-d2e1-d7fd132f7dab@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <8693a65a-6866-3ec5-d2e1-d7fd132f7dab@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/15/22 09:39, Thomas Zimmermann wrote:
> Hi
> 
> Am 14.06.22 um 23:06 schrieb Robin Murphy:
>> On 2022-06-14 14:48, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 14.06.22 um 15:04 schrieb Robin Murphy:
>>>> The Arm Juno board EDK2 port has provided an EFI GOP display via HDLCD0
>>>> for some time now, which works nicely as an early framebuffer. However,
>>>> once the HDLCD driver probes and takes over the hardware, it should
>>>> take over the logical framebuffer as well, otherwise the now-defunct GOP
>>>> device hangs about and virtual console output inevitably disappears into
>>>> the wrong place most of the time.
>>>>
>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>> ---
>>>>   drivers/gpu/drm/arm/hdlcd_drv.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c 
>>>> b/drivers/gpu/drm/arm/hdlcd_drv.c
>>>> index af59077a5481..a5d04884658b 100644
>>>> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
>>>> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
>>>> @@ -331,6 +331,8 @@ static int hdlcd_drm_bind(struct device *dev)
>>>>           goto err_vblank;
>>>>       }
>>>> +    drm_fb_helper_remove_conflicting_framebuffers(NULL, "hdlcd", 
>>>> false);
>>>> +
>>>
>>> In addition to what Javier said, it appears to be too late to call 
>>> this function. If anything her etouches hardware, you might 
>>> accidentally interfere with the EFI-related driver. Rather call it at 
>>> the top of ldlcd_drm_bind().
>>
>> OK, thanks for the info. I mostly just copied the pattern from the 
>> simplest-looking other users (sun4i, tegra, vc4) who all seemed to call 
>> it fairly late, and indeed naively it seemed logical not to do it *too* 
>> early when there's more chance we might fail to bind and leave the user 
>> with no framebuffer at all. In particular, waiting until we've bound the 
>> HDMI encoder seems like a good idea in the case of the Juno board (which 
>> is the only real HDLCD user), as the I2C bus often gets stuck if the 
>> System Control Processor is having a bad day. I also don't believe 
>> there's anything here that would affect efifb more than the fact that 
>> once the DRM CRTC is alive we simply stop scanning out from the region 
>> of memory that efifb is managing, but if it's considered good practice 
>> to do this early then I can certainly make that change too.
> We've been struggling with this a bit. If it works reliably, you're 
> welcome to leave it where it is.
> 
> Historically, most drivers call this function very early. But for error 
> recovery it would be better to do it as late as possible.  Ideally, 
> drivers would first initialize their DRM software state, then kickout 
> the generic driver, and finally take over hardware. But that would 
> require a careful review of each driver. :/
>

We got bug reports on Fedora about regressions caused by the fact that some
programs made the (wrong) assumption that /dev/dri/card0 would be the "main"
display and just hard-coded that path.

But removing the conflicting framebuffers after calling devm_drm_dev_alloc()
breaks this assumption, since the registered device will be /dev/dri/card1.

All this is to say that doing it too late, even if nothing is touching the HW
yet, could still have unexpected consequences across your graphics stack.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

