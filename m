Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AEB58015A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE734BFD91;
	Mon, 25 Jul 2022 15:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF057BFD79
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658762026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qIjBp600Z2DVdMwt/gjvKJmffQT0bObTcC/1zEfoAm8=;
 b=bZaRs4B2ym+2QOPFQjOAbfg71goEbHjlcp08UHOqvYc5iy6dIrZJiAqlJi3wB6ZyViaI5S
 4i4qKNfiVSfYqopxk9bQri1zz3vMiXoYzr2pmweBZw8jCynY4qxw4J7fv9lEAneDk/xJxs
 TzL/sL8GNvxZZ+JQwLH4aACEDNB+u6k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-YRMx9951MzyefE1ug1AaOg-1; Mon, 25 Jul 2022 11:13:45 -0400
X-MC-Unique: YRMx9951MzyefE1ug1AaOg-1
Received: by mail-wr1-f72.google.com with SMTP id
 k26-20020adfb35a000000b0021d6c3b9363so1658800wrd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qIjBp600Z2DVdMwt/gjvKJmffQT0bObTcC/1zEfoAm8=;
 b=fXKQXMybnhxIsb+M7JNXguQhn9gLO4kWf7QXllcj6HG7Tdj5pnP46hnRtOHbJYaxOn
 dCznZLPEgHifFGkMJ0tL0S6o04t/YDEbXNO4YQOlrvAap6nGv9xXlLiVu5DoQP0HFd5C
 b8JNWHESUHFOvY8BFdCwsxMXa5J5I2spyYL9PKrtguztbF+qmEMjEh3H1turkJfhraeC
 crowyz194nQoFTO8AggD31w8Ihhac240niUFOIEh0GAAwn7sLbfdDW2vtmlVEEVsOIqH
 9tqm+m4YLNN4yjj0TgJVGkmOFFfK7mk3u60V2jWGxuO7OGlXVIWGUO7MnDdWEeKPx5vp
 ltKg==
X-Gm-Message-State: AJIora++0Shj+8/iPPZDM5oHh/LCrVkj0w8JdEQmkl3I+C8yeb7YedNT
 uZawxKThrlwhDBYTjZtncjbiRNNdp1WsMElFyY25IshRCfQwcCW9C82zQD7Q8a4nu4dAFnRGEWU
 psyufmq7iKDom6X5NBoKlB7R3Ij4b
X-Received: by 2002:a05:6000:1e04:b0:21d:7ec3:fe5a with SMTP id
 bj4-20020a0560001e0400b0021d7ec3fe5amr8403044wrb.116.1658762023281; 
 Mon, 25 Jul 2022 08:13:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sg48NwSZslMMuiqCHHVdPEPWZQ5xtRMvOi0g+wQFzFzNZnoLqP7GO9eKmHlB+7GyvtZqAIGQ==
X-Received: by 2002:a05:6000:1e04:b0:21d:7ec3:fe5a with SMTP id
 bj4-20020a0560001e0400b0021d7ec3fe5amr8403017wrb.116.1658762022953; 
 Mon, 25 Jul 2022 08:13:42 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a2d6f26babsm15568434wms.3.2022.07.25.08.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 08:13:42 -0700 (PDT)
Message-ID: <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
Date: Mon, 25 Jul 2022 17:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 Michal Suchanek <msuchanek@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 7/21/22 16:46, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Wed, Jul 20, 2022 at 4:27 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Compute the framebuffer's scanline stride length if not given by
>> the simplefb data.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thanks for your patch!
> 
>> --- a/drivers/gpu/drm/tiny/simpledrm.c
>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
>> @@ -743,6 +743,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>>                 drm_err(dev, "no simplefb configuration found\n");
>>                 return ERR_PTR(-ENODEV);
>>         }
>> +       if (!stride)
>> +               stride = format->cpp[0] * width;
> 
> DIV_ROUND_UP(drm_format_info_bpp(format) * width, 8)
>

I think you meant here:

DIV_ROUND_UP(drm_format_info_bpp(format, 0) * width, 8) ?
 
With that change,

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

