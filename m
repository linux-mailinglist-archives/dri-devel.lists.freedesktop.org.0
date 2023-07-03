Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 192CC745789
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 10:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7606810E02D;
	Mon,  3 Jul 2023 08:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C43410E02D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688373831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zp5g9NpYfxNAKr8x3hzhFJpQgOx/itKdI6XRa55tcZ4=;
 b=IsYFA+sGcEB9QREBthJrAxtlzMD7//07UB7xguL29B5Kl5yfkGk5b92ncOtg9K9rzAalHc
 BBJF0GURq10U2/tEFBGwGKBFb0ATiUE4pppz185l1Z0CnkglHQoHczdVF2g5FMWspc32gf
 Q9LBD8EKuXrHFyz1XDOAxCgS7B7XQas=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-BgWcceCPNKaozXh-4yczcQ-1; Mon, 03 Jul 2023 04:43:49 -0400
X-MC-Unique: BgWcceCPNKaozXh-4yczcQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3143a431a01so241714f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 01:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688373828; x=1690965828;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zp5g9NpYfxNAKr8x3hzhFJpQgOx/itKdI6XRa55tcZ4=;
 b=JBfaIceKgF1ohQe4NAYLbjS+Jv2IwgmAG201Px6uYmVh9YpiHhIBQsVQeLTuRWA545
 daYC64ZwxnmaCPu+ABsDReQIFYTredlVvofDAgSAr22cjCW++YHzeqjpH3dB8EaBy0wA
 nku3ZR+ihtFD1ITLc3MR8ZI8iDtw40Si8GV04q2OXympIPcsbIrp+W5xi9qaKeQMYSQs
 XRFjhqxO4vL+MRh6Ru4ZVJG/DI4HErb0gNSSomc2Iu3Im4ZOClsCDlY4G7Q5lXZHWzqd
 4kco16Ip2bl0mm5VCDVajaK3p7XTUAaOfhCbMSOF89It941BPHJ74ZkK2EKYMbNSvi45
 JUaQ==
X-Gm-Message-State: ABy/qLb4tIbGAJQqhu7DuYPizqc2zjNM+UuTpvr0QQKV0p3L03ABFvtf
 0bfEb0YlUToybc+hb+VOREjBVv7f4h0HiSDMWNH5O3pF8V9zMbIGVYis7g6sfYq/2L8tDofdeZc
 YIslyUGuofWFyyxMLw3sYGjNw+QmP
X-Received: by 2002:a5d:4143:0:b0:313:f94b:54e6 with SMTP id
 c3-20020a5d4143000000b00313f94b54e6mr7345894wrq.71.1688373827947; 
 Mon, 03 Jul 2023 01:43:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF8Sgct2ZKOCxkKDgyrN07WyPQuy43UZE9MgiqZYPp0ju4sHwD649De1/MCHiwbo3Wl8IAHIA==
X-Received: by 2002:a5d:4143:0:b0:313:f94b:54e6 with SMTP id
 c3-20020a5d4143000000b00313f94b54e6mr7345872wrq.71.1688373827611; 
 Mon, 03 Jul 2023 01:43:47 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d17-20020adffbd1000000b002fb60c7995esm24990543wrs.8.2023.07.03.01.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 01:43:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] Allow disabling all native fbdev drivers and only
 keeping DRM emulation
In-Reply-To: <ZKKFDECBXfQF+n8Z@smile.fi.intel.com>
References: <20230629225113.297512-1-javierm@redhat.com>
 <ZJ8RY7ZUlryrPB50@smile.fi.intel.com>
 <878rc0etqe.fsf@minerva.mail-host-address-is-not-set>
 <ZJ8T/Fexkr9wEZoP@smile.fi.intel.com>
 <875y74elsv.fsf@minerva.mail-host-address-is-not-set>
 <ZKKFDECBXfQF+n8Z@smile.fi.intel.com>
Date: Mon, 03 Jul 2023 10:43:46 +0200
Message-ID: <87zg4dcrlp.fsf@minerva.mail-host-address-is-not-set>
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

> On Fri, Jun 30, 2023 at 10:29:20PM +0200, Javier Martinez Canillas wrote:
>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>> > On Fri, Jun 30, 2023 at 07:38:01PM +0200, Javier Martinez Canillas wrote:
>> >> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>> >> > On Fri, Jun 30, 2023 at 12:51:02AM +0200, Javier Martinez Canillas wrote:
>> >> >> This patch series splits the fbdev core support in two different Kconfig
>> >> >> symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
>> >> >> be disabled, while still having the the core fbdev support needed for the
>> >> >> CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
>> >> >> disabling all fbdev drivers instead of having to be disabled individually.
>> >> >> 
>> >> >> The reason for doing this is that now with simpledrm, there's no need for
>> >> >> the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
>> >> >
>> >> > How does simpledrm works with earlycon=efi?
>> >> >
>> >> 
>> >> simpledrm isn't for earlycon. For that you use a different driver (i.e:
>> >> drivers/firmware/efi/earlycon.c). I'm just talking about fbdev drivers
>> >> here that could be replaced by simpledrm.
>> >
>> > So, efifb can't be replaced. Please, fix your cover letter to reduce false
>> > impression of the scope of usage of the simpledrm.
>> >
>> 
>> Nothing to fixup.
>> 
>> You are conflating the efifb fbdev driver (drivers/video/fbdev/efifb.c)
>> with the efifb earlycon driver (drivers/firmware/efi/earlycon.c). I'm
>> talking about the former (which can be replaced by simpledrm) while you
>> are talking about the latter.
>
> Ah, this makes sense!
>
> I remember now that it was (still is?) an attempt to move from efifb to
> simpledrm, but have no idea what the status of that series is.
>

Indeed. And there was were also some patches IIRC to attempt porting the
earlycon efifb to a fbdev or DRM driver, can't remember now.

> -- 
> With Best Regards,
> Andy Shevchenko
>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

