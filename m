Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3D2517576
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A988B10EA81;
	Mon,  2 May 2022 17:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56B910EA81
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651511361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOc6bJLdhzaHvygq2HwvrbnheC0kFV7hKHsyBw5EeLA=;
 b=ZGn1dRozBNCxlTNUHfrJ+7j+4xLsQd068MsY3iR5h5Adkd5z6xNBQebGiGe+XNtZFJArmF
 hI19c6YFBKYDTOYGfu5YnOMtLYp9jQSeT/mZT3XbSPlKRH/rXqhB+3N+pEtNTkw2zloMgA
 1W3CAArGG5P84WjzZ6gULteg9Dvr1JU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-7hxmFztwPX6USLXN8Al0xA-1; Mon, 02 May 2022 13:09:20 -0400
X-MC-Unique: 7hxmFztwPX6USLXN8Al0xA-1
Received: by mail-wm1-f70.google.com with SMTP id
 u3-20020a05600c210300b0039430c7665eso1768971wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 10:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mOc6bJLdhzaHvygq2HwvrbnheC0kFV7hKHsyBw5EeLA=;
 b=45ti6edXsTJbBtT9eMOcX5zsCFLBW5v4n80UhLrrt5lIR3ldk26EX/TCZDHAizrZGI
 rdyXuVcppjPViz2JgJI54RKBR7keP1+giZ1AFRjo8vBl+Doz/JNn6InH9LTdewvAhIea
 lUON+Kz9GyiwoyQVQxABlt6gTiMGZEvdsuzKUTNw5PaW3LXL6H2nsoMVvefYYNJ+40o4
 r9EdchvhzDDAHjyfDQASbtx76pnuRQkiWM40iimlOY/XOBw5m8l9U5XAFcamohsgIM6j
 wVC5FESGEI2JkCfQspYdsTnZugEtmZpMChQIlbApqAHhKTWpnniSetRymV31iArxbCS0
 Y80A==
X-Gm-Message-State: AOAM5312ZH7c/E7VXFAKDwgy9GhktkQC6N/SKrv8lYwosW+IU1Gdyhnf
 haeLwbUbKxbLQ9JbaZK7Shk1K0T+3bPkmxciLaCiUXkrLcuclu4LbwP1lCDjP66CkIHa+JEjzdN
 rvvoY5eVo6rcWua0fuzmd339/ZX3E
X-Received: by 2002:a05:600c:3b1b:b0:394:33f2:62ef with SMTP id
 m27-20020a05600c3b1b00b0039433f262efmr81447wms.69.1651511359570; 
 Mon, 02 May 2022 10:09:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD8kvUwaOP/LYdIp3y9tWwzlSjcjMNajFy22460RiURhJLGu+0f+kRklg0gioUgoCGg53/sQ==
X-Received: by 2002:a05:600c:3b1b:b0:394:33f2:62ef with SMTP id
 m27-20020a05600c3b1b00b0039433f262efmr81438wms.69.1651511359318; 
 Mon, 02 May 2022 10:09:19 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 z24-20020a1cf418000000b003942a244edcsm6713522wma.33.2022.05.02.10.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 10:09:18 -0700 (PDT)
Message-ID: <9556f080-d309-f396-6d28-1190bc94cc38@redhat.com>
Date: Mon, 2 May 2022 19:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-4-javierm@redhat.com>
 <YnAEDlikr+d8cvy4@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnAEDlikr+d8cvy4@pendragon.ideasonboard.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Laurent,

On 5/2/22 18:17, Laurent Pinchart wrote:
> Hi Javier,
> 
> Thank you for the patch.
> 
> On Mon, May 02, 2022 at 05:39:00PM +0200, Javier Martinez Canillas wrote:
>> Indicate to fbdev subsystem that the registered framebuffer is provided by
>> the system firmware, so that it can handle accordingly. For example, would
>> unregister the FB devices if asked to remove the conflicting framebuffers.
>>
>> Add a new DRM_FB_FW field to drm_fbdev_generic_setup() options parameter.
>> Drivers can use this to indicate the FB helper initialization that the FB
>> registered is provided by the firmware, so it can be configured as such.
>>
>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>
>> (no changes since v1)
>>
>>  drivers/gpu/drm/drm_fb_helper.c  |  9 +++++++++
>>  drivers/gpu/drm/tiny/simpledrm.c |  2 +-
>>  include/drm/drm_fb_helper.h      | 10 ++++++++++
>>  3 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>> index fd0084ad77c3..775e47c5de1f 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -1891,6 +1891,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
>>  		/* don't leak any physical addresses to userspace */
>>  		info->flags |= FBINFO_HIDE_SMEM_START;
>>  
>> +	/* Indicate that the framebuffer is provided by the firmware */
>> +	if (fb_helper->firmware)
>> +		info->flags |= FBINFO_MISC_FIRMWARE;
>> +
>>  	/* Need to drop locks to avoid recursive deadlock in
>>  	 * register_framebuffer. This is ok because the only thing left to do is
>>  	 * register the fbdev emulation instance in kernel_fb_helper_list. */
>> @@ -2512,6 +2516,8 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>>   *
>>   * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
>>   *   @dev->mode_config.preferred_depth is used instead.
>> + * * DRM_FB_FW: if the framebuffer for the device is provided by the
>> + *   system firmware.
>>   *
>>   * This function sets up generic fbdev emulation for drivers that supports
>>   * dumb buffers with a virtual address and that can be mmap'ed.
>> @@ -2538,6 +2544,7 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
>>  {
>>  	struct drm_fb_helper *fb_helper;
>>  	unsigned int preferred_bpp = DRM_FB_GET_OPTION(DRM_FB_BPP, options);
>> +	bool firmware = DRM_FB_GET_OPTION(DRM_FB_FW, options);
>>  	int ret;
>>  
>>  	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
>> @@ -2570,6 +2577,8 @@ void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
>>  		preferred_bpp = 32;
>>  	fb_helper->preferred_bpp = preferred_bpp;
>>  
>> +	fb_helper->firmware = firmware;
> 
> I'd get rid of the local variable and write
>

I actually considered that but then decided to add a local variable to
have both options set in the same place, since I thought that would be
easier to read and also consistent with how preferred_bpp is handled.

Maybe I could go the other way around and rework patch 2/3 to also not
require a preferred_bpp local variable ? That patch won't be as small
as it's now though. -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

