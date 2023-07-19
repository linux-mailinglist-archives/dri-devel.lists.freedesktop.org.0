Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD01758FCD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819EF10E417;
	Wed, 19 Jul 2023 08:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A885F10E416
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689753644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eIfBH5EFlV65x3IEf/u6Gtm7XoEhIOJBMMqfp8v5VTQ=;
 b=a3GC+vfKo9lLWKn8eDcH2pdJLfE43qEp06ml4rDcSBw0zWQSLi4fXIeDA2W/wjGFyd8+QB
 3Y9e0SQBeXio5uKr/n9VIF8AmEuE8XCxC1T0a+tJnoY5xW7XFA8sWBURhpfQUZvkqfXX9w
 GQHPaUJaZJyIeyPz0uoP1V6IHRlkz4g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-9DhgZqhRPKKdS82-Mq13Zw-1; Wed, 19 Jul 2023 04:00:43 -0400
X-MC-Unique: 9DhgZqhRPKKdS82-Mq13Zw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fc0094c1bdso41281835e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689753642; x=1690358442;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eIfBH5EFlV65x3IEf/u6Gtm7XoEhIOJBMMqfp8v5VTQ=;
 b=krwwyR9OMZypxGmZX04iQSNvbCsAmhtvyPKbPUH/IHG+Ct9A3rdFbCtYWDTNpqMGkj
 P4XB55rOhc3bJ2tVf21fWreUzPvpiwVxZ1KC4vdAuisTVWfd9mPVN4lr5WjYwlhlKn1I
 cxVAhDU9nUvdcf2YsKAftcoGYvsw219pOmbN5afSaYjK0CndvOFGxE1BIGlqxT8IW1zf
 +1ITTMJjdCZDV4yu0CH9hpeHmQUONUXCsEg991I3v/S0MewCqLXwVYBKBI747VqMChF7
 HYxjQ0ilEgjvQ3fZzf0dVDnF+q44/SK4X2YWS/edaMu++XJRrr+VbDYKRgEaRJt2svdu
 2MAw==
X-Gm-Message-State: ABy/qLYxRWAl/psJskvW31a0dCcylwCY6qiSwSGMaAtQm1ruoKNjZfMV
 tOJgHO/6gBaQLBVSKxjeVTlGPgqxmtA/zsJacxydseX4VN4QxpdBNwLuXnUe5ydxL6Mf+5IiT/k
 xv2HEjwJE2txWyPLuTufDGohPv77a
X-Received: by 2002:a05:600c:3658:b0:3fb:b008:2003 with SMTP id
 y24-20020a05600c365800b003fbb0082003mr3825150wmq.38.1689753642474; 
 Wed, 19 Jul 2023 01:00:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGntWPiUul+16y14wCIszAKkF4hXHNsg4spAPjjzeZmXkHbvOBJ578nYz2u9Y1aY8JZQP2r2g==
X-Received: by 2002:a05:600c:3658:b0:3fb:b008:2003 with SMTP id
 y24-20020a05600c365800b003fbb0082003mr3825125wmq.38.1689753642287; 
 Wed, 19 Jul 2023 01:00:42 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t24-20020a1c7718000000b003fba137857esm1042775wmi.14.2023.07.19.01.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:00:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Allow disabling all native fbdev drivers and
 only keeping DRM emulation
In-Reply-To: <24a36694-6813-47fd-ab30-b939a81935e7@app.fastmail.com>
References: <20230714171642.91185-1-javierm@redhat.com>
 <24a36694-6813-47fd-ab30-b939a81935e7@app.fastmail.com>
Date: Wed, 19 Jul 2023 10:00:41 +0200
Message-ID: <87ilagib4m.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, Borislav Petkov <bp@alien8.de>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Fri, Jul 14, 2023, at 19:16, Javier Martinez Canillas wrote:
>> This patch series splits the fbdev core support in two different Kconfig
>> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
>> be disabled, while still having the the core fbdev support needed for the
>> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
>> disabling all fbdev drivers instead of having to be disabled individually.
>>
>> The reason for doing this is that now with simpledrm, there's no need for
>> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
>> now disable them. But it would simplify the config a lot fo have a single
>> Kconfig symbol to disable all fbdev drivers.
>>
>> I've built tested with possible combinations of CONFIG_FB, CONFIG_FB_CORE,
>> CONFIG_DRM_FBDEV_EMULATION and CONFIG_FB_DEVICE symbols set to 'y' or 'n'.
>>
>> Patch #1 moves the auxdisplay drivers to "Graphics support" Kconfig menu,
>> patch #2 moves the core fbdev Kconfig symbols to a separate Kconfig file,
>> patch #3 does the FB symbol split and introduces the FB_CORE symbol and
>> finally patch #4 makes the DRM symbol to select FB_CORE if the DRM fbdev
>> emualtion support was enabled.
>>
>> Since this series touches three subsystems (auxdisplay, fbdev and DRM),
>> I would like to merge it through DRM with the acks of these maintainers.
>>
>> This is a v5 of the patch-set that addresses issues pointed out by Arnd
>> Bergmann, Thomas Zimmermann and Geert Uytterhoeven in the previous v4:
>>
>> https://lists.freedesktop.org/archives/dri-devel/2023-July/411842.html
>
> Looks all good to me, except for two minor things I found in build testing
> and replied to separately. With those fixed:
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Tested-by: Arnd Bergmann <arnd@arndb.de>
>

Awesome, thanks a lot for your help!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

