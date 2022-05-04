Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 578E3519C93
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E0010E35D;
	Wed,  4 May 2022 10:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FA910E35D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651659000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h0lQ4WsgFPJsp1ulb+JMYEc+kaUBtSccCtW0azhOPgQ=;
 b=CXGTpYuJcRr6ZsWH0OjaCjzyKb6z/YM6WnoUYIw02eo5QRJ+d6zJf8N+/C0r52raDqQGYs
 XrcV3KNgEfI/e44tHPXznfFeVdhEQsiyr0IYI2y8L60BZzTysYj2qRgDLxutXosqE7n+tk
 OXpIbmPa4WOvL0Uq6vLBu7GZtCu6gTA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-jrUp8zUsMHKreSb8DsF4iw-1; Wed, 04 May 2022 06:09:59 -0400
X-MC-Unique: jrUp8zUsMHKreSb8DsF4iw-1
Received: by mail-wr1-f71.google.com with SMTP id
 k29-20020adfb35d000000b0020adc94662dso220643wrd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 03:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h0lQ4WsgFPJsp1ulb+JMYEc+kaUBtSccCtW0azhOPgQ=;
 b=3D7ns1Uk6f34CZQV7v/MXYH4YIi9tojZ6Si/9Egt2HsdjhDHNS63N9dwm5WwTiEAD0
 n1SuM1+AaFxFkN8te3dFK3W7SMU7LIS8R/+lfYa/xhWVaUz5Pu0Qm5vWdhqCPAYuhgzT
 ypQejGBACMIm4GCnXMrhT2ww+VgVHInCrfgkc0MpU2VdW0BLz97l7YIdFS2O1xH3vKU7
 kHhOA1FVhofDrmqcPKUAozLARqwDJlcCHYYzcatRb8sf2h7roSO2qI0oVZo3tlOMIZdq
 wAFPhwADsZ3LYTExkkFGHBi/JtDFWSxH3CquXb7ZI8vUpu7pJ+sS7eAtgeA3vaPoqSSN
 FM8A==
X-Gm-Message-State: AOAM533Q5Qt+ObEh7FJVk/GDNnytr3kLfsym0a6j1lcRQnIvjXH4cgRP
 H93QMcez4Jf/GiSylQr/ZV2ohTpIBOSsY9ELGkRVBSh8p3yLPw8N8OoXacjzJEpBYjmAzUvGhgW
 5tw3Xz/anNfoMw7BDfUiDfinPQpG5
X-Received: by 2002:a05:6000:223:b0:20a:db3a:e761 with SMTP id
 l3-20020a056000022300b0020adb3ae761mr15696822wrz.43.1651658998711; 
 Wed, 04 May 2022 03:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9+/TJm9nPuMdJXDM+zbHxG24AuYQigyhiwepT1ww6i3gxv0mmZGOpaYHxRVA7W1CP9TiF/g==
X-Received: by 2002:a05:6000:223:b0:20a:db3a:e761 with SMTP id
 l3-20020a056000022300b0020adb3ae761mr15696802wrz.43.1651658998486; 
 Wed, 04 May 2022 03:09:58 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm12191902wrg.43.2022.05.04.03.09.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 03:09:58 -0700 (PDT)
Message-ID: <8a4d6469-d3c0-833d-40c8-3a786d04eba4@redhat.com>
Date: Wed, 4 May 2022 12:09:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered
To: linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Guenter Roeck <linux@roeck-us.net>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>, Zhen Lei <thunder.leizhen@huawei.com>,
 Zheyu Ma <zheyuma97@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20220502130944.363776-1-javierm@redhat.com>
 <20220502130944.363776-3-javierm@redhat.com>
 <YnJLzY7Yiax/AwMx@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnJLzY7Yiax/AwMx@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 5/4/22 11:47, Daniel Vetter wrote:
> On Mon, May 02, 2022 at 03:09:44PM +0200, Javier Martinez Canillas wrote:
>> A reference to the framebuffer device struct fb_info is stored in the file
>> private data, but this reference could no longer be valid and must not be
>> accessed directly. Instead, the file_fb_info() accessor function must be
>> used since it does sanity checking to make sure that the fb_info is valid.
>>
>> This can happen for example if the fbdev driver was one that is using a
>> framebuffer provided by the system firmware. In that case, the fbdev core
>> could unregister the framebuffer device if a real video driver is probed.
>>
>> Reported-by: Maxime Ripard <maxime@cerno.tech>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Doesn't this mean we just leak the references? Also anything the driver
> might refcount in fb_open would be leaked too.
>

It maybe result in leaks, that's true. But I don't think we can do anything
at this point since the fb_info just went away and the file->private_data
reference is no longer valid...
 
> I'm not sure what exactly you're trying to fix here, but this looks a bit
> wrong.
>

This is fixing a NULL pointer deref that at least 3 people reported, i.e:

https://github.com/raspberrypi/linux/issues/5011

Because if a real DRM driver is probed, then the registered framebuffer
is unregistered and the fb_info just freed. But user-space has no way to
know and on close the kernel will try to dereference a NULL pointer.
 
> Maybe stepping back what fbdev would need, but doesn't have (see the
> commit reference I dropped on the previous version) is drm_dev_enter/exit
> around hw access. the file_fb_info check essentially provides that, but
> with races and everything.
>

Yes, but I don't know how that could work since user-space can just open
the fbdev, mmap it, write to the mmap'ed memory and then close it. The
only way that this could be done safely AFAICT is if we prevent the real
video drivers to be registered if the fbdev is currently mmap'ed.

Otherwise, the firmware initialized framebuffer will go away anyways and
things will break for the user-space process that's currently using it.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

