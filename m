Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6174564D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 09:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B361F10E0E1;
	Mon,  3 Jul 2023 07:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD8A10E0E1
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 07:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688370409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SNgNGFs6FpSFYvjUbX6e2xS8On7P23RQ79WPke3buhU=;
 b=ZXbOxYSoe0iNriVFuapktpHaSF9UEpQIyIPRdjgnsE2ZDfjUDb6+HMoqBvToit0FbaU6LU
 gGqCgG6TwiaZ0Ehm1smCmaZV0sOQVJlFyuQHxQtrc2JLFmCKJxDIxRwoTWFK9IdVfJvykc
 581Bv207wnUq6sVG6f0aXZlM+08D4FU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-EmEjEbZpMwao4dnLHZFp3A-1; Mon, 03 Jul 2023 03:46:48 -0400
X-MC-Unique: EmEjEbZpMwao4dnLHZFp3A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3143ac4a562so147615f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 00:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688370407; x=1690962407;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SNgNGFs6FpSFYvjUbX6e2xS8On7P23RQ79WPke3buhU=;
 b=cosrg+GxT9qTlTflBJeDhWuFHK+G9R+P4VL+6JJnUnNWHm80YNXQe11Twsy9qjNkvE
 wJQ7tD84a9auomXoZxICFaiv1uRtA0SDQSx//t+vjgk/Gkgau4vebu13D50VzbaHCMj5
 uGwy9qRSPM7JPfw0NZ04OezqTM90DgEG/bYb7uFAU+WdWa4J8BUZ40Ea/0Hpcn/7yqnp
 kw0GTwU1prm5ibUMT5ubCRAVWrpyIoPTJFOKKjF93uV4OdGJzbqy/bKLg6cLO6V5i4Kz
 bxoE1xFaf+i7PB1jmdJsViXzSyIHBvY7LmRPlRwSXMXvFO5WuPeye/8FNgAJJBC1XxFv
 jFsw==
X-Gm-Message-State: AC+VfDwqaz1GExQdt3eafApttjUpAFT6U1/z/FpmGyB+vo7XTMcz16Ub
 zolL0lOE545wi9wdqNxsVhBBLb/3mx4K+et1adr+n67RinQ6P1raDPULNQrSprdIJA3vdjFBXk0
 qEbFBaTHuG+8WsH7qcj356ybov8Kn
X-Received: by 2002:a1c:7918:0:b0:3fa:abd8:fcc4 with SMTP id
 l24-20020a1c7918000000b003faabd8fcc4mr8817033wme.35.1688370407014; 
 Mon, 03 Jul 2023 00:46:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ZHf5JE/CnYHILDYfyhHHHkhMi2GF7fF1uBCkCYh2SoENZccptRl4sK5yd0X6dACwuqT4ylQ==
X-Received: by 2002:a1c:7918:0:b0:3fa:abd8:fcc4 with SMTP id
 l24-20020a1c7918000000b003faabd8fcc4mr8817014wme.35.1688370406654; 
 Mon, 03 Jul 2023 00:46:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m23-20020a7bca57000000b003fbc30825fbsm9505588wml.39.2023.07.03.00.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 00:46:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
In-Reply-To: <e83eab26-a8fe-b151-6bd4-7a7db6ceee1f@suse.de>
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-2-javierm@redhat.com>
 <e83eab26-a8fe-b151-6bd4-7a7db6ceee1f@suse.de>
Date: Mon, 03 Jul 2023 09:46:40 +0200
Message-ID: <873525e8tb.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

Thanks for your review.

> Hi
>
> Am 01.07.23 um 23:44 schrieb Javier Martinez Canillas:

[...]

>>   
>> +menuconfig FB_CORE
>> +	tristate "Core support for frame buffer devices"
>
> With the text, this is visible; as others noted.
>

Yes, I misremembered what made a Kconfig symbol non-visible, and thought
that was just the lack of a help section but forgot to remove the prompt.

This is already fixed in v3.

>> +
>>   menuconfig FB
>> -	tristate "Support for frame buffer devices"
>> +	tristate "Support for frame buffer device drivers"
>
> Just keep the text as-is.
>

I disagree. Because we are slightly changing the Kconfig symbol semantics
here, for instance CONFIG_FB_CORE + CONFIG_DRM_FBDEV_EMULATION will also
provide a frame buffer device (and with CONFIG_FB_DEVICE, will be exposed
to user-space as a /dev/fb? device).

So now CONFIG_FB is really about allowing the native fbdev drivers to be
enabled. That's why I'm changing the prompt text to make that more clear.

[...]

>>   config FB_DEVICE
>>   	bool "Provide legacy /dev/fb* device"
>> -	depends on FB
>> +	select FB_CORE
>
> This should depend on FB_CORE.
>

Yes, already fixed in v3 too. I did a select to prevent symbol circular
dependencies but doing that lead to CONFIG_FB_CORE=y even if CONFIG_DRM
was set as a module.

But with the "select FB_CORE if DRM_FBDEV_EMULATION" in the DRM symbol as
Arnd suggested, I was able to have FB_DEVICE to depend on FB_CORE again.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

