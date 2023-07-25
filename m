Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13120761F7B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 18:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2F910E3E2;
	Tue, 25 Jul 2023 16:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA1410E16B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690303815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oAGhinzTt2vQmlw7Pe/EEg7jmawFpueHGoP5Q7U/hys=;
 b=a3ufwBYBI9uS4a5lZhxBbyun3aK2NI2T6CJ9+l0kjBExOA49mFbtM/b6UugyOnhg73dPw+
 UfJTswAcZ4FAzYsFu6l8YvQmAg+ZC9UBtYChtAQm5Q0l5J6oyeuX2OQ38ONziGzAec72Tn
 5MtL5rt6Okc48dwS5FSHQMZ+KyMMyCo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-1_D5ljFKO7i-Ew7EoLJtkQ-1; Tue, 25 Jul 2023 12:50:13 -0400
X-MC-Unique: 1_D5ljFKO7i-Ew7EoLJtkQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fd2e59bc53so15804775e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 09:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690303812; x=1690908612;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ReBcQaJh4ciBZ53LwBH/iMnMAzVIg5ii3SO9ToZLyw4=;
 b=LUYsAIXEOpkJ69QG8dRrTsOmK5tRXVeI3cX4jQ83msetqKreG+bcy7yjkN0iRxcKSG
 3UhE++RIeH+u35dZ4ncfQY8yY97wMpzDi9PBdFyGmNlOxEnTFYyH6ZKvn4a/Jep3SyQY
 QluXSrQ0qHYG0W/3g/j1+v7R3zX1uocz08VL2EqvmhH9d0wiPVSkJcqMxxnt+dRS/DS8
 tRFBpMmrUrj4IsVEXQjX1CFRZpCzIyo9rxmCN3kcApyXasipY7BHnKxqQ++IHhWroe0Y
 W3YV9epEOHTQGB6BXHx3rOE55XbTqmEjp8xHfTQZS7rUOtbjLxALgDmsj2+/sJDpVKVH
 9bBQ==
X-Gm-Message-State: ABy/qLZ7H0NWQk024ZN3UVJN+PyYJoP0s/WsRPV0oiGRZTqYs6hCFKqj
 WjFtn4AWEVcnvgWtqlR3lmohLslGWsfANf309xGl255VUosSCw3cPMOc838PEDGPZzP7CMw/oj6
 3taJy+rFLNV4RwXcjcGOF5HG3eNmF8K/Vmba0
X-Received: by 2002:a1c:750f:0:b0:3fb:e4ce:cc65 with SMTP id
 o15-20020a1c750f000000b003fbe4cecc65mr8474614wmc.25.1690303812289; 
 Tue, 25 Jul 2023 09:50:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHN82DdekK0zitC8eYAyRNRTQ+aka1Hte/M4lbyqh0MgYS8XBWVNfmNZPV6nkNQ6F6sXzyn3A==
X-Received: by 2002:a1c:750f:0:b0:3fb:e4ce:cc65 with SMTP id
 o15-20020a1c750f000000b003fbe4cecc65mr8474601wmc.25.1690303811924; 
 Tue, 25 Jul 2023 09:50:11 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c17-20020a7bc851000000b003fc00212c1esm13464147wml.28.2023.07.25.09.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 09:50:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
In-Reply-To: <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
Date: Tue, 25 Jul 2023 18:50:10 +0200
Message-ID: <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Tue, Jul 25, 2023 at 6:07=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert Uytterhoeven <geert+renesas@glider.be> writes:
>> > If CONFIG_FB_CORE=3Dy but CONFIG_FB=3Dn, the frame buffer bootup logos=
 can
>> > no longer be enabled.  Fix this by making CONFIG_LOGO depend on
>> > CONFIG_FB_CORE instead of CONFIG_FB, as there is no good reason for th=
e
>> > logo code to depend on the presence of real frame buffer device driver=
s.
>>
>> Indeed.
>>
>> > Fixes: 55bffc8170bb5813 ("fbdev: Split frame buffer support in FB and =
FB_CORE symbols")
>> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > ---
>> >  drivers/video/Kconfig      | 2 +-
>> >  drivers/video/logo/Kconfig | 2 +-
>> >  2 files changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
>> > index e5b1cc54cafa10d5..b694d7669d3200b1 100644
>> > --- a/drivers/video/Kconfig
>> > +++ b/drivers/video/Kconfig
>> > @@ -63,7 +63,7 @@ if VT
>> >       source "drivers/video/console/Kconfig"
>> >  endif
>> >
>> > -if FB || SGI_NEWPORT_CONSOLE
>> > +if FB_CORE || SGI_NEWPORT_CONSOLE
>> >       source "drivers/video/logo/Kconfig"
>> >
>> >  endif
>> > diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
>> > index 6d6f8c08792dc897..b7d94d1dd1585a84 100644
>> > --- a/drivers/video/logo/Kconfig
>> > +++ b/drivers/video/logo/Kconfig
>> > @@ -5,7 +5,7 @@
>> >
>> >  menuconfig LOGO
>> >       bool "Bootup logo"
>> > -     depends on FB || SGI_NEWPORT_CONSOLE
>> > +     depends on FB_CORE || SGI_NEWPORT_CONSOLE
>> >       help
>> >         Enable and select frame buffer bootup logos.
>>
>> Should then move this option to drivers/video/fbdev/core/Kconfig ?
>
> No, all logo options are in their own file.
>

Yes. I meant to move drivers/video/logo/ to drivers/fbdev/core/logo and to
source its Kconfig from drivers/fbdev/core/Kconfig, since it now depends
on FB_CORE.

But I see now that it also depends on SGI_NEWPORT_CONSOLE, so having those
in drivers/video/logo makes sense indeed.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

