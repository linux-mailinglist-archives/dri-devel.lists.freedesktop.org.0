Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01558746B48
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 09:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BAC10E2AA;
	Tue,  4 Jul 2023 07:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C5010E2AC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688457413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yfSuLMbi885ncjU/SXY8s5ylufowrHraHlPM4HxykdE=;
 b=jIFJXYM6fW7El3De/2Yvvuq+hWe65ojtisOEtoODFHowpAZlFG6beIMUzcH8fz9fB8cldO
 TFf31PKAmYcG+ulTbjNxvk0y6hdf8bd0iI/qqWgksT5h0ufij1r6pGdXPUK9r9WmGhILBq
 AfYvMg52wldWjNjZ6yq0LGocjf83CNc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-PPESklFzNvyTcP9HToUZaQ-1; Tue, 04 Jul 2023 03:56:52 -0400
X-MC-Unique: PPESklFzNvyTcP9HToUZaQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3141a98a29aso2288647f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 00:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688457411; x=1691049411;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfSuLMbi885ncjU/SXY8s5ylufowrHraHlPM4HxykdE=;
 b=jj3GATJPi+1NdOrXJfUSpeQtA+vVlWaKjKpzNnBueDqtb8CUXvarsFTobm5WvmXYdy
 aT3XKfBzYBOl9C58cf4IitiwDGmQd/Rplde+JYbujw4FA3MtyBO9wMzM/1S5ULeJNvdk
 qycczjaH/9pNBO4LCqputh8gZR0YmYLCqy4rOHVqMJH4q3mPwt0yYLmMR6Yr6hRdMqwG
 509dy0h+yRcJShyzmCcUysrDwXoXJ5kZjdlsqyrAdgnFHeEyJfIJpeQAsOALrlBzmnKT
 qjokuNTrNrFLeDAAy+Sq8e1dvoC2k8MjKQ8KPwrwF0JYtSeHOFKXUYMGELPi1xGfnmdS
 IHlw==
X-Gm-Message-State: ABy/qLaFCwv8RRM+cEyztt7TGAAzLSIJKlix7F5lS19QAvG7Ftqp5JXx
 h9iJpF9ceFJCxtu34tGdFmcXxQUOhbeFKOT/7gs+6JHL2fU1vhZgeBJD1J0vuReVRf0d2aGDjfE
 WqDuSgE/RabtHKmAqjlL9BWqmv58s
X-Received: by 2002:a5d:464a:0:b0:314:17ac:5bac with SMTP id
 j10-20020a5d464a000000b0031417ac5bacmr11844920wrs.33.1688457411271; 
 Tue, 04 Jul 2023 00:56:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFU3Enu3ZhJIcLl8uDKqbLIoqK9rspavgFUf3CsZtMjrcO2FgaiIgTbGO0/u6yb7XYsnrsZMQ==
X-Received: by 2002:a5d:464a:0:b0:314:17ac:5bac with SMTP id
 j10-20020a5d464a000000b0031417ac5bacmr11844900wrs.33.1688457410930; 
 Tue, 04 Jul 2023 00:56:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d17-20020adffbd1000000b002fb60c7995esm27613884wrs.8.2023.07.04.00.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 00:56:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 4/5] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
In-Reply-To: <ZKPIQngz6WkzASqa@smile.fi.intel.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-5-javierm@redhat.com>
 <ZKPIQngz6WkzASqa@smile.fi.intel.com>
Date: Tue, 04 Jul 2023 09:56:49 +0200
Message-ID: <87edloyuri.fsf@minerva.mail-host-address-is-not-set>
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
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hello Andy,

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> On Tue, Jul 04, 2023 at 01:05:28AM +0200, Javier Martinez Canillas wrote:
>> Currently the CONFIG_FB option has to be enabled even if no legacy fbdev
>> drivers are needed (e.g: only to have support for framebuffer consoles).
>> 
>> The DRM subsystem has a fbdev emulation layer, but depends on CONFIG_FB
>> and so it can only be enabled if that dependency is enabled as well.
>> 
>> That means fbdev drivers have to be explicitly disabled if users want to
>> enable CONFIG_FB, only to use fbcon and/or the DRM fbdev emulation layer.
>> 
>> This patch introduces a non-visible CONFIG_FB_CORE symbol that could be
>> enabled just to have core support needed for CONFIG_DRM_FBDEV_EMULATION,
>> allowing CONFIG_FB to be disabled (and automatically disabling all the
>> fbdev drivers).
>> 
>> Nothing from fb_backlight.o and fbmon.o is used by the DRM fbdev emulation
>> layer so these two objects can be compiled out when CONFIG_FB is disabled.
>
> ...
>
> Wondering if
>
>   if FB_CORE
>   ...
>   endif
>
> makes Kconfig looking better instead of replacing all these "depends on" lines.
>

Yes, I discussed that with Arnd and he said that the if / endif is just
syntax sugar so I didn't do that change to keep the patches simpler. But
is something that you could change as a follow-up if you prefer that way.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

