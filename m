Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9739985B7FA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F06410E32E;
	Tue, 20 Feb 2024 09:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XAoiSUl4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D54610E2DA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708422385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ua+iueUGl77okzhaoQdUc6zme30b1qrWNRG/YazNKLc=;
 b=XAoiSUl4oKHEb7D4pHg0QD0Kt4zr6jg/Xh9hfXHwCEOwspNwP/G2ZEW2RAE77MOTC1BNnr
 cZLH4tQYdTpvFVIuoBIfbGI66FfrMkLzGpOqHOMzuYZIZGTljaKBgrJlsyoUKF7cbNXnR9
 Wa3DKC326VPmpE7yty1H4zOl8saCtfg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-7iAZKOWINlmvN_Y5GOKYIQ-1; Tue, 20 Feb 2024 04:46:23 -0500
X-MC-Unique: 7iAZKOWINlmvN_Y5GOKYIQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-412565214c3so20340975e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708422382; x=1709027182;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ua+iueUGl77okzhaoQdUc6zme30b1qrWNRG/YazNKLc=;
 b=LRTzaZnEkmRmrfVtK+XQcr2q2qQTNjazHHOn7NVvG4LKaRCG+S5Dck/wyVoX+iXVZM
 TYKlMvi5tSR/i3qSBoOLqp054qG/qAl5y+DhGq1N+f3pxWjkLeF3F5hFxPzgCSb2EQPZ
 5Js2Q3QNZ4+S5CW0YvADyBCkCEToggMkp3PBN2QXR//17JdEaFeEv2Sjv/MghOGi1yfK
 qprtcsCT2ErnMAZOKdhY7CLp6aUi/wjvSHYHB1OSOJ0yRCcZxTBcucc/2K6LzwecgPRG
 N25CXnx1Nfiv0gUjIfUpA2ZaLMCczW8fFS+hccDMNfTc2q8dyUWX6QIg8le2OHAR2VSS
 1aSg==
X-Gm-Message-State: AOJu0Yy2JJOC0CPsbhmpQkMjSrJL/4DIay3gv4aPtjZBj4fZuSFPu+FN
 nn6OG0Vffgos0cEccI/x02D+/LnVYDHMdROlSrtslEeFUKlmGG+01uAWeLEXFxAdrjmlzAU36Vd
 n8aOo8j9SmKl6QE63bDDqaPVUFc59i5oOES8UqYU2TeWpWGNe8e1ca6FH7bWVXaB16Q==
X-Received: by 2002:a05:600c:4813:b0:411:fae0:b158 with SMTP id
 i19-20020a05600c481300b00411fae0b158mr10243409wmo.35.1708422382794; 
 Tue, 20 Feb 2024 01:46:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVewDRy1qipC9k0gZj2P7ww2xioxl7Ke3sBkdfIzbrcFreEU44DweZYKlUDvIymqIYAVgmSA==
X-Received: by 2002:a05:600c:4813:b0:411:fae0:b158 with SMTP id
 i19-20020a05600c481300b00411fae0b158mr10243398wmo.35.1708422382457; 
 Tue, 20 Feb 2024 01:46:22 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k10-20020a7bc40a000000b004101f27737asm13892556wmi.29.2024.02.20.01.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:46:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 01/10] backlight: Match backlight device against struct
 fb_info.bl_dev
In-Reply-To: <a5b9a2d8-f305-4b68-9086-76d5f1b985c7@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-2-tzimmermann@suse.de>
 <87bk8bjxzo.fsf@minerva.mail-host-address-is-not-set>
 <a5b9a2d8-f305-4b68-9086-76d5f1b985c7@suse.de>
Date: Tue, 20 Feb 2024 10:46:21 +0100
Message-ID: <87edd7ii36.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 20.02.24 um 10:17 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas,
>>
>>> Framebuffer drivers for devices with dedicated backlight are supposed
>>> to set struct fb_info.bl_dev to the backlight's respective device. Use
>>> the value to match backlight and framebuffer in the backlight core code.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/video/backlight/backlight.c | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
>>> index 86e1cdc8e3697..48844a4f28ad3 100644
>>> --- a/drivers/video/backlight/backlight.c
>>> +++ b/drivers/video/backlight/backlight.c
>>> @@ -98,7 +98,8 @@ static int fb_notifier_callback(struct notifier_block *self,
>>>   {
>>>   	struct backlight_device *bd;
>>>   	struct fb_event *evdata = data;
>>> -	int node = evdata->info->node;
>>> +	struct fb_info *info = evdata->info;
>>> +	int node = info->node;
>>>   	int fb_blank = 0;
>>>   
>>>   	/* If we aren't interested in this event, skip it immediately ... */
>>> @@ -110,8 +111,12 @@ static int fb_notifier_callback(struct notifier_block *self,
>>>   
>>>   	if (!bd->ops)
>>>   		goto out;
>>> -	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
>>> +	else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))
>>>   		goto out;
>>> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
>>> +	else if (info->bl_dev && info->bl_dev != bd)
>> If the driver doesn't provide a struct backlight_ops .check_fb callback, I
>> think that having an info->bl_dev should be mandatory ? Or at least maybe
>> there should be a warning if info->bl_dev isn't set ?
>
> bl_dev can only be used for display drivers that set an explicit 
> backlight device; otherwise it's NULL. There seem to be systems where 
> backlight and display are distinct. And the docs for check_fb say that 
> by default the backlight matches against any display. I tried to keep 
> this semantics by silently succeeding if neither check_fb nor bl_dev 
> have bene set.
>
>>
>> The would be a driver bug, right ?
>
> I assume that some systems create the backlight instance from platform 
> data or DT and the display driver has no means of knowing about it.
>

Ok. I thought that in that case a (platform specific) .check_fb callback
would have to be provided then. But if the semantic is that none could be
missing, then I guess is OK to silently succeeding.

I wonder if at least a debug printout is worth it. But maybe a follow-up.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

