Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2972763009
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8D110E16D;
	Wed, 26 Jul 2023 08:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093F410E16D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690360749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fAaxUKQ38GDgR2OmXqLR47mRWIe2n/NF7SoPW0emVCM=;
 b=YTpkfUSNMwNue0LhzuiKyz6E8ij2Jdz9nQJxx4ClDB65qsqt+3sKLNCC0onSt25o0podOM
 rRf9o0QaiHKT8LD9x0TZz5PWI+52P+NgX+k760XpSp8amjDyzc9Us6fYC9WFkT74kndv3a
 oCrvi44sdKYvfGePbwBuBEB5PlbtOks=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-PEv3pl0mMZaCQnv-BXAxBg-1; Wed, 26 Jul 2023 04:39:08 -0400
X-MC-Unique: PEv3pl0mMZaCQnv-BXAxBg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fd0fa4d08cso34268815e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 01:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690360747; x=1690965547;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fAaxUKQ38GDgR2OmXqLR47mRWIe2n/NF7SoPW0emVCM=;
 b=ll/4nzfkCMr10+YiniR82V2TP90oRJXhsoP47/4284TcBVJ53KiQJFNitl0SplVOZR
 DP4W7pmprJkhGIAUzR6IL2qBSQFymsO4a9Gvke/M7ZYuZfUlddvITTTu0J9vZHK5p6OC
 RPYWtdcWMHFKsKfHdY8+y9I1Con2ukI8rilEo2Ni/rCWCHQaFAKgSNdPTthvKtDaNMK4
 Uw2AJDR2hEwNViQUMpwa9Whtnnr1lRczQOA/btTOGI1TUA1fFgTxnLOOBbhjnZQMrHMD
 1S/Ys2oy0JI57lb77IAX60A5J9G56q8pvohvV82T6g8s3VVcLZRF2oex08YRabGQ6/wD
 A1Hg==
X-Gm-Message-State: ABy/qLbAFLFhkC4ZJmTJ67YVJrJYosc5cyxaFTr/wdgBfZDHINMYkael
 /PgWCmWvLHyo7byvdXS6jLhhzuCSOr33V+gpLRKjZnJHqljqrItB3WklrUlVAzEBGhcERp9MVMS
 4yfVXZtOmGCkbjEyuGHZpcHbS8HWQ
X-Received: by 2002:a7b:c4d9:0:b0:3fd:ee50:d6a4 with SMTP id
 g25-20020a7bc4d9000000b003fdee50d6a4mr760518wmk.17.1690360747439; 
 Wed, 26 Jul 2023 01:39:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEr6DyQHuloA2nD4iog3/3e8RP4qSZv58+bnBAhRP20NVfUdCPAbe6s+RxrRyARWcpPBM/KHg==
X-Received: by 2002:a7b:c4d9:0:b0:3fd:ee50:d6a4 with SMTP id
 g25-20020a7bc4d9000000b003fdee50d6a4mr760504wmk.17.1690360747093; 
 Wed, 26 Jul 2023 01:39:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l25-20020a7bc459000000b003fbaade072dsm1343652wmi.23.2023.07.26.01.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 01:39:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
In-Reply-To: <20230726083557.GA921641@ravnborg.org>
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
 <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
 <c10d925b-8d37-caa0-8f66-a0206f948c69@suse.de>
 <874jlrkbtf.fsf@minerva.mail-host-address-is-not-set>
 <20230726083557.GA921641@ravnborg.org>
Date: Wed, 26 Jul 2023 10:39:06 +0200
Message-ID: <87y1j3hxsl.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sam Ravnborg <sam@ravnborg.org> writes:

> On Tue, Jul 25, 2023 at 09:53:16PM +0200, Javier Martinez Canillas wrote:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>> > Hi
>> >
>> 
>> [...]
>> 
>> >> 
>> >> Yes. I meant to move drivers/video/logo/ to drivers/fbdev/core/logo and to
>> >> source its Kconfig from drivers/fbdev/core/Kconfig, since it now depends
>> >> on FB_CORE.
>> >
>> > No, please rather leave it where it is. There's no code dependencies to 
>> > the fbdev core; it merely depends on the Kconfig token.
>> >
>> 
>> Sure, fine by me. But I disagree that there's merely a Kconfig dependency.
>> The include/linux/linux_logo.h header declares both fb_find_logo() and
>> fb_append_extra_logo().
>> 
>> The fb_find_logo() function is defined in drivers/video/logo.c while the
>> fb_append_extra_logo() is in drivers/video/fbdev/core/fbmem.c, even though
>> only arch/powerpc/platforms/cell/spu_base.c uses fb_append_extra_logo().
>> 
>> So there's a relationship already between logo and fbdev/core, that's why
>> I wondered if would make sense to also move drivers/video/logo.c to have
>> both functions in there.
> Or as I also suggested on irc - to pull out all the logo stuff from
> fbmem and put it in video/logo/
> With a bit of refactoring to make it obvious this is logo stuff and
> maybe avoid some of the ifdeffery in the code of the users.
>

Agreed. That option may be better.

> 	Sam
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

