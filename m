Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EE3744D34
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 12:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E4610E143;
	Sun,  2 Jul 2023 10:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id 099B610E143
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688293181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CgQxeEa8jqCYUVhkKmhV5tOhyTakZG82kmCOFjxpLGQ=;
 b=SkWg1D5dfiGEhAnSVwSZu09k94bf9idMiK0beh+uQPdvM2L+utnPsybmkZASYFfWUfrd9V
 cfJ2rKZS7+LOQ+h05706cfS3PrCVHc1cDuGfZbgFDTNJ8u3qC0xFDmaFUaoU5IFMzGQhRK
 H1gG9jvAVm18rIHJPtLZ++/RQMcKRN8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-BJjwwTS-N2WCibiwqWB9rg-1; Sun, 02 Jul 2023 06:19:40 -0400
X-MC-Unique: BJjwwTS-N2WCibiwqWB9rg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3141a98a29aso1413182f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 03:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688293179; x=1690885179;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CgQxeEa8jqCYUVhkKmhV5tOhyTakZG82kmCOFjxpLGQ=;
 b=fONuP/dK6L9JEly8OTF8U4pvvZKNXcr2gUNu+BQEpB0FAWknbu0i6UBGOU6XWSvy9M
 2SmgcOccy3zLjTDNC+W6fTac0reMynUDAx7FA5n8HbkuKILat05jVro3kE12kUYoH8jL
 6dIs9UpUBzrsyS9nK3WOiNYuzPi0HGYuaspCA2aQwVcrnBljPctB+8tnYW5bzlLm/WD3
 UyNh4zO7qwXdjnsZu/MMdc/Xqhywi+Ricvr486yTo32MhKdtwPpAlk6iDg3b5ChrWKfX
 l4upaN3WmNkc6HUr8lA8K4mnafH+6SmOoBr7OGspHqYEUr7MHkjkvqp9sSZHRH4vyicC
 fSUw==
X-Gm-Message-State: ABy/qLYb+76txzPDuEwniuLBQd+HHvFs0RMhBtoTlukpnr/80IWL13J4
 S5ethinxiR7PiMeKDHKxczBKhtQ2vxIMqbZKBDDE3GSCqvMxptm2jKOTJs0lXkOSmCc7+zX2Xjj
 nu9BpKLxxDUmFfjQdgzHuXQsH7gWn
X-Received: by 2002:a5d:6305:0:b0:314:c16:56a2 with SMTP id
 i5-20020a5d6305000000b003140c1656a2mr6649484wru.14.1688293178962; 
 Sun, 02 Jul 2023 03:19:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlED9UAI+pN01OyAZSNkgl/k6bHCO5vXZ3hF4y0fd+CA4fhHoSTFMuvvTrZSJH9GgAxVfKoLzg==
X-Received: by 2002:a5d:6305:0:b0:314:c16:56a2 with SMTP id
 i5-20020a5d6305000000b003140c1656a2mr6649462wru.14.1688293178713; 
 Sun, 02 Jul 2023 03:19:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l17-20020a5d4111000000b003142eb75724sm2766867wrp.24.2023.07.02.03.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 03:19:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
In-Reply-To: <CAMuHMdWLRBePox24kBHBMhzKWZX2ncXCD_8JBZrWcbwo0eBZ1Q@mail.gmail.com>
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-2-javierm@redhat.com>
 <393ca142-5226-4779-a963-c34fb0464c59@app.fastmail.com>
 <CAMuHMdWLRBePox24kBHBMhzKWZX2ncXCD_8JBZrWcbwo0eBZ1Q@mail.gmail.com>
Date: Sun, 02 Jul 2023 12:19:37 +0200
Message-ID: <87pm5aaa4m.fsf@minerva.mail-host-address-is-not-set>
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Arnd,
>

[...]

>>
>> That would leave CONFIG_FB_DEVICE as the only user visible option
>> for DRM-only configs, which is slightly odd for the menuconfig,
>> so I still wonder if that could be done differently.
>>
>> Is there actually a point in configurations for kernels with FB=y,
>> DRM=n and FB_DEVICE=n? If we don't expect that to be a useful
>> configuration, an easier way would be to have CONFIG_FB turn it
>> on implicitly and instead have a user-visible Kconfig option
>> below CONFIG_DRM_FBDEV_EMULATION that allows controlling the
>> creation of /dev/fb*.
>
> Such a combination would allow the user to still have a text console
> on a legacy fbdev, while not having to worry about possible security
> ramifications of providing fbdev userspace access.
>

Exactly, it may be a possible combination. Not sure how useful what would
be in practice but we shouldn't restrict that IMO.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

