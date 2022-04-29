Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC5B514551
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6942610E181;
	Fri, 29 Apr 2022 09:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95FA10E737
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651224188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZBpHvY6ZYQxOxDMB34W2/6DBju5lgDw8kQdarO8pfI=;
 b=hhIBKOvUL3ESQDCdcG5I30NRkcvep1WrdCp4zlwbYLRgiwK+WMUiqBJu5d/k7ct1nrGJkc
 QAusvk94x3ItUz6eqc/7/OppxkLkMODNzi6lEMpiWMP2UG+hFhmsBP650PUjiQ9zFAdE8M
 5EBff5tAhihk9jY63tjyr4n+gGxBmE4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-JjjZk7AKMie7PpYMkB6aEQ-1; Fri, 29 Apr 2022 05:23:07 -0400
X-MC-Unique: JjjZk7AKMie7PpYMkB6aEQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 b10-20020adfc74a000000b0020ab029d5edso2826771wrh.18
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 02:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iZBpHvY6ZYQxOxDMB34W2/6DBju5lgDw8kQdarO8pfI=;
 b=OdU2BefILGDqiBHV1/Zb9u7h7KtrOmdNYNRyoake8ijjgbkW/+IodEuTBe3P15CYbe
 Ir73ggGgF+S3ozhRUUonrAQj/q/kssEvWgfamru6US/Z47iuojppStExgf24ySphQ2o2
 sV6RLvjwhxU5cErGQK7fik3iu5TwVt8gq8Ekom3m3O1E2OctRV5t7ck/ftN6E9yH0GeQ
 Bqy4C5Chw9OcE9kLcVwtxri/KMwIsbQjKSmO/yiVGOE/Bp8a/GnIdplHCHTkfJ1848PQ
 W4ufpRF2VUhLBa9EqvEgDrXfBL2sGDisEIw7H6KGnAt86eVefggg24LKeY8uwfCVfaI3
 DSTQ==
X-Gm-Message-State: AOAM531mtmrcn+zZKKgW/oUUZTvfE954MJy1y1PB66WC4rNwxod3yDNF
 PxzsuLMU2briFH+N1zU39RwHINjPLyEzcy3oNWHRbuHXkdIIrNm5HwqfTHVnYxBpR7VkUquqOdy
 pjVkRQM2U143yKia1XaQUnqfufj4o
X-Received: by 2002:a5d:5284:0:b0:20a:d859:3d6a with SMTP id
 c4-20020a5d5284000000b0020ad8593d6amr21037368wrv.403.1651224186195; 
 Fri, 29 Apr 2022 02:23:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzM9Kw7u0Y6NciFxMlSl1ar6JMt7qq9Xhix3AmpT6YAzzVEjfV07s1Es4bMZUziOtUFGATvQ==
X-Received: by 2002:a5d:5284:0:b0:20a:d859:3d6a with SMTP id
 c4-20020a5d5284000000b0020ad8593d6amr21037352wrv.403.1651224185968; 
 Fri, 29 Apr 2022 02:23:05 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 k23-20020adfb357000000b0020ad7c36332sm1918444wrd.110.2022.04.29.02.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 02:23:05 -0700 (PDT)
Message-ID: <476d57e5-69dd-94b5-779f-230e091ae62f@redhat.com>
Date: Fri, 29 Apr 2022 11:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v4 02/11] drm/fb-helper: Set FBINFO_MISC_FIRMWARE flag
 for DRIVER_FIRMWARE fb
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220429084253.1085911-1-javierm@redhat.com>
 <20220429084253.1085911-3-javierm@redhat.com>
 <7ce2f8e1-9cf2-4d89-99c2-b4280e4758ba@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <7ce2f8e1-9cf2-4d89-99c2-b4280e4758ba@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 4/29/22 11:14, Thomas Zimmermann wrote:
> Hi
> 
> Am 29.04.22 um 10:42 schrieb Javier Martinez Canillas:
>> The DRIVER_FIRMWARE flag denotes that a DRM driver uses a framebuffer
>> that was initialized and provided by the system firmware for scanout.
>>
>> Indicate to the fbdev subsystem that the registered framebuffer is a
>> FBINFO_MISC_FIRMWARE, so that it can handle accordingly. For example,
>> wold hot-unplug the associated device if asked to remove conflicting
>> framebuffers.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>> (no changes since v1)
>>
>>   drivers/gpu/drm/drm_fb_helper.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index d265a73313c9..76dd11888621 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -1891,6 +1891,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
>>   		/* don't leak any physical addresses to userspace */
>>   		info->flags |= FBINFO_HIDE_SMEM_START;
>>   
>> +	/* Indicate that the framebuffer is provided by the firmware */
>> +	if (drm_core_check_feature(dev, DRIVER_FIRMWARE))
>> +		info->flags |= FBINFO_MISC_FIRMWARE;
>> +
> 
> Patches 1 to 3 should be squashed into one before landing.
>

I actually considered this but then decided to go with the each change
goes into its own patch approach. But I'll squash it in next revisions.
 
> We can do this with DRIVER_FIRMWARE. Alternatively, I'd suggest to we 
> could also used the existing final parameter of 
> drm_fbdev_generic_setup() to pass a flag that designates a firmware device.
> 

By existing final parameter you mean @preferred_bpp ? That doesn't seem
correct. I also like that by using DRIVER_FIRMWARE it is completely data
driven and transparent to the DRM driver.

Or do you envision a case where a driver would be DRIVER_FIRMWARE but we
wouldn't want the emulated fbdev to also be FBINFO_MISC_FIRMWARE ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

