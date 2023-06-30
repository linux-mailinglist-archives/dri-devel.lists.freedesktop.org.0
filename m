Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D132074432C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BB810E0F7;
	Fri, 30 Jun 2023 20:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FD810E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 20:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688156967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7z4+FJGtx+jfLkCNL8iZp50XQ8kawtYgJi/zo0dFBDw=;
 b=edbG5yZxViun+mAqqdJIBzYBHaBH0956r/MLAx9WZO4kMMO7medgOCLvL1kgOnLBKPkQH/
 KmvsLps2jb5Zh6kb8PwVzQdgwc9ze0JNX0vnhwIpDQzaKgwCWPhaB4A54qfP1wJRnimm7e
 9v1qupMEcrzlrBAxdDRhrwxOg8lqvjs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-h4l1TkYQM-CkcuAUL-U0zQ-1; Fri, 30 Jun 2023 16:29:23 -0400
X-MC-Unique: h4l1TkYQM-CkcuAUL-U0zQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso13217835e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 13:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688156962; x=1690748962;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7z4+FJGtx+jfLkCNL8iZp50XQ8kawtYgJi/zo0dFBDw=;
 b=B8VOTCZ0LCO4z+hWY784c4VRA5gT8NabewQhip3JwYfVzk0D5epaGc+wEGCOzJkTba
 +eVRQ/PTLJaupoyqBllfPGlJACX0qnF18PJ5IlaEWuf1f/+J4m2C0KBvRH+6BC6tfYDW
 w6ndwAmyQfZ1nYwbl2fI2Ii4MJFx2lgk56HCtsOrSUg9KMtreAaTKarBc38zUii8r7qf
 /oybcS8aVDqi063rXYK7ag/UYr8WXqMymA/rr1vW4W/k9tYsSa6RA7EG3aS/GPTomvXM
 22roPVIzGHOL+dXKTWNi5bLk9kj3eqxP6m8LLTuoXsR0mgauTllaIuWf9wgmrdld+HwP
 CPPQ==
X-Gm-Message-State: AC+VfDxyr5c40h+MEaXIkrH3BsTZSbYp1nZzYJO3IpE1WDZ6onRpCPIA
 Ollcaebe8vTfN834lOrdlo071gEiTKbV3IqLBy4cJnAbs5IBgm6fGybjd/8glRj/bpshZdeVMXl
 l2LBOV76mJz/E0sbwiqlNy4t0oHrC
X-Received: by 2002:a7b:c8c9:0:b0:3f8:fe2a:25c2 with SMTP id
 f9-20020a7bc8c9000000b003f8fe2a25c2mr2902268wml.38.1688156962805; 
 Fri, 30 Jun 2023 13:29:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5t8O8YZhUAlsnULK6AfHeoTDYcnWUXH+rludG0BAB8MB7qDFkZFaO5oKC6zcLL0Qt4ESi3eA==
X-Received: by 2002:a7b:c8c9:0:b0:3f8:fe2a:25c2 with SMTP id
 f9-20020a7bc8c9000000b003f8fe2a25c2mr2902251wml.38.1688156962461; 
 Fri, 30 Jun 2023 13:29:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n10-20020a1c720a000000b003fa96620b23sm15085928wmc.12.2023.06.30.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:29:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
In-Reply-To: <ZJ8T/Fexkr9wEZoP@smile.fi.intel.com>
References: <20230629225113.297512-1-javierm@redhat.com>
 <ZJ8RY7ZUlryrPB50@smile.fi.intel.com>
 <878rc0etqe.fsf@minerva.mail-host-address-is-not-set>
 <ZJ8T/Fexkr9wEZoP@smile.fi.intel.com>
Date: Fri, 30 Jun 2023 22:29:20 +0200
Message-ID: <875y74elsv.fsf@minerva.mail-host-address-is-not-set>
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
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> On Fri, Jun 30, 2023 at 07:38:01PM +0200, Javier Martinez Canillas wrote:
>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>> > On Fri, Jun 30, 2023 at 12:51:02AM +0200, Javier Martinez Canillas wrote:
>> >> This patch series splits the fbdev core support in two different Kconfig
>> >> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
>> >> be disabled, while still having the the core fbdev support needed for the
>> >> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
>> >> disabling all fbdev drivers instead of having to be disabled individually.
>> >> 
>> >> The reason for doing this is that now with simpledrm, there's no need for
>> >> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
>> >
>> > How does simpledrm works with earlycon=efi?
>> >
>> 
>> simpledrm isn't for earlycon. For that you use a different driver (i.e:
>> drivers/firmware/efi/earlycon.c). I'm just talking about fbdev drivers
>> here that could be replaced by simpledrm.
>
> So, efifb can't be replaced. Please, fix your cover letter to reduce false
> impression of the scope of usage of the simpledrm.
>

Nothing to fixup.

You are conflating the efifb fbdev driver (drivers/video/fbdev/efifb.c)
with the efifb earlycon driver (drivers/firmware/efi/earlycon.c). I'm
talking about the former (which can be replaced by simpledrm) while you
are talking about the latter.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

