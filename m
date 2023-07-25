Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EF77622B4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 21:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D5F10E177;
	Tue, 25 Jul 2023 19:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9D410E177
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 19:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690314802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/ehsQdgWSIS7eeNPhg1juxuHJiisqBuDA4AQKiM8tp4=;
 b=Jxa3qH7Nzq23o2uU3ENbAED9glFtlDS/5HKEy5qqLH4bFGvihclp3gY/hdzT1SrsuO+nmw
 etfncHYX7ctAf0AOJzhasJoLGWQ00NIVAvfS7OatYJTLjxN2a+eOwX//7G+Ks/BtI1TcKq
 uwHi79vhuVUIigvlYBIqRJPGAxuT9qw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-cscjKj2ONTK0xmqvYMG3mg-1; Tue, 25 Jul 2023 15:53:18 -0400
X-MC-Unique: cscjKj2ONTK0xmqvYMG3mg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3158f4d72e9so2840007f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 12:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690314797; x=1690919597;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ehsQdgWSIS7eeNPhg1juxuHJiisqBuDA4AQKiM8tp4=;
 b=aIGg/MGZjGEVhokGCoaVhAmZYkvmWFZUgi4DkHSIWuLLkczORKIkuo9Vmfa/qbxIZI
 pRIs8Zr4C80kh3hyYGvWngQtRAn0Z0nAh9RCx5jROY0w0DtZTEA00nNJRY7ehGopacxn
 5jGfuBI9jBwx0WNb17aXv1irHdMrI0o6nKDzwuaBEqU6523z3fY+yz1sa7osL5+OBwQl
 jrQs0HoCwtUPwjR3YrQCucaJv8SMIKNyuGeyg+3+OIBmppUC6zIiyUlKZ57bs5ElUEXA
 4QMLeOYpkPsOHixz4nYQLAD+iYe/st7mcgyZwHePDJfILzMusdWS+ZJH8lCVkybT2gZt
 sGxg==
X-Gm-Message-State: ABy/qLYmpI4mZ1vhTF80PsfD2FNgvdXlT5p0rTXa5IdHB92OyQalPIOI
 gi3xgbe1yVNm0sNLzs7H7l5Ge4Lvsxo7oskRXH6iBZgVSuyRvl1K6ZNgcarmv5jGelxDegYVdCQ
 15PUscR6l/r//NrUafXc9wgK2LedK
X-Received: by 2002:a5d:4ccd:0:b0:313:e9dc:44d5 with SMTP id
 c13-20020a5d4ccd000000b00313e9dc44d5mr8756120wrt.61.1690314797299; 
 Tue, 25 Jul 2023 12:53:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEfpWWBSGVv7qsi/9x0G1/ru7iK4Zf2hflHhR0TYMahLeFmVnfj9mjTHzpX0KH0ux4gaM1qHQ==
X-Received: by 2002:a5d:4ccd:0:b0:313:e9dc:44d5 with SMTP id
 c13-20020a5d4ccd000000b00313e9dc44d5mr8756108wrt.61.1690314796971; 
 Tue, 25 Jul 2023 12:53:16 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n15-20020a1c720f000000b003fc0505be19sm13825286wmc.37.2023.07.25.12.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 12:53:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
In-Reply-To: <c10d925b-8d37-caa0-8f66-a0206f948c69@suse.de>
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
 <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
 <c10d925b-8d37-caa0-8f66-a0206f948c69@suse.de>
Date: Tue, 25 Jul 2023 21:53:16 +0200
Message-ID: <874jlrkbtf.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>

[...]

>> 
>> Yes. I meant to move drivers/video/logo/ to drivers/fbdev/core/logo and to
>> source its Kconfig from drivers/fbdev/core/Kconfig, since it now depends
>> on FB_CORE.
>
> No, please rather leave it where it is. There's no code dependencies to 
> the fbdev core; it merely depends on the Kconfig token.
>

Sure, fine by me. But I disagree that there's merely a Kconfig dependency.
The include/linux/linux_logo.h header declares both fb_find_logo() and
fb_append_extra_logo().

The fb_find_logo() function is defined in drivers/video/logo.c while the
fb_append_extra_logo() is in drivers/video/fbdev/core/fbmem.c, even though
only arch/powerpc/platforms/cell/spu_base.c uses fb_append_extra_logo().

So there's a relationship already between logo and fbdev/core, that's why
I wondered if would make sense to also move drivers/video/logo.c to have
both functions in there.

Yes, as noted drivers/video/console/newport_con.c also uses fb_find_logo()
but the only other user of that in drivers/video/fbdev/core/fbmem.c.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

